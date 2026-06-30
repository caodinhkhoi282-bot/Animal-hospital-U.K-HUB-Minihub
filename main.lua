--[[
    U.K HUB - INTEGRATED KEY & LOADER SYSTEM
    - Phần 1: Giao diện nhập Key chính thức (Key: U.KHUBFREEKEYANIMALHOPSPITAL6262-292)
    - Phần 2: Sau khi đúng Key, tự động chuyển sang Loader thông báo hợp tác Vexus Script trong 4s.
    - Phần 3: Tải script chính thức từ GitHub.
--]]

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Clipboard = setclipboard or toclipboard
local LocalPlayer = game.Players.LocalPlayer

-- Xóa UI cũ nếu có để tránh trùng lặp
if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UKHub_FixedSystem") then
    LocalPlayer.PlayerGui.UKHub_FixedSystem:Destroy()
end
if CoreGui:FindFirstChild("VexusHubKeySystem") then
    CoreGui.VexusHubKeySystem:Destroy()
end

-- ==========================================
-- PHẦN 1: TẠO GIAO DIỆN NHẬP KEY (GUI KEY)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UKHub_FixedSystem"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 280)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Viền chạy xoay vòng vòng của bảng Key
local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 15)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 100, 105)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
})
MainGradient.Parent = MainStroke

task.spawn(function()
    while MainGradient and MainGradient.Parent do
        for angle = 0, 360, 3 do
            MainGradient.Rotation = angle
            task.wait(0.02)
        end
    end
end)

-- Logo bảng Key
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 50, 0, 50)
Logo.Position = UDim2.new(1, -65, 0, 15)
Logo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Logo.Image = "rbxassetid://6034287525"
Logo.BorderSizePixel = 0
Logo.Parent = MainFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = Logo

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Thickness = 1.5
LogoStroke.Color = Color3.fromRGB(0, 170, 255)
LogoStroke.Parent = Logo

-- Nút ảnh tròn góc dưới bên phải
local CustomImage = Instance.new("ImageButton")
CustomImage.Name = "CustomBottomRightImage"
CustomImage.Size = UDim2.new(0, 75, 0, 75)
CustomImage.Position = UDim2.new(1, -95, 1, -105) 
CustomImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CustomImage.Image = "rbxassetid://119373287843763" 
CustomImage.BorderSizePixel = 0
CustomImage.ZIndex = 5
CustomImage.Parent = MainFrame

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(1, 0)
ImageCorner.Parent = CustomImage

local ImageStroke = Instance.new("UIStroke")
ImageStroke.Thickness = 2
ImageStroke.Color = Color3.fromRGB(0, 170, 255)
ImageStroke.Parent = CustomImage

CustomImage.MouseButton1Click:Connect(function()
    CustomImage:TweenSize(UDim2.new(0, 65, 0, 65), "Out", "Quad", 0.1, true, function()
        CustomImage:TweenSize(UDim2.new(0, 75, 0, 75), "Out", "Quad", 0.1, true)
    end)
end)

-- Tiêu đề bảng Key
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Position = UDim2.new(0, 20, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = "U.K HUB"
Title.TextColor3 = Color3.fromRGB(240, 240, 245)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.Size = UDim2.new(0, 200, 0, 20)
SubTitle.Position = UDim2.new(0, 20, 0, 45)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "nhập key để tiếp tục"
SubTitle.TextColor3 = Color3.fromRGB(150, 150, 155)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 14
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = MainFrame

-- Ô nhập & nút Check
local InputRow = Instance.new("Frame")
InputRow.Name = "InputRow"
InputRow.Size = UDim2.new(1, -40, 0, 45)
InputRow.Position = UDim2.new(0, 20, 0, 95)
InputRow.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InputRow.BorderSizePixel = 0
InputRow.Parent = MainFrame

local RowCorner = Instance.new("UICorner")
RowCorner.CornerRadius = UDim.new(0, 6)
RowCorner.Parent = InputRow

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -100, 1, 0)
TextBox.Position = UDim2.new(0, 10, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Text = ""
TextBox.PlaceholderText = "nhập key"
TextBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 115)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 15
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.Parent = InputRow

local CheckBtn = Instance.new("TextButton")
CheckBtn.Name = "CheckBtn"
CheckBtn.Size = UDim2.new(0, 80, 0, 33)
CheckBtn.Position = UDim2.new(1, -85, 0.5, -16.5)
CheckBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
CheckBtn.Text = "xác nhận"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 12
CheckBtn.Parent = InputRow

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 100)
CheckCorner.Parent = CheckBtn

-- Nút Get Key
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Size = UDim2.new(0, 130, 0, 40)
GetKeyBtn.Position = UDim2.new(0.5, -135, 0, 175)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
GetKeyBtn.Text = "get key"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 18
GetKeyBtn.Parent = MainFrame

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Thickness = 1
GetKeyStroke.Color = Color3.fromRGB(60, 60, 60)
GetKeyStroke.Parent = GetKeyBtn

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Trạng thái: Chờ nhập key..."
StatusLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.Parent = MainFrame

