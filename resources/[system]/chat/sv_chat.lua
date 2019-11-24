local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

local dname = "Origin Network"
local dmessage = "Server 1 er på vej op!"
PerformHttpRequest('https://discordapp.com/api/webhooks/534678671911288852/h3emkrGhwQ6B3zXs3MyJZlh3bN_-vhB_xxlMEVMEHqEqKo-zbSt0akq_I-6snEoelhf9', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end
	
	message = Emojit(message)
    TriggerEvent('chatMessage', source, author, message)
	
    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local dato = os.date("kl. %H:%M")
        if vRP.hasPermission({user_id,"staff.chattitle"}) then
            TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] | ^3Staff ^7| " ..author.. " | " ..dato.." ^0(^1"..user_id.."^0): " ..  message)
        --else
            --TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " .. author .. " | " ..dato.." ^0(^1" .. user_id .. "^0): ",  { 128, 128, 128 }, message)
        end
    end
	
	CancelEvent()
    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    if not command then
        return
    end
	
    local name = GetPlayerName(source)
	
	command = Emojit(command)
    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local dato = os.date("kl. %H:%M")
        if vRP.hasPermission({user_id,"staff.chattitle"}) then
		    TriggerClientEvent('chatMessage', -1, "[^1OOC^0] | ^3Staff ^7| " ..name.. " | " ..dato.." ^0(^1"..user_id.."^0): " ..  command)
        --else
			--TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " ..name.. " | " ..dato.." ^0(^1"..user_id.."^0): " ..  command)
        end
    end
	
	CancelEvent()
end)

function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end

-- player join messages
AddEventHandler('playerConnecting', function()
     print(GetPlayerName(source) .. ' forbinder til serveren')
end)

AddEventHandler('playerDropped', function(reason)
    if source ~= nil and GetPlayerName(source) ~= nil then
        print(GetPlayerName(source) ..' forlod serveren')
    end
end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'Borgmester' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)
