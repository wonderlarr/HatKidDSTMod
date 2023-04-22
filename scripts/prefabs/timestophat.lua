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
	local pt = owner:GetPosition()
	local range = 32  -- range of ability
	local tags = { "timebound" }
	local nags = { "player", "INLIMBO", "playerghost", "timeslowed" }
	local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, tags, nags, nil)
	for _,ent in ipairs(targets) do
		if ent.components.timebound:GetModifierFromSource(inst) == 1 then
			ent.components.timebound:SetModifier(inst, TUNING.TIMESTOPHAT_TIMESCALE, nil)
			
			ent:AddTag("timeslowed")
			table.insert(inst.slowedThings, ent)
		end
	end
end

local function OnActivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- If Time Slow API isn't enabled
	if not inst:HasTag("timebound") and not inst:HasTag("NoModError") then
		print("Hat Kid: ===============================================")
		print("Hat Kid: Dependency '[API] Time Control' is not enabled, time slow can't function!")
		print("Hat Kid: ===============================================")

		c_announce("Hat Kid: Dependency '[API] Time Control' not enabled, time slow can't function!")
		inst:AddTag("NoModError")

		owner.components.talker:Say("Something's missing...")
	end

	-- Fuel
	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end

	if owner.components.sanity then
		owner.components.sanity:DoDelta(-TUNING.TIMESTOPHAT_THRESHHOLD)
	end
	
	--Sounds
	if math.random() <= 0.01 then
		-- ZA WARUDO
		inst.SoundEmitter:PlaySound("timestophat/sound/activate_awesome")
	else
		-- normal sound
		inst.SoundEmitter:PlaySound("timestophat/sound/activate")
	end
	
	inst.SoundEmitter:PlaySound("timestophat/sound/loop", "timestoploop")

	-- Skin, move to hatkid prefab based on event listeners, so the hat is able to be used by other characters
	owner.oldskin = owner.AnimState:GetBuild()
	SetSkinsOnAnim(owner.AnimState, "hatkid_timestop", "hatkid_timestop", owner.components.skinner:GetClothing(), nil, "hatkid_timestop")

	-- Slowed entities table
	inst.slowedThings = {}
end

local function OnDeactivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- Unslow everything in the slowed table
	if inst.slowedThings ~= nil then
		for k, v in ipairs(inst.slowedThings) do
			if v ~= nil and v:IsValid() and not v:IsInLimbo() then
				v.components.timebound:RemoveModifier(inst)
				v:RemoveTag("timeslowed")
			end
		end
	end
	inst.slowedThings = nil

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end
	
	--Sounds
	inst.SoundEmitter:PlaySound("timestophat/sound/deactivate")
	inst.SoundEmitter:KillSound("timestoploop")
	
	--Revert back to default skin (as above, move to hk prefab)
	local default = owner.oldskin or "hatkid"
	SetSkinsOnAnim(owner.AnimState, default, default, owner.components.skinner:GetClothing(), nil, default)
end

local function KeybindUse(inst)
	inst.components.hatmagic:Use()
end

local function TestFn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if inst.components.fueled then
		if owner.components.sanity.current >= TUNING.TIMESTOPHAT_THRESHHOLD -- if we have enough sanity 
		and inst.components.fueled:GetPercent() > 0 then -- and we have enough fuel
			return true
		else
			return false
		end
	else
		if owner.components.sanity.current >= TUNING.TIMESTOPHAT_THRESHHOLD then
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
 
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	
    inst:AddComponent("equippable")
	if TUNING.ITEMRESTRICTIONS then
		inst.components.equippable.restrictedtag = "hatkid"
	end
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	-- inst:AddComponent("rechargeable")
	-- inst.components.rechargeable:SetOnChargedFn(OnCharged)

	inst:AddComponent("hatmagic")
	inst.components.hatmagic.instant = false
	inst.components.hatmagic.cooldowntime = TUNING.TIMESTOPHAT_COOLDOWN
	inst.components.hatmagic.activetime = TUNING.TIMESTOPHAT_DURATION -- infinite, technically
	inst.components.hatmagic:SetActivateFn(OnActivate)
	inst.components.hatmagic:SetDeactivateFn(OnDeactivate)
	inst.components.hatmagic:SetLoopFn(OnLoop)
	inst.components.hatmagic:SetTestFn(TestFn)

	if TUNING.TIMESTOPHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
		inst.components.fueled:SetTakeFuelFn(ontakefuel)
		inst.components.fueled:InitializeFuelLevel( TUNING.TIMESTOPHAT_DURABILITY )
		inst.components.fueled:SetDepletedFn(OnEmpty)
		inst.components.fueled.bonusmult = TUNING.TIMESTOPHAT_VALUE / 180
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