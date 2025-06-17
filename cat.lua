local layout = Instance.new("UIListLayout", main)
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- 🧩 Button factory
local function createToggle(txt, key)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 240, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.Text = "❌ " .. txt
    btn.AutoButtonColor = false
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = toggles[key] and Color3.fromRGB(70,150,70) or Color3.fromRGB(60,60,60)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = toggles[key] and Color3.fromRGB(60,150,60) or Color3.fromRGB(45,45,45)
    end)
    btn.MouseButton1Click:Connect(function()
        toggles[key] = not toggles[key]
        btn.Text = (toggles[key] and "✅ " or "❌ ") .. txt
        btn.BackgroundColor3 = toggles[key] and Color3.fromRGB(60,150,60) or Color3.fromRGB(45,45,45)
    end)
end

-- 🛠️ Buttons
createToggle("💪 Auto Muscle", "autoMuscle")
createToggle("⚡ Ultra Power x5", "ultraPower")
createToggle("📏 Auto Size", "autoSize")
createToggle("🔁 Auto Rebirth", "autoRebirth")
createToggle("⚔️ Auto Kill", "killFarm")
createToggle("🌍 Auto Zones", "autoZones")
createToggle("🚀 Zone Bug Boost", "zoneBug")
createToggle("📦 Auto Chest", "autoChest")
createToggle("✨ Auto Auras", "autoAuras")
createToggle("🐾 Auto Pets (Crystal)", "autoPets")
