local assets =
{
    Asset("ANIM", "anim/pon.zip"),

    Asset("ATLAS", "images/inventoryimages/pon.xml"),
    Asset("IMAGE", "images/inventoryimages/pon.tex"),
    
    Asset("SOUNDPACKAGE", "sound/pon.fev"),
    Asset("SOUND", "sound/pon_bank01.fsb"), -- Oops, misnamed this. Oh well.
}

RegisterInventoryItemAtlas("images/inventoryimages/pon.xml","pon.tex") -- new (to me) cleaner way of doing inventory icons

local function OnPickup(inst, owner)

end

local function OnDrop(inst)

    -- There's gotta be a cleaner way to do this.
    -- inst.Physics:ClearCollisionMask()
    -- inst.Physics:CollidesWith(COLLISION.WORLD)
    -- inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:ClearCollidesWith(COLLISION.CHARACTERS)

    -- Make it possible to drop pons by clearing the pickup collision for 1.5 seconds on drop.
    inst:DoTaskInTime(1.5, function(inst)
        inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    end)

end

local function OnCollide(inst, owner)
    if owner == nil then
        -- Sometimes it seems the collission callback doesn't return the right entity, instead returning nil. We'll just return in this case
        -- It's not great that it does this but can we do much better?
        print("CRITICAL: Pon owner does not exist!")
        return
    end
    

    -- NOPICKUP is not a thing outside of my mod, don't go around using it with other things unless they specifically ALSO add it. Which will never happen.
    
    -- Also, in this case, careful using NOPICKUP, you'll be able to push the pon around a lot without receieving it.
    -- Also also, despite the name NOPICKUP only prevents the auto pickup, you can still pick it up like any other item.
    if owner ~= nil and not owner:HasTag("playerghost") and owner:HasTag("player") and not inst:HasTag("NOPICKUP") then

        if owner:HasTag("hatkid") then
            owner.lab.components.container:GiveItem(inst, nil, inst:GetPosition())
            

            -- local im = Image(data.item.replica.inventoryitem:GetAtlas(), data.item.replica.inventoryitem:GetImage())
            -- im:MoveTo(Vector3(TheSim:GetScreenPos(data.src_pos:Get())), dest_pos, .3, function() tile:Show() im:Kill() end)

            inst.removetimer = inst:DoTaskInTime(0.5, function(inst)
                -- This is a bit scuffed imo
                -- Picking up more than 1 stack worth of pons at once will cause visual issues.
                -- But this shouldn't happen without cheats hopefully. 

                -- IT CAN HAPPEN NOW OH NO
                -- Let's hope nobody notices
                inst:Remove()
            end)

            if owner.pons < TUNING.PONS_MAX then
                owner:PushEvent("GetPon", {count = inst.components.stackable:StackSize()})
            else
                inst.removetimer:Cancel()
                inst.removetimer = nil
            end


        else
            owner.components.inventory:GiveItem(inst, nil, inst:GetPosition())
        end
        
        -- if owner.components.ponholder then
        --     owner.components.ponholder:Give(1)
        --     print(owner.components.ponholder:GetPons())
        -- end
        
        --sfx, NOSFX skips all of this, including adding to the chain. 
        if not inst:HasTag("NOSFX") then

            --define owner.chain if not defined. This shouldn't happen often.
            if owner ~= nil and owner.chain == nil then
                owner.chain = 1 
            end

            -- Cancel 10 second timer if it's running already
            if owner.chaintracker ~= nil then 
                owner.chaintracker:Cancel()
                owner.chaintracker = nil
            end

            -- reset chain value to 1 after 10 seconds of not collecting pons
            owner.chaintracker = owner:DoTaskInTime(10, function(inst) 
                if owner ~= nil then
                    owner.chain = 1
                end
            end)

            -- The way these are handled in the sound bank is sub par but it works, I would have liked to use playlists but I used
            -- math here to choose which pon instead. This may be more consistent but it also feels like there's a better way.
            owner.SoundEmitter:PlaySound("pon/sound/chain" .. owner.chain)
            owner.chain = math.min(owner.chain + 1, 20) -- 20 is the maximum chain value
        end
    end
end

local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	-- inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
     
    MakeInventoryPhysics(inst)   

    inst.entity:AddPhysics()

    inst.Physics:SetCapsule(0.85, 0.85)
    inst.Physics:SetCollisionGroup(COLLISION.SMALLOBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    -- inst.Physics:SetActive(false)
    
    inst.AnimState:SetBank("pon")
    inst.AnimState:SetBuild("pon")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("pon")
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    -- Clever way to do a pickup when near
    inst.Physics:SetCollisionCallback(OnCollide)

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM -- 60 can be in an item stack, seems low, but only non-Hat-Kid's can carry this item anyway
    -- inst.components.stackable.forcedropsingle = true
  
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.canbepickedup = false
	inst.components.inventoryitem:SetOnPickupFn(OnPickup)
    inst.components.inventoryitem:SetOnDroppedFn(OnDrop)
	
	MakeHauntableLaunch(inst)
    inst.persists = false
	
    return inst
end

STRINGS.NAMES.PON = "Pon"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PON = "Ooo, shiny!"
STRINGS.RECIPE_DESC.PON = "A green collectable, used for... something?"

return  Prefab("pon", fn, assets) 