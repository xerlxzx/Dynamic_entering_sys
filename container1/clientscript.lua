local replicatedstorage = game:GetService("ReplicatedStorage")
local DynamicEvent = replicatedstorage.HouseData.DynamicEvent
local updater = replicatedstorage.HouseData.updater
local lplayer = game:GetService("Players").LocalPlayer

DynamicEvent.OnClientEvent:Connect(function(plr)
    if lplayer.Name ~= plr.Name then
        workspace[plr.Name]:Destroy()
    end
end)

updater.OnClientEvent:Connect(function(playerlist)
    for _, v in ipairs(playerlist) do
        workspace[v.Name]:Destroy()
    end
end)
