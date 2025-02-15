local assets =
{
    Asset("ANIM", "anim/badgesellercane.zip"),

    Asset("ATLAS", "images/inventoryimages/badgesellercane.xml"),
    Asset("IMAGE", "images/inventoryimages/badgesellercane.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/badgesellercane.xml", "badgesellercane.tex")

local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "badgesellercane", "swap_object")
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
    inst.entity:AddSoundEmitter()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("badgesellercane")
    inst.AnimState:SetBuild("badgesellercane")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(17)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
    inst.components.equippable.walkspeedmult = 1.25
	
	MakeHauntableLaunch(inst)
	
    return inst
end

return  Prefab("badgesellercane", fn, assets)