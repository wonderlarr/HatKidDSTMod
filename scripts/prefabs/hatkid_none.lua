-- local assets =
-- {
-- 	Asset( "ANIM", "anim/hatkid.zip" ),
-- 	Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
-- }

-- local skins =
-- {
-- 	normal_skin = "hatkid",
-- 	ghost_skin = "ghost_hatkid_build",
-- }

-- return CreatePrefabSkin("hatkid_none",
-- {
-- 	base_prefab = "hatkid",
-- 	type = "base",
-- 	assets = assets,
-- 	skins = skins, 
-- 	skin_tags = {"HATKID", "CHARACTER", "BASE"},
-- 	build_name_override = "hatkid",
-- 	rarity = "Common",
-- })

--Hornet: This is how I did my skins prefab file!, Obviously youll need to change all instances of wilba to your characters prefab name
local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("hatkid_none", --This skin is the regular default skin we have, You should already have this
{
	base_prefab = "hatkid", --What Prefab are we skinning? The character of course!
	build_name_override = "hatkid",
	type = "base", --Hornet: Make sure you have this here! You should have it but ive seen some character mods with out
	rarity = "Character",
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID", },
	skins = {
		normal_skin = "hatkid",      --These are your skin modes here, now you should have 2. But I actually have 4 for WIlba! Due to her werewilba form and transformation animation
		ghost_skin = "ghost_hatkid_build",
	},
	assets = {
		Asset( "ANIM", "anim/hatkid.zip" ), --Self-explanatory, these are the assets your character is using!
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("hatkid_cat", --Now heres the fun part, Our skin! I did "wilba_victorian" but you can do whatever skin set you want!
{
	base_prefab = "hatkid",
	build_name_override = "hatkid_cat", --The build name of your new skin,
	type = "base",
	rarity = "Elegant", --I did the Elegant Rarity, but you can do whatever rarity you want!
	rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID" }, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "hatkid_cat", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_hatkid_build", 
	},

	assets = {
		Asset( "ANIM", "anim/hatkid_cat.zip" ),
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("hatkid_detective", --Now heres the fun part, Our skin! I did "wilba_victorian" but you can do whatever skin set you want!
{
	base_prefab = "hatkid",
	build_name_override = "hatkid_detective", --The build name of your new skin,
	type = "base",
	rarity = "Elegant", --I did the Elegant Rarity, but you can do whatever rarity you want!
	rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID" }, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "hatkid_detective", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_hatkid_build", 
	},

	assets = {
		Asset( "ANIM", "anim/hatkid_detective.zip" ),
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("hatkid_dye_niko", --Now heres the fun part, Our skin! I did "wilba_victorian" but you can do whatever skin set you want!
{
	base_prefab = "hatkid",
	build_name_override = "hatkid_dye_niko", --The build name of your new skin,
	type = "base",
	rarity = "Spiffy", --I did the Elegant Rarity, but you can do whatever rarity you want!
	-- rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID" }, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "hatkid_dye_niko", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_hatkid_build", 
	},

	assets = {
		Asset( "ANIM", "anim/hatkid_dye_niko.zip" ),
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("hatkid_dye_toonlink", --Now heres the fun part, Our skin! I did "wilba_victorian" but you can do whatever skin set you want!
{
	base_prefab = "hatkid",
	build_name_override = "hatkid_dye_toonlink", --The build name of your new skin,
	type = "base",
	rarity = "Spiffy", --I did the Elegant Rarity, but you can do whatever rarity you want!
	-- rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID" }, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "hatkid_dye_toonlink", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_hatkid_build", 
	},

	assets = {
		Asset( "ANIM", "anim/hatkid_dye_toonlink.zip" ),
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("hatkid_dye_pinkdanger", --Now heres the fun part, Our skin! I did "wilba_victorian" but you can do whatever skin set you want!
{
	base_prefab = "hatkid",
	build_name_override = "hatkid_dye_pinkdanger", --The build name of your new skin,
	type = "base",
	rarity = "Spiffy", --I did the Elegant Rarity, but you can do whatever rarity you want!
	-- rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "HATKID" }, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "hatkid_dye_pinkdanger", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_hatkid_build", 
	},

	assets = {
		Asset( "ANIM", "anim/hatkid_dye_pinkdanger.zip" ),
		Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	},

}))

--If youd like to make more skins, simply copy the CreatePrefabSkin function and accordingly make new skins you want!

return unpack(prefabs)