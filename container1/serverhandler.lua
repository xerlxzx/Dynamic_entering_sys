----------------------- SERVICES
local players = game:GetService("Players")
local replicatedfirst = game:GetService("ReplicatedFirst")
local replicatedstorage = game:GetService("ReplicatedStorage")
local stdlib = require(replicatedfirst.library.stdlib)
------------------------GROUP INSTANCES
local regionlocking_Parent = script.Parent
local proxy_out = regionlocking_Parent.outside.proxyblock.ProximityPrompt
local proxy_in = regionlocking_Parent.inside.proxyblock.ProximityPrompt
local inside_tp = regionlocking_Parent.inside_tp
local outside_tp = regionlocking_Parent.outside_tp
-----------------------  REPLICATED STORAGE HOUSE DATA
local DynamicEvent = replicatedstorage.HouseData.DynamicEvent
local updater = replicatedstorage.HouseData.updater
local playerslist = replicatedstorage.HouseData.Players_In -- list directory

local function log_entrance(plr)
    local value = plr:FindFirstChild("INDOORS")
    if value then
        value.Value = true
    end
end

local function log_exit(plr)
    local value = plr:FindFirstChild("INDOORS")
    if value then
        value.Value = false
    end
end


proxy_in.Triggered:Connect(function(plr)
    stdlib.Teleport_To_Part_Location(plr.Character, outside_tp) -- parameters take plrchar obj and end location part
    stdlib.destroy_Players_In_House_List(plr, playerslist)  -- parameters take plr obj and table of the player list
    local playerPos = plr.Character:GetPrimaryPartCFrame()
    if playerPos then
        plr:LoadCharacter()
        plr.Character:SetPrimaryPartCFrame(playerPos)
    end
    log_exit(plr)
end)


proxy_out.Triggered:Connect(function(plr)
    stdlib.Create_Players_In_House_List(plr, playerslist)
    if #playerslist:GetChildren() >= 0 then
        DynamicEvent:FireAllClients(plr)
    end
    stdlib.Teleport_To_Part_Location(plr.Character, inside_tp)
    log_entrance(plr)
end)


players.PlayerAdded:Connect(function(plr)
    print(plr.Name .. " has joined")
    wait(1)
    updater:FireClient(plr, playerslist:GetChildren())
end)
