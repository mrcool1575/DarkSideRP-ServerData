-- Original creator https://forum.fivem.net/t/release-simple-enters-exits-system-updated-v-0-2/9968


-- The array that will be filled with the server data
-- If you want, you can put your array in this file. It should works fine.
local jailvisits = {
	
}

distance = 50.5999 -- distance to draw
timer = 0
current_int = 0


-- Sending a request to get the data
AddEventHandler("playerSpawned", function()
  TriggerServerEvent("jailvisits:sendData_s")
end)

-- Active this when you restart resource. If you don't want to close the server
-- TriggerServerEvent("jailvisits:sendData_s")

-- Receiving the data ...  
RegisterNetEvent("jailvisits:f_sendData")
AddEventHandler("jailvisits:f_sendData", function(t1)
	-- Tyler1 my boy
  jailvisits = t1
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

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 1) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 38)
			DisableControlAction(0,21,true)
		end
	end
end)
-- Tick tick tick
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i=1, #jailvisits do
			if not IsEntityDead(PlayerPedId()) then
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jailvisits[i].xe,jailvisits[i].ye,jailvisits[i].ze, true) < distance then
					DrawMarker(27,jailvisits[i].xe,jailvisits[i].ye,jailvisits[i].ze-0.9, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jailvisits[i].xe,jailvisits[i].ye,jailvisits[i].ze, true) < 1.599 then
						current_int = i
						drawTxt("[~g~E~s~] for at gå ind i "..jailvisits[current_int].name, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                           
                            
						if (IsControlJustReleased(1, 38)) then
                                if IsEntityPlayingAnim(GetPlayerPed(-1), "random@arrests@busted", "idle_a", 3) then
                                    ---stop
                                    elseif timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), jailvisits[i].xo,jailvisits[i].yo,jailvisits[i].zo)
								SetEntityHeading(GetPlayerPed(-1), jailvisits[i].ho)
								NetworkFadeInEntity(GetPlayerPed(-1), 0)
								Wait(1000)
								timer = 5
								SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
								DoScreenFadeIn(1000)
								while IsScreenFadingIn() do Citizen.Wait(0)	end
							end
						end
					end
				end
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jailvisits[i].xo,jailvisits[i].yo,jailvisits[i].zo, true) < distance then
					DrawMarker(27,jailvisits[i].xo,jailvisits[i].yo,jailvisits[i].zo-0.9, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jailvisits[i].xo,jailvisits[i].yo,jailvisits[i].zo, true) < 1.599 then
						current_int = i
						drawTxt("[~g~E~s~] for at gå ud fra "..jailvisits[current_int].name, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
						if (IsControlJustReleased(1, 38)) then
							if timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), jailvisits[i].xe,jailvisits[i].ye,jailvisits[i].ze)
								SetEntityHeading(GetPlayerPed(-1), jailvisits[i].ho)
								NetworkFadeInEntity(GetPlayerPed(-1), 0)
								Wait(1000)
								timer = 5
								SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
								DoScreenFadeIn(1000)
								while IsScreenFadingIn() do Citizen.Wait(0)	end
							end
						end
					end
				end
			end
		end
	end
end)

-- Sick timer by the creator of the original script.
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		if timer > 0 then
			timer=timer-1
			if timer == 0 then current_int = 0 end
		end
	end
end)
