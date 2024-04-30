local partcontainer = workspace:WaitForChild("fogscreenobjects")


local fogscreensize = 200 -- 100 pixels
local resolution = 100    -- how "zoomed in" it is, higher the value the more smooth
local frequency = 3       -- how frequent a peak and trough appears
local amplitude = 20      -- affects the height of the wave

local function getHeight(x, z)
    local noiseheight = math.noise(x / resolution * frequency, z / resolution * frequency, 0)
    noiseheight = math.clamp(noiseheight, -0.5, 0.5) + 0.5
    return noiseheight
end



local function generate()
    for x = 0, fogscreensize do
        for z = 0, fogscreensize do
            local part = Instance.new("Part")
            part.Parent = partcontainer
            part.Anchored = true
            part.Size = Vector3.new(1, 2, 1)
            part.Material = Enum.Material.Concrete

            local height = getHeight(x, z)
            part.Position = Vector3.new(x, height * amplitude + 70, z)
            part.Color = Color3.new(height, height, height)
        end
        game:GetService("RunService").Heartbeat:Wait()
    end
end


wait(generate())
