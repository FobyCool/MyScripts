local NutImageID = "rbxassetid://77628776288246"
for _,i in workspace:GetDescendants() do

    if i:IsA("Decal") or i:IsA("Texture") then
        i.Texture = NutImageID
        i.ZIndex = 999  
        i.Transparency = 0
    end

    if i:IsA("MeshPart") then
        i.TextureID = NutImageID
    end

    local NutDecal = i:FindFirstChild("NutDecal")
    if NutDecal == nil then 

        local Nuts_1 = Instance.new("Decal", i)
        Nuts_1.Name = "NutDecal"
        Nuts_1.ZIndex = 999
        Nuts_1.Texture = NutImageID
        Nuts_1.Face = Enum.NormalId.Front

        local Nuts_2 = Instance.new("Decal", i)
        Nuts_2.Name = "NutDecal"
        Nuts_2.ZIndex = 999
        Nuts_2.Texture = NutImageID
        Nuts_2.Face = Enum.NormalId.Back

        local Nuts_3 = Instance.new("Decal", i)
        Nuts_3.Name = "NutDecal"
        Nuts_3.ZIndex = 999
        Nuts_3.Texture = NutImageID
        Nuts_3.Face = Enum.NormalId.Right

        local Nuts_4 = Instance.new("Decal", i)
        Nuts_4.Name = "NutDecal"
        Nuts_4.ZIndex = 999
        Nuts_4.Texture = NutImageID
        Nuts_4.Face = Enum.NormalId.Left

        local Nuts_5 = Instance.new("Decal", i)
        Nuts_5.Name = "NutDecal"
        Nuts_5.ZIndex = 999
        Nuts_5.Texture = NutImageID
        Nuts_5.Face = Enum.NormalId.Bottom

        local Nuts_6 = Instance.new("Decal", i)
        Nuts_6.Name = "NutDecal"
        Nuts_6.ZIndex = 999
        Nuts_6.Texture = NutImageID
        Nuts_6.Face = Enum.NormalId.Top

    end
end
