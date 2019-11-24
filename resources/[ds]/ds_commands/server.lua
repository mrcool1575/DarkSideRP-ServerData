local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_cancer")

AddEventHandler('chatMessage', function(source, name, message)

        splitmessage = stringsplit(message, " ");

        if string.lower(splitmessage[1]) == "/hjælp" or string.lower(splitmessage[1]) == "/help" then
            CancelEvent()
            TriggerClientEvent('chatMessage', source, "Hjælp 1: ", {255, 0, 0}, "/tweet, /twitter, /twt - Skriv en tweet!")
            TriggerClientEvent('chatMessage', source, "Hjælp 2: ", {255, 0, 0}, "/mig - Skriv en handling der passer til rp'et")
            TriggerClientEvent('chatMessage', source, "Hjælp 3: ", {255, 0, 0}, "/k - Overgiv dig")
            TriggerClientEvent('chatMessage', source, "Hjælp 5: ", {255, 0, 0}, "/report - Kan bruges hvis du vil rapporterer noget")
            TriggerClientEvent('chatMessage', source, "Hjælp 5: ", {255, 0, 0}, "/stopr - Kan bruges hvis notifikations-systemet bugger.")
            TriggerClientEvent('chatMessage', source, "Hjælp 6: ", {255, 0, 0}, "Brug F9 for at åbne din menu.")
        elseif string.lower(splitmessage[1]) == "/stopr" or string.lower(splitmessage[1]) == "/stopr" then
            CancelEvent()
            TriggerClientEvent("pNotify:SendNotification", source,{text = " ", type = "error", queue = "global", timeout = 1, layout = "topLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer=true})
        elseif string.lower(splitmessage[1]) == "/tweet" or string.lower(splitmessage[1]) == "/twitter" or string.lower(splitmessage[1]) == "/twt" then
            local nuser_id = vRP.getUserId({source})
			CancelEvent()
            if nuser_id ~= nil then
                vRP.getUserIdentity({nuser_id, function(identity)
					if identity then
                        local efternavn = string.gsub(identity.name, "%s", "")
                        local fornavn = string.gsub(identity.firstname, "%s", "")
						if vRP.hasInventoryItem({nuser_id, "phone"}) or vRP.hasInventoryItem({nuser_id, "phone1"})  then
							vRPclient.isInComa(source,{}, function(in_coma)
								if in_coma then
								TriggerClientEvent("pNotify:SendNotification", source,{text = "Du kan ikke tweete mens du er død",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
								else
									TriggerClientEvent('chatMessage', -1, "^5TWEET ^0| @" ..string.lower(fornavn).. "_" ..string.lower(efternavn), {0, 172, 237}, string.sub(message,string.len(splitmessage[1])+1))
								end
							end)
						else
							TriggerClientEvent("pNotify:SendNotification", source,{text = "<center><h2>📲Du skal have en mobil før du kan bruge Twitter</h2></center>",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
						end
                    end
                end})
            end
        elseif string.lower(splitmessage[1]) == "/me" or string.lower(splitmessage[1]) == "/mig" then
            local nuser_id = vRP.getUserId({source})
			CancelEvent()
            if nuser_id ~= nil then
                vRP.getUserIdentity({nuser_id, function(identity)
                    if identity then
                        local efternavn = identity.name
                        local fornavn = identity.firstname

                        TriggerClientEvent('proximityMessage', -1, tonumber(source), "", {255, 0, 0}, 30, "^6*" .. fornavn .. " " .. efternavn .. "* " .. string.sub(message,string.len(splitmessage[1])+1))
                    end
                end})
            end            
        end
        
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end