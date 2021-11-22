-- Old Simspeed method here, very glitchy https://pastebin.com/ErsU85Pp

local assets=
{ 
    Asset("ANIM", "anim/timestophat.zip"),
    Asset("ANIM", "anim/timestophat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/timestophat.xml"),
    Asset("IMAGE", "images/inventoryimages/timestophat.tex"),
	
	Asset("SOUNDPACKAGE", "sound/timestophat.fev"),
    Asset("SOUND", "sound/timestophat.fsb"),
	
	Asset( "ANIM", "anim/hatkid_timestop.zip" ),
}


local prefabs = 
{
}


-------------------------------------------------------------------------------------------------------
local function SlowNear(inst)
	local owner = inst.components.inventoryitem.owner
	local pt = owner:GetPosition()
	local range = 32  -- range of spell	
	local nags = { "character", "player" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, nil)
	for _,ent in ipairs(targets) do
		-- if ent.components.combat and ent.components.locomotor then
		
			-- ent.OPeriod = ent.components.combat.min_attack_period
			-- ent.components.locomotor:SetExternalSpeedMultiplier(ent, "timeslow_speed_mod", 0.5)
			-- ent.components.combat:SetAttackPeriod(ent.OPeriod * 2)
			ent:AddTag("timeslowed")
			SetLocalTimeScale(nil, ent, TUNING.TIMESTOPHAT_TIMESCALE)
			if ent.slowed ~= nil then
				ent.slowed:Cancel()
			end
			
			-- The task below clears the TIME SLOW
			ent.slowed = ent:DoTaskInTime(.1, function(ent)
				ent:RemoveTag("timeslowed")
				SetLocalTimeScale(nil, ent, 1)
				ent.slowed = nil
			end)
			
		-- end
	end
end

local function SpeedUp(inst)
	local owner = inst.components.inventoryitem.owner
	local pt = owner:GetPosition()
	local nags = { "character" }
	local tags = { "timeslowed" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, 64, nil, nags, tags)
	for _,ent in ipairs(targets) do
		if ent.components.combat and ent.components.locomotor then
			local OPeriod = ent.components.combat.min_attack_period
			
			ent.components.combat:SetAttackPeriod(ent.OPeriod / 2)
			ent.components.locomotor:RemoveExternalSpeedMultiplier(ent, "timeslow_speed_mod")
			
		end
	end
end


local function OnUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() and rechargeable:GetRechargeTime() == TUNING.TIMESTOPHAT_COOLDOWN then -- If charging and the time is the cooldown
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		-- owner:PushEvent("hatcooldown")
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	elseif not inst.components.timer:TimerExists("timehat_duration") then
		--Start duration cooldown
		inst.components.timer:StartTimer("timehat_duration", TUNING.TIMESTOPHAT_DURATION)
		rechargeable:Discharge(TUNING.TIMESTOPHAT_DURATION)
		
		-- Add tag
		-- owner:AddTag("timeimmune")
		
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/activate")
		inst.SoundEmitter:PlaySound("timestophat/sound/loop", "timestoploop")
		
		--Set Skin to TimeStop skin
		SetSkinsOnAnim(owner.AnimState, "hatkid_timestop", "hatkid_timestop", owner.components.skinner:GetClothing(), nil, "hatkid_timestop")
		
		-- SetLocalTimeScale(nil, owner, 2)
		-- owner.OPeriod = owner.components.combat.min_attack_period
		-- ent.components.locomotor:SetExternalSpeedMultiplier(ent, "timeslow_speed_mod", 0.5)
		-- owner.components.combat:SetAttackPeriod(owner.OPeriod / 2)
		-- Slow code
		inst.TimeSlow = inst:DoPeriodicTask(0, SlowNear, nil)
		
	end
end

local function OnStopUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() and rechargeable:GetRechargeTime() == TUNING.TIMESTOPHAT_COOLDOWN then
		-- If in cooldown
		-- Do nothing, no point.
		-- print("WARNING: Time Stop Hat was used while in cooldown!")
		-- If this somehow prints I don't know what to do with my life.
	else
		-- Cancel Time Slow
		if inst.TimeSlow then
			inst.TimeSlow:Cancel()
		end
		-- SetLocalTimeScale(nil, owner, 1)
		-- owner.OPeriod = owner.components.combat.min_attack_period	
		-- owner.components.combat:SetAttackPeriod(owner.OPeriod * 2)
	
		-- Start cooldown timer
		--owner.components.timer:StartTimer("hat_cooldown", (60 * 0.1))
		rechargeable:Discharge(TUNING.TIMESTOPHAT_COOLDOWN)
		
		--Remove tag
		-- owner:RemoveTag("timeimmune")
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/deactivate")
		inst.SoundEmitter:KillSound("timestoploop")
		
		--Revert back to default skin
		SetSkinsOnAnim(owner.AnimState, "hatkid_copy", "hatkid_copy", owner.components.skinner:GetClothing(), nil, "hatkid_copy")
		
		-- Stop the duration timer, if it exists
		if inst.components.timer:TimerExists("timehat_duration") then
			inst.components.timer:StopTimer("timehat_duration")
		end
	end
end

-------------------------------------------------------------------------------------------------------------

local function KeybindUse(inst)
	if not inst.components.timer:TimerExists("timehat_duration") then
		inst.components.useableitem:StartUsingItem()
	else
		inst.components.useableitem:StopUsingItem()
	end
end

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
	owner.AnimState:OverrideSymbol("swap_hat", "timestophat", "swap_hat")
			
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
end
 
local function OnUnequip(inst, owner)
------------------------------------------------------
	if inst.components.timer:TimerExists("timehat_duration") then
		inst.components.useableitem:StopUsingItem()
	end
------------------------------------------------------

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Close()
    -- end
end
 
-- local function OnBadgeLoaded(inst, data)
	-- if data ~= nil and data.item ~= nil then
		-- if data.item.prefab == "hkr_badge_football" then
			-- inst:AddComponent("armor")
			-- inst.components.armor:InitIndestructible(TUNING.ARMORWOOD_ABSORPTION)
			-- badge = data.item
		-- end
	-- end
-- end

-- local function OnBadgeUnloaded(inst)
	-- if inst.components.armor ~= nil then
		-- inst:RemoveComponent("armor")
	-- end
-- end

local function OnCharged(inst)
	local rechargeable = inst.components.rechargeable
	
	-- print(inst.components.rechargeable:GetRechargeTime())
end


local function OnDischarged(inst)
	local rechargeable = inst.components.rechargeable
	
	-- print(rechargeable:GetRechargeTime())
end
 
local function fn(Sim) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")
	
    if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("hkr_badgeslot") end
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("timestophat")
    inst.AnimState:SetBuild("timestophat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)

----------------------------------------------------------------
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)


    inst:AddComponent("timer")

    local function ontimerdone()
		inst.components.useableitem:StopUsingItem()
	end

    inst:ListenForEvent("timerdone", ontimerdone)
----------------------------------------------------------------
 
    inst:AddComponent("inspectable")
	
	-- inst:AddComponent("waterproofer")
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "timestophat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/timestophat.xml"
	
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetOnDischargedFn(OnDischarged)
	inst.components.rechargeable:SetOnChargedFn(OnCharged)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	inst:ListenForEvent("AbilityKey", KeybindUse)
 
    return inst
end

return  Prefab("common/inventory/timestophat", fn, assets, prefabs)