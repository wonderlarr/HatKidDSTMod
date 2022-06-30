local Pon = Class(function(self, inst)
    self.inst = inst

    self.collectable = true

    inst:AddTag("pon")
end)

function Pon:OnRemoveFromEntity()
    self.inst:RemoveTag("pon")
end


function Pon:GetDebugString()
	return "N/A"
end

return Pon
