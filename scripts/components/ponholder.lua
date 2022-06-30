local PonHolder = Class(function(self, inst)
    self.inst = inst

    self.max = 1000
    self.current = 0

    self.chainPos = 0

    inst:AddTag("ponholder")
end)

function PonHolder:OnRemoveFromEntity()
    self.inst:RemoveTag("ponholder")
end

function PonHolder:DoDelta(delta)
    if not type(delta) == "number" then return false end

    local old = self.current

    self.current = math.clamp(self.current + delta, 0, self.max)

    local actualDelta = self.current - old
    
    self.inst:PushEvent("pondelta", { delta = actualDelta })
    return actualDelta
end

function PonHolder:GetDebugString()
	return "Pons: " .. tostring(self.current) .. " / " .. tostring(self.max)
end

return PonHolder
