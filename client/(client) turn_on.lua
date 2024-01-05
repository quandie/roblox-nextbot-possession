game.Players.LocalPlayer.Backpack:WaitForChild("possessor").LocalScript.toggle.Event:Connect(function()
	game.ReplicatedStorage.possession.getplayer:FireServer("playername")
	script.Parent.launched.Value = true
	task.wait(5)
	script.Parent.launched.Value = false
end)