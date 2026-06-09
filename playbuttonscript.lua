local button = script.Parent
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local gui = button:FindFirstAncestor("Main Menu GUI")

local mainFrame = gui:WaitForChild("MainFrame")
local menuCameraScript = gui:WaitForChild("MenuCameraScript")

local playerGui = player:WaitForChild("PlayerGui")

button.MouseButton1Click:Connect(function()
		--if you want other GUIs to appear after clicking play, under the above (mousebutton1click) function (here) you can add:
		-- local playerGui = player:WaitForChild("PlayerGui") 
		-- playerGui:WaitForChild("GUI1").Enabled = true
        -- playerGui:WaitForChild("GUi2").Enabled = true
        -- playerGui:WaitForChild("GUI3").Enabled = true

	gameGui.Enabled = true

	local goalPosition = UDim2.new(
		mainFrame.Position.X.Scale,
		mainFrame.Position.X.Offset,
		mainFrame.Position.Y.Scale + 1,
		mainFrame.Position.Y.Offset
	)

	local tweenInfo = TweenInfo.new(
		0.6,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	local tween = TweenService:Create(mainFrame, tweenInfo, {Position = goalPosition})
	tween:Play()

	tween.Completed:Connect(function()
		mainFrame.Visible = false
	end)

	if menuCameraScript and menuCameraScript:IsA("LocalScript") then
		menuCameraScript.Enabled = false
	end

	task.spawn(function()
		local blur = lighting:FindFirstChild("Blur")
		if blur then
			while blur.Size > 0 do
				task.wait(0.05)
				blur.Size = math.max(0, blur.Size - 3)
			end
		end
	end)

	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	camera.CameraType = Enum.CameraType.Custom
	camera.CameraSubject = humanoid
end)
