local assets =
{
    Asset("ANIM", "anim/backpack.zip"),
    Asset("ANIM", "anim/swap_krampus_sack.zip"),
    Asset("ANIM", "anim/ui_hatpack_3x2.zip")
}

local function onequip(inst, owner)
    inst.components.container:Open(owner)
end

local function onunequip(inst, owner)
    inst.components.container:Close(owner)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("backpack1")
    inst.AnimState:SetBuild("swap_krampus_sack")
    inst.AnimState:PlayAnimation("anim")
    inst.AnimState:SetMultColour(0,0,1,1)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst) 
            inst.replica.container:WidgetSetup("hatpack") 
        end

        return inst
    end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = false

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BEARD -- yes, this DOES technically mean hat kid has a beard.
    inst.components.equippable:SetPreventUnequipping(false)
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("hatpack")
    inst.components.container.skipopensnd = true
    inst.components.container.skipclosesnd = true
    inst.components.container.stay_open_on_hide = true

    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("hatpack", fn, assets)
