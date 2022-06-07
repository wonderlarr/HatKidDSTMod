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


-- Currently incompatible with Insight. sadly.

PrefabFiles = {
	"hatkid",
	"hatkid_none",

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
	"kidpotion_throwable",

	--collectables (disabled)
	-- "pon",
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

	--testing (disable in final)
	"cooltarget", -- This is a dummytarget prefab, but it only regens health when it is low.
}

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

    Asset( "IMAGE", "bigportraits/hatkid_cat.tex" ), -- Nyakuza
    Asset( "ATLAS", "bigportraits/hatkid_cat.xml" ),

	Asset( "IMAGE", "bigportraits/hatkid_detective.tex" ), -- Detective
    Asset( "ATLAS", "bigportraits/hatkid_detective.xml" ),
	
	-- For the dyes we don't have custom portraits, so we just point the atlas at the default portrait.
	-- This means we don't load a ton of duplicate textures theoretically, though I'm not sure how this works in memory
	-- At the very least it saves disk space
    Asset( "ATLAS", "bigportraits/hatkid_dye_niko.xml" ), --nightmargin is awesome i love oneshot
    Asset( "ATLAS", "bigportraits/hatkid_dye_toonlink.xml" ), -- toonlink is pretty cool too, my smash main
    Asset( "ATLAS", "bigportraits/hatkid_dye_pinkdanger.xml" ), -- my primary dye in the actual game

    Asset( "ATLAS", "bigportraits/hatkid_timestop.xml" ), -- redundant bigportrait for time stop skin. This shouldn't display but it keeps the client log happy.


}

-- Import modmain segments
modimport("modmain_strings.lua")
modimport("modmain_tuning.lua")
modimport("modmain_crafting.lua")
-- modimport("modmain_ponstuff.lua")

modimport("scripts/keyhandler.lua") --Keyhandler
modimport("scripts/character_skins_api.lua") -- Character Skins API
-- modimport("scripts/item_skins_api.lua") -- Item Skins API

-- Imports to keep the keyhandler from working while typing into various things.
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

-- Add Hat Kid to various things
AddModCharacter("hatkid", "FEMALE")
AddMinimapAtlas("images/map_icons/hatkid.xml")
AddSkinnableCharacter("hatkid") -- Character skin thing

-- Character Skins, thanks Hornet
local _G = GLOBAL
local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")

SKIN_AFFINITY_INFO.hatkid = {
	"hatkid_cat",
	"hatkid_detective",

	"hatkid_dye_niko",
	"hatkid_dye_toonlink",
	"hatkid_dye_pinkdanger",
}

--Hornet: The table of skins youre going to have, You can have as many skins as you want!

PREFAB_SKINS["hatkid"] = {
	--outfits
	"hatkid_none", 
	"hatkid_cat",
	"hatkid_detective",
	--"hatkid_raincoat", -- would be cool to have
	--"hatkid_snatcher",

	--dyes
	"hatkid_dye_niko",
	"hatkid_dye_toonlink",
	"hatkid_dye_pinkdanger",

} 

PREFAB_SKINS_IDS = {} --Make sure this is after you  change the PREFAB_SKINS["character"] table
for prefab,skins in pairs(PREFAB_SKINS) do
    PREFAB_SKINS_IDS[prefab] = {}
    for k,v in pairs(skins) do
      	  PREFAB_SKINS_IDS[prefab][v] = k
    end
end

-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local mod_option = "hatkid_polarhatkey"
local character = "HATKID"
GLOBAL.TUNING[GLOBAL.string.upper(character)] = {}
GLOBAL.TUNING[GLOBAL.string.upper(character)].KEY = GetModConfigData(mod_option) or 122

-- Push AbilityKey to any Hat Kid's hats.
local function Ability(inst)
	local hat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)
	if hat ~= nil and hat:HasTag("hatkidhat") then
		hat:PushEvent("AbilityKey")
	end
end

AddModRPCHandler("HatKidRPC", "AbilityKeyDown", Ability)

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
	
					if GLOBAL.EQUIPSLOTS.NECK ~= nil and v.slot == GLOBAL.EQUIPSLOTS.NECK then -- added for compatiblity with equipslot mods. hopefully they call their slot this.
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
			self:UpdateCursor()
		
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

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
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
			return item.prefab == "slurtleslime" -- compare only prefab name here, we only want to use the one item.
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

		inst.tick = inst:DoPeriodicTask(1, OnTick)

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

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
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
			return item.prefab == "nitre"
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

		inst.tick = inst:DoPeriodicTask(1, OnTick)

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

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
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

		inst.tick = inst:DoPeriodicTask(1, OnTick)

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

				if (maxfuel - currentfuel) > fueltogive then
					local fuelitem = inst.components.container:GetItemInSlot(1).components.stackable:Get(1)
					inst.components.fueled:TakeFuelItem(fuelitem, owner)
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

		inst.tick = inst:DoPeriodicTask(1, OnTick)

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

		-- Pseudo ForceStopHeavyLifting, since we're not actually in the sgwilson file, we can't access the local function for this.
		if inst.components.inventory:IsHeavyLifting() then
			inst.components.inventory:DropItem(
			inst.components.inventory:Unequip(GLOBAL.EQUIPSLOTS.BODY), true, true)
		end

		inst.components.locomotor:Stop()
		inst:ClearBufferedAction()

		inst.components.colouradder:PushColour("polarhat", 82 / 255, 115 / 255, 124 / 255, 0)

		inst.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
		inst.AnimState:PlayAnimation("frozen")

		inst.SoundEmitter:PlaySound("icestomp/sound/activate")

		inst:AddTag("alwaysblock")

		-- Just in case this somehow bugs out, force the player back to idle after 3 seconds, so they aren't stuck in place.
		-- Why did I name it jicle?
		-- TODO change to a SetTimeout (or whatever)
		inst.sg:SetTimeout(12 * FRAMES)
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
	end,
}
)