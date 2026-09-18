-- ═══════════════════════════════════════
--       Merge Hub | by giga
--       Key System + Flying Gigachads
-- ═══════════════════════════════════════

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local VALID_KEY = "giga1488"
local DISCORD_LINK = "https://discord.gg/gE6w5X64E3"

local speedEnabled = false
local noclipEnabled = false
local infJumpEnabled = false
local speedValue = 50
local spaceHeld = false
local guiOpen = true
local keyVerified = false

local guiParent
pcall(function() guiParent = game:GetService("CoreGui") end)
if not guiParent then guiParent = Player:WaitForChild("PlayerGui") end

local GIGACHAD_ID = "rbxassetid://11419684566"

-- ══════════════════════════════════════
--          KEY SYSTEM GUI
-- ══════════════════════════════════════

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeySystem_giga"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.Parent = guiParent

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
Overlay.BackgroundTransparency = 0.15
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 1
Overlay.Parent = KeyGui

local ChadContainer = Instance.new("Frame")
ChadContainer.Size = UDim2.new(1, 0, 1, 0)
ChadContainer.BackgroundTransparency = 1
ChadContainer.BorderSizePixel = 0
ChadContainer.ZIndex = 2
ChadContainer.ClipsDescendants = true
ChadContainer.Parent = KeyGui

-- ══════ FLYING GIGACHADS ══════
local screenW = workspace.CurrentCamera.ViewportSize.X
local screenH = workspace.CurrentCamera.ViewportSize.Y

local function spawnChad()
    local size = math.random(60, 140)
    local chad = Instance.new("ImageLabel")
    chad.Size = UDim2.new(0, size, 0, size)
    chad.BackgroundTransparency = 1
    chad.Image = GIGACHAD_ID
    chad.ImageTransparency = math.random(20, 55) / 100
    chad.ZIndex = 2
    chad.Parent = ChadContainer

    local startSide = math.random(1, 4)
    local startX, startY, endX, endY

    if startSide == 1 then
        startX, startY = -size, math.random(0, screenH)
        endX, endY = screenW + size, math.random(0, screenH)
    elseif startSide == 2 then
        startX, startY = screenW + size, math.random(0, screenH)
        endX, endY = -size, math.random(0, screenH)
    elseif startSide == 3 then
        startX, startY = math.random(0, screenW), -size
        endX, endY = math.random(0, screenW), screenH + size
    else
        startX, startY = math.random(0, screenW), screenH + size
        endX, endY = math.random(0, screenW), -size
    end

    chad.Position = UDim2.new(0, startX, 0, startY)
    chad.Rotation = math.random(-30, 30)

    local duration = math.random(60, 130) / 10

    local tween = TweenService:Create(chad, TweenInfo.new(
        duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out
    ), {
        Position = UDim2.new(0, endX, 0, endY),
        Rotation = chad.Rotation + math.random(-180, 180)
    })
    tween:Play()
    tween.Completed:Connect(function() chad:Destroy() end)
end

for i = 1, 15 do spawnChad() end

task.spawn(function()
    while KeyGui.Parent do
        task.wait(math.random(3, 7) / 10)
        if KeyGui.Parent then spawnChad() end
    end
end)

-- ══════ KEY FRAME ══════
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 340, 0, 280)
KeyFrame.Position = UDim2.new(0.5, -170, 0.5, -140)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
KeyFrame.BorderSizePixel = 0
KeyFrame.ZIndex = 10
KeyFrame.Parent = KeyGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KStroke = Instance.new("UIStroke")
KStroke.Color = Color3.fromRGB(90, 90, 220)
KStroke.Thickness = 2
KStroke.Parent = KeyFrame

local KTitle = Instance.new("Frame")
KTitle.Size = UDim2.new(1, 0, 0, 42)
KTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
KTitle.BorderSizePixel = 0
KTitle.ZIndex = 11
KTitle.Parent = KeyFrame
Instance.new("UICorner", KTitle).CornerRadius = UDim.new(0, 12)

