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


	To be clear, I AM NOT GOOD AT CODING! However, I am good at using search engines, logic, and copy pasting.

	A lot of the stuff written in this mod is absolutely disgusting, but it WORKS, and that's what matters.

	If you are for whatever reason using part of my mod to learn something, or as an example, feel free, but also try to improve it,
	improving already existing code is a lot of what I did in this mod, be it code that was already in the mod, or snippets I "borrowed" from somewhere else.

	Also, if you're looking to help me with my mod in any way, be it textures or code, or you just wanna chat,  join my super secret private and epic discord https://discord.gg/ysJRjaVUmu
	and make sure to give me an @. I'm Skylarr#9203.
]]


-- Currently incompatible with Insight. sadly.

PrefabFiles = {
	"hatkid",
	"hatkid_none",

	--player skins
	-- "hatkid_copy", -- default clothes

	--hats
    "kidhat",
	"sprinthat",
	"brewinghat",
	"polarhat",
	"dwellermask",
	"timestophat",

	--hatbrellas
	"hatbrella",
	-- "hatbrella2",

	--open hatbrellas
	"hatbrellaopen",
	-- "hatbrella2open",

	--throwables
	"kidpotion",
	"kidpotion_throwable",

	--badges (not implemented)
	-- "hkr_badge_football",
	-- "hkr_badge_winter",

	--collectables (disabled)
	-- "pon",
	-- "pon_heart",
	-- "timepiece",

	-- Dweller Placeables
	-- "dwellerplatform",
	-- "dwellerplatform_player_collision",
	-- "dwellerplatform_item_collision",
	-- "dwellerplatform_item",

	--fx prefabs
	"brewinghat_explode",
	"polarhat_explode",
	"sprint_puff",
	-- "hkr_aoe",
	"hkr_icerange",
	"icecloud",
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

	-- Crafting tabs
	Asset( "IMAGE", "images/gui/craftingtabicon.tex" ), -- Reused texture from Kid Hat, first swap image.
	Asset( "ATLAS", "images/gui/craftingtabicon.xml" ),

	Asset( "IMAGE", "images/gui/pontab.tex" ), -- Reused texture from Kid Hat, first swap image.
	Asset( "ATLAS", "images/gui/pontab.xml" ),

	-- Pon inventory
	Asset("ANIM", "anim/status_pons.zip"),
	Asset("ANIM", "anim/pons_icon.zip"),

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
    Asset( "ATLAS", "bigportraits/hatkid_dye_toonlink.xml" ), -- toonlink is pretty cool tool, my smash main
    Asset( "ATLAS", "bigportraits/hatkid_dye_pinkdanger.xml" ), -- pink dye

    Asset( "ATLAS", "bigportraits/hatkid_timestop.xml" ), -- redundant bigportrait for time stop skin. This shouldn't display but it keeps the client log happy.


}



-- Constants
GLOBAL.ABILITY_LIGHTRAD = 0.9403 -- This value is how light units translate to in game units while using specific settings with lights. Make sure you know what you're doing with this if you use it, it's not always accurate.

-- End Constants

modimport("engine.lua") --Keyhandler engine

-- Imports to keep the keyhandler from working while typing into various things.
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

-- Add Hat Kid to css and minimap
AddModCharacter("hatkid", "FEMALE")
AddMinimapAtlas("images/map_icons/hatkid.xml")


----------------------------------
-- Skin Stuff --------------------
----------------------------------

-- CHARACTER skins section, NOT item skins
--Thanks hornet
local _G = GLOBAL
local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")

modimport("skins_api") --Hornet: We import the file! If you named your file something else other than skins_api then youll want to rename this function to the name of the file

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
	--"hatkid_raincoat", -- plan on adding eventually
	--"hatkid_snatcher", -- plan on adding eventually

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


AddSkinnableCharacter("hatkid") --Hornet: The character youd like to skin, make sure you use the prefab name. And MAKE sure you run this function AFTER you import the skins_api file

-- ITEM skins section, NOT CHARACTER SKINS
-- Thanks Cunning Fox

-- BROKEN as of the crafting menu update! 
-- modimport("scripts/libs/skins_api.lua")



