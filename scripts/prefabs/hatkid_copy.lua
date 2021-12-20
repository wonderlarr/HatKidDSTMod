local assets =
{
	Asset( "ANIM", "anim/hatkid_copy.zip" ),
	Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	
    -- Asset("ATLAS", "images/inventoryimages/hatkid_copy.xml"),
    -- Asset("IMAGE", "images/inventoryimages/hatkid_copy.tex"),
}

local function onbuilt(inst, builder)
	-- builder:MakeWilson()
	SetSkinsOnAnim(builder.AnimState, "hatkid_copy", "hatkid_copy", builder.components.skinner:GetClothing(), nil, "hatkid_copy")
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()

	inst:AddTag("CLASSIFIED")

	inst.persists = false

	inst:DoTaskInTime(0, inst.Remove)

	if not TheWorld.ismastersim then
		return inst
	end
	
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "hatkid_copy"
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/hatkid_copy.xml"

	inst.OnBuiltFn = onbuilt

	return inst
end

return Prefab("hatkid_copy", fn, assets)