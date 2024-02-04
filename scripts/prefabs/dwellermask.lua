-- Oh man this sure is a rat nest of code. 

local assets=
{ 
    Asset("ANIM", "anim/dwellermask.zip"),
	Asset("ANIM", "anim/dwellermask_on.zip"),

    Asset("ATLAS", "images/inventoryimages/dwellermask.xml"),
    Asset("IMAGE", "images/inventoryimages/dwellermask.tex"),
	
	Asset("IMAGE", resolvefilepath("images/cc/nd.tex")),
	Asset("IMAGE", resolvefilepath("images/cc/dwellervision.tex")),

	Asset("SOUNDPACKAGE", "sound/dwellermask.fev"),
    Asset("SOUND", "sound/dwellermask.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/dwellermask.xml","dwellermask.tex")

local prefabs = 
{

}

local DWELLERVISION_COLOURCUBES_2 =
{
    day = resolvefilepath("images/cc/dwellervision.tex"),
    dusk = resolvefilepath("images/cc/dwellervision.tex"),
    night = resolvefilepath("images/cc/dwellervision.tex"),
    full_moon = resolvefilepath("images/cc/dwellervision.tex"),
}

local DWELLERVISION_COLOURCUBES_3 =
{
	-- These new cubes are easier on the eyes, previous ones were very harsh green.
	-- Playtesters actually missed the harsher green, but I think I'll go more faithful to the original with this one
    day = resolvefilepath("images/cc/nd.tex"),
    dusk = resolvefilepath("images/cc/nd.tex"),
    night = resolvefilepath("images/cc/nd.tex"),
    full_moon = resolvefilepath("images/cc/nd.tex"),
}

local tweentime = 0.1

local function DwellmaskClient(ent, val)
	local enable = val or false -- For some reason sometimes the rpc gets pushed without the bool

	ent.components.playervision:ForceNightVision(enable)
	ent.AnimState:SetHaunted(enable) -- Don't know why I need to do this here, SetHaunted just refuses to work from the server for whatever reason

	if enable and TUNING.DWELLERMASK_VFX then
		ent.components.playervision:SetCustomCCTable(DWELLERVISION_COLOURCUBES_3)
	else
		ent.components.playervision:SetCustomCCTable(nil)
	end
end

AddClientModRPCHandler("HatKidRPC", "dwellmaskclient", DwellmaskClient)

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	-- TODO is this supposed to be here???
	inst.AnimState:SetHaunted(true)
end
 
local function OnUnequip(inst, owner)
	if inst:HasTag("dwelleractive") then
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

local function OnLoop(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if owner.components.sanity.current == 0 then
		inst.components.hatmagic:Deactivate()
	end

	local function OnHealthDelta(ent, data)
		if ent.components.health == nil then return end

		local delta = data.amount
		local current = ent.components.health.currenthealth
		local max = ent.components.health.maxhealth
		-- local penalty = ent.components.health:GetPenaltyPercent()

		if delta < 0 and current <= 1 and current ~= 0 then -- if we're blocking damage
			-- Owner

			-- Hat
			if inst.components.fueled then
				inst.components.fueled:DoDelta(-TUNING.DWELLERMASK_BLOCK_FUEL) 
			end

			-- Entity
			ent.components.health:DeltaPenalty(-delta / max * TUNING.DWELLERMASK_BLOCK_AMOUNT) -- Mitigate damage once we've reached 1 hp
			ent.components.sanity:DoDelta(-TUNING.DWELLERMASK_BLOCK_SANITY)

			if ent.components.health:GetPenaltyPercent() == TUNING.MAXIMUM_HEALTH_PENALTY then
				ent.components.health:SetMinHealth(0)
			end
		end
	end

	local pt = owner:GetPosition()
	local range = inst.Light:GetCalculatedRadius() 
	-- Use the radius of the light instead of setting one ourselves, that way it's visually consistent.
	local tags = { "player" }
	local nags = nil
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, nil)
	for _,ent in ipairs(targets) do
		if ent.components.playervision then
		
			if not ent:HasTag("dwelling") then
				-- Server side init
				ent.components.playervision:ForceNightVision(true)
				ent.AnimState:SetHaunted(true)

				-- Prevent death if we have any max health buffer left
				if ent.components.health and ent.components.health:GetPenaltyPercent() ~= TUNING.MAXIMUM_HEALTH_PENALTY then
					ent.components.health:SetMinHealth(1)
				end

				ent:ListenForEvent("healthdelta", OnHealthDelta)

				-- Client side init
				SendModRPCToClient(GetClientModRPC("HatKidRPC", "dwellmaskclient"), nil, ent, true)

				-- Declare effect as initialized
				ent:AddTag("dwelling")
			end
			
			-- Prevent the linger from taking nightvision away while in the aura
			if ent.NVLinger ~= nil then
				ent.NVLinger:Cancel()
			end
			
			-- The task below clears the nightvision after a time
			ent.NVLinger = ent:DoTaskInTime(TUNING.DWELLERMASK_LINGER, function(ent)
				-- Only executed at effect end
				SendModRPCToClient(GetClientModRPC("HatKidRPC", "dwellmaskclient"), nil, ent, false)
				ent.components.playervision:ForceNightVision(false)
				ent.AnimState:SetHaunted(false)

				if ent.components.health then
					ent.components.health:SetMinHealth(0)
				end

				ent:RemoveEventCallback("healthdelta", OnHealthDelta)

				ent:RemoveTag("dwelling")

				ent.NVLinger = nil	
			end)
		end
	end
end

local function OnActivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- Costs
	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end

	if owner.components.sanity then
		owner.components.sanity:DoDelta(-TUNING.DWELLERMASK_THRESHHOLD)
	end

	-- Equippable dapperness
	inst.components.equippable.dapperness = TUNING.DWELLERMASK_DAPPERNESS / 60 -- Config sanity is per minute, dapperness is by second.

	-- Light
	inst.Light:Enable(true)
	inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime)
	inst.net_light_roll:set(true)

	-- Texture
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask_on", "swap_hat")

	-- Sound
	if TUNING.DWELLERMASK_SFX then
		inst.SoundEmitter:PlaySound("dwellermask/sound/activate")
		inst.SoundEmitter:PlaySound("dwellermask/sound/loop", "dwellermaskloop")
	end
