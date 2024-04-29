local replicatedstorage = game:GetService("ReplicatedStorage")
local DynamicEvent = replicatedstorage.HouseData.DynamicEvent
local updater = replicatedstorage.HouseData.updater
local lplayer = game:GetService("Players").LocalPlayer
local startgui = game:GetService("StarterGui")
local uiremoteevent = replicatedstorage.HouseData.UIhandle
local wallglitchui = startgui.wallglitch.Frame

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


uiremoteevent.OnClientEvent:Connect(function()
    print("fired ui event")
    wallglitchui.Visible = true
    print(wallglitchui.Visible)
    wait(3)
    wallglitchui.Visible = false
    print(wallglitchui.Visible)
end)
