local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("BoxHandleAdornment")
highlight.Name = "Highlight"
highlight.Size = Vector3.new(4,4,4)
highlight.Color3 = Color3.new(1, 1, 1)
highlight.Transparency = 0.5
highlight.ZIndex = 10
highlight.AlwaysOnTop = true

-- Function to create name label
local function createNameLabel(parent, playerName)
    local nameLabel = Instance.new("BillboardGui")
        nameLabel.Name = "NameLabel"
            nameLabel.Adornee = parent
                nameLabel.Size = UDim2.new(0, 100, 0, 20)
                    nameLabel.StudsOffset = Vector3.new(0, 3, 0)
                        
                            local textLabel = Instance.new("TextLabel")
                                textLabel.Size = UDim2.new(1, 0, 1, 0)
                                    textLabel.BackgroundTransparency = 1
                                        textLabel.Text = playerName
                                            textLabel.TextColor3 = Color3.new(1, 1, 1)
                                                textLabel.Font = Enum.Font.SourceSans
                                                    textLabel.TextSize = 14
                                                        textLabel.Parent = nameLabel
                                                            
                                                                nameLabel.Parent = parent
                                                                end

                                                                for i, v in pairs(Players) do
                                                                    repeat wait() until v.Character
                                                                        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                                                                                local highlightClone = highlight:Clone()
                                                                                        highlightClone.Adornee = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                        highlightClone.Name = "Highlight"
                                                                                                                
                                                                                                                        -- Add name label
                                                                                                                                createNameLabel(v.Character:FindFirstChild("HumanoidRootPart"), v.Name)
                                                                                                                                        
                                                                                                                                                -- Add glowing outline
                                                                                                                                                        local outline = Instance.new("SelectionBox")
                                                                                                                                                                outline.Adornee = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                        outline.Color3 = Color3.new(1, 1, 1)
                                                                                                                                                                                outline.LineThickness = 0.05
                                                                                                                                                                                        outline.SurfaceTransparency = 0.5
                                                                                                                                                                                                outline.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                    end
                                                                                                                                                                                                    end

                                                                                                                                                                                                    game.Players.PlayerAdded:Connect(function(player)
                                                                                                                                                                                                        repeat wait() until player.Character
                                                                                                                                                                                                            if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                                                                                                                                                                                                                    local highlightClone = highlight:Clone()
                                                                                                                                                                                                                            highlightClone.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                    highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                            highlightClone.Name = "Highlight"
                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                            -- Add name label
                                                                                                                                                                                                                                                                    createNameLabel(player.Character:FindFirstChild("HumanoidRootPart"), player.Name)
                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                    -- Add glowing outline
                                                                                                                                                                                                                                                                                            local outline = Instance.new("SelectionBox")
                                                                                                                                                                                                                                                                                                    outline.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                            outline.Color3 = Color3.new(1, 1, 1)
                                                                                                                                                                                                                                                                                                                    outline.LineThickness = 0.05
                                                                                                                                                                                                                                                                                                                            outline.SurfaceTransparency = 0.5
                                                                                                                                                                                                                                                                                                                                    outline.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        end)

                                                                                                                                                                                                                                                                                                                                        game.Players.PlayerRemoving:Connect(function(playerRemoved)
                                                                                                                                                                                                                                                                                                                                            playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
                                                                                                                                                                                                                                                                                                                                                playerRemoved.Character:FindFirstChild("HumanoidRootPart").NameLabel:Destroy()
                                                                                                                                                                                                                                                                                                                                                    playerRemoved.Character:FindFirstChild("HumanoidRootPart").SelectionBox:Destroy()
                                                                                                                                                                                                                                                                                                                                                    end)

                                                                                                                                                                                                                                                                                                                                                    RunService.Heartbeat:Connect(function()
                                                                                                                                                                                                                                                                                                                                                        for i, v in pairs(Players) do
                                                                                                                                                                                                                                                                                                                                                                repeat wait() until v.Character
                                                                                                                                                                                                                                                                                                                                                                        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                                                                                                                                                                                                                                                                                                                                                                                    local highlightClone = highlight:Clone()
                                                                                                                                                                                                                                                                                                                                                                                                highlightClone.Adornee = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                                                                                                                            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                                                                                                                                        highlightClone.Name = "Highlight"
                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                -- Add name label
                                                                                                                                                                                                                                                                                                                                                                                                                                                            createNameLabel(v.Character:FindFirstChild("HumanoidRootPart"), v.Name)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    -- Add glowing outline
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                local outline = Instance.new("SelectionBox")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            outline.Adornee = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        outline.Color3 = Color3.new(1, 1, 1)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    outline.LineThickness = 0.05
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                outline.SurfaceTransparency = 0.5
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            outline.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end)