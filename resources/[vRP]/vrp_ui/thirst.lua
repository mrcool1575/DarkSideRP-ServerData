function drawRct(x,y,width,height,r,g,b,a)
    DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)    
		TriggerServerEvent('vand')    
		print(vand)
        drawRct(0.085, 0.8,th/287, 0.015, 135, 220, 220, 200)   
	end
end)]]

local thirst, hunger = 0, 0

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(100)
        SendNUIMessage({
            show = IsPauseMenuActive(),
            thirst = thirst,
            hunger = hunger
			drawRct(0.8, 0.8,thirst/287, 0.300, 135, 220, 220, 200)   
        })
    end
end)

RegisterNetEvent("mad:update")
TriggerClientEvent("mad:update",source, data.hunger, data.thirst)
    hunger, thirst = rHunger, rThirst
end)