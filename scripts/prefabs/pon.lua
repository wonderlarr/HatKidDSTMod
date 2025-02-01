local assets =
{
    Asset("ANIM", "anim/pon.zip"),
    Asset("ANIM", "anim/pon_nocap.zip"),

    Asset("ATLAS", "images/inventoryimages/pon.xml"),
    Asset("IMAGE", "images/inventoryimages/pon.tex"),
    
    Asset("SOUNDPACKAGE", "sound/pon.fev"),
    Asset("SOUND", "sound/pon_bank01.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/pon.xml","pon.tex")

local function OnPickup(inst, owner)

end

local function OnDrop(inst)
    inst.Physics:ClearCollidesWith(COLLISION.CHARACTERS)

    -- Make it possible to drop pons by clearing the pickup collision for 1.5 seconds on drop.
    inst:DoTaskInTime(1.5, function(inst)
        inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    end)

    -- inst.AnimState:SetMultColour(0.2,0.2,1,1)
end

local function DoSound(inst, owner)
    --define owner.chain if not defined. This shouldn't happen often.
    if owner and not owner.chain then
        owner.chain = 1 
    end

    -- Cancel 8 second timer if it's running already
    if owner.chaintracker ~= nil then 
        owner.chaintracker:Cancel()
        owner.chaintracker = nil
    end

    -- reset chain value to 1 after 8 seconds of not collecting pons
    owner.chaintracker = owner:DoTaskInTime(8, function(inst) 
        if owner ~= nil then
            owner.chain = 1
        end
    end)

    -- The way these are handled in the sound bank is sub par but it works, I would have liked to use playlists but I used
    -- math here to choose which pon instead. This may be more consistent but it also feels like there's a better way.
    owner.SoundEmitter:PlaySound("pon/sound/chain" .. owner.chain)
    owner.chain = math.min(owner.chain + 1, 20) -- 20 is the maximum chain value
end

local function OnCollide(inst, owner)
    if not owner then return end

    if not owner:HasTag("playerghost") and owner:HasTag("player") then
        DoSound(inst, owner)
        if owner.components.madhatter ~= nil and owner.components.madhatter:GetPercent() < 1 then
            -- Give the pon component the pons if we're hatkid
            owner.components.madhatter:DoDelta(inst.components.stackable:StackSize() or 1)

            inst:Remove()
        else
            -- otherwise just give it as an item
            owner.components.inventory:GiveItem(inst, nil, inst:GetPosition())
        end 
    end
end

local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
     
    MakeInventoryPhysics(inst)   

    inst.entity:AddPhysics()

    inst.Physics:SetSphere(0.6)
    inst.Physics:SetCollisionGroup(COLLISION.SMALLOBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    inst.Physics:SetMass(0)

    inst.DynamicShadow:SetSize(0.75, 0.75)
    
    inst.AnimState:SetBank("pon")
    inst.AnimState:SetBuild("pon")
    inst.AnimState:PlayAnimation("bob", true)
    inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())
    inst.AnimState:SetScale(1, 1)

    inst:AddTag("pon")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- Clever way to do a pickup when near
    inst.Physics:SetCollisionCallback(OnCollide)

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM -- 60 can be in an item stack
    -- inst.components.stackable.forcedropsingle = true
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPickupFn(OnPickup)
    inst.components.inventoryitem:SetOnDroppedFn(OnDrop)
	
	MakeHauntableLaunch(inst)
    inst.persists = false
	
    return inst
end

STRINGS.NAMES.PON = "Pon"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON = "Ooo, shiny!"
STRINGS.RECIPE_DESC.PON = "A green collectable, used for... something?"

return Prefab("pon", fn, assets) 