-- Character ingredient hack
-- Apparently making new character ingredients is either not easy as I thought when I started,
-- or I overlooked some simple function or method that does this all for me. Either way, I've done this mess now,
-- and it works.


-- We start by adding pon as a global constant
GLOBAL.CHARACTER_INGREDIENT.PON = "pon"


-- Here we hook into a function that tells things our ingredient IS a character ingredient
local _IsCharacterIngredient = GLOBAL.IsCharacterIngredient

 -- We must replace IsCharacterIngredient, for some reason we can't add Pon to CHARACTER_INGREDIENT properly ourselves.
GLOBAL.IsCharacterIngredient = function(ingredienttype)
	if ingredienttype == "pon" then
		return ingredienttype ~= nil
	end

	local ret = _IsCharacterIngredient(ingredienttype)
	return ret
end


-- Here we replace some stuff in Builder so we can use pon properly in recipes
AddComponentPostInit("builder", function(self)
	-- Remove Ingredients
	local _RemoveIngredients = self.RemoveIngredients

	self.RemoveIngredients = function(self, ingredients, recname)
		local recipe = GLOBAL.AllRecipes[recname]

		if recipe then
			for k,v in pairs(recipe.character_ingredients) do
				if v.type == GLOBAL.CHARACTER_INGREDIENT.PON then
					-- print("-------------------------------------------------------------------------")
	
					-- print(self.inst.prefab)
					self.inst.pons = math.max(self.inst.pons - v.amount, 0)
					-- self.inst:PushEvent("")
				end
			end
		end
		local ret = _RemoveIngredients(self, ingredients, recname)
		return ret
	end



	-- Has Ingredients
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
			if self.inst.pons ~= nil then
				local current = math.ceil(self.inst.pons)
				return current >= ingredient.amount, current
			end
		end


		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)

AddClassPostConstruct("components/builder_replica", function(self)
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if self.inst.components.builder ~= nil then
			return self.inst.components.builder:HasCharacterIngredient(ingredient)
		elseif self.classified ~= nil then
			-- print("local hook success")
			if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
				-- print("-------------------------------------------------------------------------")
				local pons = self.inst.pons
				-- print(self.inst.prefab)
				if pons ~= nil then
					local current = math.ceil(pons)
					return current >= ingredient.amount, current
				end
			end  
		end	
		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)


AddClassPostConstruct("components/inventory_replica", function(self)
	local _GetNumSlotsreplica = self.GetNumSlots
	function self:GetNumSlots(...)
		if self.inst.components.inventory ~= nil then
			return self.inst.components.inventory:GetNumSlots()
		else
			return self.inst.maxslotsinv or _GetNumSlotsreplica(self, ...)
		end
	end	
end)

local _makereadonly = GLOBAL.makereadonly
function GLOBAL.makereadonly(t, k)
	if k == "maxslots" then
		return
	end
	
	_makereadonly(t, k)
end



--TUNING STUFF
TUNING.HATKID_ABILITYKEY = GetModConfigData("hatkid_polarhatkey")


--Character stat config
TUNING.HATKIDSIZE = GetModConfigData("hatkidbasesize")
TUNING.HATKID_HEALTH = GetModConfigData("hatkidbasehp")
TUNING.HATKID_SANITY = GetModConfigData("hatkidbasesanity")
TUNING.HATKID_HUNGER = GetModConfigData("hatkidbasehunger")
TUNING.HATKIDRATE = GetModConfigData("hatkidrate")
TUNING.HATKIDDAMAGEDEALT = GetModConfigData("hatkiddamagedealt")
TUNING.HATKIDDAMAGETAKEN = GetModConfigData("hatkiddamagetaken")
TUNING.HATKIDSPEED = GetModConfigData("hatkidspeed")
TUNING.HATKIDNIGHTDRAIN = GetModConfigData("hatkidnightdrain")
TUNING.HATKIDSANITYDRAIN = GetModConfigData("hatkidsanitydrain")
TUNING.HATKIDSANITYMULT = GetModConfigData("hatkidsanitymult")



--Hatbrella stuff
TUNING.HATBRELLA_DAMAGE = GetModConfigData("hatbrelladamage")
TUNING.HATBRELLA_OPENDURABILITY = GetModConfigData("hatbrellaopendurability")
TUNING.HATBRELLA_DURABILITY = GetModConfigData("hatbrelladurability")

