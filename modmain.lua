--[[
  _    _           _         _  __  _       _       _____           _                       _              _
 | |  | |         | |       | |/ / (_)     | |     |  __ \         | |                     | |            | |
 | |__| |   __ _  | |_      | ' /   _    __| |     | |__) |   ___  | |   ___     __ _    __| |   ___    __| |
 |  __  |  / _` | | __|     |  <   | |  / _` |     |  _  /   / _ \ | |  / _ \   / _` |  / _` |  / _ \  / _` |
 | |  | | | (_| | | |_      | . \  | | | (_| |     | | \ \  |  __/ | | | (_) | | (_| | | (_| | |  __/ | (_| |
 |_|  |_|  \__,_|  \__|     |_|\_\ |_|  \__,_|     |_|  \_\  \___| |_|  \___/   \__,_|  \__,_|  \___|  \__,_|

  _                  _____   _              _
 | |                / ____| | |            | |
 | |__    _   _    | (___   | | __  _   _  | |   __ _   _ __   _ __
 | '_ \  | | | |    \___ \  | |/ / | | | | | |  / _` | | '__| | '__|
 | |_) | | |_| |    ____) | |   <  | |_| | | | | (_| | | |    | |
 |_.__/   \__, |   |_____/  |_|\_\  \__, | |_|  \__,_| |_|    |_|
           __/ |                     __/ |
          |___/                     |___/

	This mod was originally based on Daniel's Hat Kid mod for DST, linked here https://steamcommunity.com/sharedfiles/filedetails/?id=1192668074

	However, almost every line of code has been rewritten or edited in some way, and every asset has also been redrawn, 
	making this mod almost entirely my own, besides the art assets drawn by Powd3d4

	This mod has been an awesome journey in learning to stay with a project. I've been working on it very slowly since Summer 2020, burnout after burnout, but it feels good.
]]

local PrefabFilesLocal = {
	"hatkid",
	"hatkid_skins",

	--hats
    "kidhat",
	"sprinthat",
	"brewinghat",
	"polarhat",
	"dwellermask",
	"timestophat",

	--other items
	"hatbrella",
	"hatbrellaopen",
	"kidpotion",
	"kidpotion_ammo",

	"pon",
	"pon_boss",
	-- "pon_heart",

	--fx
	"brewinghat_explode",
	"polarhat_explode",
	"polarhat_charge",
	"sprint_puff",
	"hatshatter",
	"hatshatter2",

	--misc
	"hatpack",

	--badges
	"badge_fasthatter",
	"badge_football",
	"badge_fury",
	"badge_pride",
	"badge_onehit",
	"badge_carefree",
	"badge_heart",
	"badge_strength",
	"badge_greed",


	"badgeseller",
	"badgesellercane",
	"badge_pin",
	"pon_upgrades",
}

