local frozen = true
local unfrozen = false

RegisterNetEvent('vRPlf:Unfreeze')
AddEventHandler('vRPlf:Unfreeze', function()
	unfrozen = true
end)

Citizen.CreateThread(function()
	while true do
		if frozen then
			if unfrozen then
				SetEntityInvincible(GetPlayerPed(-1),false)
				SetEntityVisible(GetPlayerPed(-1),true)
				FreezeEntityPosition(GetPlayerPed(-1),false)
				DisableControlAction(0,56,false) -- disable F9
				frozen = false
			else
				SetEntityInvincible(GetPlayerPed(-1),true)
				SetEntityVisible(GetPlayerPed(-1),false)
				FreezeEntityPosition(GetPlayerPed(-1),true)
				DisableControlAction(0,56,true) -- disable F9
			end
		end
		Citizen.Wait(0)
	end
end)
