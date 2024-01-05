local lp = game.Players.LocalPlayer
local ch = lp.Character

local timer = script.Parent.timer1
local int = script.Parent.time

local waittime = script.Parent.waittime

script.Parent.Parent.Parent.toggleui.Event:Connect(function()
	for i = int.Value, 0,-1 do
		local minute = tostring(math.floor(i/60))
		local sec = math.floor(i%60)
		if sec < 10 then
			sec = "0".. tostring(math.floor(i%60))
		end
		timer.Text = "[ "..minute..":"..sec.." ]"
		int.Value -= 1
		task.wait(waittime.Value)
	end

end)




int:GetPropertyChangedSignal("Value"):Connect(function()
	if int.Value <= -1 then
		script.Parent.timer1.Text = "[ X:XX ]"
		script.Parent.Parent.message.Text = "ran out of TIME possessing "..script.Parent.Parent.Parent.current_bot.Value
		script.Parent.Parent.message:TweenPosition(UDim2.new(0.72, 0,0.932, 0))
		game.ReplicatedStorage.possession.ranout:FireServer(lp.Name)
		script.Parent.Parent.screen.Visible = false
		game.ReplicatedStorage.possession.invis:FireServer(false)
		script.Parent.Parent.turbo:TweenPosition(UDim2.new(0.349, 0,1.01, 0))
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
		task.wait(3)
		script.Parent.Parent.message:TweenPosition(UDim2.new(1.05, 0,0.932, 0))
		script.Parent.Parent.timer:TweenPosition(UDim2.new(0.377, 0,1.15, 0))
		script.Parent.Parent.killcounter:TweenPosition(UDim2.new(0.398, 0,-0.2, 0))
	end
end)