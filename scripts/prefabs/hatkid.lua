local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset("ANIM", "anim/ui_chest_3x3.zip"),

		-- Hat Kid's voice
	Asset( "SOUNDPACKAGE", "sound/hatkidvoice.fev"),
    Asset( "SOUND", "sound/hatkidvoice.fsb"),
}
local prefabs = {}

-- Custom starting items

local start_inv = {
}

-- local function round(num) --Stole this from an official lua guide, not just DST. Very useful.
-- 	if num then
-- 		if num >= 0 then 
-- 			return math.ceil(num) 
-- 		else
-- 			return math.floor(num) 
-- 		end
-- 	end
-- end

--[[
local function oncooldown(inst)
	local cdnum = round(inst.components.timer:GetTimeLeft("hat_cooldown"))
	local cdstring = "COOLDOWN VALUE MISSING"
	if cdnum ~= nil then

		if cdnum <= 60 then -- If 60 seconds or under, only say seconds.
			cdstring = "Only " .. cdnum .. " seconds left!"
		elseif cdnum < 120 then -- If less than 2 minutes, say seconds and "minute"
			local cds = cdnum % 60
			local cdm = (cdnum - cds) / 60
			cdstring = cdm .. " minute and " .. cds .. " seconds left!"
		else --Otherwise, say seconds and "minutes"
			local cds = cdnum % 60
			local cdm = (cdnum - cds) / 60
			cdstring = cdm .. " minutes and " .. cds .. " seconds left!"
		end
	end
	inst.components.talker:Say(cdstring)
end

-- Fires on client
local function OnHatCooldownDirty(inst)
	inst.hatcooldown = inst.net_hatcooldown:value()
	-- inst.maxcooldown = inst.net_maxcooldown:value()
end

local function OnHatCooldownServer(inst)
	local l = inst.components.timer:GetTimeLeft("hat_cooldown")
	local e = inst.components.timer:GetTimeElapsed("hat_cooldown")
	
	if l and e then
		--print("Hat max cooldown")
		--print(l + e) -- WE GOT IT! l + e always equals max cooldown
	end
	inst.hatcooldown = round(inst.components.timer:GetTimeLeft("hat_cooldown")) or 0
	inst.net_hatcooldown:set(inst.hatcooldown)
end
]]

--When Hat Kid spawns in, she is given these items.
local function SpawnWithStuff(inst)
    local kidhat = SpawnPrefab("kidhat")
    inst.components.inventory:Equip(kidhat)
	
	-- local hatbrella = SpawnPrefab("hatbrella")
    -- inst.components.inventory:Equip(hatbrella)
end

-- local function LoadPonInv(inst)
-- 	if inst.lab then
-- 		inst.lab.components.container:Open(inst)
-- 	end
-- end

-- When the character is revived
local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)

	inst.AnimState:SetScale(TUNING.HATKIDSIZE, TUNING.HATKIDSIZE) 
end

-- when he died
local function onbecameghost(inst)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "hatkid_speed_config")
	
	-- HACK, overriding size manually on death so the ghost isn't unreasonably tiny. This won't look right if the player has the character size turned up higher than normal.
	inst.AnimState:SetScale(1, 1) 
end

local function OnPotionThrow(inst)

	local lines = {
		"Bam!",
		"Ba-bam!",
		"Blammo!",
		"Boo-ya" ,
	}
	
	-- Possibly overcomplicated way to make things happen 50% of the time. 
	if math.random(1, 2) == 1 and inst.components.talker then
		-- Say one of the 4 lines defined above.
		inst.components.talker:Say(lines[math.random(1, 4)])
	end
end

local function MakeDirt(inst)
	local scale = 0.4
	local x, y, z = inst.Transform:GetWorldPosition()
	local dirt = SpawnPrefab("sprint_puff")
	dirt.Transform:SetPosition(x, y, z)
	dirt.Transform:SetScale(scale, scale, scale)
end

local hat = nil

local function CleanSprintParticles(inst)
	inst.sprintfx = nil
end

local function onLocomote(inst)
	local isrunning = inst.components.locomotor.wantstorun

	if not TheWorld.ismastersim and inst.replica.inventory then

		hat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)

	elseif inst.components.inventory then

		hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)

	end
	

	if hat then

		if isrunning and hat.prefab == "sprinthat" then

			if not inst.sprintfx then
				
				inst.sprintfx = inst:DoTaskInTime(0.25/2, function(inst)
					inst.sprintfx:Cancel()
					inst.sprintfx = nil
					MakeDirt(inst)
				end)
			end
		end
	end
end


local function OnEquip(inst, data) -- Remove hat sanity modifer when wearing a hat
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.dapperness = 0

		inst.components.sanity.neg_aura_modifiers:RemoveModifier(inst, "hat_sanity_vuln")
	end
end

local function OnUnequip(inst, data) -- Add a sanity modifier if the head slot is unequipped
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.dapperness = -TUNING.DAPPERNESS_SMALL

		inst.components.sanity.neg_aura_modifiers:SetModifier(inst, TUNING.HATKIDSANITYDRAIN, "hat_sanity_vuln")
    end
end

-- When spawning the character
local function onnewspawn(inst)
-- Listens for taking off hat, sanity drains without hat
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

	SpawnWithStuff(inst)
	-- LoadPonInv(inst)
end

