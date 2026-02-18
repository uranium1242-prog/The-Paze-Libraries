-- Auto-open developer console
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("DevConsoleVisible", true)

local PlaceId = game.PlaceId

print("PazeLibs: Detected PlaceId:", PlaceId)

local ScriptList = {
    [2753915549] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/BloxFruits.lua",
    [79546208627805] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/99NightsInTheForest.lua",
    [126884695634066] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/GrowAGarden.lua",
    [76558904092080] = "https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/TheForge.lua",
}

local targetScript = ScriptList[PlaceId]

if targetScript then
    print("PazeLibs: Loading script from:", targetScript)
    local success, err = pcall(function()
        loadstring(game:HttpGet(targetScript))()
    end)
    if not success then
        warn("PazeLibs: Error loading script:", err)
    end
else
    warn("PazeLibs: No script found for this game (PlaceId: " .. tostring(PlaceId) .. ")")
    print("PazeLibs: Supported games:")
    print("  - Blox Fruits (2753915549)")
    print("  - 99 Nights In The Forest (79546208627805)")
    print("  - Grow A Garden (126884695634066)")
    print("  - The Forge (76558904092080)")
end
