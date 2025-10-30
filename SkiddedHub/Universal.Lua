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
    Title = "Character",
    Icon = "user-cog", -- optional
    Locked = false,
})

for _,i in game.CoreGui.WindUI.Window:GetChildren() do
    if i.Visible then
        Instance.new("UIDragDetector",i)
    end
end


local JumpChanger = ExploitTab:Input({
    Title = "JumpPower",
    Desc = "Changes your jump power so you are sigma.",
    Type = "Input",
    Placeholder = 7.2,
    InputIcon = "arrow-up-0-1",
    Callback = function(input)
        if input == "" then return end
        
        if tonumber(input) == nil then
            WindUI:Notify({
                Title = "Please enter number, not a string!",
                Content = "Stupid ass nigga.",
                Duration = 3, -- 3 seconds
                Icon = "bird",
            })

            return
        end

        if lp.Character.Humanoid.UseJumpPower then
            lp.Character.Humanoid.JumpPower = input
        else
            lp.Character.Humanoid.JumpHeight = input
        end
    end
})

local function NotifyJumpPower()
    if LogJump then
        if lp.Character.Humanoid.UseJumpPower then
            WindUI:Notify({
            Title = "Jump Power has been changed.",
            Content = "So your jump power is ".. lp.Character.Humanoid.JumpPower,
            Duration = 1.7, -- seconds
            Icon = "message-circle",
            })        
        else
            WindUI:Notify({
            Title = "Jump height has been changed.",
            Content = "So your jump height is ".. lp.Character.Humanoid.JumpHeight,
            Duration = 1.7, -- seconds
            Icon = "message-circle",
            })
    end
    end
end


local LogWalkSpeed = false

local function NotifyWalkSpeed()
   if LogWalkSpeed then
         WindUI:Notify({
            Title = "Walk speed has been changed.",
            Content = "So your walk speed is ".. lp.Character.Humanoid.WalkSpeed,
            Duration = 1.7, -- seconds
            Icon = "message-circle",
            })     
    end
end

lp.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(NotifyWalkSpeed)
lp.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(NotifyJumpPower)
lp.Character.Humanoid:GetPropertyChangedSignal("JumpHeight"):Connect(NotifyJumpPower)

ExploitTab:Toggle({
    Title = "Use JumpPower",
    Desc = "It's will bypass some shitty-ass games that dont control JumpPower like SAB.",
    Type = "Checkbox",
    Value = lp.Character.Humanoid.UseJumpPower, -- default value
    Callback = function(state) 
        lp.Character.Humanoid.UseJumpPower = state
    end
})

ExploitTab:Divider()

ExploitTab:Input({
    Title = "WalkSpeed",
    Desc = "Easy to detect but mean for useability.",
    Type = "Input",
    Placeholder = 16,
    InputIcon = "rabbit",
    Callback = function(input)
        if input == "" then return end
        
        if tonumber(input) == nil then
            WindUI:Notify({
                Title = "Please enter number, not a string!",
                Content = "Stupid ass nigga.",
                Duration = 3, -- 3 seconds
                Icon = "bird",
            })

            return
        end

        lp.Character.Humanoid.WalkSpeed = input
end})


Window:Divider()

Window:Tag({
    Title = "v1.1",
    Icon = "scroll-text",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 9 -- from 0 to 13
})

Window:Tag({
        Title = "V" .. WindUI.Version,
        Icon = "github",
        Color = Color3.fromHex("#6b31ff"),
        Radius = 9
})

local Settings = Window:Tab({
    Title = "Settings",
    Icon = "settings", -- optional
    Locked = false,
})

Settings:Toggle({
    Title = "Log about changing jump power",
    Desc = "So if your jump power changes it will send you message about it and how much it is now.",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        LogJump = state
    end
})

Settings:Toggle({
    Title = "Log about changing walk speed",
    Desc = "So if your walk speed changes it will send you message about it and how much it is now.",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        LogWalkSpeed = state
    end
})

Settings:Keybind({
    Title = "Open UI",
    Desc = "Keybind to open UI",
    Value = "Insert",
    Callback = function(input) 
        Window:SetToggleKey(Enum.KeyCode[input])
    end
})
