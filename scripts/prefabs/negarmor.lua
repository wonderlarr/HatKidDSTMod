local assets =
{
    Asset("ANIM", "anim/armor_wood.zip"),
}

local function OnBlocked(owner)
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end

local function OnDamaged(inst, data)
    local owner = inst.components.inventoryitem:GetGrandOwner() -- Sets the varaible owner as the armors owner/wearer

    if owner and owner.components.health and owner.components.combat then -- This ensures we won't crash by checking if the things we're accessing exist
        owner.components.health:DoDelta(-data - 20) -- data is the variable for how much damage the armor took, 
                                                    -- So we make it negative, then take away an additional 20 and apply it to the players health
        owner.components.combat:GetAttacked() -- This ensures the player still goes into hitstun, and the damage feels normal.
    end
end

local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()

    inst:ListenForEvent("blocked", OnBlocked, owner)
    inst:ListenForEvent("armordamaged", OnDamaged, inst)
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")

    inst:RemoveEventCallback("blocked", OnBlocked, owner)
    inst:RemoveEventCallback("armordamaged", OnDamaged, inst)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("armor_wood")
    inst.AnimState:SetBuild("armor_wood")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("wood")

    inst.foleysound = "dontstarve/movement/foley/logarmour"
    
    local swap_data = {bank = "armor_wood", anim = "anim"}

    MakeInventoryFloatable(inst, "small", 0.2, 0.80, nil, nil, swap_data)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

    MakeSmallPropagator(inst)

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMORWOOD, 1)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("negarmor", fn, assets)