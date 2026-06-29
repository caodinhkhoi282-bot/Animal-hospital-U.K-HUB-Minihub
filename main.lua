--[[
    U.K HUB - KEY SYSTEM (FULL VERSION)
    - Viền đen/xám chạy xoay vòng quanh khung chính.
    - Ảnh góc dưới bên phải bo tròn viền xanh, hỗ trợ hiệu ứng click chuột mượt mà.
    - Đã tích hợp kích hoạt Script Animal Hospital khi nhập đúng Key.
    - Đã cập nhật link Get Key Discord mới.
--]]

local TweenService = game:GetService("TweenService")
local Clipboard = setclipboard or toclipboard
local LocalPlayer = game.Players.LocalPlayer

-- Xóa UI cũ nếu có để tránh trùng lặp
local oldGui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UKHub_FixedSystem")
if oldGui then oldGui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UKHub_FixedSystem"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==========================================
-- KHUNG CHÍNH (MAIN FRAME)
-- ==========================================
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

-- VIỀN CHẠY XOAY VÒNG VÒNG
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

-- ==========================================
-- LOGO NINJA (GÓC TRÊN BÊN PHẢI)
-- ==========================================
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

-- ==========================================
-- 🌟 NÚT ẢNH TRÒN GÓC DƯỚI BÊN PHẢI
-- ==========================================
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

-- Hiệu ứng đàn hồi khi click
CustomImage.MouseButton1Click:Connect(function()
    CustomImage:TweenSize(UDim2.new(0, 65, 0, 65), "Out", "Quad", 0.1, true, function()
        CustomImage:TweenSize(UDim2.new(0, 75, 0, 75), "Out", "Quad", 0.1, true)
    end)
end)

-- ==========================================
-- TIÊU ĐỀ & CHỮ PHỤ CỦA GUI
-- ==========================================
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

-- ==========================================
-- HÀNG NGANG: Ô NHẬP KEY & NÚT XÁC NHẬN
-- ==========================================
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

-- ==========================================
-- NÚT GET KEY PHÍA DƯỚI (NẰM DỌC)
-- ==========================================
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

-- Thông báo trạng thái dưới đáy
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
-- SỰ KIỆN XỬ LÝ CHÍNH
-- ==========================================
CheckBtn.MouseButton1Click:Connect(function()
    -- Kiểm tra key chính xác
    if TextBox.Text == "U.KHUBFREEKEYANIMALHOPSPITAL6262-292" then 
        StatusLabel.Text = "Key chính xác! Đang tải Script..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        task.wait(1)
        ScreenGui:Destroy() -- Xóa giao diện nhập Key đi
        
        -- Kích hoạt chạy script Animal Hospital
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MinityD/roblox-utils/refs/heads/main/animal%20hospital.lua"))()
        end)
    else
        StatusLabel.Text = "Sai key rồi bạn ơi, thử lại nhé!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    local link = "https://discord.gg/m6kMDaGFX" -- Cập nhật link Discord mới của bạn tại đây
    if Clipboard then
        Clipboard(link)
        StatusLabel.Text = "Đã sao chép link Discord thành công!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    else
        StatusLabel.Text = "Link: https://discord.gg/m6kMDaGFX"
    end
end)
