--Item and character strings

-- String declarations
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
---- Item skin strings ----
STRINGS.SKIN_NAMES.ms_kidhat_dye_groovy = "2 Groovy"
STRINGS.SKIN_NAMES.ms_kidhat_dye_oliver = "Arcane Ocean"
STRINGS.SKIN_NAMES.ms_kidhat_dye_bowkid = "Best Friends Forever"
STRINGS.SKIN_NAMES.ms_kidhat_dye_sans = "Blue Flame"
STRINGS.SKIN_NAMES.ms_kidhat_dye_pinkdanger = "Cute 'n Dangerous"
STRINGS.SKIN_NAMES.ms_kidhat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.ms_kidhat_dye_lunar = "Lunar Lava"
STRINGS.SKIN_NAMES.ms_kidhat_dye_niko = "Margin of the Night"

STRINGS.SKIN_NAMES.ms_sprinthat_dye_groovy = "2 Groovy"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_oliver = "Arcane Ocean"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_bowkid = "Best Friends Forever"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_sans = "Blue Flame"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_pinkdanger = "Cute 'n Dangerous"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_lunar = "Lunar Lava"
STRINGS.SKIN_NAMES.ms_sprinthat_dye_niko = "Margin of the Night"

STRINGS.SKIN_NAMES.ms_brewinghat_dye_groovy = "2 Groovy"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_oliver = "Arcane Ocean"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_bowkid = "Best Friends Forever"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_sans = "Blue Flame"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_pinkdanger = "Cute 'n Dangerous"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_toonlink = "The Forest Critter"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_lunar = "Lunar Lava"
STRINGS.SKIN_NAMES.ms_brewinghat_dye_niko = "Margin of the Night"

STRINGS.SKIN_NAMES.ms_kidhat_bowkid = "The Bow"
STRINGS.SKIN_NAMES.ms_kidhat_detective = "Detective's Cap"


STRINGS.SKIN_NAMES.ms_hatbrella_bowkid = "Pink Umbrella"


---- Character skin strings ----
STRINGS.NAMES.HATKID = "Hat Kid"
STRINGS.CHARACTERS.HATKID = require "speech_hatkid" -- speech file

-- The character select screen lines
STRINGS.CHARACTER_TITLES.hatkid = "The Little Haberdasher"
STRINGS.CHARACTER_NAMES.hatkid = "Hat Kid"
STRINGS.CHARACTER_DESCRIPTIONS.hatkid = "*Is a grandmaster haberdasher\n*And is overreliant on headwear\n*Collects all sorts of things\n*Speaks an alien language"
STRINGS.CHARACTER_QUOTES.hatkid = "\"Oh, hi there!\""
STRINGS.CHARACTER_SURVIVABILITY.hatkid = "Grim"

--Skin STRINGS
STRINGS.SKIN_NAMES.hatkid_none = "Hat Kid"
STRINGS.SKIN_QUOTES.hatkid_none = STRINGS.CHARACTER_QUOTES.hatkid
STRINGS.SKIN_DESCRIPTIONS.hatkid_none = "A royal purple and gold outfit, best fit for a cute adventurer. Complete with a cape, and a giant, very necessary zipper."

--Bow Kid
	STRINGS.SKIN_NAMES.ms_bowkid = "Bow Kid"
	STRINGS.SKIN_QUOTES.ms_bowkid = "Hello?"
	STRINGS.SKIN_DESCRIPTIONS.ms_bowkid = "A great partner for a big adventure."

--Outfits
	STRINGS.SKIN_NAMES.ms_hatkid_cat = "The Nyakuza"
	STRINGS.SKIN_QUOTES.ms_hatkid_cat = "\"Cat crime!\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_cat = "A cat themed varsity outfit, complete with mask and tail, which also may or may not be directly tied to some major organized crimes. But that's only a maybe."

	STRINGS.SKIN_NAMES.ms_hatkid_detective = "The Detective"
	STRINGS.SKIN_QUOTES.ms_hatkid_detective = "\"MYURDER!\""
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_detective = "A detective outfit, worn by only the most mature of detectives! Bubble Pipe not included."

