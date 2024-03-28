local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:wait()

-- Function to change avatar appearance
local function changeAvatarAppearance()
local shirt = character:FindFirstChild("Shirt")
local pants = character:FindFirstChild("Pants")

-- If the character has a shirt, change its ShirtTemplate
if shirt then
    shirt.ShirtTemplate = "rbxassetid://123456789" -- Replace with the asset ID of your shirt
end

-- If the character has pants, change its PantsTemplate
if pants then
    pants.PantsTemplate = "rbxassetid://987654321" -- Replace with the asset ID of your pants
end
end

-- Call the function when the script runs
changeAvatarAppearance()

-- Optional: If you want to re-apply the changes each time the character respawns
player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Shirt")
    character:WaitForChild("Pants")
    changeAvatarAppearance()
    end)
