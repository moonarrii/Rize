--Main/Required
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moonerri/Rizee/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moonerri/Rizee/master/Addons/InterfaceManager.lua"))()


------------------------------------
local Window = Fluent:CreateWindow({
    Title = "Rize",
    SubTitle = "[Rize True V4]",
    TabWidth = 120,
    Size = UDim2.fromOffset(560, 430),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({
        Title = "Main", Icon = "file-code"
    }),
    Settings = Window:AddTab({
        Title = "Settings", Icon = "settings"
    }),
    Dev = Window:AddTab({
        Title = "Developers", Icon = "cpu"
    })
}

local Options = Fluent.Options

do
Fluent:Notify({
    Title = "Rize [True V4]",
    Content = "Sucessfully Injected",
    SubContent = "V4", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})



Tabs.Main:AddParagraph({
    Title = "True V4",
    Content = "True V4 is in development\nCreated On 9:39PM, Sunday, March 24"
})



Tabs.Dev:AddButton({
    Title = "Iframe [Current]",
    Description = "Gets You The Ifram Position.",
    Callback = function()
    Window:Dialog({
        Title = "Iframe [Current]",
        Content = "Gives You Current Standing Location Position",
        Buttons = {
            {
                Title = "Confirm",
                Callback = function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:wait()
                local humanoidRootPart = character:WaitForChild('HumanoidRootPart')

                local position = humanoidRootPart.Position
                print(position) -- This would output the position in the output window.
                end
            },
            {
                Title = "Cancel",
                Callback = function()
                print("Cancelled the dialog.")
                end
            }
        }
    })
    end
})

Tabs.Dev:AddToggle("Print", {
    Title = "Printing Button.",
    Description = "Print's On Or Off",
    Default = false,
    Callback = function()
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
    end
})



local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"
    },
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
    end)



local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
    Title = "Dropdown",
    Description = "You can select multiple values.",
    Values = {
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"
    },
    Multi = true,
    Default = {
        "seven", "twelve"
    },
})

MultiDropdown:SetValue({
    three = true,
    five = true,
    seven = false
})

MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
    table.insert(Values, Value)
    end
    print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
    end)

Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
    Title = "Colorpicker",
    Description = "but you can change the transparency.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})

TColorpicker:OnChanged(function()
    print(
        "TColorpicker changed:", TColorpicker.Value,
        "Transparency:", TColorpicker.Transparency
    )
    end)



local Keybind = Tabs.Main:AddKeybind("Keybind", {
    Title = "KeyBind",
    Mode = "Toggle", -- Always, Toggle, Hold
    Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

-- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function(Value)
    print("Keybind clicked!", Value)
    end,

-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    ChangedCallback = function(New)
    print("Keybind changed!", New)
    end
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
    end)

Keybind:OnChanged(function()
    print("Keybind changed:", Keybind.Value)
    end)

task.spawn(function()
    while true do
    wait(1)

-- example for checking if a keybind is being pressed
    local state = Keybind:GetState()
    if state then
    print("Keybind is being held down")
    end

    if Fluent.Unloaded then break end
    end
    end)

Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


local Input = Tabs.Main:AddInput("Input", {
    Title = "Input",
    Default = "Default",
    Placeholder = "Placeholder",
    Numeric = false, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
    print("Input changed:", Value)
    end
})

Input:OnChanged(function()
    print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("RizeV4")
SaveManager:SetFolder("RizeV4/modules")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "RizeV4 [ Rize True V4]",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
