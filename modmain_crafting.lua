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

-- Hi there, you seem to have stumbled upon my crafting section. I actually used this file to develop the guide I wrote here https://forums.kleientertainment.com/forums/topic/140881-documentation-new-recipe-system-functions-other-info/
-- as you may be able to tell by the commments. Regardless, welcome, take a seat, stay a while, have a cookie, dunk it in some dark-roast black coffee, etc etc.

local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local CHARACTER_INGREDIENT = GLOBAL.CHARACTER_INGREDIENT
local TUNING = GLOBAL.TUNING
local TechTree = GLOBAL.require("techtree")

CHARACTER_INGREDIENT["PON"] = "pon"

local _IsCharacterIngredient = GLOBAL.IsCharacterIngredient

GLOBAL.IsCharacterIngredient = function(ingredienttype)
	if ingredienttype and ingredienttype == "pon" then
		return true
	else
		return _IsCharacterIngredient(ingredienttype)
	end
end

AddCharacterRecipe("hatbrella",
	{ -- ingredients. Formatted identically to the old AddRecipe()
		Ingredient("spear", 1),
		Ingredient("tentaclespots", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 50),
	},
	TECH.SCIENCE_ONE, -- crafting station. Refer to other recipes in recipes.lua for other stations.
	{ -- config. Other options can be found in recipe.lua, under the Recipe class.
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters/tabs, found in recipes_filter.lua
		"MODS",
		"WEAPONS",
		"RAIN",
		"SUMMER"
	}
)


AddCharacterRecipe("kidhat",
	{ -- ingredients
		Ingredient("silk", 2),
		Ingredient("goldnugget", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 50),
	},
	TECH.NONE, -- tech level
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
		Ingredient("silk", 2),
		Ingredient("feather_robin", 2),
		Ingredient(CHARACTER_INGREDIENT.PON, 80),
	},
	TECH.SCIENCE_ONE, -- tech level
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
		Ingredient("silk", 4),
		Ingredient("nightmarefuel", 8),
		Ingredient(CHARACTER_INGREDIENT.PON, 120),
	},
	TECH.MAGIC_TWO, -- tech level
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
		Ingredient("winterhat", 1),
		Ingredient("bluegem", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 180),
	},
	TECH.MAGIC_TWO, -- tech level
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
		Ingredient("nightmarefuel", 8),
		Ingredient("thulecite", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 240),
	},
	TECH.MAGIC_THREE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"RESTORATION",
		"CLOTHING"
	}
)

AddCharacterRecipe("timestophat",
	{ -- ingredients
		Ingredient("silk", 16),	
		Ingredient("moonglass", 8),
		Ingredient(CHARACTER_INGREDIENT.PON, 360),
	},
	TECH.MOON_ALTAR_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	}, 
	{ -- crafting filters
		"MODS",
		"CLOTHING"
	}
)

AddCharacterRecipe("kidpotion_ammo",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 50),
	},
	TECH.SCIENCE_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid",
		numtogive = 3,
	},
	{ -- crafting filters
		"MAGIC",
		"MODS",
	}
)

-- Badges and Badge Seller

GLOBAL.STRINGS.ACTIONS.OPEN_CRAFTING.PURCHASE_BADGE = "Purchase from"
GLOBAL.STRINGS.UI.CRAFTING.RECIPEACTION.PURCHASE_BADGE = "Purchase"
GLOBAL.STRINGS.UI.CRAFTING.TABACTION.PURCHASE_BADGE = "Purchase"
GLOBAL.STRINGS.UI.CRAFTING.NEEDSBADGESELLER_ONE = "Find the Badge Seller to purchase this recipe."
GLOBAL.STRINGS.UI.CRAFTING.NEEDSBADGESELLER_TWO = "Find the Badge Seller to purchase this recipe."

table.insert(TechTree.AVAILABLE_TECH, "BADGESELLER")
	
for k, v in pairs(TUNING.PROTOTYPER_TREES) do
	v.BADGESELLER = 0
end

for k, v in pairs(GLOBAL.AllRecipes) do
	v.level.BADGESELLER = 0
end

TECH.NONE.BADGESELLER = 0

TECH.BADGESELLER_ONE = {BADGESELLER = 2}
TECH.BADGESELLER_TWO = {BADGESELLER = 3}

TUNING.PROTOTYPER_TREES.BADGESELLER_ONE = TechTree.Create({
	-- SCIENCE = 1,
	BADGESELLER = 2,
})

TUNING.PROTOTYPER_TREES.BADGESELLER_TWO = TechTree.Create({
	BADGESELLER = 3,
})

