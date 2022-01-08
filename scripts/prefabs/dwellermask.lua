local assets=
{ 
    Asset("ANIM", "anim/dwellermask.zip"),
	Asset("ANIM", "anim/dwellermask_on.zip"),

    Asset("ATLAS", "images/inventoryimages/dwellermask.xml"),
    Asset("IMAGE", "images/inventoryimages/dwellermask.tex"),
	
	Asset("IMAGE", resolvefilepath("images/cc/dwellervision.tex")),
	Asset("IMAGE", resolvefilepath("images/cc/nd.tex")),

	Asset("SOUNDPACKAGE", "sound/dwellermask.fev"),
    Asset("SOUND", "sound/dwellermask.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/dwellermask.xml","dwellermask.tex")

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

local DWELLERVISION_COLOURCUBES_3 =
{
	-- These new cubes are easier on the eyes, previous ones were very harsh green.

--  Playtesters actually missed the harsher green, but I think I'll go more faithful to the original with this one
    day = resolvefilepath("images/cc/nd.tex"),
    dusk = resolvefilepath("images/cc/nd.tex"),
    night = resolvefilepath("images/cc/nd.tex"),
    full_moon = resolvefilepath("images/cc/nd.tex"),
}

-- This was one of the first items I wrote after I took over this mod and looking back it at, IT IS DISGUSTING! IT'S SUCH A RATS NEST THAT I NEVER WANNA TOUCH IT AGAIN
-- inb4 i need to come back to this and edit it in a few months 

local tweentime = 0.1

local function dwellmaskclient(ent)

	-- Change the colour cube on the client to allow seeing in the dark client side.
	ent.components.playervision:ForceNightVision(true)
	ent.components.playervision:SetCustomCCTable(DWELLERVISION_COLOURCUBES_3)

	ent.AnimState:SetHaunted(true)
	-- ent.AnimState:SetMultColour(1, 1, 1, 0.1)
	
	-- Prevent the 5 second linger from taking nightvision away while in the aura
	if ent.NVLinger ~= nil then
		ent.NVLinger:Cancel()
	end
	
	-- The task below clears the nightvision, hopefully set in the config
	ent.NVLinger = ent:DoTaskInTime(5, function(ent)
		ent.components.playervision:ForceNightVision(false)
		ent.components.playervision:SetCustomCCTable(nil)
		ent.AnimState:SetHaunted(false)
		-- ent.AnimState:SetMultColour(1, 1, 1, 1)
		ent.NVLinger = nil
	end)
end

AddClientModRPCHandler("HatKidRPC", "dwellmaskclient", dwellmaskclient)

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

local function OnTweenDone(inst)
	
end

local function DwellerAbility(inst)
	if inst.components.timer:TimerExists("dwellmask_duration") then
		-- About 5 times a second, DwellerAbility gets ran, if the dwellmask timer exists, then it continues the function.
		local owner = inst.components.inventoryitem.owner
		--Enable dweller light
		--Edit character light settings temporarily, we redo it each cast to keep it consistant on a log in. There's a better way to do this, but this is easier.
		-- owner.Light:SetFalloff(1)
		-- owner.Light:SetIntensity(0.99)
		-- owner.Light:SetRadius(7/8 * TUNING.DWELLERMASK_RADIUS)
		-- owner.Light:SetColour(8/255, 248/255, 12/255)
		inst.Light:Enable(true)
		
		inst.net_light_roll:set(true)
		owner.AnimState:OverrideSymbol("swap_hat", "dwellermask_on", "swap_hat")

		inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime, OnTweenDone)

		local pt = owner:GetPosition()
		-- local range = TUNING.DWELLERMASK_RADIUS  -- range of spell	
		local range = inst.Light:GetCalculatedRadius() -- Use the radius of the light instead of setting one ourselves, that way it's visually consistent.
		--Light seems to use it's own radius system that's close but not quite in game units.
		local tags = { "player" }
		local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nil, tags)
		for _,ent in ipairs(targets) do
			if ent.components.playervision ~= nil then
			
				--Loop Code for Players
				SendModRPCToClient(GetClientModRPC("HatKidRPC", "dwellmaskclient"), nil, ent)
				
				-- Change the colour cube on the server to prevent charlie attacks and stuff
				ent.components.playervision:ForceNightVision(true)
				ent.AnimState:SetHaunted(true)
				-- ent.AnimState:SetMultColour(1, 1, 1, 0.1)
				
				-- Prevent the 5 second linger from taking nightvision away while in the aura
				if ent.NVLinger ~= nil then
					ent.NVLinger:Cancel()
				end
				
				-- The task below clears the nightvision after 5 secs
				ent.NVLinger = ent:DoTaskInTime(TUNING.DWELLERMASK_LINGER, function(ent)
					ent.components.playervision:ForceNightVision(false)
					ent.NVLinger = nil
					ent.AnimState:SetHaunted(false)
					-- ent.AnimState:SetMultColour(1, 1, 1, 1)
					
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

		if inst.components.fueled then
			inst.components.fueled:StartConsuming()
		end

		--inst:PushEvent("down") -- WHY DID I DO THIS BEFORE? WHAT WAS I THINKING THIS IS LITERALLY JUST A WORSE WAY TO CALL A FUNCTION
		
		DwellerAbility(inst)

		-- owner.Physics:ClearCollisionMask()
		-- owner.Physics:CollidesWith(COLLISION.GROUND)
		-- owner.Physics:CollidesWith(COLLISION.OBSTACLES)
		-- owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
		-- owner.Physics:CollidesWith(COLLISION.CHARACTERS)
		-- owner.Physics:CollidesWith(COLLISION.GIANTS)

		inst.components.equippable.dapperness = -TUNING.DAPPERNESS_MED

		-----

		-- owner.Physics:Teleport(0,0,0)
		-- if owner.components.complexprojectile == nil then
		-- 	owner:AddComponent("complexprojectile")
		-- end
		-- owner.components.complexprojectile:SetHorizontalSpeed(owner.s or 10)
		-- owner.components.complexprojectile:Launch(Vector3(500,0,0), owner)
		-- owner.components.complexprojectile:SetOnHit(function(owner)
		-- 	TheNet:Announce(tostring(math.sqrt(owner:GetDistanceSqToPoint(0,0,0))))
		-- end)
		-----


		
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
		-- owner.Light:SetIntensity(.8)
        -- owner.Light:SetRadius(.5)
        -- owner.Light:SetFalloff(.65)
        -- owner.Light:SetColour(255 / 255, 255 / 255, 236 / 255)
        -- inst.Light:Enable(false)

		inst.net_light_roll:set(false)
		owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")

		inst.components.lighttweener:StartTween(inst.Light, 0, nil, nil, nil, tweentime)

		inst.components.equippable.dapperness = 0
		
		inst:RemoveTag("disabledwell")

		-- owner.Physics:ClearCollisionMask()
		-- owner.Physics:CollidesWith(COLLISION.WORLD)
		-- owner.Physics:CollidesWith(COLLISION.OBSTACLES)
		-- owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
		-- owner.Physics:CollidesWith(COLLISION.CHARACTERS)
		-- owner.Physics:CollidesWith(COLLISION.GIANTS) 
		
		-- owner.components.timer:StartTimer("hat_cooldown", 6)
		
		-- inst.components.fueled:DoDelta(-1, owner) -- Use once

		rechargeable:Discharge(TUNING.DWELLERMASK_COOLDOWN) -- Cooldown

		if inst.components.fueled then
			inst.components.fueled:StopConsuming()
		end

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
end

local function OnLightDirty(inst)
	inst.light_roll = inst.net_light_roll:value()
	
	if inst.light_roll == false then

		--off
		inst.AnimState:SetBank("dwellermask")
		inst.AnimState:SetBuild("dwellermask")
		inst.AnimState:PlayAnimation("idle")

		inst.components.lighttweener:StartTween(inst.Light, 0, nil, nil, nil, tweentime)
		
	else

		--on
		inst.AnimState:SetBank("dwellermask_on")
		inst.AnimState:SetBuild("dwellermask_on")
		inst.AnimState:PlayAnimation("idle")
		
		inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime, OnTweenDone)

	end
