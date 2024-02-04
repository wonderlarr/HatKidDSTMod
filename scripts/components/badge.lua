local function OnPut(inst, container)
    if container and container:HasTag("badgepack") then
        inst.components.badge:Equip(inst.components.inventoryitem:GetGrandOwner())
    elseif inst.components.badge.is_equipped then -- only run unequip if we havent already
        inst.components.badge:Unequip(inst.components.inventoryitem:GetGrandOwner())
    end
end

local Badge = Class(function(self, inst)
    self.inst = inst

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
    if self.equip_fn ~= nil then
        self.equip_fn(self.inst, owner)
    end

    self.is_equipped = true
    self.inst:PushEvent("equipped", { owner = owner })
end

function Badge:Unequip(owner)
    if self.unequip_fn ~= nil then
        self.unequip_fn(self.inst, owner)
    end

    self.is_equipped = false
    self.inst:PushEvent("unequipped", { owner = owner })
end

function Badge:SetOnEquip(fn)
    self.equip_fn = fn
end

function Badge:SetOnUnequip(fn)
    self.unequip_fn = fn
end
-- function Badge:GetDebugString()
-- 	return ""
-- end

return Badge
