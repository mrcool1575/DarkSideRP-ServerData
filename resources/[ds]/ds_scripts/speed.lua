--[[------------------------------------------------------------------------

	Radar/ALPR 
	Created by Brock =]
	Edited by Chip W. Gaming
	Uses Y to turn on
    Uses E to freeze
	
	To change either key, edit lines 44 and 57

------------------------------------------------------------------------]]--

local radar =
{
	shown = false,
	freeze = false,
	info = "~y~Indlæser fartmåler... ",
	info2 = "~y~Indlæser fartmåler... ",
	minSpeed = 5.0,
	maxSpeed = 75.0,
}
--local distanceToCheckFront = 50

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

-- VINTAGEPISTOL ONLY
weaponblacklist = {
		"WEAPON_VINTAGEPISTOL"
}



Citizen.CreateThread( function()
	
	while true do
		Wait(0)

		playerPed = GetPlayerPed(-1)
		if playerPed then 
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)
		
		
		if isWeaponBlacklisted(weapon) and IsControlJustPressed(1, 168) then --168 = F7
			
			if radar.shown then
			
				radar.shown = false 
				radar.info = string.format("~y~Indlæser fartmåler... ")
				radar.info2 = string.format("~y~Indlæser fartmåler... ")
			else 
				radar.shown = true
			end		
                Wait(75)
			
		end

		playerPed = GetPlayerPed(-1)
		if playerPed then 
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)	
		
	
		if isWeaponBlacklisted(weapon) and IsControlJustPressed(1, 38) then --38 = E
		
			if radar.freeze then radar.freeze = false else radar.freeze = true end
	
		end
		if radar.shown  then
			if radar.freeze == false then
					local player = GetPlayerPed(-1)
					local coordA = GetOffsetFromEntityInWorldCoords(player, 0.0, 1.0, 1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(player, 0.0, 105.0, 0.0)
					local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, player, 500)
					local a, b, c, d, e = GetShapeTestResult(frontcar)
					
					if IsEntityAVehicle(e) then
						
						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
						local fvspeed = GetEntitySpeed(e)*3.6
						local fplate = GetVehicleNumberPlateText(e)
						radar.info = string.format("~y~Nummerplade: ~w~%s  ~y~Model: ~w~%s  ~y~Hastighed: ~w~%s Km/h", fplate, fmodel, math.ceil(fvspeed))
					end
					
			end
			
			DrawRect(0.508, 0.94, 0.236, 0.076, 0, 0, 0, 150)
			DrawAdvancedText(0.603, 0.923, 0.005, 0.0028, 0.4, "Fartmåler", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.6, 0.956, 0.009, 0.0028, 0.4, radar.info, 255, 255, 255, 255, 6, 0)

			
			end
						
		end
	
	end
	end
	
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end
