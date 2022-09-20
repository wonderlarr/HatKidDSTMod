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
	-- Launch
	"ms_hatkid_cat",
	"ms_hatkid_detective",
	"ms_hatkid_dye_bowkid",
	"ms_hatkid_dye_groovy",
	"ms_hatkid_dye_lunar",
	"ms_hatkid_dye_niko",
	"ms_hatkid_dye_pinkdanger",
	"ms_hatkid_dye_sans",
	"ms_hatkid_dye_toonlink",
	--New
	"ms_hatkid_dye_oliver",
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