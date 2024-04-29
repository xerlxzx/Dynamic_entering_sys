local M = {}


function M.Teleport_To_V3(plrcharacter, V3)
    plrcharacter:MoveTo(V3)
end

function M.Teleport_To_Part_Location(plrcharacter, Part)
    plrcharacter:MoveTo(Part.Position)
end

function M.FindCornersOfPart(part)
    local cf = part.CFrame
    local size = part.Size

    local corners = {}

    -- helper cframes for intermediate steps
    -- before finding the corners cframes.
    -- With corners I only need cframe.Position of corner cframes.

    -- face centers - 2 of 6 faces referenced
    local frontFaceCenter = (cf + cf.LookVector * size.Z / 2)
    local backFaceCenter = (cf - cf.LookVector * size.Z / 2)

    -- edge centers - 4 of 12 edges referenced
    local topFrontEdgeCenter = frontFaceCenter + frontFaceCenter.UpVector * size.Y / 2
    local bottomFrontEdgeCenter = frontFaceCenter - frontFaceCenter.UpVector * size.Y / 2
    local topBackEdgeCenter = backFaceCenter + backFaceCenter.UpVector * size.Y / 2
    local bottomBackEdgeCenter = backFaceCenter - backFaceCenter.UpVector * size.Y / 2

    -- corners
    corners.topFrontRight = (topFrontEdgeCenter + topFrontEdgeCenter.RightVector * size.X / 2).Position
    corners.topFrontLeft = (topFrontEdgeCenter - topFrontEdgeCenter.RightVector * size.X / 2).Position

    corners.bottomFrontRight = (bottomFrontEdgeCenter + bottomFrontEdgeCenter.RightVector * size.X / 2).Position
    corners.bottomFrontLeft = (bottomFrontEdgeCenter - bottomFrontEdgeCenter.RightVector * size.X / 2).Position

    corners.topBackRight = (topBackEdgeCenter + topBackEdgeCenter.RightVector * size.X / 2).Position
    corners.topBackLeft = (topBackEdgeCenter - topBackEdgeCenter.RightVector * size.X / 2).Position

    corners.bottomBackRight = (bottomBackEdgeCenter + bottomBackEdgeCenter.RightVector * size.X / 2).Position
    corners.bottomBackLeft = (bottomBackEdgeCenter - bottomBackEdgeCenter.RightVector * size.X / 2).Position

    return corners
end

function M.Get_Region3V(part)
    local cf = part.CFrame
    local size = part.Size

    local corners = {}

    -- helper cframes for intermediate steps
    -- before finding the corners cframes.
    -- With corners I only need cframe.Position of corner cframes.

    -- face centers - 2 of 6 faces referenced
    local frontFaceCenter = (cf + cf.LookVector * size.Z / 2)
    local backFaceCenter = (cf - cf.LookVector * size.Z / 2)

    -- edge centers - 4 of 12 edges referenced
    local topFrontEdgeCenter = frontFaceCenter + frontFaceCenter.UpVector * size.Y / 2
    local bottomFrontEdgeCenter = frontFaceCenter - frontFaceCenter.UpVector * size.Y / 2
    local topBackEdgeCenter = backFaceCenter + backFaceCenter.UpVector * size.Y / 2
    local bottomBackEdgeCenter = backFaceCenter - backFaceCenter.UpVector * size.Y / 2

    -- corners
    corners.Min = (topFrontEdgeCenter + topFrontEdgeCenter.RightVector * size.X / 2).Position
    corners.Max = (bottomBackEdgeCenter - bottomBackEdgeCenter.RightVector * size.X / 2).Position

    return corners
end

function M.Create_Players_In_House_List(plr, target_directory)
    local playerins = Instance.new("StringValue")
    playerins.Name = plr.Name
    playerins.Value = plr.Name
    playerins.Parent = target_directory
end

function M.destroy_Players_In_House_List(plr, directory)
    for i, v in ipairs(directory:GetChildren()) do
        if v.Value == plr.Name then
            v:Destroy()
            break
        end
    end
end

return M
