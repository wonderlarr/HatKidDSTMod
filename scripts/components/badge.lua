local function OnPut(inst, container)
    if container and container:HasTag("badgepack") then
        inst.components.badge:AddEffect()
    else
        inst.components.badge:RemoveEffect()
    end
end

local Badge = Class(function(self, inst)
    self.inst = inst

    self.owner = nil

    inst:AddTag("badge")

    inst:ListenForEvent("onputininventory", OnPut)
end)

function Badge:OnRemoveFromEntity()
    self.inst:RemoveTag("pon")
end

function Badge:AddEffect()
    self.owner = self.inst.components.inventoryitem:GetGrandOwner()

    if self.owner and self.owner.components.health then
        self.owner.components.health:SetMaxHealth(self.owner.components.health.maxhealth + 50)
    end
end

function Badge:RemoveEffect()
    if self.owner and self.owner.components.health then
        self.owner.components.health:SetMaxHealth(self.owner.components.health.maxhealth - 50)
    end
end

-- function Badge:GetDebugString()
-- 	return ""
-- end

return Badge
