local assets =
{

}

local function DoSound(inst, owner)
    --define owner.ponchain if not defined. This shouldn't happen often.
    if owner and not owner.ponchain then
        owner.ponchain = 1 
    end

    -- Cancel 3 second timer if it's running already
    if owner.ponchaintracker ~= nil then 
        owner.ponchaintracker:Cancel()
        owner.ponchaintracker = nil
    end

    -- reset chain value to 1 after 3 seconds of not collecting pons
    owner.ponchaintracker = owner:DoTaskInTime(3, function(inst) 
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
	-- inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddPhysics()

    -- Custom physics profile for pons since they function weirdly
    inst.Physics:SetMass(1)
    inst.Physics:SetFriction(1)
    inst.Physics:SetDamping(0)
    inst.Physics:SetRestitution(.5)
    inst.Physics:SetCollisionGroup(COLLISION.SMALLOBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    -- inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    inst.Physics:SetSphere(0.9)

    inst.DynamicShadow:SetSize(0.6, 0.6)
    
    inst.AnimState:SetBank("pon")
    inst.AnimState:SetBuild("pon")
    inst.AnimState:PlayAnimation("bob", true)
    inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())
    inst.AnimState:SetScale(2, 2)
    inst.AnimState:SetHaunted(true)

    MakeInventoryFloatable(inst, "small", 0.1, 0.8) -- Makes items float on water, rather than just sitting there.

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

    inst:DoTaskInTime(240, function()
        inst.AnimState:PushAnimation("die", false)
        inst:ListenForEvent("animover", function()
            inst:Remove()
        end)
    end)
	
	MakeHauntableLaunch(inst)
    inst.persists = false

    inst.award_count = 50
	
    return inst
end

STRINGS.NAMES.PON_BOSS = "Pon"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON_BOSS = "Ooo, shiny!"

return Prefab("pon_boss", fn, assets)