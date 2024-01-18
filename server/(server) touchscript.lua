local touched = false
local cd = false
local rs = game.ReplicatedStorage

script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		if hit.Parent:FindFirstChild("hitbox") then
			return
		end
		
		if hit.Parent.Name == "hitbox" then return end
		
		if hit.Parent:FindFirstChild("possessedstate").Value == false then
			if hit.Parent:FindFirstChild("Humanoid").Health > 0 then
				if cd == false then
					local humanoid = hit.Parent:FindFirstChild("Humanoid")
					local player = game.Players:GetPlayerFromCharacter(script.Parent.Parent)
					humanoid:TakeDamage(100)
					rs.possession.addkill:FireClient(player, hit.Parent.Name)
					cd = true
					task.wait(0.1)
					cd = false
				else
					return
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end)
