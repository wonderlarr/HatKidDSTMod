local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_fury.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_fury.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_fury.xml","badge_fury.tex")

local function OnHealthDelta(owner, data)
	if data.newpercent <= 0.25 then
		owner.components.combat.externaldamagemultipliers:SetModifier(owner, 1.50, "badge_fury")
		owner:AddTag("fury_attacker")
	else
		owner.components.combat.externaldamagemultipliers:RemoveModifier(owner, "badge_fury")
		owner:RemoveTag("fury_attacker")
	end
end

local function OnEmpty(inst)
    if inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() ~= nil then
        inst.components.inventoryitem:GetGrandOwner():PushEvent("toolbroke", { tool = inst })
    end

    inst:Remove()
end

local function OnEquip(inst, owner)
	-- Fury of the Fallen
	inst:ListenForEvent("healthdelta", OnHealthDelta, owner)
	owner.components.health:DoDelta(0) -- trigger a healthdelta on equip

	inst:ListenForEvent("onattackother", inst.OnAttack, owner)
end

local function OnUnequip(inst, owner)
	inst:RemoveEventCallback("healthdelta", OnHealthDelta, owner)
	owner.components.combat.externaldamagemultipliers:RemoveModifier(owner, "badge_fury")

	inst:RemoveEventCallback("onattackother", inst.OnAttack, owner)
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

	inst:AddComponent("fueled")
	inst.components.fueled.fueltype = FUELTYPE.MAGIC
	inst.components.fueled:InitializeFuelLevel(100)
	inst.components.fueled:SetDepletedFn(OnEmpty)

	-- idk where else to put this where i can access inst based on this event
	inst.OnAttack = function(owner, data)
		if owner:HasTag("fury_attacker") then
			inst.components.fueled:DoDelta(-1)
		end
	end

    return inst
end

return Prefab("badge_fury", fn, assets)