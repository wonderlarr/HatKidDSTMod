local assets =
{

}

local function MakeExplosion(data)
    local function PlayCollectAnim(proxy)
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
        
        inst.AnimState:SetBank("pocketwatch_cast_fx")
        inst.AnimState:SetBuild("pocketwatch_casting_fx")
        inst.AnimState:PlayAnimation("pocketwatch_heal_fx")
        inst.AnimState:SetScale(1.5,1.5)
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        inst.AnimState:SetFinalOffset(10)
        inst.AnimState:SetDeltaTimeMultiplier(1.25)
        inst.AnimState:SetTime(16 * FRAMES) 
        inst.AnimState:SetAddColour(1,1,1,1)
        inst.AnimState:SetMultColour(180/255,1,1,1)

        inst:ListenForEvent("animover", inst.Remove)
    end

    local function PlayFlashAnim(proxy)
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
        inst.AnimState:SetFinalOffset(8)
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
                PlayCollectAnim(inst)
                PlayFlashAnim(inst)
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