local assets =
{
    Asset("ANIM", "anim/hatbrella2.zip"),
    Asset("ANIM", "anim/swap_hatbrella2.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella2.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella2.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/hatbrella2.xml","hatbrella2.tex")

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
    local brella = SpawnPrefab("hatbrella2open")
    
    if brella.components.fueled and inst.components.finiteuses then
        brella.components.fueled:SetPercent(inst.components.finiteuses:GetPercent())
    end

	owner.components.inventory:Equip(brella)

	inst:DoTaskInTime(0, inst.Remove)
end

local function OnEquip(inst, owner)	
	owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella2", "swap_hatbrella2")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("hatbrella2")
    inst.AnimState:SetBuild("hatbrella2")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")

    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA2_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "hatbrella2"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella2.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable.restrictedtag = "hatkid"
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(200)
    inst.components.finiteuses:SetUses(200)
	
	MakeHauntableLaunch(inst)
	
    return inst
end
return  Prefab("hatbrella2", fn, assets) 