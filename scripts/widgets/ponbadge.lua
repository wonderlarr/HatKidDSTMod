local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local PonBadge = Class(Badge, function(self, owner)
    Badge._ctor(self, nil, owner, { 18/255, 152/255, 17/255, 1 }, nil, nil, nil, true)

    self.circleframe:GetAnimState():SetBank ("status_meter")
    self.circleframe:GetAnimState():SetBuild("status_meter")
    self.circleframe:GetAnimState():PlayAnimation("frame")

    self.test = self.circleframe:AddChild(UIAnim())
	self.test:GetAnimState():SetBank("pons_icon")
	self.test:GetAnimState():SetBuild("pons_icon")
	self.test:GetAnimState():PlayAnimation("idle")
    self.test:SetScale(0.5)
    self.test:SetPosition(8, -5) 

    self:StartUpdating()
end)

function PonBadge:OnUpdate(dt)

end

return PonBadge