--Togglables
TUNING.ENABLE_PONS = GetModConfigData("enablepons")

--Hat stuff
--Kid Hat
TUNING.KIDHAT_DURABILITY = GetModConfigData("kidhatdurability")

--Sprint
TUNING.SPRINTHAT_DURABILITY = GetModConfigData("sprinthatdurability")
TUNING.SPRINTHAT_SPEED_MULT = GetModConfigData("sprinthatspeedmult")
TUNING.SPRINTHAT_HUNGER_BURNRATE = GetModConfigData("sprinthathungerburnrate")
TUNING.SPRINTHAT_SFX = GetModConfigData("sprinthatsfx")

--Brewing
TUNING.BREWINGHAT_DURABILITY = GetModConfigData("brewdurability")
TUNING.BREWINGHAT_COOLDOWN = GetModConfigData("brewcooldown")
TUNING.BREWINGHAT_CHARGETIME = GetModConfigData("brewcharge")
TUNING.BREWINGHAT_SLOWDOWN  = GetModConfigData("brewslow")
TUNING.BREWINGHAT_DAMAGE = GetModConfigData("brewdamage")
TUNING.BREWINGHAT_RADIUS  = GetModConfigData("brewradius")


--Polar
TUNING.POLARHAT_DURABILITY = GetModConfigData("polardurability")
TUNING.POLARHAT_COOLDOWN = GetModConfigData("polarcooldown")
TUNING.POLARHAT_LEVEL = GetModConfigData("polarlevel")
TUNING.POLARHAT_TEMP = GetModConfigData("polartemp")
TUNING.POLARHAT_RADIUS = GetModConfigData("polarradius")


--Dweller
TUNING.DWELLERMASK_DURABILITY = GetModConfigData("dwellerdurability")
TUNING.DWELLERMASK_COOLDOWN = GetModConfigData("dwellercooldown")
TUNING.DWELLERMASK_DURATION = GetModConfigData("dwelleractive")
TUNING.DWELLERMASK_LINGER = GetModConfigData("dwellerlinger")
TUNING.DWELLERMASK_RADIUS = GetModConfigData("dwellerradius")

--Time Stop
TUNING.TIMESTOPHAT_DURABILITY = GetModConfigData("timestopdurability")
TUNING.TIMESTOPHAT_COOLDOWN = GetModConfigData("timestopcooldown")
TUNING.TIMESTOPHAT_DURATION = GetModConfigData("timestopactive")
TUNING.TIMESTOPHAT_TIMESCALE = GetModConfigData("timestopscale")

-- Pons and Badges
TUNING.PONS_MAX = GetModConfigData("ponsmax")

--funny mode
TUNING.FUNNYMODE = GetModConfigData("funnymode")


TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.HATKID = {"kidhat"}



