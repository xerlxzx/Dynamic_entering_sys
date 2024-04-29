local replicatedstorage = game:GetService("ReplicatedStorage")
local Enter = replicatedstorage.HouseData.enter
local Exit = replicatedstorage.HouseData.exit
local textchatservice = game:GetService("TextChatService")


local players = game:GetService("Players")
local lplayer = players.LocalPlayer

local Players_In = replicatedstorage.HouseData.Players_In

local function enterf(plr)
    local playerobj = players:FindFirstChild(plr.Name)
    local playerchar = playerobj.Character

    print("entered room")
    for i, v in ipairs(playerchar:GetDescendants()) do
        if plr.Name == lplayer.Name then
            textchatservice.BubbleChatConfiguration.Enabled = false
        else
            if v:IsA("BasePart") then
                if v.Name == "HumanoidRootPart" then
                    v.CanCollide = false
                else
                    v.CanCollide = false
                    v.Transparency = 1
                end
            elseif v:IsA("Decal") then
                v.Transparency = 1
            elseif v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    end
end



local function exitf(plrchar, player)
    if player.Name == lplayer.Name then
        textchatservice.BubbleChatConfiguration.Enabled = true
    else
        print("exited room")
        for i, v in ipairs(plrchar:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name == "HumanoidRootPart" then
                    v.CanCollide = true
                else
                    v.CanCollide = true
                    v.Transparency = 0
                end
            elseif v:IsA("Decal") then
                v.Transparency = 0
            elseif v:IsA("Sparkles") then
                v.Enabled = true
            end
        end
    end
end




Enter.OnClientEvent:Connect(function(plrlist)
    for i, v in ipairs(plrlist) do
        enterf(v)
    end
end)

Exit.OnClientEvent:Connect(function(plrchar, plr)
    exitf(plrchar, plr)
end)
