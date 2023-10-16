local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	-- Hat Kid's voice
	Asset( "SOUNDPACKAGE", "sound/hatkidvoice.fev"),
    Asset( "SOUND", "sound/hatkidvoice.fsb"),
}

local prefabs = {}

-- Starting inventory as a table. Passed into MakePlayerCharacter later
local startInv = { "kidhat" }

-- On revive or load, onbecomehuman equivalent
local function OnAlien(inst, data, isloading)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)

	-- Wanda item compat
	if inst.components.positionalwarp ~= nil then
		if not isloading then
			inst.components.positionalwarp:Reset()
		end
		if inst.components.inventory:HasItemWithTag("pocketwatch_warp", 1) then
			inst.components.positionalwarp:EnableMarker(true)
		end
	end
end

-- Called only on respawns
local function OnAlienRespawn(inst)
	inst.components.sanity:DoDelta(30)
end

-- On death, onbecomeghost equivalent
local function OnGhost(inst)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "hatkid_speed_config")

	-- Wanda item compat
	if inst.components.positionalwarp ~= nil then
		inst.components.positionalwarp:EnableMarker(false)
	end
end

local function on_show_warp_marker(inst)
	inst.components.positionalwarp:EnableMarker(true)
end

local function on_hide_warp_marker(inst)
	inst.components.positionalwarp:EnableMarker(false)
end

local function DelayedWarpBackTalker(inst)
	-- if the player starts moving right away then we can skip this
	if inst.sg == nil or inst.sg:HasStateTag("idle") then 
		inst.components.talker:Say(GetString(inst, "ANNOUNCE_POCKETWATCH_RECALL"))
	end 
end

local function OnWarpBack(inst, data)
	if inst.components.positionalwarp ~= nil then
		if data ~= nil and data.reset_warp then
			inst.components.positionalwarp:Reset()
			inst:DoTaskInTime(15 * FRAMES, DelayedWarpBackTalker) 
		else
			inst.components.positionalwarp:GetHistoryPosition(true)
		end
	end
end


local function OnPotionThrow(inst)

	local lines = {
		"Bam!",
		"Ba-bam!",
		"Blammo!",
		"Boo-ya" ,
	}
	
	-- Possibly overcomplicated way to make things happen 50% of the time. Not called often, should be fine.
	if math.random(1, 2) == 1 and inst.components.talker then
		-- Say one of the 4 lines defined above.
		inst.components.talker:Say(lines[math.random(1, 4)])
	end
end

local function OnEquip(inst, data) -- Remove hat sanity modifer when wearing a hat
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.neg_aura_modifiers:RemoveModifier(inst, "hat_sanity_vuln")
		inst.components.sanity.night_drain_mult = TUNING.HATKIDNIGHTDRAIN
	end
end

local function OnUnequip(inst, data) -- Add a sanity modifier if the head slot is unequipped
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.neg_aura_modifiers:SetModifier(inst, TUNING.HATKIDNOHATPENALTY, "hat_sanity_vuln")
		inst.components.sanity.night_drain_mult = TUNING.HATKIDNIGHTDRAIN * TUNING.HATKIDNOHATPENALTY
    end
end


local hatlist = {
    "kidhat",
    "sprinthat",
    "brewinghat",
    "polarhat",
    "dwellermask",
    "timestophat",
}

local hatlist_r = {
    "timestophat",
	"dwellermask",
	"polarhat",
	"brewinghat",
	"sprinthat",
	"kidhat",
}

local function SimpleHatSwitch(inst, reverse)
	local hatpack = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BEARD)
	local playerinv = inst.components.inventory
	local oldhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)

	local instances = {}

	for k, v in pairs(reverse and hatlist_r or hatlist) do
		local hatpack_item = hatpack and next(hatpack.components.container:GetItemByName(v, 1, true))
		local playerinv_item = next(playerinv:GetItemByName(v, 1, true))
		if hatpack_item or playerinv_item ~= nil then
			table.insert(instances, k, hatpack_item or playerinv_item)
		end
	end

	if oldhat and oldhat:HasTag("hatkidhat") then
		for k, v in pairs(reverse and hatlist_r or hatlist) do
			if oldhat.prefab == v then
				for i = k, 12, 1 do
					if i > 6 then
						if instances[i - 6] then
							inst.components.inventory:Equip(instances[i - 6])
							break
						end
					else
						if instances[i + 1] then
							inst.components.inventory:Equip(instances[i + 1])
							break
						end
					end
				end
				break
			end
		end
	else
		for i = 1, 6, 1 do
			if instances[i] then
				inst.components.inventory:Equip(instances[i])
				break
			end
		end
	end
end

-- When spawning the character
local function OnNewSpawn(inst)
-- Listens for taking off hat, applies sanity mods
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", OnAlien)
	inst:ListenForEvent("ms_respawnedfromghost", OnAlienRespawn)
    inst:ListenForEvent("ms_becameghost", OnGhost)

	inst:ListenForEvent("SwitchKey", SimpleHatSwitch)
end

local function OnLoad(inst, data)
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", OnAlien)
	inst:ListenForEvent("ms_respawnedfromghost", OnAlienRespawn)
    inst:ListenForEvent("ms_becameghost", OnGhost)

	inst:ListenForEvent("SwitchKey", SimpleHatSwitch)
	
    if inst:HasTag("playerghost") then
        OnGhost(inst)
    else
        OnAlien(inst)
    end
