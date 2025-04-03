local assets =
{
    Asset("ANIM", "anim/frexplosion.zip")
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
		
		inst.AnimState:SetScale(0.6, 0.6, 0.6)
        inst.AnimState:SetBank("frexplosion")
        inst.AnimState:SetBuild("frexplosion")
        inst.AnimState:PlayAnimation("explode")
		inst.AnimState:SetDeltaTimeMultiplier(2/3)
        
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


return Prefab("hatshatter2", MakeExplosion(), assets)