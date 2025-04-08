local assets =
{
    Asset("ANIM", "anim/hatbrellaopen.zip"),
    Asset("ANIM", "anim/hatbrellaopen_ground.zip"),
    
    Asset("ATLAS", "images/inventoryimages/hatbrellaopen.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrellaopen.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/hatbrellaopen.xml","hatbrellaopen.tex")

-- This item exists and I'm not sure why, as it seems unused in the original mod, I'm gonna make it used. 
-- I'll make it so you don't get the rain protection unless you open the umbrella, or probably you'll only get SMALL or TINY protection

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
    local brella = SpawnPrefab("hatbrella")
    
    if brella.components.finiteuses and inst.components.fueled then
        brella.components.finiteuses:SetPercent(inst.components.fueled:GetPercent())
    end

	owner.components.inventory:Equip(brella)

    inst.components.inventoryitem:RemoveFromOwner()
	
	inst:DoTaskInTime(0, inst.Remove)
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "hatbrellaopen", "swap_object")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    if inst.components.fueled then
        inst.components.fueled:StartConsuming()
    end
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

    if inst.components.fueled then
        inst.components.fueled:StopConsuming()
    end
end

local function OnEmpty(inst)
    local equippable = inst.components.equippable
    if equippable ~= nil and equippable:IsEquipped() then
        local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem.owner or nil
        if owner ~= nil then
            inst:Remove()
            owner:PushEvent("umbrellaranout", { prefab = inst.prefab, equipslot = equippable.equipslot })
            return
        end
    end

    inst:Remove()
end
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("hatbrellaopen_ground")
    inst.AnimState:SetBuild("hatbrellaopen_ground")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetScale(0.6, 0.6)
    inst.AnimState:SetFinalOffset(2)
	
    inst:AddTag("nopunch")
    inst:AddTag("umbrella")

	inst:AddTag("waterproofer")
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	
    if TUNING.HATBRELLA_OPENDURABILITY then
        inst:AddComponent("fueled")
        inst.components.fueled.fueltype = FUELTYPE.USAGE
        inst.components.fueled:InitializeFuelLevel(TUNING.HATBRELLA_OPENDURABILITY)
        inst.components.fueled:SetDepletedFn(OnEmpty)
    end

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.HATBRELLA_WATERPROOFNESS)

    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
    inst.components.insulator:SetSummer()

	MakeHauntableLaunch(inst)
	
    return inst
end
return  Prefab("hatbrellaopen", fn, assets) 