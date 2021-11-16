local assets =
{
    Asset("ANIM", "anim/hkr_badge_winter.zip"),
	
	Asset("IMAGE", "images/inventoryimages/hkr_badge_winter.tex"),
    Asset("ATLAS", "images/inventoryimages/hkr_badge_winter.xml"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hkr_badge_winter")
    inst.AnimState:SetBuild("hkr_badge_winter")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("hkr_badge")

    MakeInventoryFloatable(inst, "med", 0.1, 0.75)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL * 3

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)

    MakeHauntableLaunchAndIgnite(inst)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hkr_badge_winter"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hkr_badge_winter.xml"
	
	inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.ARMORWOOD, TUNING.ARMORWOOD_ABSORPTION)

    return inst
end

STRINGS.NAMES.HKR_BADGE_WINTER = "Winter Badge"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HKR_BADGE_WINTER = "I hope it actually insulates"
STRINGS.RECIPE_DESC.HKR_BADGE_WINTER = "Makes your hat a little more wintery"

return Prefab("hkr_badge_winter", fn, assets)