local KTitlePatch = Instance.new("Frame")
KTitlePatch.Size = UDim2.new(1, 0, 0, 12)
KTitlePatch.Position = UDim2.new(0, 0, 1, -12)
KTitlePatch.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
KTitlePatch.BorderSizePixel = 0
KTitlePatch.ZIndex = 11
KTitlePatch.Parent = KTitle

local KTitleText = Instance.new("TextLabel")
KTitleText.Size = UDim2.new(1, 0, 1, 0)
KTitleText.BackgroundTransparency = 1
KTitleText.Text = "🔑 Key System | by giga"
KTitleText.TextColor3 = Color3.new(1, 1, 1)
KTitleText.Font = Enum.Font.GothamBold
KTitleText.TextSize = 16
KTitleText.ZIndex = 12
KTitleText.Parent = KTitle

local LockIcon = Instance.new("TextLabel")
LockIcon.Size = UDim2.new(1, 0, 0, 50)
LockIcon.Position = UDim2.new(0, 0, 0, 48)
LockIcon.BackgroundTransparency = 1
LockIcon.Text = "🔒"
LockIcon.TextSize = 40
LockIcon.ZIndex = 12
LockIcon.Parent = KeyFrame

local KInfo = Instance.new("TextLabel")
KInfo.Size = UDim2.new(1, -30, 0, 20)
KInfo.Position = UDim2.new(0, 15, 0, 100)
KInfo.BackgroundTransparency = 1
KInfo.Text = "Введите ключ для доступа к Merge Hub"
KInfo.TextColor3 = Color3.fromRGB(170, 170, 210)
KInfo.Font = Enum.Font.Gotham
KInfo.TextSize = 13
KInfo.ZIndex = 12
KInfo.Parent = KeyFrame

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -40, 0, 38)
InputBox.Position = UDim2.new(0, 20, 0, 128)
InputBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
InputBox.Text = ""
InputBox.PlaceholderText = "Введите ключ..."
InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 140)
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.Font = Enum.Font.Gotham
InputBox.TextSize = 15
InputBox.ClearTextOnFocus = false
InputBox.BorderSizePixel = 0
InputBox.ZIndex = 12
InputBox.Parent = KeyFrame
Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)

local IStroke = Instance.new("UIStroke")
IStroke.Color = Color3.fromRGB(60, 60, 150)
IStroke.Thickness = 1.5
IStroke.Parent = InputBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0, 140, 0, 36)
SubmitBtn.Position = UDim2.new(0.5, -70, 0, 180)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 180)
SubmitBtn.Text = "Проверить ✓"
SubmitBtn.TextColor3 = Color3.new(1, 1, 1)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 15
SubmitBtn.ZIndex = 12
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -30, 0, 22)
StatusLabel.Position = UDim2.new(0, 15, 0, 225)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 13
StatusLabel.ZIndex = 12
StatusLabel.Parent = KeyFrame

-- ══════ DISCORD PANEL (BOTTOM) ══════
local DiscordPanel = Instance.new("Frame")
DiscordPanel.Size = UDim2.new(0, 420, 0, 80)
DiscordPanel.AnchorPoint = Vector2.new(0.5, 1)
DiscordPanel.Position = UDim2.new(0.5, 0, 1, -25)
DiscordPanel.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordPanel.BorderSizePixel = 0
DiscordPanel.ZIndex = 10
DiscordPanel.Parent = KeyGui
Instance.new("UICorner", DiscordPanel).CornerRadius = UDim.new(0, 14)

local DStroke = Instance.new("UIStroke")
DStroke.Color = Color3.fromRGB(140, 155, 255)
DStroke.Thickness = 2
DStroke.Parent = DiscordPanel

local DLogo = Instance.new("TextLabel")
DLogo.Size = UDim2.new(0, 60, 1, 0)
DLogo.Position = UDim2.new(0, 5, 0, 0)
DLogo.BackgroundTransparency = 1
DLogo.Text = "💬"
DLogo.TextSize = 36
DLogo.ZIndex = 11
DLogo.Parent = DiscordPanel

