local Vector3 = GLOBAL.Vector3
local containers = GLOBAL.require("containers")
local params = containers.params

-- controls the order hats are allowed in for the hatpack
local hatlist = {
    "kidhat",
    "sprinthat",
    "brewinghat",
    "polarhat",
    "dwellermask",
    "timestophat"
}

local scale = 70

params.hatpack_1 =
{
    widget =
    {
        slotpos = { }, -- we have to make an empty table or the slot position function gets angry
        slotbg =
        {
            { image = "slotbg_kidhat.tex", atlas = "images/gui/slotbg_kidhat.xml" },
            { image = "slotbg_sprinthat.tex", atlas = "images/gui/slotbg_sprinthat.xml" },
            { image = "slotbg_brewinghat.tex", atlas = "images/gui/slotbg_brewinghat.xml" },
            { image = "slotbg_polarhat.tex", atlas = "images/gui/slotbg_polarhat.xml" },
            { image = "slotbg_dwellermask.tex", atlas = "images/gui/slotbg_dwellermask.xml" },
            { image = "slotbg_timestophat.tex", atlas = "images/gui/slotbg_timestophat.xml" },
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
        },
        animbank = "ui_hatpack_3x2",
        animbuild = "ui_hatpack_3x2",
        pos = Vector3(-82, 108, 0),
        bottom_align_tip = -100,
    },
    type = "side_inv_behind",
    acceptsstacks = false,
    issidewidget = true,
}

for y = 1, -1, -1 do
    for x = 0, 2 do
        if y == -1 and x > 0 then break end
        table.insert(params.hatpack_1.widget.slotpos, Vector3(scale * x - scale * 2 + scale, scale * y - scale * 2 + 120, 0))
    end
end

function params.hatpack_1.itemtestfn(container, item, slot)
    return item:HasTag("hatkidhat") and item.prefab == hatlist[slot] or slot > 6 and item:HasTag("badge") -- and not container:HasItemWithTag(item.prefab, 1)
end

params.hatpack_2 =
{
    widget =
    {
        slotpos = { }, -- we have to make an empty table or the slot position function gets angry
        slotbg =
        {
            { image = "slotbg_kidhat.tex", atlas = "images/gui/slotbg_kidhat.xml" },
            { image = "slotbg_sprinthat.tex", atlas = "images/gui/slotbg_sprinthat.xml" },
            { image = "slotbg_brewinghat.tex", atlas = "images/gui/slotbg_brewinghat.xml" },
            { image = "slotbg_polarhat.tex", atlas = "images/gui/slotbg_polarhat.xml" },
            { image = "slotbg_dwellermask.tex", atlas = "images/gui/slotbg_dwellermask.xml" },
            { image = "slotbg_timestophat.tex", atlas = "images/gui/slotbg_timestophat.xml" },
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
        },
        animbank = "ui_hatpack_3x2",
        animbuild = "ui_hatpack_3x2",
        pos = Vector3(-82, 108, 0),
        bottom_align_tip = -100,
    },
    type = "side_inv_behind",
    acceptsstacks = false,
    issidewidget = true,
}

for y = 1, -1, -1 do
    for x = 0, 2 do
        if y == -1 and x > 1 then break end
        table.insert(params.hatpack_2.widget.slotpos, Vector3(scale * x - scale * 2 + scale, scale * y - scale * 2 + 120, 0))
    end
end

function params.hatpack_2.itemtestfn(container, item, slot)
    return item:HasTag("hatkidhat") and item.prefab == hatlist[slot] or slot > 6 and item:HasTag("badge") and not container:HasItemWithTag(item.prefab, 1)
end

