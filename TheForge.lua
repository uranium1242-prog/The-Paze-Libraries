-- Load monitoring system first
loadstring(game:HttpGet('https://raw.githubusercontent.com/uranium1242-prog/The-Paze-Libraries/refs/heads/main/PazeLibsMonitor.lua'))()

if game.PlaceId == 76558904092080 then
    -- Show prompt before loading
    local StarterGui = game:GetService("StarterGui")
    
    StarterGui:SetCore("SendNotification", {
        Title = "Haze Hub";
        Text = "This script has a web dashboard at haze.wtf\nURL copied to clipboard!";
        Duration = 5;
    })
    
    -- Copy dashboard URL to clipboard
    setclipboard("https://haze.wtf")
    
    -- Load Haze Hub
    loadstring(game:HttpGet("https://haze.wtf/api/script"))()
else
    return
end
