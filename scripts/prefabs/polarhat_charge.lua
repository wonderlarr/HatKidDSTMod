local assets =
{

}

local function MakeExplosion(data)
    local function PlayExplodeAnim(proxy)
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        -- inst.entity:AddNetwork()
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        -- inst.entity:AddSoundEmitter()
        -- inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)
        
        inst.AnimState:SetBank("stalker_shield")
        inst.AnimState:SetBuild("stalker_shield")
        inst.AnimState:PlayAnimation("idle1")
        inst.AnimState:SetScale(0.8, 0.8)
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        inst.AnimState:SetFinalOffset(10)
        inst.AnimState:SetAddColour(150/255, 255/255, 255/255, 1)
        inst.AnimState:SetDeltaTimeMultiplier(1.5)

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function PlayExplode2Anim(proxy)
        local inst = CreateEntity()

        inst:AddTag("FX")
        --[[Non-networked entity]]
        -- inst.entity:AddNetwork()
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        -- inst.entity:AddSoundEmitter()
        -- inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)
        
        inst.AnimState:SetBank("stalker_shield")
        inst.AnimState:SetBuild("stalker_shield")
        inst.AnimState:PlayAnimation("idle2")
        inst.AnimState:SetScale(1.15, 1.15)
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        inst.AnimState:SetFinalOffset(10)
        inst.AnimState:SetAddColour(180/255, 255/255, 255/255, 1)
        inst.AnimState:SetDeltaTimeMultiplier(1.5)

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
            inst:DoTaskInTime(0, function(inst)
                -- PlayExplodeAnim(inst)
                PlayExplode2Anim(inst)
            end)
        end

        inst.Transform:SetFourFaced()

        inst:AddTag("FX")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.persists = false
        inst:DoTaskInTime(1, inst.Remove)

        return inst
    end

    return fn
end


return Prefab("polarhat_charge", MakeExplosion(), assets)