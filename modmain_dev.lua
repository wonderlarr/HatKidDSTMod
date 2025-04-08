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

params.hatpack =
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
        },
        animbank = "ui_hatpack_3x2",
        animbuild = "ui_hatpack_3x2",
        pos = Vector3(-82, 108, 0),
        bottom_align_tip = -100,
        buttoninfo =
        {
            text = "Unequip",
            position = Vector3(0, -80, 0),
        }
    },
    usespecificslotsforitems = true,
    acceptsstacks = false,
    type = "side_inv_behind",
    issidewidget = true,
}

for y = 1, 0, -1 do
    for x = 0, 2 do
        table.insert(params.hatpack.widget.slotpos, Vector3(scale * x - scale * 2 + scale, scale * y - scale * 2 + 120, 0))
    end
end

function params.hatpack.itemtestfn(container, item, slot)
    return slot == nil and item:HasTag("hatkidhat") or item:HasTag("hatkidhat") and item.prefab == hatlist[slot]
end

function params.hatpack.widget.buttoninfo.fn(inst, doer)
    if doer.components.inventory then
        doer.components.inventory:DropItem(inst)
    else
        SendModRPCToServer(GetModRPC("HatKidRPC", "UnequipHatpack"), inst, doer)
    end
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
            -- possibly impractical
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

-- Replace normal health widget with our custom one (for fun)
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

-- Reward pons for a lot of things
-- This is here so pon counts can be precomputed
AddPrefabPostInitAny(function(inst)
    -- For normal mobs, like hounds, rabbits, or bosses
    if inst.components.health then
        inst.gpons = 0
        inst.cpons = 1
        inst.bpons = 0
        if inst:HasTag("epic") then
            inst.cpons = 0
            for i = 0, inst.components.health.maxhealth or 0, 1000 do
                inst.bpons = inst.bpons + 1
            end
        else
            for i = 0, inst.components.health.maxhealth or 0, 100 do
                inst.gpons = inst.gpons + 1
                inst.cpons = inst.cpons + 1
            end
        end
    -- For pickable entities, like mushrooms and bushes
    elseif inst.components.pickable then
        if inst.prefab == "tumbleweed" then
            inst:ListenForEvent("picked", function(inst, data)
                if data.picker and data.picker:HasTag("madhatter") then
                    local pon = GLOBAL.SpawnPrefab("pon")
                    pon.award_count = math.random(1, 3)
                    pon.Transform:SetPosition(data.picker.Transform:GetWorldPosition())
                end
            end)
        end

        inst.cpons = 1
        inst.gpons = 1

    -- For workable entities, like rocks and trees
    elseif inst.components.workable then
        inst.gpons = 2
        inst.cpons = inst.components.workable.workleft or 0
    end
end)

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
        
                local fx = GLOBAL.SpawnPrefab((doer.components.rider ~= nil and doer.components.rider:IsRiding()) and "pocketwatch_heal_fx_mount" or "pocketwatch_heal_fx")
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
    -- Adding functionality here so we can conveniently use it in madhatter.lua
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
            -- rebuild badge slots
            for k, v in pairs(self.equipslotinfo) do
                if string.find(v.slot, "badge") then
                    self:RemoveEquipSlot(v.slot)
                end
            end
            for i = 1, self.owner.replica.madhatter:GetBadgeSlots() do
                self:AddEquipSlot(badge_equipslots[i], "images/gui/slotbg_badge.xml", "slotbg_badge.tex")
            end
        end
    end

    self.inst:ListenForEvent("badgeslots_dirty", OnBadgeSlots, self.owner)
end)

