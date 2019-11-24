vehicleWashStation = {
	{25.557371139526,-1391.9454345703,28.467275238037},
	{167.63157653809,-1715.6552734375,28.301690826416},
	{-74.567901611328,6427.8715820313,30.466750411987},
	{-699.632512312313,-932.7043123123,18.013950411987},
	{2010.3566894531,3790.791015625,31.196670074463},
	{535.16717529297,-189.45094299316,53.939891815186}
}

vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100) -- 100 = carwash
		SetBlipAsShortRange(stationBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Bilvask")
		SetBlipScale(blip, 0.8)
		EndTextCommandSetBlipName(stationBlip)
	end
    return
end)

	function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
		SetTextFont(font)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextCentre(centre)
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x, y)
	end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
					drawTxt('Tryk [~g~E~s~] for at vaske dit køretøj', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
					if(IsControlJustReleased(1, 51)) then
						TriggerServerEvent('carwash:checkmoney', GetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false)))
					end
				end
			end
		end
	end
end)

RegisterNetEvent('carwash:success')
AddEventHandler('carwash:success', function()
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false), 0.0)
	SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1),false), false)
	TriggerEvent("pNotify:SendNotification",{
	text = "Du betalte <b style='color:#DB4646'>300 DKK</b>",
	type = "success",
	timeout = (3000),
	layout = "centerLeft",
	queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
	})
end)
RegisterNetEvent('carwash:notenough')
AddEventHandler('carwash:notenough', function()
	TriggerEvent("pNotify:SendNotification",{
	text = "Du har <b style='color:#DB4646'>ikke</b> råd",
	type = "error",
	timeout = (3000),
	layout = "centerLeft",
	queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
	})
end)
RegisterNetEvent('carwash:alreadyclean')
AddEventHandler('carwash:alreadyclean', function()
	TriggerEvent("pNotify:SendNotification",{
	text = "Dit køretøj er allerede <b style='color:#4E9350'>rent</b>",
	type = "success",
	timeout = (3000),
	layout = "centerLeft",
	queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
	})
end)