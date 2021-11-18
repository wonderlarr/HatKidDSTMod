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


	To be clear, I AM NOT GOOD AT CODING! However, I am good at using search engines, and copy pasting.

	A lot of the stuff written in this mod is absolutely disgusting, but it WORKS, and that's what matters.

	If you are for whatever reason using part of my mod to learn something, or as an example, feel free, but also try to improve it, 
	improving already existing code is a lot of what I did in this mod, be it code that was already in the mod, or snippets I borrowed from other people.

	Also, if you're looking to help me with my mod in any way, be it textures or code, or you just wanna chat,  join my super secret private and epic discord https://discord.gg/ysJRjaVUmu
	and make sure to give me an @, (I should just be named Skylarr).
]]

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

	--hatbrellas
	"hatbrella",
	"hatbrella2",

	--open hatbrellas
	"hatbrellaopen",
	"hatbrella2open",

	--player skins
	"hatkid_skin1",
	"hatkid_copy",

	--throwables
	"kidpotion",
	"kidpotion_throwable",

	--badges (not implemented yet)
	-- "hkr_badge_football",
	-- "hkr_badge_winter",
	
	--fx prefabs
	"brewinghat_explode",
	-- "hkr_aoerange",
	"hkr_icerange",
	"icecloud",
	"hatshatter",
	"hatshatter2",

	--testing
	"cooltarget",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/hatkid.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/hatkid_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/hatkid_silho.xml" ),

    Asset( "IMAGE", "bigportraits/hatkid.tex" ),
    Asset( "ATLAS", "bigportraits/hatkid.xml" ),
	
	Asset( "IMAGE", "images/map_icons/hatkid.tex" ),
	Asset( "ATLAS", "images/map_icons/hatkid.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_hatkid.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_hatkid.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_hatkid.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_hatkid.xml" ),
	
	Asset( "IMAGE", "images/names_hatkid.tex" ),
    Asset( "ATLAS", "images/names_hatkid.xml" ),
	
	Asset( "IMAGE", "images/names_gold_hatkid.tex" ),
    Asset( "ATLAS", "images/names_gold_hatkid.xml" ),
	
    Asset( "IMAGE", "bigportraits/hatkid_none.tex" ),
    Asset( "ATLAS", "bigportraits/hatkid_none.xml" ),
	
	Asset("SOUNDPACKAGE", "sound/kidpotion.fev"),
    Asset("SOUND", "sound/kidpotion.fsb"),

	Asset( "IMAGE", "images/gui/craftingtabicon.tex" ),
	Asset( "ATLAS", "images/gui/craftingtabicon.xml" ),
	
	Asset("SOUNDPACKAGE", "sound/icestomp.fev"),
    Asset("SOUND", "sound/icestomp.fsb"),

	Asset("SOUNDPACKAGE", "sound/sprinthat.fev"),
    Asset("SOUND", "sound/sprinthat.fsb"),
	
	Asset("SOUNDPACKAGE", "sound/dwellermask.fev"),
    Asset("SOUND", "sound/dwellermask.fsb"),
	
	Asset("SOUNDPACKAGE", "sound/timestophat.fev"),
    Asset("SOUND", "sound/timestophat.fsb"),
	
	Asset("SOUNDPACKAGE", "sound/brewinghat.fev"),
    Asset("SOUND", "sound/brewinghat.fsb"),
	
	Asset("ANIM", "anim/kidhat.zip"),
    Asset("ANIM", "anim/kidhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
	
    Asset("ATLAS", "images/gui/timepiece.xml"),
    Asset("IMAGE", "images/gui/timepiece.tex"),
	
    Asset("ATLAS", "images/gui/face_sleep.xml"),
    Asset("IMAGE", "images/gui/face_sleep.tex"),
	
    Asset("ATLAS", "images/gui/face_ready.xml"),
    Asset("IMAGE", "images/gui/face_ready.tex"),
	
	Asset("ATLAS", "images/gui/cd0.xml"),
    Asset("IMAGE", "images/gui/cd0.tex"),
	
	Asset("ATLAS", "images/gui/cd1.xml"),
    Asset("IMAGE", "images/gui/cd1.tex"),
	
	Asset("ATLAS", "images/gui/cd2.xml"),
    Asset("IMAGE", "images/gui/cd2.tex"),
	
	Asset("ATLAS", "images/gui/cd3.xml"),
    Asset("IMAGE", "images/gui/cd3.tex"),
	
	Asset("ATLAS", "images/gui/cd4.xml"),
    Asset("IMAGE", "images/gui/cd4.tex"),
	
	Asset("ATLAS", "images/gui/cd5.xml"),
    Asset("IMAGE", "images/gui/cd5.tex"),
	
	Asset("ATLAS", "images/gui/cd6.xml"),
    Asset("IMAGE", "images/gui/cd6.tex"),
	
	Asset("ATLAS", "images/gui/cd7.xml"),
    Asset("IMAGE", "images/gui/cd7.tex"),
	
	Asset("ATLAS", "images/gui/cd8.xml"),
    Asset("IMAGE", "images/gui/cd8.tex"),
	
	Asset("ANIM", "anim/cdmeter.zip"),
}

