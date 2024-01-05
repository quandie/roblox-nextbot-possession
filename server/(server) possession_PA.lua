game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()

		local bool = Instance.new("BoolValue") -- this bro is gonna prevent bot chase player if TRUE
		bool.Name = "preventpath"
		bool.Parent = player.Character or player.CharacterAdded:Wait()

		local bool2 = Instance.new("BoolValue")
		bool2.Name = "possessedstate" -- this bro is gonna prevent some bugs
		bool2.Parent = player.Character or player.CharacterAdded:Wait()
	end)
end)