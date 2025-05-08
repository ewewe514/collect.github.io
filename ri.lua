task.spawn(function()
    while true do
        local activateRemote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RemotePromise"):WaitForChild("Remotes"):FindFirstChild("C_ActivateObject")

        if activateRemote then
            local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

            for _, bond in pairs(runtimeItems:GetChildren()) do
                if bond:IsA("Model") and (bond.Name == "Bond" or bond.Name == "Bonds") and bond.PrimaryPart then
                    activateRemote:FireServer(bond)
                end
            end
        end
        task.wait(0.3) -- Adds the delay after each loop iteration
    end
end)
