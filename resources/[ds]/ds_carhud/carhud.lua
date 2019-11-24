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

--[[Citizen.CreateThread(function()
	while true do
	
		Citizen.Wait(1)
		
		if IsControlJustPressed( 0, 20 ) then
			if not isRadarExtended then
				SetRadarBigmapEnabled( true, false )
				isRadarExtended = true
				Citizen.CreateThread(function()
					run = true
					while run do
						for i = 0, 500 do
							Wait(1)
							if not isRadarExtended then
								run = false
								break
							end
						end
						SetRadarBigmapEnabled( false, false )
						isRadarExtended = false
					end
				end)
			else
				SetRadarBigmapEnabled( false, false )
				isRadarExtended = false
			end
		end
		local get_ped = GetPlayerPed(-1) -- current ped
		local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1),false) -- Current Vehicle ped is in
		local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not
		local veh_engine_health = GetVehicleEngineHealth(get_ped_veh) -- Vehicle Engine Damage 
		local veh_body_health = GetVehicleBodyHealth(get_ped_veh)
		local veh_burnout = IsVehicleInBurnout(get_ped_veh) -- Vehicle Burnout


		if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) and not isRadarExtended then
			local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			drawRct(0.015, 0.802, 0.141,0.022,0,0,0,100) 	-- UI:panel kmh	

			
			drawTxt(0.538, 1.293, 1.0,1.0,0.45, "~w~" .. math.ceil(kmh), 255, 255, 255, 255)  -- INT: kmh
			drawTxt(0.550, 1.293, 1.0,1.0,0.45, "~w~ KM/T", 255, 255, 255, 255)	-- TXT: kmh	
			
			if veh_stop then
				drawTxt(0.585, 1.293, 1.0,1.0,0.45, "~r~P", 255, 255, 255, 200)
			else
				drawTxt(0.585, 1.293, 1.0,1.0,0.45, "P", 255, 255, 255, 150)
			end
		end		
	end
end)--]]