local function ApplyPons(inst, data)
	if data.target:IsValid() and not data.target:IsInLimbo() and not data.target:HasTag("pons") and TUNING.ENABLE_PONS then
		-- Apply pons to attackable things
		if data.target.components.lootdropper and data.target.components.health then
			data.target.components.lootdropper:AddChanceLoot("pon", 1)
			data.target.components.lootdropper:AddChanceLoot("pon", 0.2)

			-- Add additional pons to slightly stronger enemies
			if data.target.components.health.maxhealth >= 100 then
				
				data.target.components.lootdropper:AddChanceLoot("pon", 0.9)
				data.target.components.lootdropper:AddChanceLoot("pon", 0.2)
			end

			-- Additonal pon chance for every 250 health above the first 250. Enemies that have a multiple of 250 health will get an additional pon chance but that's okay.
			if data.target.components.health.maxhealth >= 250 then
				
				for i = data.target.components.health.maxhealth,0,-250 
				do 
					data.target.components.lootdropper:AddChanceLoot("pon", 1)
					data.target.components.lootdropper:AddChanceLoot("pon", 0.3)
				end
			end

			data.target:AddTag("pons")
		end

		if data.target.components.workable and data.target.components.lootdropper then

			-- chance 
			for i = data.target.components.workable.workleft / 2 + 1 or 1, 0, -1
			do
				data.target.components.lootdropper:AddChanceLoot("pon", 0.75)
			end

			data.target:AddTag("pons")
		end
		

	end
end

-- widgetsetup =
-- {
--     widget =
--     {
--         slotpos = {},
--         animbank = "ui_chest_3x3",
--         animbuild = "ui_chest_3x3",
--         pos = Vector3(0, 200, 0),
--         side_align_tip = 160,
--     },
--     type = "chest",
-- }

-- for y = 2, 0, -1 do
--     for x = 0, 2 do
--         table.insert(widgetsetup.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
--     end
-- end

-- local function OnPonsDirty(inst)
-- 	inst.pons = inst.net_pons:value()
-- 	inst:PushEvent("UpdatePons")
-- end

-- local function OnGetPon(inst, data)
-- 	local num = data.count or 1

-- 	inst.pons = inst.pons + num

-- 	inst.net_pons:set(inst.pons)
-- end

local function OnSave(inst, data)
	-- data.pons = inst.pons or 0
end

local function OnLoad(inst, data)
	-- if data.pons ~= nil then
	-- 	inst.pons = data.pons
	-- 	inst.net_pons:set(data.pons)
	-- end

	-- LoadPonInv(inst)


	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)

	inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
	
    -- if inst:HasTag("playerghost") then
    --     onbecameghost(inst)
    -- else
    --     onbecamehuman(inst)
    -- end

	-- inst:DoTaskInTime(0, function(inst)
	-- 	inst.skin = inst.AnimState:GetBuild()
	-- end)

end

-- local function OnClosePon(inst)
-- 	inst.tryopen = inst:DoPeriodicTask(0.5, function(inst)
-- 		if inst.components.inventory.isvisible == true then
-- 			-- LoadPonInv(inst)
			
-- 			inst.tryopen:Cancel()
-- 			inst.tryopen = nil
-- 		end
-- 	end)
-- end

-- Server and client
-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling info https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "hatkid.tex" )
	inst:AddTag("hatkidcrafter")
	inst:AddTag("hatkid")
	
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING["HATKID"].KEY, "AbilityKeyDown", "KEYDOWN")

	-- sprint hat stuff
	inst:ListenForEvent("locomote", onLocomote)
	inst:ListenForEvent("UpdateSprintParticles", onLocomote)
	inst:ListenForEvent("CleanSprintParticles", CleanSprintParticles)

	-- 50% chance of quote on potion explode
	inst:ListenForEvent("PotionThrown", OnPotionThrow)
	
	-- if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("treasurechest", widgetsetup) end
	-- end

	-- inst.Physics:CollidesWith(2017)

	-- inst.pons = 0
	-- inst.net_pons = net_ushortint(inst.GUID, "pons", "pons_dirty" )

-- 	if not TheWorld.ismastersim then
-- 		inst:ListenForEvent("pons_dirty", OnPonsDirty)
-- 	end

	
-- 	inst.lab = SpawnPrefab("inv_pons")
-- 	inst.lab.entity:SetParent(inst.entity)
end

-- Server only, most components go here.
local master_postinit = function(inst, data)
	-- If anything below is hard coded and not configurable, I did my job wrong. Please yell at me if that's the case.

	-- Health
	inst.components.health:SetMaxHealth(TUNING.HATKID_HEALTH)

	-- Hunger
	inst.components.hunger:SetMax(TUNING.HATKID_HUNGER)
	inst.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.HATKIDRATE * TUNING.WILSON_HUNGER_RATE, "base")

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

	-- Custom voice made by myself, Skylarr!
	inst.soundsname = "hatkidvoice"
	inst.talker_path_override = "hatkidvoice/"

	-- Listeners/Generics
    inst.OnNewSpawn = onnewspawn

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	-- Pon stuff, currently disabled altgoether

	-- inst:ListenForEvent("onattackother", ApplyPons)
	-- inst:ListenForEvent("working", ApplyPons)

	-- inst:ListenForEvent("GetPon", OnGetPon)
	-- inst:ListenForEvent("closepon", OnClosePon)
end

return MakePlayerCharacter("hatkid", prefabs, assets, common_postinit, master_postinit, start_inv)