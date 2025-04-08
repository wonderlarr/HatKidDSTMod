local SourceModifierList = require("util/sourcemodifierlist")

local function OnPonVal(self, val)
    self.inst.replica.madhatter:SetVal(val)
end

local function OnPonMax(self, max)
    self.inst.replica.madhatter:SetMax(max)

    self.inst:RemoveTag("madhatter_wallet_0")
    self.inst:RemoveTag("madhatter_wallet_1")
    self.inst:RemoveTag("madhatter_wallet_2")

    if max < self.upgradepath[2] then
        self.inst:AddTag("madhatter_wallet_0")
    elseif max < self.upgradepath[3] then
        self.inst:AddTag("madhatter_wallet_1")
    else
        self.inst:AddTag("madhatter_wallet_2")
    end
end

local function OnBadgeSlots(self, val)
    self.inst.replica.madhatter:SetBadgeSlots(val)

    self.inst:RemoveTag("badgeslots_0")
    self.inst:RemoveTag("badgeslots_1")
    self.inst:RemoveTag("badgeslots_2")
    self.inst:RemoveTag("badgeslots_3")

    self.inst:AddTag("badgeslots_" .. self.badgeslots)

    for i = 1, self.badgeslots do
        self.inst:AddTag("badgecrafter_" .. i)
    end
end

local function OnBadgeSlotsMax(self, max)
    self.inst.replica.madhatter:SetBadgeSlotsMax(max)
end

local function OnNoImage(self, val)
    self.inst.replica.madhatter:SetNoImage(val)
end

-- For entities with health
-- And workable entities for now, as they share enough values
local function OnAttack(inst, data)
    if inst:HasTag("madhatter_maxpons") then return end
    
    local target = data.target
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then

        if not target.components.lootdropper then
            target:AddComponent("lootdropper")
        end

        for i = 1, target.gpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 1)
        end

        for i = 1, target.cpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 0.5)
        end

        for i = 1, target.bpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon_boss", 1)
        end

        target:AddTag("madhatter_loot")
    end
end

-- For pickable entities
local function OnPick(inst, data)
    if inst:HasTag("madhatter_maxpons") then return end

    local target = data.object
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then
        
        for i = 1, target.gpons or 0, 1 do
            SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
        end

        for i = 1, target.cpons or 0, 1 do
            if math.random(0, 1) == 1 then
                SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
            end
        end
        target:AddTag("madhatter_loot")
    end
end

local function OnUnlockRecipe(inst, data)
    if inst:HasTag("madhatter_maxpons") then return end

    -- Players auto-learn recipes when they spawn. This prevents an award for that.
    if inst:GetTimeAlive() > 0.5 then
        local pon = SpawnPrefab("pon")
        pon.Transform:SetPosition(inst.Transform:GetWorldPosition())
        pon.award_count = 10
    end
end

local function OnDeath(inst, data)
    if inst and inst:IsValid() and inst.components.madhatter then
        inst.components.madhatter:SetVal(0)
    end
end

local MadHatter = Class(function(self, inst)
    self.inst = inst

    self.upgradepath = {300, 1500, 9999}
    self.max = 200
    self.val = 0


    
    -- Table of badges
    self.badges = {}

    self.badgeslots = 0
    self.badgeslotsmax = 3

    self.chainPos = 1
    self.noimage = false

    self.cd_mods = SourceModifierList(self.inst)

    self.inst:AddTag("madhatter")
    
    -- Badges need this tag to be equipped
    -- Tag doesn't need to stay though, so we can remove it after loading
    self.inst:AddTag("badgerestricted")
    self.inst:DoTaskInTime(0, function() self.inst:RemoveTag("badgerestricted") end)

    self.inst:ListenForEvent("onattackother", OnAttack)
    self.inst:ListenForEvent("working", OnAttack)
    self.inst:ListenForEvent("picksomething", OnPick)
    self.inst:ListenForEvent("unlockrecipe", OnUnlockRecipe)

    self.inst:ListenForEvent("death", OnDeath)
end,
nil, 
{
    max = OnPonMax,
    val = OnPonVal,
    badgeslots = OnBadgeSlots,
    badgeslotsmax = OnBadgeSlotsMax,
    noimage = OnNoImage,
})

function MadHatter:OnRemoveFromEntity()
    self.inst:RemoveTag("madhatter")
end

----------
-- Pons
----------

function MadHatter:DoDelta(delta)
    if not type(delta) == "number" then return false end

    local old = self.val

    -- greed badge hack
    if delta > 0 and self.inst:HasTag("badge_greed_active") and math.random() <= 0.5 then
        delta = delta * 2
    end

    self:SetVal(self.val + delta)

    local actualDelta = self.val - old
    
    self.inst:PushEvent("pondelta", { delta = actualDelta, val = self.val, max = self.max })
    return actualDelta
end

function MadHatter:SetVal(val)
    local newval = math.clamp(val, 0, self.max)
    self.val = newval

    local percent = self:GetPercent()
    if not self.inst:HasTag("madhatter_maxpons") and percent >= 1 then
        self.inst:AddTag("madhatter_maxpons")
    elseif self.inst:HasTag("madhatter_maxpons") and percent < 1 then
        self.inst:RemoveTag("madhatter_maxpons")
    end
end

function MadHatter:SetMax(max)
    local newmax = math.clamp(max, 0, 65535)
    self.max = newmax

    local percent = self:GetPercent()
    if not self.inst:HasTag("madhatter_maxpons") and percent >= 1 then
        self.inst:AddTag("madhatter_maxpons")
    elseif self.inst:HasTag("madhatter_maxpons") and percent < 1 then
        self.inst:RemoveTag("madhatter_maxpons")
    end
end

function MadHatter:GetPercent()
    return self.val / self.max
end

----------
-- HatMagic
----------

function MadHatter:GetCDMod()
    return self.cd_mods:Get() -- Using SourceModifierList
end

function MadHatter:GetDebugString()
	return "Pons: " .. tostring(self.val) .. " / " .. tostring(self.max)
end

----------
-- Badges
----------

function MadHatter:RegisterBadge(badge, num)
    self.badges[num] = badge
end

function MadHatter:UnregisterBadge(badge)
    for k, v in pairs(self.badges) do
        if v == badge then
            self.badges[k] = nil
        end
    end
end

function MadHatter:SetBadgeSlotsMax(max)
    self.badgeslotsmax = max
end

function MadHatter:SetBadgeSlots(val)
    self.badgeslots = val
end

function MadHatter:DoBadgeDelta(delta)
    self.badgeslots = math.clamp(self.badgeslots + delta, 0, self.badgeslotsmax)
end

function MadHatter:OnSave()
    return { ponmax = self.max, ponval = self.val, badgeslotsmax = self.badgeslotsmax, badgeslots = self.badgeslots }
end

function MadHatter:OnLoad(data)
    self.noimage = true
    if data.ponmax and self.max ~= data.ponmax then
        self.max = data.ponmax
        self:DoDelta(0)
    end
    if data.ponval and self.val ~= data.ponval then
        self.val = data.ponval
        self:DoDelta(0)
    end
    if data.badgeslotsmax and self.badgeslotsmax ~= data.badgeslotsmax then
        self:SetBadgeSlotsMax(data.badgeslotsmax)
    end
    if data.badgeslots and self.badgeslots ~= data.badgeslots then
        self:SetBadgeSlots(data.badgeslots)
    end

    -- HACK to make sure pon images dont lag the game on load
    self.inst:DoTaskInTime(0.5, function()
        self.noimage = false
    end)
end

return MadHatter