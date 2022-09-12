local kidpotion_assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/kidpotion.xml","kidpotion.tex")


local kidpotion_prefabs = 
{
    "kidpotion_throwable",
}
 
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

local function onDrop(inst)
    -- If we get dropped but aren't brewed, refund the potion costs
    if not inst.components.rechargeable:IsCharged() then
        if inst.brewer and inst.brewer.components.sanity then
            inst.brewer.components.sanity:DoDelta(5)
        end
        
        if inst.sourceprefab and inst.sourceprefab.components.fueled then
            inst.sourceprefab.components.fueled:DoDelta(1)
        end
    end
    
	inst:Remove()
end
 

local function OnCharged(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
    local throwable = SpawnPrefab("kidpotion_throwable")
    
    throwable.sourceprefab = inst.sourceprefab
    throwable.brewer = inst.brewer
	owner.components.inventory:Equip(throwable)
end

local function kidpotion_fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("kidpotion")
    inst.AnimState:SetBuild("kidpotion")
    inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8, 10)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	inst.components.inventoryitem.cangoincontainer = false
	
    inst:AddComponent("equippable")
    inst.components.equippable.restrictedtag = "hatkid"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.BREWINGHAT_SLOWDOWN
	
	inst:AddComponent("rechargeable")
	-- inst.components.rechargeable:SetOnDischargedFn(OnDischarged)
	inst.components.rechargeable:SetOnChargedFn(OnCharged)
	
	
    return inst
end
 
return Prefab("kidpotion", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)