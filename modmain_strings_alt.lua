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
STRINGS.CHARACTER_TITLES.hatkid = "The Illiterate"
STRINGS.CHARACTER_NAMES.hatkid = "Smug Kid"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Crafts hats faster and cheaper\n*Has her own weird hats\n*Needs something on her head (or else)\n*Willow sanity passive but again\n*Good at dying"
STRINGS.CHARACTER_QUOTES.hatkid = "\"Check your mailbox.\""
STRINGS.CHARACTER_SURVIVABILITY.hatkid = "no lol"

--Skin STRINGS
STRINGS.SKIN_NAMES.hatkid_none = "The Kid"
STRINGS.SKIN_QUOTES.hatkid_none = STRINGS.CHARACTER_QUOTES.hatkid
STRINGS.SKIN_DESCRIPTIONS.hatkid_none = "Oh my god it's the one cute character from that smug dancing video I watched that one time."

--Outfits
	STRINGS.SKIN_NAMES.ms_hatkid_cat = "The Anime"
	STRINGS.SKIN_QUOTES.ms_hatkid_cat = "\"I'm better than the toothpaste\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_cat = "My god, what are you doing?"

	STRINGS.SKIN_NAMES.ms_hatkid_detective = "The False Detective"
	STRINGS.SKIN_QUOTES.ms_hatkid_detective = "\"MYURDER?\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_detective = "Apparently you CAN just miss all the evidence on accident."

--Dyes
	STRINGS.SKIN_NAMES.ms_hatkid_dye_bowkid = "BFF Without Benefits" --Bow Kid
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_bowkid = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_bowkid = "https://www.youtube.com/watch?v=ERTNqL4zMl8"

	STRINGS.SKIN_NAMES.ms_hatkid_dye_groovy = "" --Wargroove
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_groovy = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_groovy = "Nobody Knows"

	STRINGS.SKIN_NAMES.ms_hatkid_dye_lunar = "Hilda (TV series)" --Hilda
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_lunar = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_lunar = "Hilda is an animated streaming television series based on the graphic novel series of the same name by Luke Pearson. Produced by Silvergate Media and Mercury Filmworks, the series follows the adventures of fearless Hilda, an 11-year-old blue-haired girl who, along with her deerfox Twig, moves to the city of Trolberg, where she befriends even the most dangerous monsters. The series debuted on September 21, 2018, as a Netflix miniseries to critical acclaim. Due to the positive response, the series was renewed for a second season on October 8, 2018. The world premiere of the first two episodes was at the New York International Children's Film Festival on February 25, 2018. The second season was released on December 14, 2020, and a film titled Hilda and the Mountain King premiered on Netflix on December 30, 2021."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_niko = "Barrett M99 'OneShot' Sniper Rifle" --Oneshot
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_niko = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_niko = "Like the name suggests, it only has OneShot." -- https://steamcommunity.com/sharedfiles/filedetails/?id=1255304792

	STRINGS.SKIN_NAMES.ms_hatkid_dye_pinkdanger = "Lightish Red" -- Extremely Pink
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_pinkdanger = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_pinkdanger = "Look at it, it's not pink. It's like, uh.. a lightish red."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_sans = "Him" --Sans
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_sans = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_sans = "You feel your Wagstaff's crawling on your back."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_toonlink = "The Dank" -- Wind Waker
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_toonlink = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_toonlink = "DO NOT CALL Jack in the Box Munchie Meal at 3:00 AM"


	STRINGS.SKIN_NAMES.ms_hatkid_dye_oliver = "Magic Child" -- Oliver
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_oliver = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_oliver = "The AI will always make the worst choice I swear."

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
STRINGS.NAMES.BREWINGHAT = "リトルウィッチアカデミア"
STRINGS.NAMES.POLARHAT = "Diamond Tester"
STRINGS.NAMES.DWELLERMASK = "Green"
STRINGS.NAMES.TIMESTOPHAT = "ZA WARUDO"

STRINGS.NAMES.HATBRELLA = "Hungern"
	STRINGS.NAMES.HATBRELLA_BOWKID = "Pink Umbrella"

STRINGS.NAMES.HATBRELLAOPEN = "Open Hungern"
	STRINGS.NAMES.HATBRELLAOPEN_BOWKID = "Open Pink Umbrella"

STRINGS.NAMES.KIDPOTION_THROWABLE = "c2a4d"
STRINGS.NAMES.KIDPOTION = "c2a1"

--Recipe Descriptions
STRINGS.RECIPE_DESC.KIDHAT = "Will not work for anyone but you, amazing."
STRINGS.RECIPE_DESC.SPRINTHAT = "It's just gonna be on all the time now."
STRINGS.RECIPE_DESC.BREWINGHAT = "Weeb."
STRINGS.RECIPE_DESC.POLARHAT = "Do do do do do"
STRINGS.RECIPE_DESC.DWELLERMASK = "OOOOOHHH... GREEEEEEENNNN."
STRINGS.RECIPE_DESC.TIMESTOPHAT = "Slow down your enemies, and your PC!"

STRINGS.RECIPE_DESC.HATBRELLA = "Don't worry, Hungern has never eaten anyone...! That I know of..."

-- Wilson/Generic
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDHAT = "Child."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPRINTHAT = "Sus."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREWINGHAT = "What does that even mean?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POLARHAT = "ICE!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DWELLERMASK = "That's what the point of the mask is."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIMESTOPHAT = "STAR PLATINUM, ZA WARUDO"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLA = "Did you pick up the "
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATBRELLAOPEN = "Wow, gotta love the "

-- Only hat kid can obtain these
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION = "I'm a highly trained professional!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION_THROWABLE = "My god! What are you doing?!"