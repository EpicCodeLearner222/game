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

                  local settings = Instance.new("Folder", plr)
                  settings.Name = "Settings"

                  local music = Instance.new("BoolValue", settings)
                  music.Name = "Music"
                  music.Value = 0

                  local data
                  local data2
                  local s,f = pcall(function()
                              data = dataStore:GetAsync(plr.UserId.."-cash")
                              data2 = dataStore:GetAsync(plr.UserId.."-music
                        end)
                  if s then
                        print("Successfully loaded data!")
                        cash.Value = data
                        music.Value = data2
                  end
  end)

      -- Player Leaving Script

      players.PlayerRemoving:Connect(function(plr)
                  local s,f = pcall(function()
                              dataStore:SetAsync(plr.UserId.."-cash", plr.leaderstats.Cash.Value)
                                    dataStore:SetAsync(plr.UserId.."-music", plr.Settings.Music.Value)
                        end)
                  if s then
                        print("Saved data")
                  else
                        warn("Failed to save data")
                  end)
      end)
