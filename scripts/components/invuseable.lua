local InvUseable = Class(function(self, inst)
    self.inst = inst

    self.onuse_fn = nil

    inst:AddTag("invuseable")
end)

function InvUseable:OnRemoveFromEntity()
    self.inst:RemoveTag("invuseable")
end

function InvUseable:SetOnUse(fn)
    self.onuse_fn = fn
end

function InvUseable:OnUse()
    self.onuse_fn(self.inst)
end

return InvUseable
