-- Old Simspeed method here, very glitchy https://pastebin.com/ErsU85Pp

local assets=
{ 
    Asset("ANIM", "anim/timestophat.zip"),

    Asset("ATLAS", "images/inventoryimages/timestophat.xml"),
    Asset("IMAGE", "images/inventoryimages/timestophat.tex"),
	
	Asset("SOUNDPACKAGE", "sound/timestophat.fev"),
    Asset("SOUND", "sound/timestophat.fsb"),
	
	Asset( "ANIM", "anim/hatkid_timestop.zip" ),
}

RegisterInventoryItemAtlas("images/inventoryimages/timestophat.xml","timestophat.tex")

local prefabs = 
{
}

local SHIELD_DURATION = 10 * FRAMES

local RESISTANCES =
{
    "_combat",
    "explosive",
    "quakedebris",
    "caveindebris",
    "trapdamage",
}

-------------------------------------------------------------------------------------------------------
local function SlowNear(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	local pt = owner:GetPosition()
	local range = 32  -- range of ability
	local tags = { "timebound" }
	local nags = { "player", "INLIMBO", "playerghost" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, tags, nags, nil)
	for _,ent in ipairs(targets) do
		if ent.components.timebound:GetModifierFromSource(inst) == 1 then
			ent.components.timebound:SetModifier(inst, TUNING.TIMESTOPHAT_TIMESCALE, nil)

			table.insert(inst.slowedThings, ent)
		end
	end
end

local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	-- Can we activate?
	if not inst.components.rechargeable:IsCharged() and inst.components.rechargeable:GetRechargeTime() == TUNING.TIMESTOPHAT_COOLDOWN then -- If charging and the time is the cooldown
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)

		owner.components.talker:Say(GetString(owner, "ACTIONFAIL_GENERIC"))
	else
		-- Duration timer
		inst.components.rechargeable:Discharge(TUNING.TIMESTOPHAT_DURATION)

		-- Fuel
		if inst.components.fueled then
			inst.components.fueled:StartConsuming()
		end
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/activate")
		inst.SoundEmitter:PlaySound("timestophat/sound/loop", "timestoploop")

		-- Skin, move to hatkid prefab based on event listeners, so the hat is able to be used by other characters
		owner.oldskin = owner.AnimState:GetBuild()
		SetSkinsOnAnim(owner.AnimState, "hatkid_timestop", "hatkid_timestop", owner.components.skinner:GetClothing(), nil, "hatkid_timestop")

		-- Slowed entities table
		inst.slowedThings = {}

		-- Slow time
		SlowNear(inst)
		-- Not very efficient, but there's little choice, unless I do some weirdness with AddPrefabPostInitAny, which I'd rather not do.
		inst.TimeSlow = inst:DoPeriodicTask(0, SlowNear)

		-- owner:AddTag("timestopuser")
	end
end

local function OnStopUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- if owner:HasTag("timestopuser") and inst.components.rechargeable:IsCharged() then
	-- 	return
	-- end

	if inst.components.rechargeable:GetRechargeTime() ~= TUNING.TIMESTOPHAT_COOLDOWN then
		-- Cancel Time Slow
		if inst.TimeSlow then
			inst.TimeSlow:Cancel()
		end

		-- Unslow everything in the slowed table
		if inst.slowedThings ~= nil then
			for k, v in ipairs(inst.slowedThings) do
				if v ~= nil and v:IsValid() and not v:IsInLimbo() then
					v.components.timebound:RemoveModifier(inst)
				end
			end
		end
		inst.slowedThings = nil

		inst.components.rechargeable:Discharge(TUNING.TIMESTOPHAT_COOLDOWN)

		if inst.components.fueled then
			inst.components.fueled:StopConsuming()
		end
		
		--Sounds
		inst.SoundEmitter:PlaySound("timestophat/sound/deactivate")
		inst.SoundEmitter:KillSound("timestoploop")
		
		--Revert back to default skin (as above, move to hk prefab)
		local default = owner.oldskin or "hatkid"
		SetSkinsOnAnim(owner.AnimState, default, default, owner.components.skinner:GetClothing(), nil, default)

		-- owner:RemoveTag("timestopuser")
	end
end

local function KeybindUse(inst)
	if inst:HasTag("inuse") then
		inst.components.useableitem:StopUsingItem()
	else
		inst.components.useableitem:StartUsingItem()
	end 
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "timestophat", "swap_hat")
			
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)
	if inst:HasTag("inuse") then
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

local function OnEmpty(inst)
	if inst:HasTag("inuse") then
		inst.components.useableitem:StopUsingItem()
	end
end

local function OnCharged(inst)
	if inst:HasTag("inuse") then
		inst.components.useableitem:StopUsingItem()
	end
end

local function ontakefuel(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/nightmareAddFuel")
end
 
local function fn() 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", nil, 0.55) -- Makes items float on water, rather than just sitting there.
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.AnimState:SetBank("timestophat")
    inst.AnimState:SetBuild("timestophat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)

	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)
 
    inst:AddComponent("inspectable")
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
    inst:AddComponent("inventoryitem")
	
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetOnChargedFn(OnCharged)

	if TUNING.TIMESTOPHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
		inst.components.fueled:SetTakeFuelFn(ontakefuel)
		inst.components.fueled:InitializeFuelLevel( TUNING.TIMESTOPHAT_DURABILITY ) -- add tuning 300
		inst.components.fueled:SetDepletedFn(OnEmpty)
		inst.components.fueled.bonusmult = 5 / 180
	end

	if TUNING.TIMESTOPHAT_INSULATION then
		inst:AddComponent("insulator")
		inst.components.insulator:SetWinter()
		inst.components.insulator:SetInsulation(TUNING.TIMESTOPHAT_INSULATION)
	end

	if TUNING.TIMESTOPHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.TIMESTOPHAT_WATERPROOFNESS)
	end
	
	inst:ListenForEvent("AbilityKey", KeybindUse)
 
    return inst
end

return  Prefab("common/inventory/timestophat", fn, assets, prefabs)