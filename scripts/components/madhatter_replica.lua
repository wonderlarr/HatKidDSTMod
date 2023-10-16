
local MadHatter = Class(function(self, inst)
    self.inst = inst

    self._max = net_ushortint(self.inst.GUID, "ponmax", "ponmax_dirty")
    self._val = net_ushortint(self.inst.GUID, "ponval", "ponval_dirty")

    -- self.chainPos = 0
end)

function MadHatter:SetPons(val)
    self._val:set(val)
end

function MadHatter:SetMax(max)
    self._max:set(max)
end

function MadHatter:GetPons()
    return self._val:value()
end

function MadHatter:GetMax()
    return self._max:value()
end

function MadHatter:GetPercent()
    return self._val:value() / self._max:value()
end

function MadHatter:GetDebugString()
	return "Pons: " .. tostring(self._val:value()) .. " / " .. tostring(self._max:value())
end

return MadHatter
