local assets=
{ 
    Asset("ANIM", "anim/polarhat.zip"),
    Asset("ANIM", "anim/polarhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/polarhat.xml"),
    Asset("IMAGE", "images/inventoryimages/polarhat.tex"),
}

--Scratch the previous stuff, new idea
--I'm going to implement an ability key, probably LSHIFT by default, this will activate the Hat Ability, like slamming with ice hat, sprinting, throwing a potion with brewing hat, etc.
--Ice Hat ability will be a ground slam, knocking things away from Hat Kid and applying 3 layers of freeze, and possibly a little damage. However, this will be put on a cooldown of probably 15 seconds, we'll see.

-- (Several weeks later) looking great, let's see if we can polish it up.
local prefabs = 
{ 
}

local FREEZE_COLOUR = { 82 / 255, 115 / 255, 124 / 255, 0 }

local function PushColour(owner, r, g, b, a)
    if owner.components.colouradder ~= nil then
        owner.components.colouradder:PushColour("fake_freeze", r, g, b, a)
    else
        owner.AnimState:SetAddColour(r, g, b, a)
    end
end

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

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

local function polarhatclient2(owner)
	local hfx2 = SpawnPrefab("hatshatter2").Transform:SetPosition(owner.Transform:GetWorldPosition())
end

AddClientModRPCHandler("HatKidRPC", "polarhatclient", polarhatclient)

AddClientModRPCHandler("HatKidRPC", "polarhatclient2", polarhatclient2)

function UpdateTint(inst)
	local owner = inst.components.inventoryitem.owner
	local r, g, b, a
	PushColour(owner, FREEZE_COLOUR[1], FREEZE_COLOUR[2], FREEZE_COLOUR[3], FREEZE_COLOUR[4])
end

local function FakeReveal(inst)
	local owner = inst.components.inventoryitem.owner
	
	owner:DoTaskInTime(0, function(owner)
		inst:RemoveTag("inuse")
		owner.sg:GoToState("idle")
		owner.AnimState:PlayAnimation("idle")
		owner.AnimState:ClearOverrideSymbol("swap_frozen")
		owner.components.inventory:Show()
		local hfx2t = SpawnPrefab("hatshatter2").Transform:SetPosition(owner.Transform:GetWorldPosition())
		
		if owner.components.playercontroller ~= nil then
			owner.components.playercontroller:EnableMapControls(true)
			owner.components.playercontroller:Enable(true)
		end
		
		if owner.components.colouradder ~= nil then
			owner.components.colouradder:PopColour("fake_freeze")
		else
			owner.AnimState:SetAddColour(0, 0, 0, 0)
		end
	end)
end

local function FakeFreeze(inst)
	local owner = inst.components.inventoryitem.owner
	
	inst:AddTag("inuse")

	if owner.components.pinnable ~= nil and owner.components.pinnable:IsStuck() then
		owner.components.pinnable:Unstick()
	end

	if owner.components.inventory:IsHeavyLifting() then
		owner.components.inventory:DropItem(
		owner.components.inventory:Unequip(EQUIPSLOTS.BODY), true, true)
	end
	
	owner.components.locomotor:StopMoving()
	-- owner:
	owner:ClearBufferedAction()

	owner.AnimState:PlayAnimation("idle")
	owner.sg:GoToState("idle")
	
	SendModRPCToClient(GetClientModRPC("HatKidRPC", "polarhatclient"), nil, owner)
	local hfxt = SpawnPrefab("hatshatter").Transform:SetPosition(owner.Transform:GetWorldPosition())
	
	owner.Transform:SetPosition(owner.Transform:GetWorldPosition())
	
	owner.AnimState:OverrideSymbol("swap_frozen", "frozen", "frozen")
	owner.AnimState:PlayAnimation("frozen")

	owner.components.inventory:Hide()
	owner:PushEvent("ms_closepopups")
	if owner.components.playercontroller ~= nil then
		owner.components.playercontroller:EnableMapControls(false)
		owner.components.playercontroller:Enable(false)
	end
	UpdateTint(inst)
end


local function Indicator(inst, enable, scale)
	if inst.ice_range ~= nil then
		inst.ice_range:Remove()
		inst.ice_range = nil
	end
	if enable then
		inst.ice_range = SpawnPrefab("hkr_icerange")
		inst.ice_range:LinkToEntity(inst, scale)
	end
end

