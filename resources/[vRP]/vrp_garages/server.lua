MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

 -- Biler
local vehiclesList = {
	{name = "BMW 440i", costs = 2300000, description = {}, model = "440i"},
	{name = "BMW i8", costs = 7400000, description = {}, model = "i8"},
	{name = "BMW M2 F87", costs = 1900000, description = {}, model = "m2f22"},
	{name = "BMW M3 E92", costs = 2100000, description = {}, model = "e92"},
	{name = "BMW M5 Touring", costs = 2300000, description = {}, model = "16m5"},
	{name = "BMW M3 E30", costs = 400000, description = {}, model = "m3e30"},
	{name = "BMW M4 F82", costs = 3400000, description = {}, model = "m4f82"},
	{name = "BMW X5M", costs = 2500000, description = {}, model = "x5m2016"},
	{name = "BMW X6M F16", costs = 2700000, description = {}, model = "x6m"},
	{name = "BMX", costs = 6000, description = {}, model = "bmx"},
	{name = "Cruiser", costs = 9500, description = {}, model = "cruiser"},
	{name = "Fixter", costs = 6000, description = {}, model = "fixter"},
	{name = "Scorcher", costs = 9000, description = {}, model = "scorcher"},
	{name = "Tribike 1", costs = 14500, description = {}, model = "tribike"},
	{name = "Tribike 2", costs = 14500, description = {}, model = "tribike2"},
	{name = "Varevogn", costs = 100000, description = {}, model = "Youga"},
	{name = "Tribike 3", costs = 14500, description = {}, model = "tribike3"},
	{name = "Yamaha YZF R6", costs = 800000, description = {}, model = "r6"},
	{name = "KTM EXC F250", costs = 200000, description = {}, model = "exc250sm"},
	{name = "BMW 440i", costs = 2300000, description = {}, model = "440i"},
	{name = "BMW i8", costs = 7400000, description = {}, model = "i8"},
	{name = "BMW M2 F87", costs = 1900000, description = {}, model = "m2f22"},
	{name = "MCLaren 720s", costs = 10000000, description = {}, model = "720s"},
	{name = "BMW M3 E92", costs = 2100000, description = {}, model = "e92"},
	{name = "BMW M5 Touring", costs = 2300000, description = {}, model = "16m5"},
	{name = "BMW M3 E30", costs = 400000, description = {}, model = "m3e30"},
	{name = "BMW M4 F82", costs = 3400000, description = {}, model = "m4f82"},
	{name = "BMW X5M", costs = 2500000, description = {}, model = "x5m2016"},
	{name = "BMW X6M F16", costs = 2700000, description = {}, model = "x6m"},
	{name = "Ferrari 488 GTB", costs = 8200000, description = {}, model = "4881"},
	{name = "Ferrari LaFerrari", costs = 11000000, description = {}, model = "aperta"},
	{name = "Ferrari 812", costs = 7200000, description = {}, model = "f812"},
	{name = "Volvo S60", costs = 150000, description = {}, model = "s60pole"},
	{name = "VW Touran", costs = 300000, description = {}, model = "vwtouran"},
	{name = "Ford Focus", costs = 600000, description = {}, model = "st"},
	{name = "Suzuki Swift", costs = 30000, description = {}, model = "suzuswift"},
	{name = "Citroën C4", costs = 50000, description = {}, model = "citroc4"},
	{name = "Peugeot 108", costs = 50000, description = {}, model = "peug108"},
	--{name = "Peugeot 207", costs = 20000, description = {}, model = "p207"},
	{name = "Kia Stinger", costs = 650000, description = {}, model = "kiagt"},
	{name = "Honda Civic SI99", costs = 100000, description = {}, model = "civic"},
	{name = "Hyundai Santa Fe", costs = 350000, description = {}, model = "santafe"},
	{name = "Porsche 911 GT3 RS", costs = 4500000, description = {}, model = "911gtrs"},
	{name = "Porsche 718 Boxster S", costs = 3700000, description = {}, model = "718boxster"},
	{name = "Porsche Cayenne Turbo S", costs = 4200000, description = {}, model = "cayenne"},
	{name = "Porsche Macan Turbo", costs = 3400000, description = {}, model = "macan"},
	{name = "Porsche Panamera Turbo", costs = 7600000, description = {}, model = "panamera17turbo"},
	{name = "Ford Mustang GT", costs = 1900000, description = {}, model = "mgt"},
	{name = "Jaguar F Pace", costs = 5200000, description = {}, model = "fpace"},
	{name = "Chevrolet Camaro", costs = 4200000, description = {}, model = "zl12017"},
	{name = "Dodge Charger SXT", costs = 4000000, description = {}, model = "16charger"},
	{name = "Dodge Challenger Demon", costs = 4600000, description = {}, model = "demon"},
	{name = "Bentley Bentayga Lumma", costs = 4500000, description = {}, model = "urus"},
	{name = "GMC Yukon Denali", costs = 2000000, description = {}, model = "gmcyd"},
	{name = "Chevrolet Corvette", costs = 2900000, description = {}, model = "c7"},
	{name = "Nissan Titan", costs = 1500000, description = {}, model = "titan17"},
	{name = "Nissan GTR", costs = 5200000, description = {}, model = "gtr"},
	{name = "MCLaren", costs = 16300000, description = {}, model = "p1"},
	{name = "Lamborghini Huracan LP610", costs = 5300000, description = {}, model = "hurper"},
	{name = "Lamborghini Centenario", costs = 7500000, description = {}, model = "lp770"},
	{name = "Lamborghini Aventador", costs = 7500000, description = {}, model = "sv"},
	{name = "Maserati Quattro Porte", costs = 4000000, description = {}, model = "mqgts"},
	{name = "Rolls-Royce Wraith", costs = 5300000, description = {}, model = "wraith"},
	{name = "Mercedes A45 AMG", costs = 700000, description = {}, model = "a45amg"},
	{name = "Mercedes CLA45 AMG", costs = 1600000, description = {}, model = "cla45sb"},
	{name = "Mercedes C63s AMG", costs = 2300000, description = {}, model = "c63s"},
	{name = "Mercedes E63s", costs = 2600000, description = {}, model = "e63w213"},
	--{name = "Mercedes E63 AMG", costs = 2700000, description = {}, model = "e63amg"},
	{name = "Mercedes S65 AMG", costs = 2000000, description = {}, model = "S65"},
	{name = "Mercedes S500", costs = 1800000, description = {}, model = "s500w222"},
	{name = "Mercedes Brabus", costs = 3200000, description = {}, model = "mlbrabus"},
	{name = "Mercedes GL63", costs = 1800000, description = {}, model = "gl63"},
	{name = "Mercedes-Benz G65 AMG", costs = 1500000, description = {}, model = "g65amg"},
	{name = "Audi RS6 C7", costs = 4700000, description = {}, model = "rs6"},
	{name = "Audi RS5", costs = 3700000, description = {}, model = "rs5"},
	{name = "Audi S4", costs = 2700000, description = {}, model = "s4avant"},
	{name = "Audi RS4", costs = 2700000, description = {}, model = "rs4avant"},
	{name = "Audi S8", costs = 2300000, description = {}, model = "audis8om"},
	{name = "Audi SQ7", costs = 2000000, description = {}, model = "sq72016"},
	{name = "Audi RS3", costs = 2700000, description = {}, model = "rs318"},
	{name = "Randers knallert", costs = 60000, description = {}, model = "faggio"},
	{name = "Baller LE LWB", costs = 1850000, description = {}, model = "baller4"},
	{name = "Dominator GTX", costs = 2500000, description = {}, model = "dominator3"},
	{name = "Maserati Ghibli S", costs = 7500000, description = {}, model = "ghibli"}
}

