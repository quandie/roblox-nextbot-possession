local player2

game.ReplicatedStorage.possession.ranout.OnServerEvent:Connect(function(Player)
	player2 = Player
	Player.Character:WaitForChild("HumanoidRootPart"):WaitForChild("ParticleEmitter"):Destroy()
	Player.Character:WaitForChild("HumanoidRootPart"):WaitForChild("icon"):Destroy()
	Player.Character:WaitForChild("Humanoid").Name = "Humanoid"
	Player.Character:WaitForChild("HumanoidRootPart"):WaitForChild("theme"):Destroy()
	Player.Character:WaitForChild("Humanoid").WalkSpeed = 16
	Player.Character:WaitForChild("preventpath").Value = false
	Player.Character:WaitForChild("possessedstate").Value = false
	
	local respawnbot = game.ReplicatedStorage.possession.possessedbots:WaitForChild(Player.Character:WaitForChild("currentbot").Value):Clone()
	respawnbot.Parent = workspace.bots
	respawnbot:MoveTo(Player.Character:WaitForChild("HumanoidRootPart").Position)
	Player.Character:WaitForChild("currentbot"):Destroy()
	wait(3)
	respawnbot.spai.Enabled = true
end)
