task.spawn(function()
    while true do
        local packages = game.ReplicatedStorage:FindFirstChild("Packages")
        if packages then
            local remotePromise = packages:FindFirstChild("RemotePromise")
            if remotePromise then
                local activateRemote = remotePromise:FindFirstChild("Remotes"):FindFirstChild("C_ActivateObject")
                if activateRemote then
                    local runtimeItems = game.Workspace:WaitForChild("RuntimeItems")

                    for _, bond in pairs(runtimeItems:GetChildren()) do
                        if bond:IsA("Model") and (bond.Name == "Bond" or bond.Name == "Bonds") and bond.PrimaryPart then
                            activateRemote:FireServer(bond)
                        end
                    end
                end
            end
        end
        task.wait(0.3) -- Adds a delay between iterations
    end
end)
