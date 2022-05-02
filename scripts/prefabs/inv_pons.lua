local assets = {
    Asset("ANIM", "anim/kidpotion.zip"),
    Asset("ANIM", "anim/swap_kidpotion.zip"),
	
    Asset("ATLAS", "images/inventoryimages/kidpotion.xml"),
    Asset("IMAGE", "images/inventoryimages/kidpotion.tex"),

    Asset("ATLAS", "images/gui/emptyslot.xml"),
    Asset("IMAGE", "images/gui/emptyslot.tex"),
}

local containers = require("containers")

local oldwidgetsetup = containers.widgetsetup

params = containers.params

containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "inv_pons" then
        prefab = "backpack"
    end
    oldwidgetsetup(container, prefab)
end

params.inv_pons =
{
    widget =
    {
        slotpos = {
            Vector3(0, 0, 0),
        },
        slotbg =
        {
            -- { image = "kidpotion.tex", atlas = "images/hud2.xml" }, -- WHAT why did this work?! (turns out it didn't, texture fails to load.)
            { image = "emptyslot.tex", atlas = "images/gui/emptyslot.xml" }, -- blank slot background. This slot is not meant to be seen.
        },
        pos = Vector3(1100, 650 , 0), --(675, 335, 0)
    },
    issidewidget = false,
    type = "inv_pons",
}

function params.inv_pons.itemtestfn(container, item, slot)
    return item:HasTag("pon")
end

local parent = nil

local function OnOpen(inst)
    parent = inst.entity:GetParent()
end

local function OnClose(inst)
    if parent ~= nil then
        parent:PushEvent("closepon")
    else
        print("WARNING: Pon Inventory was closed incorrectly!")
    end
end

local function fn()

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)

	-- inst.AnimState:SetBank("kidpotion")
    -- inst.AnimState:SetBuild("kidpotion")
    -- inst.AnimState:PlayAnimation("idle")



    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst) 
            inst.replica.container:WidgetSetup("inv_pons") 
        end

        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.canbepickedup = false

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("inv_pons")
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true
    inst.components.container.onclosefn = OnClose
    inst.components.container.onopenfn = OnOpen
	
    return inst
end


return  Prefab("inv_pons", fn, assets) 