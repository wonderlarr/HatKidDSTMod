-- Whooo boy, this is a rat's nest in need of an exterminator. Time to get at it!

local assets=
{ 
    Asset("ANIM", "anim/brewinghat.zip"),

    Asset("ATLAS", "images/inventoryimages/brewinghat.xml"),
    Asset("IMAGE", "images/inventoryimages/brewinghat.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/brewinghat.xml","brewinghat.tex")

local prefabs =
{
}

local prevequip = nil

local function equiprev(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if TUNING.FUNNYMODE then --Just a funny item teleportation mechanic we can do here.

		if prevequip then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(prevequip)
				prevequip = nil
			end)
		end

	else

		if prevequip and prevequip.components.inventoryitem and prevequip.components.inventoryitem:GetGrandOwner() == owner then
			inst:DoTaskInTime(0, function(inst)
				owner.components.inventory:Equip(prevequip)
				prevequip = nil
			end)
		end

	end
end

local function OnEmpty(inst)
	-- inst:DoTaskInTime(0, inst.Remove)
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
	
	if not inst.components.rechargeable:IsCharged() 
	or owner.components.sanity.current < TUNING.BREWINGHAT_THRESHHOLD 
	or inst.components.fueled:GetPercent() < 0.125 then
	
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		--Cooldown line
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	else
		-- If not in cooldown
		prevequip = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

		-- Player stuff
		owner.components.sanity:DoDelta(-TUNING.BREWINGHAT_THRESHHOLD)
		owner.components.inventory:Equip(SpawnPrefab("kidpotion"))

		-- Hat Stuff
		inst.components.rechargeable:Discharge(TUNING.BREWINGHAT_CHARGETIME) -- Cooldown
		inst.components.fueled:DoDelta(-90)

		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
	end
end

local function OnStopUse(inst)

	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	if not inst.components.rechargeable:IsCharged() then
		-- If in cooldown

	else

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
		inst.components.fueled:InitializeFuelLevel( 720 ) -- add tuning
		inst.components.fueled.fueltype = FUELTYPE.CHEMICAL
		inst.components.fueled.secondaryfueltype = FUELTYPE.NIGHTMARE
		inst.components.fueled.accepting = true
	end
	
	inst:ListenForEvent("AbilityKey", KeybindUse)

	inst:ListenForEvent("prevequip", equiprev)

    return inst
end

-- AddModRPCHandler("HatKidRPC", "GetMousePos", BrewingHatAbility)

return  Prefab("brewinghat", fn, assets, prefabs)