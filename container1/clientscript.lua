local replicatedstorage = game:GetService("ReplicatedStorage")
local DynamicEvent = replicatedstorage.HouseData.DynamicEvent
local lplayer = game:GetService("Players").LocalPlayer

DynamicEvent.OnClientEvent:Connect(function(plr)
    if lplayer.Name ~= plr.Name then
        workspace[plr.Name]:Destroy()
        print(workspace:FindFirstChildWhichIsA("Humanoid"))
    end
end)
