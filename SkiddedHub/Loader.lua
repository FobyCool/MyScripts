local GamesList = {
    [73754455] = "https://raw.githubusercontent.com/FobyCool/MyScripts/refs/heads/main/SkiddedHub/155382109.lua", -- AREA 51,
    ["Universal"] = "https://raw.githubusercontent.com/FobyCool/MyScripts/refs/heads/main/SkiddedHub/Universal.Lua" -- Universal
}

if GamesList then
    loadstring(game:HttpGet(GamesList[game.GameId]))()
else
    loadstring(game:HttpGet(GamesList["Universal"]))()
end
