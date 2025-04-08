require "behaviours/wander"
require "behaviours/faceentity"
local BrainCommon = require("brains/braincommon")

local times =
{
    minwalktime = 1,
    randwalktime = 1,
    minwaittime = 5,
    randwaittime = 5,
}

local MAX_WANDER_DIST = 5

local UPDATE_RATE = 0.25

local function GetFaceTargetFn(inst)
    return next(inst.components.prototyper.doers)
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.prototyper.doers[target]
end

local BadgesellerBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)


function BadgesellerBrain:OnStart()
    local root =
    PriorityNode({
        FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
        Wander(self.inst, function() return self.inst.components.knownlocations:GetLocation("home") end, MAX_WANDER_DIST, times),
    }, UPDATE_RATE)
    self.bt = BT(self.inst, root)
end

return BadgesellerBrain