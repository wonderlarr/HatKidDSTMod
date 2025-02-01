local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_pride.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_pride.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_pride.xml","badge_pride.tex")


STRINGS.NAMES.BADGE_PRIDE = "Ranger Badge"

local function OnEquip(inst, owner)
	-- Mark of Pride
	owner.components.combat:SetRange(TUNING.DEFAULT_ATTACK_RANGE + 1)
end

local function OnUnequip(inst, owner)
	owner.components.combat:SetRange(TUNING.DEFAULT_ATTACK_RANGE)
end

local function fn() 
    local inst = CreateEntity()

	-- Client and Server

	-- Add internal components
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	-- Setup AnimState
	inst.AnimState:SetBank("badge_ground")
    inst.AnimState:SetBuild("badge_ground")
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
	-- inst.components.inventoryitem.imagename = "kidpotion"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"

	inst:AddComponent("inspectable")

	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "badgerestricted"
	inst.components.equippable.equipslot = EQUIPSLOTS.BADGE1
	inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("badge")
    return inst
end

return Prefab("badge_pride", fn, assets)