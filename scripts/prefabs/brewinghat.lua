-- Whooo boy, this is a rat's nest in need of an exterminator. Time to get at it!

-- (5/12/22) still a rat's nest, but manageable I guess.
local assets=
{ 
    Asset("ANIM", "anim/brewinghat.zip"),

    Asset("ATLAS", "images/inventoryimages/brewinghat.xml"),
    Asset("IMAGE", "images/inventoryimages/brewinghat.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/brewinghat.xml", "brewinghat.tex")

local prefabs =
{
}

local function equiprev(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if TUNING.FUNNYMODE then --Just a funny item teleportation mechanic we can do here.

		if owner.prevequip then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(owner.prevequip)
				owner.prevequip = nil
			end)
		end

	else

		if owner.prevequip and owner.prevequip.components.inventoryitem and owner.prevequip.components.inventoryitem:GetGrandOwner() == owner then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(owner.prevequip)
				owner.prevequip = nil
			end)
		end

	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "brewinghat", "swap_hat")

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAIR_HAT")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
 
local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	local hands = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	
	if not inst.components.rechargeable:IsCharged()  -- if we aren't charged yet
	or owner.components.sanity.current < TUNING.BREWINGHAT_THRESHHOLD  -- or we don't have enough sanity
	or inst.components.fueled:GetPercent() < 0.125 -- or we don't have enough fuel
	or (hands and string.match(hands.prefab, "kidpotion")) then -- or we are already holding a potion
	
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		--Cooldown line
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
	else
		-- If not in cooldown
		owner.prevequip = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

		-- Player stuffh
		owner.components.sanity:DoDelta(-TUNING.BREWINGHAT_THRESHHOLD)

		local kidpotion = SpawnPrefab("kidpotion")
		kidpotion.sourceprefab = inst
		kidpotion.brewer = owner
		owner.components.inventory:Equip(kidpotion)

		-- Hat Stuff
		-- inst.components.rechargeable:Discharge(TUNING.BREWINGHAT_CHARGETIME) -- Cooldown
		inst.components.fueled:DoDelta(-1)

		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
	end
end

local function KeybindUse(inst)
	inst.components.useableitem:StartUsingItem()
end

local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.
 
    inst:AddTag("hat")
	inst:AddTag("hatkidhat")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.AnimState:SetBank("brewinghat")
    inst.AnimState:SetBuild("brewinghat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
    
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inventoryitem")
	
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer() 
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
	inst:AddComponent("rechargeable")
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    -- inst.components.useableitem:SetOnStopUseFn(OnStopUse)

	if TUNING.BREWINGHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled:InitializeFuelLevel( 4 ) -- add tuning
		inst.components.fueled.fueltype = FUELTYPE.CAVE
		-- inst.components.fueled.secondaryfueltype = FUELTYPE.NIGHTMARE
		inst.components.fueled.bonusmult = 2 / 45
		-- if this needs to be fixed, perhaps add a math.ceil check to OnTick in the auto-fuel slots section.
		inst.components.fueled.accepting = true
	end
	
	inst:ListenForEvent("AbilityKey", KeybindUse)

	inst:ListenForEvent("prevequip", equiprev)

    return inst
end

return  Prefab("brewinghat", fn, assets, prefabs)