AddPrototyperDef("badgeseller", {
	icon_atlas = "images/gui/craft_pon.xml", 
	icon_image = "craft_pon.tex",	
	is_crafting_station = true,		
	action_str = "PURCHASE_BADGE",	
	filter_text = "Badge Seller"
})

AddCharacterRecipe("badge_football",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_1",
		-- nounlock = true,
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"ARMOUR",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_fury",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_1",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"WEAPONS",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_onehit",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 25),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_1",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_fasthatter",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 250),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_2",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_pride",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 250),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_2",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"WEAPONS",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_heart",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 400),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_3",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
		"ARMOUR",
	}
)

AddCharacterRecipe("badge_strength",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 400),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_3",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
		"WEAPONS",
	}
)

AddCharacterRecipe("badge_greed",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 400),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_3",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("badge_carefree",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 400),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgecrafter_3",
		actionstr = "PURCHASE_BADGE",
		-- sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
		"MAGIC",
	}
)

AddCharacterRecipe("hatpack",
	{ -- ingredients
		Ingredient("pigskin", 1),
		Ingredient("rope", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.SCIENCE_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid"
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("pon_upgrade1",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 80),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "madhatter_wallet_0",
		nounlock = true,
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("pon_upgrade2",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 250),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "madhatter_wallet_1",
		nounlock = true,
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("badge_pin_1",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgeslots_0",
		nounlock = true,
		product = "badge_pin",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("badge_pin_2",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 250),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgeslots_1",
		nounlock = true,
		product = "badge_pin",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("badge_pin_3",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 600),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "badgeslots_2",
		nounlock = true,
		product = "badge_pin",
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

-- Cheaper hat recipes
if TUNING.HATKID_FASTCRAFTING then
	AddRecipe2("strawhat_hatkid",
		{
			Ingredient("cutgrass", 6)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "strawhat",
			sg_state = "domediumaction",
			description = "strawhat",
			no_deconstruction = true
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
			"RAIN"
		}
	)

	AddRecipe2("tophat_hatkid",
		{
			Ingredient("silk", 3)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "tophat",
			sg_state = "domediumaction",
			description = "tophat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
			"RAIN"
		}
	)

	AddRecipe2("beefalohat_hatkid",
		{
			Ingredient("beefalowool", 4),
			Ingredient("horn", 1)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "beefalohat",
			sg_state = "domediumaction",
			description = "beefalohat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"WINTER"
		}
	)

	AddRecipe2("featherhat_hatkid",
		{
			Ingredient("feather_crow", 2),
			Ingredient("feather_robin", 1), 
			Ingredient("tentaclespots", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "featherhat",
			sg_state = "domediumaction",
			description = "featherhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING"
		}
	)

	AddRecipe2("beehat_hatkid",
		{
			Ingredient("silk", 4), 
			Ingredient("rope", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "beehat",
			sg_state = "domediumaction",
			description = "beehat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"RAIN",
			"ARMOUR"
		}
	)

	AddRecipe2("minerhat_hatkid",
		{
			Ingredient("strawhat", 1),
			Ingredient("fireflies", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "minerhat",
			sg_state = "domediumaction",
			description = "minerhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"RAIN",
			"LIGHT"
		}
	)

	AddRecipe2("footballhat_hatkid",
		{
			Ingredient("pigskin", 1), 
			Ingredient("cutgrass", 2)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "footballhat",
			sg_state = "domediumaction",
			description = "footballhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"ARMOUR",
		}
	)

	AddRecipe2("earmuffshat_hatkid",
		{
			Ingredient("rabbit", 1), 
			Ingredient("twigs",1)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "earmuffshat",
			sg_state = "domediumaction",
			description = "earmuffshat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"WINTER",
		}
	)

	AddRecipe2("winterhat_hatkid",
		{
			Ingredient("beefalowool", 2),
			Ingredient("silk", 2)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "winterhat",
			sg_state = "domediumaction",
			description = "winterhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"WINTER",
		}
	)

	AddRecipe2("bushhat_hatkid",
		{
			Ingredient("strawhat", 1),
			Ingredient("dug_berrybush", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "bushhat",
			sg_state = "domediumaction",
			description = "bushhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("flowerhat_hatkid",
		{
			Ingredient("petals", 6)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "flowerhat",
			sg_state = "domediumaction",
			description = "flowerhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("molehat_hatkid",
		{
			Ingredient("mole", 1), 
			Ingredient("transistor", 1), 
			Ingredient("wormlight", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "molehat",
			sg_state = "domediumaction",
			description = "molehat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"LIGHT",
		}
	)

	AddRecipe2("icehat_hatkid",
		{
			Ingredient("transistor", 1), 
			Ingredient("rope", 2), 
			Ingredient("ice", 5)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "icehat",
			sg_state = "domediumaction",
			description = "icehat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("rainhat_hatkid",
		{
			Ingredient("mole", 1), 
			Ingredient("strawhat", 1), 
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "rainhat",
			sg_state = "domediumaction",
			description = "rainhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"RAIN",
		}
	)

	AddRecipe2("catcoonhat_hatkid",
		{
			Ingredient("coontail", 1), 
			Ingredient("silk", 2)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "catcoonhat",
			sg_state = "domediumaction",
			description = "catcoonhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"WINTER",
		}
	)

	AddRecipe2("watermelonhat_hatkid",
		{
			Ingredient("watermelon", 1), 
			Ingredient("twigs", 1)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "watermelonhat",
			sg_state = "domediumaction",
			description = "watermelonhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("eyebrellahat_hatkid",
		{
			Ingredient("deerclops_eyeball", 1), 
			Ingredient("twigs", 8), 
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "eyebrellahat",
			sg_state = "domediumaction",
			description = "eyebrellahat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
			"RAIN",
		}
	)

	AddRecipe2("red_mushroomhat_hatkid",
		{
			Ingredient("red_cap", 6)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "red_mushroomhat",
			sg_state = "domediumaction",
			description = "red_mushroomhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("green_mushroomhat_hatkid",
		{
			Ingredient("green_cap", 6)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "green_mushroomhat",
			sg_state = "domediumaction",
			description = "green_mushroomhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("blue_mushroomhat_hatkid",
		{
			Ingredient("blue_cap", 6)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "blue_mushroomhat",
			sg_state = "domediumaction",
			description = "blue_mushroomhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("deserthat_hatkid",
		{
			Ingredient("goggleshat", 1), 
			Ingredient("pigskin", 1)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "deserthat",
			sg_state = "domediumaction",
			description = "deserthat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
			"SUMMER",
		}
	)

	AddRecipe2("goggleshat_hatkid",
		{
			Ingredient("goldnugget", 1), 
			Ingredient("pigskin", 1)
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "goggleshat",
			sg_state = "domediumaction",
			description = "goggleshat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("moonstorm_goggleshat_hatkid",
		{
			Ingredient("moonglass", 1),
			Ingredient("potato", 1)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "moonstorm_goggleshat",
			sg_state = "domediumaction",
			description = "moonstorm_goggleshat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("kelphat_hatkid",
		{
			Ingredient("kelp", 3),
		},
		TECH.NONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "kelphat",
			sg_state = "domediumaction",
			description = "kelphat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("cookiecutterhat_hatkid",
		{
			Ingredient("cookiecuttershell", 2), 
			Ingredient("rope", 1)
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "cookiecutterhat",
			sg_state = "domediumaction",
			description = "cookiecutterhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"RAIN",
			"ARMOUR",
		}
	)

	AddRecipe2("nutrientsgoggleshat_hatkid",
		{
			Ingredient("plantregistryhat", 1), 
			Ingredient("thulecite_pieces", 2), 
			Ingredient("purplegem", 1)
		},
		TECH.ANCIENT_TWO, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "nutrientsgoggleshat",
			sg_state = "domediumaction",
			description = "nutrientsgoggleshat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CRAFTING_STATION",
		}
	)

	AddRecipe2("plantregistryhat_hatkid",
		{
			Ingredient("fertilizer", 1), 
			Ingredient("seeds", 2), 
		},
		TECH.SCIENCE_ONE, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "plantregistryhat",
			sg_state = "domediumaction",
			description = "plantregistryhat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"SUMMER",
			"GARDENING"
		}
	)

	AddRecipe2("polly_rogershat_hatkid",
		{
			Ingredient("monkey_mediumhat", 1),
			Ingredient("feather_canary", 1),
			Ingredient("blackflag",1)
		},
		TECH.LOST, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "polly_rogershat",
			sg_state = "domediumaction",
			description = "polly_rogershat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CLOTHING",
		}
	)

	AddRecipe2("ruinshat_hatkid",
		{
			Ingredient("thulecite", 3), 
			Ingredient("nightmarefuel", 3)
		},
		TECH.ANCIENT_FOUR, -- tech level
		{ -- config
			builder_tag = "hatkid",
			product = "ruinshat",
			sg_state = "domediumaction",
			description = "ruinshat",
			no_deconstruction = true,
		},
		{ -- crafting filters
			"CRAFTING_STATION",
		}
	)

	for k, v in ipairs(TUNING.HATKID_CHEAP_HATS) do
		AddRecipePostInit(v, function(self)
			self.no_builder_tag	= "hatkid"
		end)
	end
end