-- Some info

-- Events you can listen for: `magicactivated` `magicdeactivated` `magicready`

local SourceModifierList = require("util/sourcemodifierlist")

local HatMagic = Class(function(self, inst)
    self.inst = inst
    self.owner = nil -- current player using the item, might be nil if unequipped

    -- Config
    self.instant = true -- whether or not to instantly deactive magic after activation. set to false for timed abilities.
    self.activetime = 5 -- how long activetime based magic can stay active at most. 0 or less will be infinite.
    -- self.activetimemods = SourceModifierList(self.inst)
    self.cooldowntime = 10 -- how long magic will cool down before it can be used again
    -- self.cooldowntimemods = SourceModifierList(self.inst)

    -- Control
    self.useable = true -- setting this to false will prevent activation AND deactivation, in case you need that for some reason.
    
    -- Status
    self.isactive = false -- is true while the item is active
    self.oncooldown = false -- is true while the item is on cooldown
    self.looping = false -- is true if there is an active looping function

    -- Storage
    self.fn_ready = nil -- runs when the item's cooldown is finished
    self.fn_activate = nil -- runs when the item is activated
    self.fn_loop = nil -- runs ~30 times a second via component update while the item is active
    self.fn_deactivate = nil -- runs when the item is deactivated
    self.fn_test = nil -- check function. whatever function you feed in must return true to allow activation. leaving as nil is okay too.

    self.inst:AddTag("hatmagic")
    -- self.inst:AddTag("rechargeable_bonus") -- makes rechargeable green
    self.inst:AddComponent("rechargeable")

    self.inst:ListenForEvent("equipped", function(inst, data)
        if data.owner then
            self.owner = data.owner
        end
    end)

    self.inst:ListenForEvent("unequipped", function(inst, data)
        self.owner = nil
        self:Deactivate()
    end)
end)

-- ---------------- --
-- Activation Stuff --
-- ---------------- --

function HatMagic:Activate()
    if self:CanActivate() then
        self.isactive = true
        self.inst:AddTag("inuse")

        if self.fn_activate ~= nil then
            self.fn_activate(self.inst)
        end

        if not self.instant then
            self:StartLooping()
        end

        if self.instant then
            self:Deactivate()
        else
            if self.activetime > 0 then
                self:DoActiveTime(self.activetime)
            else
                -- temporarily disabled because insight crashes
                -- self:DoActiveTime(math.huge)
            end
        end

        self.inst:PushEvent("magicactivated")
        if self.owner then
            self.owner:PushEvent("magicactivated", {inst = self.inst})
        end
    else
        local owner = self.inst.components.inventoryitem:GetGrandOwner()
        owner.components.talker:Say("My hat won't activate!") -- TODO fix hardcoded string
    end
end

-- Returns true if able to activate magic.
function HatMagic:CanActivate()
    return self.useable and not self.isactive and not self.oncooldown and (self.fn_test == nil or self.fn_test(self.inst) == true)
end

function HatMagic:Deactivate()
    if self:CanDeactivate() then
        self.isactive = false
        self.inst:RemoveTag("inuse")

        self:DoCooldown()

        if self.fn_deactivate ~= nil then
            self.fn_deactivate(self.inst)
        end

        if not self.instant then
            self:StopLooping()
        end

        self.inst:PushEvent("magicdeactivated")
        if self.owner then
            self.owner:PushEvent("magicdeactivated", {inst = self.inst})
        end
    end
end

-- Only returns true if able to actually deactivate magic
function HatMagic:CanDeactivate()
    return self.useable and self.isactive and not self.oncooldown
end

-- Toggles the state of magic. Won't do anything if hat is on cooldown.
function HatMagic:Use()
    if self:CanDeactivate() then
        self:Deactivate()
    else
        self:Activate()
    end
end

-- ------------------ --
-- Rechargeable Stuff --
-- ------------------ --

-- Activates cooldown. MIGHT break things if magic isn't deactivated first.
function HatMagic:DoCooldown(override_time)
    local owner = self.inst.components.inventoryitem:GetGrandOwner()
    -- You can pass in an override time to force a specific cooldown if needed for some reason.
    local cooldowntime = (override_time or self.cooldowntime or 0)

    
    if cooldowntime > 0 then
        local function OnCharged()
            self:OnCooldownFinished()
        end

        self.inst.components.rechargeable:SetOnChargedFn(OnCharged)
        self.inst.components.rechargeable:Discharge(cooldowntime)
        self.inst.components.rechargeable:SetPercent(owner.components.madhatter and math.abs(owner.components.madhatter:GetCDMod() - 1) or 0)
        
        self.oncooldown = true
        self.inst:AddTag("oncooldown")
    end
end

function HatMagic:OnCooldownFinished()
    self.oncooldown = false
    self.inst:RemoveTag("oncooldown")

    if self.fn_ready ~= nil then
        self.fn_ready(self.inst)
    end

    self.inst:PushEvent("magicready")
    if self.owner then
        self.owner:PushEvent("magicready", {inst = self.inst})
    end
end

-- Sets the active time visual. Not super useful to call this manually at the moment.
function HatMagic:DoActiveTime(override_time)
    -- You can pass in an override time to force a specific active time if needed for some reason.
    local activetime = override_time or self.activetime or 0

    if activetime > 0 then
        -- Had to do this because lua is dynamically typed...
        local function OnCharged()
            self:OnActiveTimeFinished()
        end

        self.inst.components.rechargeable:SetOnChargedFn(OnCharged) -- spent forever figuring out that OnCharged() and OnCharged are two different things in this language
        self.inst.components.rechargeable:Discharge(activetime)
    end
end

function HatMagic:OnActiveTimeFinished()
    self:Deactivate()
end

-- ------- --
-- Effects --
-- ------- --

function HatMagic:SetReadyFn(fn)
    self.fn_ready = fn
end

function HatMagic:SetActivateFn(fn)
    self.fn_activate = fn
end

function HatMagic:SetLoopFn(fn)
    self.fn_loop = fn
end

function HatMagic:SetDeactivateFn(fn)
    self.fn_deactivate = fn
end

function HatMagic:SetTestFn(fn)
    self.fn_test = fn
end

-- -------- --
-- Generics --
-- -------- --

function HatMagic:StartLooping()
    if not self.looping and self.fn_loop ~= nil then
        self.inst:StartUpdatingComponent(self)
        self.looping = true
    end
end

function HatMagic:StopLooping()
    if self.looping then
        self.inst:StopUpdatingComponent(self)
        self.looping = false
    end
end

function HatMagic:OnUpdate(dt)
    self.fn_loop(self.inst, dt)
end

function HatMagic:OnRemoveFromEntity()
    self.inst:RemoveTag("hatmagic")
    self.inst:RemoveTag("oncooldown")
    self.inst:RemoveTag("inuse")
end

function HatMagic:GetDebugString()
    local status = self.isactive and "Active" or "Inactive"
    local cooldown = self.oncooldown and "On Cooldown" or "Cooldown Ready"
    
    local ownerStr = "No Owner"
    if self.owner then
        ownerStr = "Owner: " .. tostring(self.owner)
    end
    
    local result = string.format("Status: %s\nCooldown: %s\n%s", status, cooldown, ownerStr)
    
    return result
end


return HatMagic
