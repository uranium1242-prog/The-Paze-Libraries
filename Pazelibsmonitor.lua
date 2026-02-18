-- PazeLibs Monitoring System
-- Tracks FPS drops, stuck players, and executor UNC testing

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local WEBHOOK_URL = nil

local PazeMonitor = {}
PazeMonitor.FPSHistory = {}
PazeMonitor.MaxHistorySize = 60 -- Track last 60 frames for average
PazeMonitor.LastPosition = nil
PazeMonitor.LastMoveTime = tick()
PazeMonitor.StuckThreshold = 600 -- 10 minutes in seconds (600-900 for 10-15 min)
PazeMonitor.Running = false

-- Send webhook message
local function sendWebhook(title, description, color)
    local data = {
        ["embeds"] = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = color or 15158332, -- Red color
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = LocalPlayer.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Game",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Timestamp",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "PazeLibs Monitor"
            }
        }}
    }
    
    local success, err = pcall(function()
        local response = request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
    end)
    
    if not success then
        warn("PazeMonitor: Failed to send webhook - " .. tostring(err))
    end
end

-- Calculate average FPS
local function getAverageFPS()
    if #PazeMonitor.FPSHistory == 0 then return 60 end
    
    local sum = 0
    for _, fps in ipairs(PazeMonitor.FPSHistory) do
        sum = sum + fps
    end
    return sum / #PazeMonitor.FPSHistory
end

-- FPS Monitoring
local function monitorFPS()
    local currentFPS = 1 / RunService.RenderStepped:Wait()
    
    -- Add to history
    table.insert(PazeMonitor.FPSHistory, currentFPS)
    if #PazeMonitor.FPSHistory > PazeMonitor.MaxHistorySize then
        table.remove(PazeMonitor.FPSHistory, 1)
    end
    
    -- Check for FPS drop
    if #PazeMonitor.FPSHistory >= 30 then -- Only check after we have enough data
        local avgFPS = getAverageFPS()
        local fpsDrop = avgFPS - currentFPS
        
        if fpsDrop >= 30 and fpsDrop <= 50 then
            sendWebhook(
                "⚠️ FPS Drop Detected",
                string.format(
                    "**Average FPS:** %.1f\n**Current FPS:** %.1f\n**Drop:** %.1f FPS\n\nPotential lag or performance issue detected.",
                    avgFPS, currentFPS, fpsDrop
                ),
                16776960 -- Yellow/orange color
            )
        elseif fpsDrop > 50 then
            sendWebhook(
                "🔴 Severe FPS Drop",
                string.format(
                    "**Average FPS:** %.1f\n**Current FPS:** %.1f\n**Drop:** %.1f FPS\n\nSevere performance degradation detected!",
                    avgFPS, currentFPS, fpsDrop
                ),
                15158332 -- Red color
            )
        end
    end
end

-- Stuck Detection
local function monitorPosition()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local currentPos = LocalPlayer.Character.HumanoidRootPart.Position
    
    if PazeMonitor.LastPosition then
        local distance = (currentPos - PazeMonitor.LastPosition).Magnitude
        
        if distance > 5 then -- Player moved more than 5 studs
            PazeMonitor.LastMoveTime = tick()
            PazeMonitor.LastPosition = currentPos
        else
            -- Check if stuck for threshold time
            local stuckTime = tick() - PazeMonitor.LastMoveTime
            if stuckTime >= PazeMonitor.StuckThreshold then
                sendWebhook(
                    "🚫 Player Stuck Detected",
                    string.format(
                        "**Duration:** %.1f minutes\n**Position:** (%.1f, %.1f, %.1f)\n\nPlayer hasn't moved for over 10 minutes!",
                        stuckTime / 60,
                        currentPos.X, currentPos.Y, currentPos.Z
                    ),
                    15158332 -- Red color
                )
                -- Reset timer to avoid spam
                PazeMonitor.LastMoveTime = tick()
            end
        end
    else
        PazeMonitor.LastPosition = currentPos
    end
end

-- UNC Test (Unified Naming Convention - Executor Compatibility Test)
function PazeMonitor:RunUNCTest()
    sendWebhook(
        "🔍 UNC Test Started",
        "Running executor compatibility test...",
        3447003 -- Blue color
    )
    
    local results = {}
    local passed = 0
    local failed = 0
    
    -- Test common executor functions
    local tests = {
        {name = "getgenv", func = getgenv},
        {name = "request/http_request", func = request or http_request or syn.request},
        {name = "readfile", func = readfile},
        {name = "writefile", func = writefile},
        {name = "makefolder", func = makefolder},
        {name = "isfolder", func = isfolder},
        {name = "isfile", func = isfile},
        {name = "delfile", func = delfile},
        {name = "loadstring", func = loadstring},
        {name = "getcallingscript", func = getcallingscript},
        {name = "getnamecallmethod", func = getnamecallmethod},
        {name = "hookmetamethod", func = hookmetamethod},
        {name = "hookfunction", func = hookfunction},
        {name = "setclipboard", func = setclipboard},
        {name = "setreadonly", func = setreadonly},
        {name = "isreadonly", func = isreadonly},
        {name = "islclosure", func = islclosure},
        {name = "checkcaller", func = checkcaller},
        {name = "Drawing.new", func = Drawing and Drawing.new},
        {name = "gethui", func = gethui},
        {name = "getconnections", func = getconnections},
    }
    
    local resultText = "**Test Results:**\n```\n"
    
    for _, test in ipairs(tests) do
        local status = test.func and "✅ PASS" or "❌ FAIL"
        resultText = resultText .. string.format("%-25s %s\n", test.name, status)
        
        if test.func then
            passed = passed + 1
        else
            failed = failed + 1
        end
    end
    
    resultText = resultText .. string.format("\nPassed: %d/%d (%.1f%%)\n```", 
        passed, #tests, (passed / #tests) * 100)
    
    sendWebhook(
        "✅ UNC Test Complete",
        resultText,
        passed == #tests and 3066993 or 15844367 -- Green if all pass, gold if partial
    )
    
    return results
end

-- Chat command handler
local function setupChatCommands()
    LocalPlayer.Chatted:Connect(function(message)
        if message == "/executorUNC" then
            PazeMonitor:RunUNCTest()
        end
    end)
end

-- Start monitoring
function PazeMonitor:Start()
    if self.Running then
        warn("PazeMonitor: Already running!")
        return
    end
    
    self.Running = true
    
    -- Send startup notification
    sendWebhook(
        "🟢 PazeLibs Monitor Started",
        "Monitoring FPS drops and player movement.",
        3066993 -- Green color
    )
    
    -- FPS monitoring loop
    spawn(function()
        while self.Running do
            pcall(monitorFPS)
            wait(1) -- Check every second
        end
    end)
    
    -- Position monitoring loop
    spawn(function()
        while self.Running do
            pcall(monitorPosition)
            wait(30) -- Check every 30 seconds
        end
    end)
    
    -- Setup chat commands
    setupChatCommands()
    
    print("PazeMonitor: Monitoring active. Type /executorUNC to run compatibility test.")
end

-- Stop monitoring
function PazeMonitor:Stop()
    self.Running = false
    sendWebhook(
        "🔴 PazeLibs Monitor Stopped",
        "Monitoring has been disabled.",
        15158332 -- Red color
    )
end

-- Auto-start
PazeMonitor:Start()

return PazeMonitor
