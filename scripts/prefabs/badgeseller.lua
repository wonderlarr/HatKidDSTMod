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

local function onturnon(inst)
    -- inst.AnimState:SetMultColour(1,0,1,1)
end

local function onturnoff(inst)
    -- inst.AnimState:SetMultColour(1,1,1,1)
end

local function StartSelling(inst, doer, recipe)
    -- print(inst)
    -- print(doer)
    -- if recipe and type(recipe) == "table" then
    --     dumptable(recipe)
    -- end
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

    -- MakeCharacterPhysics(inst, 50, .5)
    MakeObstaclePhysics(inst, 0.5, .5)

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

    -- if not TheNet:IsDedicated() then
    --     inst:AddComponent("pointofinterest")
    --     inst.components.pointofinterest:SetHeight(70)
    -- end

    inst:AddComponent("prototyper")
    inst.components.prototyper.onturnon = onturnon
    inst.components.prototyper.onturnoff = onturnoff
    inst.components.prototyper.onactivate = StartSelling
    inst.components.prototyper.trees = TUNING.PROTOTYPER_TREES.BADGESELLER_ONE


    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end


    inst:AddComponent("locomotor")

    inst:AddComponent("inspectable")

    TheWorld:ListenForEvent("badgeseller_despawn", function()
        -- inst.AnimState:PlayAnimation("emoteXL_waving1")
        -- inst.AnimState:PushAnimation("jump_pre")
        -- inst.AnimState:PushAnimation("jump")

        -- local ct = 1

        -- inst:ListenForEvent("animover", function()
        --     if ct >= 3 then
        --         inst:Remove()
        --     else
        --         ct = ct + 1
        --     end
        -- end)
        inst:Remove()
    end)

    return inst
end

return Prefab("badgeseller", fn, assets, prefabs)