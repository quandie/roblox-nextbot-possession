local lp = game.Players.LocalPlayer
local ch = lp.Character
local mainframe = script.Parent.mainframe
local killcounter = mainframe.killcounter
local timerframe = mainframe.timer
local vhs = mainframe.screen

local uis = game:GetService("UserInputService")

local turboenabled = false

script.Parent.toggleui.Event:Connect(function()
	killcounter:TweenPosition(UDim2.new(0.398, 0,0.02, 0))
	timerframe:TweenPosition(UDim2.new(0.377, 0,0.889, 0))
	timerframe.botimage.Image = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").icon.ImageLabel.Image
	vhs.Visible = true
end)

uis.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.LeftShift and ch:WaitForChild("possessedstate").Value == true then
		if turboenabled == false then
			script.Parent.mainframe.turbo:TweenPosition(UDim2.new(0.349,0,0.944,0))
			timerframe:TweenPosition(UDim2.new(0.377, 0,0.845, 0))
			timerframe.waittime.Value = 0.5
			turboenabled = true
			ch:FindFirstChild("Humanoid").WalkSpeed = script.Parent.botspeed.Value * 2
		elseif turboenabled == true then
			script.Parent.mainframe.turbo:TweenPosition(UDim2.new(0.349, 0,1.01, 0))
			timerframe:TweenPosition(UDim2.new(0.377, 0,0.9, 0))
			turboenabled = false
			timerframe.waittime.Value = 1
			ch:FindFirstChild("Humanoid").WalkSpeed = script.Parent.botspeed.Value
		end
	end
end)


