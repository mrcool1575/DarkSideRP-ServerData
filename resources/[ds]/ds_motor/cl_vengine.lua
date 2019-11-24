local button = 303 -- 303 (U by default)
local button2 = 32 -- 32 (W by default)
local button3 = 33 -- 32 (S by default)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        
        if (IsControlJustReleased(0, button) or IsDisabledControlJustReleased(0, button)) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) and GetIsVehicleEngineRunning(vehicle) then
            toggleEngine()
			exports.pNotify:SendNotification({text = "Motor <b style='color: #DB4646'>slukket",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
			elseif (IsControlJustReleased(0, button) or IsDisabledControlJustReleased(0, button)) and not GetIsVehicleEngineRunning(vehicle) then
			exports.pNotify:SendNotification({text = "Motor <b style='color: #5DB6E5'>tændt</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
			toggleEngine()
		end
		
        if (IsControlJustPressed(0, button2) or IsDisabledControlJustReleased(0, button2) or IsControlJustPressed(0, button3) or IsDisabledControlJustReleased(0, button3)) and not GetIsVehicleEngineRunning(vehicle) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
            toggleEngine()
			exports.pNotify:SendNotification({text = "Motor <b style='color: #5DB6E5'>tændt</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, killer=true})
        end
        
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end
