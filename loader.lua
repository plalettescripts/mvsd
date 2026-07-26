-- Plalette Scripts · MvSD DUELS · Rayfield Gen2 FINAL v5
local PassScreen = Instance.new("ScreenGui")
PassScreen.Parent = game:GetService("CoreGui")

local PassFrame = Instance.new("Frame")
PassFrame.Size = UDim2.new(0, 280, 0, 170)
PassFrame.Position = UDim2.new(0.5, -140, 0.5, -85)
PassFrame.BackgroundColor3 = Color3.fromRGB(14, 12, 24)
PassFrame.BorderSizePixel = 0
PassFrame.Active = true
PassFrame.Draggable = true
PassFrame.Parent = PassScreen
Instance.new("UICorner", PassFrame).CornerRadius = UDim.new(0, 10)

local PGL = Instance.new("Frame")
PGL.Size = UDim2.new(1, 2, 1, 2)
PGL.Position = UDim2.new(0, -1, 0, -1)
PGL.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
PGL.BackgroundTransparency = 0.5
PGL.BorderSizePixel = 0
PGL.Parent = PassFrame
Instance.new("UICorner", PGL).CornerRadius = UDim.new(0, 10)

local PT = Instance.new("TextLabel")
PT.Size = UDim2.new(1, 0, 0, 26)
PT.Position = UDim2.new(0, 0, 0, 18)
PT.BackgroundTransparency = 1
PT.TextColor3 = Color3.fromRGB(255, 255, 255)
PT.Text = "MvSD DUELS"
PT.Font = Enum.Font.SourceSansBold
PT.TextSize = 20
PT.Parent = PassFrame

local PS = Instance.new("TextLabel")
PS.Size = UDim2.new(1, 0, 0, 16)
PS.Position = UDim2.new(0, 0, 0, 46)
PS.BackgroundTransparency = 1
PS.TextColor3 = Color3.fromRGB(180, 140, 200)
PS.Text = "Plalette Scripts"
PS.Font = Enum.Font.SourceSans
PS.TextSize = 13
PS.Parent = PassFrame

local PI = Instance.new("TextBox")
PI.Size = UDim2.new(1, -40, 0, 28)
PI.Position = UDim2.new(0, 20, 0, 70)
PI.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
PI.TextColor3 = Color3.fromRGB(255, 255, 255)
PI.PlaceholderText = "Passwort..."
PI.Text = ""
PI.Font = Enum.Font.SourceSans
PI.TextSize = 14
PI.Parent = PassFrame
Instance.new("UICorner", PI).CornerRadius = UDim.new(0, 8)

local PB = Instance.new("TextButton")
PB.Size = UDim2.new(1, -40, 0, 26)
PB.Position = UDim2.new(0, 20, 0, 105)
PB.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
PB.TextColor3 = Color3.fromRGB(255, 255, 255)
PB.Text = "Freischalten"
PB.Font = Enum.Font.SourceSansBold
PB.TextSize = 14
PB.Parent = PassFrame
Instance.new("UICorner", PB).CornerRadius = UDim.new(0, 8)

local DiscFrame = Instance.new("Frame")
DiscFrame.Size = UDim2.new(1, -40, 0, 20)
DiscFrame.Position = UDim2.new(0, 20, 0, 138)
DiscFrame.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscFrame.BackgroundTransparency = 0.1
DiscFrame.Parent = PassFrame
Instance.new("UICorner", DiscFrame).CornerRadius = UDim.new(0, 5)

local DiscLabel = Instance.new("TextLabel")
DiscLabel.Size = UDim2.new(0.7, 0, 1, 0)
DiscLabel.Position = UDim2.new(0, 6, 0, 0)
DiscLabel.BackgroundTransparency = 1
DiscLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscLabel.Text = "Get Password"
DiscLabel.Font = Enum.Font.SourceSans
DiscLabel.TextSize = 10
DiscLabel.TextXAlignment = Enum.TextXAlignment.Left
DiscLabel.Parent = DiscFrame

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.25, 0, 0, 16)
CopyBtn.Position = UDim2.new(0.72, 0, 0, 2)
CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.BackgroundTransparency = 0.2
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Text = "Copy"
CopyBtn.Font = Enum.Font.SourceSansBold
CopyBtn.TextSize = 9
CopyBtn.Parent = DiscFrame
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 3)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/duhxrB85tW")
    CopyBtn.Text = "OK"
    task.wait(2)
    CopyBtn.Text = "Copy"
end)

local function Try()
    if PI.Text == "plalettescripts3754356" then
        PassScreen:Destroy()
        LoadRayfield()
    else
        PI.Text = ""
        PI.PlaceholderText = "Falsch!"
        task.wait(0.8)
        PI.PlaceholderText = "Passwort..."
    end
end
PB.MouseButton1Click:Connect(Try)
PI.FocusLost:Connect(function(ep) if ep then Try() end end)

