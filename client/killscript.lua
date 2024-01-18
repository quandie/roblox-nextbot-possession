script.Parent.killsn:GetPropertyChangedSignal("Value"):Connect(function()
	if script.Parent.killsn.Value <= 9 then
		script.Parent.numbers.Text = "[ 0 0 0 "..script.Parent.killsn.Value.." ]"
	elseif script.Parent.killsn.Value <= 19 then
		script.Parent.numbers.Text = "[ 0 0 "..script.Parent.killsn.Value.." ]"
	elseif script.Parent.killsn.Value <= 199 then
		script.Parent.numbers.Text = "[ 0 "..script.Parent.killsn.Value.." ]"
	elseif script.Parent.killsn.Value >= 1000 then
		script.Parent.numbers.Text = "[ "..script.Parent.killsn.Value.." ]"
	end
end)

game.ReplicatedStorage.possession.addkill.OnClientEvent:Connect(function(name:string)
	script.Parent.killsn.Value += 1
	local kill = script.Parent.kill:Clone()
	kill.Parent = script.Parent.Parent
	kill.Position = UDim2.new(0.362, 0,0.742, 0)
	kill.plrname.Text = name
	kill.Visible = true
	task.wait(3)
	kill.Visible = false
	kill:Destroy()
end)
