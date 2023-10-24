local kidpotion_assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),

    Asset("SOUNDPACKAGE", "sound/brewinghat.fev"),
    Asset("SOUND", "sound/brewinghat.fsb"),

    Asset("SOUNDPACKAGE", "sound/kidpotion.fev"),
    Asset("SOUND", "sound/kidpotion.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/kidpotion.xml","kidpotion.tex")

local kidpotion_prefabs = {
    "brewinghat_explode",
    "burntground",
    "fx_boat_pop",
    "superjump_fx",
    "hatshatter2",
} 

local function DoExplode(inst, attacker, target)
    local x, y, z = inst.Transform:GetWorldPosition()

    -- Do FX
    inst.components.explosive:OnBurnt()

	SpawnPrefab("brewinghat_explode").Transform:SetPosition(x, y, z)
    SpawnPrefab("fx_boat_pop").Transform:SetPosition(x, y, z)
    SpawnPrefab("superjump_fx").Transform:SetPosition(x, y, z)
    SpawnPrefab("hatshatter2").Transform:SetPosition(x, y, z)
    local mark = SpawnPrefab("burntground")
        mark.Transform:SetPosition(x, y, z)
        mark.Transform:SetScale(1.4, 1.4, 1.4)

    -- Do damage
    local ents = TheSim:FindEntities(x, y, z, TUNING.BREWINGHAT_RADIUS, nil, { "INLIMBO", "player" })

    for k, v in ipairs(ents) do
        if v ~= inst and v:IsValid() and not v:IsInLimbo() then

            -- Any workable thing
            if v.components.workable ~= nil and v.components.workable:CanBeWorked() then
                v.components.workable:WorkedBy(attacker, 10)
            end

            -- Any combatant
            if v.components.combat ~= nil then
                attacker:PushEvent("onattackother", { target = v })
                v.components.combat:GetAttacked(attacker, TUNING.BREWINGHAT_DAMAGE) -- TODO find a way to reference brewing hat here
            end

            v:PushEvent("explosion", { explosive = inst })
            v:PushEvent("attacked", { attacker = attacker, damage = 0 })
        end
	end

    attacker:PushEvent("PotionThrown")
end
 
local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_kidpotion", "swap_kidpotion")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    inst.components.rechargeable:Discharge(TUNING.BREWINGHAT_CHARGETIME)

    inst.SoundEmitter:PlaySound("kidpotion/sound/shake", "flask_shake")
end
 
local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
-- Set up the physics to act like a projectile instead of a dropped item
local function OnThrown(inst, attacker)
    inst:AddTag("NOCLICK")
    inst.persists = false
    
    inst.AnimState:PlayAnimation("spin_loop", true)
    
    inst.Physics:SetMass(1)
    inst.Physics:SetFriction(0)
    inst.Physics:SetDamping(0)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.ITEMS)
    inst.Physics:SetCapsule(.2, .2)
 
    attacker.SoundEmitter:PlaySound("brewinghat/sound/throw")

    if inst.sourceprefab then
        inst.sourceprefab:PushEvent("startcooling")
    end
end

local function ReticuleTargetFn()
    local player = ThePlayer
    local ground = TheWorld.Map
    local pos = Vector3()
    --Cast range is 8, leave room for error
    --4 is the aoe range
    for r = 7, 0, -.25 do
        pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
        if ground:IsPassableAtPoint(pos:Get()) and not ground:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
end

-- I'd like to rewrite how this works but I can't think of a better way to do it right now
local function onDrop(inst)
    if inst.sourceprefab then
        inst.sourceprefab:PushEvent("prevequip")
    end

    -- If we get dropped but aren't thrown, refund the potion costs
    inst:DoTaskInTime(0, function(inst)
        if not inst:HasTag("NOCLICK") then
            -- Refund sanity
            if inst.brewer and inst.brewer.components.sanity then
                inst.brewer.components.sanity:DoDelta(TUNING.BREWINGHAT_THRESHHOLD)
            end
            
            -- Refund ammo
            if inst.sourceprefab and inst.sourceprefab.components.container then
                inst.sourceprefab.components.container:GiveItem(SpawnPrefab("kidpotion_ammo"))
            end
            
            -- Start cooldown
            if inst.sourceprefab then
                inst.sourceprefab:PushEvent("startcooling")
            end

            inst:Remove()
        end
    end)
end

local function OnCharged(inst)
    inst.SoundEmitter:KillSound("flask_shake")

    -- Enable toss action
    inst:RemoveTag("special_action_toss")
end

local function kidpotion_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("kidpotion")
    inst.AnimState:SetBuild("kidpotion")
    inst.AnimState:PlayAnimation("idle", true)

    MakeInventoryPhysics(inst)

    inst:AddTag("projectile")
    inst:AddTag("weapon")

    -- Prevents the TOSS action from working
    inst:AddTag("special_action_toss")

    inst:AddComponent("reticule")
    inst.components.reticule.targetfn = ReticuleTargetFn
    inst.components.reticule.ease = true

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- We are only using explosive for the ambient effects, like screenshake and stuff.
    inst:AddComponent("explosive")
    inst.components.explosive.explosivedamage = TUNING.BREWINGHAT_DAMAGE
    inst.components.explosive.explosiverange = 0

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"
	inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem:SetOnDroppedFn(onDrop)

    inst:AddComponent("locomotor")
	
	inst:AddComponent("complexprojectile")
	inst.components.complexprojectile:SetHorizontalSpeed(20)
	inst.components.complexprojectile:SetGravity(-65)
	inst.components.complexprojectile:SetLaunchOffset(Vector3(.25, 1, 0))
	inst.components.complexprojectile:SetOnLaunch(OnThrown)
	inst.components.complexprojectile:SetOnHit(DoExplode)
    inst.components.complexprojectile.usehigharc = false
	
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.BREWINGHAT_SLOWDOWN
    -- inst.components.equippable:SetPreventUnequipping(true)

    inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetOnChargedFn(OnCharged)
	
    return inst
end
 
return Prefab("kidpotion", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)