local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local PonBadge = Class(Badge, function(self, owner)
    --         (self, anim, owner, tint, iconbuild, circular_meter, use_clear_bg, dont_update_while_paused)
    Badge._ctor(self, nil, owner, { 18/255, 122/255, 17/255, 1 }, nil, true, nil, true)

    self.circleframe:GetAnimState():SetBank ("status_meter")
    self.circleframe:GetAnimState():SetBuild("status_meter")
    self.circleframe:GetAnimState():PlayAnimation("frame")

    
    self.year_hand = self.underNumber:AddChild(UIAnim())
    self.year_hand:GetAnimState():SetBank("status_oldage")
    self.year_hand:GetAnimState():SetBuild("status_oldage")
	self.year_hand:GetAnimState():PlayAnimation("year")
    self.year_hand:GetAnimState():AnimateWhilePaused(false)

    self.days_hand = self.underNumber:AddChild(UIAnim())
    self.days_hand:GetAnimState():SetBank("status_oldage")
    self.days_hand:GetAnimState():SetBuild("status_oldage")
	self.days_hand:GetAnimState():PlayAnimation("day")
    self.days_hand:GetAnimState():AnimateWhilePaused(false)

    self.ponicon = self.circleframe:AddChild(UIAnim())
	self.ponicon:GetAnimState():SetBank("pon_nocap")
	self.ponicon:GetAnimState():SetBuild("pon_nocap")
	self.ponicon:GetAnimState():PlayAnimation("idle")
    self.ponicon:SetScale(0.6)
    -- self.ponicon:SetPosition(22.5, -67) 
end)


-- function PonBadge:SetPercent(val, max, penaltypercent)
-- 	local age_precent = 1 - val
-- 	local age = TUNING.WANDA_MIN_YEARS_OLD + age_precent * (TUNING.WANDA_MAX_YEARS_OLD - TUNING.WANDA_MIN_YEARS_OLD)
	
-- 	self.health_precent = val

-- 	self.num:SetString(tostring(math.floor(age + 0.5)))

-- 	local badge_max = TUNING.WANDA_MAX_YEARS_OLD - TUNING.WANDA_MIN_YEARS_OLD

--     self.year_hand:SetRotation( Lerp(0, 360, age_precent) )
-- end


return PonBadge
