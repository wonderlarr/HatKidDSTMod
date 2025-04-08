local assets=
{ 
    Asset("ANIM", "anim/badge_ground.zip"),
	
    Asset("ATLAS", "images/inventoryimages/badge_carefree.xml"),
    Asset("IMAGE", "images/inventoryimages/badge_carefree.tex"),
}
RegisterInventoryItemAtlas("images/inventoryimages/badge_carefree.xml","badge_carefree.tex")

local function OnEquip(inst, owner)
    inst.blockchance = 0

	inst:ListenForEvent("attacked", inst.OnAttacked, owner)
	inst:ListenForEvent("blocked", inst.OnBlocked, owner)
end

local function OnUnequip(inst, owner)
    if owner:HasTag("carefree_ready") then
        owner:RemoveTag("carefree_ready")
        owner.components.combat.externaldamagetakenmultipliers:RemoveModifier(inst)
    end
    inst:RemoveEventCallback("attacked", inst.OnAttacked, owner)
    inst:RemoveEventCallback("blocked", inst.OnBlocked, owner)
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


    inst.OnAttacked = function(owner, data)
        -- every time we're attacked, roll a 15% chance. If we succeed, block the next attack, otherwise increase the chance up to 90%.
        if math.random() <= (0.15 + inst.blockchance) then
            owner:AddTag("carefree_ready")
            owner.components.combat.externaldamagetakenmultipliers:SetModifier(inst, 0)

            inst.blockchance = 0
        else
            inst.blockchance = inst.blockchance + 0.15
            if inst.blockchance > 0.75 then -- Cap the bonus at 75%, since there's always a base 15% chance to block that means it really caps at 90%
                inst.blockchance = 0.75
            end
        end
        print(inst.blockchance)
    end

    inst.OnBlocked = function(owner, data)
        inst.blockchance = 0

        if owner:HasTag("carefree_ready") then
            owner:RemoveTag("carefree_ready")
            owner.components.combat.externaldamagetakenmultipliers:RemoveModifier(inst)
        end
    end
    
    return inst
end

return Prefab("badge_carefree", fn, assets)