local assets =
{
    Asset("ANIM", "anim/swordsdance.zip"),
}

-- Called whenever a physics collision occurs with a player
local function OnCollide(inst, body)
	if not body then return end

	local damage = 10
	local active_immunity = 1 -- seconds
	
	-- Deal damage, then add to the immunity table
	if body.components.combat and not inst.local_immune[body.GUID] then
		inst.local_immune[body.GUID] = true
		body.components.combat:GetAttacked(inst.orbit or inst, damage, inst)
	end
	
	-- Remove immunity after some time
	inst:DoTaskInTime(active_immunity, function()
		inst.local_immune[body.GUID] = nil
	end)
end

local function fxfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	-- inst.entity:AddFollower()
	inst.entity:AddNetwork()

	inst:AddTag("FX")

	inst.AnimState:SetBank("nightmaresword")
	inst.AnimState:SetBuild("nightmaresword")
	inst.AnimState:PlayAnimation("idle")
	--inst.AnimState:SetMultColour(1, 1, 1, .6)

	--inst:AddComponent("highlightchild")

	inst.entity:AddPhysics()

	inst.Physics:SetSphere(0.6) -- Adjust this size to adjust the hitbox of the sword
	inst.Physics:SetMass(0) -- Disable gravity
	inst.Physics:SetCollides(false) -- Turns off solid collisions, so we don't move stuff on accident.
	inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES) -- CollisionGroup is what we are, CollisionMask is what we're detecting. OBSTACLES is used here as it collides with most grounded enemies by default.
	inst.Physics:SetCollisionMask(COLLISION.CHARACTERS, COLLISION.GIANTS, COLLISION.FLYERS)
	inst.Physics:SetCollisionCallback(OnCollide) -- Callback to above damage function

	inst.local_immune = {}

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("colouradder")
	
	inst.persists = false

	return inst
end

return Prefab("swordsdance_fx", fxfn, assets)