--Dyes
	STRINGS.SKIN_NAMES.ms_hatkid_dye_bowkid = "Best Friends Forever" --Bow Kid
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_bowkid = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_bowkid = "A bright blue and green outfit, the same colors your BFF wears!"

	STRINGS.SKIN_NAMES.ms_hatkid_dye_groovy = "2 Groovy" --Wargroove
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_groovy = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_groovy = "A dark turquoise and deep purple outfit. Traditionally available in sets of two, for double the trouble."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_lunar = "Lunar Lava" --Hilda
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_lunar = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_lunar = "A pale teal and red outfit, seemingly fit for another little adventurer. NOTICE: This outfit may attract trolls!"

	STRINGS.SKIN_NAMES.ms_hatkid_dye_niko = "Margin of the Night" --Oneshot
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_niko = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_niko = "A dark maroon and purple outfit, seemingly fit for a small messiah."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_pinkdanger = "Cute 'n Dangerous" -- Extremely Pink
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_pinkdanger = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_pinkdanger = "A very pink, and cute outfit. It's just pink."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_sans = "Blue Flame" --Sans (I hate Ian)
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_sans = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_sans = "A blue outfit with a bit of pink. You're gonna have a good time."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_toonlink = "Forest Critter" -- Wind Waker
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_toonlink = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_toonlink = "A very green outfit, reminding you of sailing, oddly enough."

	STRINGS.SKIN_NAMES.ms_hatkid_dye_oliver = "Arcane Ocean" -- Oliver
	STRINGS.SKIN_QUOTES.ms_hatkid_dye_oliver = STRINGS.CHARACTER_QUOTES.hatkid
	STRINGS.SKIN_DESCRIPTIONS.ms_hatkid_dye_oliver = "A set of white, baby blue, and red clothes. It seems magical and familiar."

-- If we're in the menu we don't need to load any more
if GLOBAL.TheNet:GetServerGameMode() == "" then return end

STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATKID =
{
	GENERIC = "It's Hat Kid!",
	ATTACKER = "I hope she didn't mean to do that.",
	MURDERER = "A murder? On the owl express?",
	REVIVER = "She must like ghosts.",
	GHOST = "We should help the poor kid.",
	FIRESTARTER = "Should she have matches?",
}

STRINGS.CHARACTERS.HATKID.DESCRIBE.HATKID =
{
	GENERIC = "Oh, hi there!",
	ATTACKER = "I don't like her.",
	MURDERER = "MYURDER!",
	REVIVER = "Good job, me!",
	GHOST = "Oh no! I'm dead!",
	FIRESTARTER = "Oh come on! We're better than this!",
}


-- Item names
STRINGS.NAMES.KIDHAT = "Kid's Hat"
	-- STRINGS.NAMES.KIDHAT_CAT = STRINGS.NAMES.KIDHAT -- Does not exist
	STRINGS.NAMES.MS_KIDHAT_DETECTIVE = "Detective's Cap"
	-- STRINGS.NAMES.MS_KIDHAT_DYE_NIKO = STRINGS.NAMES.KIDHAT
	-- STRINGS.NAMES.MS_KIDHAT_DYE_TOONLINK = STRINGS.NAMES.KIDHAT
	-- STRINGS.NAMES.MS_KIDHAT_DYE_PINKDANGER = STRINGS.NAMES.KIDHAT

STRINGS.NAMES.SPRINTHAT = "Sprint Hat"
STRINGS.NAMES.BREWINGHAT = "Brewing Hat"
STRINGS.NAMES.POLARHAT = "Ice Hat"
STRINGS.NAMES.DWELLERMASK = "Dweller's Mask"
STRINGS.NAMES.TIMESTOPHAT = "Time Stop Hat"

STRINGS.NAMES.HATBRELLA = "Blue Umbrella"
	STRINGS.NAMES.HATBRELLA_BOWKID = "Pink Umbrella"

STRINGS.NAMES.HATBRELLAOPEN = "Open Blue Umbrella"
	STRINGS.NAMES.HATBRELLAOPEN_BOWKID = "Open Pink Umbrella"

STRINGS.NAMES.KIDPOTION = "Mad Concoction"
STRINGS.NAMES.KIDPOTION_AMMO = "Innate Concoction"

STRINGS.NAMES.BADGESELLER = "Badge Seller"
STRINGS.NAMES.BADGESELLERCANE = "Merchant's Cane"
STRINGS.NAMES.BADGESELLERBACKPACK = "Merchant's Pack"

STRINGS.NAMES.HATPACK = "Hat Pack"
STRINGS.RECIPE_DESC.HATPACK = "A little backpack for holding all your hats!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HATPACK = "A little small for me..."

STRINGS.NAMES.BADGE_FURY = "Comeback Kid Badge"
STRINGS.RECIPE_DESC.BADGE_FURY = "Grants +50 Attack Damage while below 25% Health."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_FURY = "Quite useful!"

STRINGS.NAMES.BADGE_FASTHATTER = "Fast Hatter Badge"
STRINGS.RECIPE_DESC.BADGE_FASTHATTER = "Grants +40% Cooldown Reduction for hat abilities."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_FASTHATTER = "Quite useful!"