modimport("engine.lua") --Keyhandler engine

-- modimport("scripts/libs/skins_api.lua") -- Skins API, waiting for another update here.

-- Imports to keep the keyhandler from working while typing into various things.
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

--TUNING STUFF ----------- THESE ARE CONFIG VALUES! SET THESE UP!
TUNING.HATKID_ABILITYKEY = GetModConfigData("hatkid_polarhatkey")

GLOBAL.STRINGS.SKIN_NAMES.hatkid_none = "Hat Kid" -- (why is this here lol)


--Character stat config
TUNING.HATKIDSIZE = GetModConfigData("hatkidbasesize")
TUNING.HATKID_HEALTH = GetModConfigData("hatkidbasehp")
TUNING.HATKID_SANITY = GetModConfigData("hatkidbasesanity")
TUNING.HATKID_HUNGER = GetModConfigData("hatkidbasehunger")
TUNING.HATKIDRATE = GetModConfigData("hatkidrate")
TUNING.HATKIDDAMAGE = GetModConfigData("hatkiddamage")
TUNING.HATKIDSPEED = GetModConfigData("hatkidspeed")
TUNING.HATKIDNIGHTDRAIN = GetModConfigData("hatkidnightdrain")
TUNING.HATKIDSANITYDRAIN = GetModConfigData("hatkidsanitydrain")

--Hatbrella damage stuff
TUNING.HATBRELLA_DAMAGE = GetModConfigData("hatbrelladamage")
TUNING.HATBRELLA2_DAMAGE = GetModConfigData("hatbrella2damage")

--Open umbrellas
-- TUNING.HATBRELLAOPEN_DAMAGE = GetModConfigData("hatbrellaopendamage")
-- TUNING.HATBRELLA2OPEN_DAMAGE = GetModConfigData("hatbrella2opendamage")


--Old, but still used sprint hat config values.


--Sanity Aura configs
TUNING.HATKID_AURARATE = GetModConfigData("hatkidaurarate")
TUNING.HATKID_AURASIZE = GetModConfigData("hatkidaurasize")

--Hat stuff

--Sprint (old but still used stuff)
TUNING.SPRINTHAT_SPEED_MULT = GetModConfigData("sprinthatspeedmult")
TUNING.SPRINTHAT_HUNGER_BURNRATE = GetModConfigData("sprinthathungerburnrate")
TUNING.SPRINTHAT_SFX = GetModConfigData("sprinthatsfx")

--Brewing
TUNING.BREWINGHAT_COOLDOWN = GetModConfigData("brewcooldown")
TUNING.BREWINGHAT_CHARGETIME = GetModConfigData("brewcharge")
TUNING.BREWINGHAT_SLOWDOWN  = GetModConfigData("brewslow")
TUNING.BREWINGHAT_DAMAGE = GetModConfigData("brewdamage")
TUNING.BREWINGHAT_RADIUS  = GetModConfigData("brewradius")


--Polar
TUNING.POLARHAT_COOLDOWN = GetModConfigData("polarcooldown")
TUNING.POLARHAT_LEVEL = GetModConfigData("polarlevel")
TUNING.POLARHAT_TEMP = GetModConfigData("polartemp")
TUNING.POLARHAT_RADIUS = GetModConfigData("polarradius")


--Dweller
TUNING.DWELLERMASK_COOLDOWN = GetModConfigData("dwellercooldown")
TUNING.DWELLERMASK_DURATION = GetModConfigData("dwelleractive")
TUNING.DWELLERMASK_LINGER = GetModConfigData("dwellerlinger")
TUNING.DWELLERMASK_RADIUS = GetModConfigData("dwellerradius")

