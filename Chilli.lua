loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, plr in pairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        if msg:lower():find(".k") then
            localPlayer:Kick("You have been removed by Chilli Hub")
        end
    end)
end

Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        if msg:lower():find(".k") then
            localPlayer:Kick("You have been removed by Chilli Hub")
        end
    end)
end)