local assets =
{
    Asset("ANIM", "anim/firefighter_placement.zip"),
}

local prefabs = {}

local function LinkToEntity(inst, ent, scale)
	inst.entity:SetParent(ent.entity)
	inst.Transform:SetScale(scale, scale, scale)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst.entity:SetCanSleep(false)
	inst.persists = false

	inst.AnimState:SetBank("firefighter_placement")
	inst.AnimState:SetBuild("firefighter_placement")
	inst.AnimState:PlayAnimation("idle")
	
	inst.AnimState:SetLightOverride(1)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(1)
	inst.AnimState:SetAddColour(52/255, 56/255, 255/255, 0)

	inst:AddTag("CLASSIFIED")
	inst:AddTag("NOCLICK")
	inst:AddTag("placer")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst.LinkToEntity = LinkToEntity

    return inst
end

return Prefab("hkr_brewingrange1", fn, assets, prefabs)