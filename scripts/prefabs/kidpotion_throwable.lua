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

    "reticule",
    "reticuleaoe",
    "reticuleaoeping",
} 

local function DoExplode(self)
    local explosiverange = TUNING.BREWINGHAT_RADIUS
    local totaldamage = self.explosivedamage

    local holder = self.inst.brewer
 
    local x, y, z = self.inst.Transform:GetWorldPosition()
    -- Players are off limits now
    local ents = TheSim:FindEntities(x, y, z, explosiverange, nil, { "INLIMBO", "player" })

    for i, v in ipairs(ents) do
        if v ~= self.inst and v:IsValid() and not v:IsInLimbo() then

            if v.components.workable ~= nil and v.components.workable:CanBeWorked() then
                if v:HasTag("structure") then -- If we're a structure
                    v.components.workable:WorkedBy(holder, 2)
                    v:PushEvent("attacked", { attacker = holder, damage = 0})
                else -- Otherwise
                    v.components.workable:WorkedBy(holder, self.buildingdamage)
                    v:PushEvent("attacked", { attacker = holder, damage = 0})
                end
            end

           if v:IsValid() and not v:IsInLimbo() then
 
                if v.components.combat ~= nil then
                    holder:PushEvent("onattackother", {target = v})
                    v.components.combat:GetAttacked(holder, totaldamage, nil)
                end
 
                v:PushEvent("explosion", { explosive = self.inst })
				v:PushEvent("attacked", { attacker = holder, damage = 0})
            end
        end
	end
end
 
local function OnExplodeFn(inst)
	SpawnPrefab("brewinghat_explode").Transform:SetPosition(inst.Transform:GetWorldPosition())

    local mark = SpawnPrefab("burntground")
        mark.Transform:SetPosition(inst.Transform:GetWorldPosition())
        mark.Transform:SetScale(1.4, 1.4, 1.4)
    
    local b = SpawnPrefab("fx_boat_pop")
        b.Transform:SetPosition(inst.Transform:GetWorldPosition())
        
    local c = SpawnPrefab("superjump_fx")
        c.Transform:SetPosition(inst.Transform:GetWorldPosition())

    local d = SpawnPrefab("hatshatter2")
        d.Transform:SetPosition(inst.Transform:GetWorldPosition())

    DoExplode(inst.components.explosive)


    inst.brewer:PushEvent("PotionThrown")
end
 
local function OnHitSomething(inst, attacker, target)
    inst.components.explosive:OnBurnt()
end

-- local function RefreshReticule(inst)
--     local owner = ThePlayer
--     if owner ~= nil then
--         local inventoryitem = inst.replica.inventoryitem
--         if inventoryitem ~= nil and inventoryitem:IsHeldBy(owner) and owner.components.playercontroller ~= nil then
--             owner.components.playercontroller:RefreshReticule()
--         end
--     end
-- end

 
local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_kidpotion", "swap_kidpotion")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
 
local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function onthrown(inst)
	if inst.brewer ~= nil then
        inst:AddTag("NOCLICK")
        inst.persists = false
        
        inst.AnimState:PlayAnimation("spin_loop", true)

        inst.entity:AddDynamicShadow()
        inst.DynamicShadow:SetSize(1, 1)
        
        inst.Physics:SetMass(1)
        inst.Physics:SetCapsule(0.2, 0.2)
        inst.Physics:SetFriction(0)
        inst.Physics:SetDamping(0)
        inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
        inst.Physics:ClearCollisionMask()
        inst.Physics:CollidesWith(COLLISION.WORLD)
        inst.Physics:CollidesWith(COLLISION.OBSTACLES)
        inst.Physics:CollidesWith(COLLISION.ITEMS)
        
        if inst.brewer.SoundEmitter ~= nil then
            inst.brewer.SoundEmitter:PlaySound("brewinghat/sound/throw")
        end
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

local function onDrop(inst)
    if inst.sourceprefab then
        inst.sourceprefab:PushEvent("prevequip")
    end

    -- If we get dropped but aren't thrown, refund the potion costs
    inst:DoTaskInTime(0, function(inst)
        if not inst:HasTag("NOCLICK") then
            if inst.brewer and inst.brewer.components.sanity then
                inst.brewer.components.sanity:DoDelta(TUNING.BREWINGHAT_THRESHHOLD)
            end

            if inst.sourceprefab and inst.sourceprefab.components.fueled then
                inst.sourceprefab.components.fueled:DoDelta(1 * 45)
            end

            inst:Remove()
        end
    end)
end

local function common_fn(bank, build, anim, tag, isinventoryitem)
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
 
    if isinventoryitem then
        MakeInventoryPhysics(inst)
    else
        inst.entity:AddPhysics()
        inst.Physics:SetMass(1)
        inst.Physics:SetCapsule(0.2, 0.2)
        inst.Physics:SetFriction(0)
        inst.Physics:SetDamping(0)
        inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
        inst.Physics:ClearCollisionMask()
        inst.Physics:CollidesWith(COLLISION.WORLD)
    end
 
    if tag ~= nil then
        inst:AddTag(tag)
    end
 
    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation(anim, true)

    inst:AddComponent("reticule")
    inst.components.reticule.targetfn = ReticuleTargetFn
    inst.components.reticule.ease = true
 
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("locomotor")
 
	inst:AddComponent("complexprojectile")
 
    return inst
end

local function kidpotion_fn()
    local inst = common_fn("kidpotion", "kidpotion", "idle", "projectile", true)

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("explosive")
    inst.components.explosive:SetOnExplodeFn(OnExplodeFn)
    inst.components.explosive.explosivedamage = TUNING.BREWINGHAT_DAMAGE
    -- This ensures the actual explosion doesn't hurt anything, as we want to customize what the explosion does.
    inst.components.explosive.explosiverange = 0


    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8, 10)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"
	inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	
	inst.components.complexprojectile:SetHorizontalSpeed(18)
	inst.components.complexprojectile:SetGravity(-65)
	inst.components.complexprojectile:SetLaunchOffset(Vector3(.25, 1, 0))
	inst.components.complexprojectile:SetOnLaunch(onthrown)
	inst.components.complexprojectile:SetOnHit(OnHitSomething)
	
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.BREWINGHAT_SLOWDOWN
	
    return inst
end
 
return Prefab("kidpotion_throwable", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)