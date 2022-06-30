local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
	Asset("ANIM", "anim/quagmire_ui_pot_1x3.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}


RegisterInventoryItemAtlas("images/inventoryimages/kidhat.xml","kidhat.tex")
-- RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_niko.xml","kidhat_dye_niko.tex")
-- RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_toonlink.xml","kidhat_dye_toonlink.tex")
-- RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_pinkdanger.xml","kidhat_dye_pinkdanger.tex")

local prefabs = 
{
}

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	
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


local function KeybindUse(inst)
	inst.components.useableitem:StartUsingItem()
end

local function fn() 
    local inst = CreateEntity()

	-- Client and Server

	-- Add internal components
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

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
	inst:AddComponent("inventoryitem")

	inst:AddComponent("inspectable")

	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
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

return  Prefab("kidhat", fn, assets, prefabs)
-- CreateModPrefabSkin("kidhat_dye_niko",
-- {
-- 	assets = {
-- 		Asset("ANIM", "anim/kidhat_dye_niko.zip"),
-- 		Asset("ATLAS", "images/inventoryimages/kidhat_dye_niko.xml"),
-- 		Asset("IMAGE", "images/inventoryimages/kidhat_dye_niko.tex"),
-- 	},
-- 	base_prefab = "kidhat",
-- 	fn = fn_dye_niko,
-- 	rarity = "Timeless",
-- 	reskinable = true,
	
-- 	build_name_override = "kidhat_dye_niko",
	
-- 	type = "item",
-- 	skin_tags = { },
-- 	release_group = 0,
-- }),
-- CreateModPrefabSkin("kidhat_dye_toonlink",
-- {
-- 	assets = {
-- 		Asset("ANIM", "anim/kidhat_dye_toonlink.zip"),
-- 		Asset("ATLAS", "images/inventoryimages/kidhat_dye_toonlink.xml"),
-- 		Asset("IMAGE", "images/inventoryimages/kidhat_dye_toonlink.tex"),
-- 	},
-- 	base_prefab = "kidhat",
-- 	fn = fn_dye_toonlink,
-- 	rarity = "Timeless",
-- 	reskinable = true,
	
-- 	build_name_override = "kidhat_dye_toonlink",
	
-- 	type = "item",
-- 	skin_tags = { },
-- 	release_group = 0,
-- }),
-- CreateModPrefabSkin("kidhat_dye_pinkdanger",
-- {
-- 	assets = {
-- 		Asset("ANIM", "anim/kidhat_dye_pinkdanger.zip"),
-- 		Asset("ATLAS", "images/inventoryimages/kidhat_dye_pinkdanger.xml"),
-- 		Asset("IMAGE", "images/inventoryimages/kidhat_dye_pinkdanger.tex"),
-- 	},
-- 	base_prefab = "kidhat",
-- 	fn = fn_dye_pinkdanger,
-- 	rarity = "Timeless",
-- 	reskinable = true,
	
-- 	build_name_override = "kidhat_dye_pinkdanger",
	
-- 	type = "item",
-- 	skin_tags = { },
-- 	release_group = 0,
-- })