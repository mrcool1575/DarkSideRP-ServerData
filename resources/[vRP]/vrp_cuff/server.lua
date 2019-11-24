local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vrpMySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_cuff")

vRPscuff = {}
Tunnel.bindInterface("vRP_cuff",vRPscuff)
Proxy.addInterface("vRP_cuff",vRPscuff)
vRPccuff = Tunnel.getInterface("vRP_cuff","vRP_cuff")

if time == nil then
    time = os.time()
end

-- Håndjern keybind
RegisterServerEvent('handcuff:checkjob')
AddEventHandler('handcuff:checkjob', function()
	local source = source
    local user_id = vRP.getUserId({source})

    if vRP.hasPermission({user_id,"police.handcuff"}) then
		TriggerClientEvent('cuff', source)
    end
end)

RegisterServerEvent('handcuff:cuffHim')
AddEventHandler('handcuff:cuffHim', function()
	local source = source
	local user_id = vRP.getUserId({source})
	
    vRPclient.getNearestPlayer(source,{5.5},function(cplayer)
        if cplayer ~= nil and time + 3 < os.time() then
            vRPccuff.toggleHandcuff(cplayer,{})
            vRPccuff.cuffing(source,{})
            time = os.time()
            vRPccuff.isHandcuffed(cplayer,{}, function(handcuffed)
                print(handcuffed)
			    if handcuffed then
				    TriggerClientEvent("pNotify:SendNotification", source,{text = {"Personen blev sat i håndjern."}, type = "info", queue = "global", timeout = 3000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"handjern.ogg"},volume = 0.6,conditions = {"docVisible"}}}) 
                else
                    TriggerClientEvent("pNotify:SendNotification", source,{text = {"Personen fik løsnet sine håndjern."}, type = "info", queue = "global", timeout = 3000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"handjern.ogg"},volume = 0.6,conditions = {"docVisible"}}})  
                end
		    end)
	    else
		    TriggerClientEvent("pNotify:SendNotification", source,{text = {"Ingen spiller tæt på dig"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end
	end)
end)