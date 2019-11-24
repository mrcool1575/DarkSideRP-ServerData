--Made by Skovsbøll#3650

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/fix" then
	  local user_id = vRP.getUserId({source})
	  local player = vRP.getUserSource({user_id})
	  if vRP.hasPermission({user_id,"ledelse.fix"}) then
		TriggerClientEvent('murtaza:fix', source);
		local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
		local dmessage = "**FIX** \n```\nID: ".. tostring(user_id).. "\nCommand: /fix\n```"
		PerformHttpRequest('https://discordapp.com/api/webhooks/511611032545001472/jSkDAJOnWeSs11jpoGy3VkUWBzcHd57u1FVnUHqzZ-c-TnUbbFcCxebT-PI_-zkzbiXo', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
		CancelEvent();	  
	  end
	end
end)