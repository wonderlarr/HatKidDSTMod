-- Badge component

-- Badges basically only exist as inventory items, they cannot be equipped properly. As a result, I've made my own
-- pseudo-equip system by looking for specific slots each time the item is moved.

local function OnPut(inst, container)
    if container then
        if container:HasTag("badgepack") then
            inst.components.badge:Equip(container:HasTag("player") and container or container.components.inventoryitem:GetGrandOwner())
        elseif inst.components.badge.is_equipped then -- only run unequip if we havent already
            inst.components.badge:Unequip(container:HasTag("player") and container or container.components.inventoryitem:GetGrandOwner())
        end
    end
end

local Badge = Class(function(self, inst)
    self.inst = inst

    self.owner = nil

    self.equip_fn = nil
    self.unequip_fn = nil

    self.is_equipped = false

    inst:AddTag("badge")

    inst:ListenForEvent("onputininventory", OnPut)
end)

function Badge:OnRemoveFromEntity()
    self.inst:RemoveTag("pon")
end

function Badge:Equip(owner)
    if self.is_equipped or not owner then return false end

    self.owner = owner

    if owner.components.madhatter then
        owner.components.madhatter:RegisterBadge(self.inst)
    end

    if self.equip_fn ~= nil then
        self.equip_fn(self.inst, owner)
    end

    self.is_equipped = true
    self.inst:PushEvent("equipped", { owner = owner })
end

function Badge:Unequip(owner)
    if not self.is_equipped or not owner then return false end

    if owner.components.madhatter then
        owner.components.madhatter:UnregisterBadge(self.inst)
    end

    if self.unequip_fn ~= nil then
        self.unequip_fn(self.inst, owner)
    end

    self.is_equipped = false
    self.inst:PushEvent("unequipped", { owner = owner })

    self.owner = nil
end

function Badge:SetOnEquip(fn)
    self.equip_fn = fn
end

function Badge:SetOnUnequip(fn)
    self.unequip_fn = fn
end

function Badge:OnLoad(data)
    OnPut(self.inst, self.inst.component.inventory:GetContainer())
end

-- function Badge:GetDebugString()
-- 	return ""
-- end

return Badge
