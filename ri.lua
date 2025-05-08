task.spawn(function()
    while true do
        if bond then
            local activateRemote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RemotePromise"):WaitForChild("Remotes"):FindFirstChild("C_ActivateObject")

            if activateRemote then
                local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

                for _, bond in pairs(runtimeItems:GetChildren()) do
                    if bond:IsA("Model") and (bond.Name == "Bond" or bond.Name == "Bonds") and bond.PrimaryPart then
                        activateRemote:FireServer(bond)
                        task.wait(0.3) -- This is the delay you're looking for
                    end
                end
            end
        end
        task.wait()
    end
end)