local TutKey = Instance.new("TextLabel")
TutKey.Size = UDim2.new(0, 240, 0, 26)
TutKey.Position = UDim2.new(0, 70, 0, 8)
TutKey.BackgroundTransparency = 1
TutKey.Text = "⬇️  TUT KEY  ⬇️"
TutKey.TextColor3 = Color3.new(1, 1, 1)
TutKey.Font = Enum.Font.GothamBold
TutKey.TextSize = 18
TutKey.TextXAlignment = Enum.TextXAlignment.Left
TutKey.ZIndex = 11
TutKey.Parent = DiscordPanel

local DLink = Instance.new("TextLabel")
DLink.Size = UDim2.new(0, 240, 0, 22)
DLink.Position = UDim2.new(0, 70, 0, 38)
DLink.BackgroundTransparency = 1
DLink.Text = DISCORD_LINK
DLink.TextColor3 = Color3.fromRGB(230, 230, 255)
DLink.Font = Enum.Font.Gotham
DLink.TextSize = 13
DLink.TextXAlignment = Enum.TextXAlignment.Left
DLink.ZIndex = 11
DLink.Parent = DiscordPanel

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0, 90, 0, 50)
CopyBtn.Position = UDim2.new(1, -100, 0.5, -25)
CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Text = "COPY 📋"
CopyBtn.TextColor3 = Color3.fromRGB(88, 101, 242)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 14
CopyBtn.ZIndex = 11
CopyBtn.Parent = DiscordPanel
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 8)

CopyBtn.MouseButton1Click:Connect(function()
    local ok = pcall(function()
        if setclipboard then
            setclipboard(DISCORD_LINK)
        elseif toclipboard then
            toclipboard(DISCORD_LINK)
        end
    end)
    if ok then
        CopyBtn.Text = "✅ SKOPIROVANO"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(80, 230, 80)
        CopyBtn.TextColor3 = Color3.new(1, 1, 1)
    else
        CopyBtn.Text = "❌ ОШИБКА"
    end
    task.wait(1.5)
    CopyBtn.Text = "COPY 📋"
    CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.TextColor3 = Color3.fromRGB(88, 101, 242)
end)

task.spawn(function()
    while DiscordPanel.Parent do
        TweenService:Create(DStroke, TweenInfo.new(1), {
            Color = Color3.fromRGB(200, 210, 255), Thickness = 3
        }):Play()
        task.wait(1)
        TweenService:Create(DStroke, TweenInfo.new(1), {
            Color = Color3.fromRGB(140, 155, 255), Thickness = 2
        }):Play()
        task.wait(1)
    end
end)

local attempts = 0
local maxAttempts = 5

