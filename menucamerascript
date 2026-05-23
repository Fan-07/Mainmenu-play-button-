local Players = game:GetService("Players")
local RunService = game:GetService("RunService")


local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()


local camPart = workspace:WaitForChild("Menu Camera")


camera.CameraType = Enum.CameraType.Scriptable

local maxTilt = 8

_G.MenuCameraConnection = RunService.RenderStepped:Connect(function()
	local offsetX = (mouse.X - mouse.ViewSizeX/2) / mouse.ViewSizeX
	local offsetY = (mouse.Y - mouse.ViewSizeY/2) / mouse.ViewSizeY

	local tilt = CFrame.Angles(
		math.rad(-offsetY * maxTilt),
		math.rad(-offsetX * maxTilt),
		0
	)

	camera.CFrame = camPart.CFrame * tilt
end)
