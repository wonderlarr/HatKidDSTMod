local assets =
{
    Asset("ANIM", "anim/badgeseller.zip"),
    Asset("ANIM", "anim/badgesellercane.zip"),
    Asset("ANIM", "anim/swap_badgeseller_backpack.zip"),
}

-- Check Emitter component for particles

local prefabs =
{

}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 50, .5)

    inst.DynamicShadow:SetSize(1.5, .75)
    inst.Transform:SetFourFaced()

    inst:AddTag("character")

    inst.AnimState:SetBank("wilson")
    inst.AnimState:SetBuild("badgeseller")
    inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:SetScale(1.2, 1.2)

    inst.AnimState:Hide("ARM_carry")
    inst.AnimState:Hide("HAT")
    inst.AnimState:Hide("HAIR_HAT")
    inst.AnimState:Show("HAIR_NOHAT")
    inst.AnimState:Show("HAIR")
    inst.AnimState:Show("HEAD")
    inst.AnimState:Hide("HEAD_HAT")

    --trader (from trader component) added to pristine state for optimization
    -- inst:AddTag("trader")

    -- inst:AddComponent("talker")
    -- inst.components.talker.colour = Vector3(252/255, 226/255, 219/255)
    -- inst.components.talker.offset = Vector3(0, -400, 0)
    -- inst.components.talker:MakeChatter()
    -- inst.components.talker.lineduration = TUNING.HERMITCRAB.SPEAKTIME - 0.5  -- the subtraction is to create a buffer between text.
    -- inst.components.talker.font = TALKINGFONT_HERMIT

    -- inst:AddComponent("npc_talker")

    if not TheNet:IsDedicated() then
        inst:AddComponent("pointofinterest")
        inst.components.pointofinterest:SetHeight(220)
    end

    -- inst.displaynamefn = displaynamefn

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- inst.scrapbook_hide = { "ARM_carry", "HAT", "HAIR_HAT", "HEAD_HAT" }
    -- inst.scrapbook_facing  = FACING_DOWN

    -- inst.components.talker.ontalk = ontalk

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    -- inst.components.locomotor.runspeed = TUNING.HERMITCRAB.RUNSPEED
    -- inst.components.locomotor.walkspeed = TUNING.HERMITCRAB.WALKSPEED

    -- inst:AddComponent("bloomer")

    ------------------------------------------
    -- inst:AddComponent("eater")
    -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
    -- inst.components.eater:SetCanEatHorrible()
    -- inst.components.eater:SetCanEatRaw()
    -- inst.components.eater:SetStrongStomach(true) -- can eat monster meat!

    ------------------------------------------
    -- inst:AddComponent("named")

    ------------------------------------------
    -- MakeHauntablePanic(inst)

    -----------------------StopActionMeter-------------------

    -- inst:AddComponent("inventory")

    ------------------------------------------

    -- inst:AddComponent("lootdropper")

    ------------------------------------------

    -- inst:AddComponent("friendlevels")
    -- inst.components.friendlevels:SetDefaultRewards(defaultfriendrewards)
    -- inst.components.friendlevels:SetLevelRewards(friendlevelrewards)
    -- inst.components.friendlevels:SetFriendlyTasks(friendlytasks)
    -- initfriendlevellisteners(inst)
    -- inst.complain = complain
    -- inst.rewardcheck = rewardcheck
    -- inst.getgeneralfriendlevel = getgeneralfriendlevel
    -- inst.storelevelunlocked = storelevelunlocked

    ------------------------------------------

    -- inst:AddComponent("trader")
    -- inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    -- inst.components.trader.onrefuse = OnRefuseItem
    -- inst.components.trader.deleteitemonaccept = false

    ------------------------------------------

	-- inst:AddComponent("teleportedoverride")
	-- inst.components.teleportedoverride:SetDestPositionFn(teleport_override_fn)

    ------------------------------------------

    -- inst:AddComponent("entitytracker")

    ------------------------------------------

    -- inst:AddComponent("timer")

    ------------------------------------------
    -- MakeMediumFreezableCharacter(inst, "torso")

    ------------------------------------------

    inst:AddComponent("inspectable")
    -- inst.components.inspectable.getstatus = GetStatus

    ------------------------------------------

    -- inst:AddComponent("craftingstation")

    ------------------------------------------

    -- inst:SetStateGraph("SGWilson")

    ------------------------------------------

    -- inst:SetBrain(normalbrain) -- local normalbrain = require "brains/hermitcrabbrain"

    return inst
end

return Prefab("badgeseller", fn, assets, prefabs)