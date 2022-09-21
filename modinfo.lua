name = "[Internal] Hat Kid: The Homesick Hatter"
description = "Adds Hat Kid from A Hat in Time into the world of Don't Starve Together, complete with her hats, umbrella, and even some of her outfits!\n\nThis mod is highly configurable, click the config button below to customize your experience to a tee."
author = "Skylarr 󰀏" -- Unknown character is a torch emoji
version = "0.20.2 rc3" -- major version . feature update . minor update/bugfix

forumthread = ""

api_version = 10

dst_compatible = true

dont_starve_compatible = false
reign_of_giants_compatible = false

all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {
	"hatkid",
	"hat kid",
	"hat in time",
	"cute",
}

mod_dependencies = 
{
    {
        workshop = "workshop-2570815741",
        ["[API] Time Control"] = true
    },
	{
		workshop = "workshop-2812783478",
		["[API] Modded Skins"] = true
	}
}

local null_options = {
	{ description = "", data = 0 }
}

-- Set some vars for config

configuration_options =
{

	{
		name = "Hat Kid Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "hatkidbasehp",
		label = "Maximum Health",
		hover = "How much health Hat Kid will have.",
		options =
		{
			{description = "25", data = 25},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "120", data = 120},
			{description = "130", data = 130},
			{description = "150 (Default)", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "225", data = 225},
			{description = "250", data = 250},
			{description = "275", data = 275},				
			{description = "300", data = 300},
		},
		default = 150,
	},
	
	{
		name = "hatkidbasesanity",
		label = "Maximum Sanity",
		hover = "How much sanity Hat Kid will have.",
		options =
		{
			{description = "25", data = 25},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "120 (Default)", data = 120},
			{description = "125", data = 125},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "225", data = 225},
			{description = "250", data = 250},
			{description = "275", data = 275},				
			{description = "300", data = 300},
		},
		default = 120,
	},
	
	{
		name = "hatkidbasehunger",
		label = "Maximum Hunger",
		hover = "How much hunger Hat Kid will have.",
		options =
		{
			{description = "25", data = 25},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "105", data = 105},
			{description = "110", data = 110},
			{description = "115", data = 115},
			{description = "120 (Default)", data = 120},
			{description = "125", data = 125},
			{description = "130", data = 130},
			{description = "135", data = 135},
			{description = "140", data = 140},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "225", data = 225},
			{description = "250", data = 250},
			{description = "275", data = 275},				
			{description = "300", data = 300},
			{description = "400", data = 400},
		},
		default = 120,
	},
	
	{
		name = "hatkidspeed",
		label = "Movement Speed Multiplier",
		hover = "How fast Hat Kid will go under normal conditions.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.1", data = 1.1},
			{description = "x1.2", data = 1.2},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
		},
		default = 1,
	},
	
	{
		name = "hatkiddamagedealt",
		label = "Damage Dealt Multiplier",
		hover = "How much Hat Kid's damage dealt will be multiplied.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.85", data = 0.85},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1,
	},
	
	{
		name = "hatkiddamagetaken",
		label = "Damage Taken Multiplier",
		hover = "How much Hat Kid's damage taken will be multiplied.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.85", data = 0.85},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1,
	},

	
	
	{
		name = "hatkidbasesize",
		label = "Character Size Multiplier",
		hover = "How big Hat Kid will be. This is essentially cosmetic.",
		options =
		{
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.85", data = 0.85},
			{description = "x0.9 (Default)", data = 0.9},
			{description = "x1", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 0.9,
	},
	
	{
		name = "hatkidrate",
		label = "Hunger Rate Multiplier",
		hover = "How fast Hat Kid's hunger drains. This multiplies with any other hunger draining over time effects.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1,
	},
	
	{
		name = "hatkidnightdrain",
		label = "Night Sanity Drain Multiplier",
		hover = "How much Hat Kid's sanity will be impacted by nighttime.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1,
	},

	{
		name = "hatkidsanitydrain",
		label = "Sanity Drain Multiplier",
		hover = "How much Hat Kid's sanity will be negatively impacted by auras.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1 (Default)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1,
	},	

	{
		name = "hatkidsanitymult",
		label = "Sanity Rate Multiplier",
		hover = "How much Hat Kid's sanity will be impacted by all sources excluding direct changes.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1", data = 1},
			{description = "x1.1 (Default)", data = 1.1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1.1,
	},	

	{
		name = "hatkidnohatpenalty",
		label = "No Hat Sanity Penalty",
		hover = "How much Hat Kid's sanity will be negatively impacted while not wearing a hat. This multiplier only applies to night drain and negative auras.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2 (Default)", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 2,
	},	

	{
		name = "hatkidvoice",
		label = "Voice Type",
		hover = "Which sounds Hat Kid will make while talking.",
		options =
		{
			{description = "Hat Kid (Default)", data = "hatkidvoice"},
			{description = "Willow", data = "willow"},
			{description = "Wanda", data = "wanda"},
			{description = "Wendy", data = "wendy"},
		},
		default = "hatkidvoice",
	},	


	{
		name = "Kid's Hat Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "kidhatdurability",
		label = "Durability",
		hover = "How long the Kid's Hat lasts while worn. 1 segment is 30 seconds.",
		options =
		{
			{description = "Forever", data = false},

			{description = "5 seconds", data = 5},
			{description = "10 seconds", data = 10},
			{description = "15 seconds", data = 15},
			{description = "20 seconds", data = 20},
			{description = "25 seconds", data = 25},
			{description = "1 segment", data = 30}, -- 1 segment = 30 seconds
			{description = "2 segments", data = 30 * 2},
			{description = "4 segments", data = 30 * 4},
			{description = "8 segments", data = 30 * 8},
			{description = "1 day", data = 480}, -- 30 * 16, 1 day = 16 segments
			{description = "2 days", data = 480 * 2},
			{description = "3 days", data = 480 * 3},
			{description = "4 days", data = 480 * 4},
			{description = "5 days", data = 480 * 5},
			{description = "6 days", data = 480 * 6},
			{description = "8 days (Default)", data = 480 * 8},
			{description = "10 days", data = 480 * 10},
			{description = "12 days", data = 480 * 12},
			{description = "16 days", data = 480 * 16},
			{description = "20 days", data = 480 * 20},
			{description = "40 days", data = 480 * 40},

			{description = "Forever", data = false},
		},
		default = 480 * 8,
	},

	{
		name = "kidhatsanity",
		label = "Sanity Impact",
		hover = "How much sanity is passively restored or drained while wearing the Kid's Hat.",
		options =
		{
			{description = "-60/min", data = -60},
			{description = "-20/min", data = -20},
			{description = "-10/min", data = -10},
			{description = "-6.7/min", data = -6.7},
			{description = "-4.5/min", data = -4.5},
			{description = "-3.4/min", data = -3.4},
			{description = "-2/min", data = -2},
			{description = "-1.4/min", data = -1.4},
			{description = "None", data = 0},
			{description = "1.4/min", data = 1.4},
			{description = "2/min", data = 2},
			{description = "2.3/min (Default)", data = 2},
			{description = "3.4/min", data = 3.4},
			{description = "4.5/min", data = 4.5},
			{description = "6.7/min", data = 6.7},
			{description = "10/min", data = 10},
			{description = "20/min", data = 20},
			{description = "60/min", data = 60},
		},
		default = 2,
	},	

	{
		name = "kidhatwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Kid's Hat provides while worn.",
		options =
		{
			{description = "None", data = false},
			{description = "20% (Default)", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = 0.2,
	},	

	{
		name = "kidhatinsulation",
		label = "Freezing Resistance",
		hover = "How much freezing resistance the Kid's Hat provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "30", data = 30},
			{description = "60", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = false,
	},


	-- {
	-- 	name = "hatkidaurasize",
	-- 	label = "Sanity Aura Size",
	-- 	hover = "How big Hat Kid's sanity aura will be.",
	-- 	options =
	-- 	{
	-- 		{description = "Disabled", data = 0},
	-- 		{description = "Smol", data = 16},
	-- 		{description = "Small", data = 32},
	-- 		{description = "Medium", data = 64},
	-- 		{description = "Large (Default)", data = 128},
	-- 		{description = "Huge! (seriously)", data = 512},
			
	-- 	},
	-- 	default = 128,
	-- },

	-- {
	-- 	name = "hatkidaurarate",
	-- 	label = "Sanity Aura Rate",
	-- 	hover = "How powerful Hat Kid's sanity aura is, in sanity per minute",
	-- 	options =
	-- 	{
	-- 		{description = "1", data = 0.0167},
	-- 		{description = "1.5", data = 0.025},
	-- 		{description = "3 (Default)", data = 0.05},
	-- 		{description = "6", data = 0.1},
	-- 		{description = "15", data = 0.25},
	-- 		{description = "20", data = 0.334},
	-- 		{description = "30", data = 0.5},
	-- 		{description = "60", data = 1},
	-- 		{description = "120", data = 2},
	-- 		{description = "240", data = 4},
	-- 		{description = "600", data = 10},
	-- 	},
	-- 	default = 0.05,
	-- },

	{
		name = "Sprint Hat Options",
		options = null_options,
		hover = "",
		default = 0,
	},	
	
	{
		name = "sprinthatdurability",
		label = "Durability",
		hover = "How long the Sprint Hat lasts while sprinting. Durabiltiy only decreases while sprinting. 1 segment is 30 seconds.",
		options =
		{
			{description = "Forever", data = false},

			{description = "5 seconds", data = 5},
			{description = "10 seconds", data = 10},
			{description = "15 seconds", data = 15},
			{description = "20 seconds", data = 20},
			{description = "25 seconds", data = 25},
			{description = "1 segment", data = 30}, -- 1 segment = 30 seconds
			{description = "2 segments", data = 30 * 2},
			{description = "4 segments", data = 30 * 4},
			{description = "8 segments", data = 30 * 8},
			{description = "1 day", data = 480}, -- 30 * 16, 1 day = 16 segments
			{description = "2 days", data = 480 * 2},
			{description = "3 days", data = 480 * 3},
			{description = "4 days", data = 480 * 4},
			{description = "5 days", data = 480 * 5},
			{description = "6 days (Default)", data = 480 * 6},
			{description = "8 days", data = 480 * 8},
			{description = "10 days", data = 480 * 10},
			{description = "12 days", data = 480 * 12},
			{description = "16 days", data = 480 * 16},
			{description = "20 days", data = 480 * 20},
			{description = "40 days", data = 480 * 40},

			{description = "Forever", data = false},
		},
		default = 480 * 6,
	},

	{
		name = "sprinthatwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Sprint Hat provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = false,
	},	

	{
		name = "sprinthatinsulation",
		label = "Overheat Resistance",
		hover = "How much overheating resistance the Sprint Hat provides while worn.",
		options =
		{
			{description = "None", data = false},
			{description = "30", data = 30},
			{description = "60 (Default)", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = 60,
	},

	{
		name = "sprinthatspeedmult",
		label = "Speed Multiplier",
		hover = "How much Hat Kid's speed will be effected by wearing the Sprint Hat.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1", data = 1},
			{description = "x1.1", data = 1.1},
			{description = "x1.25", data = 1.25},
			{description = "x1.3 (Default)", data = 1.3},
			{description = "x1.35", data = 1.35},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
		},
		default = 1.3,
	},
	
	{
		name = "sprinthathungerburnrate",
		label = "Hunger Multiplier",
		hover = "How much faster the Sprint Hat makes Hat Kid starve, while sprinting.",
		options =
		{
			{description = "x0.001", data = 0.001},
			{description = "x0.01", data = 0.01},
			{description = "x0.1", data = 0.1},
			{description = "x0.2", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.4", data = 0.4},
			{description = "x0.5", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.67 (Default)", data = 1.67},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
		},
		default = 1.67,
	},

	{
		name = "sprinthatsfx",
		label = "SFX",
		hover = "Whether or not moving while wearing the sprint hat will produce a sound effect.",
		options =
		{
			{description = "Disabled", data = false},
			{description = "Enabled (Default)", data = true},
		},
		default = true,
	},

	{
		name = "sprinthatvfx",
		label = "VFX",
		hover = "Whether or not moving while wearing the sprint hat will produce a particle trail.",
		options =
		{
			{description = "Disabled", data = false},
			{description = "Enabled (Default)", data = true},
		},
		default = true,
	},

	{
		name = "Brewing Hat Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "brewdurability",
		label = "Fuel Capacity",
		hover = "How many uses the Brewing Hat can store. One use per concoction brewed.",
		options =
		{
			{description = "Infinite", data = false},
			{description = "1", data = 1},
			{description = "2 (Default)", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
			{description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "100", data = 100},
			{description = "Infinite", data = false},
		},
		default = 2,
	},

	{
		name = "brewwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Brewing Hat provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = false,
	},	

	{
		name = "brewinsulation",
		label = "Overheat Resistance",
		hover = "How much overheating resistance the Brewing Hat provides while worn.",
		options =
		{
			{description = "None", data = false},
			{description = "30 (Default)", data = 30},
			{description = "60", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = 30,
	},
	
	{
		name = "brewcooldown",
		label = "Cooldown",
		hover = "How long the Brewing Hat takes to recharge once a potion has started brewing.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "4 Seconds", data = 4},
			{description = "5 Seconds (Default)", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "12 Seconds", data = 12},
			{description = "15 Seconds", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds", data = 45},
			{description = "60 Seconds", data = 60},
			{description = "90 Seconds", data = 90},
			{description = "2 Minutes", data = 120},
			{description = "3 Minutes", data = 180},
			{description = "4 Minutes", data = 240},
			{description = "5 Minutes", data = 300},
			{description = "10 Minutes", data = 600},
			{description = "15 Minutes", data = 900},
		},
		default = 5,
	},

	{
		name = "brewthreshhold",
		label = "Sanity Threshhold",
		hover = "How much sanity is required to activate the Brewing Hat. This amount is consumed immediately when activated.",
		options =
		{
			{description = "0", data = 0},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3 (Default)", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "50", data = 50},
			{description = "100", data = 100},
		},
		default = 3,
	},
	
	{
		name = "brewcharge",
		label = "Concoction Brewing Time",
		hover = "How long a Brewing Concoction takes to charge before it can be thrown.",
		options =
		{
			{description = "No charge time", data = 0},
			{description = "1/4 of a Second", data = 0.25},
			{description = "1/2 of a Second", data = 0.5},
			{description = "3/4 of a Second", data = 0.75},
			{description = "1 Second (Default)", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "5 Seconds", data = 5},
		},
		default = 1,
	},
	
	{
		name = "brewslow",
		label = "Concoction Slowness",
		hover = "How much Hat Kid's speed is effected while holding a concoction.",
		options =
		{
			{description = "-100%", data = 0},
			{description = "-90%", data = 0.1},
			{description = "-80%", data = 0.2},
			{description = "-75%", data = 0.25},
			{description = "-70%", data = 0.3},
			{description = "-60%", data = 0.4},
			{description = "-50%", data = 0.5},
			{description = "-40%", data = 0.6},
			{description = "-30% (Default)", data = 0.7},
			{description = "-25%", data = 0.75},
			{description = "-20%", data = 0.8},
			{description = "-10%", data = 0.9},
			{description = "No effect", data = 1},
			{description = "+10%", data = 1.1},
			{description = "+20%", data = 1.2},
			{description = "+30%", data = 1.3},
			{description = "+40%", data = 1.4},
			{description = "+50%", data = 1.5},
			{description = "+60%", data = 1.6},
			{description = "+70%", data = 1.7},
			{description = "+80%", data = 1.8},
			{description = "+90%", data = 1.9},
			{description = "+100%", data = 2},
		},
		default = 0.7,
	},
	
	{
		name = "brewdamage",
		label = "Concoction Explosion Damage",
		hover = "How much damage the thrown concoction's explosion will deal.",
		options =
		{
			{description = "1", data = 1},
			{description = "9", data = 9},
			{description = "14", data = 14},
			{description = "27", data = 27},
			{description = "34", data = 34},
			{description = "46", data = 46},
			{description = "51", data = 51},
			{description = "63", data = 63},
			{description = "68", data = 68},
			{description = "72", data = 72},
			{description = "80", data = 80},
			{description = "89", data = 89},
			{description = "100 (Default)", data = 100},
			{description = "200", data = 200},
			{description = "500", data = 500},
			{description = "KILLER QUEEN!!!", data = 999999, hover = "999,999"},
		},
		default = 100,
	},
	
	{
		name = "brewradius",
		label = "Concoction Explosion Radius",
		hover = "How big the thrown concoction's explosions will be. The radius can be observed by the circle shown during the explosion.",
		options =
		{
			{description = "x0 (Disabled)", data = 0},
			{description = "x1", data = 1},
			{description = "x2", data = 2},
			{description = "x3 (Default)", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8 (Wow!)", data = 8},
		},
		default = 3,
	},

	{
		name = "Ice Hat Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "polardurability",
		label = "Ice Consumption",
		hover = "How much ice the Ice Hat can store at one time.",
		options =
		{
			{description = "None", data = false},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
			{description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8 (Default)", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "100", data = 100},
			{description = "None", data = false},
		},
		default = 8,
	},

	{
		name = "polarwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Ice Hat provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = false,
	},	

	{
		name = "polarinsulation",
		label = "Freezing Resistance",
		hover = "How much freezing resistance the Ice Hat provides while worn.",
		options =
		{
			{description = "None", data = false},
			{description = "30", data = 30},
			{description = "60", data = 60},
			{description = "90", data = 90},
			{description = "120 (Default)", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = 120,
	},
	
	{
		name = "polarcooldown",
		label = "Cooldown",
		hover = "How long the Ice Hat takes to recharge.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "4 Seconds (Default)", data = 4},
			{description = "5 Seconds", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "15 Seconds", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds", data = 45},
			{description = "60 Seconds", data = 60},
			{description = "90 Seconds", data = 90},
			{description = "2 Minutes", data = 120},
			{description = "3 Minutes", data = 180},
			{description = "4 Minutes", data = 240},
			{description = "5 Minutes", data = 300},
			{description = "10 Minutes", data = 600},
			{description = "15 Minutes", data = 900},
		},
		default = 4,
	},

	{
		name = "polarlevel",
		label = "Freeze Level",
		hover = "How much things within the radius will be frozen. Each level is equivelant to 1 hit from the Ice Staff.",
		options =
		{
			{description = "1", data = 1},
			{description = "2 (Default)", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
			{description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
		},
		default = 2,
	},

	{
		name = "polartemp",
		label = "Temp Reduction",
		hover = "Determines how much the Ice Hat cools players inside the radius down by when activated.",
		options =
		{
			{description = "None", data = 0},
			{description = "-2.5", data = 2.5},
			{description = "-5", data = 5},
			{description = "-10", data = 10},
			{description = "-15 (Default)", data = 15},
			{description = "-20", data = 20},
			{description = "-25", data = 25},
			{description = "-30", data = 30},
			{description = "-35", data = 35},
			{description = "-40", data = 40},
			{description = "-50", data = 50},
			{description = "-60", data = 60},
			{description = "-70", data = 70},
			{description = "-80", data = 80},
			{description = "-90", data = 90},
			{description = "-100", data = 100},
		},
		default = 15,
	},

	{
		name = "polarradius",
		label = "Radius",
		hover = "How big the Ice Hat's freeze radius will be. The radius can be observed by the circle shown after ground slamming.",
		options =
		{
			{description = "x1", data = 1},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6 (Default)", data = 6},
			{description = "x7", data = 7},
			{description = "x8", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
			{description = "x11", data = 11},
			{description = "x12", data = 12},
			{description = "x13", data = 13},
			{description = "x14", data = 14},
			{description = "x15", data = 15},
			{description = "x16 (Very Large)", data = 16},

		},
		default = 6,
	},

	{
		name = "Dweller's Mask Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "dwellerfuelcapacity",
		label = "Fuel Capacity",
		hover = "How much fuel the Dweller's Mask can store.",
		options =
		{
			{description = "Forever", data = false},

			{description = "5 seconds", data = 5},
			{description = "10 seconds", data = 10},
			{description = "15 seconds", data = 15},
			{description = "20 seconds", data = 20},
			{description = "25 seconds", data = 25},
			{description = "1 segment", data = 30}, -- 1 segment = 30 seconds
			{description = "2 segments", data = 30 * 2},
			{description = "4 segments (Default)", data = 30 * 4},
			{description = "8 segments", data = 30 * 8},
			{description = "1 day", data = 480}, -- 30 * 16, 1 day = 16 segments
			{description = "2 days", data = 480 * 2},
			{description = "3 days", data = 480 * 3},
			{description = "4 days", data = 480 * 4},
			{description = "5 days", data = 480 * 5},
			{description = "6 days", data = 480 * 6},
			{description = "8 days", data = 480 * 8},
			{description = "10 days", data = 480 * 10},
			{description = "12 days", data = 480 * 12},
			{description = "16 days", data = 480 * 16},
			{description = "20 days", data = 480 * 20},
			{description = "40 days", data = 480 * 40},

			{description = "Forever", data = false},
		},
		default = 30 * 4,
	},

	{
		name = "dwellerwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Dweller's Mask provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = false,
	},	

	{
		name = "dwellerinsulation",
		label = "Freezing Resistance",
		hover = "How much freezing resistance the Dweller's Mask provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "30", data = 30},
			{description = "60", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = false,
	},

	{
		name = "dwellerfuelvalue",
		label = "Fuel Value",
		hover = "How much Nightmare Fuel is worth once consumed.",
		options =
		{
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20 (Default)", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "60", data = 60},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
			{description = "300", data = 300},
			{description = "600", data = 600},
			{description = "900", data = 900},
			{description = "1800", data = 1800},
		},
		default = 20,
	},
	
	{
		name = "dwellercooldown",
		label = "Cooldown",
		hover = "How long the Dweller's Mask takes to recharge once deactivated by any means.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "4 Seconds", data = 4},
			{description = "5 Seconds", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "15 Seconds", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds (Default)", data = 45},
			{description = "60 Seconds", data = 60},
			{description = "90 Seconds", data = 90},
			{description = "2 Minutes", data = 120},
			{description = "3 Minutes", data = 180},
			{description = "4 Minutes", data = 240},
			{description = "5 Minutes", data = 300},
			{description = "10 Minutes", data = 600},
			{description = "15 Minutes", data = 900},
		},
		default = 45,
	},
	
	{
		name = "dwellerlinger",
		label = "Linger Duration",
		hover = "How long the Dweller's Mask's nightvision effect will linger on players once they've left the active radius.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "4 Seconds (Default)", data = 4},
			{description = "5 Seconds", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "15 Seconds", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds", data = 45},
			{description = "60 Seconds", data = 60},
		},
		default = 4,
	},

	{
		name = "dwellerradius",
		label = "Active Radius",
		hover = "How big the Dweller's Mask's effect radius will be. The effective radius is identical to the size of the light generated by the hat.",
		options =
		{
			{description = "x1", data = 1},
			{description = "x2", data = 2},
			{description = "x3", data = 3},
			{description = "x4", data = 4},
			{description = "x5", data = 5},
			{description = "x6", data = 6},
			{description = "x7", data = 7},
			{description = "x8 (Default)", data = 8},
			{description = "x9", data = 9},
			{description = "x10", data = 10},
			{description = "x11", data = 11},
			{description = "x12", data = 12},
			{description = "x13", data = 13},
			{description = "x14", data = 14},
			{description = "x15", data = 15},
			{description = "x16 (Very Large)", data = 16},

		},
		default = 8,
	},

	{
		name = "dwellersanitydrain",
		label = "Active Sanity Impact",
		hover = "How much sanity is restored or drained while using the Dweller's Mask",
		options =
		{
			{description = "-60/min", data = -60},
			{description = "-20/min", data = -20},
			{description = "-10/min", data = -10},
			{description = "-6.7/min (Default)", data = -6.7},
			{description = "-4.5/min", data = -4.5},
			{description = "-3.4/min", data = -3.4},
			{description = "-2/min", data = -2},
			{description = "-1.4/min", data = -1.4},
			{description = "None", data = 0},
			{description = "1.4/min", data = 1.4},
			{description = "2/min", data = 2},
			{description = "3.4/min", data = 3.4},
			{description = "4.5/min", data = 4.5},
			{description = "6.7/min", data = 6.7},
			{description = "10/min", data = 10},
			{description = "20/min", data = 20},
			{description = "60/min", data = 60},
		},
		default = -6.7,
	},

	{
		name = "dwellerthreshhold",
		label = "Sanity Threshhold",
		hover = "How much sanity is required to activate the Dweller's Mask. This amount is consumed immediately when activated.",
		options =
		{
			{description = "0", data = 0},
			{description = "1", data = 1},
			{description = "2", data = 2},
			{description = "3 (Default)", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "50", data = 50},
			{description = "100", data = 100},
		},
		default = 3,
	},

	{
		name = "dwellerblocksanity",
		label = "On-hit Sanity Penalty",
		hover = "How much sanity is taken away when someone within a Dweller's Mask's radius is hit while at 1 hp.",
		options =
		{
			{description = "None", data = 0},
			{description = "-1 (Default)", data = 1},
			{description = "-2", data = 2},
			{description = "-3", data = 3},
			{description = "-4", data = 4},
			{description = "-5", data = 5},
			{description = "-10", data = 10},
			{description = "-15", data = 15},
			{description = "-20", data = 20},
			{description = "-25", data = 25},
			{description = "-30", data = 30},
			{description = "-50", data = 50},
			{description = "-100", data = 100},
		},
		default = 1,
	},

	{
		name = "dwellerblockfuel",
		label = "On-hit Fuel Penalty",
		hover = "How much fuel is taken away when someone within a Dweller's Mask's radius is hit while at 1 hp.",
		options =
		{
			{description = "None", data = 0},
			{description = "-1", data = 1},
			{description = "-2", data = 2},
			{description = "-3 (Default)", data = 3},
			{description = "-4", data = 4},
			{description = "-5", data = 5},
			{description = "-10", data = 10},
			{description = "-15", data = 15},
			{description = "-20", data = 20},
			{description = "-25", data = 25},
			{description = "-30", data = 30},
			{description = "-60", data = 60},
			{description = "-120", data = 120},
		},
		default = 3,
	},

	{
		name = "dwellerblockamount",
		label = "On-hit Damage Multiplier",
		hover = "How damage taken while at 1 HP is translated into a max health penalty. For example, at x0.5, taking 30 damage becomes a 15 max health penalty.",
		options =
		{
			{description = "x0.1", data = 0.1},
			{description = "x0.25 (Default)", data = 0.25},
			{description = "x0.5", data = 0.5},
			{description = "x0.75", data = 0.75},
			{description = "x1", data = 1},
			{description = "x1.5", data = 1.5},
			{description = "x2", data = 2},
		},
		default = 0.25,
	},

	{
		name = "dwellerrevivepenalties",
		label = "Revive Stat Penalties",
		hover = "Whether or not players revived by the Dweller's Mask will have their sanity set to 30%, and max health decreased by 25%.",
		options =
		{
			{description = "Enabled (Default)", data = true},
			{description = "Disabled", data = false},
		},
		default = true,
	},

	{
		name = "dwellerrevivereward",
		label = "Revive Sanity Reward",
		hover = "How much sanity will be restored to the reviver upon a successful revive by the Dweller's Mask",
		options =
		{
			{description = "None", data = 0},
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "20 (Default)", data = 20},
			{description = "30", data = 30},
			{description = "40", data = 40},
			{description = "80", data = 80},
			{description = "120", data = 120},
		},
		default = 20,
	},

	{
		name = "dwellerrevivefuel",
		label = "Revive Fuel Cost",
		hover = "How much fuel it costs to revive someone succesfully.",
		options =
		{
			{description = "None", data = 0},
			{description = "-30", data = 30},
			{description = "-60 (Default)", data = 60},
			{description = "-90", data = 90},
			{description = "-120", data = 120},
			{description = "-180", data = 180},
		},
		default = 60,
	},

	{
		name = "dwellersfx",
		label = "SFX",
		hover = "Whether or not the Dweller's Mask will produce sounds.",
		options =
		{
			{description = "Enabled (Default)", data = true},
			{description = "Disabled", data = false},
		},
		default = true,
	},

	{
		name = "dwellervfx",
		label = "Screen VFX",
		hover = "Whether or not the screen will turn green while under the influence of the Dweller's Mask's night vision.",
		options =
		{
			{description = "Enabled (Default)", data = true},
			{description = "Disabled", data = false},
		},
		default = true,
	},

	{
		name = "Time Stop Hat Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "timestopdurability",
		label = "Durability",
		hover = "How long the Time Stop Hat can last without being refueled. 1 segment is 30 seconds.",
		options =
		{
			{description = "Forever", data = false},

			{description = "5 seconds", data = 5},
			{description = "10 seconds", data = 10},
			{description = "15 seconds", data = 15},
			{description = "20 seconds", data = 20},
			{description = "25 seconds", data = 25},
			{description = "1 segment (Default)", data = 30}, -- 1 segment = 30 seconds
			{description = "2 segments", data = 30 * 2},
			{description = "4 segments", data = 30 * 4},
			{description = "8 segments", data = 30 * 8},
			{description = "1 day", data = 480}, -- 30 * 16, 1 day = 16 segments
			{description = "2 days", data = 480 * 2},
			{description = "3 days", data = 480 * 3},
			{description = "4 days", data = 480 * 4},
			{description = "5 days", data = 480 * 5},
			{description = "6 days", data = 480 * 6},
			{description = "8 days", data = 480 * 8},
			{description = "10 days", data = 480 * 10},
			{description = "12 days", data = 480 * 12},
			{description = "16 days", data = 480 * 16},
			{description = "20 days", data = 480 * 20},
			{description = "40 days", data = 480 * 40},

			{description = "Forever", data = false},
		},
		default = 30,
	},

	{
		name = "timestopwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Time Stop hat provides while worn.",
		options =
		{
			{description = "None (Default)", data = false},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90%", data = 0.9},
			{description = "100%", data = 1},
		},
		default = false,
	},	

	{
		name = "timestopinsulation",
		label = "Freezing Resistance",
		hover = "How much freezing resistance the Time Stop Hat provides while worn.",
		options =
		{
			{description = "None", data = false},
			{description = "30", data = 30},
			{description = "60 (Default)", data = 60},
			{description = "90", data = 90},
			{description = "120", data = 120},
			{description = "180", data = 180},
			{description = "240", data = 240},
		},
		default = 60,
	},
	
	{
		name = "timestopcooldown",
		label = "Cooldown",
		hover = "How long the Time Stop Hat takes to recharge once deactivated by any means.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "2 Seconds", data = 2},
			{description = "3 Seconds", data = 3},
			{description = "4 Seconds", data = 4},
			{description = "5 Seconds", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "15 Seconds", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds", data = 45},
			{description = "60 Seconds", data = 60},
			{description = "90 Seconds", data = 90},
			{description = "2 Minutes", data = 120},
			{description = "3 Minutes (Default)", data = 180},
			{description = "4 Minutes", data = 240},
			{description = "5 Minutes", data = 300},
			{description = "10 Minutes", data = 600},
			{description = "15 Minutes", data = 900},
		},
		default = 180,
	},
	
	{
		name = "timestopactive",
		label = "Duration",
		hover = "How long the Time Stop Hat can remain active. It can be cancelled early regardless of what this value is set to.",
		options =
		{
			{description = "1 Second", data = 1},
			{description = "5 Seconds", data = 5},
			{description = "10 Seconds", data = 10},
			{description = "12 Seconds", data = 12},
			{description = "15 Seconds (Default)", data = 15},
			{description = "20 Seconds", data = 20},
			{description = "30 Seconds", data = 30},
			{description = "45 Seconds", data = 45},
			{description = "60 Seconds", data = 60},
			{description = "90 Seconds", data = 90},
			{description = "2 Minutes", data = 120},
			{description = "3 Minutes", data = 180},
			{description = "4 Minutes", data = 240},
			{description = "5 Minutes", data = 300},
			{description = "10 Minutes", data = 600},
			{description = "15 Minutes", data = 900},
		},
		default = 15,
	},

	{
		name = "timestopscale",
		label = "Time Speed",
		hover = "How much nearby entities are effected by the Time Stop Hat's effect. Setting this below x0.3 may cause issues.",
		options =
		{
			{description = "x0.1 (Careful)", data = 0.1},
			{description = "x0.2 (Careful)", data = 0.2},
			{description = "x0.3", data = 0.3},
			{description = "x0.34", data = 0.34},
			{description = "x0.4", data = 0.4},
			{description = "x0.5 (Default)", data = 0.5},
			{description = "x0.6", data = 0.6},
			{description = "x0.67", data = 0.67},
			{description = "x0.7", data = 0.7},
			{description = "x0.8", data = 0.8},
			{description = "x0.9", data = 0.9},
			{description = "x1 (No Effect)", data = 1},
			{description = "x1.25", data = 1.25},
			{description = "x1.5", data = 1.5},
			{description = "x1.75", data = 1.75},
			{description = "x2", data = 2},
		},
		default = 0.5,
	},
	
	{
		name = "Blue Umbrella Options",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "hatbrelladurability",
		label = "Closed Umbrella Durability",
		hover = "How many times you can hit something with the closed variant of Hat Kid's umbrella before it breaks.",
		options =
		{
			{description = "Disabled", data = false},
			
			{description = "10", data = 10},
			{description = "25", data = 25},
			{description = "50", data = 180},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "125", data = 125},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "200 (Default)", data = 200},
			{description = "250", data = 250},
			{description = "300", data = 300},
			{description = "400", data = 400},
			{description = "500", data = 500},

			{description = "Disabled", data = false},

		},
		default = 200,
	},
	
	{
		name = "hatbrelladamage",
		label = "Closed Umbrella Damage",
		hover = "How much damage Hat Kid's umbrella deals.",
		options =
		{
			{description = "1", data = 1},
			{description = "10", data = 9},
			{description = "14", data = 14},
			{description = "27", data = 27},
			{description = "34", data = 34},
			{description = "42.5 (Default)", data = 42.5},
			{description = "51", data = 51},
			{description = "63", data = 63},
			{description = "72", data = 72},
			{description = "89", data = 89},
			{description = "100", data = 100},
			{description = "200", data = 200},
			{description = "500", data = 500},
			{description = "KILLER QUEEN!!!", data = 999999, hover = "999,999"},
		},
		default = 42.5,
	},

	{
		name = "hatbrellaopendurability",
		label = "Open Umbrella Durability",
		hover = "How long you can hold the open variant of Hat Kid's umbrella, before it breaks. 1 segment is 30 seconds.",
		options =
		{
			{description = "Forever", data = false},

			{description = "5 seconds", data = 5},
			{description = "10 seconds", data = 10},
			{description = "15 seconds", data = 15},
			{description = "20 seconds", data = 20},
			{description = "25 seconds", data = 25},
			{description = "1 segment", data = 30}, -- 1 segment = 30 seconds
			{description = "2 segments", data = 30 * 2},
			{description = "4 segments", data = 30 * 4},
			{description = "8 segments", data = 30 * 8},
			{description = "1 day", data = 480}, -- 30 * 16, 1 day = 16 segments
			{description = "2 days", data = 480 * 2},
			{description = "3 days", data = 480 * 3},
			{description = "4 days", data = 480 * 4},
			{description = "5 days", data = 480 * 5},
			{description = "6 days (Default)", data = 480 * 6},
			{description = "8 days", data = 480 * 8},
			{description = "10 days", data = 480 * 10},
			{description = "12 days", data = 480 * 12},
			{description = "16 days", data = 480 * 16},
			{description = "20 days", data = 480 * 20},
			{description = "40 days", data = 480 * 40},

			{description = "Forever", data = false},

		},
		default = 480 * 6,
	},

	{
		name = "hatbrellaopenwaterproofness",
		label = "Water Resistance",
		hover = "How much water resistance the Open Blue Umbrella provides while held.",
		options =
		{
			{description = "None", data = 0},
			{description = "20%", data = 0.2},
			{description = "35%", data = 0.35},
			{description = "50%", data = 0.5},
			{description = "70%", data = 0.7},
			{description = "90% (Default)", data = 0.9},
			{description = "100%", data = 1},
		},
		default = 0.9,
	},	

	{
		name = "Misc Options",
		options = null_options,
		hover = "",
		default = 0,
	},	
	
	{
        name = "hatkid_polarhatkey",
        label = "Ability Key",
        hover = "This is the key used to activate hat abilities. Unfortunately this is set globally for all Hat Kid's, rather than per player.",
        options =
        {
            {description="TAB", data = 9},
            {description="KP_PERIOD", data = 266},
            {description="KP_DIVIDE", data = 267},
            {description="KP_MULTIPLY", data = 268},
            {description="KP_MINUS", data = 269},
            {description="KP_PLUS", data = 270},
            {description="KP_ENTER", data = 271},
            {description="KP_EQUALS", data = 272},
            {description="MINUS", data = 45},
            {description="EQUALS", data = 61},
            {description="SPACE", data = 32},
            {description="ENTER", data = 13},
            {description="ESCAPE", data = 27},
            {description="HOME", data = 278},
            {description="INSERT", data = 277},
            {description="DELETE", data = 127},
            {description="END", data   = 279},
            {description="PAUSE", data = 19},
            {description="PRINT", data = 316},
            {description="CAPSLOCK", data = 301},
            {description="SCROLLOCK", data = 302},
            {description="RSHIFT", data = 303}, -- use SHIFT instead
            {description="LSHIFT", data = 304}, -- use SHIFT instead
            {description="RCTRL", data = 305}, -- use CTRL instead
            {description="LCTRL", data = 306}, -- use CTRL instead
            {description="RALT", data = 307}, -- use ALT instead
            {description="LALT", data = 308}, -- use ALT instead
            {description="ALT", data = 400},
            {description="CTRL", data = 401},
            {description="SHIFT", data = 402},
            {description="BACKSPACE", data = 8},
            {description="PERIOD", data = 46},
            {description="SLASH", data = 47},
            {description="LEFTBRACKET", data     = 91},
            {description="BACKSLASH", data     = 92},
            {description="RIGHTBRACKET", data = 93},
            {description="TILDE", data = 96},
            {description="A", data = 97},
            {description="B", data = 98},
            {description="C", data = 99},
            {description="D", data = 100},
            {description="E", data = 101},
            {description="F", data = 102},
            {description="G", data = 103},
            {description="H", data = 104},
            {description="I", data = 105},
            {description="J", data = 106},
            {description="K", data = 107},
            {description="L", data = 108},
            {description="M", data = 109},
            {description="N", data = 110},
            {description="O", data = 111},
            {description="P", data = 112},
            {description="Q", data = 113},
            {description="R", data = 114},
            {description="S", data = 115},
            {description="T", data = 116},
            {description="U", data = 117},
            {description="V", data = 118},
            {description="W", data = 119},
            {description="X", data = 120},
            {description="Y", data = 121},
            {description="Z (Default)", data = 122},
            {description="F1", data = 282},
            {description="F2", data = 283},
            {description="F3", data = 284},
            {description="F4", data = 285},
            {description="F5", data = 286},
            {description="F6", data = 287},
            {description="F7", data = 288},
            {description="F8", data = 289},
            {description="F9", data = 290},
            {description="F10", data = 291},
            {description="F11", data = 292},
            {description="F12", data = 293},
 
            {description="UP", data = 273},
            {description="DOWN", data = 274},
            {description="RIGHT", data = 275},
            {description="LEFT", data = 276},
            {description="PAGEUP", data = 280},
            {description="PAGEDOWN", data = 281},
 
            {description="0", data = 48},
            {description="1", data = 49},
            {description="2", data = 50},
            {description="3", data = 51},
            {description="4", data = 52},
            {description="5", data = 53},
            {description="6", data = 54},
            {description="7", data = 55},
            {description="8", data = 56},
            {description="9", data = 57},
        },
        default = 122,
    },

	{
		name = "funnymode",
		label = "Funny Mode",
		hover = "Causes some intentional glitches. You may not notice an effect.",
		options =
		{
			{description = "Disabled (Default)", data = false},
			{description = "Enabled", data = true},
		},
		default = false,
	},
	
	{
		name = "Experimental",
		options = null_options,
		hover = "",
		default = 0,
	},	

	{
		name = "itemrestrictions",
		label = "Hat Kid Item Restrictions",
		hover = "Restricts Hat Kid's custom items to be useable exclusively on her. The ability keybind is not available to other characters.",
		options =
		{
			{description = "Disabled", data = false},
			{description = "Enabled (Default)", data = true},
		},
		default = true,
	},

	-- {
	-- 	name = "enablepons",
	-- 	label = "Pons",
	-- 	hover = "Enables the Pon Count Meter, as well as the spawning of Green Pons through various actions (eg. mining, chopping, killing)",
	-- 	options =
	-- 	{
	-- 		{description = "Disabled (Default)", data = false},
	-- 		{description = "Enabled", data = true},
	-- 	},
	-- 	default = false,
	-- },

	-- {
	-- 	name = "ponsmax",
	-- 	label = "Max Pons",
	-- 	hover = "How many Pons Hat Kid can hold at once.",
	-- 	options =
	-- 	{
	-- 		{description = "1,000", data = 1000},
	-- 		{description = "1,500", data = 1500},
	-- 		{description = "2,000", data = 2000},
	-- 		{description = "2,500", data = 2500},
	-- 		{description = "2,500 (Default)", data = 2500},
	-- 		{description = "3,000", data = 3000},
	-- 		{description = "3,500", data = 3500},
	-- 		{description = "4,000", data = 4000},
	-- 		{description = "4,500", data = 4500},
	-- 		{description = "5,000", data = 5000},
	-- 		{description = "10,000", data = 10000},
			

	-- 	},
	-- 	default = 2500,
	-- },
}