-- ==========================================
-- PHẦN 2: HÀM TẠO LOADER 4 GIÂY (SAU KHI ĐÚNG KEY)
-- ==========================================
local function OpenLoaderUI()
    local LoaderGui = Instance.new("ScreenGui")
    LoaderGui.Name = "VexusHubKeySystem"
    LoaderGui.Parent = CoreGui
    LoaderGui.ResetOnSpawn = false

    local LoaderFrame = Instance.new("Frame")
    LoaderFrame.Name = "MainFrame"
    LoaderFrame.Parent = LoaderGui
    LoaderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    LoaderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    LoaderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LoaderFrame.Size = UDim2.new(0, 360, 0, 160)
    LoaderFrame.Active = true
    LoaderFrame.Draggable = true 
    LoaderFrame.BackgroundTransparency = 1

    local LoaderCorner = Instance.new("UICorner")
    LoaderCorner.CornerRadius = UDim.new(0, 12)
    LoaderCorner.Parent = LoaderFrame

    -- Viền ĐEN lịch lãm cực nét cho loader
    local LoaderStroke = Instance.new("UIStroke")
    LoaderStroke.Thickness = 2 
    LoaderStroke.Color = Color3.fromRGB(0, 0, 0)
    LoaderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    LoaderStroke.Transparency = 1
    LoaderStroke.Parent = LoaderFrame

    local LoaderTitle = Instance.new("TextLabel")
    LoaderTitle.Name = "Title"
    LoaderTitle.Parent = LoaderFrame
    LoaderTitle.BackgroundTransparency = 1
    LoaderTitle.Position = UDim2.new(0, 0, 0, 35)
    LoaderTitle.Size = UDim2.new(1, 0, 0, 30)
    LoaderTitle.Font = Enum.Font.GothamBold
    LoaderTitle.Text = "U.K HUB"
    LoaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoaderTitle.TextSize = 24
    LoaderTitle.TextTransparency = 1

    local LoaderSub = Instance.new("TextLabel")
    LoaderSub.Name = "SubTitle"
    LoaderSub.Parent = LoaderFrame
    LoaderSub.BackgroundTransparency = 1
    LoaderSub.Position = UDim2.new(0, 0, 0, 75)
    LoaderSub.Size = UDim2.new(1, 0, 0, 20)
    LoaderSub.Font = Enum.Font.GothamSemibold
    LoaderSub.Text = "HỢP TÁC VỚI VEXUS SCRIPT... (4S)"
    LoaderSub.TextColor3 = Color3.fromRGB(140, 140, 145)
    LoaderSub.TextSize = 13
    LoaderSub.TextTransparency = 1

    -- Hiệu ứng Fade In hiện hình mượt mà
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(LoaderFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(LoaderStroke, tweenInfo, {Transparency = 0}):Play()
    TweenService:Create(LoaderTitle, tweenInfo, {TextTransparency = 0}):Play()
    TweenService:Create(LoaderSub, tweenInfo, {TextTransparency = 0}):Play()

    -- Đếm ngược 4 giây thông báo sự hợp tác
    for i = 4, 1, -1 do
        LoaderSub.Text = "HỢP TÁC VỚI VEXUS SCRIPT... ("..i.."S)"
        task.wait(1)
    end

    LoaderSub.Text = "ĐANG TẢI SCRIPT CHÍNH..."
    LoaderSub.TextColor3 = Color3.fromRGB(0, 255, 130)
    task.wait(0.5)

    -- Hiệu ứng Fade Out biến mất mượt mà
    local fadeOutInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(LoaderFrame, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(LoaderStroke, fadeOutInfo, {Transparency = 1}):Play()
    TweenService:Create(LoaderTitle, fadeOutInfo, {TextTransparency = 1}):Play()
    TweenService:Create(LoaderSub, fadeOutInfo, {TextTransparency = 1}):Play()

    task.wait(0.4)
    LoaderGui:Destroy() -- Dọn sạch hoàn toàn Loader UI

    -- ==========================================
    -- PHẦN 3: KÍCH HOẠT SCRIPT CHÍNH TỪ GITHUB
    -- ==========================================
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/eiis2id2idi/Vexus-hub/refs/heads/main/README.md"))()
    end)
end

-- ==========================================
-- SỰ KIỆN NÚT BẤM CỦA BẢNG KEY
-- ==========================================
CheckBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == "U.KHUBFREEKEYANIMALHOPSPITAL6262-292" then 
        StatusLabel.Text = "Key chính xác!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        task.wait(0.5)
        ScreenGui:Destroy() -- Tắt ngay bảng Key
        
        -- Gọi chạy Loader thông báo kéo dài 4 giây ở trên
        task.spawn(OpenLoaderUI)
    else
        StatusLabel.Text = "Sai key rồi bạn ơi, thử lại nhé!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    local link = "https://discord.gg/m6kMDaGFX"
    if Clipboard then
        Clipboard(link)
        StatusLabel.Text = "Đã sao chép link Discord thành công!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    else
        StatusLabel.Text = "Link: https://discord.gg/m6kMDaGFX"
    end
end)
