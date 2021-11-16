local assets=
{ 
    Asset("ANIM", "anim/brewinghat.zip"),
    Asset("ANIM", "anim/brewinghat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/brewinghat.xml"),
    Asset("IMAGE", "images/inventoryimages/brewinghat.tex"),
}

local prefabs =
{
    "reticuleaoe",
    "reticuleaoeping",
    "reticuleaoehostiletarget",
}

local function OnEquip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
	owner.AnimState:OverrideSymbol("swap_hat", "brewinghat", "swap_hat")		
	

	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	-- inst.components.aoetargeting:StartTargeting()

	-- if inst.components.container ~= nil then
		-- inst.components.container:Open(owner)
	-- end
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
	-- inst.components.aoetargeting:StopTargeting()
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Close()
    -- end
end
 
local function ReticuleTargetFn()
    local player = ThePlayer
    local ground = TheWorld.Map
    local pos = Vector3()
    --Cast range is 8, leave room for error
    --4 is the aoe range
    for r = 7, 0, -.25 do
        pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
        if ground:IsPassableAtPoint(pos:Get()) and not ground:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
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

local function fn(Sim) 
    local inst = CreateEntity()

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
	
    inst.AnimState:SetBank("brewinghat")
    inst.AnimState:SetBuild("brewinghat")
    inst.AnimState:PlayAnimation("idle")
	
	MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
     
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL) 
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "brewinghat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/brewinghat.xml"
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("insulator")
    inst.components.insulator:SetSummer() 
    inst.components.insulator:SetInsulation(TUNING.INSULATION_SMALL)
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("hkr_badgeslot")
	-- inst.components.container.canbeopened = false
    -- inst:ListenForEvent("itemget", OnBadgeLoaded)
    -- inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("test", BrewingHatAbility)

    return inst
end

-- AddModRPCHandler("HatKidRPC", "GetMousePos", BrewingHatAbility)

return  Prefab("brewinghat", fn, assets, prefabs)