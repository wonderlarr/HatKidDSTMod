local assets =
{
    Asset("ANIM", "anim/hatbrella.zip"),
    Asset("ANIM", "anim/hatbrella_ground.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella.tex"),
	
    Asset("ATLAS", "images/inventoryimages/hatbrellaopen.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrellaopen.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/hatbrella.xml","hatbrella.tex")


local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "hatbrella", "swap_object")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
    local brella = SpawnPrefab("hatbrellaopen")
    
    if brella.components.fueled and inst.components.finiteuses then
        brella.components.fueled:SetPercent(inst.components.finiteuses:GetPercent())
    end

	owner.components.inventory:Equip(brella)

	inst:DoTaskInTime(0, inst.Remove)
end


local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("hatbrella_ground")
    inst.AnimState:SetBuild("hatbrella_ground")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetScale(0.6, 0.6)
	
    inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "hatbrella"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable.restrictedtag = "hatkid"
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(300)
    inst.components.finiteuses:SetUses(300)

	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	
	MakeHauntableLaunch(inst)
	
    return inst
end


return  Prefab("hatbrella", fn, assets) 