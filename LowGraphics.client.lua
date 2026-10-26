-- Android Roblox Low Graphics
-- Target: 30 FPS (best effort; does not cap FPS)
-- Use only in Roblox Studio experiences you own or are authorized to edit.
-- Install as a LocalScript in StarterPlayer > StarterPlayerScripts.

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local function optimize(instance)
    if instance:IsA("BasePart") then
        instance.CastShadow = false
        instance.Reflectance = 0

    elseif instance:IsA("PostEffect") then
        instance.Enabled = false

    elseif instance:IsA("ParticleEmitter")
        or instance:IsA("Trail")
        or instance:IsA("Beam")
        or instance:IsA("Fire")
        or instance:IsA("Smoke")
        or instance:IsA("Sparkles") then
        instance.Enabled = false
    end
end

Lighting.GlobalShadows = false

for _, instance in ipairs(Lighting:GetDescendants()) do
    optimize(instance)
end

for _, instance in ipairs(Workspace:GetDescendants()) do
    optimize(instance)
end

Workspace.DescendantAdded:Connect(optimize)
Lighting.DescendantAdded:Connect(optimize)

print("[Android Low Graphics] Visual optimization enabled.")
