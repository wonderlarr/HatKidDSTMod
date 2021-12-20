local Assets = {
	-- Animation files for the item (showing it on the ground and swap symbols for the players).
	Asset("ANIM", "anim/custom_armor.zip"),
	
	-- Inventory image and atlas file used for the item.
    Asset("ATLAS", "images/inventoryimages/custom_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/custom_armor.tex"),
}

local function OnEquip(inst, owner)
	-- This will override symbol "swap_body" of the equipping player with your custom build symbol.
	-- Here's what this function is overriding:
	-- owner.AnimState:OverrideSymbol(Player's_symbol, Your_build(*.zip_filename), Symbol_from_your_build(name_of_subfolder_with_art)
    owner.AnimState:OverrideSymbol("swap_body", "custom_armor", "swap_body")
end

local function OnUnequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
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
	minimap:SetIcon("custom_armor.tex")
	
	--[[ ANIMSTATE ]]--
	-- This is the name visible on the top of hierarchy in Spriter.
    inst.AnimState:SetBank("custom_armor")
	-- This is the name of your compiled*.zip file.
    inst.AnimState:SetBuild("custom_armor")
	-- This is the animation name while item is on the ground.
    inst.AnimState:PlayAnimation("anim")
	
	--[[ TAGS ]]--
	inst:AddTag("custom_armor")
	
	MakeInventoryFloatable(inst, "small", 0.2, 1.1)
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		-- If we're not the host - stop performing further functions.
		-- Only server functions below.
        return inst
    end
	
	inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/custom_armor.xml"
	inst.components.inventoryitem.imagename = "custom_armor"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	
	inst:AddComponent("armor")
	-- Durability = 500, resistance to damage = 70%
    inst.components.armor:InitCondition(500, 0.7)	
    
	MakeHauntableLaunch(inst)
	
    return inst
end

	
return Prefab( "common/inventory/custom_armor", MainFunction, Assets) 
