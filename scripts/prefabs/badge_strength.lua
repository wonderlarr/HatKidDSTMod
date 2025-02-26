local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_strength.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_strength.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_strength.xml","badge_strength.tex")

local function OnEquip(inst, owner)
	-- damagebonus doesn't use a SourceModifierList which concerns me somewhat, but as long as this isn't combined
	-- with other mods we should be fine, as vanilla doesn't use them to my knowledge
	-- Just in case, we'll check for damage bonuses and bail if we find any.
	if not owner.components.combat.damagebonus then
		owner.components.combat.damagebonus = 17
		owner:AddTag("badge_strength_damagebonus")
	else
		owner.components.talker:Say("A mod may be conflicting with this badge.")
	end

	inst:ListenForEvent("healthdelta", inst.OnHealthDelta, owner)
end

local function OnUnequip(inst, owner)
	-- Check with tag to ensure damagebonus is safe to remove
	if owner:HasTag("badge_strength_damagebonus") then
		owner.components.combat.damagebonus = nil
	end

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

return Prefab("badge_strength", fn, assets)