local lp = game.Players.LocalPlayer

game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
	if lp.Character:WaitForChild("possessedstate").Value == true then
		if lp.Character:WaitForChild("currentbot") then
			lp.CameraMode = Enum.CameraMode.Classic
			script.Parent.mainframe.timer:WaitForChild("time").Value = -1
		end
	end
end)