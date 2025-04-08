local assets =
{
    Asset("ANIM", "anim/badgeseller.zip"),
    Asset("ANIM", "anim/badgesellercane.zip"),
    Asset("ANIM", "anim/swap_badgeseller_backpack.zip"),
}

-- Check Emitter component for particles

STRINGS.CHARACTERS.BADGESELLER = {
    "Hi there, young one. I've explored all around this constant.\nI can sell you tiny pieces of my discoveries." ,
    "You may call me the Badge Seller.\nI can sell you upgrades to your hats...",
    "Badges are... totally \"in\" right now.\nThat's what I've been told to say, anyway." ,
    "Please disregard my erratic behavior.\nI've been to places that've left a permanent mark." ,
    "I also sell terrible Badges...\nAnd yet people buy them anyway." ,
    "Welcome, young one.\nPlease make a purchase at my humble stall." ,
    "Have you come to make another purchase?" ,
}

local prefabs =
{

}

local brain = require "brains/badgesellerbrain"

local function onturnon(inst)
    if not inst:HasTag("badgeseller_fatigue") then
        inst:PushEvent("badgeseller_greet")
        inst.components.talker:Chatter("CHARACTERS.BADGESELLER", math.random(1,7))
    end
end

local function onturnoff(inst)
    inst:AddTag("badgeseller_fatigue")

    if inst.fatigue then
        inst.fatigue:Cancel()
        inst.fatigue = nil
    end

    inst.fatigue = inst:DoTaskInTime(8, function()
        inst:RemoveTag("badgeseller_fatigue")
    end)
end

local function StartSelling(inst, doer, recipe)

end

local function MakePrototyper(inst)

end



local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()
    
    MakeCharacterPhysics(inst, 150, 0.75)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)

    inst.DynamicShadow:SetSize(1.5, 1.25)
    inst.Transform:SetFourFaced()

    inst:AddTag("character")
    inst:AddTag("prototyper")
    inst:AddTag("badgeseller")

    inst.AnimState:SetBank("wilson")
    inst.AnimState:SetBuild("badgeseller")
    inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:SetScale(1.3, 1.3)

    inst.AnimState:Hide("ARM_normal")

    -- fake item equips, move these to real items if we can
    inst.AnimState:OverrideSymbol("swap_object", "badgesellercane", "swap_object")
    inst.AnimState:OverrideSymbol("swap_body", "swap_badgeseller_backpack", "swap_body")

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 30
    -- inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(196/255, 160/255, 1)
    -- inst.components.talker.offset = Vector3(0, -200, 0)
    inst.components.talker.lineduration = 5
    inst.components.talker:MakeChatter()

    inst:AddComponent("prototyper")
    inst.components.prototyper.onturnon = onturnon
    inst.components.prototyper.onturnoff = onturnoff
    inst.components.prototyper.onactivate = StartSelling
    inst.components.prototyper.trees = TUNING.PROTOTYPER_TREES.BADGESELLER_ONE

    if not TheNet:IsDedicated() then
        inst:AddComponent("pointofinterest")
        inst.components.pointofinterest:SetHeight(220)
        inst.components.pointofinterest:DebugForceShowIndicator()
    end


    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("knownlocations")
    inst:DoTaskInTime(0, function()
        inst.components.knownlocations:RememberLocation("home", inst:GetPosition(), true)
    end)

    inst:SetStateGraph("SGbadgeseller")
    inst.sg:GoToState("spawn")

    inst:SetBrain(brain)

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 2
    inst.components.locomotor.runspeed = 4

    inst:AddComponent("inspectable")

    TheWorld:ListenForEvent("badgeseller_despawn", function()
        inst.sg:GoToState("despawn")
    end)

    return inst
end



return Prefab("badgeseller", fn, assets, prefabs)