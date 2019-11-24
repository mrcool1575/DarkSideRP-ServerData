local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_robbery")

local banks = cfg.banks
local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

AddEventHandler("playerDropped", function()
	if(robbers[source])then
		local bossepis = robbers[source]
		local homoseksuelt = banks[bossepis].nameofbank
		TriggerClientEvent('vrp_robbery:han:kan:ikke:fucking:rp', source)
		robbers[source] = nil
		TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. homoseksuelt, type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_robbery:toofar')
AddEventHandler('vrp_robbery:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('vrp_robbery:toofarlocal', source)
		robbers[source] = nil
		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. banks[robb].nameofbank, type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_robbery:playerdied')
AddEventHandler('vrp_robbery:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('vrp_robbery:playerdiedlocal', source)
		robbers[source] = nil
		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. banks[robb].nameofbank, type = "info", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_robbery:rob')
AddEventHandler('vrp_robbery:rob', function(robb)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local cops = vRP.getUsersByPermission({cfg.permission})
  if vRP.hasPermission({user_id,cfg.permission}) then
	TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kan ikke røve butikken som betjent.", type = "error", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
  else
    if #cops >= cfg.cops then
	  if banks[robb] then
		  local bank = banks[robb]

		  if (os.time() - bank.lastrobbed) < cfg.seconds+cfg.cooldown and bank.lastrobbed ~= 0 then
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Vent venligt: "..(cfg.seconds+cfg.cooldown - (os.time() - bank.lastrobbed)).." sekunder.", type = "error", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			  return
		  end
		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Bankrøveri ved "..bank.nameofbank.."!", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent("pNotify:SendNotification", source,{text = "Du startede et røveri, forlad ikke banken!", type = "warning", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent("pNotify:SendNotification", source,{text = "Hold banken i 5 minutter og pengene er dine!", type = "info", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent('vrp_robbery:currentlyrobbing', player, robb)
		  banks[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(cfg.seconds*1000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
					  vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
					  TriggerClientEvent("pNotify:SendNotification", -1,{text = "<br>Røveri ved "..bank.nameofbank.." blev afsluttet, røverne slap væk med ca. "..bank.reward.." i kontanter</br>", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					  TriggerClientEvent('vrp_robbery:robberycomplete', savedSource, bank.reward)
				  end
			  end
		  end)		
	  end
    else
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Der skal være <b>" ..cfg.cops.."</b> betjente på, for at røve banken", type = "info", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
  end
end)