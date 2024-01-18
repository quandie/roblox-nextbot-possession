local rs = game.ReplicatedStorage
local po = rs.possession
local pe = po.possessing_u
local bf = game.Workspace.bots
local currentbot = script.Parent.current_bot
local botname = rs.possession.current_bot
local removebot = rs.possession.removebottemp
local lp = game.Players.LocalPlayer
local character = lp.Character
local cooldown = false
local dopath = require(po.possession_M)
local uis = game:GetService("UserInputService")


botname:GetPropertyChangedSignal("Value"):Connect(function()
	script.Parent.current_bot.Value = botname.Value
end)


pe.OnClientEvent:Connect(function(botnameself:string)
	if script.Parent.launched.Value == true --[[and not character:WaitForChild("possessedstate").Value]] then 
		--print("successfully POSSESSED "..botnameself)
		script.Parent.mainframe.timer.time.Value = 60
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
		print("get fire")
		script.Parent.toggleui:Fire()
		script.Parent.launched.Value = false
		
		print("bot founded, possessing")
		rs.possession.invis:FireServer(true)

		character:WaitForChild("HumanoidRootPart"):WaitForChild("ParticleEmitter").Enabled = false
		character:WaitForChild("HumanoidRootPart"):WaitForChild("icon").Enabled = false
		script.Parent.mainframe.screen.overlay.anim.Enabled = true
		script.Parent.mainframe.message.Text = "successfully POSSESSED "..botname.Value
		script.Parent.mainframe.message.Visible = true
		script.Parent.mainframe.message:TweenPosition(UDim2.new(0.72, 0,0.932, 0))
		task.wait(3)
		script.Parent.mainframe.message:TweenPosition(UDim2.new(1.05, 0,0.932, 0))
		task.wait(3)
		script.Parent.mainframe.message.Visible = false
		
	end
		
end)


-- q to possession pathfind
uis.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Q then
		if character:WaitForChild("possessedstate").Value == true then
			print("ez path")
			dopath.dopath()
			print("did ez path")
		else
			print("no ez path(((")
		end
	end
end)
