local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
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

-- When the character is revived
-- local function onbecamehuman(inst)
-- 	if TUNING.HATKIDSPEED ~= "1" then
-- 		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)
-- 	end
-- end

-- local function onbecameghost(inst)
-- 	if TUNING.HATKIDSPEED ~= "1" then
-- 		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hatkid_speed_config", TUNING.HATKIDSPEED)
-- 	end
-- end

local function OnEquip(inst)
	--Remove hat sanity drain upon wearing something in the head slot
	local head = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
	
	if head ~= nil then
		inst.components.sanity.dapperness = 0
	end
end

local function OnUnequip(inst, data)
	-- Detect if the slot is empty, apply a big sanity drain
    if data.eslot == EQUIPSLOTS.HEAD then
		inst.components.sanity.dapperness = (-TUNING.DAPPERNESS_MED)
    end
end

-- When loading the character
local function onload(inst)
	-- inst:ListenForEvent("hatcooldown", oncooldown)
    -- inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    -- inst:ListenForEvent("ms_becameghost", onbecameghost)
	
-- Listens for taking off hat, sanity drains without hat
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)
	
	
    -- if inst:HasTag("playerghost") then
    --     onbecameghost(inst)
    -- else
    --     onbecamehuman(inst)
    -- end
end

-- When spawning the character
local function onnewspawn(inst)
	-- inst:ListenForEvent("hatcooldown", oncooldown)
    -- inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    -- inst:ListenForEvent("ms_becameghost", onbecameghost)
-- Listens for taking off hat, sanity drains without hat
	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)
    -- if inst:HasTag("playerghost") then
    --     onbecameghost(inst)
    -- else
    --     onbecamehuman(inst)
    -- end
	SpawnWithStuff(inst)
end

-- Server and client
-- Thanks Kzisor/Ysovuka for the Key Handling code.
-- Key Handling guide https://forums.kleientertainment.com/forums/topic/63754-tutorial-character-transformation/
local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "hatkid.tex" )
	inst:AddTag("hatkidcrafter")
	inst:AddTag("hatkid")
	
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("HatKidRPC", TUNING["HATKID"].KEY, "AbilityKeyDown", "KEYDOWN")
	
	--Default light for Dweller Mask, will probably change in the future and add them to the Hat prefabs instead, but for now this works.
    inst.entity:AddLight()
	
	
	-- Time to learn net variables
	
	--Delcaration
	-- inst.hatcooldown = 0
	-- inst.net_hatcooldown = net_ushortint(inst.GUID, "hatcooldown", "hatcooldowndirty" )
	
	--Client Only

	-- if not TheWorld.ismastersim then
	-- 	inst:ListenForEvent("hatcooldowndirty", OnHatCooldownDirty)
	-- end
	
end

-- local function OnStep(inst)
	-- if TheWorld.ismastersim then
		-- print("test1")
		-- print(inst)
	-- else
		-- print("test2")
		-- print(inst)
	-- end
-- end

-- local function OnTimerDone(inst, data)
-- 	local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
-- 	hat:PushEvent("cooldown_over")
-- end
-- local function OnHealthDelta(inst, data)
	-- if data.oldpercent > data.newpercent then
		
	-- end
-- end


-- REMEMBER TO CHANGE THIS IF YOU BOOST CHARACTER SIZE AGAIN!
CHARACTER_BUTTON_SCALE.hatkid = (1 / TUNING.HATKIDSIZE * 0.23)

-- Server only, add comonents here.
local master_postinit = function(inst, data)
	--Custom sound idea, recorder? It (sortof) makes sense. It's better than using Willow assets regardless.
	-- SciFi synth might also be good.
	-- Possibly a filtered version of willow
	inst.soundsname = "willow"
	
	inst.entity:AddPhysics()
	
	inst.components.health:SetMaxHealth(TUNING.HATKID_HEALTH)
	inst.components.hunger:SetMax(TUNING.HATKID_HUNGER)
	inst.components.sanity:SetMax(TUNING.HATKID_SANITY)
	
    inst.components.combat.damagemultiplier = TUNING.HATKIDDAMAGE
	-- inst.components.combat:SetAttackPeriod(10)
	
	inst.components.hunger.hungerrate = TUNING.HATKIDRATE * TUNING.WILSON_HUNGER_RATE
	
	-- Sanity drain
	inst.components.sanity.night_drain_mult = TUNING.HATKIDNIGHTDRAIN
	inst.components.sanity.neg_aura_mult = TUNING.HATKIDSANITYDRAIN
	
	--Size reduction
	-- inst.Transform:SetScale(TUNING.HATKIDSIZE, TUNING.HATKIDSIZE, TUNING.HATKIDSIZE) OLD DO NOT USE
	
	-- This is a better way to set character scale, it doesn't change your walk speed, so no need to set an external speed modifier.
	inst.AnimState:SetScale(TUNING.HATKIDSIZE, TUNING.HATKIDSIZE) 
	
	--Sanity Aura

	
	-- inst:ListenForEvent("timerdone", OnTimerDone)
	-- inst:ListenForEvent("healthdelta", OnHealthDelta)
	
	-- inst:AddComponent("timer")
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onnewspawn
	
	inst.components.sanity.dapperness = 0
	
	-- Hat Kid likes cookies, unfortunately there's only 1 cookie in the game
    inst.components.foodaffinity:AddPrefabAffinity  ("pumpkincookie", 1.4)
	
	-- inst:DoPeriodicTask(0.1, OnHatCooldownServer, nil)
end

return MakePlayerCharacter("hatkid", prefabs, assets, common_postinit, master_postinit, start_inv)


