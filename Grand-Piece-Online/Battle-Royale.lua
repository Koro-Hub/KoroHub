local repo = 'https://raw.githubusercontent.com/Koro-Hub/MainUi/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'Addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'Addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Koro Hub - Grand Piece Online',
    Center = false, 
    AutoShow = true,
    Size = UDim2.new(0.35, 0, 0.678, 0),
})

Library:Notify("Loading...")

_G.Playing = false

-- getgenv().Url = "https://discord.com/api/webhooks/1077609485645906041/kpDe5Mtw0gh-r1PGVlSbLGpmjYlbAMhYhMullwNU4A7IOrPsigYBHu12BfK3Q0tOt2OB"

-- local FailedVaild = {
--     ["content"] = "@everyone",
--     ["embeds"] = {{
--         ["author"] = {
--             ["name"] = "The Scirpt Has Been Executed",
--             ["icon_url"] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },
--         ["description"] = " ",
--         ["color"] = ffffff,

--         ["thumbnail"] = {
--             ['url'] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },

--         ["fields"] = {
--             {
--                 ["name"] = "Player",
--                 ["value"] =  game.Players.LocalPlayer.Name .. " Has Executed You're Script (NotSafe)",
--                 ["inline"] = false
--             }
--         }
--     }},
-- }


-- local SuccessVaild = {
--     ["content"] = "",
--     ["embeds"] = {{
--         ["author"] = {
--             ["name"] = "The Scirpt Has Been Executed",
--             ["icon_url"] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },
--         ["description"] = " ",
--         ["color"] = ffffff,

--         ["thumbnail"] = {
--             ['url'] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },

--         ["fields"] = {
--             {
--                 ["name"] = "Player",
--                 ["value"] =  game.Players.LocalPlayer.Name .. " Has Executed You're Script (Safe)",
--                 ["inline"] = false
--             }
--         }
--     }},
-- }

-- local SuccessVaild2 = {
--     ["content"] = "",
--     ["embeds"] = {{
--         ["author"] = {
--             ["name"] = "The Scirpt Has Been Executed",
--             ["icon_url"] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },
--         ["description"] = " ",
--         ["color"] = ffffff,

--         ["thumbnail"] = {
--             ['url'] = "https://cdn.discordapp.com/attachments/885585545038798858/892874252070551562/355d1bd4d0a50a086b6f36ebb49b954f.jpg",
--         },

--         ["fields"] = {
--             {
--                 ["name"] = "Player",
--                 ["value"] =  game.Players.LocalPlayer.Name .. " Has Executed You're Script (Safe) And New Key",
--                 ["inline"] = false
--             }
--         }
--     }},
-- }

local playersChecking = {
    ["eL46o68A1F3"] = 2818752071,
    ["3Kg956l5kPu"] = 4016331422
}

-- for i, v in pairs(playersChecking) do
--     print(i, v)
    
--     if v == game.Players.LocalPlayer.UserId then

--         _G.Playing = true

--     elseif v == 0 then
--         v = game.Players.LocalPlayer.UserId

--         _G.Playing = true
        
--         local response = http_request({
--             Url =  getgenv().Url,
--             Method = 'POST',
--             Headers = {
--                 ['Content-Type'] = 'application/json'
--             },
--             Body = game:GetService('HttpService'):JSONEncode(SuccessVaild2)
--         } 
--     );

--     elseif v ~= 0 and v ~= game.Players.LocalPlayer.UserId then
--         _G.Playing = false

--         local response = http_request({
--             Url =  getgenv().Url,
--             Method = 'POST',
--             Headers = {
--                 ['Content-Type'] = 'application/json'
--             },
--             Body = game:GetService('HttpService'):JSONEncode(FailedVaild)
--         } 
--     );
--     end
-- end

for iiiiiiii, vv1v1 in pairs(playersChecking) do
    if vv1v1 == game.Players.LocalPlayer.UserId and _G.key == iiiiiiii then
        _G.Playing = true
    else
        game.Players.LocalPlayer:Kick("You Get Banned")
    end
end

repeat
    task.wait()
until game:IsLoaded() and _G.Playing == true

-- You can suggest changes with a pull request or something

local Tabs = {
    Main = Window:AddTab('Battle Royale'),
    ["UI Settings"] = Window:AddTab('UI Settings')
}

local LeftGroupBox3 = Tabs.Main:AddLeftGroupbox('Player')
local LeftGroupBox4 = Tabs.Main:AddLeftGroupbox('Smart ESP')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Esp')
local LeftGroupBox2 = Tabs.Main:AddRightGroupbox('Colors')
local LeftGroupBox5 = Tabs.Main:AddRightGroupbox('Chest Colors')
local LeftGroupBox7 = Tabs.Main:AddRightGroupbox('Skills')
local LeftGroupBox6 = Tabs.Main:AddRightGroupbox('Keybinds')

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({" MenuKebinds "})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Koro Hub')
SaveManager:SetFolder('Koro Hub')

-- Builds our config menu on the right side of our tab

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!

Library:Notify("Loaded !")

local Player = game.Players.LocalPlayer
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local VirtualUser = game:GetService("VirtualUser");
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local TweenService = game:GetService("TweenService");
local Camera = workspace.CurrentCamera;
local request = (syn and syn.request) or (http and http.request) or http_request
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService");
local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name;
local ESPColor, RainbowESP = Color3.fromRGB(255, 255, 255), false;
local ESPToggle, OldEspColor = false, Color3.fromRGB(255, 255, 255);
local ChamsColor, RainbowChams = Color3.fromRGB(255, 255, 255), false;
local Nametags = false;
local TeamCheck = false;

if not syn then
    Player:Kick("You Need Synapse To Execute This Script")
end

_G.Fruit = nil

_G.Running = false

_G.Speed = false

_G.Speedy = 0

_G.SkyWalk = false

_G.NoSpeed = false

_G.Jump = false

_G.AutoFarmPlayer = true

_G.SelectedPlayer = nil

_G.SelectedPlayerName = ""

_G.CurrentPlayerDied = false

_G.ShowHitbox = false

_G.ChestESP = false

_G.EspDroppedFruits = false

local ShiftLocker = "LeftShift"

_G.InfinteyJump = false

_G.CommonChest = false

_G.UncommonChest = false

_G.RareChest = false

_G.LegandryChest = false

_G.MythicChest = false

_G.HealthDrink = false

_G.StaminaDrink = false

_G.SPReset = false

_G.DarkRoot = false

_G.SipirtEssence = false

--

local walkSpeed = 16

local jumpPower = 50

_G.Gat = false

_G.Rap = false

function SkyWalks() 
    while true do
        wait()
        if _G.SkyWalk == true then
            _G.SkyWalk = false
            if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
                local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)
    
                x.Skills.skyWalk.Value = _G.SkyWalk
            end
        elseif _G.SkyWalk == false then
            _G.SkyWalk = true
            if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
                local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)
    
                x.Skills.skyWalk.Value = _G.SkyWalk
            end
        end
    end
end

function ShiftLockS(sf)
    Player.PlayerScripts.PlayerModule.CameraModule.MouseLockController.BoundKeys.Value = sf
end

function AntiFallDamages()
    game:GetService("ReplicatedStorage").Events:FindFirstChild("FallDmg"):Destroy()
end

function AntiRagdolls()
    if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Ragdolls") then
        game:GetService("Players").LocalPlayer.PlayerScripts.Ragdolls:Destroy()
    end

    for i,v in pairs(Player.Character:GetChildren()) do
        if v:IsA("Folder") and v.Name ~= "Boosts" then
            v:Destroy()
        end
    end
end

function AntiStun()
    if game:GetService("Players").LocalPlayer:FindFirstChild("StunFolder") then
        game:GetService("Players").LocalPlayer.StunFolder:Destroy()
    end
end

