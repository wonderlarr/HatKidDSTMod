
local MadHatter = Class(function(self, inst)
    self.inst = inst

    self._max = net_ushortint(self.inst.GUID, "ponmax", "ponmax_dirty")
    self._val = net_ushortint(self.inst.GUID, "ponval", "ponval_dirty")

    self._badgemax = net_ushortint(self.inst.GUID, "badgemax", "badgemax_dirty")
    self._badgeval = net_ushortint(self.inst.GUID, "badgeval", "badgeval_dirty")
end)

function MadHatter:SetVal(val)
    self._val:set(val)
end

function MadHatter:SetMax(max)
    self._max:set(max)
end

function MadHatter:GetVal()
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

-- Badges

function MadHatter:GetBadgeVal()
    return self._badgeval:value()
end

function MadHatter:GetBadgeMax()
    return self._badgemax:value()
end

function MadHatter:SetBadgeVal(val)
    self._badgeval:set(val)
end

function MadHatter:SetBadgeMax(max)
    self._badgemax:set(max)
end

return MadHatter
