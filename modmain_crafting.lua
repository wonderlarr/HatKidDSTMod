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
		GLOBAL.Ingredient("twigs", 2),
		GLOBAL.Ingredient("beefalowool", 1),
		GLOBAL.Ingredient("goldnugget", 2),
	},
	GLOBAL.TECH.SCIENCE_ONE, -- crafting station. Refer to other recipes in recipes.lua for other stations.
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


AddCharacterRecipe("sprinthat",
	{ -- ingredients
		Ingredient("silk", 2),
		Ingredient("feather_robin", 2),
	},
	TECH.SCIENCE_TWO, -- tech level
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
		Ingredient("slurtleslime", 2),
		Ingredient("purplegem", 1),
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
		Ingredient("ice", 10),
		Ingredient("bluegem", 1),
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
		Ingredient("nightmarefuel", 6),
		Ingredient("thulecite", 2),
		Ingredient("greengem", 1)
	},
	TECH.ANCIENT_TWO, -- tech level
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
		Ingredient("ruinshat", 1),
		Ingredient("moonglass", 9),
		Ingredient("silk", 16),	
		Ingredient("greengem", 1)
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
		Ingredient(CHARACTER_INGREDIENT.PON, 10),
		Ingredient("slurtleslime", 1),
		Ingredient("nightmarefuel", 2),

	},
	TECH.SCIENCE_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid",
		numtogive = 3,
	},
	{ -- crafting filters
		"MODS",
	}
)

AddCharacterRecipe("hatpack",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.SCIENCE_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	},
	{ -- crafting filters
		"MODS",
	}
)