PrefabFiles = PrefabFilesLocal

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/hatkid.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/hatkid_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid_silho.xml" ),

	Asset( "IMAGE", "images/map_icons/hatkid.tex" ),
	Asset( "ATLAS", "images/map_icons/hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_hatkid.xml" ),
	
	Asset( "IMAGE", "images/crafting_menu_avatars/avatar_hatkid.tex" ),
    Asset( "ATLAS", "images/crafting_menu_avatars/avatar_hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_ghost_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_hatkid.xml" ),

	Asset( "IMAGE", "images/avatars/self_inspect_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_hatkid.xml" ),

	-- Big names
	Asset( "IMAGE", "images/names_hatkid.tex" ),
    Asset( "ATLAS", "images/names_hatkid.xml" ),

	Asset( "IMAGE", "images/names_gold_hatkid.tex" ),
    Asset( "ATLAS", "images/names_gold_hatkid.xml" ),

	-- Skin bigportraits
    Asset( "IMAGE", "bigportraits/hatkid.tex" ), -- Base, not sure where this is used tbh.
    Asset( "ATLAS", "bigportraits/hatkid.xml" ),

	Asset( "IMAGE", "bigportraits/hatkid_none.tex" ), -- Default, texture is same as base.
    Asset( "ATLAS", "bigportraits/hatkid_none.xml" ),

    Asset( "IMAGE", "bigportraits/ms_hatkid_cat.tex" ), -- Nyakuza
    Asset( "ATLAS", "bigportraits/ms_hatkid_cat.xml" ),

	Asset( "IMAGE", "bigportraits/ms_hatkid_detective.tex" ), -- Detective
    Asset( "ATLAS", "bigportraits/ms_hatkid_detective.xml" ),
	
	-- For the dyes we don't have custom portraits, so we just point the atlas at the default portrait.
	-- This means we don't load a ton of duplicate textures theoretically, though I'm not sure how this works in memory
	-- At the very least it saves disk space

    Asset( "ATLAS", "bigportraits/ms_hatkid_dye_niko.xml" ),
    Asset( "ATLAS", "bigportraits/ms_hatkid_dye_toonlink.xml" ),
    Asset( "ATLAS", "bigportraits/ms_hatkid_dye_pinkdanger.xml" ), 
	Asset( "ATLAS", "bigportraits/ms_hatkid_dye_bowkid.xml" ),
	Asset( "ATLAS", "bigportraits/ms_hatkid_dye_groovy.xml" ),
	Asset( "ATLAS", "bigportraits/ms_hatkid_dye_lunar.xml" ),
	Asset( "ATLAS", "bigportraits/ms_hatkid_dye_sans.xml" ),

    Asset( "ATLAS", "bigportraits/hatkid_timestop.xml" ),

	-- Slotbg's

	Asset( "IMAGE", "images/gui/slotbg_kidhat.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_kidhat.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_sprinthat.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_sprinthat.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_brewinghat.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_brewinghat.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_polarhat.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_polarhat.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_dwellermask.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_dwellermask.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_timestophat.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_timestophat.xml" ),

	Asset( "IMAGE", "images/gui/slotbg_badge.tex" ),
    Asset( "ATLAS", "images/gui/slotbg_badge.xml" ),

	Asset( "IMAGE", "images/gui/craft_pon.tex" ),
    Asset( "ATLAS", "images/gui/craft_pon.xml" ),

	Asset("ANIM", "anim/tab_badgeseller.zip"),

	Asset("FONT", "fonts/talkingfont_hatkid.zip"),
}

-- Import modmain segments
modimport("modmain_tuning.lua")
modimport("modmain_crafting.lua")
modimport("modmain_actions.lua")
modimport("modmain_insight.lua")
modimport("modmain_strings.lua")

-- If meme language or meme language server is enabled, we'll use our own meme strings, otherwise load the normal ones.
if GLOBAL.KnownModIndex:IsModEnabled("workshop-1289272965") or GLOBAL.KnownModIndex:IsModEnabled("workshop-2926922407") then
	modimport("modmain_strings_alt.lua")
end

modimport("scripts/keyhandler.lua") --Keyhandler (usually engine.lua)

-- Imports to keep the keyhandler from working while typing into various things.
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

-- Add Hat Kid to various things
AddModCharacter("hatkid", "FEMALE")
AddMinimapAtlas("images/map_icons/hatkid.xml")

local TheSim = GLOBAL.TheSim

-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/

-- Ability Key Handler
local function OnAbility(inst)
	local hat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)
	if hat ~= nil and hat:HasTag("hatkidhat") then
		hat:PushEvent("AbilityKey")
	end
end

AddModRPCHandler("HatKidRPC", "AbilityKeyDown", OnAbility)

-- Hat Switch Handler
local function OnHatSwitch(inst)
	inst:PushEvent("SwitchKey")
end

AddModRPCHandler("HatKidRPC", "SwitchKeyDown", OnHatSwitch)

-- Hatpack Unequip button
local function OnUnequipHatpack(inst, pack)
	inst.components.inventory:DropItem(pack)
end

AddModRPCHandler("HatKidRPC", "UnequipHatpack", OnUnequipHatpack)

-- Post inits
local afs_enabled = GLOBAL.KnownModIndex:IsModEnabled("workshop-2736043172") or GLOBAL.KnownModIndex:IsModEnabled("AutoFuelSlotDSTMod")

-- Check to make sure my other mod that does all this patching as well isn't present
-- Could cause issues if both try and patch the same code in the same way. Or maybe not. I don't know, but
-- I'm not willing to take the chance.

