local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

local player2 

local botname = replicatedStorage.possession.current_bot
--local possessball = game.Workspace:WaitForChild("possessorBall", math.huge)

local player = game.Players.PlayerAdded:Wait()

local bte = replicatedStorage.possession.bot_possessed_b

replicatedStorage.possession.getplayer.OnServerEvent:Connect(function(Player:string)
	player2 = Player
end)

local physics = game:GetService("PhysicsService")

local selfbot

workspace.DescendantAdded:Connect(function(op)
	if op:IsA("BasePart") and op.Name == "possessorBall" then
		op.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("ung_bot") then
				selfbot = hit.Parent.Name
				botname.Value = selfbot
				op:Destroy()
				print("bros touched")
				print("selfbot: "..selfbot.." botname: "..botname.Value)
				--replicatedStorage.possession.bot_touched:FireClient(player)
				print("fire")
				bte:Fire(player2)
			end
		end)
	end
end)


-- from quandie: thx zyne

-- the possessor changes parents when it gets equipped
-- unequipped = player backpack
-- equipped = player character
-- from zyne: note ^^
replicatedStorage.possession.invis.OnServerEvent:Connect(function(lp, bool : boolean)
	local lpc = lp.Character
	
	--[[local posTool = lp.Backpack:FindFirstChild("possessor") or lpc:FindFirstChild("possessor")
	posTool:Destroy()
	print("invis tiem") -- mis-spell on purpose (idk for funnyes)]] -- commented due bugs
	
	local humanoid = lpc:FindFirstChild("Humanoid")
	--humanoid.Name = "bot" -- also commented due bugs
	
	local Head
	local face

	if humanoid.RigType == Enum.HumanoidRigType.R6 then
		Head = lpc:FindFirstChild("Head")
		face = Head:FindFirstChild("face")
	end
	
	if bool then
		--[[local destroytool = lp.Backpack:FindFirstChild("possessor") or lpc:FindFirstChild("possessor")
		destroytool:Destroy()]] -- commented for testing
		
		local newhitbox = game.ReplicatedStorage.possession.posession_hitbox:Clone() -- cloning the hitbox
		newhitbox.Anchored = false -- the original is anchored and the clone is unanchored so the original doesnt fall incase
		newhitbox.Parent = player.Character
		newhitbox.Name = "hitbox"

		local newWeld = Instance.new("WeldConstraint") -- creating new weld
		newWeld.Parent = newhitbox
		newWeld.Name = "hitboxweld"
		newWeld.Part0 = newhitbox
		newWeld.Part1 = player.Character:WaitForChild("HumanoidRootPart")
		
		print(bool)
		if face then
			face.Transparency = 1
		end
		
		for _, v in pairs(lpc:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
				if v.Name ~= "Handle" and v.Parent:IsA("Accessory") then return end
				v.LocalTransparencyModifier = 1
				v.Transparency = 1
				v.CollisionGroup = "bot"
				if v.Name == "hitbox" then
					v.CollisionGroup = "hitbox"
					physics:CollisionGroupSetCollidable("bot", "hitbox", false)
				end
			end
		end
		
		task.wait(0.1)

		
	else
		print(bool)
		lpc:WaitForChild("hitbox"):Destroy()
		if face then
			face.Transparency = 0
		end
		
		for _, v in pairs(lpc:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
				if v.Name ~= "Handle" and v.Parent:IsA("Tool") then return end
				v.LocalTransparencyModifier = 0
				v.Transparency = 0
				v.CollisionGroup = "Default"
				if v.Name == "hitbox" then
					v.Transparency = 1
				end
				if v.Name == "HumanoidRootPart" then
					v.Transparency = 1
				end
			end
		end
		
	end

end)

--possessball.Touched:Connect(function(hit)
--	if hit.Parent:FindFirstChild("bot") then
--		possessball:Remove()
--		print("bros touched")
--		game.ReplicatedStorage.quandie_events.possession.bot_touched:FireClient(player)
--	end
--end)

