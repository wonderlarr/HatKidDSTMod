local assets=
{ 
    Asset("ATLAS", "images/inventoryimages/badge_football.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_football.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/badge_football.xml","badge_football.tex")

STRINGS.NAMES.BADGE_FOOTBALL = "Wood Armor Badge"

local function OnEmpty(inst)
    if inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() ~= nil then
        inst.components.inventoryitem:GetGrandOwner():PushEvent("toolbroke", { tool = inst })
    end

    -- inst:Remove()
end

local function OnEquip(inst, owner)
	local hatpack = inst.components.badge.hatpack
	hatpack:AddComponent("armor")
	hatpack.components.armor:InitIndestructible(TUNING.ARMORWOOD_ABSORPTION)
	-- hatpack.components.armor:SetCondition(inst.components.armor.condition)
	hatpack.components.armor.ontakedamage = function(pack, damage)
		inst.components.armor:TakeDamage(damage)
	end
end

local function OnUnequip(inst, owner)
	local hatpack = inst.components.badge.hatpack
	hatpack:RemoveComponent("armor") -- this will break if we have multiple armor badges
end

local function fn() 
    local inst = CreateEntity()

	-- Client and Server

	-- Add internal components
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	-- Setup AnimState
	inst.AnimState:SetBank("kidhat")
    inst.AnimState:SetBuild("kidhat")
    inst.AnimState:PlayAnimation("idle")

	-- standardcomponents.lua functions
    MakeInventoryPhysics(inst) -- Sets physics properties of an item when it's outside the inventory.
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.

	-- Custom Tags
    inst:AddTag("badge")
	inst:AddTag("badge_football")

	-- Component Tags
	inst:AddTag("inspectable")

	-- Set pristine
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	-- Hauntable mode
	MakeHauntableLaunch(inst)
 
	-- Server components
	inst:AddComponent("inventoryitem")

	inst:AddComponent("inspectable")

	inst:AddComponent("badge")
	inst.components.badge:SetOnEquip(OnEquip)
	inst.components.badge:SetOnUnequip(OnUnequip)

	inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMORWOOD, TUNING.ARMORWOOD_ABSORPTION)
	inst.components.armor:SetOnFinished(OnEmpty)
    -- inst.components.armor:AddWeakness("beaver", TUNING.BEAVER_WOOD_DAMAGE)

	-- inst:AddComponent("fueled")
	-- inst.components.fueled.fueltype = FUELTYPE.MAGIC
	-- inst.components.fueled:InitializeFuelLevel(50)
	-- inst.components.fueled:SetDepletedFn(OnEmpty)

    return inst
end

return  Prefab("badge_football", fn, assets)