local function verifyKey()
    local entered = InputBox.Text

    if entered == VALID_KEY then
        keyVerified = true
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
        StatusLabel.Text = "✅ Ключ верный! GIGACHAD APPROVES 💪"
        LockIcon.Text = "🔓"

        TweenService:Create(SubmitBtn, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(30, 180, 30)
        }):Play()

        wait(1.5)

        for _, obj in ipairs(KeyFrame:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                TweenService:Create(obj, TweenInfo.new(0.5), {
                    TextTransparency = 1,
                    BackgroundTransparency = 1
                }):Play()
            end
        end
        for _, obj in ipairs(DiscordPanel:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                TweenService:Create(obj, TweenInfo.new(0.5), {
                    TextTransparency = 1,
                    BackgroundTransparency = 1
                }):Play()
            end
        end
        TweenService:Create(DiscordPanel, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(DStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        TweenService:Create(KeyFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(KStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()

        for _, chad in ipairs(ChadContainer:GetChildren()) do
            TweenService:Create(chad, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        end

        wait(0.6)
        KeyGui:Destroy()
        loadMainHub()
    else
        attempts = attempts + 1
        local remaining = maxAttempts - attempts

        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)

        if remaining <= 0 then
            StatusLabel.Text = "❌ Слишком много попыток! Перезапустите."
            SubmitBtn.Active = false
            SubmitBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
            InputBox.TextEditable = false
            return
        end

        StatusLabel.Text = "❌ Неверный ключ! Осталось попыток: " .. remaining

        local orig = KeyFrame.Position
        for i = 1, 6 do
            KeyFrame.Position = orig + UDim2.new(0, (i % 2 == 0) and 8 or -8, 0, 0)
            wait(0.04)
        end
        KeyFrame.Position = orig

        TweenService:Create(IStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(255, 50, 50)
        }):Play()
        wait(0.5)
        TweenService:Create(IStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(60, 60, 150)
        }):Play()
    end
end

SubmitBtn.MouseButton1Click:Connect(verifyKey)
InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed and not keyVerified then
        verifyKey()
    end
end)

-- ══════════════════════════════════════
--          MAIN HUB
-- ══════════════════════════════════════

function loadMainHub()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MergeHub_giga"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = guiParent

    local CursorGui = Instance.new("ScreenGui")
    CursorGui.Name = "Cursor_giga"
    CursorGui.ResetOnSpawn = false
    CursorGui.IgnoreGuiInset = false
    CursorGui.DisplayOrder = 99999
    CursorGui.Parent = guiParent

    local CursorFrame = Instance.new("Frame")
    CursorFrame.Size = UDim2.new(0, 44, 0, 44)
    CursorFrame.BackgroundTransparency = 1
    CursorFrame.Visible = false
    CursorFrame.Parent = CursorGui

    local CursorGlow = Instance.new("ImageLabel")
    CursorGlow.Size = UDim2.new(1, 14, 1, 14)
    CursorGlow.Position = UDim2.new(0, -7, 0, -7)
    CursorGlow.BackgroundTransparency = 1
    CursorGlow.ImageTransparency = 0.7
    CursorGlow.Image = "rbxassetid://5028857084"
    CursorGlow.ImageColor3 = Color3.fromRGB(100, 100, 120)
    CursorGlow.Parent = CursorFrame

    local Arrow1 = Instance.new("Frame")
    Arrow1.AnchorPoint = Vector2.new(0.5, 1)
    Arrow1.Size = UDim2.new(0, 7, 0, 30)
    Arrow1.Position = UDim2.new(0, 8, 0, 36)
    Arrow1.Rotation = 18
    Arrow1.BackgroundColor3 = Color3.fromRGB(160, 160, 170)
    Arrow1.BorderSizePixel = 0
    Arrow1.Parent = CursorFrame
    Instance.new("UICorner", Arrow1).CornerRadius = UDim.new(0, 4)

    local Arrow2 = Instance.new("Frame")
    Arrow2.AnchorPoint = Vector2.new(0, 0.5)
    Arrow2.Size = UDim2.new(0, 24, 0, 7)
    Arrow2.Position = UDim2.new(0, 5, 0, 34)
    Arrow2.BackgroundColor3 = Color3.fromRGB(160, 160, 170)
    Arrow2.BorderSizePixel = 0
    Arrow2.Parent = CursorFrame
    Instance.new("UICorner", Arrow2).CornerRadius = UDim.new(0, 4)

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 370, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -185, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.BackgroundTransparency = 1
    MainFrame.Parent = ScreenGui
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

    local MStroke = Instance.new("UIStroke")
    MStroke.Color = Color3.fromRGB(75, 75, 200)
    MStroke.Thickness = 2
    MStroke.Transparency = 1
    MStroke.Parent = MainFrame

    TweenService:Create(MainFrame, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()
    TweenService:Create(MStroke, TweenInfo.new(0.6), {Transparency = 0}):Play()

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 38)
    TitleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 44)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

    local TitlePatch = Instance.new("Frame")
    TitlePatch.Size = UDim2.new(1, 0, 0, 12)
    TitlePatch.Position = UDim2.new(0, 0, 1, -12)
    TitlePatch.BackgroundColor3 = Color3.fromRGB(28, 28, 44)
    TitlePatch.BorderSizePixel = 0
    TitlePatch.Parent = TitleBar

    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(1, -90, 1, 0)
    TitleText.Position = UDim2.new(0, 14, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = "⚡ Merge Hub | by giga"
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 15
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = TitleBar

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Position = UDim2.new(1, -32, 0, 6)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 13
    CloseBtn.Parent = TitleBar
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 26, 0, 26)
    MinBtn.Position = UDim2.new(1, -62, 0, 6)
    MinBtn.BackgroundColor3 = Color3.fromRGB(170, 170, 40)
    MinBtn.Text = "—"
    MinBtn.TextColor3 = Color3.new(1, 1, 1)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 13
    MinBtn.Parent = TitleBar
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1, -20, 1, -48)
    Content.Position = UDim2.new(0, 10, 0, 43)
    Content.BackgroundTransparency = 1
    Content.ClipsDescendants = true
    Content.Parent = MainFrame

    local function makeToggle(name, yPos, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 33)
        btn.Position = UDim2.new(0, 0, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(38, 38, 58)
        btn.Text = "   " .. name .. ":  OFF"
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = Content
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)

        local indicator = Instance.new("Frame")
        indicator.Size = UDim2.new(0, 6, 0, 20)
        indicator.Position = UDim2.new(1, -20, 0.5, -10)
        indicator.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        indicator.BorderSizePixel = 0
        indicator.Parent = btn
        Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 3)

        local state = false
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.Text = "   " .. name .. ":  " .. (state and "ON" or "OFF")
            TweenService:Create(btn, TweenInfo.new(0.25), {
                BackgroundColor3 = state and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(38, 38, 58)
            }):Play()
            TweenService:Create(indicator, TweenInfo.new(0.25), {
                BackgroundColor3 = state and Color3.fromRGB(50, 220, 50) or Color3.fromRGB(200, 50, 50)
            }):Play()
            callback(state)
        end)
    end

    local function makeSlider(name, yPos, minV, maxV, defV, callback)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 18)
        label.Position = UDim2.new(0, 2, 0, yPos)
        label.BackgroundTransparency = 1
        label.Text = name .. ": " .. defV
        label.TextColor3 = Color3.fromRGB(190, 190, 240)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = Content

        local track = Instance.new("Frame")
        track.Size = UDim2.new(1, 0, 0, 10)
        track.Position = UDim2.new(0, 0, 0, yPos + 20)
        track.BackgroundColor3 = Color3.fromRGB(42, 42, 62)
        track.BorderSizePixel = 0
        track.Parent = Content
        Instance.new("UICorner", track).CornerRadius = UDim.new(0, 5)

        local r0 = math.clamp((defV - minV) / (maxV - minV), 0, 1)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new(r0, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(75, 75, 210)
        fill.BorderSizePixel = 0
        fill.Parent = track
        Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 5)

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 18, 0, 18)
        knob.AnchorPoint = Vector2.new(0.5, 0.5)
        knob.Position = UDim2.new(r0, 0, 0.5, 0)
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.BorderSizePixel = 0
        knob.ZIndex = 3
        knob.Parent = track
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local dragging = false
        local hit = Instance.new("TextButton")
        hit.Size = UDim2.new(1, 16, 0, 26)
        hit.Position = UDim2.new(0, -8, 0, yPos + 12)
        hit.BackgroundTransparency = 1
        hit.Text = ""
        hit.ZIndex = 4
        hit.Parent = Content

        hit.MouseButton1Down:Connect(function() dragging = true end)
        UIS.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        RunService.RenderStepped:Connect(function()
            if not Content.Parent then return end
            if dragging then
                local mx = Mouse.X
                local tX = track.AbsolutePosition.X
                local tW = track.AbsoluteSize.X
                local r = math.clamp((mx - tX) / tW, 0, 1)
                fill.Size = UDim2.new(r, 0, 1, 0)
                knob.Position = UDim2.new(r, 0, 0.5, 0)
                local v = math.floor(minV + r * (maxV - minV))
                label.Text = name .. ": " .. v
                callback(v)
            end
        end)
    end

    makeToggle("SpeedHack", 0, function(on)
        speedEnabled = on
        local c = Player.Character
        if c and c:FindFirstChildOfClass("Humanoid") then
            c.Humanoid.WalkSpeed = on and speedValue or 16
        end
    end)

    makeSlider("Speed", 40, 16, 500, 50, function(v)
        speedValue = v
        if speedEnabled then
            local c = Player.Character
            if c and c:FindFirstChildOfClass("Humanoid") then
                c.Humanoid.WalkSpeed = v
            end
        end
    end)

    makeToggle("Noclip", 78, function(on)
        noclipEnabled = on
    end)

    makeToggle("Inf Jump (зажми Space)", 118, function(on)
        infJumpEnabled = on
    end)

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, 0, 0, 50)
    info.Position = UDim2.new(0, 0, 1, -56)
    info.BackgroundColor3 = Color3.fromRGB(30, 30, 46)
    info.Text = "  [E]  +1 Speed (для побега)\n  [RightShift]  Скрыть / Показать GUI"
    info.TextColor3 = Color3.fromRGB(160, 160, 200)
    info.Font = Enum.Font.Gotham
    info.TextSize = 11
    info.TextWrapped = true
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.Parent = Content
    Instance.new("UICorner", info).CornerRadius = UDim.new(0, 7)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        CursorGui:Destroy()
        UIS.MouseIconEnabled = true
    end)

    local mini = false
    MinBtn.MouseButton1Click:Connect(function()
        mini = not mini
        Content.Visible = not mini
        MainFrame.Size = mini and UDim2.new(0, 370, 0, 42) or UDim2.new(0, 370, 0, 300)
    end)

    UIS.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            guiOpen = not guiOpen
            MainFrame.Visible = guiOpen
            if not guiOpen then
                CursorFrame.Visible = false
                UIS.MouseIconEnabled = true
            end
        end
        if input.KeyCode == Enum.KeyCode.E then
            local c = Player.Character
            if c and c:FindFirstChildOfClass("Humanoid") then
                c.Humanoid.WalkSpeed = c.Humanoid.WalkSpeed + 1
            end
        end
        if input.KeyCode == Enum.KeyCode.Space then
            spaceHeld = true
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            spaceHeld = false
        end
    end)

    RunService.Stepped:Connect(function()
        if noclipEnabled then
            local c = Player.Character
            if c then
                for _, p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end
    end)

    RunService.Heartbeat:Connect(function()
        if infJumpEnabled and spaceHeld then
            local c = Player.Character
            if c then
                local h = c:FindFirstChildOfClass("Humanoid")
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
                local root = c:FindFirstChild("HumanoidRootPart")
                if root then
                    local vel = root.Velocity
                    if vel.Y < 50 then
                        root.Velocity = Vector3.new(vel.X, 80, vel.Z)
                    end
                end
            end
        end
        if speedEnabled then
            local c = Player.Character
            if c then
                local h = c:FindFirstChildOfClass("Humanoid")
                if h and h.WalkSpeed ~= speedValue then h.WalkSpeed = speedValue end
            end
        end
    end)

    Player.CharacterAdded:Connect(function(char)
        local h = char:WaitForChild("Humanoid")
        if speedEnabled then h.WalkSpeed = speedValue end
    end)

    RunService.RenderStepped:Connect(function()
        if not CursorGui.Parent then return end
        local mx, my = Mouse.X, Mouse.Y
        CursorFrame.Position = UDim2.new(0, mx - 7, 0, my - 36)

        if guiOpen and MainFrame.Visible then
            local ap = MainFrame.AbsolutePosition
            local sz = MainFrame.AbsoluteSize
            local hover = (mx >= ap.X and mx <= ap.X + sz.X
                       and my >= ap.Y and my <= ap.Y + sz.Y)
            CursorFrame.Visible = hover
            UIS.MouseIconEnabled = not hover
        else
            CursorFrame.Visible = false
            UIS.MouseIconEnabled = true
        end
    end)

    print("✅ Merge Hub загружен! GIGACHAD MODE ON 💪")
end

print("🔑 Merge Hub Key System | by giga — введите ключ giga1488")
print("💬 Discord: " .. DISCORD_LINK)
