local GamesList = loadstring(game:HttpGet("https://raw.githubusercontent.com/FobyCool/MyScripts/refs/heads/main/SkiddedHub/ListOfGames.lua"))()

local ScriptToLoad = table.find(GamesList.Scripts, game.Id)

if ScriptToLoad = nil then
    loadstring(game:HttpGet(GamesList.Universal)()
else
    loadstring(game:HttpGet(ScriptToLoad)()
end
