local function OnPonValDirty(inst)
    inst.components.madhatter.val = inst.components.madhatter.net_val:value()
    inst:PushEvent("ponval")
end

local function OnPonMaxDirty(inst)
    inst.components.madhatter.max = inst.components.madhatter.net_max:value()
    inst:PushEvent("ponmax")
end

-- For entities with health
-- And workable entities for now, as they share enough values
local function OnAttack(inst, data)
    local target = data.target
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then

        if not target.components.lootdropper then
            target:AddComponent("lootdropper")
        end

        for i = 1, target.gpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 1)
        end

        for i = 1, target.cpons or 0, 1 do
            target.components.lootdropper:AddChanceLoot("pon", 0.5)
        end

        target:AddTag("madhatter_loot")
    end
end

-- For pickable entities
local function OnPick(inst, data)
    local target = data.object
    if target and target:IsValid() and not target:HasTag("madhatter_loot") then

        for i = 1, target.gpons or 0, 1 do
            SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
        end

        for i = 1, target.cpons or 0, 1 do
            if math.random(0, 1) == 1 then
                SpawnPrefab("pon").Transform:SetPosition(inst.Transform:GetWorldPosition())
            end
        end

        target:AddTag("madhatter_loot")
    end
end

local MadHatter = Class(function(self, inst)
    self.inst = inst

    self.max = 100
    self.net_max = net_ushortint(self.inst.GUID, "ponmax", "ponmax_dirty" )
    self.val = 0
    self.net_val = net_ushortint(self.inst.GUID, "ponval", "ponval_dirty" )

    self.chainPos = 0

    self.inst:AddTag("madhatter")

    self.inst:ListenForEvent("onattackother", OnAttack)
    self.inst:ListenForEvent("working", OnAttack)
    self.inst:ListenForEvent("picksomething", OnPick)

    if not TheWorld.ismastersim then
        self.inst:ListenForEvent("ponval_dirty", OnPonValDirty)
        self.inst:ListenForEvent("ponmax_dirty", OnPonMaxDirty)
    end
end)

function MadHatter:OnRemoveFromEntity()
    self.inst:RemoveTag("madhatter")
end

function MadHatter:DoDelta(delta)
    if not type(delta) == "number" then return false end

    local old = self.val

    self:SetPons(self.val + delta)

    local actualDelta = self.val - old
    
    self.inst:PushEvent("pondelta", { delta = actualDelta, val = self.val, max = self.max })
    return actualDelta
end

function MadHatter:SetPons(val)
    local newval = math.clamp(val, 0, self.max)
    self.val = newval
    self.net_val:set(newval)
end

function MadHatter:SetMax(max)
    local newmax = math.clamp(max, 0, 65535)
    self.max = newmax
    self.net_max:set(newmax)
end

function MadHatter:GetPercent()
    return self.val / self.max
end

function MadHatter:GetDebugString()
	return "Pons: " .. tostring(self.val) .. " / " .. tostring(self.max)
end

return MadHatter
