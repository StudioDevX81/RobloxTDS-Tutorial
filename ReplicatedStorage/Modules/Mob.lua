local ServerStorage = game:GetService("ServerStorage")
local EntitiesFolder = ServerStorage:WaitForChild("Entities")
local MobsFolder = EntitiesFolder:WaitForChild("Mobs")

local mob = {}

function mob.Move(mobToMove)
	local Waypoints = workspace.Map.Waypoints
	local Humanoid = mobToMove:WaitForChild("Humanoid")
	
	for waypoint=1, #Waypoints:GetChildren() do
		local function moveTo(humanoid, targetPoint)
			local targetReached = false

			local connection
			connection = humanoid.MoveToFinished:Connect(function(reached)
				targetReached = true
				connection:Disconnect()
				connection = nil
			end)

			humanoid:MoveTo(targetPoint)

			task.spawn(function()
				while not targetReached do
					if not (humanoid and humanoid.Parent) then
						break
					end
					if humanoid.WalkToPoint ~= targetPoint then
						break
					end
					humanoid:MoveTo(targetPoint)
					task.wait(6)
				end

				if connection then
					connection:Disconnect()
					connection = nil
				end
			end)
		end
		
		mobToMove.MovingTo.Value = waypoint
		moveTo(Humanoid, Waypoints[waypoint].Position)
		Humanoid.MoveToFinished:Wait()
	end
	
	if Humanoid.Health <= workspace.Map.Info.Health.Value then
		workspace.Map.Info.Health.Value -= Humanoid.Health
	else
		workspace.Map.Info.Health.Value = 0
	end
	mobToMove:Destroy()
end

function mob.Spawn(name, quantity, spawnRate, mobInfo)
	local mobExists = MobsFolder:FindFirstChild(name)
	
	if mobExists then
		for i=1, quantity do
			spawn(function()
				local newMob = mobExists:Clone()
				
				newMob:WaitForChild("HumanoidRootPart").CFrame = workspace.Map.Start.CFrame
				
				for i, part in pairs(newMob:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CollisionGroup = "Mobs"
					end
				end
				
				local MovingTo = Instance.new("IntValue")
				MovingTo.Name = "MovingTo"
				MovingTo.Parent = newMob
				
				newMob.Parent = workspace.Entities.Mobs
				
				newMob.Humanoid.Died:Connect(function()
					newMob:Destroy()
				end)
				
				coroutine.wrap(mob.Move)(newMob)
			end)
			task.wait(spawnRate or 0.85)
		end
	else
		warn("Requested mob does not exist:", name)
		return
	end
end

return mob