-- PAYBACK IN PERCENTAGE
local percentagePayback = 50

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_garages")
vRPgc = Tunnel.getInterface("vRP_garages","vRP_garages")

--SQL--
MySQL.createCommand("vRP/ply_get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
MySQL.createCommand("vRP/ply_remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/ply_sell_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")


-- PLY_GARAGES
RegisterServerEvent('ply_garages:CheckForAptGarages')
AddEventHandler('ply_garages:CheckForAptGarages', function()
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	vRP.getUserAddress({user_id, function(address)
      if address then
		if address.home == "Villa (5 Mil)" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -751.5107421875,365.883117675781,86.9666687011719,267.344543457031)
		elseif address.home == "Basis hus 1 (1 Mil)" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -635.4501953125,57.4368324279785,43.0,88.8649536132813)
		elseif address.home == "Basis hus 2 (1 Mil)" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -1477.7786865234,-503.66763305664,32.406842803955,29.5690689086914)
		elseif address.home == "Regular House 1" then
			TriggerClientEvent("ply_garages:addAptGarage", player, 843.398803710938,-191.063568115234,71.6714935302734,339.229705810547)
		elseif address.home == "Villa Wild Oats Dr. (10 Mil)" then
			TriggerClientEvent("ply_garages:addAptGarage", player, 174.276748657227,483.056274414063,141.339096069336,357.040771484375)
		elseif address.home == "Regular House 3" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -820.590148925781,184.175857543945,71.0921401977539,131.889053344727)
		elseif address.home == "Regular House 4" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -1858.14965820313,328.570861816406,87.6500091552734,8.03947734832764)
		elseif address.home == "Regular House 5" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -25.002462387085,-1436.29431152344,29.6531391143799,89.9820022583008)
		elseif address.home == "Hawks Ale" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -81.860595703125,-809.427734375,35.4030570983887,350.814697265625)
		elseif address.home == "Midtown Lejlighed 3" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -286.63983154297,-914.98571777344,31.080615997314,342.87274169922)
		elseif address.home == "Midtown Lejlighed 6" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -820.92724609375,-383.39880371094,38.013271331787,27.119449615479)
		elseif address.home == "Midtown Lejlighed 7" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -820.92724609375,-383.39880371094,38.013271331787,27.119449615479)
		elseif address.home == "Midtown Lejlighed 8" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -820.92724609375,-383.39880371094,38.013271331787,27.119449615479)
		elseif address.home == "Midtown Lejlighed 9" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -820.92724609375,-383.39880371094,38.013271331787,27.119449615479)
		elseif address.home == "Midtown Lejlighed 10" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -828.84326171875,-437.74356079102,36.639904022217,70.669303894043)
		elseif address.home == "Regular House 6" then
			TriggerClientEvent("ply_garages:addAptGarage", player, -2587,1930.97326660156,166.304656982422,93.3231887817383)
		end
      end
	end})
