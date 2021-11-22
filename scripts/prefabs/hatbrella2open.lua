local assets =
{
    Asset("ANIM", "anim/hatbrella2open.zip"),
    Asset("ANIM", "anim/swap_hatbrella2open.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella2open.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella2open.tex"),

    Asset("ANIM", "anim/hatbrellaopen.zip"),
    Asset("ANIM", "anim/swap_hatbrellaopen.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrellaopen.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrellaopen.tex"),
}

-- This item exists and I'm not sure why, as it seems unused in the original mod, I'm gonna make it used. 
-- I'll make it so you don't get the rain protection unless you open the umbrella, or probably you'll only get SMALL or TINY protection

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	owner.components.inventory:Equip(SpawnPrefab("hatbrella2"))
	
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

	owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella2open", "hatbrella2open")
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
      
    inst.AnimState:SetBank("hatbrella2open")
    inst.AnimState:SetBuild("hatbrella2open")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("nopunch")
    inst:AddTag("umbrella")

	inst:AddTag("waterproofer")
    -- inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    -- inst:AddComponent("weapon")
    -- inst.components.weapon:SetDamage(TUNING.HATBRELLA2OPEN_DAMAGE) 
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hatbrella2open"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella2open.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)

    inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_HUGE)
	
    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
	
	MakeHauntableLaunch(inst)
	
    return inst
end
return  Prefab("hatbrella2open", fn, assets) 