local assets =
{
    Asset("ANIM", "anim/pon.zip"),
    Asset("ANIM", "anim/pon_nocap.zip"),

    Asset("ATLAS", "images/inventoryimages/pon.xml"),
    Asset("IMAGE", "images/inventoryimages/pon.tex"),
    
    Asset("SOUNDPACKAGE", "sound/pon.fev"),
    Asset("SOUND", "sound/pon.fsb"),
}

RegisterInventoryItemAtlas("images/inventoryimages/pon.xml","pon.tex")

-- local function OnPickup(inst, owner)

-- end

-- local function OnDrop(inst)
--     inst.Physics:ClearCollidesWith(COLLISION.CHARACTERS)

--     -- Make it possible to drop pons by clearing the pickup collision for 1.5 seconds on drop.
--     inst:DoTaskInTime(1.5, function(inst)
--         inst.Physics:CollidesWith(COLLISION.CHARACTERS)
--     end)
-- end

local function DoSound(inst, owner)
    --define owner.ponchain if not defined. This shouldn't happen often.
    if owner and not owner.ponchain then
        owner.ponchain = 1 
    end

    -- Cancel 8 second timer if it's running already
    if owner.ponchaintracker ~= nil then 
        owner.ponchaintracker:Cancel()
        owner.ponchaintracker = nil
    end

    -- reset chain value to 1 after 7.5 seconds of not collecting pons
    owner.ponchaintracker = owner:DoTaskInTime(7.5, function(inst) 
        if owner ~= nil then
            owner.ponchain = 1
        end
    end)

    -- The way these are handled in the sound bank is sub par but it works, I would have liked to use playlists but I used
    -- math here to choose which pon instead. This may be more consistent but it also feels like there's a better way.
    owner.SoundEmitter:PlaySound("pon/sound/chain" .. owner.ponchain)
    owner.ponchain = math.min(owner.ponchain + 1, 20) -- 20 is the maximum chain value
end

local function OnCollide(inst, owner)
    if owner and owner:HasTag("hatkid") and not owner:HasTag("playerghost") then
        DoSound(inst, owner)
        if owner.components.madhatter ~= nil then
            -- Give the pon component the pons if we're hatkid
            owner.components.madhatter:DoDelta(inst.award_count or 1)

            inst:Remove()
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

    -- These DO collide, but they usually disappear as soon as they're touched, so I think its fine?
    inst.Physics:SetSphere(0.6)
    inst.Physics:SetCollisionGroup(COLLISION.SMALLOBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    -- inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    inst.Physics:SetMass(0.25)
    -- inst.Physics:SetCollides(false)
    inst.Physics:SetFriction(1)
    inst.Physics:SetDamping(0.1)
    -- inst.Physics:IsPassable(true)

    inst.DynamicShadow:SetSize(0.4, 0.4)
    
    inst.AnimState:SetBank("pon")
    inst.AnimState:SetBuild("pon")
    inst.AnimState:PlayAnimation("bob", true)
    inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())
    inst.AnimState:SetScale(1.5, 1.5)

    inst:AddTag("pon")
    
    if not TheWorld.ismastersim and ThePlayer and not ThePlayer:HasTag("hatkid") then
        inst.AnimState:SetMultColour(1,1,1,0.33)
    end
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- Clever way to do a pickup when near
    inst.Physics:SetCollisionCallback(OnCollide)
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem:SetSinks(true)

    inst:DoTaskInTime(30, function()
        inst.AnimState:PushAnimation("die", false)
        inst:ListenForEvent("animover", function()
            inst:Remove()
        end)
    end)
	
	MakeHauntableLaunch(inst)
    inst.persists = false

    inst.award_count = 1
	
    return inst
end

STRINGS.NAMES.PON = "Pon"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON = "Ooo, shiny!"
STRINGS.RECIPE_DESC.PON = "A green collectable, used for... something?"

return Prefab("pon", fn, assets)