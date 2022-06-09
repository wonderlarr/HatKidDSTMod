
--A prefabs table is created in which all of our custom skins will be poured into and then this file returns the unpacked contents.
--”whimsy” in this case is the code name of my friends custom character
local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("hatkid_none", {
	assets = {
		Asset("ANIM", "anim/hatkid.zip"),
		Asset("ANIM", "anim/ghost_hatkid_build.zip"),
	},
	skins = {
		normal_skin = "hatkid",
		ghost_skin = "ghost_hatkid_build",
	},

	base_prefab = "hatkid",
	build_name_override = "hatkid",

	type = "base",
	rarity = "Character",

	skin_tags = { "BASE", "HATKID"},
}))

table.insert(prefabs, CreatePrefabSkin("ms_hatkid_dye_niko", {
	assets = {
        Asset("ANIM", "anim/hatkid_dye_niko.zip"),
        Asset("ANIM", "anim/ghost_hatkid_build.zip"),
    },
	skins = {
		normal_skin = "hatkid_dye_niko",
		ghost_skin = "ghost_hatkid_build",
	},

	base_prefab = "hatkid",
	build_name_override = "hatkid_dye_niko",

	torso_untuck_builds = { "hatkid_dye_niko", },
	type = "base",
	rarity = "ModMade",

	skin_tags = { "BASE", "HATKID" },
}))


return unpack(prefabs)