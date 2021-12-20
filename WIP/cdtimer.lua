local Screen = require "widgets/screen"
local Widget = require "widgets/widget"
local Templates = require "widgets/templates"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"

local function dround(num) -- Messy way to round in a specific way for the segment system. Will remove if segment system doesn't make it to release, if I remember.
	if num then
		if num >= 0 then 
			return math.ceil(num) 
		else
			return math.floor(num) 
		end
	end
end

local CdTimer = Class(Widget, function(self)
  Widget._ctor(self, "cdtimer")
  
  local owner = ThePlayer
    
  
  -- Set the inital position for all our future elements
  self.proot = self:AddChild(Widget("ROOT"))
  self.proot:SetVAnchor(ANCHOR_TOP)
  self.proot:SetHAnchor(ANCHOR_LEFT)
  self.proot:SetPosition(48, -48, 0)
  self.proot:SetScaleMode(SCALEMODE_PROPORTIONAL)
  
  self.title = self.proot:AddChild(Text(BODYTEXTFONT, 24, ""))
  self.title:SetPosition(4, -36)
  
  
  self.ready = self.proot:AddChild(Text(BODYTEXTFONT, 24, "Ready!"))
  self.ready:SetPosition(4, -36)
  
  -- I swear, I'm going to insane writing this. The code works fine, maybe. I can't tell because everytime the autocompiler compiles my scml files, they screw up
  -- and don't animate correctly afterwards. I've been at this for hours trying to fix this after I got the perfect animation, and now I can't use it.
  -- I made a post on the forums, so hopefully someone can help me end my suffering. 
  
  -- If it gets solved, I'll consider cleaning up this code, lol.
  
	self.test = self.proot:AddChild(UIAnim())
	self.test:GetAnimState():SetBank("cdmeter")
	self.test:GetAnimState():SetBuild("cdmeter")
	self.test:GetAnimState():PlayAnimation("cooldown")
	-- self.test:GetAnimState():SetPercent("cooldown", 0)
	self.test:SetPosition(0, 0) 
	-- self.test:SetScale(7/10)
  
  --Text stuff
	if owner then
		if owner.prefab == "hatkid" then
			self:StartUpdating()
		else
			self:Hide()
		end  
	end
  
end)

local function round(num) --Stole this from an official lua guide, not just DST. Very useful.
	if num >= 0 then 
		return math.floor(num+.5) 
	else 
		return math.ceil(num-.5) 
	end
end

function CdTimer:OnUpdate(dt)
	local owner = ThePlayer
	
	local cdnum = owner.hatcooldown
	local cdmax = 90
	local cdstring = ""
	local cdsegment = 0
	
	--
	self.test:Show()
	
	if cdnum == 0 then
		self.title:Hide()
		self.ready:Show()
	else
		self.title:Show()
		self.ready:Hide()
		self.test:GetAnimState():SetPercent("cooldown", 25)
	end
	
	if cdnum < 60 then -- If 60 seconds or under, only say seconds.
		cdstring = tostring(cdnum)
	else --Otherwise, say seconds and "minutes"
		local cds = cdnum % 60
		local cdm = (cdnum - cds) / 60
		
		if cds >= 10 then
			cdstring = cdm .. ":" .. cds
		else
			cdstring = cdm .. ":0" .. cds
		end
	end
	
	
	if owner.prefab == "hatkid" then
		self.title:SetString(tostring(cdstring))
	end
end


return CdTimer