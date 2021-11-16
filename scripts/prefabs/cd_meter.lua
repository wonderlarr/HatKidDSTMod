require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/cd_meter.zip"),
}

local prefabs =
{
}

local function ten(inst)
	local seconds = 60
	local mult = 1 / seconds
	
	inst:DoTaskInTime(0, function()
		inst.AnimState:SetDeltaTimeMultiplier(mult)
		inst.AnimState:PlayAnimation("refill")
	end)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("cd_meter")
    inst.AnimState:SetBuild("cd_meter")
	inst.AnimState:SetScale(3,3)
	
	inst.Transform:SetRotation(45/360)
	
	inst.AnimState:SetDeltaTimeMultiplier(1 / 60)
	inst.AnimState:PlayAnimation("refill")
	
	inst:ListenForEvent("animover", ten, inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    MakeHauntableWork(inst)

    return inst
end

return Prefab("cd_meter", fn, assets, prefabs)
