local assets =
{
    Asset("SOUNDPACKAGE", "sound/kidpotion.fev"),
    Asset("SOUND", "sound/kidpotion.fsb"),
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
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()

        inst.Transform:SetFromProxy(proxy.GUID)
        
        inst:AddComponent("colourtweener")
        inst:AddComponent("lighttweener")

		inst.Light:Enable(true)
		inst.Light:SetRadius(TUNING.BREWINGHAT_RADIUS)
		inst.Light:SetIntensity(0.99999)
		inst.Light:SetFalloff(1)
        inst.Light:SetColour(255/255, 255/255, 255/255)
        
        inst.AnimState:SetBank("collapse")
        inst.AnimState:SetBuild("structure_collapse_fx")
        inst.AnimState:PlayAnimation("collapse_large")
        inst.Transform:SetScale(0.8, 0.8, 0.8)
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        inst.AnimState:SetFinalOffset(10)
		inst.AnimState:SetDeltaTimeMultiplier(0.85)
        inst.AnimState:SetMultColour(255/255, 124/255, 0/255, 1)

        inst.components.colourtweener:StartTween({ 128/255, 24/255, 209/255, 1}, 15 * FRAMES)

        inst.components.lighttweener:StartTween(inst.Light, nil, nil, nil, {0,0,0,0}, 0.5) -- Fade out over 0.5 seconds. Hit rage indicator

        inst.SoundEmitter:PlaySound("kidpotion/sound/explode")

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
        inst:DoTaskInTime(1, inst.Remove)

        return inst
    end

    return fn
end


return Prefab("brewinghat_explode", MakeExplosion(), assets)