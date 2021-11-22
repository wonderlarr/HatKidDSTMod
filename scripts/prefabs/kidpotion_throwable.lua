local kidpotion_assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),

    Asset("SOUNDPACKAGE", "sound/brewinghat.fev"),
    Asset("SOUND", "sound/brewinghat.fsb"),
}

local holder = {
    nil,
}

local kidpotion_prefabs = {
    
} 

--I heavily dislike how I wrote this code, but it works so I'm gonna leave it for now.

local function DoExplode(self)
    local explosiverange = TUNING.BREWINGHAT_RADIUS
	-- Sounds taken and combined from A Hat in Time, I used ChemicalLowLevel.ogg and Glass_Shatter_Big.ogg. They sounded similar enough lol
	-- Sounds moved to the explosion prefab
 
    local stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1
    local totaldamage = self.explosivedamage * stacksize
 
    local x, y, z = self.inst.Transform:GetWorldPosition()
    -- Players are off limits now
    local ents = TheSim:FindEntities(x, y, z, explosiverange, nil, { "INLIMBO", "player" })

    for i, v in ipairs(ents) do
        if v ~= self.inst and v:IsValid() and not v:IsInLimbo() then
            if v.components.workable ~= nil and v.components.workable:CanBeWorked() and v:HasTag("structure") then
                v.components.workable:WorkedBy(holder, 2)
				v:PushEvent("attacked", { attacker = holder, damage = 0})
			elseif v.components.workable ~= nil and v.components.workable:CanBeWorked() then
				v.components.workable:WorkedBy(holder, self.buildingdamage)
				v:PushEvent("attacked", { attacker = holder, damage = 0})
            end

           if v:IsValid() and not v:IsInLimbo() then
 
                if v.components.combat ~= nil then
                    v.components.combat:GetAttacked(self.inst, totaldamage, nil)
					
					v.components.combat:SuggestTarget(holder)
                end
 
                v:PushEvent("explosion", { explosive = self.inst })
				v:PushEvent("attacked", { attacker = holder, damage = 0})
            end
        end
	end
end
 
local function OnExplodeFn(inst)
	SpawnPrefab("brewinghat_explode").Transform:SetPosition(inst.Transform:GetWorldPosition())
    DoExplode(inst.components.explosive)
end
 
local function OnHitSomething(inst, attacker, target)
	if inst:HasTag("NOCLICK") then
		inst.components.explosive:OnBurnt()
	end
end


 
local function onequip(inst, owner)
	-- If the equiper doesn't have the Hat Kid tag (which only hat kid has for now) then
	-- drop the item, and say a fail message.
	if owner:HasTag("player") and not owner:HasTag("hatkid") then
		inst:DoTaskInTime(0, function()
			owner.components.inventory:DropItem(inst)
			owner.components.talker:Say(GetString(player, "ACTIONFAIL_GENERIC"))
		end)
	end
	
    owner.AnimState:OverrideSymbol("swap_object", "swap_kidpotion", "swap_kidpotion")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    -- inst.components.aoetargeting:StartTargeting()
	
	holder = inst.components.inventoryitem.owner
end
 
local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	
	inst:DoTaskInTime(0, function()
		if not inst:HasTag("NOCLICK") then
			inst:Remove()
		end
	end)

    local head = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if head and head.prefab == "brewinghat" then
        head:PushEvent("prevequip")
    end

    -- inst.components.aoetargeting:StopTargeting()
end
 
local function onthrown(inst)
	if holder ~= nil and holder:HasTag("hatkid") then
		local headslot = holder.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
	
		if headslot ~= nil and headslot.prefab == "brewinghat" then
			inst:AddTag("NOCLICK")
			inst.persists = false
			
			inst.AnimState:PlayAnimation("spin_loop", true)

			inst.entity:AddDynamicShadow()
			inst.DynamicShadow:SetSize(1, 1)
			
			inst.Physics:SetMass(1)
			inst.Physics:SetCapsule(0.2, 0.2)
			inst.Physics:SetFriction(0)
			inst.Physics:SetDamping(0)
			inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
			inst.Physics:ClearCollisionMask()
			inst.Physics:CollidesWith(COLLISION.WORLD)
			inst.Physics:CollidesWith(COLLISION.OBSTACLES)
			inst.Physics:CollidesWith(COLLISION.ITEMS)
			
			if holder.SoundEmitter ~= nil then
				holder.SoundEmitter:PlaySound("brewinghat/sound/throw")
			end
		end
	end
end

local function common_fn(bank, build, anim, tag, isinventoryitem)
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
 
    if isinventoryitem then
        MakeInventoryPhysics(inst)
    else
        inst.entity:AddPhysics()
        inst.Physics:SetMass(1)
        inst.Physics:SetCapsule(0.2, 0.2)
        inst.Physics:SetFriction(0)
        inst.Physics:SetDamping(0)
        inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
        inst.Physics:ClearCollisionMask()
        inst.Physics:CollidesWith(COLLISION.WORLD)
    end
 
    if tag ~= nil then
        inst:AddTag(tag)
    end
 
    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation(anim, true)
 
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("locomotor")
 
	inst:AddComponent("complexprojectile")
	
	
 
    return inst
end

local function kidpotion_fn()
    local inst = common_fn("kidpotion", "kidpotion", "idle", "projectile", true)
 
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("explosive")
    inst.components.explosive:SetOnExplodeFn(OnExplodeFn)
    inst.components.explosive.explosivedamage = TUNING.BREWINGHAT_DAMAGE
    -- This ensures the actual explosion doesn't hurt anything, as we want to customize what the explosion does.
    inst.components.explosive.explosiverange = 0


    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BREWINGHAT_DAMAGE)
    inst.components.weapon:SetRange(8, 10)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kidpotion"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kidpotion.xml"
	inst.components.inventoryitem.cangoincontainer = false
	
	inst.components.complexprojectile:SetHorizontalSpeed(18)
	inst.components.complexprojectile:SetGravity(-65)
	inst.components.complexprojectile:SetLaunchOffset(Vector3(.25, 1, 0))
	inst.components.complexprojectile:SetOnLaunch(onthrown)
	inst.components.complexprojectile:SetOnHit(OnHitSomething)
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.BREWINGHAT_SLOWDOWN
	
    return inst
end

--Hopefully this item doesn't exist when 3.0 is out.

-- That was written when I planned on rewriting this hat, now I'm just adjusting it... sadly this item still exists.

-- Checking in again, I've decided it's for the best that this item exists, at most I might rework it to just be ammo instead of a whole item, but it's fine for now.
STRINGS.NAMES.KIDPOTION_THROWABLE = "Kid's Potion"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KIDPOTION_THROWABLE = "Throwing these will be fun!"
STRINGS.RECIPE_DESC.KIDPOTION_THROWABLE = "Explody Potion, deals AOE damage"
 
return Prefab("kidpotion_throwable", kidpotion_fn, kidpotion_assets, kidpotion_prefabs)