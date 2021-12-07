local assets =
{
    Asset("ANIM", "anim/reticuleaoe.zip"),
}

local prefabs = {}

local function fn()
	local inst = CreateEntity()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	
	inst.entity:SetCanSleep(false)
	inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("reticuleaoe")
	inst.AnimState:SetBuild("reticuleaoe")
	inst.AnimState:PlayAnimation("idle")

	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGroundFixed)
	inst.AnimState:SetLayer(LAYER_WORLD_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	-- inst.AnimState:SetScale(SCALE, SCALE)	


    return inst
end

return Prefab("hkr_aoe", fn, assets, prefabs)