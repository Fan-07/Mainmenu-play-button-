local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local mainFrame = script.Parent
local lettersFolder = mainFrame:WaitForChild("letters") --folders that contain your letters must be named "letters"

-- you can mess around here to try different variants
local MAX_OFFSET = 16
local MOUSE_PULL = 0.8       
local WOBBLE_AMPLITUDE = 15 
local RETURN_SPEED = 3         -- strong snap back

local letters = {}

for _, letter in ipairs(lettersFolder:GetChildren()) do
	if letter:IsA("TextLabel") then

		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 2
		stroke.Transparency = 0.3
		stroke.Color = Color3.fromRGB(120, 200, 255)
		stroke.Parent = letter

		letters[letter] = {
			basePos = letter.Position,
			offset = Vector2.zero,
			seed = math.random(1, 1000),
			stroke = stroke
		}

		letter.TextTransparency = 0
	end
end

RunService.RenderStepped:Connect(function()
	local time = tick()
	local mousePos = UserInputService:GetMouseLocation()

	for letter, data in pairs(letters) do

		local center = letter.AbsolutePosition + (letter.AbsoluteSize / 2)

		local wobble = Vector2.new(
			math.sin(time * 1.2 + data.seed),
			math.cos(time * 1.1 + data.seed)
		) * WOBBLE_AMPLITUDE


		local dx = (mousePos.X - center.X) * MOUSE_PULL
		local dy = (mousePos.Y - center.Y) * MOUSE_PULL

		local targetOffset = wobble + Vector2.new(dx, dy)

		data.offset = data.offset:Lerp(targetOffset, RETURN_SPEED)

		if data.offset.Magnitude > MAX_OFFSET then
			data.offset = data.offset.Unit * MAX_OFFSET
		end
	end

	for letter, data in pairs(letters) do

		letter.Position = data.basePos + UDim2.fromOffset(data.offset.X, data.offset.Y)

		local glow = 0.5 + math.sin(time * 2 + data.seed) * 0.2

		data.stroke.Transparency = 0.35 - glow * 0.2
		data.stroke.Thickness = 2 + glow * 2
		data.stroke.Color = Color3.fromRGB(120, 200, 255)
	end
end)
