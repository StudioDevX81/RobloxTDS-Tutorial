local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhysicsService = game:GetService("PhysicsService")
local Players = game:GetService("Players")

local Modules = ReplicatedStorage:WaitForChild("Modules")

local Mob = require(Modules:WaitForChild("Mob"))

local CollisionGroups = {
	"Mobs",
	"Units",
	"Towers",
	"Players"
}

for i, collisionName in pairs(CollisionGroups) do
	PhysicsService:RegisterCollisionGroup(collisionName)
end

for i, collisionName in pairs(CollisionGroups) do
	for i, collisionName2 in pairs(CollisionGroups) do
		PhysicsService:CollisionGroupSetCollidable(collisionName, collisionName2, false)
	end
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		for i, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CollisionGroup = "Players"
			end
		end
	end)
	
	task.wait(5)
	
	Mob.Spawn("Dummy", 4, 0.15, nil)
	Mob.Spawn("SlowDummy", 2, 0.325, nil)
	Mob.Spawn("StudioDevX", 1, 0.1, nil)
end)