local assets =
{
    Asset("ANIM", "anim/hatbrella.zip"),
    Asset("ANIM", "anim/swap_hatbrella.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella.tex"),
	
    Asset("ATLAS", "images/inventoryimages/hatbrellaopen.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrellaopen.tex"),
}

-- local function OnBlocked(inst, data)
	-- inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	-- badge.components.armor:TakeDamage(data)
-- end

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
    --owner.AnimState:OverrideSymbol("swap_object", "swap_wands", "purplestaff")
	owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella", "hatbrella")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
end
  
local function OnUnequip(inst, owner)
	-- inst.components.useableitem:StopUsingItem()

	
    inst.components.inventoryitem.imagename = "hatbrella"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"

    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Close()
    -- end
end
 
local function Closefn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()

	-- inst:RemoveTag("open")
	
	-- Change the texture
	-- owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella", "hatbrella")
	-- inst.components.inventoryitem.imagename = "hatbrella"
	-- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"
	
	-- And the properties
	-- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL * 0.5)
	-- inst.components.weapon:SetDamage(34)
	-- inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL * 0.5)
end

local function Openfn(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	-- inst:AddTag("open")
	
	-- Change the texture
	-- owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrellaopen", "hatbrellaopen")
	-- inst.components.inventoryitem.imagename = "hatbrellaopen"
	-- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrellaopen.xml"
	
	-- And the properties
	-- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL * 3)
	-- inst.components.weapon:SetDamage(17)
	-- inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL * 2)
end
 
 
local function OnUse(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner()
	
	owner.components.inventory:Equip(SpawnPrefab("hatbrellaopen"))

	inst:DoTaskInTime(0, inst.Remove)
end
	
--[[
local function OnStop(inst)
	-- inst:RemoveTag("open")
    inst.components.inventoryitem.imagename = "hatbrella"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"
	
	-- local owner = inst.components.inventoryitem:GetGrandOwner()
	-- owner.components.talker:Say("Use disabled cause crash")
	
	-- inst.components.useableitem:SetOnUseFn(OnUse)
end
]]

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


local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("hatbrella")
    inst.AnimState:SetBuild("hatbrella")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("hkr_wbadgeslot") end
        return inst
    end
 
    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hatbrella"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
    -- inst:AddComponent("waterproofer")	
    -- inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL * 1.5)

    -- inst:AddComponent("insulator")
    -- inst.components.insulator:SetSummer()
    -- inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(OnUse)
	-- inst.components.useableitem:StopUsingItem(OnStop)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_wbadgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	MakeHauntableLaunch(inst)
	
    return inst
end


return  Prefab("hatbrella", fn, assets) 