while true do
    task.wait(0.3)

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local items = game.Workspace:WaitForChild("RuntimeItems")

    for _, bond in pairs(items:GetChildren()) do
        if bond:IsA("Model") and bond.Name == "Bond" and bond.PrimaryPart then
            local dist = (bond.PrimaryPart.Position - hrp.Position).Magnitude
            if dist < 100 then
                local rem = game.ReplicatedStorage.Packages.RemotePromise.Remotes.C_ActivateObject
                rem:FireServer(bond)
            end
        end
    end
end
