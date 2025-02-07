local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhysicsService = game:GetService("PhysicsService")
local Players = game:GetService("Players")

local Modules = ReplicatedStorage:WaitForChild("Modules")

local Mob = require(Modules:WaitForChild("Mob"))

local CollisionsNames = {
	"Mobs",
	"Units",
	"Towers",
	"Players"
}

for i, collisionName in pairs(CollisionsNames) do
	PhysicsService:RegisterCollisionGroup(collisionName)
end

for i, collisionName in pairs(CollisionsNames) do
	for _, collisionName2 in pairs(CollisionsNames) do
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
	
	for i=5, 1, -1 do
		print("starting in " .. i .. " seconds.")
		task.wait(1)
	end
	
	Mob.Spawn("Dummy", 4, 0.22, nil)
	Mob.Spawn("SlowDummy", 2, 0.32, nil)
	Mob.Spawn("StudioDevX", 1, 0.22, nil)
end)