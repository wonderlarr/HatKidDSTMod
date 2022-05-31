-- Unfinished component for area of effect abilities
local AOE = Class(function(self, inst)
    self.inst = inst
    
    -- basic controls
    self.radius = 8 -- game units
    self.loop = false
    

    -- aoe tags
    self.musttags = {}
    self.canttags = {}
    self.mustoneoftags = {}

    self.active = false
end)

-- Goals here are to do a OnStart, OnLoop, and OnStop, using tables of functions for added flexability

function AOE:OnRemoveFromEntity()
    self.inst:StopUpdatingComponent(self)
end

-- Adds
function AOE:AddOnStartFn(fn)
    table.insert(self.onStartFns, fn)
end

function AOE:AddOnLoopFn(fn)
    table.insert(self.onLoopFns, fn)
end

function AOE:AddOnStopFn(fn)
    table.insert(self.onStopFns, fn)
end

-- Removes
function AOE:RemoveOnStartFn(fn)
    -- if not self.onStartFnsToRemove then
    --     self.onStartFnsToRemove = {}
    -- end

    -- table.insert(self.onStartFnsToRemove, fn)
    table.removearrayvalue(self.onStartFns, fn)
end

function AOE:RemoveOnLoopFn(fn)
    if not self.onLoopFnsToRemove then
        self.onLoopFnsToRemove = {}
    end

    table.insert(self.onLoopFnsToRemove, fn)
end

function AOE:RemoveOnStopFn(fn)
    -- if not self.onStopFnsToRemove then
    --     self.onStopFnsToRemove = {}
    -- end

    -- table.insert(self.onStopFnsToRemove, fn)

    table.removearrayvalue(self.onStopFns, fn)
end

--
function AOE:GetTargets()
    local pt = self.inst:GetPosition()
    return TheSim:FindEntities(pt.x,pt.y,pt.z, self.radius, self.musttags, self.canttags, self.mustoneoftags)
end

--
function AOE:OnUpdate(dt)
    -- Remove anything that needs to be removed
    -- if self.onStartFnsToRemove then
    --     for i = 1, #self.onStartFnsToRemove do
    --         local fn = self.onStartFnsToRemove[i]
    --         table.removearrayvalue(self.onStartFns, fn)
    --     end      
    --     self.onStartFnsToRemove = nil
    -- end   

    if self.onLoopFnsToRemove then
        for i = 1, #self.onLoopFnsToRemove do
            local fn = self.onLoopFnsToRemove[i]
            table.removearrayvalue(self.onLoopFns, fn)
        end      
        self.onLoopFnsToRemove = nil
    end   

    -- if self.onStopFnsToRemove then
    --     for i = 1, #self.onStopFnsToRemove do
    --         local fn = self.onStopFnsToRemove[i]
    --         table.removearrayvalue(self.onStopFns, fn)
    --     end      
    --     self.onStopFnsToRemove = nil
    -- end   


    -- iterate through loop fns and execute
	for i = #self.onLoopFns, 1, -1 do
        self.onLoopFns[i](self.inst, self:GetTargets())
    end
end

return AOE