end

-- Server and client
local CommonPostInit = function(inst) 
	inst.MiniMapEntity:SetIcon( "hatkid.tex" )
	inst.components.talker.font = TALKINGFONT_HATKID
	inst.components.talker.fontsize = 28 -- 35 is default, decreased to help with longer sentences
	inst:AddTag("hatkid") -- Unique character tag, used for various things
	inst:AddTag("hatkidcrafter") -- Enables crafting of Hat Kid's hats

	inst:AddTag("madhatter") -- from the MadHatter component
	inst:AddTag("pocketwatchcaster") -- Enables usage of Wanda's clocks, but not crafting
	
	inst:AddComponent("keyhandler") -- From custom Key Handler by Kzisor/Ysovuka https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING.HATKID_ABILITYKEY, "AbilityKeyDown", "KEYDOWN")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING.HATKID_SWITCHKEY, "SwitchKeyDown", "KEYDOWN")

	-- 50% chance of quote on potion explode TODO move this somewhere better
	inst:ListenForEvent("PotionThrown", OnPotionThrow)
	
	-- This seems like it should only be a server component, but it breaks if you dont add it to both for now
	inst:AddComponent("madhatter")
end

-- Server only, most components go here.
local MasterPostInit = function(inst, data)
	-- Health
	inst.components.health:SetMaxHealth(TUNING.HATKID_HEALTH)

	-- Hunger
	inst.components.hunger:SetMax(TUNING.HATKID_HUNGER)
	inst.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.HATKIDRATE, "config_base")

	-- Sanity
	inst.components.sanity:SetMax(TUNING.HATKID_SANITY) 
	inst.components.sanity.rate_modifier = TUNING.HATKIDSANITYMULT
	inst.components.sanity.night_drain_mult = TUNING.HATKIDNIGHTDRAIN
	inst.components.sanity.neg_aura_modifiers:SetModifier(inst, TUNING.HATKIDSANITYDRAIN, "config_base")

	-- Combat
	inst.components.combat.externaldamagemultipliers:SetModifier(inst, TUNING.HATKIDDAMAGEDEALT, "config_base")
	inst.components.combat.externaldamagetakenmultipliers:SetModifier(inst, TUNING.HATKIDDAMAGETAKEN, "config_base")

	-- Movement
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)

	-- Flavor/Misc
	inst.components.foodaffinity:AddPrefabAffinity("honeynuggets", TUNING.AFFINITY_15_CALORIES_LARGE) -- Favorite food
	inst.AnimState:SetScale(TUNING.HATKIDSIZE, TUNING.HATKIDSIZE) -- Character size

	-- Wanda
	inst:AddComponent("positionalwarp")
	inst:DoTaskInTime(0, function() inst.components.positionalwarp:SetMarker("pocketwatch_warp_marker") end)
	inst.components.positionalwarp:SetWarpBackDist(TUNING.WANDA_WARP_DIST_NORMAL)

	inst:ListenForEvent("show_warp_marker", on_show_warp_marker)
	inst:ListenForEvent("hide_warp_marker", on_hide_warp_marker)
    inst:ListenForEvent("onwarpback", OnWarpBack)

	-- Voice
	if TUNING.HATKIDVOICE == "hatkidvoice" then
		-- Custom voice made by myself, Skylarr!
		inst.soundsname = "hatkidvoice"
		inst.talker_path_override = "hatkidvoice/"
	else
		-- Use a vanilla voice if the player desires
		inst.soundsname = TUNING.HATKIDVOICE
	end

    inst.OnNewSpawn = OnNewSpawn
	inst.OnLoad = OnLoad
	
	inst.CurrentHat = 0

	-- Check if HATKID_CRAFT_SANITY is nonzero (has a positive value)
	if TUNING.HATKID_CRAFT_SANITY ~= 0 then
		-- Listen for the "builditem" event
		inst:ListenForEvent("builditem", function(inst, data)
			-- Check if the built item has the "hat" tag and if the player has a sanity component
			if data.item:HasTag("hat") and inst.components.sanity then
				-- Increase the player's sanity by the specified amount from TUNING.HATKID_CRAFT_SANITY
				inst.components.sanity:DoDelta(TUNING.HATKID_CRAFT_SANITY)
			end
		end)
	end

	-- Check if HATKID_FASTCRAFTING is enabled
	if TUNING.HATKID_FASTCRAFTING then
		-- Listen for the "makerecipe" event
		inst:ListenForEvent("makerecipe", function(inst, data)
			-- Iterate through the list of hats in TUNING.HATKID_FAST_HATS
			for k, v in pairs(TUNING.HATKID_FAST_HATS) do
				-- Check if the crafted recipe's product matches any hat in the list
				if data.recipe.product == v then
					-- Add the "fastbuilder" tag to the player temporarily
					inst:AddTag("fastbuilder")
					-- Remove next tick
					inst:DoTaskInTime(0, function(inst)
						if inst:HasTag("fastbuilder") then
							inst:RemoveTag("fastbuilder")
						end
					end)
					return -- Exit the loop early since we found a match
				end
			end
		end)
	end

end

return MakePlayerCharacter("hatkid", prefabs, assets, CommonPostInit, MasterPostInit, startInv)