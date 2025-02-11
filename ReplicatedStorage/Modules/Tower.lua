local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Entities = workspace.Entities
local Towers = ReplicatedStorage.Towers.Towers
local TowersUpgrades = ReplicatedStorage.Towers.Upgrades

local tower = {}

local function FindTarget(newTower, range)
	local bestTarget = nil
	local bestDistance = nil
	local bestWaypoint = nil
	
	for i, mob in pairs(Entities.Mobs:GetChildren()) do
		local distance = (mob.HumanoidRootPart.Position - newTower.HumanoidRootPart.Position).Magnitude
		local waypointDistance = (mob.HumanoidRootPart.Position - workspace.Map.Waypoints[mob.MovingTo.Value].Position).Magnitude
		
		if distance <= range then
			if not bestWaypoint or bestWaypoint < mob.MovingTo.Value then
				bestWaypoint = mob.MovingTo.Value
				if not bestDistance or bestDistance > waypointDistance then
					bestDistance = waypointDistance
					bestTarget = mob
				end
			end
		end
	end
	
	return bestTarget
end

function tower.Attack(newTower)
	local Target = FindTarget(newTower, 10)
	
	if Target and Target.Parent then
		
		local function lookAtHorizontal(originPosition, targetPosition)
			local direction = Vector3.new(originPosition.X - targetPosition.X, 0, originPosition.Z - targetPosition.Z)
			local lookAtCFrame = CFrame.lookAt(originPosition, originPosition - direction)
			return lookAtCFrame
		end
		
		newTower.HumanoidRootPart.CFrame = lookAtHorizontal(newTower.HumanoidRootPart.Position, Target.HumanoidRootPart.CFrame)
		
		Target.Humanoid:TakeDamage(10)
		task.wait(0.1)
	else
		task.wait(0.1)
	end
	
	coroutine.wrap(tower.Attack)(newTower)
end

function tower.Spawn(plr, name, cframe)
	local TowerExist = Towers:FindFirstChild(name)
	if TowerExist then
		local newTower = TowerExist:Clone()
		
		for i, part in pairs(newTower:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CollisionGroup = "Towers"
			end
		end
		
		newTower.HumanoidRootPart.CFrame = cframe
		
		newTower.Parent = Entities.Towers
		
		coroutine.wrap(tower.Attack)(newTower)
	else
		warn("Requested tower does not exist:", name)
		return "Requested tower does not exist:", name
	end
end

return tower
