--Item and character strings

-- String declarations
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
---- Item skin strings ----
STRINGS.SKIN_NAMES.kidhat_dye_niko = "Margin of the Night"
STRINGS.SKIN_NAMES.kidhat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.kidhat_dye_pinkdanger = "Cute `n Dangerous"

STRINGS.SKIN_NAMES.hatbrella_bowkid = "Bow Kid's Favorite"


---- Character skin strings ----
STRINGS.NAMES.HATKID = "Child"
STRINGS.CHARACTERS.HATKID = require "speech_hatkid" -- speech file

-- The character select screen lines
STRINGS.CHARACTER_TITLES.hatkid = "The Child"
STRINGS.CHARACTER_NAMES.hatkid = "Child"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child\n*Child"
STRINGS.CHARACTER_QUOTES.hatkid = "\"I am illiterate!\""
STRINGS.CHARACTER_SURVIVABILITY.hatkid = "Child"

--Skin STRINGS
STRINGS.SKIN_NAMES.hatkid_none = "Child"
STRINGS.SKIN_QUOTES.hatkid_none = STRINGS.CHARACTER_QUOTES.hatkid
STRINGS.SKIN_DESCRIPTIONS.hatkid_none = "Oh my god it's the one character from that smug dancing video I watched that one time."

--Outfits
	STRINGS.SKIN_NAMES.ms_hatkid_cat = "The Cat Girl"
	STRINGS.SKIN_QUOTES.ms_hatkid_cat = "\"FBI OPEN UP!\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_cat = "Oh my."

	STRINGS.SKIN_NAMES.ms_hatkid_detective = "The False Detective"
	STRINGS.SKIN_QUOTES.ms_hatkid_detective = "\"MYURDER?\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_detective = "Apparently you CAN just miss all the evidence on accident. Trust me, I watched someone do it."

--Dyes
	STRINGS.SKIN_NAMES.ms_hatkid_dye_bowkid = "The Other One" --Bow Kid
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_bowkid = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_bowkid = "The other child is rapidly approaching your location."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_groovy = "Nobody Knows" --Wargroove
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_groovy = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_groovy = ""

	STRINGS.SKIN_NAMES.ms_hatkid_dye_lunar = "Fire Emblem I think" --Hilda
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_lunar = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_lunar = "Probably anyway, I looked it up on google!"

	STRINGS.SKIN_NAMES.ms_hatkid_dye_niko = "THE CAT FROM ONESHOT" --Oneshot
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_niko = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_niko = "Meme-out with the cat from OneShot."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_pinkdanger = "Lightish Red" -- Extremely Pink
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_pinkdanger = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_pinkdanger = "Look at it, it's not pink. It's like, uh.. a lightish red."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_sans = "Sans" --Sans
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_sans = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_sans = "You feel your Wagstaff's crawling on your back."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_toonlink = "The Dank" -- Wind Waker
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_toonlink = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_toonlink = "DO NOT CALL Jack in the Box Munchie Meal at 3:00 AM"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATKID =
{
	GENERIC = "Destroy the child!",
	ATTACKER = "Destroy the child!",
	MURDERER = "Destroy the child!",
	REVIVER = "Destroy the child!",
	GHOST = "The child is destroyed!",
	FIRESTARTER = "Destroy the child!",
}


-- Item names
STRINGS.NAMES.KIDHAT = "Child's"
	-- STRINGS.NAMES.KIDHAT_CAT = STRINGS.NAMES.KIDHAT -- Does not exist
	STRINGS.NAMES.KIDHAT_DETECTIVE = "Child's Cap"
	STRINGS.NAMES.KIDHAT_DYE_NIKO = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_TOONLINK = STRINGS.NAMES.KIDHAT
	STRINGS.NAMES.KIDHAT_DYE_PINKDANGER = STRINGS.NAMES.KIDHAT

STRINGS.NAMES.SPRINTHAT = "Red Sus"
STRINGS.NAMES.BREWINGHAT = "which witch would watch which watch"
STRINGS.NAMES.POLARHAT = "Diamond Tester"
STRINGS.NAMES.DWELLERMASK = "Green"
STRINGS.NAMES.TIMESTOPHAT = "ZA WARUDO"

STRINGS.NAMES.HATBRELLA = "Blue Uhhh"
	STRINGS.NAMES.HATBRELLA_BOWKID = "Pink Uhhh"

STRINGS.NAMES.HATBRELLAOPEN = "Open Blue Uhhh"
	STRINGS.NAMES.HATBRELLAOPEN_BOWKID = "Open Pink Uhhh"

STRINGS.NAMES.KIDPOTION_THROWABLE = "Mad Concocktion"
STRINGS.NAMES.KIDPOTION = "Brewing Concocktion"

--Recipe Descriptions
STRINGS.RECIPE_DESC.KIDHAT = "Will not work for anyone but you, amazing."
STRINGS.RECIPE_DESC.SPRINTHAT = "It's just gonna be on all the time now."
STRINGS.RECIPE_DESC.BREWINGHAT = "Destroy the crock pots first."
STRINGS.RECIPE_DESC.POLARHAT = "Do do do do do"
STRINGS.RECIPE_DESC.DWELLERMASK = "OOOOOHHH... GREEEEEEENNNN."
STRINGS.RECIPE_DESC.TIMESTOPHAT = "Slow down your enemies, and your PC!"

STRINGS.RECIPE_DESC.HATBRELLA = "How"

-- Wilson/Generic
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDHAT = "Child."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPRINTHAT = "Sus."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREWINGHAT = "If two witches were watching two watches..."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POLARHAT = "ICE!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DWELLERMASK = "That's what the point of the mask is."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIMESTOPHAT = "STAR PLATINUM, ZA WARUDO"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA = "Did you pick up the "
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLAOPEN = "Wow, gotta love the "

-- Only hat kid can obtain these
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION = "Give it a little."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION_THROWABLE = "Oh my"