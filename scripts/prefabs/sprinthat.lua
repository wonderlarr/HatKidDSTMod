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
}

local sprinting = nil

local function onLocomote(inst) -- Perhaps rewrite this?
	local isrunning = inst.components.locomotor.isrunning or inst.components.locomotor.wantstorun
	local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD) -- known as inst throughout the rest of this file
	

	if sprinting ~= isrunning then -- This is here so we don't retrigger the sound event when we aren't doing anything, so it only triggers if the state is different

		sprinting = isrunning -- this is a hacky way of tracking state changes,

		if sprinting then

			--Modify hunger rate
			if inst.components.hunger and hat.components.fueled then
				inst.components.hunger.burnratemodifiers:SetModifier(hat, TUNING.SPRINTHAT_HUNGER_BURNRATE)
				hat.components.fueled:StartConsuming()
			end

			--Start the sound loop
			if TUNING.SPRINTHAT_SFX then
				inst.SoundEmitter:PlaySound("sprinthat/sound/sprintloop", "sprintloop")
			end

		elseif not sprinting then

			-- Remove modified hunger rate 
			if inst.components.hunger and hat.components.fueled then
				inst.components.hunger.burnratemodifiers:RemoveModifier(hat)
				hat.components.fueled:StopConsuming()
			end
			
			--Cancel sound loop, and play the release sfx
			if TUNING.SPRINTHAT_SFX then
				inst.SoundEmitter:KillSound("sprintloop")
				inst.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
			end
		end
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
	
	sprinting = nil
	-- Config controls if we do the sound or not
	owner:ListenForEvent("locomote", onLocomote)
	owner:PushEvent("UpdateSprintParticles")
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
		owner.sprintfx:Cancel() -- If we remove this the game crashes. Simple as that. 
		                        -- Don't remove it. I don't feel like dealing with it.
								-- Someone else can fix it if they want but I'm not doing it.
	end

	if owner.components.hunger then
		owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
	end

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end

	if TUNING.SPRINTHAT_SFX then
		inst:DoTaskInTime(0, function(inst)
			owner.SoundEmitter:KillSound("sprintloop")
			owner.SoundEmitter:PlaySound("sprinthat/sound/sprintrelease")
		end)
	end

	owner:PushEvent("CleanSprintParticles") -- Stops particles properly on unequip. Particles still work sometimes without this but this makes it consistent and prevents glitches.
	-- If you wanna know what it does, check out the listener in hatkid.lua
	

end

local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
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
    -- inst.components.inventoryitem.imagename = "sprinthat"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/sprinthat.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
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
 
    return inst
end

return  Prefab("common/inventory/sprinthat", fn, assets, prefabs)