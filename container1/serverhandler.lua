local players = game:GetService("Players")
local replicatedfirst = game:GetService("ReplicatedFirst")
local replicatedstorage = game:GetService("ReplicatedStorage")
local stdlib = require(replicatedfirst.library.stdlib)
local Enter = replicatedstorage.HouseData.enter
local Exit = replicatedstorage.HouseData.exit


local regionlocking = script.Parent
local proxy_out = regionlocking.outside.proxyblock.ProximityPrompt
local proxy_in = regionlocking.inside.proxyblock.ProximityPrompt
local def_region = regionlocking.def_region
local inside_tp = regionlocking.inside_tp
local outside_tp = regionlocking.outside_tp


local Players_In = replicatedstorage.HouseData.Players_In -- list directory



proxy_in.Triggered:Connect(function(plr)
    local plrchar = plr.Character
    stdlib.destroy_Players_In_House_List(plr, Players_In)
    Exit:FireAllClients(plrchar, plr)
    stdlib.Teleport_To_Part_Location(plrchar, outside_tp)
end)

proxy_out.Triggered:Connect(function(plr)
    local plrchar = plr.Character
    local plrlist = Players_In:GetChildren()
    stdlib.Create_Players_In_House_List(plr, Players_In)
    print(Players_In:GetChildren())
    if #plrlist >= 0 then
        print("firing")
        Enter:FireAllClients(Players_In:GetChildren())
    end
    stdlib.Teleport_To_Part_Location(plrchar, inside_tp)
end)
