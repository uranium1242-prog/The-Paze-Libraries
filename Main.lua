local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "PazeLibs",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "PazeLibs v1.0",
   LoadingSubtitle = "by Pingus Productions",
   ShowText = "PazeLibs is a library for Roblox automation code and more!", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Fixed: added comma here

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "PazeLibs"
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

local Tab = Window:CreateTab("Games", nil) -- Title, Image

local Section = Tab:CreateSection("Accessable Games")
Section:Set("Accessable Games")

local Button = Tab:CreateButton({
   Name = "Blox Fruits",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/BloxFruits.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Grow a Garden",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/GrowAGarden.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "99 Nights In The Forest",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/99NightsInTheForest.lua'))()
   end,
})
