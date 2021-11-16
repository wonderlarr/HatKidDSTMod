local assets=
{ 
    Asset("ANIM", "anim/dwellermask.zip"),
    Asset("ANIM", "anim/dwellermask_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/dwellermask.xml"),
    Asset("IMAGE", "images/inventoryimages/dwellermask.tex"),
	
	Asset("IMAGE", resolvefilepath("images/cc/dwellervision.tex")),
	Asset("IMAGE", "images/inventoryimages/dwellermask.tex"),
}

local prefabs = 
{
}

local DWELLERVISION_COLOURCUBES_2 =
{
	-- this took SO LONG to get working, wasn't sure how resolvefilepath worked.
    day = resolvefilepath("images/cc/dwellervision.tex"),
    dusk = resolvefilepath("images/cc/dwellervision.tex"),
    night = resolvefilepath("images/cc/dwellervision.tex"),
    full_moon = resolvefilepath("images/cc/dwellervision.tex"),
}

local function aura()
	return 1
end

local function dwellmaskclient(ent)

	-- Change the colour cube on the client to allow seeing in the dark client side.
	ent.components.playervision:ForceNightVision(true)
	ent.components.playervision:SetCustomCCTable(DWELLERVISION_COLOURCUBES_2)
	
	-- Prevent the 5 second linger from taking nightvision away while in the aura
	if ent.NVLinger ~= nil then
		ent.NVLinger:Cancel()
	end
	
	-- The task below clears the nightvision, hopefully set in the config
	ent.NVLinger = ent:DoTaskInTime(5, function(ent)
		ent.components.playervision:ForceNightVision(false)
		ent.components.playervision:SetCustomCCTable(nil)
		ent.NVLinger = nil
	end)
end

AddClientModRPCHandler("HatKidRPC", "dwellmaskclient", dwellmaskclient)

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

local function DwellerAbility(inst)
	if inst.components.timer:TimerExists("dwellmask_duration") then
		-- About 5 times a second, DwellerAbility gets ran, if the dwellmask timer exists, then it continues the function.
		local owner = inst.components.inventoryitem.owner
		--Enable dweller light
		--Edit character light settings temporarily, we redo it each cast to keep it consistant on a log in. There's a better way to do this, but this is easier.
		owner.Light:SetFalloff(1)
		owner.Light:SetIntensity(0.99)
		owner.Light:SetRadius(7/8 * TUNING.DWELLERMASK_RADIUS)
		owner.Light:SetColour(8/255, 248/255, 12/255)
		owner.Light:Enable(true)

		local pt = owner:GetPosition()
		local range = TUNING.DWELLERMASK_RADIUS  -- range of spell	
		local tags = { "player" }
		local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nil, tags)
		for _,ent in ipairs(targets) do
			if ent.components.playervision ~= nil then
			
				--Loop Code for Players
				SendModRPCToClient(GetClientModRPC("HatKidRPC", "dwellmaskclient"), nil, ent)
				
				-- Change the colour cube on the server to prevent charlie attacks and stuff
				ent.components.playervision:ForceNightVision(true)
				
				-- Prevent the 5 second linger from taking nightvision away while in the aura
				if ent.NVLinger ~= nil then
					ent.NVLinger:Cancel()
				end
				
				-- The task below clears the nightvision, hopefully set in the config
				ent.NVLinger = ent:DoTaskInTime(TUNING.DWELLERMASK_LINGER, function(ent)
					ent.components.playervision:ForceNightVision(false)
					ent.NVLinger = nil
				end)
			end
		end
	end
end


