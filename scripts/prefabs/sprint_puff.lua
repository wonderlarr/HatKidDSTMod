local assets =
{
    -- Asset("ANIM", "anim/sprint_puff.zip"),
    Asset("ANIM", "anim/smoke_puff_small.zip"),
}

local function MakeExplosion(data)
    local function PlayExplodeAnim(proxy)
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()

        inst.Transform:SetFromProxy(proxy.GUID)

        -- inst.AnimState:SetBank("sprint_puff")
        -- inst.AnimState:SetBuild("sprint_puff")
        -- inst.AnimState:PlayAnimation("puff_90s")
        inst.AnimState:SetBank("small_puff")
        inst.AnimState:SetBuild("smoke_puff_small")
        inst.AnimState:PlayAnimation("puff")
        inst.AnimState:SetAddColour(1, 1, 1, 1)

        if math.random(1, 2) == 1 then -- flip 50% of spawns
            inst.AnimState:SetScale(-1, 1, 1)
        end

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddNetwork()

        --Dedicated server does not need to spawn the local fx
        if not TheNet:IsDedicated() then
            --Delay one frame so that we are positioned properly before starting the effect
            --or in case we are about to be removed
            inst:DoTaskInTime(0, PlayExplodeAnim)
        end

        inst.Transform:SetFourFaced()

        inst:AddTag("FX")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.persists = false
        inst:DoTaskInTime(1, inst.Remove) -- Remove after 1 second. This will only apply to the dedicated server, or host.

        return inst
    end

    return fn
end


return Prefab("sprint_puff", MakeExplosion(), assets)