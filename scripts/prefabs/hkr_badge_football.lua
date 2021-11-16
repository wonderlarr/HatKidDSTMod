local assets =
{
    Asset("ANIM", "anim/hkr_badge_football.zip"),
	
	Asset("IMAGE", "images/inventoryimages/hkr_badge_football.tex"),
    Asset("ATLAS", "images/inventoryimages/hkr_badge_football.xml"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hkr_badge_football")
    inst.AnimState:SetBuild("hkr_badge_football")
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
    inst.components.inventoryitem.imagename = "hkr_badge_football"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hkr_badge_football.xml"
	
	inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.ARMORWOOD, TUNING.ARMORWOOD_ABSORPTION)

    return inst
end

STRINGS.NAMES.HKR_BADGE_FOOTBALL = "Football Badge"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HKR_BADGE_FOOTBALL = "How does that protect anything?"
STRINGS.RECIPE_DESC.HKR_BADGE_FOOTBALL = "Wear a football helmet on top of your current hat!"

return Prefab("hkr_badge_football", fn, assets)
