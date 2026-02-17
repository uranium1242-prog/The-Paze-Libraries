if game.PlaceId == 79546208627805 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
else
    return
end

local Window = Rayfield:CreateWindow({
   Name = "99 Nights In the forrest Library",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading scripts",
   LoadingSubtitle = "by Pingus Productions",
   ShowText = "PazeLibs", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Scripts", nil) -- Title, Image
local Section = Tab:CreateSection("Scripts")
Section:Set("Scripts")

local Button = Tab:CreateButton({
   Name = "Flow Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/5946add9ab91f1e04cb005346a8b1968.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Noctrun Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xploaderpw-debug/script/main/NoctrunHubuniversal"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Foxname Hub loader",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Foxname-65930"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Beta Hub loader",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Iluvhaks/99-nights-BETA-/refs/heads/main/99%20nights%20beta"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Unloader",
   Callback = function()
     Rayfield:Destroy()
   end,
})
