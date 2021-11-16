local assets=
{ 
    Asset("ANIM", "anim/sprinthat.zip"),
    Asset("ANIM", "anim/sprinthat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/sprinthat.xml"),
    Asset("IMAGE", "images/inventoryimages/sprinthat.tex"),
}

local prefabs = 
{
}

local sprinting = nil

local function MakeDirt(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	local dirt = SpawnPrefab("dirt_puff")
	dirt.Transform:SetPosition(x, y, z)
	dirt.Transform:SetScale(0.5, 0.5, 0.5)
end

local function onLocomote(inst)
	local isrunning = inst.components.locomotor.isrunning or inst.components.locomotor.wantstorun

	if sprinting ~= isrunning then -- This is here so we don't retrigger the sound event when we aren't doing anything, so it only triggers if the state is different

		sprinting = isrunning

		if inst.components.hunger then
			inst.components.hunger.burnrate = TUNING.SPRINTHAT_HUNGER_BURNRATE
		end

		if sprinting then
			MakeDirt(inst) --To start us off

			inst.sprintfx = inst:DoPeriodicTask(0.25/2, function(inst)
				MakeDirt(inst)
			end)

			if TUNING.SPRINTHAT_SFX then
				inst.SoundEmitter:PlaySound("sprinthat/sound/sprintloop", "sprintloop")
			end

		elseif not sprinting then --If we aren't sprinting

			if inst.components.hunger then
				inst.components.hunger.burnrate = 1
			end

			if inst.sprintfx then
				inst.sprintfx:Cancel()
			end
			
			if TUNING.SPRINTHAT_SFX then
				inst.SoundEmitter:KillSound("sprintloop")
				inst.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
			end
		end
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
	
	owner.AnimState:OverrideSymbol("swap_hat", "sprinthat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	sprinting = nil
	-- Config controls if we do the sound or not
	owner:ListenForEvent("locomote", onLocomote)

	--Hat Badge Slot
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
end
 
local function OnUnequip(inst, owner)

	if owner.components.hunger then
		owner.components.hunger.burnrate = 1
	end

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	sprinting = nil

	owner:RemoveEventCallback("locomote", onLocomote)
	if owner.sprintfx then
		owner.sprintfx:Cancel()
	end

	if TUNING.SPRINTHAT_SFX then
		inst:DoTaskInTime(0, function(inst)
			owner.SoundEmitter:KillSound("sprintloop")
			owner.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
		end)
	end

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
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("sprinthat")
    inst.AnimState:SetBuild("sprinthat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sprinthat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sprinthat.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst.components.equippable.walkspeedmult = TUNING.SPRINTHAT_SPEED_MULT
 
    return inst
end

return  Prefab("common/inventory/sprinthat", fn, assets, prefabs)