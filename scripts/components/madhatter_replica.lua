
local MadHatter = Class(function(self, inst)
    self.inst = inst

    self._max = net_ushortint(self.inst.GUID, "ponmax", "ponmax_dirty")
    self._val = net_ushortint(self.inst.GUID, "ponval", "ponval_dirty")

    self._badgeslotsmax = net_ushortint(self.inst.GUID, "badgeslotsmax", "badgeslotsmax_dirty")
    self._badgeslots = net_ushortint(self.inst.GUID, "badgeslots", "badgeslots_dirty")

    self._noimage = net_bool(self.inst.GUID, "noimage", "noimage_dirty")
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

function MadHatter:SetNoImage(val)
    self._noimage:set(val)
end

function MadHatter:GetNoImage()
    return self._noimage:value()
end

function MadHatter:GetDebugString()
	return "Pons: " .. tostring(self._val:value()) .. " / " .. tostring(self._max:value())
end

-- Badges

function MadHatter:GetBadgeSlots()
    return self._badgeslots:value()
end

function MadHatter:GetBadgeSlotsMax()
    return self._badgeslotsmax:value()
end

function MadHatter:SetBadgeSlots(val)
    self._badgeslots:set(val)
end

function MadHatter:SetBadgeSlotsMax(max)
    self._badgeslotsmax:set(max)
end

return MadHatter
