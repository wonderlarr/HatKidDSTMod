local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset("ANIM", "anim/ui_chest_3x3.zip"),
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

local function LoadPonInv(inst)
	if inst.lab then
		inst.lab.components.container:Open(inst)
	end
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
		inst.components.sanity.dapperness = (-TUNING.DAPPERNESS_LARGE)
    end
end

-- When loading the character
local function onload(inst)
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

	inst:DoTaskInTime(0, function(inst)
		inst.skin = inst.AnimState:GetBuild()
		if inst.lab then
			inst.lab.components.container:Open(inst)
		end
	end)
	
end

-- When spawning the character
local function onnewspawn(inst)
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

	inst:DoTaskInTime(0, function(inst)
		inst.skin = inst.AnimState:GetBuild()
	end)

	
	SpawnWithStuff(inst)
	LoadPonInv(inst)
end

local function ApplyPons(inst, data)
	if data.target:IsValid() and not data.target:IsInLimbo() and not data.target:HasTag("pons")  then
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

widgetsetup =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(widgetsetup.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

local function OnPonsDirty(inst)
	inst.pons = inst.net_pons:value()
	inst:PushEvent("UpdatePons")
end

local function OnGetPon(inst, data)
	local num = data.count or 1

	inst.pons = inst.pons + num

	inst.net_pons:set(inst.pons)
end

local function OnSave(inst, data)
	data.pons = inst.pons or 0
end

local function OnLoad(inst, data)
	if data.pons ~= nil then
		inst.pons = data.pons
		inst.net_pons:set(data.pons)
	end

	LoadPonInv(inst)


	inst:ListenForEvent("equip", OnEquip)
    inst:ListenForEvent("unequip", OnUnequip)



	
	
	
    -- if inst:HasTag("playerghost") then
    --     onbecameghost(inst)
    -- else
    --     onbecamehuman(inst)
    -- end

	inst:DoTaskInTime(0, function(inst)
		inst.skin = inst.AnimState:GetBuild()
	end)

end

local function OnClosePon(inst)
	inst.tryopen = inst:DoPeriodicTask(0.5, function(inst)
		if inst.components.inventory.isvisible == true then
			LoadPonInv(inst)
			
			inst.tryopen:Cancel()
			inst.tryopen = nil
		end
	end)
end

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
	
	if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("treasurechest", widgetsetup) end
	end

	-- inst.Physics:CollidesWith(2017)

	inst.pons = 0
	inst.net_pons = net_ushortint(inst.GUID, "pons", "pons_dirty" )

	if not TheWorld.ismastersim then
		inst:ListenForEvent("pons_dirty", OnPonsDirty)
	end
end

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

    inst.OnNewSpawn = onnewspawn
	
	inst.components.sanity.dapperness = 0
	
	-- Hat Kid likes cookies, unfortunately there's only pumpkin cookies. We'll make do.
    inst.components.foodaffinity:AddPrefabAffinity  ("pumpkincookie", 1.4)
	
	-- inst:DoPeriodicTask(0.1, OnHatCooldownServer, nil)

	-- inst.components.combat:SetOnHit(ApplyPons)

	inst:ListenForEvent("onattackother", ApplyPons)
	inst:ListenForEvent("working", ApplyPons)

	-- inst:AddComponent("container")
	-- inst.components.container:WidgetSetup("treasurechest", widgetsetup)
	-- inst.components.container.skipclosesnd = true
    -- inst.components.container.skipopensnd = true

	inst:ListenForEvent("GetPon", OnGetPon)
	inst:ListenForEvent("closepon", OnClosePon)


	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	inst.lab = SpawnPrefab("inv_pons")
	inst.lab.entity:SetParent(inst.entity)

	-- inst:AddComponent("ponholder")

	-- inst.pon_inv = SpawnPrefab("hatpack")
	-- local hatpack = inst.pon_inv
	-- inst.components.container.canbeopened = false
end

return MakePlayerCharacter("hatkid", prefabs, assets, common_postinit, master_postinit, start_inv)