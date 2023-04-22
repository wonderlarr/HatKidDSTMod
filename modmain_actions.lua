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

DEACTIVATE_HAT_MAGIC.priority = 1
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

-- changes
--[[
    1.2.0b1
    * The Brewing Hat, Ice Hat, Dweller's Mask, and Time Stop Hat now use a new homemade component for activation and cooldowns called "hatmagic". Should be more consistent than the old, janky system.
    Because of the above change, you may notice differences in how those hats feel and work, however it shouldn't be too drastic.
    
    * Added compatibility with Insight (Show Me+)
    * Attempted to make the mod configuration options more consistent.
    * Rebalanced a couple things while doing that

    Brewing Hat:
        * Adjusted the names and positions of some existing entries.
        * New Entry: Uses Per Fuel. This controls how many uses 1 unit of fuel is worth.
        * Sanity Threshhold (3 >> 5)
    Ice Hat:
        * Adjusted the names and positions of some existing entries.
        * New Entry: Uses Per Fuel. This controls how many uses 1 unit of fuel is worth.
        * New Entry: Sanity Threshhold. This controls how much sanity is required to activate the hat.
        * New Entry: Explosion Damage. This controlshow much damage the ice explosion deals to all enemies in the radius.
        * Explosion Damage (was hard coded before) (18 >> 27)
        * Max Uses (2 >> 3)
    Dweller's Mask:
        * Adjusted the names and positions of some existing entries.
    Time Stop Hat:
        * Adjusted the names and positions of some existing entries.
        * New Entry: Seconds Per Fuel. This controls how many seconds of use 1 unity of fuel is worth.
        * New Entry: Sanity Threshhold. This controls how much sanity is required to activate the hat.
]]