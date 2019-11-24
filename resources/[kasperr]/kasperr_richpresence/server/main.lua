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

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "kasperr_richpresence")

RegisterServerEvent('kasperr_richpresence:getPlayerInfo')
AddEventHandler('kasperr_richpresence:getPlayerInfo', function()
    local _source = source
    local user_id = vRP.getUserId({source})

    local users = vRP.getUsers()
    local userCounter = 0
    for k, v in pairs(users) do
      userCounter = userCounter + 1
    end

    vRP.getUserIdentity({user_id, function(identity)
        if identity then
            TriggerClientEvent("kasperr_richpresence:setRichPresence", _source, identity.firstname, identity.name, user_id, userCounter)
        else
            TriggerClientEvent("kasperr_richpresence:setRichPresence", _source, false, false, false, userCounter)
        end
    end})
end)