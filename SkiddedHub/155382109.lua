-- locals

local lp = game:GetService("Players").LocalPlayer
local hrp = lp.Character.HumanoidRootPart

task.wait()

-- UI loader

do
    local ok, result = pcall(function()
        return require("./src/Init")
    end)
    
    if ok then
        WindUI = result
    else 
        WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    end
end

local window = WindUI:CreateWindow({
    Title = "Skidded HUB",
    Icon = "menu",
    Author = "by FobyCool.",

    Size = UDim2.new(0, 640, 0, 510),
    Theme = "Emerald",
    Resizable = true,

    User = ({
        Enabled = true
    }),

    OpenButton = {
        Title = "Open UI", -- can be changed
        CornerRadius = UDim.new(0.6,0), -- fully rounded
        StrokeThickness = 2, -- removing outline
        Enabled = true, -- enable or disable openbutton
        Draggable = true,
        OnlyMobile = false,
        
        Color = ColorSequence.new( -- gradient
            Color3.fromHex("#4a915b"), 
            Color3.fromHex("#56cc54")
        )
    }

})

local ExploitTab = Window:Tab({
    Title = "Exploits",
    Icon = "shield-off", -- optional
    Locked = false,
})

for _,i in game.CoreGui.WindUI.Window:GetChildren() do
    if i.Visible then
        instance.new("UIDragDetector",i)
    end
end

WindUI:Notify({
    Title = "Please close window!!",
    Content = "There is 2 windows so you should close one!",
    Duration = 3, -- 3 seconds
    Icon = "bird",
})

local DontTeleport = false

ExploitTab:Button({
    Title = "Give All Weapons",
    Desc = "Gives all weapons by teleporting to them \n ( I will add new soon )",
    Locked = false,
    Callback = function()
    
    for _,i in game.workspace.Weapons:GetChildren() do
        local Proximity = i.Hitbox.ProximityPrompt
        local time = Proximity.HoldDuration
        
        if DontTeleport then            
            task.wait()

            Proximity.HoldDuration = 0
            Proximity:InputHoldBegin()
            task.wait()
            Proximity:InputHoldEnd()
            Proximity.HoldDuration = time                    
        else 
            hrp.CFrame = i.Hitbox.CFrame

            Proximity.HoldDuration = 0
            Proximity:InputHoldBegin()
            task.wait()
            Proximity:InputHoldEnd()
            Proximity.HoldDuration = time
        end
    
        lp.Character.Head.Anchored = false

    end
end})


ExploitTab:Toggle({
    Title = "( WIP ) Dont teleport",
    Desc = "It's will dont teleport you so you will be save.",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        DontTeleport = state
    end
})

ExploitTab:Divider()

ExploitTab:Button({
    Title = "Complete all secrets",
    Desc = "Completes all secrets so you can cumshot.",
    Locked = false,
    Callback = function()
        for _,i in lp.Backpack.Secrets:GetChildren() do
        i.Value = true
    end
end})

ExploitTab:Divider()

ExploitTab:Button({
    Title = "Get all candies",
    Desc = "Gives all candies during the hallowenn event.",
    Locked = false,
    Callback = function()
        for _,i in workspace.AREA51.Outside.Quest1.HuntCandyPossibleSpots:GetChildren() do
            hrp.CFrame = i.CFrame
            task.wait()
        end
    end})

Window:Divider()

Window:Tag({
    Title = "v1.0",
    Icon = "scroll-text",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 9 -- from 0 to 13
})

Window:Tag({
        Title = "v" .. WindUI.Version,
        Icon = "github",
        Color = Color3.fromHex("#6b31ff"),
        Radius = 9
})

local Settings = Window:Tab({
    Title = "Settings",
    Icon = "settings", -- optional
    Locked = false,
})

Settings:Keybind({
    Title = "Open UI",
    Desc = "Keybind to open UI",
    Value = "Insert",
    Callback = function(input) 
        Window:SetToggleKey(Enum.KeyCode[input])
    end
})
