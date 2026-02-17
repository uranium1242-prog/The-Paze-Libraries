-- Load monitoring system first
loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/PazeLibsMonitor.lua'))()

if game.PlaceId == 79546208627805 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
else
    return
end

local Window = Rayfield:CreateWindow({
   Name = "99 Nights In The Forest Library",
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
   Name = "Flow Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/Boxking776/kocmoc/main/flowhub.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/SystemBroken/VoidwareTest/main/NewMainScript.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Noctrun Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/NoCtRuN/NocHub/main/Loader"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Foxname Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/foxname-hub/foxname-hub/refs/heads/main/scriptName"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Beta Hub loader",
   Callback = function()
     loadstring(game:HttpGet('https://pastefy.app/TUYsN4Vo/raw'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Unloader",
   Callback = function()
     Rayfield:Destroy()
   end,
})