if not afs_enabled then
	-- Code in here is stolen from my mod Item Auto-Fuel Slots. I gave myself permission, don't worry!
	AddPrefabPostInit("lightbulb", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("slurtleslime", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("fireflies", function(inst)
		inst:AddTag("cavefuel")
	end)
	
	AddPrefabPostInit("nightmarefuel", function(inst)
		inst:AddTag("nightmarefuel")
	end)

	AddPrefabPostInit("horrorfuel", function(inst)
		inst:AddTag("nightmarefuel")
	end)
	
	AddPrefabPostInit("wormlight", function(inst)
		inst:AddTag("wormfuel")
	end)
	
	AddPrefabPostInit("wormlight_lesser", function(inst)
		inst:AddTag("wormfuel")
	end)

	AddClassPostConstruct("screens/playerhud", function(self)
		-- Hook into playerhud:OpenContainer to get a head slot variant of a hand_inv container working correctly
		local _OpenContainer = self.OpenContainer
		local ContainerWidget = GLOBAL.require("widgets/containerwidget")
	
	
		self.OpenContainer = function(self, container, side)
	
			-- local OpenContainerWidget copy pasted from playerhud.lua, with one small change.
			local function OpenContainerWidget(self, container, side)
				local containerwidget = ContainerWidget(self.owner)
				local parent = side and self.controls.containerroot_side
				-- or (container.replica.container ~= nil and container.replica.container.type == "hand_inv") and self.controls.inv.hand_inv
				or (container.replica.container ~= nil and container.replica.container.type == "head_inv") and self.controls.inv.head_inv
				or (container.replica.container ~= nil and container.replica.container.type == "body_inv") and self.controls.inv.body_inv
				or (container.replica.container ~= nil and container.replica.container.type == "amulet_inv") and self.controls.inv.amulet_inv -- not in vanilla, added by other mods
				or self.controls.containerroot
	
				parent:AddChild(containerwidget)
			
				containerwidget:MoveToBack()
				containerwidget:Open(container, self.owner)
				self.controls.containers[container] = containerwidget
			end
	
	
			if container ~= nil and 
			((container.replica.container.type == "head_inv" and self.controls.inv.head_inv) or 
			(container.replica.container.type == "body_inv" and self.controls.inv.body_inv) or
			(container.replica.container.type == "amulet_inv" and self.controls.inv.amulet_inv)) then -- not in vanilla, added by other mods
				-- If we're using the head_inv slot, override the normal function so we're placed correctly.
				local ret = OpenContainerWidget(self, container, side)
				return ret
			else
				-- Otherwise, run the normal one.
				-- No need to check if container is nil, the original function does that for us.
				local ret = _OpenContainer(self, container, side)
				return ret
			end
		end
	end)
	
	AddClassPostConstruct("widgets/inventorybar", function(self)
		local Widget = GLOBAL.require "widgets/widget"
	
		local widgetscale = 1.5
	
		-- hand_inv added by the vanilla game
		self.hand_inv:SetScale(widgetscale, widgetscale)
	
		self.head_inv = self.root:AddChild(Widget("head_inv"))
		self.head_inv:SetScale(widgetscale, widgetscale)
	
		self.body_inv = self.root:AddChild(Widget("body_inv"))
		self.body_inv:SetScale(widgetscale, widgetscale)
	
		self.amulet_inv = self.root:AddChild(Widget("amulet_inv"))
		self.amulet_inv:SetScale(widgetscale, widgetscale)
		
		local _rebuild = self.Rebuild
	
		self.HeadInv = function(self)
	
			local function RebuildLayout(self, inventory, overflow, do_integrated_backpack, do_self_inspect)
				local W = 68
				local SEP = 12
				local INTERSEP = 28
	
				local num_slots = inventory:GetNumSlots()
				local num_equip = #self.equipslotinfo
				local num_buttons = do_self_inspect and 1 or 0
				local num_slotintersep = math.ceil(num_slots / 5)
				local num_equipintersep = num_buttons > 0 and 1 or 0
				local total_w = (num_slots + num_equip + num_buttons) * W + (num_slots + num_equip + num_buttons - num_slotintersep - num_equipintersep - 1) * SEP + (num_slotintersep + num_equipintersep) * INTERSEP
			
				local x = (W - total_w) * .5 + num_slots * W + (num_slots - num_slotintersep) * SEP + num_slotintersep * INTERSEP
				for k, v in ipairs(self.equipslotinfo) do
	
					if v.slot == GLOBAL.EQUIPSLOTS.HEAD then
						self.head_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.head_inv:MoveToBack()
					end
	
					if v.slot == GLOBAL.EQUIPSLOTS.BODY then
						self.body_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.body_inv:MoveToBack()
					end
	
					if GLOBAL.EQUIPSLOTS.NECK ~= nil and v.slot == GLOBAL.EQUIPSLOTS.NECK then -- added for compatibility with equipslot mods. hopefully they call their slot this.
						self.amulet_inv:SetPosition(x, do_integrated_backpack and 80 or 40, 0)
						self.amulet_inv:MoveToBack()
					end
			
					x = x + W + SEP
				end
			end
	
			-- end layout rebuild
	
			if self.cursor ~= nil then
				self.cursor:Kill()
				self.cursor = nil
			end
		
			if self.toprow ~= nil then
				self.toprow:Kill()
				self.inspectcontrol = nil
			end
		
			if self.bottomrow ~= nil then
				self.bottomrow:Kill()
			end
	
		
			self.inv = {}
			self.equip = {}
			self.backpackinv = {}
		
			local controller_attached = GLOBAL.TheInput:ControllerAttached()
			self.controller_build = controller_attached
			self.integrated_backpack = controller_attached or GLOBAL.Profile:GetIntegratedBackpack()
		
			local inventory = self.owner.replica.inventory
		
			local overflow = inventory:GetOverflowContainer()
			overflow = (overflow ~= nil and overflow:IsOpenedBy(self.owner)) and overflow or nil
		
			local do_integrated_backpack = overflow ~= nil and self.integrated_backpack
			local do_self_inspect = not (self.controller_build or GLOBAL.GetGameModeProperty("no_avatar_popup"))
		
			RebuildLayout(self, inventory, overflow, do_integrated_backpack, do_self_inspect)
		
			self:SelectDefaultSlot()
			self.current_list = self.inv
			if not controller_attached then
				self:UpdateCursor()
			end
		
			self.rebuild_pending = nil
			self.rebuild_snapping = nil
		end
	
	
	
		self.Rebuild = function(self)
			self.HeadInv(self)
	
			_rebuild(self)
		end
	end)
end

-- We need to make an entire pseudo-frozen state specifically for using the ice hat, as we don't want to go to the hit state after being unfrozen, we don't want extra sounds, and we want to show the hud.
AddStategraphState("wilson",
State{
	name = "hat_frozen",
	tags = { "busy", "frozen", "nopredict", "nodangle" },

	onenter = function(inst)
		if inst.components.pinnable ~= nil and inst.components.pinnable:IsStuck() then
			inst.components.pinnable:Unstick()
		end

		if inst.components.inventory:IsHeavyLifting() then
			inst.components.inventory:DropItem(
			inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.BODY), true, true)
		end

		inst.components.locomotor:Stop()
		inst:ClearBufferedAction()

		inst.components.inventory:Hide()
		inst:PushEvent("ms_closepopups")
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(false)
			inst.components.playercontroller:Enable(false)
		end

		inst.components.colouradder:PushColour("polarhat", 82 / 255, 115 / 255, 124 / 255, 0)

		inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
		inst.AnimState:PlayAnimation("frozen")

		inst.SoundEmitter:PlaySound("polarhat/sound/activate")

		inst:AddTag("alwaysblock")
		
		inst.sg:SetTimeout(20 * FRAMES)
	end,

	ontimeout = function(inst)
		inst.sg:GoToState("idle")
	end,

	events =
	{
		EventHandler("unequip", function(inst, data)
			if data.eslot == GLOBAL.EQUIPSLOTS.HEAD then
				inst.sg:GoToState("idle", true)
			end
		end),
		EventHandler("doexplode", function(inst, data)
			inst.sg:GoToState("idle", true)
		end),
	},

	onexit = function(inst)
		inst.AnimState:ClearOverrideSymbol("swap_frozen")
		inst.components.colouradder:PopColour("polarhat")
		inst:RemoveTag("alwaysblock")

		inst.components.inventory:Show()
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(true)
			inst.components.playercontroller:Enable(true)
		end
	end,
}
)

GLOBAL.FUELTYPE.ICE = "ICE"

AddPrefabPostInit("ice", function(inst)
	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL -- 180
    inst.components.fuel.fueltype = GLOBAL.FUELTYPE.ICE
end)

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

-- TODO make this BETTER (works for now)
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

AddReplicableComponent("madhatter")

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