local assets=
{ 

}

STRINGS.NAMES.PON_UPGRADE1 = "Wallet Upgrade 1"
STRINGS.NAMES.PON_UPGRADE2 = "Wallet Upgrade 2"

local function OnUse(inst)

end

local function fn_common()
    local inst = CreateEntity()

	-- Client and Server

	-- Add internal components
	inst.entity:AddTransform() -- position
	inst.entity:AddAnimState() -- sprite and animation
	inst.entity:AddSoundEmitter() -- sounds
    inst.entity:AddNetwork() -- networked from server to client

	-- Setup AnimState
	inst.AnimState:SetBank("kidhat")
    inst.AnimState:SetBuild("kidhat")
    inst.AnimState:PlayAnimation("idle")

	-- standardcomponents.lua functions
    MakeInventoryPhysics(inst) -- Sets physics properties of an item when it's outside the inventory.
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.

	-- Component Tags
	inst:AddTag("inspectable")

	-- Set pristine
	inst.entity:SetPristine()

    return inst
end

local function fn_master(inst)
	-- Server only
	
	-- Hauntable mode
	MakeHauntableLaunch(inst)
 
	-- Server components

	-- Makes the item, well, an item
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"

	-- Allows inspecting of the item
	inst:AddComponent("inspectable")

	inst:AddComponent("invuseable")

    return inst
end

local function fn1()
    local inst = fn_common()

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    fn_master(inst)

	inst.components.invuseable:SetOnUse(function()
		local owner = inst.components.inventoryitem:GetGrandOwner()
		if owner and owner.components.madhatter and owner.components.madhatter.max < 1000 then
			owner.components.madhatter:SetMax(1000)
			owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
			inst:Remove()
		end
	end)

    return inst
end

local function fn2()
    local inst = fn_common()

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    fn_master(inst)

	inst.components.invuseable:SetOnUse(function()
		local owner = inst.components.inventoryitem:GetGrandOwner()
		if owner and owner.components.madhatter and owner.components.madhatter.max < 5000 then
			owner.components.madhatter:SetMax(5000)
			owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
			inst:Remove()
		end
	end)

    return inst
end

return Prefab("pon_upgrade1", fn1, assets),
    Prefab("pon_upgrade2", fn2, assets)