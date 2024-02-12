-- Badge component

local function OnUnequip(inst)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner then
        inst.components.badge:Unequip(owner)
    end
end

local function GetNextBadgeSlot(owner)
    if not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE1) and owner.components.madhatter.badgeslots >= 1 then
        return {slot = EQUIPSLOTS.BADGE1, num = 1}
    elseif not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE2) and owner.components.madhatter.badgeslots >= 2 then
        return {slot = EQUIPSLOTS.BADGE2, num = 2}
    elseif not owner.components.inventory:GetEquippedItem(EQUIPSLOTS.BADGE3) and owner.components.madhatter.badgeslots >= 3 then
        return {slot = EQUIPSLOTS.BADGE3, num = 3}
    else
        return nil
    end
end

local Badge = Class(function(self, inst)
    self.inst = inst
    self.owner = nil

    self.isequipped = false

    inst:AddTag("badge")

    -- inst:ListenForEvent("unequipped", OnUnequip)

    self.loading = true
    self.inst:DoTaskInTime(0, function()
        self.loading = nil
    end)
end)

function Badge:OnRemoveFromEntity()
    self.inst:RemoveTag("badge")
end

function Badge:Equip(owner)
    if owner and self.inst.components.equippable then
        local nextslot = GetNextBadgeSlot(owner)
        if nextslot then
            self.inst.components.equippable.restrictedtag = nil
            self.inst.components.equippable.equipslot = nextslot.slot
            self.inst.components.equippable:SetPreventUnequipping(true)
            owner.components.inventory:Equip(self.inst)

            self.isequipped = true
        end
    end
end

function Badge:Unequip(owner)
    self.inst.components.equippable.restrictedtag = "badgerestricted"
    self.inst.components.equippable:SetPreventUnequipping(false)
    local item = owner.components.inventory:Unequip(self.inst.components.equippable.equipslot, true) -- inventory unequip goes by slot, not by item
    if item ~= nil then
        owner.components.inventory:GiveItem(item, nil, owner:GetPosition())
    end

    self.isequipped = false
end

return Badge
