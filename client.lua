-- Variables
local plr = game.Players.LocalPlayer
local leaderstats = plr:WaitForChild("leaderstats")
local settings = plr:WaitForChild("Settings")

settings.Music.Changed:Connect(function()
    if settings.Music.Value == true then
      workspace.Sound.Enabled = false
    else
      workspace.Sound.Enabled = true
    end
  end)