params.hatpack_3 =
{
    widget =
    {
        slotpos = { }, -- we have to make an empty table or the slot position function gets angry
        slotbg =
        {
            { image = "slotbg_kidhat.tex", atlas = "images/gui/slotbg_kidhat.xml" },
            { image = "slotbg_sprinthat.tex", atlas = "images/gui/slotbg_sprinthat.xml" },
            { image = "slotbg_brewinghat.tex", atlas = "images/gui/slotbg_brewinghat.xml" },
            { image = "slotbg_polarhat.tex", atlas = "images/gui/slotbg_polarhat.xml" },
            { image = "slotbg_dwellermask.tex", atlas = "images/gui/slotbg_dwellermask.xml" },
            { image = "slotbg_timestophat.tex", atlas = "images/gui/slotbg_timestophat.xml" },
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
            { image = "slotbg_badge.tex", atlas = "images/gui/slotbg_badge.xml"},
        },
        animbank = "ui_hatpack_3x3",
        animbuild = "ui_hatpack_3x3",
        pos = Vector3(-82, 108, 0),
        bottom_align_tip = -100,
    },
    usespecificslotsforitems = true,
    acceptsstacks = false,
    type = "side_inv_behind",
    issidewidget = true,
}

for y = 1, -1, -1 do
    for x = 0, 2 do
        table.insert(params.hatpack_3.widget.slotpos, Vector3(scale * x - scale * 2 + scale, scale * y - scale * 2 + 120, 0))
    end
end

function params.hatpack_3.itemtestfn(container, item, slot)
    return slot == nil and (item:HasTag("hatkidhat") or item:HasTag("badge") and not container:HasItemWithTag(item.prefab, 1)) or 
    item:HasTag("hatkidhat") and item.prefab == hatlist[slot] or 
    slot and slot > 6 and item:HasTag("badge") and not container:HasItemWithTag(item.prefab, 1) -- this depends on each badge having its prefab name as a tag as well
end



-- Mod compatibility checker by rezecib
-- https://steamcommunity.com/profiles/76561198025931302
local CHECK_MODS = {
    ["workshop-376333686"] = "COMBINED_STATUS",
    ["CombinedStatus"] = "COMBINED_STATUS",
}

local HAS_MOD = {}
--If the mod is already loaded at this point
for mod_name, key in pairs(CHECK_MODS) do
    HAS_MOD[key] = HAS_MOD[key] or (GLOBAL.KnownModIndex:IsModEnabled(mod_name) and mod_name)
end

--If the mod hasn't loaded yet
for k, v in pairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    local mod_type = CHECK_MODS[v]
    if mod_type then
        HAS_MOD[mod_type] = v
    end
end

-- Make PonBadge appear on the UI if we have the madhatter component
local PonBadge = require("widgets/ponbadge")
AddClassPostConstruct("widgets/statusdisplays", function(self)
    if not self.owner or not self.owner:HasTag("madhatter") then return end

    self.ponbadge = self:AddChild(PonBadge(self.owner))
    self.ponbadge:SetPosition(-120, 20)
    self.ponbadge:SetPercent(0, 100)

    if HAS_MOD.COMBINED_STATUS then
        self.ponbadge:SetPosition(-62, -52)
    end

    local function OnPonDelta(owner, data) 
        local repDelta = owner.replica.madhatter:GetPercent() - self.ponbadge.percent
        self.ponbadge:SetPercent(owner.replica.madhatter:GetPercent(), owner.replica.madhatter:GetMax())

        if repDelta > 0 and not owner.replica.madhatter:GetNoImage() then
            local start_pos = Vector3(TheSim:GetScreenPos(owner:GetPosition():Get()))
            local dest_pos = self.ponbadge:GetWorldPosition()

            -- TODO maybe optimize this so we don't make a new image every time we collect a pon
            local PonImage = Image("images/inventoryimages/pon.xml", "pon.tex") 
            PonImage:SetScale(0.8, 0.8)
            PonImage:MoveTo(start_pos, dest_pos, .3, function() PonImage:Kill() end)
        end
    end 

    self.inst:ListenForEvent("ponval_dirty", OnPonDelta, self.owner)
    self.inst:ListenForEvent("ponmax_dirty", OnPonDelta, self.owner)

    -- hook into setghostmode to enable and disable badge on death
    local _SetGhostMode = self.SetGhostMode

    self.SetGhostMode = function(self, ghostmode)
        -- don't force boolean on self.ghostmode since we're hooking into the function
        if ghostmode then
            self.ponbadge:Hide()
        else
            self.ponbadge:Show()
        end

        return _SetGhostMode(self, ghostmode)
    end
end)

