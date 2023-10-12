local assets=
{ 
    Asset("ANIM", "anim/polarhat.zip"),

    Asset("ATLAS", "images/inventoryimages/polarhat.xml"),
    Asset("IMAGE", "images/inventoryimages/polarhat.tex"),
}

RegisterInventoryItemAtlas("images/inventoryimages/polarhat.xml","polarhat.tex")

--Scratch the previous stuff, new idea
--I'm going to implement an ability key, probably LSHIFT by default, this will activate the Hat Ability, like slamming with ice hat, sprinting, throwing a potion with brewing hat, etc.
--Ice Hat ability will be a ground slam, knocking things away from Hat Kid and applying 3 layers of freeze, and possibly a little damage. However, this will be put on a cooldown of probably 15 seconds, we'll see.
-- (Several weeks later) Looking great, let's see if we can polish it up.

-- 5/11/22 After taking many breaks and stuff, this is NEEDS a rewrite. I didn't really know how stategraphs worked when I first made this, so I just did everything manually
-- because I thought it was easier. Boy was I wrong, and boy do I regret it. At least I can fix the rat's nest.

-- 5/14/22 Rewrite basically done! Made a stategraph and stuff, looking pretty good so far, a LOT cleaner than before.
-- Still a bit of a rat's nest, but it's a lot more readable now, so I'm happy for the moment.

local prefabs = 
{ 
	"hatshatter",
	"hatshatter2",
	"polarhat_explode",
}

local function polarhatclient(owner)
	owner:DoTaskInTime(0.1, function(owner)
		
		if owner.sg ~= nil then
			owner.components.locomotor:StopMoving()
			
			owner.AnimState:PlayAnimation("idle")
			owner.sg:GoToState("idle")
			
			
			owner.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
			owner.AnimState:PlayAnimation("frozen")
		
			if owner.components.playercontroller ~= nil then
				owner.components.playercontroller:EnableMapControls(false)
				owner.components.playercontroller:Enable(false)
			end
		end
	end)
end

AddClientModRPCHandler("HatKidRPC", "polarhatclient", polarhatclient)

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "polarhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	inst.freezefn = function(attacked, data)
        if data and data.attacker and data.attacker.components.freezable and inst.components.fueled:GetPercent() >= 0.08 then
            data.attacker.components.freezable:AddColdness(1)
            data.attacker.components.freezable:SpawnShatterFX()
            inst.components.fueled:DoDelta(-0.08 * inst.components.fueled.maxfuel)
        end
    end

    inst:ListenForEvent("attacked", inst.freezefn, owner)
end
 
 
local function OnUnequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_hat")

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	inst:RemoveEventCallback("attacked", inst.freezefn, owner)
end

