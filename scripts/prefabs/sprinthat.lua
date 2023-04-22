local assets=
{ 
    Asset("ANIM", "anim/sprinthat.zip"),

    Asset("ATLAS", "images/inventoryimages/sprinthat.xml"),
    Asset("IMAGE", "images/inventoryimages/sprinthat.tex"),

	Asset("SOUNDPACKAGE", "sound/sprinthat.fev"),
    Asset("SOUND", "sound/sprinthat.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/sprinthat.xml","sprinthat.tex")

local prefabs = 
{
	-- "sprint_puff"
}

local function PLoop(inst)

	if TheWorld.ismastersim or TheNet:IsDedicated() then return end

	if ThePlayer.AnimState:IsCurrentAnimation("run_pre") or 
	ThePlayer.AnimState:IsCurrentAnimation("run_loop") then
		if not inst.sprintfx then
				
			inst.sprintfx = inst:DoTaskInTime(0.25/2, function(inst)
				inst.sprintfx:Cancel()
				inst.sprintfx = nil
				local x, y, z = ThePlayer.Transform:GetWorldPosition()
				local dirt = SpawnPrefab("sprint_puff")
				dirt.Transform:SetPosition(x, y, z)
				dirt.Transform:SetScale(0.4, 0.4, 0.4)
			end)
		end
	elseif ThePlayer.AnimState:IsCurrentAnimation("run_pst") and inst.sprintfx then
		inst.sprintfx:Cancel()
		inst.sprintfx = nil
	end
end

local function onLocomote(owner)
	local inst = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
	local isrunning = owner.components.locomotor.isrunning or owner.components.locomotor.wantstorun

	if inst.sprinting ~= isrunning then -- This is here so we don't retrigger the sound event when we aren't doing anything, so it only triggers if the state is different

		inst.sprinting = isrunning

		if owner.components.inventory:IsHeavyLifting() then
			-- Remove hunger burn
			if owner.components.hunger then
				owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
			end
		
			-- Remove durability burn
			if inst.components.fueled then
				inst.components.fueled:StopConsuming()
			end

			return
		end

		if inst.sprinting then

			-- Start hunger burn
			if owner.components.hunger then
				owner.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.SPRINTHAT_HUNGER_BURNRATE)
			end
		
			-- Start durability burn
			if inst.components.fueled then
				inst.components.fueled:StartConsuming()
			end

			--Start the sound loop
			if TUNING.SPRINTHAT_SFX then
				owner.SoundEmitter:PlaySound("sprinthat/sound/sprintloop", "sprintloop")
			end

		elseif not inst.sprinting then

			-- Remove hunger burn
			if owner.components.hunger then
				owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
			end
		
			-- Remove durability burn
			if inst.components.fueled then
				inst.components.fueled:StopConsuming()
			end
			
			--Cancel sound loop, and play the release sfx
			if TUNING.SPRINTHAT_SFX then
				owner.SoundEmitter:KillSound("sprintloop")
				owner.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
			end
		end
	end
end

local function Enabler(inst, enable)
	if TheWorld.ismastersim or TheNet:IsDedicated() then return end

	if not TUNING.SPRINTHAT_VFX then return end

	if enable then
		inst.components.updatelooper:AddOnUpdateFn(PLoop)
	else
		inst.components.updatelooper:RemoveOnUpdateFn(PLoop)
	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "sprinthat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	inst.sprinting = nil

	owner:ListenForEvent("locomote", onLocomote)
	SendModRPCToClient(GetClientModRPC("HatKidRPC", "SprintEquip"), nil, inst, true)
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

	if owner.components.hunger then
		owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
	end

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end

	-- Cleanup sound if left over
	if TUNING.SPRINTHAT_SFX and inst.sprinting then
		inst:DoTaskInTime(0, function(inst)
			owner.SoundEmitter:KillSound("sprintloop")
			owner.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
		end)
	end

	inst.sprinting = nil

	owner:RemoveEventCallback("locomote", onLocomote)
	SendModRPCToClient(GetClientModRPC("HatKidRPC", "SprintEquip"), nil, inst, false)
end

AddClientModRPCHandler("HatKidRPC", "SprintEquip", Enabler)

local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
end
 
local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.05, 0.6) -- Makes items float on water, rather than just sitting there.
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")

	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		inst:AddComponent("updatelooper")
        return inst
    end
	
    inst.AnimState:SetBank("sprinthat")
    inst.AnimState:SetBuild("sprinthat")
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
	inst.components.equippable.walkspeedmult = TUNING.SPRINTHAT_SPEED_MULT

	if TUNING.SPRINTHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.USAGE
		inst.components.fueled:InitializeFuelLevel( TUNING.SPRINTHAT_DURABILITY ) -- 90 minutes by default
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end

	if TUNING.SPRINTHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.KIDHAT_WATERPROOFNESS)
	end

	if TUNING.SPRINTHAT_INSULATION then
		inst:AddComponent("insulator")
		inst.components.insulator:SetSummer()
		inst.components.insulator:SetInsulation(TUNING.SPRINTHAT_INSULATION)
	end

    return inst
end

return  Prefab("common/inventory/sprinthat", fn, assets, prefabs)