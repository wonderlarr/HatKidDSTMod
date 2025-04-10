local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_greed.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_greed.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_greed.xml","badge_greed.tex")

local function OnEquip(inst, owner)
	owner:AddTag("badge_greed_active")
	inst:ListenForEvent("healthdelta", inst.OnHealthDelta, owner)
end

local function OnUnequip(inst, owner)
	owner:RemoveTag("badge_greed_active")
	inst:RemoveEventCallback("healthdelta", inst.OnHealthDelta, owner)
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

return Prefab("badge_greed", fn, assets)