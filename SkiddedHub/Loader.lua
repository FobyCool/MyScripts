local GamesList = 

{
    [73754455] = "https://raw.githubusercontent.com/FobyCool/MyScripts/refs/heads/main/SkiddedHub/155382109.lua", -- AREA 51,
    ["Universal"] = "https://raw.githubusercontent.com/FobyCool/MyScripts/refs/heads/main/SkiddedHub/Universal.Lua" -- Universal
}


local ScriptToLoad = table.find(GamesList.Scripts, game.GameId)

if ScriptToLoad == nil then
    loadstring(game:HttpGet(GamesList.Universal))()
else
    loadstring(game:HttpGet(ScriptToLoad))()
end
