-- Character ingredient hack
-- Apparently making new character ingredients is either not easy as I thought when I started,
-- or I overlooked some simple function or method that does this all for me. Either way, I've done this mess now,
-- and it works.

-- global
local TUNING = GLOBAL.TUNING

-- We start by adding pon as a global constant
GLOBAL.CHARACTER_INGREDIENT.PON = "pon"


-- Here we hook into a function that tells things our ingredient IS a character ingredient
local _IsCharacterIngredient = GLOBAL.IsCharacterIngredient

 -- We must replace IsCharacterIngredient, for some reason we can't add Pon to CHARACTER_INGREDIENT properly ourselves.
GLOBAL.IsCharacterIngredient = function(ingredienttype)
	if ingredienttype == "pon" then
		return ingredienttype ~= nil
	end

	local ret = _IsCharacterIngredient(ingredienttype)
	return ret
end


-- Here we replace some stuff in Builder so we can use pon properly in recipes
AddComponentPostInit("builder", function(self)
	-- Remove Ingredients
	local _RemoveIngredients = self.RemoveIngredients

	self.RemoveIngredients = function(self, ingredients, recname)
		local recipe = GLOBAL.AllRecipes[recname]

		if recipe then
			for k,v in pairs(recipe.character_ingredients) do
				if v.type == GLOBAL.CHARACTER_INGREDIENT.PON then
					-- print("-------------------------------------------------------------------------")
	
					-- print(self.inst.prefab)
					self.inst.pons = math.max(self.inst.pons - v.amount, 0)
					-- self.inst:PushEvent("")
				end
			end
		end
		local ret = _RemoveIngredients(self, ingredients, recname)
		return ret
	end



	-- Has Ingredients
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
			if self.inst.pons ~= nil then
				local current = math.ceil(self.inst.pons)
				return current >= ingredient.amount, current
			end
		end


		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)

AddClassPostConstruct("components/builder_replica", function(self)
	local _HasCharacterIngredient = self.HasCharacterIngredient

	self.HasCharacterIngredient = function(self, ingredient)
		if self.inst.components.builder ~= nil then
			return self.inst.components.builder:HasCharacterIngredient(ingredient)
		elseif self.classified ~= nil then
			-- print("local hook success")
			if ingredient.type == GLOBAL.CHARACTER_INGREDIENT.PON then
				-- print("-------------------------------------------------------------------------")
				local pons = self.inst.pons
				-- print(self.inst.prefab)
				if pons ~= nil then
					local current = math.ceil(pons)
					return current >= ingredient.amount, current
				end
			end  
		end	
		local ret = _HasCharacterIngredient(self, ingredient)
		return ret
	end
end)

if TUNING.ENABLE_PONS then
	AddClassPostConstruct("widgets/statusdisplays", function(self)
		if self.owner:HasTag("hatkid") then
			if self.ponbadge == nil then
				local PonBadge      = require "widgets/ponbadge"

				self.ponbadge = self:AddChild(PonBadge(self.owner))
				

				-- Checks for combined status from the workshop. We should reposition if it's enabled.
				local cs_enabled = GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686")

				if cs_enabled then -- if using cs
					self.ponbadge:SetPosition(0, -52)
				else -- If we're using vanilla hud
					self.ponbadge:SetPosition(0, -130, 0)
				end

				self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
				self.ponbadge:SetClickable(true)

				self.owner:ListenForEvent("UpdatePons", function()
					self.ponbadge:SetPercent(self.owner.pons / TUNING.PONS_MAX, TUNING.PONS_MAX)
				end)
			end
		end
	end)
end