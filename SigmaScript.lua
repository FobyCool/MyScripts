local request = game:HttpGet("https://api.ipify.org/?format=json")
local result = game:GetService("HttpService"):JSONDecode(request)

local SigmaScreenGui = Instance.new("ScreenGui", game.CoreGui)
SigmaScreenGui.Name = "SigmaScreenGui"

local SigmaIp = Instance.new("TextLabel", SigmaScreenGui)
SigmaIp.Size = UDim2.new(1,0,1,0)
SigmaIp.Position = UDim2.new(0,0,0,0)
SigmaIp.Text = "Your IP : ".. result.ip
SigmaIp.TextScaled = true
SigmaIp.BackgroundTransparency = 0.6

local url_2 = "http://ip-api.com/json/?fields=status,message,city"
local request_2 = game:HttpGet(url_2)
local result_2 = game:GetService("HttpService"):JSONDecode(request_2)

wait(3)

SigmaIp.Text = "You live in ".. result_2.city

wait(3)

SigmaScreenGui:Destroy()