end

local function OnDeactivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- -- Ending effects (revive players) REMOVED IN OVERHAUL
	-- local pt = owner:GetPosition()
	-- local range = inst.Light:GetCalculatedRadius() 
	-- local tags = { "playerghost" }
	-- local nags = { "reviving" }
	-- local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, tags)
	-- for _,ent in ipairs(targets) do
	-- 	if (inst.components.fueled and inst.components.fueled.currentfuel >= TUNING.DWELLERMASK_REVIVE_FUEL) or not inst.components.fueled then -- If we have enough fuel to revive
	-- 		ent:PushEvent("respawnfromghost", { source = inst, user = owner })
	-- 		-- In order to apply stats differently than default, we have to do it AFTER the player respawns, and not during
	-- 		-- This is a sorta gross way to do this imo but I don't feel like hooking into a function that would do this correctly at the moment.
	-- 		local function PostPenalty(ent)
	-- 			-- Should only be called if penalty is enabled
	-- 			ent.components.sanity:SetPercent(0.3) -- Sanity 30% on respawn (norm 50%)
	-- 			ent:RemoveEventCallback("ms_respawnedfromghost", PostPenalty)
	-- 		end
			
	-- 		if TUNING.DWELLERMASK_REVIVE_PENALTIES then
	-- 			-- Apply dweller revive penalties
	-- 			ent.components.health:DeltaPenalty(TUNING.REVIVE_HEALTH_PENALTY) -- Max health -25%
	-- 			ent:ListenForEvent("ms_respawnedfromghost", PostPenalty)
	-- 		end

	-- 		-- Grant owner sanity
	-- 		owner.components.sanity:DoDelta(TUNING.DWELLERMASK_REVIVE_REWARD)

	-- 		-- Finally, decrement the fuel
	-- 		if inst.components.fueled then
	-- 			inst.components.fueled:DoDelta(-TUNING.DWELLERMASK_REVIVE_FUEL)
	-- 		end
	-- 	end
	-- end

	-- Stop consuming
	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end

	-- Equippable dapperness
	inst.components.equippable.dapperness = 0

	-- Light
	inst.components.lighttweener:StartTween(inst.Light, 0, nil, nil, nil, tweentime)
	inst.net_light_roll:set(false)
	
	-- Texture
	owner.AnimState:OverrideSymbol("swap_hat", "dwellermask", "swap_hat")

	-- Sound
	if TUNING.DWELLERMASK_SFX then
		inst.SoundEmitter:PlaySound("dwellermask/sound/deactivate")
		inst.SoundEmitter:KillSound("dwellermaskloop")
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
		
		inst.components.lighttweener:StartTween(inst.Light, TUNING.DWELLERMASK_RADIUS, nil, nil, nil, tweentime)
	end
end

local function TestFn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if inst.components.fueled then
		if owner.components.sanity.current >= TUNING.DWELLERMASK_THRESHHOLD -- if we have enough sanity 
		and inst.components.fueled:GetPercent() > 0 then -- and we have any fuel
			return true
		else
			return false
		end
	else
		if owner.components.sanity.current >= TUNING.DWELLERMASK_THRESHHOLD then
			return true
		else
			return false
		end
	end
end

local function OnEmpty(inst)
	inst.components.hatmagic:Deactivate()
end

local function ontakefuel(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/nightmareAddFuel")
end

local function KeybindUse(inst)
	inst.components.hatmagic:Use()
end

local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()
	
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.

	inst.Light:SetFalloff(1)
	inst.Light:SetIntensity(0.99999)
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
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	 
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("hatmagic")
	inst.components.hatmagic.instant = false
	inst.components.hatmagic.cooldowntime = TUNING.DWELLERMASK_COOLDOWN
	inst.components.hatmagic.activetime = 0 -- infinite, technically
	inst.components.hatmagic:SetActivateFn(OnActivate)
	inst.components.hatmagic:SetDeactivateFn(OnDeactivate)
	inst.components.hatmagic:SetLoopFn(OnLoop)
	inst.components.hatmagic:SetTestFn(TestFn)

	if TUNING.DWELLERMASK_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
		inst.components.fueled:SetTakeFuelFn(ontakefuel)
		inst.components.fueled:InitializeFuelLevel( TUNING.DWELLERMASK_DURABILITY )
		inst.components.fueled:SetDepletedFn(OnEmpty)
		-- inst.components.fueled.rate_modifiers:SetModifier(inst, 2, "base") -- Hard coding this value, configing shouldn't be needed
		inst.components.fueled.bonusmult = TUNING.DWELLERMASK_VALUE / 180
		inst.components.fueled.accepting = true
	end

	if TUNING.DWELLERMASK_INSULATION then
		inst:AddComponent("insulator")
		inst.components.insulator:SetWinter()
		inst.components.insulator:SetInsulation(TUNING.DWELLERMASK_INSULATION)
	end

	if TUNING.DWELLERMASK_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.DWELLERMASK_WATERPROOFNESS)
	end

	inst:ListenForEvent("AbilityKey", KeybindUse)
	
    return inst
end

return  Prefab("dwellermask", fn, assets, prefabs)