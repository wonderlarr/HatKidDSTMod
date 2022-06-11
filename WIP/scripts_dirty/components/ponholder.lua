local function onmax(self, max)
    self.inst.replica.ponholder:SetMax(max)
end

local function oncurrent(self, current)
    self.inst.replica.ponholder:SetCurrent(current)
end

local ponholder = Class(function(self, inst)
    self.inst = inst

    self.max = 100
    self.current = self.max
end,
nil,
{
    max = onmax,
    current = oncurrent,
})

function ponholder:OnSave()
    return self.current ~= self.max and { ponholder = self.current } or nil
end

function ponholder:OnLoad(data)
    if data.ponholder ~= nil and self.current ~= data.ponholder then
        self.current = data.ponholder
        self:DoDelta(0)
    end
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
