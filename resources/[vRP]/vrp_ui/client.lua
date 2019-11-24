local isRadarExtended = false

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
	while true do
	
		Citizen.Wait(1)
		
		local get_ped = GetPlayerPed(-1) -- current ped
		local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1),false) -- Current Vehicle ped is in
		local plate_veh = GetVehicleNumberPlateText(get_ped_veh) -- Vehicle Plate
		local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not
		local veh_engine_health = GetVehicleEngineHealth(get_ped_veh) -- Vehicle Engine Damage 
		local veh_body_health = GetVehicleBodyHealth(get_ped_veh)
		local veh_burnout = IsVehicleInBurnout(get_ped_veh) -- Vehicle Burnout

			drawRct(0.0135, 0.968, 0.144,0.030,0,0,0,0)
			if (IsPedInAnyVehicle(get_ped, false)) and not isRadarExtended then
				local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
				drawRct(0.015, 0.802, 0.141,0.022,0,0,0,100) 	-- UI:panel kmh	
				drawTxt(0.569, 1.293, 1.0,1.0,0.45, "~w~" .. plate_veh, 255, 255, 255, 255) -- TXT: Plate	
				drawTxt(0.530, 1.293, 1.0,1.0,0.45, "~w~ KM/T", 255, 255, 255, 255)	-- TXT: kmh
				if kmh < 130 then
				drawTxt(0.518, 1.293, 1.0,1.0,0.45, "~w~" .. math.ceil(kmh), 255, 255, 255, 255)  -- INT: kmh
				elseif kmh > 130 and kmh <= 250 then
					drawTxt(0.518, 1.293, 1.0,1.0,0.45, "~y~" .. math.ceil(kmh), 255, 255, 255, 255)  -- INT: kmh
				elseif kmh > 250 and kmh <= 540 then
					drawTxt(0.518, 1.293, 1.0,1.0,0.45, "~r~" .. math.ceil(kmh), 255, 255, 255, 255)  -- INT: kmh
			
				if veh_stop then
					drawTxt(0.613, 1.293, 1.0,1.0,0.45, "", 255, 255, 255, 200)
				else
					drawTxt(0.613, 1.293, 1.0,1.0,0.45, "", 255, 255, 255, 150)
		 		end
			end
		end		
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)