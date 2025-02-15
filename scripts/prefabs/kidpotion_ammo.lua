local kidpotion_assets = {
    Asset("ATLAS", "images/inventoryimages/kidpotion_ammo.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion_ammo.tex"),

}

RegisterInventoryItemAtlas("images/inventoryimages/kidpotion_ammo.xml","kidpotion_ammo.tex")

local function kidpotion_fn()
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("kidpotion")
    inst.AnimState:SetBuild("kidpotion")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("brewinghat_ammo") -- tag used in brewinghat container testfn

    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "kidpotion"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM -- 20 can be in an item stack

    return inst
end
 
return Prefab("kidpotion_ammo", kidpotion_fn, kidpotion_assets)