local UIAnim = require "widgets/uianim"
AddClassPostConstruct("widgets/healthbadge", function(self)
    if self.owner and self.owner:HasTag("hatkid") then -- we must exist and be hat kid

        -- use Angela's meter
        self.anim:GetAnimState():SetBank("status_clockhealth")
        self.anim:GetAnimState():SetBuild("status_clockhealth")
        self.anim:GetAnimState():PlayAnimation("anim")
        self.anim:GetAnimState():SetMultColour(1,1,1,1) -- Remove red tint

        -- make a new health penalty meter so we can be circular
        self.topperanim2 = self.underNumber:AddChild(UIAnim())
        self.topperanim2:GetAnimState():SetBank( "status_meter_circle")
        self.topperanim2:GetAnimState():SetBuild("status_meter_circle")
        self.topperanim2:GetAnimState():PlayAnimation("meter")
        self.topperanim2:GetAnimState():SetMultColour(0,0,0,1)
        self.topperanim2:GetAnimState():AnimateWhilePaused(false)
        self.topperanim2:SetClickable(false)

        -- add years hand, it moves in SetPercent
        self.year_hand = self.underNumber:AddChild(UIAnim())
        self.year_hand:GetAnimState():SetBank("status_clockhealth")
        self.year_hand:GetAnimState():SetBuild("status_clockhealth")
        self.year_hand:GetAnimState():PlayAnimation("year")
        self.year_hand:GetAnimState():AnimateWhilePaused(false)

        -- hide heart icon
        if self.circleframe then
            self.circleframe:GetAnimState():ClearOverrideSymbol("icon")
        end

        -- hide default penalty
        self.topperanim:Hide()

        self.sanityarrow:MoveToFront()

        -- hook into setpercent so year hand can move properly
        -- WandaAgeBadge.lua has it's own SetPercent function, but we have to hook since we're not actually an age widget
        local _SetPercent = self.SetPercent

        self.SetPercent = function(self, val, max, penaltypercent)
            self.year_hand:SetRotation( GLOBAL.Lerp(0, -360, val) )
            penaltypercent = penaltypercent or 0
            self.topperanim2:GetAnimState():SetPercent("meter", penaltypercent)

            return _SetPercent(self, val, max, penaltypercent)
        end
    end
end)

-- Push "badgeseller" locally to trigger
-- local BadgeToast = require("widgets/badgetoast")
-- AddClassPostConstruct("widgets/controls", function(self)
--     if not self.owner or self.owner.prefab ~= "hatkid" then return end

--     self.badgetoast_notification = self.topleft_root:AddChild(BadgeToast(self.owner, self))
--     self.badgetoast_notification:SetPosition(315, 150, 0)
-- end)

-- Reward pons for a lot of things
AddPrefabPostInitAny(function(inst)
    -- For normal mobs, like hounds, rabbits, or bosses
    if inst.components.health then
        if inst:HasTag("epic") then
            inst.gpons = 50 -- guarenteed pons
            inst.cpons = 50 -- 50% pons
        elseif inst:HasTag("smallcreature") then
            inst.gpons = 0
            inst.cpons = 1
        elseif inst:HasTag("hostile") then
            inst.gpons = 1
            inst.cpons = 2
        else
            -- not a boss, small, or hostile
            inst.gpons = 0
            inst.cpons = 3
        end
    -- For workable entities, like rocks and trees
    elseif inst.components.workable then
        inst.gpons = 0
        inst.cpons = inst.components.workable.workleft or 0
    -- For pickable entities, like mushrooms and bushes
    elseif inst.components.pickable then
        inst.cpons = 1
        inst.gpons = 0
    end
end)

-- For workable entities, like rocks and trees

