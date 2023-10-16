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

	This mod has been an awesome journey in learning to stay consistent with a project. I've been working on it very slowly since Summer 2020, 
]]

local PrefabFilesLocal = {
	"hatkid",
	-- replaced hatkid_none with skins, according to the new Skins API
	"hatkid_skins",

	--hats
    "kidhat",
	-- "sprinthat",
	"brewinghat",
	"polarhat",
	"dwellermask",
	"timestophat",

	--other items
	"hatbrella",
	"hatbrellaopen",
	"kidpotion",
	"kidpotion_throwable",

	--collectables (disabled)
	"pon",
	-- "pon_heart",
	-- "timepiece",

	--fx
	"brewinghat_explode",
	"polarhat_explode",
	"polarhat_charge",
	"sprint_puff",
	"hatshatter",
	"hatshatter2",

	--misc
	-- "inv_pons",
	"hatpack",

	--badges
	"badge_cooldown",

	--testing TODO (disable in final)
	"cooltarget", -- This is a dummytarget prefab, but it only regens health when it is low.
}

-- If Meme Language is enabled, manually add sprinthat
if GLOBAL.KnownModIndex:IsModEnabled("workshop-1289272965") or GLOBAL.KnownModIndex:IsModEnabled("workshop-2926922407") then
	table.insert(PrefabFilesLocal, "sprinthat")
end

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

	-- Pon inventory (disabled)
	-- Asset("ANIM", "anim/status_pons.zip"),
	-- Asset("ANIM", "anim/pons_icon.zip"),

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

	Asset("ANIM", "anim/tab_badgeseller.zip"),

	Asset("FONT", "fonts/talkingfont_hatkid.zip"),
}


-- Import modmain segments
modimport("modmain_tuning.lua")
modimport("modmain_crafting.lua")
modimport("modmain_actions.lua")
modimport("modmain_insight.lua")

modimport("modmain_dev.lua")

-- If meme language or meme language server is enabled, we'll use our own meme strings, otherwise load the normal ones.
if GLOBAL.KnownModIndex:IsModEnabled("workshop-1289272965") or GLOBAL.KnownModIndex:IsModEnabled("workshop-2926922407") then
	modimport("modmain_strings_alt.lua")
else
	modimport("modmain_strings.lua")
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

GLOBAL.TALKINGFONT_HATKID = "talkingfont_hatkid"

local HATKID_FALLBACK_TABLE_OUTLINE = {
	GLOBAL.TALKINGFONT,
	"controllers",
	"emoji",
	GLOBAL.FALLBACK_FONT_OUTLINE,
	GLOBAL.FALLBACK_FONT_FULL_OUTLINE,
}

AddSimPostInit(function()
	TheSim:UnloadFont(GLOBAL.TALKINGFONT_HATKID)
	TheSim:UnloadPrefabs({"hatkid_fonts"})

	local Assets = {
		Asset("FONT", GLOBAL.resolvefilepath("fonts/talkingfont_hatkid.zip")),
	}
	local FontsPrefab = GLOBAL.Prefab("hatkid_fonts", function() return GLOBAL.CreateEntity() end, Assets)
	GLOBAL.RegisterPrefabs(FontsPrefab)
	TheSim:LoadPrefabs({"hatkid_fonts"})
	TheSim:LoadFont(GLOBAL.resolvefilepath("fonts/talkingfont_hatkid.zip"), GLOBAL.TALKINGFONT_HATKID)
	TheSim:SetupFontFallbacks(GLOBAL.TALKINGFONT_HATKID, HATKID_FALLBACK_TABLE_OUTLINE)
end)

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

-- I would have put this directly in the prefab but I just stole code from my other mod and I'm too lazy to do this properly
-- besides, using postinits on your own prefabs is funny.

