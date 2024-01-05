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
		script.Parent.mainframe.timer.time.Value = 10
		--game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
		print("get fire")
		script.Parent.toggleui:Fire()
		script.Parent.launched.Value = false

		print("bot founded, possessing")
		rs.possession.invis:FireServer(true)

		character:WaitForChild("HumanoidRootPart"):WaitForChild("ParticleEmitter").Enabled = false
		character:WaitForChild("HumanoidRootPart"):WaitForChild("icon").Enabled = false
		script.Parent.mainframe.message.Text = "successfully POSSESSED "..botname.Value
		script.Parent.mainframe.message:TweenPosition(UDim2.new(0.72, 0,0.932, 0))
		task.wait(3)
		script.Parent.mainframe.message:TweenPosition(UDim2.new(1.05, 0,0.932, 0))
		
	end
		
end)

--[[for _, v in pairs(character:GetChildren()) do
	if v:IsA("Part") then
		v.Touched:Connect(function(hit)
			if game.Players:GetPlayerFromCharacter(hit.Parent) then
				print("i touched other player")
				
				if lp.Character:WaitForChild("possessing").Value then
					wait(1)
					local player_2 = game.Players:GetPlayerFromCharacter(hit.Parent)
					print("get 2 player")
					if player_2.Character:WaitForChild("Humanoid").Health >= 0 and not cooldown then
						cooldown = true
						player_2.Character:WaitForChild("Humanoid"):TakeDamage(100 - player_2.Character:WaitForChild("Humanoid").Health)
					else
						print("bro dead :skull:")
					end
					print("player killed! +5 seconds!")
					script.Parent.mainframe.timer.time.Value += 5
					wait(1)
					cooldown = false
				end
			end
		end)
	end
end]] -- PLEASE DONT UNCOMMENT IT IF YOU DONT WANNA BROKE THIS SCRIPT


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