-- Console helper, spawns all hats under cursor
GLOBAL.c_makehats = function()
    local x, y, z = GLOBAL.ConsoleWorldPosition():Get()

	local inst = GLOBAL.SpawnPrefab("kidhat")
	inst.Transform:SetPosition(x, y, z)
    local inst = GLOBAL.SpawnPrefab("sprinthat")
	inst.Transform:SetPosition(x, y, z)
    local inst = GLOBAL.SpawnPrefab("brewinghat")
	inst.Transform:SetPosition(x, y, z)
    local inst = GLOBAL.SpawnPrefab("polarhat")
	inst.Transform:SetPosition(x, y, z)
    local inst = GLOBAL.SpawnPrefab("dwellermask")
	inst.Transform:SetPosition(x, y, z)
    local inst = GLOBAL.SpawnPrefab("timestophat")
	inst.Transform:SetPosition(x, y, z)
end

-- Change Ageless Watch if Hat Kid is using it
AddPrefabPostInit("pocketwatch_heal", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end -- clients don't like this at all
    local old_spell = inst.components.pocketwatch.DoCastSpell

    inst.components.pocketwatch.DoCastSpell = function(inst, doer)
        if doer.prefab == "hatkid" then
            local health = doer.components.health
            if health ~= nil and not health:IsDead() then
                -- doer.components.oldager:StopDamageOverTime() -- Hat Kid doesn't have this component, the game gets mad if we call this
                health:DoDelta(TUNING.POCKETWATCH_HEAL_HEALING, true, inst.prefab)
        
                local fx = SpawnPrefab((doer.components.rider ~= nil and doer.components.rider:IsRiding()) and "pocketwatch_heal_fx_mount" or "pocketwatch_heal_fx")
                fx.entity:SetParent(doer.entity)
        
                inst.components.rechargeable:Discharge(TUNING.POCKETWATCH_HEAL_COOLDOWN)
                return true
            end
        else
            old_spell(inst, doer)
        end
    end
end)

AddReplicableComponent("madhatter")

local CHARACTER_INGREDIENT = GLOBAL.CHARACTER_INGREDIENT

AddClassPostConstruct("components/builder_replica", function(self)
    local _HasCharacterIngredient = self.HasCharacterIngredient

    self.HasCharacterIngredient = function(self, ingredient)
        if self.inst.components.builder ~= nil then
            return self.inst.components.builder:HasCharacterIngredient(ingredient)
        elseif ingredient.type == CHARACTER_INGREDIENT.PON then
            local madhatter = self.inst.replica.madhatter
            if madhatter ~= nil then
                -- no need to round, we should never be at decimal values under normal conditions
                local current = madhatter:GetVal()
                return current >= ingredient.amount, current
            end
        end

        return _HasCharacterIngredient(self, ingredient)
    end
end)

AddClassPostConstruct("components/builder", function(self)
    -- RemoveIngredients
    local _RemoveIngredients = self.RemoveIngredients

    self.RemoveIngredients = function(self, ingredients, recname)
        local recipe = GLOBAL.AllRecipes[recname]
        if recipe then
            for k,v in pairs(recipe.character_ingredients) do
                if v.type == CHARACTER_INGREDIENT.PON then
                    self.inst.components.madhatter:DoDelta(-v.amount)
                end
            end
        end
        return _RemoveIngredients(self, ingredients, recname)
    end

    -- HasCharacterIngredient
    local _HasCharacterIngredient = self.HasCharacterIngredient

    self.HasCharacterIngredient = function(self, ingredient)
        if ingredient.type == CHARACTER_INGREDIENT.PON and self.inst.components.madhatter ~= nil then
            local current = self.inst.components.madhatter.val
            return current >= ingredient.amount, current
        end

        return _HasCharacterIngredient(self, ingredient)
    end
end)

-- Add custom EQUIPSLOTS
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
EQUIPSLOTS.BADGE1 = "badge1"
EQUIPSLOTS.BADGE2 = "badge2"
EQUIPSLOTS.BADGE3 = "badge3"

