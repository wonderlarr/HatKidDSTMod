local assets=
{ 
    Asset("ANIM", "anim/kidglasses.zip"),
    Asset("ANIM", "anim/kidglasses_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/kidglasses.xml"),
    Asset("IMAGE", "images/inventoryimages/kidglasses.tex"),
}

local prefabs = 
{
}


local function onfuelchange(newsection, oldsection, inst)
    if newsection <= 0 then
        --when we burn out
        local equippable = inst.components.equippable
        if equippable ~= nil and equippable:IsEquipped() then
            local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem.owner or nil
            if owner ~= nil then
                local data =
                {
                    prefab = inst.prefab,
                    equipslot = equippable.equipslot,
                    announce = "ANNOUNCE_TORCH_OUT",
                }
                inst:Remove()
                owner:PushEvent("itemranout", data)
                return
            end
        end
        inst:Remove()
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
	
	owner.AnimState:OverrideSymbol("swap_hat", "kidglasses", "swap_hat")
	
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAT_HAIR")
	
	if TUNING.KIDGLASSES_PERISHTIME ~= 1 then
		inst.components.fueled:StartConsuming()
	end
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end
end
 
local function OnUnequip(inst, owner)
	if TUNING.KIDGLASSES_PERISHTIME ~= 1 then
		inst.components.fueled:StopConsuming()
	end

	if inst.fire ~= nil then
		inst.fire:Remove()
		inst.fire = nil
	end

	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAT_HAIR")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")
	
	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
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
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst.AnimState:SetBank("kidglasses")
    inst.AnimState:SetBuild("kidglasses")
    inst.AnimState:PlayAnimation("idle")
	
    MakeHauntableLaunch(inst)
 
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidglasses"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidglasses.xml"
	
	inst:AddComponent("fueled")
	inst.components.fueled.fueltype = FUELTYPE.USAGE
	inst.components.fueled:InitializeFuelLevel( TUNING.TOPHAT_PERISHTIME * TUNING.KIDGLASSES_PERISHTIME )
	inst.components.fueled:SetDepletedFn(inst.Remove)

    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_SMALL * TUNING.KIDGLASSES_DAPPERNESS
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
 
    return inst
end

return  Prefab("kidglasses", fn, assets, prefabs)