if TUNING.BREWINGHAT_DURABILITY then
	AddPrefabPostInit("brewinghat", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue * inst.components.fueled.bonusmult
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) >= fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled.accepting = true
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
					currentfuel = math.floor(currentfuel/fueltogive+0.5)*fueltogive
					inst.components.fueled.accepting = false
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.brewinghat_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.brewinghat_inv.itemtestfn(container, item, slot)
			return item.prefab == "slurtleslime" or item.prefab == "gunpowder"
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("brewinghat_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("brewinghat_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(0.25, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
	end)
end

if TUNING.POLARHAT_DURABILITY then
	AddPrefabPostInit("polarhat", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue * inst.components.fueled.bonusmult
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) >= fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled.accepting = true
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
					currentfuel = math.floor(currentfuel/fueltogive+0.5)*fueltogive
					inst.components.fueled.accepting = false
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.polarhat_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.polarhat_inv.itemtestfn(container, item, slot)
			return item.prefab == "ice"
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("polarhat_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("polarhat_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(0.25, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
	end)
end

if TUNING.DWELLERMASK_DURABILITY then
	AddPrefabPostInit("dwellermask", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue * inst.components.fueled.bonusmult
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) >= fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled.accepting = true
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
					inst.components.fueled.accepting = false
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.dwellermask_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.dwellermask_inv.itemtestfn(container, item, slot)
			return item:HasTag("nightmarefuel") -- Tag added by this mod, not in vanilla.
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("dwellermask_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("dwellermask_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(0.25, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
	end)
end

if TUNING.TIMESTOPHAT_DURABILITY then
	AddPrefabPostInit("timestophat", function(inst)
		local function OnTick(inst)
			if inst.components.container and inst.components.container:GetItemInSlot(1) then
				local owner = inst.components.inventoryitem:GetGrandOwner()

				local fueltogive = inst.components.container:GetItemInSlot(1).components.fuel.fuelvalue * inst.components.fueled.bonusmult
				local currentfuel = inst.components.fueled.currentfuel
				local maxfuel = inst.components.fueled.maxfuel

				if (maxfuel - currentfuel) >= fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled.accepting = true
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
					inst.components.fueled.accepting = false
				end
			end
		end

		local function OnEquip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Open(owner)
			end
		end

		local function OnUnequip(inst, data)
			local owner = data.owner
			if inst.components.container ~= nil then
				inst.components.container:Close(owner)
			end
		end
		
		-- Start Container stuff ---------
		local containers = GLOBAL.require("containers")
		params = containers.params

		params.timestophat_inv =
		{
			widget =
			{
				slotpos =
				{
					GLOBAL.Vector3(0,   32 + 4,  0),
				},
				animbank = "ui_cookpot_1x2",
				animbuild = "ui_cookpot_1x2",
				pos = GLOBAL.Vector3(0, 15, 0),
			},
			usespecificslotsforitems = true,
			type = "head_inv",
		}
		
		function params.timestophat_inv.itemtestfn(container, item, slot)
			return item:HasTag("nightmarefuel") -- Tag added by this mod, not in vanilla.
		end
		-- End Container -------
		

		if not GLOBAL.TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst) 
				inst.replica.container:WidgetSetup("timestophat_inv") 
			end

			return
		end

		inst:AddComponent("container")
		inst.components.container:WidgetSetup("timestophat_inv")
		inst.components.container.canbeopened = false

		inst.tick = inst:DoPeriodicTask(0.25, OnTick)

		inst:ListenForEvent("equipped", OnEquip)
		inst:ListenForEvent("unequipped", OnUnequip)
		inst:ListenForEvent("itemget", OnTick)
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

		inst.SoundEmitter:PlaySound("icestomp/sound/activate")

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
GLOBAL.FUELTYPE.EXPLOSIVE = "EXPLOSIVE"	

AddPrefabPostInit("ice", function(inst)
	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL -- 180
    inst.components.fuel.fueltype = GLOBAL.FUELTYPE.ICE -- do do do do do
end)

AddPrefabPostInit("gunpowder", function(inst)
	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL -- 90
    inst.components.fuel.fueltype = GLOBAL.FUELTYPE.EXPLOSIVE
end)

if TUNING.HATKID_DISCOUNT ~= false then
	if TUNING.HATKID_DISCOUNT_RUINSHAT then
		table.insert(TUNING.HATKID_CHEAP_HATS, "ruinshat")
	end

	-- Client pin bar "fake" discount
	AddClassPostConstruct("widgets/redux/craftingmenu_pinslot", function(self)
		local _ShowRecipe = self.ShowRecipe
		
		self.ShowRecipe = function(self)
			local product = self.recipe_name ~= nil and self.craftingmenu:GetRecipeState(self.recipe_name) ~= nil and self.craftingmenu:GetRecipeState(self.recipe_name).recipe.product

			if self.owner:HasTag("hatkidcrafter") then
				local hatdiscount = false
				for k, v in pairs(TUNING.HATKID_CHEAP_HATS) do
					if v == product then
						hatdiscount = true
						break
					end
				end

				-- BIOHAZARD ZONE! DO NOT TOUCH INGREDIENTMOD IF A GREEN AMULET IS IN PLAY!!!!!
				local body = self.owner.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.BODY)
				if (body and body.prefab ~= "greenamulet") or not body then
					if hatdiscount then
						self.owner.replica.builder:SetIngredientMod(TUNING.HATKID_DISCOUNT)
					else
						self.owner.replica.builder:SetIngredientMod(1)
					end
				end
			end
			_ShowRecipe(self)
		end
		
	end)
	
	-- Client full menu "fake" discount
	AddClassPostConstruct("widgets/redux/craftingmenu_details", function(self)
		local _PopulateRecipeDetailPanel = self.PopulateRecipeDetailPanel

		self.PopulateRecipeDetailPanel = function(self, data, skin_name)
			if self.owner:HasTag("hatkidcrafter") then
				local hatdiscount = false
				for k, v in pairs(TUNING.HATKID_CHEAP_HATS) do
					if data and v == data.recipe.product then
						hatdiscount = true
						break
					end
				end

				-- BIOHAZARD ZONE! DO NOT TOUCH INGREDIENTMOD IF A GREEN AMULET IS IN PLAY!!!!!
				local body = self.owner.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.BODY)
				if (body and body.prefab ~= "greenamulet") or not body then
					if hatdiscount then
						self.owner.replica.builder:SetIngredientMod(TUNING.HATKID_DISCOUNT)
					else
						self.owner.replica.builder:SetIngredientMod(1)
					end
				end
			end

			return _PopulateRecipeDetailPanel(self, data, skin_name)
		end
	end)

	-- Server-side Discount
	AddComponentPostInit("builder", function(self)
		local _HasIngredients = self.HasIngredients

		self.HasIngredients = function(self, recipe)
			if self.inst:HasTag("hatkidcrafter") then
				local hatdiscount = false
				for k, v in pairs(TUNING.HATKID_CHEAP_HATS) do
					if v == recipe.product then
						hatdiscount = true
						break
					end
				end

				-- BIOHAZARD ZONE! DO NOT TOUCH INGREDIENTMOD IF A GREEN AMULET IS IN PLAY!!!!!
				local body = self.inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.BODY)
				-- if we're wearing something that isn't the green amulet or we aren't wearing anything at all, go ahead with the discount
				if (body and body.prefab ~= "greenamulet") or not body then
					if hatdiscount then
						self.ingredientmod = TUNING.HATKID_DISCOUNT
					else
						self.ingredientmod = 1
					end
				end
			end

			return _HasIngredients(self, recipe)
		end
	end)
end