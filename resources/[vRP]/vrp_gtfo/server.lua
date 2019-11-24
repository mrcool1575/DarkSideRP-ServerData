--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3 - I love you XanderWP, love Hawk from Denmark <3
------------------------]]--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","doorsControl")

doorList = {
    [1] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [2] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [3] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [4] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [5] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [6] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [7] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [8] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [9] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [10] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [11] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [12] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [13] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [14] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [14] = {freeze = false, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
    [15] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[16] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[17] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[18] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[19] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[20] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[21] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[22] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[23] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},	
	[24] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[25] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[26] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[27] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[28] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[29] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[30] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[31] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[32] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[33] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[34] = {freeze = true, key = "key_HP", permission="ems.keycard", name = "Hospitalet"},
	[35] = {freeze = true, key = "key_SL", permission="", name = "Skummel lejlighed"}, 
	[36] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[37] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[38] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[39] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[40] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[41] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[42] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[43] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[44] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[45] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},		
	[46] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},		
	[47] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},		
	[48] = {freeze = true, key = "key_MIC", permission="la.keycard", name = "Michaels hus"},
	[49] = {freeze = true, key = "key_DC", permission="", name = "Denise Clintons hus"},
	[50] = {freeze = true, key = "key_FR", permission="", name = "Franklins hus"},
	[51] = {freeze = true, key = "key_LMC", permission="demon.keycard", name = "The Lost MC klubhus"},
	[52] = {freeze = true, key = "key_LES", permission="", name = "Lesters hus"},
	[53] = {freeze = true, key = "key_FL", permission="", name = "Floyds lejlighed"},
	[54] = {freeze = true, key = "key_TR", permission="", name = "Trevors trailer"},
	[55] = {freeze = true, key = "", permission="", name = "Permanent aflåst"},
	[56] = {freeze = true, key = "", permission="", name = "Permanent aflåst"},
	[57] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[58] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[59] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[60] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[61] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[62] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[63] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[64] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[65] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[66] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[67] = {freeze = true, key = "key_PD", permission="cop.keycard", name = "Politistationen"},
	[68] = {freeze = true, key = "key_RS", permission="advokat.keycard", name = "Retssalen"},
	[69] = {freeze = true, key = "key_RS", permission="advokat.keycard", name = "Retssalen"},
	[70] = {freeze = true, key = "key_RS", permission="advokat.keycard", name = "Retssalen"},
	[71] = {freeze = true, key = "key_RS", permission="advokat.keycard", name = "Retssalen"}
}

RegisterServerEvent('door:status')
AddEventHandler('door:status', function(id, status)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})
  if vRP.hasPermission({user_id, "#"..doorList[id].key..".>0"}) or vRP.hasPermission({user_id,doorList[id].permission}) then
    doorList[id].freeze=status
    TriggerClientEvent('door:statusSend', -1, id, status)
    if status then
	  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao1", 1)
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Døren blev <b style='color: #DB4646'>låst</b>.", type = "error", queue = "lmao1",timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    else
	  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao2", 1)
    TriggerClientEvent("pNotify:SendNotification", player,{text = "Døren blev <b style='color: #4E9350'>låst op</b>.", type = "success", queue = "lmao2",timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    end
  else

  TriggerClientEvent("pNotify:SetQueueMax", -1, "lmao", 1)
  TriggerClientEvent("pNotify:SendNotification", player,{text = "Du mangler nøglen til <b style='color: #FFC832'>"..doorList[id].name.."</b>.", type = "error", queue = "lmao",timeout = 1500, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})  
    end 
end)

RegisterServerEvent('door:load')
AddEventHandler('door:load', function(id, status)
  TriggerClientEvent('door:loadSend', -1, doorList) 
end)


local function doorSync() 
TriggerClientEvent('door:loadSend', -1, doorList) 
  SetTimeout(5000, doorSync)
end
doorSync()