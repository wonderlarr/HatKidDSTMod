-- Badge component

-- Badges basically only exist as inventory items, they cannot be equipped properly. As a result, I've made my own
-- pseudo-equip system by looking for specific slots each time the item is moved.

-- local function OnPut(inst, container)
--     if container then
--         if container:HasTag("badgepack") then
--             inst.components.badge.hatpack = container
--             inst.components.badge:Equip(container:HasTag("player") and container or container.components.inventoryitem:GetGrandOwner())
--         elseif inst.components.badge.is_equipped then -- only run unequip if we havent already
--             inst.components.badge:Unequip(container:HasTag("player") and container or container.components.inventoryitem:GetGrandOwner())
--             inst.components.badge.hatpack = nil
--         end
--     end
-- end

local function OnUnequip(inst)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner then
        inst.components.badge:Unequip(owner)
    end
end

local function GetNextBadgeSlot(owner)
    if not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE1) and owner.components.madhatter.badgeslots >= 1 then
        return EQUIPSLOTS.BADGE1
    elseif not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE2) and owner.components.madhatter.badgeslots >= 2 then
        return EQUIPSLOTS.BADGE2
    elseif not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE3) and owner.components.madhatter.badgeslots >= 3 then
        return EQUIPSLOTS.BADGE3
    else
        return nil
    end
end

local Badge = Class(function(self, inst)
    self.inst = inst

    self.owner = nil
    self.hatpack = nil

    self.equip_fn = nil
    self.unequip_fn = nil

    self.is_equipped = false

    inst:AddTag("badge")

    inst:ListenForEvent("unequipped", OnUnequip)
end)

function Badge:OnRemoveFromEntity()
    self.inst:RemoveTag("badge")
end

function Badge:Equip(owner)
    if self.inst.components.equippable then
        self.inst.components.equippable.restrictedtag = nil
        local nextslot = GetNextBadgeSlot(owner)
        if nextslot then
            self.inst.components.equippable.equipslot = nextslot or EQUIPSLOTS.BADGE1
            owner.components.inventory:Equip(self.inst)
        end
    end
end

function Badge:Unequip(owner)
    self.inst.components.equippable.restrictedtag = "badgerestricted"
end

function Badge:SetOnEquip(fn)
    self.equip_fn = fn
end

function Badge:SetOnUnequip(fn)
    self.unequip_fn = fn
end

-- function Badge:OnLoad(data)
--     if self.inst.components.equippable then
--         self.inst.components.equippable.restrictedtag = data.tag
--     end
-- end

-- function Badge:OnSave()
--     return { tag = self.inst.components.equippable and self.inst.components.equippable.restrictedtag }
-- end

-- function Badge:GetDebugString()
-- 	return ""
-- end

return Badge
