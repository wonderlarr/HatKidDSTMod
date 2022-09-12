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

local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH

AddCharacterRecipe("hatbrella",
	{ -- ingredients. Formatted identically to the old AddRecipe()	
		GLOBAL.Ingredient("twigs", 2),
		GLOBAL.Ingredient("pigskin", 1),
		GLOBAL.Ingredient("goldnugget", 1),
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
	Ingredient("beefalowool", 3),
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
	Ingredient("silk", 1),	
	Ingredient("beefalowool", 3),
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
		Ingredient("silk", 3),
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
		Ingredient("ice", 2),
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
		Ingredient("nightmarefuel", 4),
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
		Ingredient("silk", 4),	
		Ingredient("moonglass", 3),
		Ingredient("greengem", 1),
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