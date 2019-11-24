MySQL = module("vrp_mysql", "MySQL")
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","revive")
--Made by Skovsbøll#0001
-- Add an event handler for the 'chatMessage' event
AddEventHandler( 'chatMessage', function( source, n, msg )

    msg = string.lower( msg )
    
    -- Check to see if a client typed in /dv
    if ( msg == "/revive" or msg == "/reviveme" ) then 
    
        -- Cancel the chat message event (stop the server from posting the message)
        CancelEvent() 
        
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"staff.revive"}) then
        -- Trigger the client event s
        TriggerClientEvent( 'revive', source )
			vRP.setHunger({user_id, 0})
			vRP.setThirst({user_id, 0})
		 	local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
			local dmessage = "**REVIVE** \n```\nID: ".. tostring(user_id).. "\nCommand: /revive\n```"
			PerformHttpRequest('https://discordapp.com/api/webhooks/524314547465748491/JBBVCt6u0TxN0eZWmz2E3ER21BGu_V84k-CLqeBLi4p5ZDbxhg48ySV9Cwtuhido2FjS', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
        end
    end
end )