spawn(function()
    while _G.SPReset == true do
        wait()

        for i, v in pairs(game.Workspace.Effects:GetChildren()) do
            if v.Name == "SP Reset Essence" then
                local x = v.Handle

                local cam = workspace.CurrentCamera

                local pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"

                if x.Name ~= "Essence112" then

                    x.Name = "Essence112"

                    local BillboardGui = Instance.new("BillboardGui")
                    local Metters = Instance.new("TextLabel")
                    local TextLabel = Instance.new("TextLabel")
                    
                    BillboardGui.Parent = x
                    BillboardGui.Name = "GPO"
                    Metters.Parent = BillboardGui
                    TextLabel.Parent = BillboardGui
                    
                    BillboardGui.AlwaysOnTop = true
                    BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                    BillboardGui.StudsOffset = Vector3.new(0,2,0)
                    
                    TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                    TextLabel.Position = UDim2.new(0, 5)
                    TextLabel.Font = 3
                    TextLabel.ZIndex = 2
                    TextLabel.Text = "SP Reset"
                    TextLabel.TextSize = 16
                    
                    TextLabel.TextColor3 = Color3.fromRGB(240, 33, 248)
                    TextLabel.BackgroundTransparency = 1
                    
                    Metters.Size = UDim2.new(1, 0, 1, 0)
                    Metters.Font = 3
                    Metters.ZIndex = 1
                    Metters.Text = pos .. "m Away"
                    Metters.TextSize = 15
                    
                    Metters.TextColor3 = Color3.fromRGB(240, 33, 248)
                    Metters.BackgroundTransparency = 1
    
                    TextLabel.TextStrokeTransparency = 0
                    Metters.TextStrokeTransparency = 0
    
                    local fx = x:FindFirstChild("GPO")
                    fx.Enabled = true
                    
                    spawn(function()
                        while true do
                            
                            wait()
    
                            if _G.SPReset == false then
                                BillboardGui.Enabled = false
                            end
    
                            if _G.SPReset == true then
                                BillboardGui.Enabled = true
                            end
                    
                            pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                            Metters.Text = pos
                        end
                    end)
                end
            end
        end
    end
end)

local Colors = {
    [1] = Color3.fromRGB(108, 88, 75),
    [2] = Color3.fromRGB(99, 95, 98),
    [3] = Color3.fromRGB(163, 162, 165),
    [4] = Color3.fromRGB(0, 0, 0),
    [5] = Color3.fromRGB(255, 180, 229)
}

local ChestColors = {
    [1] = Color3.fromRGB(161, 124, 96),
    [2] = Color3.fromRGB(255, 255, 255),
    [3] = Color3.fromRGB(109, 219, 109),
    [4] = Color3.fromRGB(126, 233, 233),
    [5] = Color3.fromRGB(222, 248, 93),
    [6] = Color3.fromRGB(128, 94, 201),
}

