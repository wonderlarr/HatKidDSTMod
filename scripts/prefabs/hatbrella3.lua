local assets =
{
    Asset("ANIM", "anim/hatbrella3.zip"),
    Asset("ANIM", "anim/swap_hatbrella3.zip"),
    Asset("ATLAS", "images/inventoryimages/hatbrella3.xml"),
    Asset("IMAGE", "images/inventoryimages/hatbrella3.tex"),
}

local prefabs =
{
    "fireball_projectile",
    "fireball_cast_fx",
    "lavaarena_meteor",
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
	
    --owner.AnimState:OverrideSymbol("swap_object", "swap_wands", "purplestaff")
	owner.AnimState:OverrideSymbol("swap_object", "swap_hatbrella3", "swap_hatbrella3")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	-- if inst.components.container ~= nil then
        -- inst.components.container:Open(owner)
    -- end
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	
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

local function cdr(inst)
	local owner = inst.components.inventoryitem.owner
	if owner then
		owner.components.timer:StopTimer("hat_cooldown")
	end
end
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("hatbrella3")
    inst.AnimState:SetBuild("hatbrella3")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")
	inst:AddTag("waterproofer")
	
    inst:AddComponent("waterproofer")	
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_HUGE)

    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)	

	inst:AddComponent("aoetargeting")
    inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoe"
    inst.components.aoetargeting.reticule.pingprefab = "reticuleaoeping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
		-- inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("slingshot") end
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.HATBRELLA3_DAMAGE)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hatbrella3"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatbrella3.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	-- inst:AddComponent("container")
    -- inst.components.container:WidgetSetup("slingshot")
	-- inst.components.container.canbeopened = false
	
	inst:DoPeriodicTask(1, cdr, nil, inst)
	
	MakeHauntableLaunch(inst)
	
    return inst
end

return  Prefab("hatbrella3", fn, assets) 