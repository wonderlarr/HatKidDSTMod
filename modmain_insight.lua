-- modmain.lua
local _G = GLOBAL

local function AddPrefabDescriptors()
	if not _G.rawget(_G, "Insight") then return end
	_G.Insight.prefab_descriptors.sprinthat = {
		Describe = function(inst, context)
			local description
			
            if TUNING.SPRINTHAT_HUNGER_BURNRATE ~= 1 then
                description = "<color=HUNGER>Hunger Drain (While Moving)</color>: +" .. tostring(TUNING.SPRINTHAT_HUNGER_BURNRATE * 100 - 100) .. "%"
            end

			return {
				name = "sprinthat",
				priority = 0,
				description = description
			}
		end
	}
	_G.Insight.prefab_descriptors.brewinghat = {
		Describe = function(inst, context)
			local description = nil

			description = "<color=SANITY>Sanity: " .. tostring(-TUNING.BREWINGHAT_THRESHHOLD) .. ".0/use</color>"

			return {
				name = "brewinghat",
				priority = 0,
				description = description
			}
		end
	}
	_G.Insight.prefab_descriptors.polarhat = {
		Describe = function(inst, context)
			local description = nil

			-- "<color=35C2FF>Freezes</color> Entities\n"
			description = "<color=#DED15E>Range: " .. tostring(TUNING.POLARHAT_RADIUS / 4) .. " tiles</color>\n<color=SANITY>Sanity: " .. tostring(-TUNING.POLARHAT_THRESHHOLD) .. ".0/use</color>"

			return {
				name = "polarhat",
				priority = 0,
				description = description
			}, {
				name = "insight_ranged",
				priority = 0,
				description = nil,
				range = TUNING.POLARHAT_RADIUS,
				color = "#35C2FF",
				attach_player = true
			}
		end
	}
	_G.Insight.prefab_descriptors.dwellermask = {
		Describe = function(inst, context)
			local description = nil

			-- "Provides <color=#00FFAF>Nightvision</color>\n"
			description = "<color=#DED15E>Range: " .. tostring(TUNING.DWELLERMASK_RADIUS / 4) .. " tiles</color>\n<color=SANITY>Sanity: " .. tostring(-TUNING.DWELLERMASK_THRESHHOLD) .. ".0/use</color>"

			return {
				name = "dwellermask",
				priority = 0,
				description = description
			}, {
				name = "insight_ranged",
				priority = 0,
				description = nil,
				range = TUNING.DWELLERMASK_RADIUS,
				color = "#00FFAF",
				attach_player = true
			}
		end
	}
	_G.Insight.prefab_descriptors.timestophat = {
		Describe = function(inst, context)
			local description = nil

			description = "<color=AGE>Time Speed: -50%</color>\n<color=#DED15E>Range: 16 tiles</color>\n<color=SANITY>Sanity: " .. tostring(-TUNING.TIMESTOPHAT_THRESHHOLD) .. ".0/use</color>"

			return {
				name = "timestophat",
				priority = 0,
				description = description
			}, {
				name = "insight_ranged",
				priority = 0,
				description = nil,
				range = 32,
				color = "#000000",
				attach_player = true
			}
		end
	}
	_G.Insight.prefab_descriptors.kidpotion_throwable = {
		Describe = function(inst, context)
			local description = nil

			return {
				name = "kidpotion_throwable",
				priority = 0,
				description = description
			}, {
				name = "insight_ranged",
				priority = 0,
				description = nil,
				range = TUNING.BREWINGHAT_RADIUS,
				color = "#8E5ED8",
				attach_player = true
			}
		end
	}

	_G.Insight.prefab_descriptors.hatbrella = {
		Describe = function(inst, context)
			local description = nil

			description = "<color=AGE>Third-Hit Bonus</color>: <color=AGE>" .. "25.5" .. "</color>"

			return {
				name = "hatbrella",
				priority = 0,
				description = description
			}
		end
	}
end

AddSimPostInit(AddPrefabDescriptors)

-- -- modmain.lua
-- local _G = GLOBAL

-- local function AddDescriptors()
-- 	if not _G.rawget(_G, "Insight") then return end
-- 	_G.Insight.descriptors.hatmagic = {
-- 		Describe = function(self, context)
-- 			local description
			
--             if not self.instant then
--                 if self.activetime > 0 then
--                     -- hex 004c00
--                     description = "Active for: " 
--                 else
--                     description = "Active for: " 
--                 end

--             end

-- 			return {
-- 				priority = 1,
-- 				description = description
-- 			}
-- 		end
-- 	}
-- end

-- AddSimPostInit(AddDescriptors) -- _G.Insight.descriptors may not exist yet, but it will exist at AddSimPostInit.