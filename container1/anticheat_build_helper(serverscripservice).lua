local players = game:GetService("Players")


local function log_entrance(plr)
    local value = Instance.new("BoolValue")
    value.Name = "INDOORS"
    value.Parent = plr
end


players.PlayerAdded:Connect(function(plr)
    log_entrance(plr)
end)
