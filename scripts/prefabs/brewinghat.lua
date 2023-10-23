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

-- Start Container stuff ---------
local containers = require("containers")
params = containers.params

params.brewinghat_inv =
{
	widget =
	{
		slotpos =
		{
			Vector3(0,   32 + 4,  0),
		},
		animbank = "ui_cookpot_1x2",
		animbuild = "ui_cookpot_1x2",
		pos = Vector3(0, 15, 0),
	},
	usespecificslotsforitems = true,
	type = "head_inv",
}

function params.brewinghat_inv.itemtestfn(container, item, slot)
	return item:HasTag("brewinghat_fuel")
end
-- End Container -------

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", "brewinghat", "swap_hat")

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
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

	if inst.components.container ~= nil then
		inst.components.container:Close(owner)
	end
end

local function equiprev(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	if owner.prevequip and owner.prevequip.components.inventoryitem and owner.prevequip.components.inventoryitem:GetGrandOwner() == owner then
		inst:DoTaskInTime(0, function(inst)
			owner.components.inventory:Equip(owner.prevequip)
			owner.prevequip = nil
		end)
	end
end

local function TestFn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	if inst.components.fueled then
		if owner.components.sanity.current >= TUNING.BREWINGHAT_THRESHHOLD -- if we have enough sanity 
		and inst.components.fueled:GetPercent() >= (1 / TUNING.BREWINGHAT_DURABILITY) then -- and we have enough fuel
			return true
		else
			return false
		end
	else
		if owner.components.sanity.current >= TUNING.BREWINGHAT_THRESHHOLD then
			return true
		else
			return false
		end
	end
end

local function OnActivate(inst)	
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- Activation cost
	if owner.components.sanity then
		owner.components.sanity:DoDelta(-TUNING.BREWINGHAT_THRESHHOLD)
	end

	if inst.components.fueled then
		inst.components.fueled:SetPercent(inst.components.fueled:GetPercent() - (1 / TUNING.BREWINGHAT_DURABILITY))
		inst.components.fueled.currentfuel = math.floor(inst.components.fueled.currentfuel/(45 * inst.components.fueled.bonusmult)+0.5)* (45 * inst.components.fueled.bonusmult)
	end

	owner.prevequip = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

	local kidpotion = SpawnPrefab("kidpotion")
	kidpotion.sourceprefab = inst
	kidpotion.brewer = owner
	owner.components.inventory:Equip(kidpotion)
end

local function OnDeactivate(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	local hands = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

	if hands and (hands.prefab == "kidpotion" or hands.prefab == "kidpotion_throwable") then
		owner.components.inventory:DropItem(hands)
	end
end

local function KeybindUse(inst)
	inst.components.hatmagic:Use()
end

local function fn() 
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
		inst.OnEntityReplicated = function(inst) 
			inst.replica.container:WidgetSetup("brewinghat_inv") 
		end

        return inst
    end
	
    inst.AnimState:SetBank("brewinghat")
    inst.AnimState:SetBuild("brewinghat")
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

	inst:AddComponent("hatmagic")
	inst.components.hatmagic.instant = false
	inst.components.hatmagic.cooldowntime = TUNING.BREWINGHAT_COOLDOWN
	inst.components.hatmagic.activetime = 0 -- infinite, technically
	inst.components.hatmagic:SetActivateFn(OnActivate)
	inst.components.hatmagic:SetDeactivateFn(OnDeactivate)
	inst.components.hatmagic:SetTestFn(TestFn)

	if TUNING.BREWINGHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled:InitializeFuelLevel( TUNING.BREWINGHAT_DURABILITY * 45 )
		inst.components.fueled.fueltype = FUELTYPE.EXPLOSIVE -- gunpowder, 90
		inst.components.fueled.secondaryfueltype = FUELTYPE.CAVE -- slurtle slime only, 45
		inst.components.fueled.bonusmult = TUNING.BREWINGHAT_FUELMULT
		inst.components.fueled.accepting = true
		-- although technically lightbulbs and fireflies are included in CAVE fuel, we limit that using the container fuel approach
	end

	if TUNING.BREWINGHAT_INSULATION then
		inst:AddComponent("insulator")
		inst.components.insulator:SetSummer() 
		inst.components.insulator:SetInsulation(TUNING.BREWINGHAT_INSULATION)
	end

	if TUNING.BREWINGHAT_WATERPROOFNESS then
		inst:AddComponent("waterproofer")
		inst.components.waterproofer:SetEffectiveness(TUNING.BREWINGHAT_WATERPROOFNESS) 
	end

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("brewinghat_inv")
	inst.components.container.canbeopened = false
	
	inst:ListenForEvent("AbilityKey", KeybindUse)

	inst:ListenForEvent("prevequip", equiprev)

	inst:ListenForEvent("startcooling", function(inst)
		inst.components.hatmagic:Deactivate()
	end)

    return inst
end

return  Prefab("brewinghat", fn, assets, prefabs)