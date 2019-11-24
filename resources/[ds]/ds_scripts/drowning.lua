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

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local get_ped = GetPlayerPed(-1) -- current ped

		SetPedMaxTimeUnderwater(GetPlayerPed(-1),25.0)
		if IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
			breath = GetPlayerUnderwaterTimeRemaining(PlayerId())
			breathrounded = math.floor(breath * 10) / 10
			if breathrounded <= 0 then
				drawTxt(0.6785,1.463,1.0,1.0,0.45,"~r~Du er ved at drukne!",255,255,255,255)
			else
				if breathrounded <= 6 then
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~r~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,240)
				elseif breathrounded > 6 and breathrounded < 12 then
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~y~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,240)
				else
					drawTxt(0.6785,1.463,1.0,1.0,0.45,"~w~"..breathrounded.. " sekunder tilbage under vandet",255,255,255,150)
				end
			end
		end
	end
end)

--[[

					Made by
  _______       _   _ ______ _____ ______ _____  
 |__   __|/\   | \ | |___  // ____|  ____|  __ \ 
    | |  /  \  |  \| |  / /| |    | |__  | |__) |
    | | / /\ \ | . ` | / / | |    |  __| |  _  / 
    | |/ ____ \| |\  |/ /__| |____| |____| | \ \ 
    |_/_/    \_\_| \_/_____|\_____|______|_|  \_\
	
				For ByHyperion.net
--]]