AddClassPostConstruct("widgets/inventorybar", function(self)
    -- Add functionality here so we can conveniently use it in madhatter.lua
    -- You probably shouldn't use this to remove default slots
    function self:RemoveEquipSlot(slot)
        for k, v in pairs(self.equipslotinfo) do
            if v.slot == slot then
                self.equipslotinfo[k] = nil
                self.rebuild_pending = true
                break
            end
        end
    end
    
    -- These should be compatible with most things that change scale, although I would prefer to 
    -- not do it this way, as GetLooseScale is really weird

    -- hijack Rebuild
    local _Rebuild = self.Rebuild

    self.Rebuild = function(self)
        _Rebuild(self)
        if not self.owner:HasTag("madhatter") then return end
        
        -- i truncate the return val here because it returns the x y z as one number value for some reason
        local bg = math.floor(self.bg:GetLooseScale()*1000)/1000 
        local bgcover = math.floor(self.bgcover:GetLooseScale()*1000)/1000

        local badgeval = self.owner.replica.madhatter and self.owner.replica.madhatter:GetBadgeSlots() or 0
        local slotscale = 0.06 -- helper number
        self.bg:SetScale(bg + slotscale * badgeval, 1, 1)
        self.bgcover:SetScale(bgcover + slotscale * badgeval, 1, 1)
    end

    local badge_equipslots = {
        EQUIPSLOTS.BADGE1,
        EQUIPSLOTS.BADGE2,
        EQUIPSLOTS.BADGE3,
    }

    local function OnBadgeSlots(inst)
        print("OnBadgeSlots")
        if not self.owner:HasTag("madhatter") then return end
        local badgeval = self.owner.replica.madhatter:GetBadgeSlots()
        local badgeslots_inv = 0
        for k, v in pairs(self.equipslotinfo) do
            if string.find(v.slot, "badge") then
                badgeslots_inv = badgeslots_inv + 1
            end
        end

        local delta = badgeval - badgeslots_inv
        if delta > 0 then
            for i = 1, delta do
                if badgeslots_inv + i > 3 then break end -- prevent overflow
                self:AddEquipSlot(badge_equipslots[badgeslots_inv + i], "images/gui/slotbg_badge.xml", "slotbg_badge.tex")
            end
        elseif delta < 0 then
            for i = 1, -delta do
                if badgeslots_inv - i < 0 then break end -- prevent underflow
                self:RemoveEquipSlot(badge_equipslots[badgeslots_inv - (i - 1)])
            end
        elseif delta == 0 then
            print("delta zero")
            -- rebuild badge slots
            for k, v in pairs(self.equipslotinfo) do
                if string.find(v.slot, "badge") then
                    print("remove")
                    self:RemoveEquipSlot(v.slot)
                end
            end
            for i = 1, self.owner.replica.madhatter:GetBadgeSlots() do
                print("add")
                self:AddEquipSlot(badge_equipslots[i], "images/gui/slotbg_badge.xml", "slotbg_badge.tex")
            end
        end
    end

    self.inst:ListenForEvent("badgeslots_dirty", OnBadgeSlots, self.owner)

    -- Run on load to make sure we have the right number of badge slots
    -- local function OnMadLoad()
    --     if not self.owner:HasTag("madhatter") then return end
    --     local badgeslots_inv = 0
    --     local badgeval = self.owner.replica.madhatter:GetBadgeSlots()
    --     for i = 1, badgeval do
    --         self:AddEquipSlot(badge_equipslots[i], "images/gui/slotbg_badge.xml", "slotbg_badge.tex")
    --     end
    -- end
    
    -- self.inst:ListenForEvent("onmadload", OnMadLoad, self.owner)
end)

-- This will add some code to the server side stategraph
-- AddStategraphPostInit("wilson", function(sg) 
-- 	local _attack = sg.states["attack"]
-- 	local _onenter = _attack.onenter
--     local _onexit = _attack.onexit
--     local _timeline = _attack.timeline
--     local _events = _attack.events
    
-- 	_attack.onenter = function(inst,...)
--         -- if we're hatkid, unarmed, and not riding (you can remove that restriction if you want), then run our custom attack 
-- 		if inst:HasTag("hatkid") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) and not inst.components.rider:IsRiding() then
--             local buffaction = inst:GetBufferedAction()
--             local target = buffaction ~= nil and buffaction.target or nil

--             -- dont attack while on cooldown
--             if inst.components.combat:InCooldown() then
--                 inst.sg:RemoveStateTag("abouttoattack")
--                 inst:ClearBufferedAction()
--                 inst.sg:GoToState("idle", true)
--                 return
--             end

