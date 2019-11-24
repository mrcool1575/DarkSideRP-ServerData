-- Original creator https://forum.fivem.net/t/release-simple-enters-exits-system-updated-v-0-2/9968


-- The array that will be filled with the server data
-- If you want, you can put your array in this file. It should works fine.
local interiors = {}

distance = 50.5999 -- distance to draw
timer = 0
current_int = 0


-- Sending a request to get the data
AddEventHandler("playerSpawned", function()
  TriggerServerEvent("interiors:sendData_s")
end)

-- Active this when you restart resource. If you don't want to close the server
-- TriggerServerEvent("interiors:sendData_s")

-- Receiving the data ...  
RegisterNetEvent("interiors:f_sendData")
AddEventHandler("interiors:f_sendData", function(t1)
	-- Tyler1 my boy
  interiors = t1
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

-- Tick tick tick
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i=1, #interiors do
			if not IsEntityDead(PlayerPedId()) then
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < distance then
					DrawMarker(27,interiors[i].xe,interiors[i].ye,interiors[i].ze-0.9, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.399 then
						current_int = i
						drawTxt("[~g~E~s~] for at gå ind i "..interiors[current_int].name, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
						if (IsControlJustReleased(1, 38)) then
							if timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), interiors[i].xo,interiors[i].yo,interiors[i].zo)
								SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
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
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < distance then
					DrawMarker(27,interiors[i].xo,interiors[i].yo,interiors[i].zo-0.9, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
						current_int = i
						drawTxt("[~g~E~s~] for at gå ud fra "..interiors[current_int].name, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
						if (IsControlJustReleased(1, 38)) then
							if timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), interiors[i].xe,interiors[i].ye,interiors[i].ze)
								SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
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
