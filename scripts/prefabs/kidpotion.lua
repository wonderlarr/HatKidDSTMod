local kidpotion_assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),
}

local kidpotion_prefabs = 
{
    "kidpotion_throwable",
}
 
local function onequip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
    owner.AnimState:OverrideSymbol("swap_object", "swap_kidpotion", "swap_kidpotion")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    inst.SoundEmitter:PlaySound("kidpotion/sound/shake", "flask_shake")
	
	inst.components.rechargeable:Discharge(TUNING.BREWINGHAT_CHARGETIME)
	
	-- holder = inst.components.inventoryitem.owner
end
 
local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	
    inst.SoundEmitter:PlaySound("kidpotion/sound/shake", "flask_shake")
	-- inst:DoTaskInTime(0, owner.components.inventory:DropItem(inst))
	
end

local function onDrop(inst)
	-- if not inst:HasTag("used") then
		-- put hat into cooldown
	-- end
	inst:Remove()
end
 

local function OnCharged(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	local slot = owner.components.inventory:GetItemSlot(inst)
	
	-- owner.components.inventory:GiveItem(SpawnPrefab("kidpotion_throwable"), slot)
	inst:AddTag("used")
	owner.components.inventory:Equip(SpawnPrefab("kidpotion_throwable"))
	
end

local function kidpotion_fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("kidpotion")
    inst.AnimState:SetBuild("kidpotion")
    inst.AnimState:PlayAnimation("idle")

    -- inst:AddComponent("reticule")
    -- inst.components.reticule.targetfn = ReticuleTargetFn
    -- inst.components.reticule.ease = true
	
    -- inst:AddComponent("aoetargeting")
    -- inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoe"
    -- inst.components.aoetargeting.reticule.pingprefab = "reticuleaoeping"
    -- inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    -- inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    -- inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    -- inst.components.aoetargeting.reticule.ease = true
    -- inst.components.aoetargeting.reticule.mouseenabled = true
 
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8, 10)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"
	inst.components.inventoryitem:SetOnDroppedFn(onDrop)
	inst.components.inventoryitem.cangoincontainer = false
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.BREWINGHAT_SLOWDOWN
	
	inst:AddComponent("rechargeable")
	-- inst.components.rechargeable:SetOnDischargedFn(OnDischarged)
	inst.components.rechargeable:SetOnChargedFn(OnCharged)
	
	
    return inst
end

--Hopefully this item doesn't exist when 3.0 is out.

-- That was written when I planned on rewriting this hat, now I'm just adjusting it... sadly this item still exists.

-- Checking in again, I've decided it's for the best that this item exists, at most I might rework it to just be ammo instead of a whole item, but it's fine for now.
STRINGS.NAMES.KIDPOTION = "Kid's Potion"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION = "Throwing these will be fun!"
STRINGS.RECIPE_DESC.KIDPOTION = "Explody Potion, deals AOE damage"
 
return Prefab("kidpotion", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)