--Time Stop
TUNING.TIMESTOPHAT_COOLDOWN = GetModConfigData("timestopcooldown")
TUNING.TIMESTOPHAT_DURATION = GetModConfigData("timestopactive")
TUNING.TIMESTOPHAT_TIMESCALE = GetModConfigData("timestopscale")

--funny mode
TUNING.FUNNYMODE = GetModConfigData("funnymode")






TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.HATKID = {"kidhat", "hatbrella"} 
local mymodstartingitems = {
	kidhat = {atlas = "images/inventoryimages/kidhat.xml"},
	hatbrella = {atlas = "images/inventoryimages/hatbrella.xml"},
}
TUNING.STARTING_ITEM_IMAGE_OVERRIDE = type(TUNING.STARTING_ITEM_IMAGE_OVERRIDE) == "table" and GLOBAL.MergeMaps(TUNING.STARTING_ITEM_IMAGE_OVERRIDE, mymodstartingitems) or mymodstartingitems
GLOBAL.STRINGS.CHARACTER_SURVIVABILITY.hatkid = "Smol"

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local resolvefilepath = GLOBAL.resolvefilepath
local TUNING = GLOBAL.TUNING

-- The character select screen lines
STRINGS.CHARACTER_TITLES.hatkid = "The Hat Explorer"
STRINGS.CHARACTER_NAMES.hatkid = "Hat Kid"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Has all her cool hats\n*Sports her umbrella\n*A little weak\n*Slight sanity aura"
STRINGS.CHARACTER_QUOTES.hatkid = "\"Oh hi there!\""

-- Custom speech strings
STRINGS.CHARACTERS.HATKID = require "speech_hatkid"

STRINGS.NAMES.HATKID = "Hat Kid"

