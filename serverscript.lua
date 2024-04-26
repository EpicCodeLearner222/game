-- Variables

local players = game.Players
local lighting = game.Lighting
local dss = game:GetService("DataStoreService")
local dataStore = dss:GetDataStore("MainGameData",1)
-- Player Joining Script

players.PlayerAdded:Connect(function(plr)
local leaderstats = Instance.new("Folder', plr)
      leaderstats.Name = "leaderstats"

                  local cash = Instance.new("NumberValue", leaderstats)
                  cash.Name = "Cash"
                  cash.Value = 0

                  local data

                  local s,f = pcall(function()
                              data = dataStore:GetAsync(plr.UserId.."-cash")
                        end)
                  if s then
                        print("Successfully loaded data!")
                        cash.Value = data

                  end
  end)
