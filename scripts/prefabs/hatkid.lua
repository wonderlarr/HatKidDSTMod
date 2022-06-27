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
	end
end

local function OnUnequip(inst, data) -- Add a sanity modifier if the head slot is unequipped
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.neg_aura_modifiers:SetModifier(inst, TUNING.HATKIDSANITYDRAIN, "hat_sanity_vuln")
    end
end

-- When spawning the character
local function OnNewSpawn(inst)
-- Listens for taking off hat, applies sanity mods
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", OnAlien)
    inst:ListenForEvent("ms_becameghost", OnGhost)
end

local function OnLoad(inst, data)
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", OnAlien)
    inst:ListenForEvent("ms_becameghost", OnGhost)
	
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
	
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING["HATKID"].KEY, "AbilityKeyDown", "KEYDOWN")

	-- 50% chance of quote on potion explode
	inst:ListenForEvent("PotionThrown", OnPotionThrow)
end

-- Server only, most components go here.
local MasterPostInit = function(inst, data)
	-- If anything below is hard coded and not configurable, I did my job wrong. Please yell at me if that's the case.

	-- Health
	inst.components.health:SetMaxHealth(TUNING.HATKID_HEALTH)

	-- Hunger
	inst.components.hunger:SetMax(TUNING.HATKID_HUNGER)
	inst.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.HATKIDRATE, "base")

	-- Sanity
	inst.components.sanity:SetMax(TUNING.HATKID_SANITY) 
	inst.components.sanity.rate_modifier = TUNING.HATKIDSANITYMULT
	inst.components.sanity.night_drain_mult = TUNING.HATKIDNIGHTDRAIN
	inst.components.sanity.neg_aura_modifiers:SetModifier(inst, TUNING.HATKIDSANITYDRAIN, "base")

	-- Combat
	inst.components.combat.externaldamagemultipliers:SetModifier(inst, TUNING.HATKIDDAMAGEDEALT, "base")
	inst.components.combat.externaldamagetakenmultipliers:SetModifier(inst, TUNING.HATKIDDAMAGETAKEN, "base")

	-- Movement
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)

	-- Flavor/Misc
	inst.components.foodaffinity:AddPrefabAffinity("pumpkincookie", TUNING.AFFINITY_15_CALORIES_LARGE) -- Favorite food
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

	-- Listeners/Generics
    inst.OnNewSpawn = OnNewSpawn
	inst.OnLoad = OnLoad
end

return MakePlayerCharacter("hatkid", prefabs, assets, CommonPostInit, MasterPostInit, startInv)