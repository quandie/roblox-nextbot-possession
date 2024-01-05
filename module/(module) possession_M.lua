local possess_M = {}

local pathfindingservice = game:GetService("PathfindingService")
local Players = game:GetService("Players")

function possess_M.runpath()
	local NPC = game.Players.LocalPlayer
	local nearestPlayer = nil;
	local nearestDistance = 500;

	for _, player in pairs(Players:GetPlayers()) do
		local distance;

		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:WaitForChild("preventpath").Value == false then
			distance = (NPC:WaitForChild("HumanoidRootPart").Position - player.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
		else
			continue;
		end;

		if distance < nearestDistance then
			nearestPlayer = player;
			nearestDistance = distance;
		end;
	end;

	return nearestPlayer;
end

function possess_M.calcway()
	
	local agentargs = {
		AgentRadius = 3.0,
		AgentHeight = 5.0,
		AgentCanJump = true,
	}
	
	
	local nearestPlayer = possess_M.runpath()
	if nearestPlayer then
		local ezpath = pathfindingservice:CreatePath(agentargs)
		ezpath:ComputeAsync(game.Players.LocalPlayer, nearestPlayer)
		if ezpath.Status == Enum.PathStatus.Success then
			local wp = ezpath:GetWaypoints()
			for _, waypoint in pairs(wp) do
				print(waypoint.Position)
			end
		end
	elseif not nearestPlayer then
		print("player was not found.")
	end
end

function possess_M.dopath()
	possess_M.calcway()
end

return possess_M