STRINGS.NAMES.BADGE_FOOTBALL = "Protection Badge"
STRINGS.RECIPE_DESC.BADGE_FOOTBALL = "Grants the benefits of a Football Helmet, in the form of a badge."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_FOOTBALL = "Quite useful!"

STRINGS.NAMES.BADGE_PRIDE = "Longshot Badge"
STRINGS.RECIPE_DESC.BADGE_PRIDE = "Grants +33% Attack Range."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_PRIDE = "Quite useful!"

STRINGS.NAMES.BADGE_ONEHIT = "One Hit Hero Badge"
STRINGS.RECIPE_DESC.BADGE_ONEHIT = "Causes you to die in one hit from any enemy. Quite a challenge!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_ONEHIT = "Not very useful..."

STRINGS.NAMES.BADGE_CAREFREE = "Carefree Badge"
STRINGS.RECIPE_DESC.BADGE_CAREFREE = "Completely blocks all damage. Sometimes."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_CAREFREE = "Quite useful!"

STRINGS.NAMES.BADGE_HEART = "Fragile Heart Badge"
STRINGS.RECIPE_DESC.BADGE_HEART = "Grants +60 Max Health. Falling below 25% health destroys this badge."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_HEART = "Quite useful!"

STRINGS.NAMES.BADGE_STRENGTH = "Fragile Strength Badge"
STRINGS.RECIPE_DESC.BADGE_STRENGTH = "Grants +17 Attack Damage. Falling below 25% health destroys this badge."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_STRENGTH = "Quite useful!"

STRINGS.NAMES.BADGE_GREED = "Fragile Greed Badge"
STRINGS.RECIPE_DESC.BADGE_GREED = "Grants a 50% chance to double collected pons. Falling below 25% health destroys this badge."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_GREED = "Quite useful!"

STRINGS.NAMES.BADGE_PIN = "Badge Pin"
STRINGS.RECIPE_DESC.BADGE_PIN = "Increases the number of badges that can be worn at one time."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BADGE_PIN = "Hard not to lose such a small thing!"

STRINGS.NAMES.PON_UPGRADE1 = "Bigger Wallet Upgrade"
STRINGS.RECIPE_DESC.PON_UPGRADE1 = "A new wallet that can hold 1000 pons!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON_UPGRADE1 = "More space for debt, I guess."

STRINGS.NAMES.PON_UPGRADE2 = "Biggest Wallet Upgrade"
STRINGS.RECIPE_DESC.PON_UPGRADE2 = "A new wallet that can hold 5000 pons!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON_UPGRADE2 = "I'd hate to lose this when it's full..."


--Recipe Descriptions
STRINGS.RECIPE_DESC.KIDHAT = "Your pride and joy."
STRINGS.RECIPE_DESC.SPRINTHAT = "This hat looks ready to sprint!"
STRINGS.RECIPE_DESC.BREWINGHAT = "Cook up mad concoctions!"
STRINGS.RECIPE_DESC.POLARHAT = "It's so cold!"
STRINGS.RECIPE_DESC.DWELLERMASK = "See the world through a Dweller's eyes!"
STRINGS.RECIPE_DESC.TIMESTOPHAT = "Death is inevitable. Your time is valuable."

STRINGS.RECIPE_DESC.HATBRELLA = "Diplomacy didn't work, time for action."
STRINGS.RECIPE_DESC.KIDPOTION_AMMO = "A witchy concoction of some sort."






--Describe strings, by order of css, but Hat Kid first.
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
-- Only hat kid can obtain these
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDPOTION = "Blamo incoming!"
STRINGS.CHARACTERS.HATKID.DESCRIBE.KIDPOTION_AMMO = "It's not ready."

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
STRINGS.CHARACTERS.WILLOW.DESCRIBE.DWELLERMASK = "Not my favorite thing to look at."
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
STRINGS.CHARACTERS.WANDA.DESCRIBE.KIDHAT = "A little hat for a tiny hatter."
STRINGS.CHARACTERS.WANDA.DESCRIBE.SPRINTHAT = "The less time spent running, the better."
STRINGS.CHARACTERS.WANDA.DESCRIBE.BREWINGHAT = "Such destruction."
STRINGS.CHARACTERS.WANDA.DESCRIBE.POLARHAT = "Looks cold."
STRINGS.CHARACTERS.WANDA.DESCRIBE.DWELLERMASK = "Not this time."
STRINGS.CHARACTERS.WANDA.DESCRIBE.TIMESTOPHAT = "I'd love to try THAT out!"
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLA = "Seems small, but it must hurt."
STRINGS.CHARACTERS.WANDA.DESCRIBE.HATBRELLAOPEN = "Time and umbrellas?"