--             if inst.sg.laststate == inst.sg.currentstate then
--                 inst.sg.statemem.chained = true
--             end

--             inst.sg.statemem.unarmed = true

--             -- inst.components.combat.onhitotherfn = function()
--             --     inst.components.combat:GetAttacked(inst, 1)
--             --     print("attack other")
--             -- end
--             inst.components.combat:SetTarget(target)
--             inst.components.combat:StartAttack()
--             inst.components.locomotor:Stop()

--             -- use normal attacking anims instead of punch
--             inst.AnimState:PlayAnimation("punch")
--             inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh", nil, nil, true)

--             inst.sg:SetTimeout(24 * GLOBAL.FRAMES) -- same timeout as normal slash weapons like spear

--             -- allows proper attack chaining by holding the attack key
--             if target ~= nil then
--                 inst.components.combat:BattleCry()
--                 if target:IsValid() then
--                     inst:FacePoint(target:GetPosition())
--                     inst.sg.statemem.attacktarget = target
--                     inst.sg.statemem.retarget = target
--                 end
--             end
            
--             return -- since we overrode the attack, don't continue with the rest of onenter
--         end
--         return _onenter(inst,...) -- continue to vanilla attack onenter if we didnt override the punch
-- 	end

--     -- _attack.onexit = function(inst, ...)
--     --     _onexit(inst, ...)
--     --     if inst.sg.statemem.unarmed then
--     --         inst.components.combat:GetAttacked(inst, 1)
--     --         inst.sg.statemem.unarmed = false
--     --     end
--     -- end

--     -- local addtimeline = {
--     --     GLOBAL.TimeEvent(3 * FRAMES, function(inst)
--     --         if inst.sg.statemem.unarmed then
--     --             inst.components.combat:GetAttacked(inst, 1)
--     --         end
--     --     end)
--     -- }

--     -- table.insert(_timeline, 1, addtimeline[1])

--     local newevent = {
--         GLOBAL.EventHandler("onattackother", function(inst) inst.components.combat:GetAttacked(inst, 1) end)
--     }

--     table.insert(_events, 1, newevent[1])

--     -- _events[0] = EventHandler("onattackother", function(inst)  end)
-- end)

-- -- This covers the client stategraph, only used if movement prediction is enabled
-- -- its mostly the same with some stuff removed and server side components replaced with replicas
-- AddStategraphPostInit("wilson_client", function(sg) -- This will add some code to the server side stategraph
-- 	local _attack = sg.states["attack"]
-- 	local _onenter = _attack.onenter
    
-- 	_attack.onenter = function(inst,...)
-- 		if inst:HasTag("hatkid") and not inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) and not (inst.replica.rider and inst.replica.rider:IsRiding()) then
--             local buffaction = inst:GetBufferedAction()
-- 			if inst.replica.combat:InCooldown() then
-- 				inst.sg:RemoveStateTag("abouttoattack")
-- 				inst:ClearBufferedAction()
-- 				inst.sg:GoToState("idle", true)
-- 				return
-- 			end

--             if inst.sg.laststate == inst.sg.currentstate then
--                 inst.sg.statemem.chained = true
--             end

--             inst.replica.combat:StartAttack()
--             inst.components.locomotor:Stop()

--             -- use normal attacking anims instead of punch
--             inst.AnimState:PlayAnimation("atk_pre")
--             inst.AnimState:PushAnimation("atk", false)
        
--             inst.sg:SetTimeout(13 * GLOBAL.FRAMES) -- same timeout as normal slash weapons like spear

--             -- allows proper attack chaining by holding the attack key
--             if buffaction ~= nil then
--                 inst:PerformPreviewBufferedAction()

--                 if buffaction.target ~= nil and buffaction.target:IsValid() then
--                     inst:FacePoint(buffaction.target:GetPosition())
--                     inst.sg.statemem.attacktarget = buffaction.target
--                     inst.sg.statemem.retarget = buffaction.target
--                 end
--             end
            
--             return -- since we overrode the attack, don't continue with the rest of onenter
--         end
--         return _onenter(inst,...) -- continue to vanilla attack onenter if we didnt override the punch
-- 	end
-- end)