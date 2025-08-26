local request = game:HttpGet("http://ip-api.com/json/?fields=status,message,city,query")
local result = game:GetService("HttpService"):JSONDecode(request)

local SigmaScreenGui = Instance.new("ScreenGui", game.CoreGui)
SigmaScreenGui.Name = "SigmaScreenGui"

local SigmaIp = Instance.new("TextLabel", SigmaScreenGui)
SigmaIp.Size = UDim2.new(1,0,1,0)
SigmaIp.Position = UDim2.new(0,0,0,0)
SigmaIp.Text = "Your IP : ".. result.query
SigmaIp.TextScaled = true
SigmaIp.BackgroundTransparency = 0.6

wait(3)

SigmaIp.Text = "You live in ".. result.city

wait(3)

SigmaScreenGui:Destroy()
