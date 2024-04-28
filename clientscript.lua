local replicatedstorage = game:GetService("ReplicatedStorage")
local dynamicevent = replicatedstorage.HouseData.Dynamicevent

local players = game:GetService("Players")
local lplayer = players.LocalPlayer

local Players_In = replicatedstorage.HouseData.Players_In

local function form_change(plr, IN)
    -- if IN is true then set can collide false and set transparency to 1

    print("function call start")

    print("Player Name: " .. plr.Name)
    local playerobj = players:FindFirstChild(plr.Name)
    local playerchar = playerobj.Character


    if plr.Name == lplayer.Name then

    else
        for i, v in ipairs(playerchar:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                if IN == true then
                    v.Transparency = 1
                    if v:IsA("BasePart") then
                        v.CanCollide = IN
                    end
                else
                    v.Transparency = 0
                    if v:IsA("BasePart") then
                        v.CanCollide = not IN
                    end
                end
            end
        end
    end

    print("function call end")
end



dynamicevent.OnClientEvent:Connect(function(plrlist, visible)
    if visible == false then -- if playing is entering
        for i, v in ipairs(plrlist) do
            print(v)
            print("not visible triggered")
            form_change(v, true)
        end
    else
        for i, v in ipairs(plrlist) do -- if playing is exiting
            print("visible triggered")
            form_change(v, false)
        end
    end
end)
