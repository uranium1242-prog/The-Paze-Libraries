local PlaceId = game.PlaceId

local ScriptList = {
    [2753915549] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/BloxFruits.lua",
    [79546208627805] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/99NightsInTheForest.lua",
    [126884695634066] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/GrowAGarden.lua",
}

local targetScript = ScriptList[PlaceId]
if targetScript then
    loadstring(game:HttpGet(targetScript))()
else
    warn("PazeLibs: No script found for this game (PlaceId: " .. tostring(PlaceId) .. ")")
end