local function OnActivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	-- Cost
	if inst.components.fueled then -- what the heck is happening here??? -- it works, leave it alone for now
		inst.components.fueled:SetPercent(inst.components.fueled:GetPercent() - (1 / TUNING.POLARHAT_DURABILITY))
		inst.components.fueled.currentfuel = math.floor(inst.components.fueled.currentfuel/(180 * inst.components.fueled.bonusmult)+0.5)* (180 * inst.components.fueled.bonusmult)
	end

	if owner.components.sanity then
		owner.components.sanity:DoDelta(-TUNING.POLARHAT_THRESHHOLD)
	end
	
	-- Fakefreeze, rewritten somewhat more properly as a state
	owner.sg:GoToState("hat_frozen")

	-- Initial FX
	SpawnPrefab("polarhat_charge").Transform:SetPosition(owner.Transform:GetWorldPosition())
	SpawnPrefab("hatshatter").Transform:SetPosition(owner.Transform:GetWorldPosition())
	local two = SpawnPrefab("hatshatter")
	two.Transform:SetPosition(owner.Transform:GetWorldPosition())
	two.Transform:SetScale(1.25, 1.25, 1.25)

	-- After a delay, explode!
	owner:DoTaskInTime(20 * FRAMES, function(owner)
		-- Explode FX
		SpawnPrefab("hatshatter2").Transform:SetPosition(owner.Transform:GetWorldPosition())
		SpawnPrefab("polarhat_explode").Transform:SetPosition(owner.Transform:GetWorldPosition())
		
		-- Start Camera Shake
		for i, v in ipairs(AllPlayers) do
			local distSq = v:GetDistanceSqToInst(owner)
			local k = math.max(0, math.min(1, distSq / 400))
			local intensity = k * 0.75 * (k - 2) + 0.75
			if intensity > 0 then
				v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, intensity / 2)
			end
		end
		-- End Camera Shake
		
		-- Get entities in a radius around the explosion's center
		local pt = owner:GetPosition()
		local range = TUNING.POLARHAT_RADIUS
		-- local tags = { "monster", "hostile", "smallcreature", "insect", "animal", "largecreature", "character", "player" }
		local nags = { "CLASSIFED", "invisible", "playerghost", "INLIMBO" }
		local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, nil)	
		for _,ent in ipairs(targets) do

			-- Hitstun and damage
			if ent.components.combat and not ent:HasTag("player") then
				ent.components.combat:GetAttacked(owner, TUNING.POLARHAT_DAMAGE, inst)
			end

			-- Freeze things that need frozen
			if ent.components.freezable ~= nil then
				ent.components.freezable:AddColdness(TUNING.POLARHAT_LEVEL)
				ent.components.freezable:SpawnShatterFX()
			end

			-- Decrease character temperatures
			if ent.components.temperature ~= nil then
				-- If effecting the owner, modify temp directly to bypass polarhat insulation
				if ent == owner then
					ent.components.temperature:SetTemperature(ent.components.temperature.current + -TUNING.POLARHAT_TEMP + -(math.max(0, ent.components.temperature:GetCurrent() / 70 * 20)))
				else
					ent.components.temperature:DoDelta(-TUNING.POLARHAT_TEMP + -(math.max(0, ent.components.temperature:GetCurrent() / 70 * 20)))
				end
			end
		end
	end)
end

local function TestFn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	if inst.components.fueled then
		if owner.components.sanity.current >= TUNING.POLARHAT_THRESHHOLD -- if we have enough sanity 
		and inst.components.fueled:GetPercent() >= (1 / TUNING.POLARHAT_DURABILITY) then -- and we have enough fuel
			return true
		else
			return false
		end
	else
		if owner.components.sanity.current >= TUNING.POLARHAT_THRESHHOLD then
			return true
		else
			return false
		end
	end
end

local function KeybindUse(inst)
	inst.components.hatmagic:Activate()
end

local function fn(Sim) 
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	inst.AnimState:SetBank("polarhat")
    inst.AnimState:SetBuild("polarhat")
    inst.AnimState:PlayAnimation("idle")
	
    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.1, 0.6) -- Makes items float on water, rather than just sitting there.
 
    inst:AddTag("hat")
    inst:AddTag("hatkidhat")

	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	MakeHauntableLaunch(inst)

    inst:AddComponent("timer")
 
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
	-- inst.components.hatmagic.cooldowntime = TUNING.POLARHAT_COOLDOWN
	inst.components.hatmagic.cooldowntime = 2
	inst.components.hatmagic.activetime = 2/3
	inst.components.hatmagic:SetActivateFn(OnActivate)
	inst.components.hatmagic:SetTestFn(TestFn)

	if TUNING.POLARHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled:InitializeFuelLevel( TUNING.POLARHAT_DURABILITY * 180 )
		inst.components.fueled.fueltype = "ICE" -- ice, 180
		inst.components.fueled.bonusmult = TUNING.POLARHAT_FUELMULT
	end

	if TUNING.POLARHAT_INSULATION then 
		inst:AddComponent("insulator")
		inst.components.insulator:SetWinter()
		inst.components.insulator:SetInsulation(TUNING.POLARHAT_INSULATION)
	end

	if TUNING.POLARHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.POLARHAT_WATERPROOFNESS) 
	end

	inst:ListenForEvent("AbilityKey", KeybindUse)
	
    return inst
end

return Prefab("polarhat", fn, assets, prefabs)