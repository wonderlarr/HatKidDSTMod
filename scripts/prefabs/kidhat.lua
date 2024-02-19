local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
    Asset("ANIM", "anim/ms_kidhat_dye_toonlink.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),

	-- Asset("ATLAS", "images/inventoryimages/ms_kidhat_dye_bowkid.xml"),
    -- Asset("IMAGE", "images/inventoryimages/ms_kidhat_dye_bowkid.tex"),

	-- Asset("ATLAS", "images/inventoryimages/ms_kidhat_dye_groovy.xml"),
    -- Asset("IMAGE", "images/inventoryimages/ms_kidhat_dye_groovy.tex"),
}


RegisterInventoryItemAtlas("images/inventoryimages/kidhat.xml","kidhat.tex")

RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_bowkid.xml","ms_kidhat_dye_bowkid.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_groovy.xml","ms_kidhat_dye_groovy.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_lunar.xml","ms_kidhat_dye_lunar.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_niko.xml","ms_kidhat_dye_niko.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_oliver.xml","ms_kidhat_dye_oliver.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_pinkdanger.xml","ms_kidhat_dye_pinkdanger.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_sans.xml","ms_kidhat_dye_sans.tex")
RegisterInventoryItemAtlas("images/inventoryimages/ms_kidhat_dye_toonlink.xml","ms_kidhat_dye_toonlink.tex")

local prefabs = 
{
}

local function OnEquip(inst, owner)
	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner.AnimState:OverrideItemSkinSymbol("swap_hat", skin_build, "swap_hat", inst.GUID, "kidhat")
	else
		owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	end
	
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end
end
 
local function OnUnequip(inst, owner)

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end
end
 

 
local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
end

local function fn() 
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

	-- Custom Tags
    inst:AddTag("hat")
	inst:AddTag("hatkidhat")

	-- Component Tags
	inst:AddTag("inspectable")
	inst:AddTag("waterproofer")

	-- Set pristine
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	-- Server only
	
	-- Hauntable mode
	MakeHauntableLaunch(inst)
 
	-- Server components

	-- Makes the item, well, an item
	inst:AddComponent("inventoryitem")

	-- Allows inspecting of the item
	inst:AddComponent("inspectable")
	
	inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.KIDHAT_SANITY / 60 -- Config number is sanity per minute, internal dapperness is by second.
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	if TUNING.KIDHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.USAGE
		inst.components.fueled:InitializeFuelLevel( TUNING.KIDHAT_DURABILITY )
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end

	if TUNING.KIDHAT_INSULATION then
		inst:AddComponent("insulator")
		inst.components.insulator:SetWinter()
		inst.components.insulator:SetInsulation(TUNING.KIDHAT_INSULATION)
	end

	if TUNING.KIDHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.KIDHAT_WATERPROOFNESS)
	end

    return inst
end

-- local function fn_dye_niko()
-- 	local inst = fn()

-- 	inst.AnimState:SetBuild("kidhat_dye_niko")

-- 	return inst

-- end

-- local function fn_dye_toonlink()
-- 	local inst = fn()

-- 	inst.AnimState:SetBuild("kidhat_dye_toonlink")

-- 	return inst

-- end

-- local function fn_dye_pinkdanger()
-- 	local inst = fn()

-- 	inst.AnimState:SetBuild("kidhat_dye_pinkdanger")

-- 	return inst

-- end

return Prefab("kidhat", fn, assets, prefabs)