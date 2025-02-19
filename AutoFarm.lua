if not game:IsLoaded() then
    game.Loaded:Wait()
end

print("🔄 Đang tải Loader... Vui lòng chờ!")

-- Giao diện thông báo tải script
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 100)
Frame.Position = UDim2.new(0.5, -150, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 18
TextLabel.Text = "⏳ Đang tải script... Vui lòng chờ..."
TextLabel.TextWrapped = true

wait(2) -- Chờ 2 giây trước khi tải script chính

-- Tải script chính từ GitHub
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Phamloidzx/Blox/refs/heads/main/AutoFarm.lua"))()
end)

if success then
    TextLabel.Text = "✅ Tải thành công! Đang chạy script..."
    wait(1)
    ScreenGui:Destroy()
else
    TextLabel.Text = "❌ Lỗi tải script: " .. tostring(err)
end
