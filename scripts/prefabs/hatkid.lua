local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	-- Hat Kid's voice
	Asset( "SOUNDPACKAGE", "sound/hatkidvoice.fev"),
    Asset( "SOUND", "sound/hatkidvoice.fsb"),
}

local prefabs = {}

-- Starting inventory as a table. Passed into MakePlayerCharacter later
local startInv = { "kidhat" }

-- On revive or load
local function OnAlien(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)
end

local function OnAlienRespawn(inst)
	inst.components.sanity:DoDelta(30)
end

-- On death
local function OnGhost(inst)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "hatkid_speed_config")
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
-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling info https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local CommonPostInit = function(inst) 
	inst.MiniMapEntity:SetIcon( "hatkid.tex" )
	inst:AddTag("hatkidcrafter")
	inst:AddTag("hatkid")
	inst:AddTag("madhatter")
	
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING.HATKID_ABILITYKEY, "AbilityKeyDown", "KEYDOWN")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING.HATKID_SWITCHKEY, "SwitchKeyDown", "KEYDOWN")

	-- 50% chance of quote on potion explode
	inst:ListenForEvent("PotionThrown", OnPotionThrow)
	
	inst:AddComponent("madhatter")
end

-- Server only, most components go here.
local MasterPostInit = function(inst, data)
	-- If anything below is hard coded and not configurable, I did my job wrong. Please yell at me if that's the case.

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