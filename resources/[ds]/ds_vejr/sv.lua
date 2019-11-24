
local timer = 10

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
			if(timer > 0)then
				timer = timer - 1
			elseif timer == 0 then
				changeWeather()
			
		end
	end
end)


function changeWeather()
    Weather = math.random(1,4)
	timer = 10
		if Weather == 1 then
		CurrentWeather = "EXTRASUNNY"
		TriggerClientEvent('Weather:updateWeather', -1, CurrentWeather, blackout)
		end
		if Weather == 2 then
		CurrentWeather = "CLEAR"
		TriggerClientEvent('Weather:updateWeather', -1, CurrentWeather, blackout)
		end
		if Weather == 3 then
		CurrentWeather = "SMOG"
		TriggerClientEvent('Weather:updateWeather', -1, CurrentWeather, blackout)
		end
		if Weather == 4 then
		CurrentWeather = "OVERCAST"
		TriggerClientEvent('Weather:updateWeather', -1, CurrentWeather, blackout)
		end
end

local timer2 = 0


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
			if(timer2 > 0)then
				timer2 = timer2 - 1
			elseif timer2 == 0 then
				setClock()
			
		end
	end
end)



function setClock()
	timer2 = 48
		TriggerClientEvent('Weather:updateClock', -1)
end