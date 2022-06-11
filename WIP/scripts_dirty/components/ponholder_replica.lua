local ponholder = Class(function(self, inst)
    self.inst = inst

    self.max = 100
    self.current = self.max
end)

function ponholder:SetCurrent(amount)
    self.current = amount
end

function ponholder:SetMax(amount)
    self.max = amount
    self.current = amount
end

function ponholder:DoDelta(delta)
    local old = self.current
    self.current = math.clamp(self.current + delta, 0, self.max)
end

function ponholder:GetPercent()
    return self.current / self.max
end

function ponholder:SetPercent(p)
    self.current  = p * self.max
end

return ponholder
