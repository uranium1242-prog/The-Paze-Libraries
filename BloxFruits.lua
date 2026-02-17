-- Load monitoring system first
loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/PazeLibsMonitor.lua'))()

if game.PlaceId == 2753915549 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
else
    return
end

local Window = Rayfield:CreateWindow({
   Name = "Blox Fruits Library",
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
   Name = "Alchemy Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/AlchemyHubDev/AlchemyHub/main/loader.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "HOHO Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/HoHoHub/HoHoHub/main/Loader.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Annie Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/AnnieHub/AnnieHub/main/loader.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Unloader",
   Callback = function()
     Rayfield:Destroy()
   end,
})
