--###################
--######NORADAR######
--###################
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)		
		if IsPedInAnyVehicle(playerPed, true) then
			DisplayRadar(true)
		else
			DisplayRadar(false)
		end
    end
end)