local antiglitchfolder = script.Parent.ANTI_GLITCH
local antiglitchparts_inner = antiglitchfolder.antiglitch_parts_inner
local antiglitchparts_outer = antiglitchfolder.antiglitch_parts_outer
local replicatedfirst = game:GetService("ReplicatedFirst")

local stdlib = require(replicatedfirst.library.stdlib)

local innertp_pos = script.Parent.Regionlocking.inside_tp
local outer_eject = script.Parent.Regionlocking.outer_eject

local replicatedstorage = game:GetService("ReplicatedStorage")
local startgui = game:GetService("StarterGui")
local uiremoteevent = replicatedstorage.HouseData.UIhandle


local players = game:GetService("Players")


for _, v in ipairs(antiglitchparts_outer:GetChildren()) do
    v.Touched:Connect(function(hit)
        local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            local plr = players:GetPlayerFromCharacter(humanoid.Parent)
            local plrchar = humanoid.Parent
            local plrstatus = plr:FindFirstChild("INDOORS")
            if plrstatus then
                if plrstatus.Value == true then -- if player is indoors, active antiglitch on the outside
                    stdlib.Teleport_To_Part_Location(plrchar, innertp_pos)
                    local humanoidrootpart = plrchar:FindFirstChild("HumanoidRootPart")
                    uiremoteevent:FireClient(plr)
                    humanoidrootpart.Anchored = true
                    wait(3)
                    humanoidrootpart.Anchored = false
                end
            end
        end
    end)
end


for _, v in ipairs(antiglitchparts_inner:GetChildren()) do
    v.Touched:Connect(function(hit)
        local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            local plr = players:GetPlayerFromCharacter(humanoid.Parent)
            local plrchar = humanoid.Parent
            local plrstatus = plr:FindFirstChild("INDOORS")
            if plrstatus then
                if plrstatus.Value == false then -- if player is indoors, active antiglitch on the outside
                    stdlib.Teleport_To_Part_Location(plrchar, outer_eject)
                    local humanoidrootpart = plrchar:FindFirstChild("HumanoidRootPart")
                    uiremoteevent:FireClient(plr)
                    humanoidrootpart.Anchored = true
                    wait(3)
                    humanoidrootpart.Anchored = false
                end
            end
        end
    end)
end
