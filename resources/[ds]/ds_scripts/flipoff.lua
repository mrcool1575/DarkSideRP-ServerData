Citizen.CreateThread(function()
    local dict = "anim@mp_player_intincarfingerbodhi@ds@"
   	local ped = GetPlayerPed(-1)
	local sitting = IsPedSittingInAnyVehicle(ped)

	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local flipoff = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 244) and not IsPedInAnyVehicle(PlayerPedId(), true) then
            if not sitting then
                TaskPlayAnim(GetPlayerPed(-1), dict, "idle_a", 8.0, 8.0, -1, 50, 0, false, false, false)
				Citizen.Wait(2000)
				ClearPedSecondaryTask(GetPlayerPed(-1))
            end
			Citizen.Wait(1000)
        end
    end
end)
