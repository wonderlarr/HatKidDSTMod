local assets =
{
    Asset("ANIM", "anim/hatbrella.zip"),
    Asset("ANIM", "anim/hatbrella_ground.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella.tex"),
	
    Asset("ATLAS", "images/inventoryimages/hatbrellaopen.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrellaopen.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/hatbrella.xml", "hatbrella.tex")



local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", inst.prefab, "swap_object")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
    local brella = SpawnPrefab("hatbrellaopen")
    
    if brella.components.fueled and inst.components.finiteuses then
        brella.components.fueled:SetPercent(inst.components.finiteuses:GetPercent())
    end

	owner.components.inventory:Equip(brella)

    inst.components.inventoryitem:RemoveFromOwner()

	inst:DoTaskInTime(0, inst.Remove)
end

local function OnEmpty(inst)
    inst:DoTaskInTime(0, inst.Remove)
end


local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   

      
    inst.AnimState:SetBank("hatbrella_ground")
    inst.AnimState:SetBuild("hatbrella_ground")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetScale(0.65, 0.65)

    inst.handname = "hatbrella"
	
    inst:AddTag("sharp")

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "hatbrella"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"
	
    inst:AddComponent("equippable")
    -- inst.components.equippable.restrictedtag = "hatkid"
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    if TUNING.HATBRELLA_DURABILITY then
        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(TUNING.HATBRELLA_DURABILITY)
        inst.components.finiteuses:SetUses(TUNING.HATBRELLA_DURABILITY)
        inst.components.finiteuses:SetOnFinished(OnEmpty)
    end

	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	
	MakeHauntableLaunch(inst)
	
    return inst
end

local function fn_bowkid()
	local inst = fn()

	inst.AnimState:SetBuild("hatbrella_bowkid_ground")
    RegisterInventoryItemAtlas("images/inventoryimages/hatbrella_bowkid.xml","hatbrella_bowkid.tex")

    inst.handname = "hatbrella_bowkid"

	return inst

end


return  Prefab("hatbrella", fn, assets)
-- CreateModPrefabSkin("hatbrella_bowkid",
-- {
-- 	assets = {
-- 		Asset("ANIM", "anim/hatbrella_bowkid.zip"),
-- 		Asset("ANIM", "anim/hatbrella_bowkid_ground.zip"),
-- 		Asset("ATLAS", "images/inventoryimages/hatbrella_bowkid.xml"),
-- 		Asset("IMAGE", "images/inventoryimages/hatbrella_bowkid.tex"),
-- 	},
-- 	base_prefab = "hatbrella",
-- 	fn = fn_bowkid,
-- 	rarity = "Timeless",
-- 	reskinable = true,
	
-- 	build_name_override = "hatbrella_bowkid",
	
-- 	type = "item",
-- 	skin_tags = { },
-- 	release_group = 0,
-- })