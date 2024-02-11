local assets=
{ 
    Asset("ATLAS", "images/inventoryimages/badge_fasthatter.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_fasthatter.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/badge_fasthatter.xml","badge_fasthatter.tex")

STRINGS.NAMES.BADGE_FASTHATTER = "Fast Hatter Badge"

local function OnUse(inst, data)
	inst.components.fueled:DoDelta(-1)
end

local function OnEquip(inst, owner)
	if owner.components.madhatter then
		owner.components.madhatter.cd_mods:SetModifier(inst, 0.6, "cdbadge")
	end

	inst:ListenForEvent("magicdeactivated", OnUse)
end

local function OnUnequip(inst, owner)
	if owner.components.madhatter then
		owner.components.madhatter.cd_mods:RemoveModifier(inst, "cdbadge")
	end

	inst:RemoveEventCallback("magicdeactivated", OnUse)
end

local function OnEmpty(inst)
    if inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() ~= nil then
        inst.components.inventoryitem:GetGrandOwner():PushEvent("toolbroke", { tool = inst })
    end

    inst:Remove()
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
	inst:AddTag("badge_fasthatter")

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

	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "badgerestricted"
	inst.components.equippable.equipslot = EQUIPSLOTS.BADGE1
    -- inst.components.equippable:SetOnEquip( OnEquip )
    -- inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("badge")
	-- inst.components.badge:SetOnEquip(OnEquip)
	-- inst.components.badge:SetOnUnequip(OnUnequip)

	inst:AddComponent("fueled")
	inst.components.fueled.fueltype = FUELTYPE.MAGIC
	inst.components.fueled:InitializeFuelLevel(50)
	inst.components.fueled:SetDepletedFn(OnEmpty)

    return inst
end

return  Prefab("badge_fasthatter", fn, assets)