local function OnUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() and rechargeable:GetRechargeTime() == TUNING.DWELLERMASK_COOLDOWN then
	
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		--owner:PushEvent("hatcooldown")
		
		--Cooldown line
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
		-- print(owner.components.timer:GetTimeLeft("hat_cooldown"))
	elseif rechargeable:IsCharged() and not inst.components.timer:TimerExists("dwellmask_duration") then
		-- If not in cooldown
		
		--Deal with timings
		inst.components.timer:StartTimer("dwellmask_duration", TUNING.DWELLERMASK_DURATION) -- Internal timer, used for the actual ability.
		inst.components.rechargeable:Discharge(TUNING.DWELLERMASK_DURATION) -- Visual Timer
		
		--inst:PushEvent("down") -- WHY DID I DO THIS BEFORE? WHAT WAS I THINKING THIS IS LITERALLY JUST A WORSE WAY TO CALL A FUNCTION
		
		DwellerAbility(inst)

		inst.components.equippable.dapperness = -TUNING.DAPPERNESS_LARGE
		
		--Then play sounds
		inst.SoundEmitter:PlaySound("dwellermask/sound/activate")
		inst.SoundEmitter:PlaySound("dwellermask/sound/loop", "dwellermaskloop") --This is the same sound as the Time Stop hat loop, but I wanted it label it differently.
	end
end

local function OnStopUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() and rechargeable:GetRechargeTime() == TUNING.DWELLERMASK_COOLDOWN then
		-- If in cooldown

	elseif inst:HasTag("disabledwell") then
		-- If not in cooldown, or doing nothing, put it on cooldown!

		--Reset light values to lightning strike values, which are normally the defaults.
		owner.Light:SetIntensity(.8)
        owner.Light:SetRadius(.5)
        owner.Light:SetFalloff(.65)
        owner.Light:SetColour(255 / 255, 255 / 255, 236 / 255)
        owner.Light:Enable(false)

		inst.components.equippable.dapperness = 0
		
		inst:RemoveTag("disabledwell")
		
		-- owner.components.timer:StartTimer("hat_cooldown", 6)
		
		rechargeable:Discharge(TUNING.DWELLERMASK_COOLDOWN) -- Cooldown

		inst.SoundEmitter:PlaySound("dwellermask/sound/deactivate")
		inst.SoundEmitter:KillSound("dwellermaskloop")
		
		if inst.components.timer:TimerExists("dwellmask_duration") then
			inst.components.timer:StopTimer("dwellmask_duration")
		end
	end
end

-------------------------------------------------------------------------------------------------------------

local function KeybindUse(inst)
	if not inst.components.timer:TimerExists("dwellmask_duration") then
		inst.components.useableitem:StartUsingItem()
	else
		inst:AddTag("disabledwell")
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
	
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")
	
	--Legacy code, nolonger needed.
	
	-- if owner.components.sanity ~= nil then
		-- owner.components.sanity:SetInducedInsanity(inst, true)
	-- end
	
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

	if inst.components.timer:TimerExists("dwellmask_duration") then
		inst:AddTag("disabledwell")
		inst.components.useableitem:StopUsingItem()
	end

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	-- if owner.components.sanity ~= nil then
		-- owner.components.sanity:SetInducedInsanity(inst, false)
	-- end
	
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

local function fn(Sim) 
    local inst = CreateEntity()

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
	
    inst.AnimState:SetBank("dwellermask")
    inst.AnimState:SetBuild("dwellermask")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)


    inst:AddComponent("timer")

    local function ontimerdone(inst)
		inst:AddTag("disabledwell")
		inst.components.useableitem:StopUsingItem()
	end

    inst:ListenForEvent("timerdone", ontimerdone)
 
	-- inst:AddComponent("waterproofer")
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "dwellermask"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dwellermask.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")
	-- inst.components.rechargeable:SetOnDischargedFn(OnDischarged)
	-- inst.components.rechargeable:SetOnChargedFn(OnCharged)

	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)
	inst:ListenForEvent("AbilityKey", KeybindUse)
	
	inst:DoPeriodicTask(0.2, DwellerAbility, nil, inst)
	
    return inst
end

return  Prefab("dwellermask", fn, assets, prefabs)