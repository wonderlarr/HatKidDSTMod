local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_onehit.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_onehit.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_onehit.xml","badge_onehit.tex")

local function OnEquip(inst, owner)
	inst:ListenForEvent("attacked", inst.OnAttacked, owner)
end

local function OnUnequip(inst, owner)
    inst:RemoveEventCallback("attacked", inst.OnAttacked, owner)
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

    inst.OnAttacked = function (owner, data)
        if data.damage > 0 then
            owner.components.health:DoDelta(-owner.components.health.currenthealth, nil, data.attacker.prefab or nil, nil, data.attacker)
        end
    end
    
    return inst
end

return Prefab("badge_onehit", fn, assets)