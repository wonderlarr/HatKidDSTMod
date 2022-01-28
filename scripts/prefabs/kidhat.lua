local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
	Asset("ANIM", "anim/quagmire_ui_pot_1x3.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}


RegisterInventoryItemAtlas("images/inventoryimages/kidhat.xml","kidhat.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_niko.xml","kidhat_dye_niko.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_toonlink.xml","kidhat_dye_toonlink.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kidhat_dye_pinkdanger.xml","kidhat_dye_pinkdanger.tex")

local badge = nil

-- local holder = nil

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
		-- print("Previous Owner found")
		-- print(data.PrevOwner.prefab)
		-- dumptable(data.PrevOwner,1,1)
	end
end

local function aura()
	return 1
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_hat", inst.AnimState:GetBuild(), "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end

	-- inst:AddComponent("sanityaura")
	-- inst.components.sanityaura.max_distsq = TUNING.HATKID_AURASIZE
    -- inst.components.sanityaura.aura = -TUNING.HATKID_AURARATE
	-- inst.components.sanityaura.fallofffn = aura

	-- holder = owner

	-- inst.lab = SpawnPrefab("researchlab")
	-- inst.lab.Transform:SetScale(0, 0, 0)
	-- inst.lab.Physics:ClearCollisionMask()
	-- inst.lab.SoundEmitter:SetMute(true)

	-- inst.lab.entity:SetParent(inst.entity)

	-- inst.test = "asdf"

	-- if inst._test ~= nil then
	-- 	inst.test = inst._test:GetSaveRecord()
	-- end
	
	--Hat Badge Slot
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
	-- print(owner.AnimState:GetSkinBuild())
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

	-- inst:RemoveComponent("sanityaura")

	-- inst:DoTaskInTime(0, function(inst)
	-- 	inst.lab:Remove()
	-- end)
	
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Close()
    -- end
end
 

 
local function OnEmpty(inst)
	inst:DoTaskInTime(0, inst.Remove)
end

local function onDrop(inst)

end

local function OnUse(inst)
	local owner = inst.components.inventoryitem.owner

	if inst.components.container then 
		if inst.components.container:IsOpenedBy(owner) then
			inst.components.container:Close(owner)
		else
			inst.components.container:Open(owner)
		end

	end

	inst:DoTaskInTime(0, function(inst) -- Wait 1 frame or else things get weird
		inst.components.useableitem:StopUsingItem()
	end)
end

-- local function OnLoad(inst, data)

-- end

local function OnSave(inst, data)
end

local function KeybindUse(inst)
	-- local owner = inst.components.inventoryitem.owner
	inst.components.useableitem:StartUsingItem()
end

local containers = require("containers")

-- local oldwidgetsetup = containers.widgetsetup

params = containers.params

params.badge_chest =
{
    widget =
    {
        slotpos =
        {
            Vector3(0, 64 + 8, 0),
            Vector3(0, 0, 0),
            Vector3(0, -(64 + 8), 0),
        },
        animbank = "quagmire_ui_pot_1x3",
        animbuild = "quagmire_ui_pot_1x3",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100,
    },
    acceptsstacks = false,
    type = "chest",
}

local function OnPickedUp(inst)
	print("it's time woooo 7 grand dad")
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
        inst.OnEntityReplicated = function(inst) 
            inst.replica.container:WidgetSetup("badge_chest") 
        end

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
    -- inst.components.inventoryitem.imagename = "kidhat"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/kidhat.xml"
	-- inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPickedUp)
	 
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "hatkid"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 1.5
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("badge_chest")
	inst.components.container.canbeopened = false

	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(OnUse)
    -- inst.components.useableitem:SetOnStopUseFn(OnStopUse)

	if TUNING.KIDHAT_DURABILITY then
		inst:AddComponent("fueled")
		inst.components.fueled.fueltype = FUELTYPE.USAGE
		inst.components.fueled:InitializeFuelLevel( TUNING.KIDHAT_DURABILITY ) -- add tuning 2 hours 7200
		inst.components.fueled:SetDepletedFn(OnEmpty)
	end

	inst:ListenForEvent("AbilityKey", KeybindUse)

	
	-- inst:AddComponent("insulator")
    -- inst.components.insulator:SetWinter()
    -- inst.components.insulator:SetInsulation(TUNING.INSULATION_TINY * TUNING.KIDHAT_INSULATION)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("armordamaged", OnBlocked, inst)

	-- inst:DoPeriodicTask(0.1, function(inst)
	-- 	-- inst.AnimState:SetMultColour(1,1,1,1)
	-- 	print(inst.AnimState:GetMultColour())
	-- end)

	-- inst.OnLoad = onload
	-- inst.OnSave = OnSave
	
    return inst
end

local function fn_dye_niko()
	local inst = fn()

	inst.AnimState:SetBuild("kidhat_dye_niko")

	return inst

end

local function fn_dye_toonlink()
	local inst = fn()

	inst.AnimState:SetBuild("kidhat_dye_toonlink")

	return inst

end

local function fn_dye_pinkdanger()
	local inst = fn()

	inst.AnimState:SetBuild("kidhat_dye_pinkdanger")

	return inst

end

return  Prefab("kidhat", fn, assets, prefabs),
CreateModPrefabSkin("kidhat_dye_niko",
{
	assets = {
		Asset("ANIM", "anim/kidhat_dye_niko.zip"),
		Asset("ATLAS", "images/inventoryimages/kidhat_dye_niko.xml"),
		Asset("IMAGE", "images/inventoryimages/kidhat_dye_niko.tex"),
	},
	base_prefab = "kidhat",
	fn = fn_dye_niko,
	rarity = "Timeless",
	reskinable = true,
	
	build_name_override = "kidhat_dye_niko",
	
	type = "item",
	skin_tags = { },
	release_group = 0,
}),
CreateModPrefabSkin("kidhat_dye_toonlink",
{
	assets = {
		Asset("ANIM", "anim/kidhat_dye_toonlink.zip"),
		Asset("ATLAS", "images/inventoryimages/kidhat_dye_toonlink.xml"),
		Asset("IMAGE", "images/inventoryimages/kidhat_dye_toonlink.tex"),
	},
	base_prefab = "kidhat",
	fn = fn_dye_toonlink,
	rarity = "Timeless",
	reskinable = true,
	
	build_name_override = "kidhat_dye_toonlink",
	
	type = "item",
	skin_tags = { },
	release_group = 0,
}),
CreateModPrefabSkin("kidhat_dye_pinkdanger",
{
	assets = {
		Asset("ANIM", "anim/kidhat_dye_pinkdanger.zip"),
		Asset("ATLAS", "images/inventoryimages/kidhat_dye_pinkdanger.xml"),
		Asset("IMAGE", "images/inventoryimages/kidhat_dye_pinkdanger.tex"),
	},
	base_prefab = "kidhat",
	fn = fn_dye_pinkdanger,
	rarity = "Timeless",
	reskinable = true,
	
	build_name_override = "kidhat_dye_pinkdanger",
	
	type = "item",
	skin_tags = { },
	release_group = 0,
})