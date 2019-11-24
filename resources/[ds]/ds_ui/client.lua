function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', 'DarkSideRP - https://discord.gg/AXNyPj9')
end)

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

local beltOn = false

local frontwindowup = true
RegisterNetEvent("RollWindowFront")
AddEventHandler('RollWindowFront', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
		if (GetPedInVehicleSeat( playerCar,-1) == playerPed) then 		
			if (frontwindowup) then
				RollDownWindow(playerCar,0)
				RollDownWindow(playerCar,1)
				frontwindowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				frontwindowup = true
			end
		end
	end
end)
local backwindowup = true
RegisterNetEvent("RollWindowBack")
AddEventHandler('RollWindowBack', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
		if (GetPedInVehicleSeat(playerCar,-1) == playerPed) then 		
			if (backwindowup) then
				RollDownWindow(playerCar,2)
				RollDownWindow(playerCar,3)
				backwindowup = false
			else
				RollUpWindow(playerCar, 2)
				RollUpWindow(playerCar, 3)
				backwindowup = true
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
        if IsControlJustPressed(0,10) then
            TriggerEvent('RollWindowFront')
        elseif IsControlJustPressed(0,11) then
            TriggerEvent('RollWindowBack')
        end
        Citizen.Wait(10)
    end
end)