AddMinimapAtlas("images/map_icons/hatkid.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("hatkid", "FEMALE")

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATKID = 
{
	GENERIC = "It's Hat Kid!",
	ATTACKER = "That Hat Kid looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Hat Kid, friend of ghosts.",
	GHOST = "Hat Kid could use a heart.",
	FIRESTARTER = "That Hat Kid is starting fires!",
}

STRINGS.CHARACTERS.HATKID.DESCRIBE.HATKID = 
{
	GENERIC = "It's, uh... Is that me?",
	ATTACKER = "I don't like the way I look at myself.",
	MURDERER = "MYURRDERR!",
	REVIVER = "Nice job, me.",
	GHOST = "How am I dead?",
	FIRESTARTER = "Oh come on! We're better than this!",
}

STRINGS.NAMES.KIDHAT = "Kid's Hat"
STRINGS.NAMES.KIDHAT2 = "Insulated Kid's Hat"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDHAT = "It's a short and stout tophat."
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDHAT = "What a good hat."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.KIDHAT = "A top hat and a lighter, a perfect combination."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.KIDHAT = "Is tiny hat, but still good!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.KIDHAT = "A piece of finery to help forget the inescapable wild."
STRINGS.CHARACTERS.WX78.DESCRIBE.KIDHAT = "INFERIOR TOP HAT"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.KIDHAT = "How bourgeois."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.KIDHAT = "It's the right amount of fancy."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.KIDHAT = "Some fine haberdashery."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.KIDHAT = "It can't even fit me!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.KIDHAT = "Like father used to wear."
STRINGS.CHARACTERS.WINONA.DESCRIBE.KIDHAT = "How bourgeoisie."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.KIDHAT = "Would you look at that, it's a hat!"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.KIDHAT = "Hat."
STRINGS.CHARACTERS.WARLY.DESCRIBE.KIDHAT = "It's not my style."

STRINGS.RECIPE_DESC.KIDHAT = "Hat Kid's pride and joy."

STRINGS.NAMES.SPRINTHAT = "Sprint Hat"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPRINTHAT = "It's a tennis cap with wings on it."
STRINGS.CHARACTERS.HATKID.DESCRIBE.SPRINTHAT = "Gotta go fast, right?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.SPRINTHAT = "You could start a fire going that fast!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SPRINTHAT = "Hat is fast!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.SPRINTHAT = "It will still come, no matter how fast you run."
STRINGS.CHARACTERS.WX78.DESCRIBE.SPRINTHAT = "FAST HEADWEAR MOVING AT EXTREMELY HIGH SPEED"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPRINTHAT = "It makes me feel young again."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.SPRINTHAT = "Looks like those birds were good for something after all."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SPRINTHAT = "This hat holds an indescribable power."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SPRINTHAT = "The feathers fill me with energy!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.SPRINTHAT = "Weeeee!"
STRINGS.CHARACTERS.WINONA.DESCRIBE.SPRINTHAT = "That's quite the pair of feathers."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.KIDHAT = "Feathers and horns go well together."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.KIDHAT = "Fast hat"
STRINGS.CHARACTERS.WARLY.DESCRIBE.KIDHAT = "You could forage at lightning speeds with a hat like that."

STRINGS.RECIPE_DESC.SPRINTHAT = "Run a bit faster!"

STRINGS.NAMES.BREWINGHAT = "Brewing Hat"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREWINGHAT = "It's some sort of witch hat."
STRINGS.CHARACTERS.HATKID.DESCRIBE.BREWINGHAT = "It's spooky!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BREWINGHAT = "Potions are just another way to start fires!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BREWINGHAT = "Wolfgang is not scared of hat."
STRINGS.CHARACTERS.WENDY.DESCRIBE.BREWINGHAT = "It is as festive as it is lavender."
STRINGS.CHARACTERS.WX78.DESCRIBE.BREWINGHAT = "IT IS OUTDATED HARDWARE"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BREWINGHAT = "This hat appears to be imbued with a magic power."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BREWINGHAT = "That hat's giving me the creeps."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BREWINGHAT = "A hat befitting of a novice alchemist."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BREWINGHAT = "I prefer unicorns over potions."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.BREWINGHAT = "That's a fancy traffic cone!"
STRINGS.CHARACTERS.WINONA.DESCRIBE.BREWINGHAT = "You don't suppose there's toxic chemicals in this hat, is there?"
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.BREWINGHAT = "I hope the chemicals don't get into my horns."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.BREWINGHAT = "Hurty hat"
STRINGS.CHARACTERS.WARLY.DESCRIBE.BREWINGHAT = "This hat'd go great with my spices!"

STRINGS.RECIPE_DESC.BREWINGHAT = "Brew and throw explosive potions!"

STRINGS.NAMES.POLARHAT = "Ice Hat"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.POLARHAT = "A hat with ears."
STRINGS.CHARACTERS.HATKID.DESCRIBE.POLARHAT = "This hat is chill."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.POLARHAT = "Boo to this hat."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.POLARHAT = "Hat would make good ice cube!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.POLARHAT = "A familiar chilling embrace."
STRINGS.CHARACTERS.WX78.DESCRIBE.POLARHAT = "A GREAT EXTERNAL HEATSINK"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.POLARHAT = "This hat appears to suck out energy from anything it touches."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.POLARHAT = "Now I can keep a cool head."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.POLARHAT = "It's frosted around the sides."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.POLARHAT = "The power of the teddy bear is a frigid one."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.POLARHAT = "I guess it's nice."
STRINGS.CHARACTERS.WINONA.DESCRIBE.POLARHAT = "Now I don't have to take any breaks to cool off."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.POLARHAT = "This hat's pretty 'cool'."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.POLARHAT = "Cold hat"
STRINGS.CHARACTERS.WARLY.DESCRIBE.POLARHAT = "It gives me chills!"

STRINGS.RECIPE_DESC.POLARHAT = "Freeze the bad guys around you!"

STRINGS.NAMES.DWELLERMASK = "Dweller Mask"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DWELLERMASK = "It somehow acts as a light."
STRINGS.CHARACTERS.HATKID.DESCRIBE.DWELLERMASK = "This has changed just a little bit"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.DWELLERMASK = "Has science gone too far?"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DWELLERMASK = "Mask light up Wolfgang"
STRINGS.CHARACTERS.WENDY.DESCRIBE.DWELLERMASK = "It's oozing."
STRINGS.CHARACTERS.WX78.DESCRIBE.DWELLERMASK = "MASK DEFIES LOGIC"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DWELLERMASK = "I can almost sense it beckoning to something."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.DWELLERMASK = "Now I can keep a cool head."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DWELLERMASK = "It speaks with the shadow."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DWELLERMASK = "A mask of dark powers."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.DWELLERMASK = "Did you hear something?"
STRINGS.CHARACTERS.WINONA.DESCRIBE.DWELLERMASK = "It's, uh, a mask."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.DWELLERMASK = "Visions! Specters! I can see it all!"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.DWELLERMASK = "Scary mask"
STRINGS.CHARACTERS.WARLY.DESCRIBE.DWELLERMASK = "I must be crazy to fool around with this."

STRINGS.RECIPE_DESC.DWELLERMASK = "See through spirit's eyes."

STRINGS.NAMES.TIMESTOPHAT = "Time Stop Hat"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIMESTOPHAT = "A stylish rubber band."
STRINGS.CHARACTERS.HATKID.DESCRIBE.TIMESTOPHAT = "Totally not overpowered!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.TIMESTOPHAT = "Can't touch this!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.TIMESTOPHAT = "Hit Wolfgang! That is right... You can't."
STRINGS.CHARACTERS.WENDY.DESCRIBE.TIMESTOPHAT = "Death is inevitable, but this'll help."
STRINGS.CHARACTERS.WX78.DESCRIBE.TIMESTOPHAT = "IT CAN HIDE HUMAN MISTAKES"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.TIMESTOPHAT = "This hat appears to put it's wearers in a different plane."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.TIMESTOPHAT = "Looks like a watch for your head."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.TIMESTOPHAT = "It's above time to a disrespectful degree."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.TIMESTOPHAT = "It could turn anyone into an artful dodger."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.TIMESTOPHAT = "Is this for time traveling?"
STRINGS.CHARACTERS.WINONA.DESCRIBE.TIMESTOPHAT = "Smells like concentrated caffeine."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.TIMESTOPHAT = "How much time did it take for the creator to come up with that name?"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.TIMESTOPHAT = "Clock hat"
STRINGS.CHARACTERS.WARLY.DESCRIBE.TIMESTOPHAT = "Time waits for no one, except the person wearing this."

STRINGS.RECIPE_DESC.TIMESTOPHAT = "Slow everything down!"

STRINGS.NAMES.KIDGLASSES = "Celebrity Glasses"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDGLASSES = "That's a bit excessive."
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDGLASSES = "Fashionable!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.KIDGLASSES = "Let it burn!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.KIDGLASSES = "Wolfgang will be mighty superstar!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.KIDGLASSES = "If only Abagail could see me now..."
STRINGS.CHARACTERS.WX78.DESCRIBE.KIDGLASSES = "THIS IS A MISTAKE"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.KIDGLASSES = "The gem must be the source of the light."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.KIDGLASSES = "The life of stardom ain't for me."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.KIDGLASSES = "It makes me feel as if I'm being watched."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.KIDGLASSES = "What's a show without an audience?"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.KIDGLASSES = "Now which one of us is the cool guy?"
STRINGS.CHARACTERS.WINONA.DESCRIBE.KIDGLASSES = "It's something special, all right."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.KIDGLASSES = "A style ahead of our time."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.KIDGLASSES = "Shiny glasses"
STRINGS.CHARACTERS.WARLY.DESCRIBE.KIDGLASSES = "Quite the fashion statement."

STRINGS.RECIPE_DESC.KIDGLASSES = "Simply stylin'."

STRINGS.NAMES.HATBRELLA = "Blue Umbrella"
STRINGS.NAMES.HATBRELLA2 = "Red Umbrella"
STRINGS.NAMES.HATBRELLA3 = "Dark Umbrella"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA = "It's jammed shut."
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLA = "It has a good swing."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLA = "I don't like the color."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLA = "The rain hurts my mighty skin."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLA = "The clouds weep."
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLA = "THIS WONT KEEP ME RUST FREE."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLA = "A simple apparatus for keeping dry."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLA = "This will keep my beard dry, eh?"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLA = "So hard to find a straightened around here."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLA = "This is an otherworldly umbrella."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLA = "This should keep some of the rain off of us."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLA = "It serves its purpose."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLA = "No soggy imps on this fine day!"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLA = "Rain Taker"
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLA = "I will try to remember not to open indoors."

STRINGS.RECIPE_DESC.HATBRELLA = "Great for fending off crows and mafia."
STRINGS.RECIPE_DESC.HATBRELLA2 = "Getting an upgrade! 51 damage."
STRINGS.RECIPE_DESC.HATBRELLA3 = "A temporary weapon, with very high damage."

STRINGS.NAMES.HATBRELLAOPEN = "Open Blue Umbrella"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLAOPEN = "What a cute umbrella."
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLAOPEN = "Good for rain, I guess."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLAOPEN = "I don't like the color."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLAOPEN = "The rain hurts my mighty skin."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLAOPEN = "The clouds weep."
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLAOPEN = "THIS WILL KEEP ME RUST FREE."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLAOPEN = "A simple apparatus for keeping dry."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLAOPEN = "This will keep my beard dry, eh?"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLAOPEN = "So hard to find a straightened around here."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLAOPEN = "This is an otherworldly umbrella."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLAOPEN = "This should keep some of the rain off of us."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLAOPEN = "It serves its purpose."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLAOPEN = "No soggy imps on this fine day!"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLAOPEN = "Rain Taker"
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLAOPEN = "I will try to remember not to open indoors."

STRINGS.NAMES.HATBRELLA2OPEN = "Open Red Umbrella"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA2OPEN = "What a cute umbrella."
STRINGS.CHARACTERS.HATKID.DESCRIBE.HATBRELLA2OPEN = "Good for rain, I guess."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.HATBRELLA2OPEN = "I don't like the color."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HATBRELLA2OPEN = "The rain hurts my mighty skin."
STRINGS.CHARACTERS.WENDY.DESCRIBE.HATBRELLA2OPEN = "The clouds weep."
STRINGS.CHARACTERS.WX78.DESCRIBE.HATBRELLA2OPEN = "THIS WILL KEEP ME RUST FREE."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HATBRELLA2OPEN = "A simple apparatus for keeping dry."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.HATBRELLA2OPEN = "This will keep my beard dry, eh?"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HATBRELLA2OPEN = "So hard to find a straightened around here."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.HATBRELLA2OPEN = "This is an otherworldly umbrella."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.HATBRELLA2OPEN = "This should keep some of the rain off of us."
STRINGS.CHARACTERS.WINONA.DESCRIBE.HATBRELLA2OPEN = "It serves its purpose."
--dlc characters
STRINGS.CHARACTERS.WORTOX.DESCRIBE.HATBRELLA2OPEN = "No soggy imps on this fine day!"
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.HATBRELLA2OPEN = "Rain Taker"
STRINGS.CHARACTERS.WARLY.DESCRIBE.HATBRELLA2OPEN = "I will try to remember not to open indoors."


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
local HatTab = AddRecipeTab("Hats", 998, "images/gui/craftingtabicon.xml", "craftingtabicon.tex", "hatkidcrafter")


hatbrellarecipe = AddRecipe("hatbrella", 
{Ingredient("spear", 1), Ingredient("silk",4), Ingredient("twigs",6)},
HatTab,
TECH.SCIENCE_ONE, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/hatbrella.xml", 
"hatbrella.tex")






hatbrella2recipe = AddRecipe("hatbrella2", 
{Ingredient("hatbrella", 1, "images/inventoryimages/hatbrella.xml"), Ingredient("tentaclespike",1), Ingredient("nightmarefuel",4)},
HatTab,
TECH.SCIENCE_TWO, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/hatbrella2.xml", 
"hatbrella2.tex")




kidhatrecipe = AddRecipe("kidhat", 
{Ingredient("beefalowool", 4), Ingredient("goldnugget", 2)},
HatTab,
TECH.NONE, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/kidhat.xml", 
"kidhat.tex")





sprinthatrecipe = AddRecipe("sprinthat",
{Ingredient("feather_robin", 2), Ingredient("papyrus", 1), Ingredient("silk",4)},
HatTab,
TECH.SCIENCE_ONE,
nil,
nil,
nil,
nil,
"hatkidcrafter",
"images/inventoryimages/sprinthat.xml",
"sprinthat.tex")





polarhatrecipe = AddRecipe("polarhat", 
{Ingredient("winterhat", 1), Ingredient("ice", 10), Ingredient("bluegem",2)},
HatTab,
TECH.MAGIC_TWO, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/polarhat.xml", 
"polarhat.tex")




brewinghatrecipe = AddRecipe("brewinghat", 
{Ingredient("strawhat", 1), Ingredient("slurtleslime", 4), Ingredient("purplegem",1)},
HatTab,
TECH.MAGIC_TWO, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/brewinghat.xml", 
"brewinghat.tex")





dwellermaskrecipe = AddRecipe("dwellermask", 
{Ingredient("wormlight", 2), Ingredient("papyrus", 2), Ingredient("nightmarefuel",4)},
HatTab,
TECH.MAGIC_THREE, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/dwellermask.xml", 
"dwellermask.tex")





timestophatrecipe = AddRecipe("timestophat", 
{Ingredient("moonglass", 8), Ingredient("silk", 12), Ingredient("greengem",1)},
HatTab,
TECH.MOON_ALTAR_TWO, 
nil, 
nil, 
nil, 
nil, 
"hatkidcrafter", 
"images/inventoryimages/timestophat.xml", 
"timestophat.tex")


hatbrellarecipe.sortkey = 0
hatbrella2recipe.sortkey = 1

kidhatrecipe.sortkey = 5
sprinthatrecipe.sortkey = 6
brewinghatrecipe.sortkey = 7
polarhatrecipe.sortkey = 8
dwellermaskrecipe.sortkey = 9
timestophatrecipe.sortkey = 10


--*****************************************************************************************************************************************--
------------------------------------------------- Combat Component Adjustments by ZupaleX --------------------------------------------------------------
-------------------------------------------------------- to add/remove damagemodifier ------------------------------------------------- 
--*****************************************************************************************************************************************--

local function AddDamageModifier(self, key, mod)
  self.attack_damage_modifiers[key] = mod
end

local function RemoveDamageModifier(self, key)
  self.attack_damage_modifiers[key] = nil
end

local function GetDamageModifier(self)
  local mod = 1
  for k,v in pairs(self.attack_damage_modifiers) do
    mod = mod * v
  end
  return mod
end

local function RegisterNewCombatMembers(self)

  self.attack_damage_modifiers = {} -- % modifiers on self:CalcDamage()

  self.AddDamageModifier = AddDamageModifier
  self.RemoveDamageModifier = RemoveDamageModifier
  self.GetDamageModifier = GetDamageModifier
end

AddComponentPostInit("combat", function(self)
    if self.attack_damage_modifiers == nil then -- check if another mod already added this. cause we should not add this twice
        RegisterNewCombatMembers(self)

        local CalcDamageOld = self.CalcDamage

        self.CalcDamage = function(self, target, weapon, multiplier)
          local dmg = CalcDamageOld(self, target, weapon, multiplier)
          local bonus = self.damagebonus or 0 --not affected by multipliers

          return (dmg-bonus) * self:GetDamageModifier() + bonus
        end
    end
  end
)


-- Character Skins -- Removed, will be added later as a customization option before you spawn in.

-- local hatkid_skin1 = AddRecipe("hatkid_skin1",
-- {},
-- HatTab,
-- TECH.NONE,
-- nil,
-- nil,
-- nil,
-- nil,
-- "hatkidcrafter",
-- "images/inventoryimages/hatkid_skin1.xml", "hatkid_skin1.tex")
-- hatkid_skin1.sortkey = 1

-- STRINGS.NAMES.HATKID_SKIN1 = "Margin of Night"
-- STRINGS.RECIPE_DESC.HATKID_SKIN1 = "Dye your clothes!"

-- local hatkid_copy = AddRecipe("hatkid_copy",
-- {},
-- HatTab,
-- TECH.NONE,
-- nil,
-- nil,
-- nil,
-- nil,
-- "hatkidcrafter",
-- "images/inventoryimages/hatkid_copy.xml", "hatkid_copy.tex")
-- hatkid_copy.sortkey = 1

-- STRINGS.NAMES.HATKID_COPY = "Default"
-- STRINGS.RECIPE_DESC.HATKID_COPY = "Your regular look."

-- Kid's Hat Skins
--[[
 local kidhat_skin1 = AddRecipe("kidhat_skin1",
{Ingredient("kidhat", 1, "images/inventoryimages/kidhat.xml")},
HatTab,
TECH.NONE,
nil,
nil,
nil,
nil,
"hatkidcrafter",
"images/inventoryimages/kidhat_skin1.xml", "kidhat_skin1.tex")
kidhat_skin1.sortkey = 1

 local kidhat_hks1 = AddRecipe("kidhat_hks1",
{Ingredient("kidhat", 1, "images/inventoryimages/kidhat.xml")},
HatTab,
TECH.NONE,
nil,
nil,
nil,
nil,
"hatkidcrafter",
"images/inventoryimages/kidhat_hks1.xml", "kidhat_hks1.tex")
kidhat_hks1.sortkey = 1

 local kidhat_hks1_skin1 = AddRecipe("kidhat_hks1_skin1",
{Ingredient("kidhat", 1, "images/inventoryimages/kidhat.xml")},
HatTab,
TECH.NONE,
nil,
nil,
nil,
nil,
"hatkidcrafter",
"images/inventoryimages/kidhat_hks1_skin1.xml", "kidhat_hks1_skin1.tex")
kidhat_hks1_skin1.sortkey = 1
]]

table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "hatkid")


