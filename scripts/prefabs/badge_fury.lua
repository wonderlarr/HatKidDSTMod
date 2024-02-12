local assets=
{ 
--     Asset("ATLAS", "images/inventoryimages/badge_football.xml"),
--     Asset("IMAGE", "images/inventoryimages/badge_football.tex"),
}

-- RegisterInventoryItemAtlas("images/inventoryimages/badge_football.xml","badge_football.tex")

STRINGS.NAMES.BADGE_FURY = "Fury Badge"

local function OnHealthDelta(owner, data)
	if data.newpercent <= 0.25 then
		owner.components.combat.externaldamagemultipliers:SetModifier(owner, 1.5, "badge_fury")
	else
		owner.components.combat.externaldamagemultipliers:RemoveModifier(owner, "badge_fury")
	end
end

local function OnEquip(inst, owner)
	inst:ListenForEvent("healthdelta", OnHealthDelta, owner)
	owner.components.health:DoDelta(0)
end

local function OnUnequip(inst, owner)
	inst:RemoveEventCallback("healthdelta", OnHealthDelta, owner)
	owner.components.combat.externaldamagemultipliers:RemoveModifier(owner, "badge_fury")
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
	inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"

	inst:AddComponent("inspectable")

	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "badgerestricted"
	inst.components.equippable.equipslot = EQUIPSLOTS.BADGE1
	inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("badge")
    return inst
end

return Prefab("badge_fury", fn, assets)