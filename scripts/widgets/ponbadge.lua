local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local PonBadge = Class(Badge, function(self, owner)
    --         (self, anim, owner, tint, iconbuild, circular_meter, use_clear_bg, dont_update_while_paused)
    Badge._ctor(self, nil, owner, { 18/255, 122/255, 17/255, 1 }, nil, true, nil, true)

    self.circleframe:GetAnimState():SetBank ("status_meter")
    self.circleframe:GetAnimState():SetBuild("status_meter")
    self.circleframe:GetAnimState():PlayAnimation("frame")

    self.ponicon = self.circleframe:AddChild(UIAnim())
	self.ponicon:GetAnimState():SetBank("pon")
	self.ponicon:GetAnimState():SetBuild("pon")
	self.ponicon:GetAnimState():PlayAnimation("idle")
    self.ponicon:SetScale(0.8)
    -- self.ponicon:SetPosition(22.5, -67) 
end)

return PonBadge