function ChestESP()
    spawn(function()
        while _G.ChestESP == true do
            wait()
     
            for _, Chest in pairs(game:GetService("Workspace").Effects:GetChildren()) do
                if Chest:IsA("Model") and Chest:FindFirstChild("Top") or Chest:FindFirstChild("Lock") or Chest:FindFirstChild("Bottom") then
                    if Chest:FindFirstChildOfClass("MeshPart") then
     
                        local x = Chest:FindFirstChildOfClass("MeshPart")
     
                        local cam = workspace.CurrentCamera
     
                        local pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
     
                        if x.Color == Colors[1] and not Chest:FindFirstChild("ESP Part") and _G.CommonChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Common Chest" .. Player.Name
     
                            -- if (Player.Character.HumanoidRootPart.Position - x.Position) < 500 then
     
                            local BillboardGui = Instance.new("BillboardGui")
                            local Metters = Instance.new("TextLabel")
                            local TextLabel = Instance.new("TextLabel")
                            
                            BillboardGui.Parent = x
                            BillboardGui.Name = "GPO"
                            Metters.Parent = BillboardGui
                            TextLabel.Parent = BillboardGui
                            
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                            BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                            TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                            TextLabel.Position = UDim2.new(0, 5)
                            TextLabel.Font = 3
                            TextLabel.ZIndex = 2
                            TextLabel.Text = "Common Chest"
                            TextLabel.TextSize = 16
                            
                            TextLabel.TextColor3 = ChestColors[1]
                            TextLabel.BackgroundTransparency = 1
                            
                            Metters.Size = UDim2.new(1, 0, 1, 0)
                            Metters.Font = 3
                            Metters.ZIndex = 1
                            Metters.Text = pos .. "m Away"
                            Metters.TextSize = 15
                            
                            Metters.TextColor3 = ChestColors[1]
                            Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
     
                            local fx = x:FindFirstChild("GPO")
                            fx.Enabled = true
                            
                            spawn(function()
                                while true do
                                    
                                    wait()
     
                                    if _G.CommonChest == false then
                                        BillboardGui.Enabled = false
                                    end
     
                                    if _G.CommonChest == true and _G.ChestESP == true then
                                        BillboardGui.Enabled = true
                                    end
     
                                    TextLabel.TextColor3 = ChestColors[1]
     
                                    Metters.TextColor3 = ChestColors[1]
                            
                                    pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."M Away"
                                    Metters.Text = pos
                                end
                            end)
     
     
                            -- else
                                -- x:FindFirstChild("GPO"):Destroy()
                            -- end
     
                        --     local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
     
                        --     -- config
                        --     ESP.Players = false
                        --     ESP.Boxes = false
                        --     ESP.Names = true
                        --     ESP:Toggle(true)
                            
                        --     -- object
                        
                        --     ESP:AddObjectListener(Chest, { -- Object Path, For example: Workspace.ThisFolder
                        --     Name = "CurrentESP" .. Player.Name, --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                        --     CustomName = "Common Chest", -- Name you want to be displayed
                        --     Color = Color3.fromRGB(117, 91, 71), -- Color
                        --     IsEnabled = "Chest" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        -- })
                        -- ESP.Chest = true
                    elseif x.Color ~= Colors[1] and x.Color ~= Colors[2] and x.Color ~= Colors[3] and x.Color ~= Colors[4] and x.Color ~= Colors[5] and x.Parent:IsA("Model") and x.Parent:FindFirstChild("Top") and Chest:FindFirstChild("Lock") and Chest:FindFirstChild("Bottom") and not Chest:FindFirstChild("ESP Part") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local Metters = Instance.new("TextLabel")
                        local TextLabel = Instance.new("TextLabel")
                        
                        BillboardGui.Parent = x
                        BillboardGui.Name = "GPO"
                        Metters.Parent = BillboardGui
                        TextLabel.Parent = BillboardGui
                        
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                        BillboardGui.StudsOffset = Vector3.new(0,2,0)
                        
                        TextLabel.Size = UDim2.new(0.75, 0, 0.75, 0)
                        TextLabel.Font = 3
                        TextLabel.ZIndex = 2
                        TextLabel.Text = "Chest"
                        TextLabel.TextSize = 16
                        
                        TextLabel.TextColor3 = ChestColors[2]
                        TextLabel.BackgroundTransparency = 1
                        
                        Metters.Size = UDim2.new(1, 0, 1, 0)
                        Metters.Font = 3
                        Metters.ZIndex = 1
                        Metters.Text = pos .. "m Away"
                        Metters.TextSize = 15
                        
                        Metters.TextColor3 = ChestColors[2]
                        Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
                        
                        spawn(function()
                            while true do
                                
                                wait()
                        
                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                                Metters.Text = pos
                            end
                        end)
                        
                    end
     
                        if x.Color == Colors[2] and not Chest:FindFirstChild("ESP Part") and _G.UncommonChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Uncommon Chest" .. Player.Name
     
                            -- if (Player.Character.HumanoidRootPart.Position - x.Position) < 500 then
                            local BillboardGui = Instance.new("BillboardGui")
                            local Metters = Instance.new("TextLabel")
                            local TextLabel = Instance.new("TextLabel")
                            
                            BillboardGui.Parent = x
                            BillboardGui.Name = "GPO"
                            Metters.Parent = BillboardGui
                            TextLabel.Parent = BillboardGui
                            
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                            BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                            TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                            TextLabel.Font = 3
                            TextLabel.ZIndex = 2
                            TextLabel.Text = "Uncommon Chest"
                            TextLabel.TextSize = 16
                            
                            TextLabel.TextColor3 = ChestColors[3]
                            TextLabel.BackgroundTransparency = 1
                            
                            Metters.Size = UDim2.new(1, 0, 1, 0)
                            Metters.Font = 3
                            Metters.ZIndex = 1
                            Metters.Text = pos .. "m Away"
                            Metters.TextSize = 15
                            
                            Metters.TextColor3 = ChestColors[3]
                            Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
                            
                            local fx = x:FindFirstChild("GPO")
                            fx.Enabled = true
                            
                            spawn(function()
                                while true do
                                    
                                    wait()
     
                                    if _G.UncommonChest == false then
                                        BillboardGui.Enabled = false
                                    end
     
                                    if _G.UncommonChest == true and _G.ChestESP == true then
                                        BillboardGui.Enabled = true
                                    end
     
                                    TextLabel.TextColor3 = ChestColors[3]
     
                                    Metters.TextColor3 = ChestColors[3]
                            
                                    pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."M Away"
                                    Metters.Text = pos
                                end
                            end)
     
     
                            -- else
                                -- Chest:FindFirstChild("ESP Part"):Destroy()
                            -- end
     
                            
                        --     local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
     
                        --     -- config
                        --     ESP.Players = false
                        --     ESP.Boxes = false
                        --     ESP.Names = true
                        --     ESP:Toggle(true)
                            
                        --     -- object
                        
                        --     ESP:AddObjectListener(Chest, { -- Object Path, For example: Workspace.ThisFolder
                        --     Name = "CurrentESP" .. Player.Name, --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                        --     CustomName = "Uncommon Chest", -- Name you want to be displayed
                        --     Color = Color3.new(128, 146, 95), -- Color
                        --     IsEnabled = "Chest" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        -- })
                        -- ESP.Chest = true
                        -- elseif x.Color ~= Colors[1] and x.Color ~= Colors[2] and x.Color ~= Colors[3] and x.Color ~= Colors[4] and x.Color ~= Colors[5] then                        local BillboardGui = Instance.new("BillboardGui")
                        --     local TextLabel = Instance.new("TextLabel")
        
                        --     BillboardGui.Parent = x
                        --     BillboardGui.Name = "GPO"
                        --     TextLabel.Parent = BillboardGui
        
                        --     BillboardGui.AlwaysOnTop = true
                        --     BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        --     BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                        --     TextLabel.BackgroundTransparency = 1
                        --     TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        --     TextLabel.Text = "Chest"
                        --     TextLabel.TextSize = 19
                        --     TextLabel.Font = Enum.Font.Merriweather
                        --     TextLabel.TextColor3 = Color3.new(255, 255, 255)
        
                        --     Update(BillboardGui)
                        end
     
                        if x.Color == Colors[3] and not Chest:FindFirstChild("ESP Part") and _G.RareChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Rare Chest" .. Player.Name
     
                            -- if (Player.Character.HumanoidRootPart.Position - x.Position) < 500 then
                            local BillboardGui = Instance.new("BillboardGui")
                            local Metters = Instance.new("TextLabel")
                            local TextLabel = Instance.new("TextLabel")
                            
                            BillboardGui.Parent = x
                            BillboardGui.Name = "GPO"
                            Metters.Parent = BillboardGui
                            TextLabel.Parent = BillboardGui
                            
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                            BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                            TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                            TextLabel.Font = 3
                            TextLabel.ZIndex = 2
                            TextLabel.Text = "Rare Chest"
                            TextLabel.TextSize = 16
                            
                            TextLabel.TextColor3 = ChestColors[4]
                            TextLabel.BackgroundTransparency = 1
                            
                            Metters.Size = UDim2.new(1, 0, 1, 0)
                            Metters.Font = 3
                            Metters.ZIndex = 1
                            Metters.Text = pos .. "m Away"
                            Metters.TextSize = 15
                            
                            Metters.TextColor3 = ChestColors[4]
                            Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
     
                            local fx = x:FindFirstChild("GPO")
                            fx.Enabled = true
                            
                            spawn(function()
                                while true do
                                    
                                    wait()
     
                                    if _G.RareChest == false then
                                        BillboardGui.Enabled = false
                                    end
     
                                    if _G.RareChest == true and _G.ChestESP == true then
                                        BillboardGui.Enabled = true
                                    end
     
                                    TextLabel.TextColor3 = ChestColors[4]
     
                                    Metters.TextColor3 = ChestColors[4]
                            
                                    pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."M Away"
                                    Metters.Text = pos
                                end
                            end)
     
     
                            -- else
                            --     Chest:FindFirstChild("ESP Part"):Destroy()
                            -- end
     
     
                        --     local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
     
                        --     -- config
                        --     ESP.Players = false
                        --     ESP.Boxes = false
                        --     ESP.Names = true
                        --     ESP:Toggle(true)
                            
                        --     -- object
                        
                        --     ESP:AddObjectListener(Chest, { -- Object Path, For example: Workspace.ThisFolder
                        --     Name = "CurrentESP" .. Player.Name, --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                        --     CustomName = "Rare Chest", -- Name you want to be displayed
                        --     Color = Color3.new(186, 247, 255), -- Color
                        --     IsEnabled = "Chest" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        -- })
                        -- ESP.Chest = true
                        end
     
                        if x.Color == Colors[4] and not Chest:FindFirstChild("ESP Part") and _G.LegandryChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Legandry Chest" .. Player.Name
     
     
                            -- if (Player.Character.HumanoidRootPart.Position - x.Position) < 500 then
                            local BillboardGui = Instance.new("BillboardGui")
                            local Metters = Instance.new("TextLabel")
                            local TextLabel = Instance.new("TextLabel")
                            
                            BillboardGui.Parent = x
                            BillboardGui.Name = "GPO"
                            Metters.Parent = BillboardGui
                            TextLabel.Parent = BillboardGui
                            
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                            BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                            TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                            TextLabel.Font = 3
                            TextLabel.ZIndex = 2
                            TextLabel.Text = "Legandry Chest"
                            TextLabel.TextSize = 16
                            
                            TextLabel.TextColor3 = ChestColors[5]
                            TextLabel.BackgroundTransparency = 1
                            
                            Metters.Size = UDim2.new(1, 0, 1, 0)
                            
                            Metters.Font = 3
                            Metters.ZIndex = 1
                            Metters.Text = pos .. "m Away"
                            Metters.TextSize = 15
                            
                            Metters.TextColor3 = ChestColors[5]
                            Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
     
                            local fx = x:FindFirstChild("GPO")
                            fx.Enabled = true
                            
                            spawn(function()
                                while true do
                                    
                                    wait()
     
                                    
     
                                    if _G.LegandryChest == false then
                                        BillboardGui.Enabled = false
                                    end
     
                                    if _G.LegandryChest == true and _G.ChestESP == true then
                                        BillboardGui.Enabled = true
                                    end
     
                                    TextLabel.TextColor3 = ChestColors[5]
     
                                    Metters.TextColor3 = ChestColors[5]
                            
                                    pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."M Away"
                                    Metters.Text = pos
                                end
                            end)
     
     
                            -- else
                                -- Chest:FindFirstChild("ESP Part"):Destroy()
                            -- end
     
     
                        --     local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
     
                        --     -- config
                        --     ESP.Players = false
                        --     ESP.Boxes = false
                        --     ESP.Names = true
                        --     ESP:Toggle(true)
                            
                        --     -- object
                        
                        --     ESP:AddObjectListener(Chest, { -- Object Path, For example: Workspace.ThisFolder
                        --     Name = "CurrentESP" .. Player.Name, --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                        --     CustomName = "Legandry Chest", -- Name you want to be displayed
                        --     Color = Color3.new(255, 239, 67), -- Color
                        --     IsEnabled = "Chest" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        -- })
                        -- ESP.Chest = true
                        -- elseif x.Color ~= Colors[1] and x.Color ~= Colors[2] and x.Color ~= Colors[3] and x.Color ~= Colors[4] and x.Color ~= Colors[5] then                        local BillboardGui = Instance.new("BillboardGui")
                        --     local TextLabel = Instance.new("TextLabel")
        
                        --     BillboardGui.Parent = x
                        --     BillboardGui.Name = "GPO"
                        --     TextLabel.Parent = BillboardGui
        
                        --     BillboardGui.AlwaysOnTop = true
                        --     BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        --     BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                        --     TextLabel.BackgroundTransparency = 1
                        --     TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        --     TextLabel.Text = "Chest"
                        --     TextLabel.TextSize = 19
                        --     TextLabel.Font = Enum.Font.Merriweather
                        --     TextLabel.TextColor3 = Color3.new(255, 255, 255)
        
                        --     Update(BillboardGui)
                        end
     
                        if x.Color == Colors[5] and not Chest:FindFirstChild("ESP Part") and _G.MythicChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Mythic Chest" .. Player.Name
     
                            -- if (Player.Character.HumanoidRootPart.Position - x.Position) < 500 then
                            local BillboardGui = Instance.new("BillboardGui")
                            local Metters = Instance.new("TextLabel")
                            local TextLabel = Instance.new("TextLabel")
                            
                            BillboardGui.Parent = x
                            BillboardGui.Name = "GPO"
                            Metters.Parent = BillboardGui
                            TextLabel.Parent = BillboardGui
                            
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.Size = UDim2.new(0, 100, 0, 100)
                            BillboardGui.StudsOffset = Vector3.new(0,2,0)
                            
                            TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
                            TextLabel.Font = 3
                            TextLabel.ZIndex = 2
                            TextLabel.Text = "Mythic Chest"
                            TextLabel.TextSize = 16
                            
                            TextLabel.TextColor3 = ChestColors[6]
                            TextLabel.BackgroundTransparency = 1
                            
                            Metters.Size = UDim2.new(1, 0, 1, 0)
                            Metters.Font = 3
                            Metters.ZIndex = 1
                            Metters.Text = pos .. "m Away"
                            Metters.TextSize = 15
                            
                            Metters.TextColor3 = ChestColors[6]
                            Metters.BackgroundTransparency = 1
     
                            TextLabel.TextStrokeTransparency = 0
                            Metters.TextStrokeTransparency = 0
     
                            local fx = x:FindFirstChild("GPO")
                            fx.Enabled = true
                            
                            spawn(function()
                                while true do
                                    
                                    wait()
     
                                    if _G.MythicChest == false then
                                        BillboardGui.Enabled = false
                                    end
     
                                    if _G.MythicChest == true and _G.ChestESP == true then
                                        BillboardGui.Enabled = true
                                    end
     
                                    TextLabel.TextColor3 = ChestColors[6]
     
                                    Metters.TextColor3 = ChestColors[6]
                            
                                    pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."M Away"
                                    Metters.Text = pos
                                end
                            end)
     
     
                            -- else
                                -- Chest:FindFirstChild("ESP Part"):Destroy()
                            -- end
                        end
                    end
                end
            end
        end
     end)
     
     spawn(function()
        while _G.ChestESP == false do
            wait()
            for _, Chest in pairs(game:GetService("Workspace").Effects:GetChildren()) do
                if Chest:IsA("Model") and Chest:FindFirstChild("Top") or Chest:FindFirstChild("Lock") or Chest:FindFirstChild("Bottom") then
                    if Chest:FindFirstChildOfClass("MeshPart") then
                        local x = Chest:FindFirstChildOfClass("MeshPart")
                        
                        if x.Color == Colors[1] and Chest:FindFirstChild("ESP Part") and _G.CommonChest == false then
                            if x:FindFirstChild("GPO") then
                                local fx = x:WaitForChild("GPO")
                                fx.Enabled = false
                            end
                        end
     
                        if x.Color == Colors[3] and Chest:FindFirstChild("ESP Part") and _G.UncommonChest == false then
     
                            if x:FindFirstChild("GPO") then
                                local fx = x:WaitForChild("GPO")
                                fx.Enabled = false
                            end
                        end
     
                        if x.Color == Colors[4] and Chest:FindFirstChild("ESP Part") and _G.RareChest == false then
                            if x:FindFirstChild("GPO") then
                                local fx = x:WaitForChild("GPO")
                                fx.Enabled = false
                            end
                        end
     
                        if x.Color == Colors[5] and Chest:FindFirstChild("ESP Part") and _G.LegandryChest == false then
                            if x:FindFirstChild("GPO") then
                                local fx = x:WaitForChild("GPO")
                                fx.Enabled = false
                            end
                        end
     
                        if x.Color == Colors[6] and Chest:FindFirstChild("ESP Part") and _G.MythicChest == false then
                            if x:FindFirstChild("GPO") then
                                local fx = x:WaitForChild("GPO")
                                fx.Enabled = false
                            end
                        end
                    end
                end
            end
        end
     end)