--[[
   _____                   __   _     _                        _____   _              __    __
  / ____|                 / _| | |   (_)                      / ____| | |            / _|  / _|
 | |       _ __    __ _  | |_  | |_   _   _ __     __ _      | (___   | |_   _   _  | |_  | |_
 | |      | '__|  / _` | |  _| | __| | | | '_ \   / _` |      \___ \  | __| | | | | |  _| |  _|
 | |____  | |    | (_| | | |   | |_  | | | | | | | (_| |      ____) | | |_  | |_| | | |   | |
  \_____| |_|     \__,_| |_|    \__| |_| |_| |_|  \__, |     |_____/   \__|  \__,_| |_|   |_|
                                                   __/ |
                                                  |___/
]]

AddCharacterRecipe("hatbrella",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 1),	
		GLOBAL.Ingredient("twigs", 2),
		GLOBAL.Ingredient("goldnugget", 1),
	},
	GLOBAL.TECH.SCIENCE_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WEAPONS",
		"RAIN",
		"SUMMER"
	}
)


AddCharacterRecipe("kidhat",
	{ -- ingredients
	GLOBAL.Ingredient("beefalowool", 4),
	GLOBAL.Ingredient("goldnugget", 1),
	},
	GLOBAL.TECH.NONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)


AddCharacterRecipe("sprinthat",
	{ -- ingredients
	GLOBAL.Ingredient("silk", 1),	
	GLOBAL.Ingredient("beefalowool", 4),
	GLOBAL.Ingredient("feather_robin", 2),
	},
	GLOBAL.TECH.SCIENCE_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)


AddCharacterRecipe("brewinghat",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 3),
		GLOBAL.Ingredient("slurtleslime", 2),
		GLOBAL.Ingredient("purplegem", 1),
	},
	GLOBAL.TECH.MAGIC_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WEAPONS",
		"TOOLS",
		"CLOTHING"
	}
)

AddCharacterRecipe("polarhat",
	{ -- ingredients
		GLOBAL.Ingredient("winterhat", 1),
		GLOBAL.Ingredient("ice", 3),
		GLOBAL.Ingredient("bluegem", 1),
	},
	GLOBAL.TECH.MAGIC_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"WINTER",
		"SUMMER",
		"CLOTHING"
	}
)

AddCharacterRecipe("dwellermask",
	{ -- ingredients
		GLOBAL.Ingredient("nightmarefuel", 6),
		GLOBAL.Ingredient("thulecite", 2),
		GLOBAL.Ingredient("greengem", 1)
	},
	GLOBAL.TECH.MAGIC_THREE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"LIGHT",
		"RESTORATION",
		"ARMOUR",
		"CLOTHING"
	}
)

AddCharacterRecipe("timestophat",
	{ -- ingredients
		GLOBAL.Ingredient("silk", 4),	
		GLOBAL.Ingredient("moonglass", 3),
		GLOBAL.Ingredient("greengem", 1),
	},
	GLOBAL.TECH.MOON_ALTAR_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)

-- End crafting

-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local mod_option = "hatkid_polarhatkey"
local character = "HATKID"
GLOBAL.TUNING[GLOBAL.string.upper(character)] = {}
GLOBAL.TUNING[GLOBAL.string.upper(character)].KEY = GetModConfigData(mod_option) or 122

-- This is gross.
local function Ability(inst)
	local hat = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD)
	if hat ~= nil then
		hat:PushEvent("AbilityKey")
	end
end


-- This adds the handler, which means that if the server gets told "AbilityDown",
-- it will call the function, AbilityDown, above, with the correct player information on the server side.
AddModRPCHandler("HatKidRPC", "AbilityKeyDown", Ability)

if TUNING.ENABLE_PONS then
	AddClassPostConstruct("widgets/statusdisplays", function(self)
		if self.owner:HasTag("hatkid") then
			if self.ponbadge == nil then
				local PonBadge      = require "widgets/ponbadge"

				self.ponbadge = self:AddChild(PonBadge(self.owner))
				

				-- Checks for combined status from the workshop. We should reposition if it's enabled.
				local cs_enabled = GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686")

				if cs_enabled then -- if using cs
					self.ponbadge:SetPosition(0, -52)
				else -- If we're using vanilla hud
					self.ponbadge:SetPosition(0, -130, 0)
				end

				self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
				self.ponbadge:SetClickable(true)

				self.owner:ListenForEvent("UpdatePons", function()
					self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
				end)
			end
		end
	end)
end



--Item and character strings

GLOBAL.STRINGS.CHARACTER_SURVIVABILITY.hatkid = "Smol"


-- String declarations
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
---- Item skin strings ----
STRINGS.SKIN_NAMES.kidhat_dye_niko = "Margin of the Night"
STRINGS.SKIN_NAMES.kidhat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.kidhat_dye_pinkdanger = "Cute `n Dangerous"

STRINGS.SKIN_NAMES.hatbrella_bowkid = "Bow Kid's Favorite"


---- Character skin strings ----
STRINGS.NAMES.HATKID = "Hat Kid"
STRINGS.CHARACTERS.HATKID = require "speech_hatkid" -- speech file

-- The character select screen lines
STRINGS.CHARACTER_TITLES.hatkid = "The Homesick Hatter"
STRINGS.CHARACTER_NAMES.hatkid = "Hat Kid"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Knits cool hats\n*Is selfish and obsessive over them\n*Has a vulnerable mind\n*Considered extremely cute"
STRINGS.CHARACTER_QUOTES.hatkid = "\"Oh, hi there!\""

--Skin STRINGS

	--Outfits
STRINGS.SKIN_NAMES.hatkid_none = "Hat Kid"
STRINGS.SKIN_NAMES.hatkid_cat = "The Nyakuza"
STRINGS.SKIN_NAMES.hatkid_detective = "The Detective"
	--Dyes
STRINGS.SKIN_NAMES.hatkid_dye_niko = "Margin of the Night" --Oneshot
STRINGS.SKIN_NAMES.hatkid_dye_toonlink = "The Forest Critter" -- Wind Waker
STRINGS.SKIN_NAMES.hatkid_dye_pinkdanger = "Cute 'n Dangerous" -- Extremely Pink


STRINGS.SKIN_QUOTES.hatkid_none = "\"Oh, hi there!\"" -- Redundant, mostly here for organization's sake. I believe the game uses the default quote with no skin selected, not this one.
STRINGS.SKIN_DESCRIPTIONS.hatkid_none = "A royal purple and gold outfit, best fit for a cute adventurer. Complete with a cape and a giant, very necessary zipper."

STRINGS.SKIN_QUOTES.hatkid_cat = "\"Cat crime!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_cat = "A cat themed varsity outfit, complete with mask and tail, which also may or may not be directly tied to countless illegal acts."

STRINGS.SKIN_QUOTES.hatkid_detective = "\"MYURDER!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_detective = "A detective outfit, worn by only the most mature of detectives!"

STRINGS.SKIN_QUOTES.hatkid_dye_niko = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_niko = "An outfit that you oddly associate with cats and lightbulbs."

STRINGS.SKIN_QUOTES.hatkid_dye_toonlink = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_toonlink = "Why would you ever want to wake up the wind? How would you even do that?"

STRINGS.SKIN_QUOTES.hatkid_dye_pinkdanger = "\"Oh, hi there!\""
STRINGS.SKIN_DESCRIPTIONS.hatkid_dye_pinkdanger = "An outfit with lethal amounts of lightish red."


STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATKID =
{
	GENERIC = "It's Hat Kid!",
	ATTACKER = "I hope she didn't mean to do that.",
	MURDERER = "A murder? On MY owl express?",
	REVIVER = "She must like ghosts.",
	GHOST = "We should help the poor kid.",
	FIRESTARTER = "Should she have matches?",
}

STRINGS.CHARACTERS.HATKID.DESCRIBE.HATKID =
{
	GENERIC = "Oh hi there!",
	ATTACKER = "I don't like her.",
	MURDERER = "MYURDER!",
	REVIVER = "Nice job, me.",
	GHOST = "How am I dead?",
	FIRESTARTER = "Oh come on! We're better than this!",
}


-- Item names
STRINGS.NAMES.KIDHAT = "Kid's Hat"
	-- STRINGS.NAMES.KIDHAT_CAT = STRINGS.NAMES.KIDHAT -- Does not exist
	STRINGS.NAMES.KIDHAT_DETECTIVE = "Detective's Cap"
	STRINGS.NAMES.KIDHAT_DYE_NIKO = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_TOONLINK = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_PINKDANGER = STRINGS.NAMES.KIDHAT

STRINGS.NAMES.SPRINTHAT = "Sprint Hat"
STRINGS.NAMES.BREWINGHAT = "Brewing Hat"
STRINGS.NAMES.POLARHAT = "Ice Hat"
STRINGS.NAMES.DWELLERMASK = "Dweller's Mask"
STRINGS.NAMES.TIMESTOPHAT = "Time Stop Hat"

STRINGS.NAMES.HATBRELLA = "Blue Umbrella"
	STRINGS.NAMES.HATBRELLA_BOWKID = "Pink Umbrella"

STRINGS.NAMES.HATBRELLAOPEN = "Open Blue Umbrella"
	STRINGS.NAMES.HATBRELLAOPEN_BOWKID = "Open Pink Umbrella"

STRINGS.NAMES.KIDPOTION_THROWABLE = "Mad Concoction"
STRINGS.NAMES.KIDPOTION = "Brewing Concoction"

--Recipe Descriptions
STRINGS.RECIPE_DESC.KIDHAT = "Your pride and joy."
STRINGS.RECIPE_DESC.SPRINTHAT = "This hat looks ready to sprint!"
STRINGS.RECIPE_DESC.BREWINGHAT = "Cook up mad concoctions!"
STRINGS.RECIPE_DESC.POLARHAT = "It's so cold!"
STRINGS.RECIPE_DESC.DWELLERMASK = "See the world through a Dweller's eyes!"
STRINGS.RECIPE_DESC.TIMESTOPHAT = "Death is inevitable. Your time is valuable."

STRINGS.RECIPE_DESC.HATBRELLA = "Diplomacy didn't work, time for action."

-- temporary
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION_THROWABLE = "Throwing these will be fun!"


--Describe strings, by order of css screen, but Hat Kid first.
-- generic is wilson, as well as any other undefined characters (eg. modded, future dlc's)

-- Hat Kid
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDHAT = "What a good hat."
STRINGS.CHARACTERS.HATKID.DESCRIBE.SPRINTHAT = "Gotta go fast, right?"
STRINGS.CHARACTERS.HATKID.DESCRIBE.BREWINGHAT = "It's spooky!"
STRINGS.CHARACTERS.HATKID.DESCRIBE.POLARHAT = "This hat is chill."
STRINGS.CHARACTERS.HATKID.DESCRIBE.DWELLERMASK = "This has changed just a little bit"
STRINGS.CHARACTERS.HATKID.DESCRIBE.TIMESTOPHAT = "Totally not overpowered!"
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLA = "It has a good swing."
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLAOPEN = "Good for rain, I guess."

-- Wilson/Generic
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDHAT = "It's a short and stout tophat."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPRINTHAT = "It's a tennis cap with wings on it."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREWINGHAT = "It's some sort of witch hat."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POLARHAT = "A hat with ears."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DWELLERMASK = "It somehow acts as a light."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIMESTOPHAT = "A stylish rubber band."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA = "It's jammed shut."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLAOPEN = "What a cute umbrella."

-- Willow
STRINGS.CHARACTERS.WILLOW.DESCRIBE.KIDHAT = "A top hat and a lighter, a perfect combination."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.SPRINTHAT = "You could start a fire going that fast!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BREWINGHAT = "Potions are just another way to start fires!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.POLARHAT = "Boo to this hat."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.DWELLERMASK = "Has science gone too far?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.TIMESTOPHAT = "Can't touch this!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLA = "I don't like the color."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLAOPEN = "I don't like the color."

-- Wolfgang
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.KIDHAT = "Is tiny hat, but still good!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SPRINTHAT = "Hat is fast!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BREWINGHAT = "Wolfgang is not scared of hat."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.POLARHAT = "Hat would make good ice cube!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DWELLERMASK = "Mask light up Wolfgang"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.TIMESTOPHAT = "Hit Wolfgang! That is right... You can't."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLA = "The rain hurts my mighty skin."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLAOPEN = "The rain hurts my mighty skin."

-- Wendy
STRINGS.CHARACTERS.WENDY.DESCRIBE.KIDHAT = "A piece of finery to help forget the inescapable wild."
STRINGS.CHARACTERS.WENDY.DESCRIBE.SPRINTHAT = "It will still come, no matter how fast you run."
STRINGS.CHARACTERS.WENDY.DESCRIBE.BREWINGHAT = "It is as festive as it is lavender."
STRINGS.CHARACTERS.WENDY.DESCRIBE.POLARHAT = "A familiar chilling embrace."
STRINGS.CHARACTERS.WENDY.DESCRIBE.DWELLERMASK = "It's oozing."
STRINGS.CHARACTERS.WENDY.DESCRIBE.TIMESTOPHAT = "Death is inevitable, but this'll help."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLA = "The clouds weep."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLAOPEN = "The clouds weep."

-- WX78
STRINGS.CHARACTERS.WX78.DESCRIBE.KIDHAT = "INFERIOR TOP HAT"
STRINGS.CHARACTERS.WX78.DESCRIBE.SPRINTHAT = "FAST HEADWEAR MOVING AT EXTREMELY HIGH SPEED"
STRINGS.CHARACTERS.WX78.DESCRIBE.BREWINGHAT = "IT IS OUTDATED HARDWARE"
STRINGS.CHARACTERS.WX78.DESCRIBE.POLARHAT = "A GREAT EXTERNAL HEATSINK"
STRINGS.CHARACTERS.WX78.DESCRIBE.DWELLERMASK = "MASK DEFIES LOGIC"
STRINGS.CHARACTERS.WX78.DESCRIBE.TIMESTOPHAT = "IT CAN HIDE HUMAN MISTAKES"
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLA = "THIS WONT KEEP ME RUST FREE."
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLAOPEN = "THIS WILL KEEP ME RUST FREE."

-- Wickerbottom
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.KIDHAT = "How bourgeois."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPRINTHAT = "It makes me feel young again."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BREWINGHAT = "This hat appears to be imbued with a magic power."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.POLARHAT = "This hat appears to suck out energy from anything it touches."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DWELLERMASK = "I can almost sense it beckoning to something."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.TIMESTOPHAT = "This hat appears to put it's wearers in a different plane."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLA = "A simple apparatus for keeping dry."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLAOPEN = "A simple apparatus for keeping dry."

-- Woodie
STRINGS.CHARACTERS.WOODIE.DESCRIBE.KIDHAT = "It's the right amount of fancy."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.SPRINTHAT = "Looks like those birds were good for something after all."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BREWINGHAT = "That hat's giving me the creeps."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.POLARHAT = "Now I can keep a cool head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.DWELLERMASK = "Now I can keep a cool head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.TIMESTOPHAT = "Looks like a watch for your head."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLA = "This will keep my beard dry, eh?"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLAOPEN = "This will keep my beard dry, eh?"

-- Maxwell (Waxwell)
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.KIDHAT = "Some fine haberdashery."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SPRINTHAT = "This hat holds an indescribable power."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BREWINGHAT = "A hat befitting of a novice alchemist."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.POLARHAT = "It's frosted around the sides."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DWELLERMASK = "It speaks with the shadow."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.TIMESTOPHAT = "It's above time to a disrespectful degree."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLA = "So hard to find a straightened around here."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLAOPEN = "So hard to find a straightened around here."

-- Wigfrid (Wathgrithr)
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.KIDHAT = "It can't even fit me!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SPRINTHAT = "The feathers fill me with energy!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BREWINGHAT = "I prefer unicorns over potions."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.POLARHAT = "The power of the teddy bear is a frigid one."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DWELLERMASK = "A mask of dark powers."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.TIMESTOPHAT = "It could turn anyone into an artful dodger."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLA = "This is an otherworldly umbrella."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLAOPEN = "This is an otherworldly umbrella."

-- Webber
STRINGS.CHARACTERS.WEBBER.DESCRIBE.KIDHAT = "Like father used to wear."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.SPRINTHAT = "Weeeee!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.BREWINGHAT = "That's a fancy traffic cone!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.POLARHAT = "I guess it's nice."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.DWELLERMASK = "Did you hear something?"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.TIMESTOPHAT = "Is this for time traveling?"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLA = "This should keep some of the rain off of us."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLAOPEN = "This should keep some of the rain off of us."

-- Winona
STRINGS.CHARACTERS.WINONA.DESCRIBE.KIDHAT = "How bourgeoisie."
STRINGS.CHARACTERS.WINONA.DESCRIBE.SPRINTHAT = "That's quite the pair of feathers."
STRINGS.CHARACTERS.WINONA.DESCRIBE.BREWINGHAT = "You don't suppose there's toxic chemicals in this hat, is there?"
STRINGS.CHARACTERS.WINONA.DESCRIBE.POLARHAT = "Now I don't have to take any breaks to cool off."
STRINGS.CHARACTERS.WINONA.DESCRIBE.DWELLERMASK = "It's, uh, a mask."
STRINGS.CHARACTERS.WINONA.DESCRIBE.TIMESTOPHAT = "Smells like concentrated caffeine."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLA = "It serves its purpose."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLAOPEN = "It serves its purpose."

-- Start DLC
-- Warly
STRINGS.CHARACTERS.WARLY.DESCRIBE.KIDHAT = "It's not my style."
STRINGS.CHARACTERS.WARLY.DESCRIBE.SPRINTHAT = "You could forage at lightning speeds with a hat like that."
STRINGS.CHARACTERS.WARLY.DESCRIBE.BREWINGHAT = "This hat'd go great with my spices!"
STRINGS.CHARACTERS.WARLY.DESCRIBE.POLARHAT = "It gives me chills!"
STRINGS.CHARACTERS.WARLY.DESCRIBE.DWELLERMASK = "I must be crazy to fool around with this."
STRINGS.CHARACTERS.WARLY.DESCRIBE.TIMESTOPHAT = "Time waits for no one, except the person wearing this."
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLA = "I will try to remember not to open indoors."
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLAOPEN = "I will try to remember not to open indoors."


-- Wortox
STRINGS.CHARACTERS.WORTOX.DESCRIBE.KIDHAT = "Would you look at that, it's a hat!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.SPRINTHAT = "Feathers and horns go well together."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.BREWINGHAT = "I hope the chemicals don't get into my horns."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.POLARHAT = "This hat's pretty 'cool'."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.DWELLERMASK = "Visions! Specters! I can see it all!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.TIMESTOPHAT = "Seems a little scary. I like it."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLA = "No soggy imps on this fine day!"
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLAOPEN = "No soggy imps on this fine day!"

-- Wormwood
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.KIDHAT = "Hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.SPRINTHAT = "Fast hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.BREWINGHAT = "Hurty hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.POLARHAT = "Cold hat."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.DWELLERMASK = "Greeeeeen."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.TIMESTOPHAT = "Clock hat"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLA = "Pain Bringer"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLAOPEN = "Rain Taker"

-- Wurt
STRINGS.CHARACTERS.WURT.DESCRIBE.KIDHAT = "Nice hat."
STRINGS.CHARACTERS.WURT.DESCRIBE.SPRINTHAT = "Make girl go fast."
STRINGS.CHARACTERS.WURT.DESCRIBE.BREWINGHAT = "GLORPT! I don't wanna explode!"
STRINGS.CHARACTERS.WURT.DESCRIBE.POLARHAT = "Very cold, florp."
STRINGS.CHARACTERS.WURT.DESCRIBE.DWELLERMASK = "We see at night with scary mask."
STRINGS.CHARACTERS.WURT.DESCRIBE.TIMESTOPHAT = "Won't slow ME down, florp."
STRINGS.CHARACTERS.WURT.DESCRIBE.HATBRELLA = "Umbrella is closed."
STRINGS.CHARACTERS.WURT.DESCRIBE.HATBRELLAOPEN = "No more wet!"

-- Walter
STRINGS.CHARACTERS.WALTER.DESCRIBE.KIDHAT = "A respectable hat for a respectable kid!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.SPRINTHAT = "Woah! That's gotta make you go fast, Hat Kid!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.BREWINGHAT = "Seems dangerous, I think I'll leave it alone."
STRINGS.CHARACTERS.WALTER.DESCRIBE.POLARHAT = "Not my style, like I care anyway."
STRINGS.CHARACTERS.WALTER.DESCRIBE.DWELLERMASK = "Oooooo! I love scary stuff!"
STRINGS.CHARACTERS.WALTER.DESCRIBE.TIMESTOPHAT = "As long as it doesn't slow down Woby."
STRINGS.CHARACTERS.WALTER.DESCRIBE.HATBRELLA = "What a small umbrella."
STRINGS.CHARACTERS.WALTER.DESCRIBE.HATBRELLAOPEN = "Does that thing work well?"

-- Wanda
STRINGS.CHARACTERS.WANDA.DESCRIBE.KIDHAT = "A tiny little hat for a homesick hatter."
STRINGS.CHARACTERS.WANDA.DESCRIBE.SPRINTHAT = "The less time spent running, the better."
STRINGS.CHARACTERS.WANDA.DESCRIBE.BREWINGHAT = "Such destruction."
STRINGS.CHARACTERS.WANDA.DESCRIBE.POLARHAT = "Looks cold."
STRINGS.CHARACTERS.WANDA.DESCRIBE.DWELLERMASK = "Not this time."
STRINGS.CHARACTERS.WANDA.DESCRIBE.TIMESTOPHAT = "I'd love to try THAT out!"
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLA = "Seems small, but it must hurt."
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLAOPEN = "Time and umbrellas?"

AddClassPostConstruct("widgets/redux/craftingmenu_skinselector", function(self)
	local _GetSkinsList = self.GetSkinsList
	
    self.GetSkinsList = function(self, ...)
		print("hook!-------------------------")
        return _GetSkinsList(self, ...)
    end
end)