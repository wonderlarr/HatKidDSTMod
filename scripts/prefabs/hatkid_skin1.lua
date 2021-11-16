local assets =
{
	Asset( "ANIM", "anim/hatkid_skin1.zip" ),
	Asset( "ANIM", "anim/ghost_hatkid_build.zip" ),
	
    Asset("ATLAS", "images/inventoryimages/hatkid_skin1.xml"),
    Asset("IMAGE", "images/inventoryimages/hatkid_skin1.tex"),
}

local function onbuilt(inst, builder)
	-- builder:MakeWilson()
	SetSkinsOnAnim(builder.AnimState, "hatkid_skin1", "hatkid_skin1", builder.components.skinner:GetClothing(), nil, "hatkid_skin1")
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
    inst.components.inventoryitem.imagename = "hatkid_skin1"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hatkid_skin1.xml"

	inst.OnBuiltFn = onbuilt

	return inst
end

return Prefab("hatkid_skin1", fn, assets)