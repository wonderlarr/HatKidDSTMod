local Assets = { 
	-- Animation files for the item (showing it on the ground and swap symbols for the players).
    Asset("ANIM", "anim/custom_handitem.zip"),
	Asset("ANIM", "anim/custom_handitem_ground.zip"),

	-- Inventory image and atlas file used for the item.
    Asset("ATLAS", "images/inventoryimages/custom_handitem.xml"),
    Asset("IMAGE", "images/inventoryimages/custom_handitem.tex"),
}

local function OnEquip(inst, owner)
	-- This will override symbol "swap_body" of the equipping player with your custom build symbol.
	-- Here's what this function is overriding:
	-- owner.AnimState:OverrideSymbol(Player's_symbol, Your_build(*.zip_filename), Symbol_from_your_build(name_of_subfolder_with_art)
	owner.AnimState:OverrideSymbol("swap_object", "custom_handitem", "swap_object")
	
	-- Players have 2 left arms - one of them is hidden when we are not holding an item and vice versa.
	-- Since we want to show an item on equip - hide ARM_normal and show ARM_carry.
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function OnUnequip(inst, owner) 
	owner.AnimState:Hide("ARM_carry") 
	owner.AnimState:Show("ARM_normal") 
end

local function MainFunction()
	-- Functions which are performed both on Client and Server start here.
    local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
	
	MakeInventoryPhysics(inst)
	
	-- Add minimap icon. Remember about its XML in modmain.lua!
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("custom_handitem.tex")
	
	--[[ ANIMSTATE ]]--
	-- This is the name visible on the top of hierarchy in Spriter.
	inst.AnimState:SetBank("custom_handitem_ground")
	-- This is the name of your compiled*.zip file.
	inst.AnimState:SetBuild("custom_handitem_ground")
	-- This is the animation name while item is on the ground.
	inst.AnimState:PlayAnimation("anim")

	--[[ TAGS ]]--
	inst:AddTag("custom_handitem")

    MakeInventoryFloatable(inst, "small", 0.05, {1.2, 0.75, 1.2})

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
		-- If we're not the host - stop performing further functions.
		-- Only server functions below.
        return inst
    end

	inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "custom_handitem"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/custom_handitem.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(34)

	MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/custom_handitem", MainFunction, Assets)