local assets =
{
    Asset("ANIM", "anim/hatbrella.zip"),
    Asset("ANIM", "anim/swap_hatbrella.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella.tex"),
}

local function OnBlocked(inst, data)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
	badge.components.armor:TakeDamage(data)
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
					owner.components.talker:Say("ERROR: READ-ONLY UMBRELLA")		
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
	owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella", "hatbrella")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

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
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hatbrella2"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella2.xml"
	
	MakeHauntableLaunch(inst)
	
    return inst
end


return  Prefab("hatbrella", fn, assets) 