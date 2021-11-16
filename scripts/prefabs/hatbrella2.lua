local assets =
{
    Asset("ANIM", "anim/hatbrella2.zip"),
    Asset("ANIM", "anim/swap_hatbrella2.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella2.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella2.tex"),
}

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	owner.components.inventory:Equip(SpawnPrefab("hatbrella2open"))

	inst:DoTaskInTime(0, inst.Remove)
end

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
    --owner.AnimState:OverrideSymbol("swap_object", "swap_wands", "purplestaff")
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
	-- inst:AddTag("waterproofer")
	
    -- inst:AddComponent("waterproofer")	
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL * 3)

    -- inst:AddComponent("insulator")
    -- inst.components.insulator:SetSummer()
    -- inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA2_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hatbrella2"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella2.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	
	MakeHauntableLaunch(inst)
	
    return inst
end
return  Prefab("hatbrella2", fn, assets) 