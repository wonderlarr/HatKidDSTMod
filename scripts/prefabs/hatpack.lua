local assets =
{
    Asset("ANIM", "anim/ui_hatpack_3x2.zip"),
    Asset("ANIM", "anim/hatpack.zip"),

    Asset("ATLAS", "images/inventoryimages/hatpack.xml"),
    Asset("IMAGE", "images/inventoryimages/hatpack.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/hatpack.xml", "hatpack.tex")

local function onequip(inst, owner)
    inst.components.container:Open(owner)
end

local function onunequip(inst, owner)
    inst.components.container:Close(owner)
    -- inst.components.container:DropEverything() 
end

local function OnAlien(inst)
    inst.components.container:Open(owner)
end

local function OnDropped(inst)
    -- inst.components.container:DropEverything()

    -- inst:Remove()
end

local function fn_common()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hatpack")
    inst.AnimState:SetBuild("hatpack")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("badgepack")

    return inst
end

local function fn_master(inst, widgetsetupname)
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BEARD -- "my god what are you doing?"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    -- inst.components.equippable:SetPreventUnequipping(true)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup(widgetsetupname)
    -- inst.components.container.skipopensnd = true
    -- inst.components.container.skipclosesnd = true
    inst.components.container.stay_open_on_hide = true

    MakeHauntableLaunchAndDropFirstItem(inst)

	inst:ListenForEvent("ms_respawnedfromghost", OnAlien)

    return inst
end

local function fn()
    local inst = fn_common()

    inst:AddTag("hatpack")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)  
            inst.replica.container:WidgetSetup("hatpack")
        end

        return inst
    end

    fn_master(inst, "hatpack")

    return inst
end

local function fn1()
    local inst = fn_common()

    inst:AddTag("hatpack_1")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)  
            inst.replica.container:WidgetSetup("hatpack_1")
        end

        return inst
    end

    fn_master(inst, "hatpack_1")

    return inst
end

local function fn2()
    local inst = fn_common()

    inst:AddTag("hatpack_2")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)  
            inst.replica.container:WidgetSetup("hatpack_2")
        end

        return inst
    end

    fn_master(inst, "hatpack_2")

    return inst
end

local function fn3()
    local inst = fn_common()

    inst:AddTag("hatpack_3")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)  
            inst.replica.container:WidgetSetup("hatpack_3")
        end

        return inst
    end

    fn_master(inst, "hatpack_3")

    return inst
end

return Prefab("hatpack", fn, assets)

-- return Prefab("hatpack_1", fn1, assets),
--     Prefab("hatpack_2", fn2, assets),
--     Prefab("hatpack_3", fn3, assets)
