local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","hp_takeoff")

AddEventHandler('chatMessage', function(source, name, message)
	splitmessage = stringsplit(message, " ")
        
    if string.lower(splitmessage[1]) == "/maske" then
        CancelEvent()
        TriggerClientEvent("hp:fjernmaske", source)
    elseif string.lower(splitmessage[1]) == "/hat" then
        CancelEvent()
        TriggerClientEvent("hp:fjernhat", source)
    elseif string.lower(splitmessage[1]) == "/overtøj" or string.lower(splitmessage[1]) == "/overtoj" or string.lower(splitmessage[1]) == "/overtrøje" then
        CancelEvent()
        TriggerClientEvent("hp:fjernjakke", source)
    elseif string.lower(splitmessage[1]) == "/undertrøje" or string.lower(splitmessage[1]) == "/undertroje" or string.lower(splitmessage[1]) == "/undertøj" then
        CancelEvent()
        TriggerClientEvent("hp:fjerntrøje", source)
    elseif string.lower(splitmessage[1]) == "/tagtrøjeraf" then
        CancelEvent()
        TriggerClientEvent("hp:fjernovertøj", source)
    elseif string.lower(splitmessage[1]) == "/hals" or string.lower(splitmessage[1]) == "/slips" or string.lower(splitmessage[1]) == "/halskæde" then
        CancelEvent()
        TriggerClientEvent("hp:fjernhals", source)
    elseif string.lower(splitmessage[1]) == "/ur" or string.lower(splitmessage[1]) == "/armbånd" then
        CancelEvent()
        TriggerClientEvent("hp:fjernur", source)
    elseif string.lower(splitmessage[1]) == "/briller" then
        CancelEvent()
        TriggerClientEvent("hp:fjernbriller", source)
    elseif string.lower(splitmessage[1]) == "/bukser" then
        CancelEvent()
        TriggerClientEvent("hp:fjernbukser", source)
    elseif string.lower(splitmessage[1]) == "/fængselstøj" then
        CancelEvent()
        TriggerClientEvent("hp:fængselstøj", source)
    elseif string.lower(splitmessage[1]) == "/sko" or string.lower(splitmessage[1]) == "/fodtøj" then
        CancelEvent()
        TriggerClientEvent("hp:fjernsko", source)
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

 