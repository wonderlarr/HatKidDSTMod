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
		Ingredient("goldnugget", 2),
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
		Ingredient("silk", 4),
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
		Ingredient("nightmarefuel", 1),

	},
	TECH.SCIENCE_TWO, -- tech level
	{ -- config
		builder_tag = "hatkid",
		numtogive = 2,
	},
	{ -- crafting filters
		"MODS",
	}
)

-- Badges and Badge Seller

GLOBAL.STRINGS.ACTIONS.OPEN_CRAFTING.PURCHASE_BADGE = "Purchase from"
GLOBAL.STRINGS.UI.CRAFTING.RECIPEACTION.PURCHASE_BADGE = "Purchase"
GLOBAL.STRINGS.UI.CRAFTING.TABACTION.PURCHASE_BADGE = "Purchase"
GLOBAL.STRINGS.UI.CRAFTING.NEEDSBADGESELLER_ONE = "Find the Badge Seller to purchase this item."
GLOBAL.STRINGS.UI.CRAFTING.NEEDSBADGESELLER_TWO = "Find the Badge Seller to purchase this item."

-- references from ShoeTime (vaguely, i didnt know how to do this)

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
		builder_tag = "hatkid",
		-- nounlock = true,
		-- manufactured = true,
		actionstr = "PURCHASE_BADGE",
		sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"ARMOR",
		"CRAFTING_STATION",
		-- "CHARACTER"
	}
)

AddCharacterRecipe("badge_fasthatter",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid",
		-- nounlock = true,
		-- manufactured = true,
		actionstr = "PURCHASE_BADGE",
		sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"ARMOR",
		"CRAFTING_STATION",
		-- "CHARACTER"
	}
)

AddCharacterRecipe("badge_fury",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid",
		-- nounlock = true,
		-- manufactured = true,
		actionstr = "PURCHASE_BADGE",
		sg_state = "domediumaction",
	},
	{ -- crafting filters
		"MODS",
		"ARMOR",
		"CRAFTING_STATION",
		-- "CHARACTER"
	}
)

AddCharacterRecipe("hatpack",
	{ -- ingredients
		Ingredient("pigskin", 2),
		Ingredient("rope", 1),
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid"
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

-- TODO make these NOT items, instead directly upgrade the player

AddCharacterRecipe("pon_upgrade1",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 150),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid",
		nounlock = true,
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("pon_upgrade2",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 300),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid",
		nounlock = true,
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)

AddCharacterRecipe("badge_pin",
	{ -- ingredients
		Ingredient(CHARACTER_INGREDIENT.PON, 100),
	},
	TECH.BADGESELLER_ONE, -- tech level
	{ -- config
		builder_tag = "hatkid",
		nounlock = true,
	},
	{ -- crafting filters
		"MODS",
		"CRAFTING_STATION",
	}
)