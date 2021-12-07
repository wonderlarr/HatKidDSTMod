local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
    Asset("ANIM", "anim/kidhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}

local badge = nil

local holder = nil

local testfab = nil

local prefabs = 
{
}

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

local function onload(inst, data) 
	if data.PrevOwner then 
		print("Previous Owner found")
		print(data.PrevOwner.prefab)
		dumptable(data.PrevOwner,1,1)
	end
end

local function aura()
	return 1
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
	
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end

	inst:AddComponent("sanityaura")
	inst.components.sanityaura.max_distsq = TUNING.HATKID_AURASIZE
    inst.components.sanityaura.aura = -TUNING.HATKID_AURARATE
	inst.components.sanityaura.fallofffn = aura

	holder = owner

	inst.lab = SpawnPrefab("researchlab")
	inst.lab.Transform:SetScale(1, 1, 1)
	inst.lab.Physics:ClearCollisionMask()

	inst.lab.entity:SetParent(inst.entity)

	inst.connectedPrefab = SpawnPrefab("researchlab2")

	-- inst.test = "asdf"

	-- if inst._test ~= nil then
	-- 	inst.test = inst._test:GetSaveRecord()
	-- end
	
	--Hat Badge Slot
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
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

	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end

	inst:RemoveComponent("sanityaura")

	inst:DoTaskInTime(0, function(inst)
		inst.lab:Remove()
	end)
	
	
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
 
local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
end

local function onDrop(inst)
	-- if holder ~= nil then
	-- 	inst:DoTaskInTime(1, function(inst)
	-- 		local new = SpawnPrefab("strawhat")
	-- 		local speed = math.sqrt(math.sqrt(new:GetDistanceSqToInst(inst)))

	-- 		LaunchAt(inst, inst, new, speed)
	-- 		holder.components.talker:Say(tostring(speed))
	-- 	end)
	-- end

	print("SaveRecordTable--")
	print(inst:GetSaveRecord())
	-- dumptable(inst:GetSaveRecord(), 1,1)
	print("Holder--")
	print(holder)
	-- print("test--")
	-- print(inst.test)
	-- print("persist2--")
	-- local test = SpawnSaveRecord(inst.test)
	-- print(test)
	-- local _test = SpawnSaveRecord(inst._test)
	-- print(_test)
	-- THis crashes
	-- print("Record--")
	-- print(SpawnSaveRecord())
	
	-- if inst:GetPersistData().prefab == "hatkid" then
	-- 	GetPersistData().components.talker:Say("Success!")
	-- end
end

-- local function OnLoad(inst, data)

-- end

local function OnSave(inst, data)
	if inst.connectedPrefab then
		data.PrevOwner = inst.connectedPrefab:GetSaveRecord()
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
	inst:AddTag("hatkidhat")
	
    if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("hkr_badgeslot") end
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("kidhat")
    inst.AnimState:SetBuild("kidhat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")

	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidhat.xml"
	inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 1.5
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	if TUNING.KIDHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.USAGE
		inst.components.fueled:InitializeFuelLevel( TUNING.KIDHAT_DURABILITY ) -- add tuning 2 hours 7200
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end
	
	-- inst:AddComponent("insulator")
    -- inst.components.insulator:SetWinter()
    -- inst.components.insulator:SetInsulation(TUNING.INSULATION_TINY * TUNING.KIDHAT_INSULATION)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)

	inst.OnLoad = onload
	inst.OnSave = OnSave
	
    return inst
end
return  Prefab("kidhat", fn, assets, prefabs)