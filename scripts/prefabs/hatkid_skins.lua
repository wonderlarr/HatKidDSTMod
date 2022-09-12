
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

local hatskins = {
	"ms_hatkid_cat",
	"ms_hatkid_detective",
	"ms_hatkid_dye_bowkid",
	"ms_hatkid_dye_groovy",
	"ms_hatkid_dye_lunar",
	"ms_hatkid_dye_niko",
	"ms_hatkid_dye_pinkdanger",
	"ms_hatkid_dye_sans",
	"ms_hatkid_dye_toonlink",
}

for k,v in ipairs(hatskins) do

	table.insert(prefabs, CreatePrefabSkin(v, {
		assets = {
			Asset("ANIM", "anim/" .. v .. ".zip"),
			Asset("ANIM", "anim/ghost_hatkid_build.zip"),
		},
		skins = {
			normal_skin = v,
			ghost_skin = "ghost_hatkid_build",
		},

		base_prefab = "hatkid",
		build_name_override = v,

		type = "base",
		rarity = "ModMade",

		skin_tags = { "BASE", "HATKID" },
	}))
end


return unpack(prefabs)