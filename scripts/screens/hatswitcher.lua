local Screen = require "widgets/screen"
local Button = require "widgets/button"
local AnimButton = require "widgets/animbutton"
local Menu = require "widgets/menu"
local Text = require "widgets/text"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local UIAnim = require "widgets/uianim"
local Widget = require "widgets/widget"
local TEMPLATES = require "widgets/templates"


local STYLES =
{
    light = {
        bgconstructor = function(root)
            local bg = root:AddChild(TEMPLATES.CurlyWindow(130, 150, 1, 1, 68, -40))
            bg.fill = bg:AddChild(Image("images/fepanel_fills.xml", "panel_fill_tiny.tex"))
            bg.fill:SetScale(.92, .68)
            bg.fill:SetPosition(8, 12)
            return bg
        end,
        title = {font=BUTTONFONT, size=50, colour={0,0,0,1}},
        text = {font=NEWFONT, size=28, colour={0,0,0,1}},
    },
    dark = {
        bgconstructor = function(root)
            local bg = root:AddChild(Image("images/fepanels.xml", "wideframe.tex"))
            bg:SetScale(0.70, 0.70)
            bg:SetPosition(0, 10)
            return bg
        end,
        title = {font=TITLEFONT, size=50, colour={1,1,1,1}},
        text = {font=NEWFONT_OUTLINE, size=28, colour={1,1,1,1}},
    },
}

local HatSwitcher = Class(Screen, function(self, title, text, buttons, scale_bg, spacing_override, style)
	Screen._ctor(self, "HatSwitcher")

    self.style = style or "light"
    assert(STYLES[self.style])

    self.toor = self:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.toor:SetVAnchor(ANCHOR_MIDDLE)
    self.toor:SetHAnchor(ANCHOR_MIDDLE)
    self.toor:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.toor.image:SetTint(0,0,0,0.5)
    self.toor:SetOnClick(function() TheFrontEnd:PopScreen() end)
    self.toor:SetScale(3,3,3)

    self.amount = 5

    -- for i = 1, self.amount do
    --     local theta = i / self.amount
    --     local x =  math.sin(theta * PI2)
    --     local y = math.cos(theta * PI2)

    --     self.toor:AddChild(ImageButton("images/global.xml", "square.tex")):SetPosition(x, y, 0)
    -- end

    local mult = 200
    -- local theta = 1 / self.amount

    self.hat0 = self.toor:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.hat0:SetVAnchor(ANCHOR_MIDDLE)
    self.hat0:SetHAnchor(ANCHOR_MIDDLE)
    self.hat0:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.hat0:SetPosition(math.sin(0 / self.amount * PI2) * mult, math.cos(0 / self.amount * PI2) * mult)
    self.hat0.image:SetTint(1,0,0,1)

    self.hat1 = self.toor:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.hat1:SetVAnchor(ANCHOR_MIDDLE)
    self.hat1:SetHAnchor(ANCHOR_MIDDLE)
    self.hat1:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.hat1:SetPosition(math.sin(1 / self.amount * PI2) * mult, math.cos(1 / self.amount * PI2) * mult)
    self.hat1.image:SetTint(0,1,0,1)
    
    self.hat2 = self.toor:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.hat2:SetVAnchor(ANCHOR_MIDDLE)
    self.hat2:SetHAnchor(ANCHOR_MIDDLE)
    self.hat2:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.hat2:SetPosition(math.sin(2 / self.amount * PI2) * mult, math.cos(2 / self.amount * PI2) * mult)
    self.hat2.image:SetTint(0,0,1,1)

    self.hat3 = self.toor:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.hat3:SetVAnchor(ANCHOR_MIDDLE)
    self.hat3:SetHAnchor(ANCHOR_MIDDLE)
    self.hat3:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.hat3:SetPosition(math.sin(3 / self.amount * PI2) * mult, math.cos(3 / self.amount * PI2) * mult)
    self.hat3.image:SetTint(1,1,0,1)

    self.hat4 = self.toor:AddChild(ImageButton("images/global.xml", "square.tex"))
    self.hat4:SetVAnchor(ANCHOR_MIDDLE)
    self.hat4:SetHAnchor(ANCHOR_MIDDLE)
    self.hat4:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.hat4:SetPosition(math.sin(4 / self.amount * PI2) * mult, math.cos(4 / self.amount * PI2) * mult)
    self.hat4.image:SetTint(0,1,1,1)

    -- self.proot = self:AddChild(Widget("ROOT"))
    -- self.proot:SetVAnchor(ANCHOR_MIDDLE)
    -- self.proot:SetHAnchor(ANCHOR_MIDDLE)
    -- self.proot:SetPosition(0,0,0)
    -- self.proot:SetScaleMode(SCALEMODE_PROPORTIONAL)

    -- self.bg = STYLES[self.style].bgconstructor(self.proot)

	-- --title
    -- self.title = self.proot:AddChild(Text(STYLES[self.style].title.font, STYLES[self.style].title.size))
    -- self.title:SetPosition(5, 88, 0)
    -- self.title:SetString(title)
    -- self.title:SetColour(unpack(STYLES[self.style].title.colour))

	-- --text
    -- self.text = self.proot:AddChild(Text(STYLES[self.style].text.font, STYLES[self.style].text.size))
    -- self.text:SetPosition(5, -15, 0)
    -- self.text:SetString(text)
    -- self.text:SetColour(unpack(STYLES[self.style].text.colour))
    -- self.text:EnableWordWrap(true)
    -- self.text:SetRegionSize(500, 160)
    -- self.text:SetVAlign(ANCHOR_MIDDLE)

    -- local spacing = spacing_override or 200

	-- self.menu = self.proot:AddChild(Menu(buttons, spacing, true))
	-- self.menu:SetPosition(-(spacing*(#buttons-1))/2, -127, 0)
    -- for i,v in pairs(self.menu.items) do
    --     v:SetScale(.7)
    -- end
	-- self.buttons = buttons

	-- self.default_focus = self.menu
end)

-- function PopupDialogScreen:SetTitleTextSize(size)
-- 	self.title:SetSize(size)
-- end

-- function PopupDialogScreen:SetButtonTextSize(size)
-- 	self.menu:SetTextSize(size)
-- end

-- function HatSwitcher:OnControl(control, down)
--     if HatSwitcher._base.OnControl(self,control, down) then return true end

--     if control == CONTROL_CANCEL and not down then
--         if #self.buttons > 1 and self.buttons[#self.buttons] then
--             self.buttons[#self.buttons].cb()
--             TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
--             return true
--         end
--     end
-- end


-- function PopupDialogScreen:Close()
-- 	TheFrontEnd:PopScreen(self)
-- end

-- function PopupDialogScreen:GetHelpText()
-- 	local controller_id = TheInput:GetControllerID()
-- 	local t = {}
-- 	if #self.buttons > 1 and self.buttons[#self.buttons] then
--         table.insert(t, TheInput:GetLocalizedControl(controller_id, CONTROL_CANCEL) .. " " .. STRINGS.UI.HELP.BACK)
--     end
-- 	return table.concat(t, "  ")
-- end

return HatSwitcher
