-- Activate Magic

local ACTIVATE_HAT_MAGIC = AddAction("ACTIVATE_HAT_MAGIC", "Activate", function(act)
    if act.invobject.components.hatmagic then
        act.invobject.components.hatmagic:Activate()
        return true
    end
end)

ACTIVATE_HAT_MAGIC.priority = 1.1
ACTIVATE_HAT_MAGIC.instant = true

-- Deactivate Magic

local DEACTIVATE_HAT_MAGIC = AddAction("DEACTIVATE_HAT_MAGIC", "Deactivate", function(act)
    if act.invobject.components.hatmagic then
        act.invobject.components.hatmagic:Deactivate()
        return true
    end
end)

DEACTIVATE_HAT_MAGIC.priority = 1.1
DEACTIVATE_HAT_MAGIC.instant = true

-- Component action (both)

AddComponentAction("INVENTORY", "hatmagic", function(inst, doer, actions, right)
    if not inst:HasTag("oncooldown") and
    inst.replica.equippable ~= nil and
    inst.replica.equippable:IsEquipped() and
    doer.replica.inventory ~= nil and
    doer.replica.inventory:IsOpenedBy(doer) then
        if inst:HasTag("inuse") then
            table.insert(actions, GLOBAL.ACTIONS.DEACTIVATE_HAT_MAGIC)
        else
            table.insert(actions, GLOBAL.ACTIONS.ACTIVATE_HAT_MAGIC)
        end
    end
end)

-- Activate inv useable items
local ACTIVATE_INV_USEABLE = AddAction("ACTIVATE_INV_USEABLE", "Use", function(act)
    if act.invobject.components.invuseable and act.invobject.components.invuseable.onuse_fn then
        act.invobject.components.invuseable:OnUse()
        return true
    end
end)

ACTIVATE_INV_USEABLE.priority = 2
-- ACTIVATE_INV_USEABLE.instant = true

AddComponentAction("INVENTORY", "invuseable", function(inst, doer, actions, right)
    if doer.replica.inventory ~= nil and
    doer.replica.inventory:IsOpenedBy(doer) then
        table.insert(actions, GLOBAL.ACTIONS.ACTIVATE_INV_USEABLE)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ACTIVATE_INV_USEABLE,
function(inst)
	return "domediumaction"
end))

--Equip badges
local EQUIP_BADGE = AddAction("EQUIP_BADGE", "Equip", function(act)
    if act.invobject.components.badge and not act.invobject.components.equippable.isequipped then
        act.invobject.components.badge:Equip(act.doer)
        return true
    end
end)

EQUIP_BADGE.priority = 2.1

--Unequip badges
local UNEQUIP_BADGE = AddAction("UNEQUIP_BADGE", "Unequip", function(act)
    if act.invobject.components.badge and act.invobject.components.equippable.isequipped then
        act.invobject.components.badge:Unequip(act.doer)
        return true
    end
end)

UNEQUIP_BADGE.priority = 2

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.EQUIP_BADGE,
function(inst)
	return "domediumaction"
end))

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.UNEQUIP_BADGE,
function(inst)
	return "domediumaction"
end))

AddComponentAction("INVENTORY", "badge", function(inst, doer, actions, right)
    if inst.replica.equippable ~= nil and
    doer.replica.inventory ~= nil and
    doer.replica.inventory:IsOpenedBy(doer) then
        if inst.replica.equippable:IsEquipped() then
            table.insert(actions, GLOBAL.ACTIONS.UNEQUIP_BADGE)
        else
            table.insert(actions, GLOBAL.ACTIONS.EQUIP_BADGE)
        end
    end
end)