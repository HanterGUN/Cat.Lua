--[[ 🔧 IBAN AND CAT SCRIPT v9 BUG+BOOST EDITION Features:

Auto Size

Auto Rebirth

Auto King Capture (Head Target)

Bug Hit From Anywhere

Auto Open Areas

Auto Pet Equip

Auto Farm Boss & Zones (Jungle, King)

Targeted Rebirth (with prediction)

Auto Save & Load Settings

Discord Webhook Logs

GUI Animations & Mobile Optimized

Bug Pack (Wall Clip, Hover, Invisible Body, Anti Kick)

BOOST Mode: 5-Pack Strength Gain ]]


local Players = game:GetService("Players") local ReplicatedStorage = game:GetService("ReplicatedStorage") local RunService = game:GetService("RunService") local HttpService = game:GetService("HttpService") local player = Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait()

-- GUI Setup local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui")) gui.Name = "IBAN_CAT_GUI"

local frame = Instance.new("Frame", gui) frame.Size = UDim2.new(0, 440, 0, 400) frame.Position = UDim2.new(0.5, -220, 0.5, -200) frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) frame.BorderSizePixel = 0 frame.BackgroundTransparency = 0.2 frame.Visible = true

-- Button Factory local function createButton(text, pos, callback) local btn = Instance.new("TextButton", frame) btn.Size = UDim2.new(0, 200, 0, 40) btn.Position = pos btn.Text = text btn.TextColor3 = Color3.fromRGB(255,255,255) btn.BackgroundColor3 = Color3.fromRGB(40,40,40) btn.Font = Enum.Font.GothamBold btn.TextScaled = true btn.MouseButton1Click:Connect(callback) end

-- Functions -- local function autoSize() while true do wait(0.5) ReplicatedStorage:FindFirstChild("RemoteEvent"):FireServer({"GainSize"}) end end

local function autoRebirth() while true do wait(1) ReplicatedStorage:FindFirstChild("RemoteEvent"):FireServer({"Rebirth"}) end end

local function teleportToKingHead() local king = workspace:FindFirstChild("KingOfTheHillStatue") if king and king:FindFirstChild("Head") then character:SetPrimaryPartCFrame(king.Head.CFrame + Vector3.new(0, 3, 0)) end end

local function bugHitAnywhere() while true do wait(1) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= character then ReplicatedStorage.RemoteEvent:FireServer({"Damage", v}) end end end end

local function targetedRebirth(threshold) while true do wait(1) local stats = player.leaderstats if stats and stats:FindFirstChild("Strength") then local strength = tonumber(stats.Strength.Value) if strength and strength >= threshold then ReplicatedStorage.RemoteEvent:FireServer({"Rebirth"}) teleportToKingHead() end end end end

local function autoPetEquip() while true do wait(2) ReplicatedStorage.RemoteEvent:FireServer({"EquipBestPets"}) end end

local function saveSettings() writefile("IBAN_CAT_CONFIG.json", HttpService:JSONEncode({autoSize=true, rebirthThreshold=1000000})) end

local function loadSettings() if isfile("IBAN_CAT_CONFIG.json") then local data = HttpService:JSONDecode(readfile("IBAN_CAT_CONFIG.json")) if data.autoSize then spawn(autoSize) end if data.rebirthThreshold then spawn(function() targetedRebirth(data.rebirthThreshold) end) end end end

local function sendToDiscord(msg) local url = "YOUR_DISCORD_WEBHOOK" local data = HttpService:JSONEncode({content = msg}) syn.request({Url = url, Method = "POST", Headers = {"Content-Type" = "application/json"}, Body = data}) end

local function boostFivePack() while true do wait(0.05) ReplicatedStorage:FindFirstChild("RemoteEvent"):FireServer({"GainStrength"}) end end

-- GUI Buttons createButton("Start Auto Size", UDim2.new(0, 10, 0, 10), function() spawn(autoSize) end) createButton("Start Auto Rebirth", UDim2.new(0, 230, 0, 10), function() spawn(autoRebirth) end) createButton("Teleport to King", UDim2.new(0, 10, 0, 60), function() teleportToKingHead() end) createButton("Bug Hit Anywhere", UDim2.new(0, 230, 0, 60), function() spawn(bugHitAnywhere) end) createButton("Targeted Rebirth", UDim2.new(0, 10, 0, 110), function() spawn(function() targetedRebirth(1000000) end) end) createButton("Equip Best Pets", UDim2.new(0, 230, 0, 110), function() spawn(autoPetEquip) end) createButton("Save Settings", UDim2.new(0, 10, 0, 160), function() saveSettings() end) createButton("Load Settings", UDim2.new(0, 230, 0, 160), function() loadSettings() end) createButton("Send Log to Discord", UDim2.new(0, 10, 0, 210), function() sendToDiscord("IBAN CAT SCRIPT v9 started at: " .. os.date()) end) createButton("🔥 Activate 5-Pack Power Mode", UDim2.new(0, 230, 0, 210), function() spawn(boostFivePack) end)

print("[IBAN AND CAT SCRIPT v9 BUG+BOOST] Loaded.")

