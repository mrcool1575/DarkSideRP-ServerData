Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		local ped = GetPlayerPed(-1)
		local vintagepistol = GetHashKey("WEAPON_VINTAGEPISTOL")
		local weapon = GetSelectedPedWeapon(ped)
		
		if weapon == vintagepistol then
			DisablePlayerFiring(ped, false) -- Disable weapon firing
			DisableControlAction(0, 45, true) -- reload
			DisableControlAction(0, 91, true) -- vehicle aim
			DisableControlAction(0, 92, true) -- vehicle aim
		end
	end
end)