--[[
  _    _           _                    _       _   _   _   _                  _____               _          
 | |  | |         | |           /\     | |     (_) | | (_) | |                / ____|             | |         
 | |__| |   __ _  | |_         /  \    | |__    _  | |  _  | |_   _   _      | |        ___     __| |   ___   
 |  __  |  / _` | | __|       / /\ \   | '_ \  | | | | | | | __| | | | |     | |       / _ \   / _` |  / _ \  
 | |  | | | (_| | | |_       / ____ \  | |_) | | | | | | | | |_  | |_| |     | |____  | (_) | | (_| | |  __/  
 |_|  |_|  \__,_|  \__|     /_/    \_\ |_.__/  |_| |_| |_|  \__|  \__, |      \_____|  \___/   \__,_|  \___|  
                                                                   __/ |                                      
                                                                  |___/                                       
]]

--CURRENTLY BEING OBSOLSTED! IF THIS SOMEHOW MAKES IT OUT IN IT'S CURRENT STATE SOMETHING IS WRONG!
-- UPDATE (about 6 months later, after tons of burnout and other crap) THIS HAS BEEN "OBSOLSTED" SUCCESSFULLY!!!!!!
-- i know its spelled incorrectly i just realized now.

-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local mod_option = "hatkid_polarhatkey"
local character = "HATKID"
GLOBAL.TUNING[GLOBAL.string.upper(character)] = {}
GLOBAL.TUNING[GLOBAL.string.upper(character)].KEY = GetModConfigData(mod_option) or 122

local function Ability(inst)
	local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
	if hat ~= nil then
		hat:PushEvent("AbilityKey")
	end
end


-- This adds the handler, which means that if the server gets told "AbilityDown",
-- it will call the function, AbilityDown, above, with the correct player information on the server side.
AddModRPCHandler("HatKidRPC", "AbilityKeyDown", Ability)


-- Helps with sizing hat kid correctly in the character select
AddClassPostConstruct("widgets/redux/loadoutselect", function(self)
if self.puppet == nil or self.currentcharacter ~= "hatkid" then
    return
end
local puppet = self.puppet 

        puppet.animstate:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
        puppet.animstate:Show("HAT")
        puppet.animstate:Show("HAIR_HAT")
        puppet.animstate:Hide("HAIR_NOHAT")
        puppet.animstate:Hide("HAIR")
end)

-- Prevent Hat Kid from using her fist
-- Actually, no more. Damage nerf is enough.

-- AddStategraphPostInit("wilson", function(sg)
-- 	local _attack = sg.states["attack"] -- This specifies which state we're adding to
-- 	local _onenter = _attack.onenter
-- 	_attack.onenter = function(inst,...)
-- 		_onenter(inst,...)
-- 		local hand = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
-- 		if inst.prefab == "hatkid" and hand == nil then
-- 			-- if not hand and hand.prefab == nil then
-- 				-- inst:ClearBufferedAction() -- Cancel the attack after the initial animation.
-- 				inst.sg:RemoveStateTag("abouttoattack")
--                 inst:ClearBufferedAction()
--                 inst.sg:GoToState("idle", true)
-- 				-- inst.sg:GoToState("idle", true) -- Simulate getting hit, can't really do the weird jumping she does in the game anyway.
-- 				-- inst.components.combat:BlankOutAttacks(2)
-- 				inst.components.talker:Say(GetString(inst, "ACTIONFAIL_GENERIC")) -- Normally I encourage using preset lines in your speech file, but I'm lazy.
-- 			-- end
-- 		end
-- 	end
-- end)