end

local function OnEmpty(inst)
	inst:AddTag("disabledwell")
	inst.components.useableitem:StopUsingItem() -- And we'll make sure to stop the dweller effect

	inst:DoTaskInTime(0.5, inst.Remove)
end

local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()
	
	
    MakeInventoryPhysics(inst)

	inst.Light:SetFalloff(1)
	inst.Light:SetIntensity(0.99)
	-- inst.Light:SetRadius(7/8 * TUNING.DWELLERMASK_RADIUS)
	inst.Light:SetRadius(0)
	inst.Light:SetColour(0/255, 255/255, 175/255)
	inst.Light:Enable(true)

	inst.Light:EnableClientModulation(true)

	inst.light_roll = 0
	inst.net_light_roll = net_bool(inst.GUID, "light_roll", "light_rolldirty" )


    inst:AddTag("hat")
	inst:AddTag("hatkidhat")

	inst:AddComponent("lighttweener")
	
    if not TheWorld.ismastersim then
		inst:ListenForEvent("light_rolldirty", OnLightDirty)
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
		inst:AddTag("disabledwell") -- This sucks but I wrote this code like 8 months ago and don't wanna fix it. By that I mean the related code to this, not just this.
		inst.components.useableitem:StopUsingItem()
	end

    inst:ListenForEvent("timerdone", ontimerdone)
 
	-- inst:AddComponent("waterproofer")
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inspectable")
	

	
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "dwellermask"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/dwellermask.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")

	if TUNING.DWELLERMASK_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.MAGIC
		inst.components.fueled:InitializeFuelLevel( TUNING.DWELLERMASK_DURABILITY ) -- add tuning 600
		-- inst.components.fueled:InitializeFuelLevel( 3 ) -- add tuning 600
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end

    

	

	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)
	inst:ListenForEvent("AbilityKey", KeybindUse)
	
	inst:DoPeriodicTask(0, DwellerAbility, nil, inst)
	
    return inst
end

return  Prefab("dwellermask", fn, assets, prefabs)