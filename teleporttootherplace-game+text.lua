local telePart = script.Parent
local TeleportService = game:GetService('TeleportService')
local placeID = (6953314895)
--replace this part
local canTeleport = true

local function otherGame(otherPart)
	local player = game.Players:FindFirstChild(otherPart.Parent.Name)
	if player and canTeleport then
		canTeleport = false
		local gui = Instance.new("ScreenGui")
		gui.Parent = player:WaitForChild("PlayerGui")
		local text = Instance.new("TextLabel", gui)
		text.Text = "Teleport in progress"
		text.Size = UDim2.new(0, 200, 0, 50)
		text.Position = UDim2.new(0.5, -100, 1, -60)
		text.BackgroundColor3 = Color3.new(0, 0, 0)
		text.BackgroundTransparency = 0.5
		text.TextColor3 = Color3.new(1, 1, 1)
		text.Font = Enum.Font.SourceSansBold
		text.TextSize = 20
		TeleportService:Teleport(placeID, player)
		wait(10) --cooldown time
		gui:Destroy()
		canTeleport = true
	end
end

telePart.Touched:Connect(otherGame)
