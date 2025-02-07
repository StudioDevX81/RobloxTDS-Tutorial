local ServerStorage = game:GetService("ServerStorage")

local MobFolder = ServerStorage:WaitForChild("Mobs")

local mob = {}

function mob.Move(mobToMove)
	local Waypoints = workspace.Map.Waypoints
	
	for i=1, #Waypoints:GetChildren() do
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
					task.wait(0.1)
				end

				if connection then
					connection:Disconnect()
					connection = nil
				end
			end)
		end

		moveTo(mobToMove:WaitForChild("Humanoid"), Waypoints[i].Position)
		mobToMove:WaitForChild("Humanoid").MoveToFinished:Wait()
	end
	
	workspace.Map.Base.Humanoid:TakeDamage(mobToMove:WaitForChild("Humanoid").Health)
	mobToMove:Destroy()
end

function mob.Spawn(name, quantity, spawnRate, mobInfo)
	local mobToSpawn = MobFolder:FindFirstChild(name)
	
	if mobToSpawn then
		for i=1, quantity do
			spawn(function()
				local newMob = mobToSpawn:Clone()

				for i, part in pairs(newMob:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CollisionGroup = "Mobs"
					end
				end
				
				newMob:WaitForChild("HumanoidRootPart").CFrame = workspace.Map.Start.CFrame

				newMob.Parent = workspace.Entities.Mobs
				mob.Move(newMob)
			end)
			task.wait(spawnRate)
		end
	else
		warn("Requested mob does not exist:", name)
	end
end

return mob