end

local s_rs = game:GetService("RunService")
local l_plr = game:GetService("Players").LocalPlayer


local l_humrp = l_plr.Character and l_plr.Character:FindFirstChild("HumanoidRootPart")
local l_hum = l_plr.Character and l_plr.Character:FindFirstChild("Humanoid")

local resp_con = l_plr.CharacterAdded:Connect(function(c)
    l_humrp = c:WaitForChild("HumanoidRootPart",3)
    l_hum = c:WaitForChild("Humanoid",3)
end)

local function dnec(signal) 
    local s = {}
    for _, con in ipairs(getconnections(signal)) do 
        local func = con.Function
        if (func and islclosure(func)) then
            if (not is_synapse_function(func)) then 
                s[#s+1] = con
                con:Disable() 
            end
        end
    end
    return s
end

_G.Kebind = ""

LeftGroupBox3:AddToggle('WalkSpeedToggle', {
    Text = 'Walkspeed',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make You Faster', -- Information shown when you hover over the toggle
})

Toggles.WalkSpeedToggle:OnChanged(function()

    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local W, A, S, D
    local xVelo, yVelo
    
    RS.RenderStepped:Connect(function()

        if Toggles.WalkSpeedToggle.Value == true and _G.Kebind == "" then

            local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

            HRP.Anchored = false

            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25

            local C = game.Workspace.CurrentCamera
            local LV = C.CFrame.LookVector
            for i,v in pairs(UIS:GetKeysPressed()) do
                if v.KeyCode == Enum.KeyCode.W then
                    W = true
                end
                if v.KeyCode == Enum.KeyCode.A then
                    A = true
                end
                if v.KeyCode == Enum.KeyCode.S then
                    S = true
                end
                if v.KeyCode == Enum.KeyCode.D then
                    D = true
                end
            end
         
            if W == true and S == true then
                yVelo = false
                W,S = nil
            end
         
            if A == true and D == true then
                xVelo = false
                A,D = nil
            end
         
            if yVelo ~= false then
                if W == true then
                    if xVelo ~= false then
                        if A == true then
                            local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                            HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                            W,A = nil
                        else
                            if D == true then
                                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                                HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                W,D = nil
                            end
                        end
                    end
                else
                    if S == true then
                        if xVelo ~= false then
                            if A == true then
                                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                                HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                                S,A = nil
                            else
                                if D == true then
                                    local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                                    HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                    S,D = nil
                                end
                            end
                        end
                    end
                end
            end
         
            if W == true then
                HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
            end
            if S == true then
                HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
            end
            if A == true then
                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
                HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
            end
            if D == true then
                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
                HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
            end
         
            xVelo, yVelo, W, A, S, D = nil
        end
    end)
end)

_G.Walk = false

_G.JumpP = false

_G.Keybind2 = ""

LeftGroupBox3:AddToggle('JumpPowerToggle', {
    Text = 'JumpPower',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.JumpPowerToggle:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
        if Toggles.JumpPowerToggle.Value == true and _G.Keybind2 == "" then

            local jumpVelocity = math.sqrt(2 * jumpPower * game.Workspace.Gravity)
    
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
        end
    end)
end)

_G.hitbox123123 = false

_G.AutoFarmNear = false

_G.Oa = false

_G.Pla = false

_G.Kebind3 = ""

local playersBlackList = {}

function AutoFarm()
    while _G.AutoFarmNear == true do
        wait()

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= Player and v.Character:FindFirstChild("HumanoidRootPart") then
                if (Player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    local x = Player.Party

                    for ss, d in pairs(game:GetService("ReplicatedStorage").currentParty:GetChildren()) do
                        if Players:FindFirstChild(d.Name) then
                            for iss, pp in pairs(d:GetChildren()) do
                                if d.Name == Player.Name then
                                    for k, l in pairs(d:GetChildren()) do
                                        table.insert(playersBlackList, l.Name)
                                    end
                                else
                                    if pp.Name == Player.Name then  
                                        for k, l in pairs(d:GetChildren()) do
                                            if table.find(playersBlackList, l.Name) then
                                                print("Player Is Already IN Black List")
                                            else
                                                table.insert(playersBlackList, l.Name)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    for ssii, ppss in pairs(playersBlackList) do
                        if v.Name ~= ppss then
                            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                        end
                    end
                end
            end
        end
    end
end

LeftGroupBox3:AddToggle('AutoFarmNearest', {
    Text = 'Auto Farm Nearest Player',
    Default = false, -- Default value (true / false)
    Tooltip = 'Auto Kill Nearest Player', -- Information shown when you hover over the toggle
})

Toggles.AutoFarmNearest:OnChanged(function()
    _G.Pla = Toggles.AutoFarmNearest.Value

    _G.AutoFarmNear = Toggles.AutoFarmNearest.Value
    AutoFarm()

    -- if _G.Keybind3 == "" then
    --     _G.AutoFarmNear = Toggles.AutoFarmNearest.Value
    --     AutoFarm()
    -- end
end)

LeftGroupBox3:AddToggle('Hitbox001', {
    Text = 'Hitbox Extender',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make Killaura For All Players', -- Information shown when you hover over the toggle
})

spawn(function()
    while true do
        task.wait()

        if _G.hitbox123123 == true then
            for _, loi1oo in pairs(game.Players:GetPlayers()) do
                if loi1oo ~= game.Players.LocalPlayer then
                    if loi1oo.Character:FindFirstChild("HumanoidRootPart") then
                        loi1oo.Character:WaitForChild("HumanoidRootPart").Size = Vector3.new(30, 30, 30)
                    end
                end
            end
        elseif _G.hitbox123123 == false then
            for _, loi1oo in pairs(game.Players:GetPlayers()) do
                if loi1oo ~= game.Players.LocalPlayer then
                    if loi1oo.Character:FindFirstChild("HumanoidRootPart") then
                        loi1oo.Character:WaitForChild("HumanoidRootPart").Size = Vector3.new(2, 2, 1)
                    end
                end
            end
        end
    end
end)

Toggles.Hitbox001:OnChanged(function()
    _G.hitbox123123 = Toggles.Hitbox001.Value
end)

LeftGroupBox3:AddToggle('SkyWalksToggle', {
    Text = 'Sky Walk',
    Default = false, -- Default value (true / false)
    Tooltip = 'Gives You Sky Walk For Free ', -- Information shown when you hover over the toggle
})

LeftGroupBox3:AddToggle('InfintyJumpToggle', {
    Text = 'Infinty Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make You Have Infinty Jump', -- Information shown when you hover over the toggle
})

Toggles.InfintyJumpToggle:OnChanged(function()
    
    local uis = game:GetService("UserInputService")

    uis.InputBegan:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then
            return
        end

        if input.KeyCode == Enum.KeyCode.Space and Toggles.InfintyJumpToggle.Value then
            local hum = Player.Character:WaitForChild("Humanoid")
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

Toggles.SkyWalksToggle:OnChanged(function()
    _G.SkyWalk = Toggles.SkyWalksToggle.Value
    if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
        local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)

        x.Skills.skyWalk.Value = _G.SkyWalk
    end
end)

local devilfruits = {}

LeftGroupBox3:AddToggle('WaterDrown', {
    Text = 'Swim With Fruit',
    Default = false, -- Default value (true / false)
    Tooltip = 'prevent you from drowning', -- Information shown when you hover over the toggle
})

Toggles.WaterDrown:OnChanged(function()
    local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF

    if Toggles.WaterDrown.Value == true then

        if x then
            spawn(function()
                while Toggles.WaterDrown.Value == true do
                    task.wait()
                    x.Value = ""
                end
            end)
        end
    else
        if x then
            spawn(function()
                while Toggles.WaterDrown.Value == false do
                    task.wait()
                    x.Value = "Magu-Magu"
                end
            end)
        end
    end
end)

_G.KeybindGat = ""
_G.KeybindRap = ""

_G.Gatling = false

_G.RapidSlashes = false

LeftGroupBox7:AddToggle('Gatling', {
    Text = 'Smart Gatling',
    Default = false, -- Default value (true / false)
    Tooltip = 'Spam Gatling (Requires Gomu)', -- Information shown when you hover over the toggle
})

function Gatlings()
    while _G.Gatling == true do

        wait()

        if _G.KeybindGat == "" then
            local args = {
                [1] = "Gomu-Gomu no Gatling",
                [2] = {
                    ["cf"] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(3.141592502593994, 0.17062515020370483, -3.141592502593994)
                }
            }
        
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

Toggles.Gatling:OnChanged(function()
    _G.Gatling = Toggles.Gatling.Value
    _G.Gat = Toggles.Gatling.Value
    Gatlings()
end)

LeftGroupBox7:AddToggle('RapidSlashes', {
    Text = 'Smart Rapid Slashes',
    Default = false, -- Default value (true / false)
    Tooltip = 'Spam Rapid Slashes (Requires Katana)', -- Information shown when you hover over the toggle
})

function RapidSlashes()
    while _G.RapidSlashes == true do

        wait()

        if _G.KeybindRap == "" then
            local args = {
                [1] = "Rapid Slashes"
            }
    
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

Toggles.RapidSlashes:OnChanged(function()
    _G.RapidSlashes = Toggles.RapidSlashes.Value
    _G.Rap = Toggles.RapidSlashes.Value
    RapidSlashes()
end)

-- LeftGroupBox3:AddToggle('AntiDrownToggles', {
--     Text = 'Anti Drown',
--     Default = false, -- Default value (true / false)
--     Tooltip = 'May This Kick You 90%', -- Information shown when you hover over the toggle
-- })

-- Toggles.AntiDrownToggles:OnChanged(function()
--     local t = Toggles.AntiDrownToggles.Value

--     while t == true do
--         wait()

--         local ef = game:GetService("Workspace").Islands["Town of Beginnings"]
        
--         local part = Instance.new("Part")
--         part.Parent = ef
--         part.Name = "Part"
--         part.Size = Vector3.new(16, .5 ,16)
--         part.Transparency = 0
--         part.Anchored = true
        
--         spawn(function()
--             while t == true do
--                 wait()
--                 part.CFrame = CFrame.new(Player.Character.HumanoidRootPart.CFrame.X, 1.75, Player.Character.HumanoidRootPart.CFrame.Z)
--             end
--         end)

--         spawn(function()
--             while t == false do
--                 wait()
--                 part.CFrame = CFrame.new(9999,9999,9999)
--                 part:Destroy()
--             end
--         end)

--         spawn(function()
--             while true do
--                 wait()
--                 part:Destroy()
--             end
--         end)
--     end
-- end)

LeftGroupBox4:AddToggle('ChestESP_Toggle', {
    Text = 'Chest ESP',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make You See Every Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.ChestESP_Toggle:OnChanged(function()
    _G.ChestESP = Toggles.ChestESP_Toggle.Value
    ChestESP()
end)

LeftGroupBox4:AddToggle('Common_Toggle', {
    Text = 'Common Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Common Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Common_Toggle:OnChanged(function()
    _G.CommonChest = Toggles.Common_Toggle.Value
end)

LeftGroupBox4:AddToggle('Uncommon_Toggle', {
    Text = 'Uncommon Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Uncommon Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Uncommon_Toggle:OnChanged(function()
    _G.UncommonChest = Toggles.Uncommon_Toggle.Value
end)

LeftGroupBox4:AddToggle('RareChest_Toggle', {
    Text = 'Rare Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Rare Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.RareChest_Toggle:OnChanged(function()
    _G.RareChest = Toggles.RareChest_Toggle.Value
end)

LeftGroupBox4:AddToggle('Legandry_Toggle', {
    Text = 'Legandry Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Legandry Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Legandry_Toggle:OnChanged(function()
    _G.LegandryChest = Toggles.Legandry_Toggle.Value
end)

LeftGroupBox4:AddToggle('Mythic_Toggle', {
    Text = 'Mythic Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Mythic Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Mythic_Toggle:OnChanged(function()
    _G.MythicChest = Toggles.Mythic_Toggle.Value
end)

-- LeftGroupBox:AddSlider('SliderSpeed', {
--     Text = 'WalkSpeed',

--     Default = 16,
--     Min = 1,
--     Max = 100,
--     Rounding = 0,

--     Compact = false, -- If set to true, then it will hide the label
-- })

-- LeftGroupBox3:AddSlider('HitboxSlider', {
--     Text = 'Hitbox Extender',

--     Default = 2,
--     Min = 2,
--     Max = 50,
--     Rounding = 1,

--     Compact = false, -- If set to true, then it will hide the label
-- })

-- LeftGroupBox3:AddSlider('TransparencySlider', {
--     Text = 'Hitbox Transparency',

--     Default = 1,
--     Min = 0,
--     Max = 1,
--     Rounding = 2,

--     Compact = false, -- If set to true, then it will hide the label
-- })

-- Options.TransparencySlider:OnChanged(function()
--     for _, loi1oo in pairs(game.Players:GetPlayers()) do
--         if loi1oo ~= Player then
--             if loi1oo.Character:FindFirstChild("HumanoidRootPart") then
--                 loi1oo.Character:WaitForChild("HumanoidRootPart").Transparency = Options.TransparencySlider.Value
--             end
--         end
--     end
-- end)


-- LeftGroupBox:AddToggle('ESPDroppedFruits', {
--     Text = 'Auto ESP Dropped Fruits',
--     Default = false, -- Default value (true / false)
--     Tooltip = 'Make ESP For Dropped Fruits', -- Information shown when you hover over the toggle
-- })

-- Toggles.ESPDroppedFruits:OnChanged(function()
--     while Toggles.ESPDroppedFruits.Value == true do

--         wait()

--         for i, v in pairs(game.Workspace:GetChildren()) do
--             if v:IsA("Tool") and _G.Fruit == nil then
--                 _G.Fruit = v.Name
    
--                 if v:FindFirstChild("preHandle") then
--                     _G.Sele = v:FindFirstChild("preHandle")
--                     _G.Sele.Name = "ESP"
    
--                     local BillboardGui = Instance.new("BillboardGui")
--                     local TextLabel = Instance.new("TextLabel")
    
--                     BillboardGui.Parent = _G.Sele
--                     BillboardGui.Name = "GPO"
--                     TextLabel.Parent = BillboardGui
    
--                     BillboardGui.AlwaysOnTop = true
--                     BillboardGui.Size = UDim2.new(0, 50, 0, 50)
--                     BillboardGui.StudsOffset = Vector3.new(0,2,0)
                    
--                     TextLabel.BackgroundTransparency = 1
--                     TextLabel.Size = UDim2.new(1, 0, 1, 0)
--                     TextLabel.Text = _G.Fruit
--                     TextLabel.TextSize = 17
--                     TextLabel.Font = 3
--                     TextLabel.TextColor3 = Color3.new(0, 255, 110)
    
--                     _G.Fruit = nil
    
--                     spawn(function()
--                         while true do
--                             wait()
--                             if v.Parent ~= game.Workspace then
--                                 BillboardGui:Destroy()
--                             end
--                         end
--                     end)
--                 end
--             else
--                 _G.Fruit = nil
--             end
--         end
--     end
-- end)

local AntiRagdoll = LeftGroupBox3:AddButton('Anti Ragdoll', function()
    AntiRagdolls()
end)

AntiRagdoll:AddTooltip("Make You Can't To Be Ragdolled")

local AntiStun = LeftGroupBox3:AddButton('Anti Stun', function()
    AntiStun()
end)

AntiStun:AddTooltip("Make You Can't To Be Stunned")

local AntiFallDamage = LeftGroupBox3:AddButton('Anti FallDamage', function()
    AntiFallDamages()
end)

AntiFallDamage:AddTooltip("Make You Can't To Get FallDamage")

LeftGroupBox3:AddSlider('WalkspeedSlider', {
    Text = 'Speed',

    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
})

Options.WalkspeedSlider:OnChanged(function()
    walkSpeed = Options.WalkspeedSlider.Value
end)

LeftGroupBox3:AddSlider('JumpPowerSlider', {
    Text = 'JumpPower',

    Default = 50,
    Min = 50,
    Max = 350,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
})

Options.JumpPowerSlider:OnChanged(function()
    jumpPower = Options.JumpPowerSlider.Value
end)

-- local DrainNo = LeftGroupBox3:AddButton('No Stamina Drain', function()
--     local X;
--     local func;
--     local script = game.Players.LocalPlayer.Backpack.Movements
--     X = hookmetamethod(game, "__namecall", function(self, ...)
--        if tostring(self) == "takestam" then
--            return;
--        end
--        return X(self, ...)
--     end)
--     for i,v in pairs(getreg()) do
--        if type(v) == 'function' and getfenv(v).script then
--            if getfenv(v).script == script then
--                local upvalues = getupvalues(v)
--                if tostring(upvalues[12]) == "Ragdolls" then
--                    func = v
--                end
--            end
--        end
--     end
--     spawn(function()
--        while wait() do
--            setupvalue(func, 6, false)
--        end
--     end)
-- end)

-- DrainNo:AddTooltip("No Dash Stamina")

Players.PlayerAdded:Connect(function(Player)
    if ESPToggle then
        DrawESP(Player);
    end

    if Tracers then
        DrawTracer(Player);
    end

    if Nametags then
        DrawNametag(Player);
    end
end)
Instance.new("ScreenGui", game.CoreGui).Name = "Kaoru"
local ChamsFolder = Instance.new("Folder")
ChamsFolder.Name = "ChamsFolder"
for _, GUI in next, game.CoreGui:GetChildren() do
    if GUI:IsA('ScreenGui') and GUI.Name == 'Kaoru' then
        ChamsFolder.Parent = GUI
    end
end
Players.PlayerRemoving:Connect(function(Player)
    if ChamsFolder:FindFirstChild(Player.Name) then
        ChamsFolder[Player.Name]:Destroy()
    end
end)

local ChamsToggle, OldChamsColor = false, Color3.fromRGB(255, 255, 255);
local function IsSameTeam(Player, Toggle)
    return not Toggle or Player.Team ~= LocalPlayer.Team;
end

local function IsAlive(Player)
    return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0;
end

local function IsHolding()
    return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
end

local function IsOnScreen(Part)
    local _, OnScreen = Camera:WorldToViewportPoint(Part.Position);

    return OnScreen;
end

local function IsVisible(Player)
    local Parts = Camera:GetPartsObscuringTarget({Camera.CFrame.Position, Player.Character.HumanoidRootPart.Position}, {Player.Character})

    for Index, Part in next, Parts do
        if Part.Transparency == 1 or Part.CanCollide == false then
            Parts[Index] = nil;
        end
    end

    return #Parts == 0;
end

local function FormatNametag(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") then
        if not IsAlive(Player) or Player.Character.Humanoid.Health <= 0 then
            return ("[0] " .. Player.Name .. " User Fruit: " .. game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF.Value .. "| %sHP"):format(Player.Character.Humanoid.Health)
        end

        if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF.Value == "" then
            game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF.Value = "Fruitless"
        end

        return string.format("[%s] %s %s | %sHP",
        HumanoidRootPart and tostring(math.round((Player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude)) or "N/A",
        Player.Name,
        game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF.Value,
        tostring(math.round(Player.Character.Humanoid.Health)))
    end
end

local function DrawNametag(Player)
    local Nametag = Drawing.new("Text");
    Nametag.Visible = true;
    Nametag.Text = "";
    Nametag.Size = 20;
    Nametag.Color = Color3.fromRGB(255, 255, 255);
    Nametag.Outline = true;

    local function UpdateNametag()
        task.spawn(function()
            while true do task.wait()
                if not Nametags then
                    Nametag.Visible = false;
                    break;
                end
                if RainbowESP then
                    Nametag.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1);
                else
                    Nametag.Color = Color3.fromRGB(255, 255, 255);
                end

                if Player and Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Head") then
                    local HeadPosition = Camera:WorldToViewportPoint(Player.Character.Head.Position);

                    if Player and Nametags and IsSameTeam(Player, TeamCheck) and IsOnScreen(Player.Character.HumanoidRootPart) and IsAlive(Player) then
                        Nametag.Text = FormatNametag(Player);
                        Nametag.Font = 3
                        Nametag.Size = 16
                        Nametag.ZIndex = 2
                        Nametag.Visible = true
                        Nametag.Position = Vector2.new(HeadPosition.X - (Nametag.TextBounds.X / 2), HeadPosition.Y - (Nametag.TextBounds.Y * 1.25));
                        Nametag.Color = ESPColor
                    else
                        Nametag.Visible = false;
                    end
                else
                    Nametag.Visible = false;
                end
            end
        end)
    end
    coroutine.wrap(UpdateNametag)();
end

local function GetCorners(Part)
    local Size = Part.Size * Vector3.new(1, 1.5)
    return {
        TopRight = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position;
        BottomRight = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position;
        TopLeft = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position;
        BottomLeft = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position;
    };
end

RightGroupBox:AddToggle('HightLight_tog', {
    Text = 'Highlight',
    Default = false, -- Default value (true / false)
    Tooltip = 'Shows you the player through the walls!', -- Information shown when you hover over the toggle
})

Toggles.HightLight_tog:OnChanged(function()
    ChamsToggle = Toggles.HightLight_tog.Value;

    task.spawn(function()
        while ChamsToggle do task.wait()
            if RainbowChams then
                ChamsColor = Color3.fromHSV(tick() % 5 / 5, 1, 1);
            else
                ChamsColor = OldChamsColor;
            end

            for _, Player in next, Players:GetPlayers() do
                if ChamsFolder:FindFirstChild(Player.Name) then
                    Chams = ChamsFolder[Player.Name];
                    Chams.Enabled = false;
                    Chams.FillColor = Color3.fromRGB(255, 255, 255);
                    Chams.OutlineColor = ChamsColor;
                end
                if Player ~= LocalPlayer and Player.Character and IsSameTeam(Player, TeamCheck) then
                    if ChamsFolder:FindFirstChild(Player.Name) == nil then
                        local Highlight = Instance.new("Highlight");
                        Highlight.Name = Player.Name;
                        Highlight.Parent = ChamsFolder;
                        Chams = Highlight;
                    end
                    Chams.Enabled = true;
                    Chams.Adornee = Player.Character;
                    Chams.OutlineTransparency = 0;
                    Chams.DepthMode = Enum.HighlightDepthMode[(true and "AlwaysOnTop" or "Occluded")];
                    Chams.FillTransparency = 1;
                end
            end

            if not ChamsToggle then
                for _, Player in next, Players:GetPlayers() do
                    if ChamsFolder:FindFirstChild(Player.Name) then
                        Chams = ChamsFolder[Player.Name];
                        Chams.Enabled = false;
                        Chams:Destroy();
                    end
                end
                break;
            end
        end
    end)
end)

RightGroupBox:AddToggle('Names_tog', {
    Text = 'Names',
    Default = false, -- Default value (true / false)
    Tooltip = 'Esp Name: shows player name | the fruit he ate | his health', -- Information shown when you hover over the toggle
})

Toggles.Names_tog:OnChanged(function()
    -- if Toggles.Names_tog.Value == true then
        Nametags = Toggles.Names_tog.Value;

        if Nametags then
            for _, Player in next, Players:GetPlayers() do
                DrawNametag(Player);
            end
        end
    -- end
end)

LeftGroupBox2:AddLabel('Hightlight Color'):AddColorPicker('HighLight', {
    Default = ChamsColor, -- Bright green
    Title = "Highlight Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.HighLight:OnChanged(function()
    OldChamsColor = Options.HighLight.Value
end)

LeftGroupBox2:AddLabel('Names Color'):AddColorPicker('Nammes', {
    Default = ChamsColor, -- Bright green
    Title = "Highlight Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.Nammes:OnChanged(function()
    ESPColor = Options.Nammes.Value
end)

LeftGroupBox5:AddLabel('Common Chest'):AddColorPicker('ChestCommonColor', {
    Default = ChestColors[1], -- Bright green
    Title = "Common Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestCommonColor:OnChanged(function()
    ChestColors[1] = Options.ChestCommonColor.Value
end)

--

LeftGroupBox5:AddLabel('Uncommon Chest'):AddColorPicker('ChestUncommonColor', {
    Default = ChestColors[3], -- Bright green
    Title = "Uncommon Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestUncommonColor:OnChanged(function()
    ChestColors[3] = Options.ChestUncommonColor.Value
end)

--

LeftGroupBox5:AddLabel('Rare Chest'):AddColorPicker('ChestRareColor', {
    Default = ChestColors[4], -- Bright green
    Title = "Rare Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestRareColor:OnChanged(function()
    ChestColors[4] = Options.ChestRareColor.Value
end)

--

LeftGroupBox5:AddLabel('Legandry Chest'):AddColorPicker('ChestLegandryColor', {
    Default = ChestColors[5], -- Bright green
    Title = "Legandry Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

--

Options.ChestLegandryColor:OnChanged(function()
    ChestColors[5] = Options.ChestLegandryColor.Value
end)

LeftGroupBox5:AddLabel('Mythic Chest'):AddColorPicker('ChestMythicColor', {
    Default = ChestColors[6], -- Bright green
    Title = "Mythic Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestMythicColor:OnChanged(function()
    ChestColors[6] = Options.ChestMythicColor.Value
end)

-- LeftGroupBox4:AddDropdown('MultiChestESP', {
--    Values = { 'Common Chest', 'Uncommon Chest', 'Rare Chest', 'Legandry Chest', "Mythic Chest"},
--    Default = 0,
--    Multi = true, -- true / false, allows multiple choices to be selected

--    Text = 'Chests Esp',
--    Tooltip = 'Toggle the chests you want to show !', -- Information shown when you hover over the textbox
-- })

-- Options.MultiChestESP:OnChanged(function()
--    for key, value in next, Options.MultiChestESP.Value do

--        if key == "Common Chest" then
--            _G.CommonChest = value
--            Library:Notify("Common Chest" .. " is " .. tostring(value))
--         end

--         if key == "Uncommon Chest" then
--            _G.UncommonChest = value
--            Library:Notify("Uncommon Chest" .. " is " .. tostring(value))
--         end

--         if key == "Rare Chest" then
--            _G.RareChest = value
--            Library:Notify("Rare Chest" .. " is " .. tostring(value))
--         end

--         if key == "Legandry Chest" then
--            _G.LegandryChest = value
--            Library:Notify(key .. " is " .. tostring(value))
--         end

--         if key == "Mythic Chest" then
--            _G.MythicChest = value
--            Library:Notify(key .. " is " .. tostring(value))
--        end
--    end
-- end)

-- LeftGroupBox4:AddDropdown('MultiItemsEsp', {
--     Values = { 'Health Drink', 'Stamina Chest', 'SP Reset', 'Legandry Chest', "Mythic Chest"},
--     Default = 0,
--     Multi = true, -- true / false, allows multiple choices to be selected
 
--     Text = 'Items Esp',
--     Tooltip = 'Toggle the Items you want to show !', -- Information shown when you hover over the textbox
--  })
 
--  Options.MultiItemsEsp:OnChanged(function()
--     for key, value in next, Options.MultiItemsEsp.Value do
 
--         if key == "Common Chest" then
--             _G.CommonChest = value
--             Library:Notify("Common Chest" .. " is " .. tostring(value))
--          end
 
--          if key == "Uncommon Chest" then
--             _G.UncommonChest = value
--             Library:Notify("Uncommon Chest" .. " is " .. tostring(value))
--          end
 
--          if key == "Rare Chest" then
--             _G.RareChest = value
--             Library:Notify("Rare Chest" .. " is " .. tostring(value))
--          end
 
--          if key == "Legandry Chest" then
--             _G.LegandryChest = value
--             Library:Notify(key .. " is " .. tostring(value))
--          end
 
--          if key == "Mythic Chest" then
--             _G.MythicChest = value
--             Library:Notify(key .. " is " .. tostring(value))
--         end
--     end
--  end)

--  LeftGroupBox4:AddDropdown('MultiItemsEsp', {
--     Values = { 'Health Drink', 'Stamina Chest', 'SP Reset Essence', 'Dark Root', "Spirit Essence"},
--     Default = 0,
--     Multi = true, -- true / false, allows multiple choices to be selected
 
--     Text = 'Items Esp',
--     Tooltip = 'Toggle the Items you want to show !', -- Information shown when you hover over the textbox
--  })
 
--  Options.MultiItemsEsp:OnChanged(function()
--     for key, value in next, Options.MultiItemsEsp.Value do
 
--         if key == "Health Drink" then
--             _G.HealthDrink = value
--          end
 
--          if key == "Stamina Drink" then
--             _G.StaminaDrink = value
--          end
 
--          if key == "SP Reset Essence" then
--             _G.SPReset = value
--          end
 
--          if key == "Dark Root" then
--             _G.DarkRoot = value
--          end

--          if key == "Sipirt Essence" then
--             _G.SipirtEssence = value
--          end
--     end
--  end)

-- Keybinds

LeftGroupBox6:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',
 {
     Default = 'LeftAlt',
     NoUI = false,
     Text = 'Menu keybind'
     }) 

Library.ToggleKeybind = Options.MenuKeybind

LeftGroupBox6:AddLabel('Walkspeed'):AddKeyPicker('WalkSpeedKey', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable WalkSpeed', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.WalkSpeedKey:OnClick(function()

    if Options.WalkSpeedKey.Value ~= "" then
        _G.Kebind = Options.WalkSpeedKey.Value
    end

    if _G.Walk == true then
        _G.Walk = false
    elseif _G.Walk == false then
        _G.Walk = true
    end
    
    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local W, A, S, D
    local xVelo, yVelo
    
    RS.RenderStepped:Connect(function()

        if Toggles.WalkSpeedToggle.Value == true and _G.Walk == true then

            local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

            HRP.Anchored = false

            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25

            local C = game.Workspace.CurrentCamera
            local LV = C.CFrame.LookVector
            for i,v in pairs(UIS:GetKeysPressed()) do
                if v.KeyCode == Enum.KeyCode.W then
                    W = true
                end
                if v.KeyCode == Enum.KeyCode.A then
                    A = true
                end
                if v.KeyCode == Enum.KeyCode.S then
                    S = true
                end
                if v.KeyCode == Enum.KeyCode.D then
                    D = true
                end
            end
         
            if W == true and S == true then
                yVelo = false
                W,S = nil
            end
         
            if A == true and D == true then
                xVelo = false
                A,D = nil
            end
         
            if yVelo ~= false then
                if W == true then
                    if xVelo ~= false then
                        if A == true then
                            local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                            HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                            W,A = nil
                        else
                            if D == true then
                                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                                HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                W,D = nil
                            end
                        end
                    end
                else
                    if S == true then
                        if xVelo ~= false then
                            if A == true then
                                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                                HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                                S,A = nil
                            else
                                if D == true then
                                    local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                                    HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                    S,D = nil
                                end
                            end
                        end
                    end
                end
            end
         
            if W == true then
                HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
            end
            if S == true then
                HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
            end
            if A == true then
                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
                HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
            end
            if D == true then
                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
                HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
            end
         
            xVelo, yVelo, W, A, S, D = nil
        end
    end)
end)

LeftGroupBox6:AddLabel('JumpPower'):AddKeyPicker('JumpPowerKeybind', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable JumpPower', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.JumpPowerKeybind:OnClick(function()

    _G.Keybind2 = Options.JumpPowerKeybind.Value

    if _G.JumpP == true then
        _G.JumpP = false
    elseif _G.JumpP == false then
        _G.JumpP = true
    end

    game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
        if Toggles.JumpPowerToggle.Value == true and _G.JumpP == true then

            local jumpVelocity = math.sqrt(2 * jumpPower * game.Workspace.Gravity)
    
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
        end
    end)
end)

function GatlingKey()
    while _G.Gat == true do

        wait()

        if _G.KeybindGat ~= "" then
            local args = {
                [1] = "Gomu-Gomu no Gatling",
                [2] = {
                    ["cf"] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(3.141592502593994, 0.17062515020370483, -3.141592502593994)
                }
            }
        
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

function RapidSlashesKey()
    while _G.Rap == true do

        wait()

        if _G.KeybindRap ~= "" then
            local args = {
                [1] = "Rapid Slashes"
            }
    
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

LeftGroupBox6:AddLabel('Smart Rapid Slashes'):AddKeyPicker('RapidSlashesKeybind', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable Rapid Slashes', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.RapidSlashesKeybind:OnClick(function()
    if _G.Rap == true then
        _G.Rap = false
    elseif _G.Rap == false then
        _G.Rap = true
    end

    if Options.RapidSlashesKeybind.Value ~= "" then
        _G.KeybindRap = Options.RapidSlashesKeybind.Value
    end
    RapidSlashesKey()
end)

LeftGroupBox6:AddLabel('Smart Gatling'):AddKeyPicker('GatlingSmart', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable Gatling', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle/
-- Otherwise, you will have to use Keybind:GetState()
Options.GatlingSmart:OnClick(function()
    if _G.Gat == true then
        _G.Gat = false
    elseif _G.Gat == false then
        _G.Gat = true
    end

    if Options.GatlingSmart.Value ~= "" then
        _G.KeybindGat = Options.GatlingSmart.Value
    end
    GatlingKey()
end)

-- _G.Oa1 = false

-- _G.JJk = false

-- function newFarm()
--     while _G.JJk == true do
--         wait()

--         for i, v in pairs(game.Players:GetPlayers()) do
--             if v.Character:FindFirstChild("HumanoidRootPart") then
--                 if (Player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 50 then
--                     local x = Player.Party

--                     if x.Value == nil then
--                         _G.Oa1 = false
--                     else
--                         _G.Oa1 = true
--                     end

--                     if _G.Oa1 == true then
--                         for ss, d in pairs(game:GetService("ReplicatedStorage").currentParty:GetChildren()) do
--                             if Players:FindFirstChild(d.Name) then
--                                 for iss, pp in pairs(d:GetChildren()) do
--                                     if d.Name == Player.Name then
--                                         for k, l in pairs(d:GetChildren()) do
--                                             table.insert(playersBlackList, l.Name)
--                                         end
--                                     else
--                                         if pp.Name == Player.Name then  
--                                             for k, l in pairs(d:GetChildren()) do
--                                                 if table.find(playersBlackList, l.Name) then
--                                                     wait()
--                                                 else
--                                                     table.insert(playersBlackList, l.Name)
--                                                 end
--                                             end
--                                         end
--                                     end
--                                 end
--                             end
--                         end
--                     end

--                     for ssii, ppss in pairs(playersBlackList) do
--                         if v.Name ~= ppss then
--                             Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end

-- LeftGroupBox6:AddLabel('Auto Farm Nearest Player'):AddKeyPicker('AutoFarmPlayer1', {
--     -- SyncToggleState only works with toggles. 
--     -- It allows you to make a keybind which has its state synced with its parent toggle

--     -- Example: Keybind which you use to toggle flyhack, etc.
--     -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

--     Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
--     SyncToggleState = false,


--     -- You can define custom Modes but I have never had a use for it.
--     Mode = 'Toggle', -- Modes: Always, Toggle, Hold

--     Text = 'Enable Players', -- Text to display in the keybind menu
--     NoUI = false, -- Set to true if you want to hide from the Keybind menu,
-- })

-- -- OnClick is only fired when you press the keybind and the mode is Toggle/
-- -- Otherwise, you will have to use Keybind:GetState()
-- Options.AutoFarmPlayer1:OnClick(function()

--     _G.Keybind3 = Options.AutoFarmPlayer1.Value

--     if _G.Pla == true then

--         if _G.JJk == true then
--             _G.JJk = false
--         elseif _G.JJk == false then
--             _G.JJk = true
--         end

--         _G.AutoFarmNear = false
    
--         newFarm()
--     end
-- end)
