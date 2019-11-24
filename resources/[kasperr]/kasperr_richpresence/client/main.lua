--[[
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
]]

Citizen.CreateThread(function()
  while true do
    TriggerServerEvent("kasperr_richpresence:getPlayerInfo")
    Citizen.Wait(60000)
	end
end)

RegisterNetEvent("kasperr_richpresence:setRichPresence")
AddEventHandler("kasperr_richpresence:setRichPresence", function(firstname, lastname, user_id, userCount)
    SetDiscordAppId(Config.DiscordAppID)
    SetDiscordRichPresenceAsset(Config.DiscordRichPresenceAssetName)
    SetDiscordRichPresenceAssetText(Config.Title)
    SetDiscordRichPresenceAssetSmall(Config.DiscordRichPresenceAssetName)
    SetDiscordRichPresenceAssetSmallText('')
    local users = userCount .. "/" .. Config.MaxClients
    if firstname ~= false and lastname ~= false and user_id ~= false then 
        local string = ""
        if Config.ShowCharacterFullName == true then 
          string = string .. firstname .. " " .. lastname
        end
        if Config.ShowUserID == true then 
          if Config.ShowCharacterFullName == true then 
            string = string .. " - ID: " .. user_id
          else
            string = string .. "ID: " .. user_id 
          end
        end
        if Config.ShowPlayerCounter == true then 
          string = string .. " [" .. users .. "]"
        end
        SetRichPresence(string)
    else 
        SetRichPresence("")
    end
end)