function LoadRayfield()
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    local AimbotOn = false
    local FOVVal = 120
    local SpeedOn = false
    local SpeedVal = 32
    local HitboxOn = false
    local HitboxVal = 3
    local ESPOn = false
    local JumpOn = false
    local JumpVal = 60
    local FlyOn = false
    local FlyVal = 30

    local ESPCache = {}
    local FCI = Drawing.new("Circle")
    FCI.Filled = false
    FCI.Visible = false
    local AC = nil

    -- NUR Spieler in der Nähe UND mit Waffe
    local function IsValidTarget(player)
        if not player then return false end
        if player == LocalPlayer then return false end
        if not player.Character then return false end
        if not LocalPlayer.Character then return false end
        
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        local myHrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not myHrp then return false end
        
        -- Distanz-Check
        if (hrp.Position - myHrp.Position).Magnitude > 200 then return false end
        
        -- Waffen-Check (nur im Spiel)
        local hasTool = false
        if player.Character:FindFirstChildOfClass("Tool") then hasTool = true end
        if player.Backpack and player.Backpack:FindFirstChildOfClass("Tool") then hasTool = true end
        
        return hasTool
    end

    local function GT()
        if not LocalPlayer.Character then return nil end
        local b = 99999
        local t = nil
        local cx = Camera.ViewportSize.X / 2
        local cy = Camera.ViewportSize.Y / 2
        for _, p in ipairs(Players:GetPlayers()) do
            if IsValidTarget(p) then
                local h = p.Character:FindFirstChild("Head")
                if h then
                    local pos, on = Camera:WorldToViewportPoint(h.Position)
                    if on then
                        local dx = pos.X - cx
                        local dy = pos.Y - cy
                        local d = math.sqrt(dx*dx + dy*dy)
                        if d < FOVVal and d < b then b = d t = p end
                    end
                end
            end
        end
        return t
    end

    -- ESP sauber updaten (ALTE zuerst löschen, dann NEUE zeichnen)
    local function UpdateESP()
        -- ALLES löschen
        for uid, drawings in pairs(ESPCache) do
            pcall(function() drawings[1]:Remove() end)
            pcall(function() drawings[2]:Remove() end)
            ESPCache[uid] = nil
        end
        
        if not ESPOn then return end
        
        -- NUR gültige Gegner neu zeichnen
        for _, p in ipairs(Players:GetPlayers()) do
            if IsValidTarget(p) then
                local h = p.Character:FindFirstChild("Head")
                local r = p.Character:FindFirstChild("HumanoidRootPart")
                if h and r then
                    local hp, on = Camera:WorldToViewportPoint(h.Position + Vector3.new(0, 0.5, 0))
                    if on then
                        local fp = Camera:WorldToViewportPoint(r.Position - Vector3.new(0, 3, 0))
                        local bh = math.abs(hp.Y - fp.Y)
                        local bw = bh / 2
                        
                        local bx = Drawing.new("Square")
                        bx.Color = Color3.fromRGB(140, 80, 255)
                        bx.Thickness = 1
                        bx.Size = Vector2.new(bw, bh)
                        bx.Position = Vector2.new(hp.X - bw/2, hp.Y)
                        bx.Filled = false
                        bx.Visible = true
                        
                        local nm = Drawing.new("Text")
                        nm.Text = p.Name
                        nm.Color = Color3.fromRGB(255, 255, 255)
                        nm.Size = 11
                        nm.Position = Vector2.new(hp.X, hp.Y - 14)
                        nm.Center = true
                        nm.Visible = true
                        
                        ESPCache[p.UserId] = {bx, nm}
                    end
                end
            end
        end
    end

    local function StopFly()
        FlyOn = false
        if LocalPlayer.Character then
            local r = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if r then
                for _, c in ipairs(r:GetChildren()) do
                    if c:IsA("BodyGyro") or c:IsA("BodyVelocity") then c:Destroy() end
                end
            end
        end
    end

    -- FOV Circle
    task.spawn(function()
        while true do
            if AimbotOn then
                FCI.Visible = true
                FCI.Radius = FOVVal
                FCI.Thickness = 1.5
                FCI.Color = Color3.fromRGB(140, 80, 255)
                FCI.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            else
                FCI.Visible = false
            end
            task.wait(0.03)
        end
    end)

    -- RC Aimbot
    UserInputService.InputBegan:Connect(function(i, p)
        if p then return end
        if i.UserInputType == Enum.UserInputType.MouseButton2 and AimbotOn then
            AC = RunService.RenderStepped:Connect(function()
                local t = GT()
                if t and t.Character and t.Character:FindFirstChild("Head") then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, t.Character.Head.Position)
                end
            end)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton2 then
            if AC then AC:Disconnect() AC = nil end
        end
    end)

    -- Speed + Jump
    RunService.Stepped:Connect(function()
        if SpeedOn and LocalPlayer.Character then
            local h = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = SpeedVal end
        end
        if JumpOn and LocalPlayer.Character then
            local h = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h then h.JumpPower = JumpVal end
        end
    end)
    UserInputService.JumpRequest:Connect(function()
        if JumpOn and LocalPlayer.Character then
            local h = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)

    -- Hitbox
    task.spawn(function()
        while task.wait(0.2) do
            if HitboxOn then
                for _, p in ipairs(Players:GetPlayers()) do
                    if IsValidTarget(p) then
                        local r = p.Character:FindFirstChild("HumanoidRootPart")
                        if r then r.Size = Vector3.new(HitboxVal, HitboxVal, HitboxVal) r.Transparency = 0.4 end
                    end
                end
            end
        end
    end)

    -- ESP (JEDES MAL KOMPLETT NEU, kein Cache-Müll)
    task.spawn(function()
        while task.wait(0.08) do
            UpdateESP()
        end
    end)

    -- Fly
    UserInputService.InputBegan:Connect(function(i, p)
        if p then return end
        if i.KeyCode == Enum.KeyCode.G then
            FlyOn = not FlyOn
            if not FlyOn then StopFly() end
        end
    end)
    task.spawn(function()
        while task.wait() do
            if FlyOn and LocalPlayer.Character then
                local r = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if r then
                    local g = r:FindFirstChild("FlyG") or Instance.new("BodyGyro", r)
                    g.Name = "FlyG" g.MaxTorque = Vector3.new(9e9, 9e9, 9e9) g.CFrame = Camera.CFrame g.Parent = r
                    local v = r:FindFirstChild("FlyV") or Instance.new("BodyVelocity", r)
                    v.Name = "FlyV" v.MaxForce = Vector3.new(9e9, 9e9, 9e9) v.Parent = r
                    local m = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then m = m + Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then m = m - Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then m = m - Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then m = m + Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then m = m - Vector3.new(0, 1, 0) end
                    v.Velocity = m * FlyVal
                end
            elseif LocalPlayer.Character then
                local r = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if r then
                    local g = r:FindFirstChild("FlyG") if g then g:Destroy() end
                    local v = r:FindFirstChild("FlyV") if v then v:Destroy() end
                end
            end
        end
    end)

    -- Anti-AFK
    task.spawn(function()
        while task.wait(60) do
            pcall(function()
                local VIM = game:GetService("VirtualInputManager")
                VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, nil)
                task.wait(0.1)
                VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, nil)
            end)
        end
    end)

    -- WINDOW
    local Window = Rayfield:CreateWindow({
        name = "MvSD DUELS",
        subtitle = "Plalette Scripts",
    })

    local CombatTab = Window:CreateTab({ name = "Combat", icon = "crosshair" })
    local VisualTab = Window:CreateTab({ name = "Visuals", icon = "eye" })
    local MoveTab = Window:CreateTab({ name = "Movement", icon = "footprints" })
    local InfoTab = Window:CreateTab({ name = "Info", icon = "info" })

    CombatTab:CreateSection("Aimbot")
    CombatTab:CreateToggle({ name = "FOV Aimbot", currentValue = false, callback = function(v) AimbotOn = v end })
    CombatTab:CreateSlider({ name = "FOV Size", range = {30, 300}, increment = 5, currentValue = 120, callback = function(v) FOVVal = v end })

    CombatTab:CreateSection("Weapons")
    CombatTab:CreateToggle({ name = "Hitbox Expander", currentValue = false, callback = function(v) HitboxOn = v end })
    CombatTab:CreateSlider({ name = "Hitbox Size", range = {1, 10}, increment = 1, currentValue = 3, callback = function(v) HitboxVal = v end })

    VisualTab:CreateSection("ESP")
    VisualTab:CreateToggle({ name = "Player ESP", currentValue = false, callback = function(v) ESPOn = v end })

    MoveTab:CreateSection("Speed")
    MoveTab:CreateToggle({ name = "Speed Hack", currentValue = false, callback = function(v) SpeedOn = v end })
    MoveTab:CreateSlider({ name = "Walk Speed", range = {16, 60}, increment = 2, currentValue = 32, callback = function(v) SpeedVal = v end })

    MoveTab:CreateSection("Jump")
    MoveTab:CreateToggle({ name = "Infinite Jump", currentValue = false, callback = function(v) JumpOn = v end })
    MoveTab:CreateSlider({ name = "Jump Power", range = {50, 200}, increment = 10, currentValue = 60, callback = function(v) JumpVal = v end })

    MoveTab:CreateSection("Fly")
    MoveTab:CreateToggle({ name = "Fly (G Key)", currentValue = false, callback = function(v) FlyOn = v if not v then StopFly() end end })
    MoveTab:CreateSlider({ name = "Fly Speed", range = {10, 80}, increment = 5, currentValue = 30, callback = function(v) FlyVal = v end })

    InfoTab:CreateButton({ name = "Copy Discord", callback = function() setclipboard("https://discord.gg/duhxrB85tW") Window:Notify({ title = "Copied!", content = "discord.gg/duhxrB85tW" }) end })
    InfoTab:CreateParagraph({ title = "Plalette Scripts", content = "MvSD DUELS\nDiscord: discord.gg/duhxrB85tW\n\nFOV Aimbot · Hitbox · ESP\nSpeed · Jump · Fly (G)" })

    Window:Notify({ title = "Plalette Scripts", content = "MvSD DUELS loaded!" })
end