end)

RegisterServerEvent('ply_garages:CheckForSpawnVeh')
AddEventHandler('ply_garages:CheckForSpawnVeh', function(vehicle)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	MySQL.query("vRP/ls_customs", {user_id = user_id, vehicle = vehicle}, function(result, affected)
	  vRP.closeMenu({player})
      vRPgc.spawnGarageVehicle(player,{result[1].veh_type,vehicle,result[1].vehicle_plate, result[1].vehicle_colorprimary, result[1].vehicle_colorsecondary, result[1].vehicle_pearlescentcolor, result[1].vehicle_wheelcolor, result[1].vehicle_plateindex, result[1].vehicle_neoncolor1, result[1].vehicle_neoncolor2, result[1].vehicle_neoncolor3, result[1].vehicle_windowtint, result[1].vehicle_wheeltype, result[1].vehicle_mods0, result[1].vehicle_mods1, result[1].vehicle_mods2, result[1].vehicle_mods3, result[1].vehicle_mods4, result[1].vehicle_mods5, result[1].vehicle_mods6, result[1].vehicle_mods7, result[1].vehicle_mods8, result[1].vehicle_mods9, result[1].vehicle_mods10, result[1].vehicle_mods11, result[1].vehicle_mods12, result[1].vehicle_mods13, result[1].vehicle_mods14, result[1].vehicle_mods15, result[1].vehicle_mods16, result[1].vehicle_turbo, result[1].vehicle_tiresmoke, result[1].vehicle_xenon, result[1].vehicle_mods23, result[1].vehicle_mods24, result[1].vehicle_neon0, result[1].vehicle_neon1, result[1].vehicle_neon2, result[1].vehicle_neon3, result[1].vehicle_bulletproof, result[1].vehicle_smokecolor1, result[1].vehicle_smokecolor2, result[1].vehicle_smokecolor3, result[1].vehicle_modvariation})
	end)
end)

RegisterServerEvent('ply_garages:SellVehicleClient')
AddEventHandler('ply_garages:SellVehicleClient', function(vehicle)
			local user_id = vRP.getUserId({source})
			local player = vRP.getUserSource({user_id})
				MySQL.query("vRP/ply_sell_vehicle", {user_id = user_id, vehicle = vehicle}, function(result, affected)
				vRP.closeMenu({player})
				for k,v in pairs(vehiclesList) do
				if v.model == vehicle then
				local moneyFromCar = (v.costs / 100 * percentagePayback)
				vRP.giveBankMoney({user_id, moneyFromCar})
                TriggerClientEvent("pNotify:SendNotification", player,{text = "Du modtog <b style='color: #5DB6E5'>" ..math.ceil(moneyFromCar).. "<b style='color: #fff'> Dkk for at have solgt din bil", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			end
		end
	  
	end)
end)

RegisterServerEvent('ply_garages:CheckForVeh')
AddEventHandler('ply_garages:CheckForVeh', function(plate,vehicle,vtype)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/lsc_get_vehicle", {user_id = user_id, vehicle = vehicle, plate = plate}, function(rows, affected)
    if #rows > 0 then -- has vehicle
      vRPgc.despawnGarageVehicle(player,{vtype,5})
	else
	TriggerClientEvent("pNotify:SendNotification", player,{text = "Intet køretøj i nærheden", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
  end)
end)


RegisterServerEvent('ply_garages:CheckGarageForVeh')
AddEventHandler("ply_garages:CheckGarageForVeh", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    MySQL.query("vRP/ply_get_vehicles", {user_id = user_id}, function(pvehicles, affected)
      local vehicles = {}
      for k,v in ipairs(pvehicles) do
		if v.veh_type == "car" or v.veh_type == "bike" or v.veh_type == "citybike" then
		  table.insert(vehicles, {["vehicle_model"] = v.vehicle, ["vehicle_name"] = v.vehicle_name})
		end
      end
      TriggerClientEvent("ply_garages:getVehicles", player, vehicles) 
	end)
end)

function updateGarage(user_id)
    local player = vRP.getUserSource({user_id})
    MySQL.query("vRP/ply_get_vehicles", {user_id = user_id}, function(pvehicles, affected)
        local vehicles = {}
        for k,v in ipairs(pvehicles) do
            if v.veh_type == "car" or v.veh_type == "bike" then
                table.insert(vehicles, {["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle})
            end
        end
        TriggerClientEvent("ply_garages:getVehicles", player, vehicles)
    end)
end