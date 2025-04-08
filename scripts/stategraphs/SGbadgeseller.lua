require("stategraphs/commonstates")

local actionhandlers =
{
    ActionHandler(ACTIONS.GOHOME, "gohome"),
}

local events=
{
    CommonHandlers.OnLocomote(false, true),
}


local states =
{
    State{
        name = "idle",
        tags = { "idle", "canrotate" },

        onenter = function(inst)
            -- inst.Physics:Stop()
            inst.AnimState:PlayAnimation("idle_loop", true)
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
            EventHandler("badgeseller_greet", function(inst)
                inst.sg:GoToState("greet")
            end),
        },
    },

    State{
        name = "greet",
        tags = { "busy" },

        onenter = function(inst)
            inst.AnimState:PlayAnimation("emoteXL_waving1")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "spawn",
        tags = { "busy" },

        onenter = function(inst)
            inst.AnimState:PlayAnimation("jumpout")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "despawn",
        tags = { "busy", "nosleep", "nofreeze" },

        onenter = function(inst)
            inst:StopBrain()
            inst.components.locomotor:Stop()

            inst.AnimState:PushAnimation("idle_wanda")
            inst.AnimState:PushAnimation("emoteXL_waving1")
            inst.AnimState:PushAnimation("jump_pre")
            inst.AnimState:PushAnimation("jump", false)
        end,

        timeline =
        {
            TimeEvent(75*FRAMES, function(inst) inst:Remove() end),
        },
    },
}

CommonStates.AddWalkStates(states,
{
    starttimeline =
    {
        TimeEvent(0, function(inst) inst.components.locomotor.walkspeed = 2 end),
    },

    walktimeline =
    {
        TimeEvent(0, PlayFootstep),
        TimeEvent(0 * FRAMES, function(inst) inst.components.locomotor.walkspeed = 4 end),
        TimeEvent(7 * FRAMES, function(inst) inst.components.locomotor.walkspeed = 2  end),
        TimeEvent(12 * FRAMES, function(inst) inst.components.locomotor.walkspeed = 4 end),
        TimeEvent(18 * FRAMES, function(inst) inst.components.locomotor.walkspeed = 2 end),
        TimeEvent(12 * FRAMES, PlayFootstep),
    },
})

return StateGraph("badgeseller", states, events, "idle", actionhandlers)
