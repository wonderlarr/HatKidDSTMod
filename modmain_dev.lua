local Vector3 = GLOBAL.Vector3
local containers = GLOBAL.require("containers")
local params = containers.params

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
    },
    type = "side_inv_behind",
    acceptsstacks = false,
    lowpriorityselection = true,
    excludefromcrafting = true,
}

local scale = 70

for y = 1, 0, -1 do
    for x = 0, 2 do
        table.insert(params.hatpack.widget.slotpos, Vector3(scale * x - scale * 2 + scale, scale * y - scale * 2 + 120, 0))
    end
end

-- controls the order hats are allowed in for the hatpack
local hatlist = {
    "kidhat",
    "sprinthat",
    "brewinghat",
    "polarhat",
    "dwellermask",
    "timestophat"
}

function params.hatpack.itemtestfn(container, item, slot)
    return item:HasTag("hatkidhat") and item.prefab == hatlist[slot]
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

-- Get the badge to actually appear on screen
-- I have no idea what I am doing here
local PonBadge = require("widgets/ponbadge")
AddClassPostConstruct("widgets/statusdisplays", function(self)
    if not self.owner or self.owner.prefab ~= "hatkid" then return end

    self.ponbadge = self:AddChild(PonBadge(self.owner))
    self.ponbadge:SetPosition(-120, 20)
    self.ponbadge:SetPercent(0, 100)

    if HAS_MOD.COMBINED_STATUS then
        self.ponbadge:SetPosition(-62, -52)
    end

    local function OnPonDelta(owner, data) 
        self.ponbadge:SetPercent(owner.components.madhatter.val / owner.components.madhatter.max, owner.components.madhatter.max)

        local im = Image("images/inventoryimages/pon.xml", "pon.tex")
        local start_pos = Vector3(TheSim:GetScreenPos(owner:GetPosition():Get()))
        local dest_pos = self.ponbadge:GetWorldPosition()
        im:MoveTo(start_pos, dest_pos, .3, function() im:Kill() end)
    end 

    self.inst:ListenForEvent("ponval", OnPonDelta, self.owner)
    self.inst:ListenForEvent("ponmax", OnPonDelta, self.owner)
end)


-- Push "badgeseller" locally to trigger
local BadgeToast = require("widgets/badgetoast")
AddClassPostConstruct("widgets/controls", function(self)
    if not self.owner or self.owner.prefab ~= "hatkid" then return end

    self.badgetoast_notification = self.topleft_root:AddChild(BadgeToast(self.owner, self))
    self.badgetoast_notification:SetPosition(315, 150, 0)
end)

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
        if doer:HasTag("hatkid") then
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