AddComponentPostInit("inventory", function(self)
    local _Equip = self.Equip

    self.Equip = function(self, item, old_to_active, no_animation, force_ui_anim)
        -- find next free badge slot manually since we're loading
        -- this is a HACK but i really dont feel like doing this any better right now
        if item and item:HasTag("badge") and item.components.badge.loading then
            if not self.equipslots[GLOBAL.EQUIPSLOTS.BADGE1] then
                item.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.BADGE1
            elseif not self.equipslots[GLOBAL.EQUIPSLOTS.BADGE2] then
                item.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.BADGE2
            elseif not self.equipslots[GLOBAL.EQUIPSLOTS.BADGE3] then
                item.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.BADGE3
            end
        end

        -- run vanilla function
        return _Equip(self, item, old_to_active, no_animation, force_ui_anim)
    end

    local _DropItem = self.DropItem

    self.DropItem = function(self, item, wholestack, randomdir, pos, keepoverstacked)      
        if item and item:IsValid() and item.components.badge then
            item.components.badge:Unequip(self.inst)
        end

        return _DropItem(self, item, wholestack, randomdir, pos, keepoverstacked)
    end

end)

-- TODO is this a good way to do this?
AddPrefabPostInit("multiplayer_portal", function(inst)
    TheWorld:WatchWorldState("cycles", function(inst, data)
        if TheWorld.ismastersim and not TheWorld:HasTag("cave") then
            -- This will despawn any active badgesellers
            TheWorld:PushEvent("badgeseller_despawn")

            local seller = GLOBAL.SpawnPrefab("badgeseller")

            if seller then
                local location_tags = {
                    "badgeseller_location_spawn",
                    "badgeseller_location_pigking",
                    "badgeseller_location_oasis",
                    "badgeseller_location_stage",
                    "badgeseller_location_moonstone",
                    "badgeseller_location_lunar",
                    "badgeseller_location_pearl",
                    "badgeseller_location_monkey",
                    "badgeseller_location_awesome",
                }
        
                local tag = location_tags[math.random(1, 9)]
                local location = GetRandomInstWithTag(tag, TheWorld, 1000)
        
                seller.location_tag = tag
        
                if location then
                    local pos = FindNearbyLand(location:GetPosition(), 25) or Vector3(0,0,0)
                    seller.Physics:Teleport(pos.x, 0, pos.z)
                end
                
                seller.sg:GoToState("spawn")
            end
        end
    end)
end)

-- Spawn
AddPrefabPostInit("multiplayer_portal", function(inst)
    inst:AddTag("badgeseller_location_spawn")
end)
AddPrefabPostInit("multiplayer_portal_moonrock", function(inst)
    inst:AddTag("badgeseller_location_spawn")
end)

-- Pig King
AddPrefabPostInit("pigking", function(inst)
    inst:AddTag("badgeseller_location_pigking")
end)

-- Oasis
AddPrefabPostInit("oasislake", function(inst)
    inst:AddTag("badgeseller_location_oasis")
end)

-- Stage
AddPrefabPostInit("charlie_stage", function(inst)
    inst:AddTag("badgeseller_location_stage")
end)
AddPrefabPostInit("charlie_stage_post", function(inst)
    inst:AddTag("badgeseller_location_stage")
end)

-- Moon Stone
AddPrefabPostInit("moonbase", function(inst)
    inst:AddTag("badgeseller_location_moonstone")
end)

-- Lunar
AddPrefabPostInit("moon_fissure", function(inst)
    inst:AddTag("badgeseller_location_lunar")
end)
AddPrefabPostInit("moon_fissure_plugged", function(inst)
    inst:AddTag("badgeseller_location_lunar")
end)

-- Pearl
AddPrefabPostInit("hermithouse_construction1", function(inst)
    inst:AddTag("badgeseller_location_pearl")
end)
AddPrefabPostInit("hermithouse_construction2", function(inst)
    inst:AddTag("badgeseller_location_pearl")
end)
AddPrefabPostInit("hermithouse_construction3", function(inst)
    inst:AddTag("badgeseller_location_pearl")
end)

-- Monkey
AddPrefabPostInit("monkeyqueen", function(inst)
    inst:AddTag("badgeseller_location_monkey")
end)

-- Awesome
AddPrefabPostInit("stagehand", function(inst)
    inst:AddTag("badgeseller_location_awesome")
end)