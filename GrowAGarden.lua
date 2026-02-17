-- Load monitoring system first
loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/PazeLibsMonitor.lua'))()

if game.PlaceId == 126884695634066 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
else
    return
end

local Window = Rayfield:CreateWindow({
   Name = "Grow A Garden Library",
   Icon = 0,
   LoadingTitle = "Loading scripts",
   LoadingSubtitle = "by Pingus Productions",
   ShowText = "PazeLibs",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Tab = Window:CreateTab("Scripts", nil)
local Section = Tab:CreateSection("Scripts")
Section:Set("Scripts")

local Button = Tab:CreateButton({
   Name = "Speed Hub X loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed Hub X.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Depthso AutoFarm",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Grow-a-Garden/refs/heads/main/autofarm.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Unloader",
   Callback = function()
     Rayfield:Destroy()
   end,
})
