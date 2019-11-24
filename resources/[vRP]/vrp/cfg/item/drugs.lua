local items = {}

local function play_drink(player)
	local seq = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}
	vRPclient.playAnim(player,{true,seq,false})
end

local pills_choices = {}
pills_choices["> Tag"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"pills",1) then
			vRPclient.varyHealth(player,{5})
			TriggerClientEvent("pNotify:SetQueueMax", player, 8, 2)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Tager piller", type = "success", queue = "8", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			play_drink(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_smoke(player)
	local seq2 = {
		{"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
		{"mp_player_int_uppersmoke","mp_player_int_smoke",1},
		{"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
	}
	vRPclient.playAnim(player,{true,seq2,false})
end

local smoke_choices = {}
smoke_choices["> Ryg"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"hash",1) then
			vRP.varyHunger(user_id,(20))
			TriggerClientEvent("pNotify:SetQueueMax", player, 9, 2)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Ryger en joint", type = "success", queue = "9", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.playScreenEffect(player,{"DrugsMichaelAliensFight", 180})
			play_smoke(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_smell(player)
	local seq3 = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}
	vRPclient.playAnim(player,{true,seq3,false})
end

local smell_choices = {}
smell_choices["> Snif"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"cocaine",1) then
			vRP.varyThirst(user_id,(20))
			TriggerClientEvent("pNotify:SetQueueMax", player, 10, 2)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Sniffer kokain", type = "success", queue = "10", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.playScreenEffect(player,{"ChopVision", 300})
			play_smell(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_lsd(player)
	local seq4 = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}
  vRPclient.playAnim(player,{true,seq4,false})
end

local lsd_choices = {}
lsd_choices["> Tag"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"lsd",1) then
			vRP.varyThirst(user_id,(20))
			TriggerClientEvent("pNotify:SetQueueMax", player, 11, 2)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Slikker på et frimærke", type = "success", queue = "11", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.playScreenEffect(player,{"DrugsTrevorClownsFight", 600})
			play_lsd(player)
			vRP.closeMenu(player)
		end
	end
end}




local dykkerdragt_choices = {}
dykkerdragt_choices["> Tag på"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		
		if vRP.tryGetInventoryItem(user_id,"dykkerdragt",1) then
		
			TriggerClientEvent("pNotify:SendNotification",{text = "Du tog dykkergrejet på.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
			
        TriggerClientEvent("hp:dykkerdragt", source)
			
			vRP.closeMenu(player)
		end
	end
end}



items["pills"] = {"Panodil","Smertestillende piller.",function(args) return pills_choices end,0.10}
items["hash"] = {"Joint","En joint.",function(args) return smoke_choices end,0.60}
items["cocaine"] = {"Kokain","En pose kokain.",function(args) return smell_choices end,0.30}
items["lsd"] = {"LSD","Et frimærke med LSD.",function(args) return lsd_choices end,0.60}
items["dykkerdragt"] = {"Dykkerdragt","Tag denne dragt på, og nyd havets natur. Bestående af: Komplet dykkerdragt, dykkerbriller, svømmefødder og ilttank. OBS. DETTE KAN KUN BRUGES I VANDET (MAN KAN IKKE GEMME DET)!",function(args) return dykkerdragt_choices end,70.00}
items["0day"] = {"ATM 0day Exploit","Kan få hæveautomater til at spytte penge ud.",nil,0.10}

return items