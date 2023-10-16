PrefabFiles = {
	"hatkid_skins"
}

Assets = {
    Asset( "IMAGE", "bigportraits/hatkid.tex" ), -- Base, not sure where this is used tbh.
    Asset( "ATLAS", "bigportraits/hatkid.xml" ),

	Asset( "IMAGE", "bigportraits/hatkid_none.tex" ), -- Default, texture is same as base.
    Asset( "ATLAS", "bigportraits/hatkid_none.xml" ),

    Asset( "IMAGE", "images/saveslot_portraits/hatkid.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/hatkid.xml" ),

	Asset( "IMAGE", "images/names_gold_hatkid.tex" ),
    Asset( "ATLAS", "images/names_gold_hatkid.xml" ),


    Asset("IMAGE", "images/inventoryimages/kidhat.tex" ),
    Asset("ATLAS", "images/inventoryimages/kidhat.xml"), 
}

local STRINGS = GLOBAL.STRINGS

-- Import string file
modimport("modmain_strings")

STRINGS.CHARACTER_ABOUTME.hatkid = "Hat Kid is a determined girl. Having mastered haberdashery at a very young age, she can knit hats to do virtually anything!"
STRINGS.CHARACTER_BIOS.hatkid = {
 { title = "Birthday", desc = "October 5" },
 { title = "Favorite Food", desc = "Honey Nuggets" },
 { title = "Fine Print", desc = "For a young adventurer, Hat Kid had already tackled her fair share of exciting missions. From dealing with mafia bosses to striking deals with omnipotent beings and even facing off against a borderline time god, she'd been through it all in her quest for Time Pieces, her spaceship's primary fuel.\nOne late night, according to her ship's clock, Hat Kid's radio unexpectedly intercepted a mysterious signal. Through the crackling speakers, a familiar ghostly voice beckoned her to accept one final contract, to tie up \"loose ends\". Knowing that every Time Piece was precious on her journey home, she inked her signature on the conjured contract without a lot of thought. With a decisive stamp, Hat Kid suddenly found herself plummeting from her familiar reality into someplace far, far more mysterious..."},
}

TUNING.HATKID_HEALTH = 150
TUNING.HATKID_HUNGER = 125
TUNING.HATKID_SANITY = 125

RegisterInventoryItemAtlas("images/inventoryimages/kidhat.xml","kidhat.tex")
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.HATKID = { "kidhat" }

AddModCharacter("hatkid", "FEMALE")