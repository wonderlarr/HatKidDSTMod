local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_heart.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_heart.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_heart.xml","badge_heart.tex")

local function OnEquip(inst, owner)
	-- This is risky. As I understand, max health is not modified by default so it should be okay?

	inst.oldmax = owner.components.health.maxhealth
	inst.oldval = owner.components.health.currenthealth
	owner.components.health:SetMaxHealth(inst.oldmax + 30)
	owner.components.health:SetCurrentHealth(inst.oldval)

	inst:ListenForEvent("healthdelta", inst.OnHealthDelta, owner)
end

local function OnUnequip(inst, owner)
	-- Remove event callback first since the following lines can cause problematic health delta events
	inst:RemoveEventCallback("healthdelta", inst.OnHealthDelta, owner)

	inst.oldval = owner.components.health.currenthealth
	owner.components.health:SetMaxHealth(inst.oldmax)
	owner.components.health:SetCurrentHealth(math.min(inst.oldval, inst.oldmax)) -- clamps health if we unequip while above 120
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

	inst:AddComponent("inspectable")

	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "badgerestricted"
	inst.components.equippable.equipslot = EQUIPSLOTS.BADGE1
	inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("badge")

	inst.OnHealthDelta = function(owner, data)
		if data.newpercent < 0.25 then
			owner:PushEvent("toolbroke", { tool = inst })
			inst:Remove()
		end
	end

    return inst
end

return Prefab("badge_heart", fn, assets)