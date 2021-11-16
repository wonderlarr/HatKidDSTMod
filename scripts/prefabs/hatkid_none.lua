local assets =
{
	Asset( "ANIM", "anim/hatkid.zip" ),
	Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
}

local skins =
{
	normal_skin = "hatkid",
	ghost_skin = "ghost_hatkid_build",
}

return CreatePrefabSkin("hatkid_none",
{
	base_prefab = "hatkid",
	type = "base",
	assets = assets,
	skins = skins, 
	skin_tags = {"HATKID", "CHARACTER", "BASE"},
	build_name_override = "hatkid",
	rarity = "Common",
})