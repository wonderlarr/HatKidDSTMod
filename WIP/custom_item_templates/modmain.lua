PrefabFiles = {
	"custom_hat",
	"custom_armor",
	"custom_handitem",
}

-- Load in some assets globally
Assets = {
	Asset("ATLAS", "images/inventoryimages/custom_hat.xml"),
    Asset("IMAGE", "images/inventoryimages/custom_hat.tex"),
	
	Asset("ATLAS", "images/inventoryimages/custom_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/custom_armor.tex"),
	
	Asset("ATLAS", "images/inventoryimages/custom_handitem.xml"),
    Asset("IMAGE", "images/inventoryimages/custom_handitem.tex"),
}

-- Load our item icon XMLs into the Minimap!
AddMinimapAtlas("images/inventoryimages/custom_hat.xml")
AddMinimapAtlas("images/inventoryimages/custom_armor.xml")
AddMinimapAtlas("images/inventoryimages/custom_handitem.xml")

-- Declare global variables
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH 

-- Custom strings!
STRINGS.NAMES.CUSTOM_HAT = "Custom Hat"
STRINGS.RECIPE_DESC.CUSTOM_HAT = "Craft your custom hat!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUSTOM_HAT = "That's one scientific hat."

STRINGS.NAMES.CUSTOM_ARMOR = "Custom Armor"
STRINGS.RECIPE_DESC.CUSTOM_ARMOR = "Craft your custom armor!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUSTOM_ARMOR = "That's one scientific armor."

STRINGS.NAMES.CUSTOM_HANDITEM = "Custom Handslot Item"
STRINGS.RECIPE_DESC.CUSTOM_HANDITEM = "Craft your custom item!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUSTOM_HANDITEM = "That's one scientific item."

-- Custom recipes!
--[[
Default recipetabs:
RECIPETABS.TOOLS
RECIPETABS.LIGHT
RECIPETABS.SURVIVAL
RECIPETABS.FARM
RECIPETABS.SCIENCE
RECIPETABS.WAR
RECIPETABS.TOWN
RECIPETABS.SEAFARING
RECIPETABS.REFINE
RECIPETABS.MAGIC
RECIPETABS.DRESS

Default tech levels (science level you need to craft the item):
TECH.NONE
TECH.SCIENCE_ONE
TECH.SCIENCE_TWO
TECH.SCIENCE_THREE
TECH.MAGIC_TWO
TECH.MAGIC_THREE
]]

AddRecipe("custom_hat",
{ Ingredient("cutgrass", 4), Ingredient("twigs", 4) },
RECIPETABS.DRESS,
TECH.NONE,
nil,
nil,
nil,
nil,
nil, -- <- Custom character tag would go here if you wanted only that character to craft your item
"images/inventoryimages/custom_hat.xml")

AddRecipe("custom_armor",
{ Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
RECIPETABS.WAR,
TECH.NONE,
nil,
nil,
nil,
nil,
nil, -- <- Custom character tag would go here if you wanted only that character to craft your item
"images/inventoryimages/custom_armor.xml")

AddRecipe("custom_handitem",
{ Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
RECIPETABS.WAR,
TECH.NONE,
nil,
nil,
nil,
nil,
nil, -- <- Custom character tag would go here if you wanted only that character to craft your item
"images/inventoryimages/custom_handitem.xml")