local function OnUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() then
		-- If in cooldown
		inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
			inst.components.useableitem:StopUsingItem()
		end)
		
		-- owner:PushEvent("hatcooldown")
		owner.components.talker:Say(GetString(owner, "HAT_ONCOOLDOWN"))
		
	elseif not owner:HasTag("alwaysblock") then
		-- If not in cooldown
		--Ability Stuff
		
		owner.SoundEmitter:PlaySound("icestomp/sound/activate")

		FakeFreeze(inst)
		
		owner:AddTag("alwaysblock")
		
		-- owner:AddChild(fx)

		owner:DoTaskInTime(0.5, function(owner)
			FakeReveal(inst)
			inst.components.useableitem:StopUsingItem()
			
			owner:RemoveTag("alwaysblock")
			
			for i, v in ipairs(AllPlayers) do
				local distSq = v:GetDistanceSqToInst(owner)
				local k = math.max(0, math.min(1, distSq / 400))
				local intensity = k * 0.75 * (k - 2) + 0.75 --easing.outQuad(k, 1, -1, 1)
				if intensity > 0 then
					v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, intensity / 2)
				end
			end
			
			SpawnPrefab("icecloud").Transform:SetPosition(owner.Transform:GetWorldPosition())
			owner.SoundEmitter:PlaySound("icestomp/sound/stomp")
			
			if not owner.components.health:IsDead() and not owner:HasTag("playerghost") then
				local pt = owner:GetPosition()
				local range = TUNING.POLARHAT_RADIUS
				local tags = { "monster", "hostile", "smallcreature", "insect", "animal", "largecreature", "character" }
				local nags = { "player", "ghost", "noauradamage", "notraptrigger" }
				local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, tags)	
				for _,ent in ipairs(targets) do
					if ent.components.freezable ~= nil then
						ent.components.freezable:AddColdness(TUNING.POLARHAT_LEVEL)
						ent.components.freezable:SpawnShatterFX()

					end
				end

				local tags = { "player" }
				local nags = { "ghost" }
				local targets = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, nags, tags)	
				for _,ent in ipairs(targets) do
					if ent.components.temperature ~= nil then
						--stuff
						ent.components.temperature:SetTemperature(ent.components.temperature:GetCurrent() - TUNING.POLARHAT_TEMP)
					end
				end
			end
		end)
	end
end

local function OnStopUse(inst)

	local owner = inst.components.inventoryitem.owner
	local rechargeable = inst.components.rechargeable
	
	if not rechargeable:IsCharged() then
		-- If in cooldown
		-- Visual indicator of some sort here.
	else
		-- If not in cooldown, or doing nothing, put it on cooldown!
		
		rechargeable:Discharge(TUNING.POLARHAT_COOLDOWN) -- We use the rechargeable component to track cooldowns
		
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
	
	owner.AnimState:OverrideSymbol("swap_hat", "polarhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	if inst:HasTag("inuse") then
		inst:RemoveTag("inuse")
	end
	
	-- if owner.components.timer ~= nil then
		-- if not owner.components.timer:TimerExists("hat_cooldown") then
			Indicator(owner, true, 0.15 * TUNING.POLARHAT_RADIUS)
		-- end
	-- end
	
	-- owner:ListenForEvent("timerdone", function(inst)
		-- Indicator(owner, true, 0.15 * 7)
	-- end)
	
	-- Don't show the indicator when it's on cooldown, but let's start a task to re enable it once cooldown is over.
	-- inst.indcheck = inst:DoPeriodicTask(0.5, IndicatorCheck, nil, inst)
	
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
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
	
	Indicator(owner, false, 0.15 * TUNING.POLARHAT_RADIUS)
	-- inst.indcheck:Cancel()
	
	if inst:HasTag("inuse") then
		inst:RemoveTag("inuse")
	end

	-- owner:RemoveEventCallback("timerdone", function(inst)
		-- Indicator(owner, true, 0.15 * 7)
	-- end)
	
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

local function OnCharged()

end


local function KeybindUse(inst)
	local owner = inst.components.inventoryitem.owner
	inst.components.useableitem:StartUsingItem()
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
	
    inst.AnimState:SetBank("polarhat")
    inst.AnimState:SetBuild("polarhat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    inst.components.useableitem:SetOnStopUseFn(OnStopUse)

    inst:AddComponent("timer")
 
    inst:AddComponent("inspectable") 
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "polarhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/polarhat.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("insulator")
	inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
	
	inst:AddComponent("rechargeable")
	-- inst.components.rechargeable:SetOnDischargedFn(OnDischarged)
	inst.components.rechargeable:SetOnChargedFn(OnCharged)

	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)
	inst:ListenForEvent("AbilityKey", KeybindUse)
	
    return inst
end

return  Prefab("polarhat", fn, assets, prefabs)