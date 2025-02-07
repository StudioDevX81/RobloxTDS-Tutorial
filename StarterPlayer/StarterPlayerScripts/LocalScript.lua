workspace.Map:WaitForChild("Base").Humanoid.HealthChanged:Connect(function(value)
	workspace.Map.Base.BillboardGui.TextLabel.Text = value .. "/" ..workspace.Map.Base.Humanoid.MaxHealth
end)