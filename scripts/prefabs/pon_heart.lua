local kidpotion_assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),

    -- Asset("SOUNDPACKAGE", "sound/brewinghat.fev"),
    -- Asset("SOUND", "sound/brewinghat.fsb"),

    -- Asset("SOUNDPACKAGE", "sound/kidpotion.fev"),
    -- Asset("SOUND", "sound/kidpotion.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/kidpotion.xml","kidpotion.tex")

local holder = {
    nil,
}

local kidpotion_prefabs = {

} 

--I heavily dislike how I wrote this code, but it works so I'm gonna leave it for now.

local function DoExplode(self)
    local explosiverange = TUNING.BREWINGHAT_RADIUS
 
    local x, y, z = self.inst.Transform:GetWorldPosition()
    -- Players are off limits now
    local ents = TheSim:FindEntities(x, y, z, explosiverange, { "player", "character"}, { "INLIMBO", "playerghost" })

    for i, v in ipairs(ents) do
        if v ~= self.inst and v:IsValid() and not v:IsInLimbo() then
 
            if v.components.health ~= nil then
                v.components.health:DoDelta(20)
            end
        end
	end
end
 
local function OnExplodeFn(inst)
    SpawnPrefab("brewinghat_explode").Transform:SetPosition(inst.Transform:GetWorldPosition())

    DoExplode(inst.components.explosive)
end
 
local function OnHitSomething(inst, attacker, target)
    inst.components.explosive:OnBurnt()
end

 
local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_kidpotion", "swap_kidpotion")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	holder = inst.components.inventoryitem:GetGrandOwner()
end
 
local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function onthrown(inst)
	if holder ~= nil then

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
	end
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
    inst.components.explosive.explosiverange = 0

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8, 10)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"
	
	inst.components.complexprojectile:SetHorizontalSpeed(18)
	inst.components.complexprojectile:SetGravity(-65)
	inst.components.complexprojectile:SetLaunchOffset(Vector3(.25, 1, 0))
	inst.components.complexprojectile:SetOnLaunch(onthrown)
	inst.components.complexprojectile:SetOnHit(OnHitSomething)
	
    inst:AddComponent("equippable")
    inst.components.equippable.restrictedtag = "hatkid"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
    return inst
end

return Prefab("pon_heart", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)