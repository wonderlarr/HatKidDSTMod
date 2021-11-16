local assets=
{ 
    Asset("ANIM", "anim/kidhat.zip"),
    Asset("ANIM", "anim/kidhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidhat.xml"),
    Asset("IMAGE", "images/inventoryimages/kidhat.tex"),
}

local badge = nil

local prefabs = 
{
}

local function OnBlocked(inst) 
	if badge ~= nil then
		inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
		if inst.components.armor ~= nil and badge.components.armor ~= nil then
			local hatpercent = inst.components.armor:GetPercent()
			badge.components.armor:SetPercent(hatpercent)
			print(data)
		end
	end
end

local function OnEquip(inst, owner)
	if not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			--electricity effect, not used but maybe in the future
			local x, y, z = inst.Transform:GetWorldPosition()
			--SpawnPrefab("explode_small").Transform:SetPosition(x, y - .5, z)
			
			if owner:HasTag("player") then
				if owner.prefab=="wx78" then
					owner.components.talker:Say("ERROR: READ-ONLY HAT")		
				elseif owner.prefab=="wendy" then
					-- Wendy is also a little girl, changing the line a little.
					owner.components.talker:Say("I wasn't really gonna do it.")		
				elseif owner.prefab=="wes" then
					--Nothing, since Wes doesn't talk
					owner.components.talker:Say("")
				elseif owner.prefab=="wilbur" then
					-- Wilbur is monkee
					owner.components.talker:Say("Ooo")
				else
					owner.components.talker:Say("I wouldn't steal from a little girl!")	
				end					
				return
			end	
		end)
		return
	end
	owner.AnimState:OverrideSymbol("swap_hat", "kidhat", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
	
	owner:ListenForEvent("attacked", OnBlocked, inst)
	
	--Hat Badge Slot
	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
	end
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
	
	if inst.components.container ~= nil then
        inst.components.container:Close()
    end
end
 
local function OnBadgeLoaded(inst, data)
	if data ~= nil and data.item ~= nil then
		if data.item.prefab == "hkr_badge_football" then
			inst:AddComponent("armor")
			inst.components.armor:InitCondition(TUNING.ARMORWOOD, TUNING.ARMORWOOD_ABSORPTION)
			badge = data.item
		end
	end
end

local function OnBadgeUnloaded(inst, data)
	if data ~= nil and data.item ~= nil then
		if data.item.prefab == "hkr_badge_football" and inst.components.armor ~= nil then
			inst:RemoveComponent("armor")
		end
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
		inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("hkr_badgeslot") end
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
	 
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY * 3
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetWinter()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_TINY * TUNING.KIDHAT_INSULATION)
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("hkr_badgeslot")
	inst.components.container.canbeopened = false
    inst:ListenForEvent("itemget", OnBadgeLoaded)
    inst:ListenForEvent("itemlose", OnBadgeUnloaded)
	
	-- inst:ListenForEvent("blocked", OnBlocked, inst)
	
    return inst
end
return  Prefab("hkr_kidhat_armor", fn, assets, prefabs)