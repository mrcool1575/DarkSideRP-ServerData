RegisterNetEvent('hp:deletevehicle')
local distanceToCheck = 5.0

local garages = {
  {name="Garage", colour=3, id=357, marker=27, x=215.124, y=-791.377, z=29.946, h=0.0, hidden=false}, -- Centrum P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-334.685, y=289.773, z=84.905, h=0.0, hidden=false}, -- Tequilala ved P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-55.272, y=-1838.71, z=25.638, h=0.0, hidden=false}, -- Gang P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=126.434, y=6610.04, z=30.880, h=0.0, hidden=false}, -- Paleto Bay P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-2035.372, y=-470.555, z=10.466, h=0.0, hidden=false}, -- Strand P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-976.59875488281, y=-2702.88671875, z=12.9, h=0.0, hidden=false}, -- Lufthavn
  {name="Garage", colour=3, id=357, marker=27, x=291.60162353516, y=-336.40170288086, z=44.219876098633, h=0.0, hidden=false}, -- Retssal-garage
  {name="Garage", colour=3, id=357, marker=27, x=2006.6551, y=3055.0170, z=46.1497, h=0.0, hidden=false}, --Yellow Jack P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=-1063.9470214844, y=-1419.7119140625, z=4.545440788269, h=0.0, hidden=false}, --Vestlig P-Plads
  {name="Garage", colour=3, id=357, marker=27, x=436.12869262695, y=-1021.3997192383, z=27.8041456604, h=0.0, hidden=true}, -- Garage PD
  {name="Garage", colour=3, id=357, marker=27, x=-463.47357177734, y=6037.0473632813, z=30.340528488159, h=0.0, hidden=true}, -- Paleto PD
  {name="Garage", colour=3, id=357, marker=27, x=460.80130004883, y=-1157.5744628906, z=28.291790008545, h=0.0, hidden=true}, -- P-Plads ved Politistation
  {name="Garage", colour=3, id=357, marker=27, x=1189.2893066406, y=-3230.6276855469, z=5.0287690162659, h=0.0, hidden=true}, -- Lastbiljob
  {name="Garage", colour=3, id=357, marker=27, x=2661.7719726563, y=2848.2077636719, z=38.47466583252, h=0.0, hidden=true}, -- P-Plads ved minearbejder
  {name="Garage", colour=3, id=357, marker=27, x=-796.51721191406, y=303.63195800781, z=84.800401306152, h=0.0, hidden=true}, -- P-Plads Penthouse lejligheder
  {name="Garage", colour=3, id=357, marker=27, x=180.84309387207, y=2821.6760253906, z=43.489575958252, h=0.0, hidden=true}, -- P-Plads et sted i Sandyshores.
  {name="Garage", colour=3, id=357, marker=27, x=460.60110473633, y=-577.65887451172, z=27.500807357788, h=0.0, hidden=true}, -- Mekaniker garage
  {name="Garage", colour=3, id=357, marker=27, x=1137.5103759766, y=-1606.0947265625, z=33.692562103271, h=0.0, hidden=true},  -- Ambulance garage
  {name="Garage", colour=3, id=357, marker=27, x=-51.73738861084, y=-1110.3823242188, z=25.572351837158, h=0.0, hidden=true}, -- Bilbutik garage
  {name="Garage", colour=3, id=357, marker=27, x=-456.49612426758, y=-1698.6625976563, z=18.100004592896, h=0.0, hidden=true}, -- Skraldemandsjob
  {name="Garage", colour=3, id=357, marker=27, x=902.69830322266, y=-184.05155944824, z=73.05, h=0.0, hidden=true}, -- Taxa job
  {name="Garage", colour=3, id=357, marker=27,  x=-576.91052246094, y=5250.8061523438,  z=69.46715087891, h=0.0, hidden=true}, -- Træhugger job
  {name="Garage", colour=3, id=357, marker=27, x=1862.4067382813, y=2567.0131835938, z=44.7, h=0.0, hidden=true}, -- Fængsel
  {name="Garage", colour=3, id=357, marker=27,  x=1866.0242919922, y=3698.72265625,  z=32.68, h=0.0, hidden=true}, -- PD i Sandy Shores
  {name="Garage", colour=3, id=357, marker=27,  x=-1767.4169921875, y=-1151.4920654297,  z=12.270, h=0.0, hidden=true}, -- Civil båd/tivoli 
  {name="Garage", colour=3, id=357, marker=27,  x=977.68688964844, y=-3002.0490722656,  z=-40.603710174561, h=0.0, hidden=true}, -- Mekaniker garage
  {name="Garage", colour=3, id=357, marker=27,  x=611.44940185547, y=-2778.1608886719,  z=5.156, h=0.0, hidden=true}, -- Fisker job
  {name="Garage", colour=3, id=357, marker=27,  x=328.68539428711, y=-1471.995727539,  z=28.8124168396, h=0.0, hidden=true}, -- Hospitals garage
}

AddEventHandler('hp:deletevehicle',function()
    local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)
        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped,false)
            if (GetPedInVehicleSeat(vehicle,-1) == ped) then 
                SetEntityAsMissionEntity(vehicle,true,true)
                deleteCar(vehicle)
                if (DoesEntityExist(vehicle)) then 
					TriggerEvent("pNotify:SendNotification",{text = "Kunne ikke slette bilen, prøv igen",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Køretøj slettet",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
                end 
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Du skal være i føresædet",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
            end 
        else
            local playerPos = GetEntityCoords(ped,1)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped,0.0,distanceToCheck,0.0)
            local vehicle = GetVehicleInDirection(playerPos,inFrontOfPlayer)

            if (DoesEntityExist(vehicle)) then 
                SetEntityAsMissionEntity(vehicle,true,true)
                deleteCar(vehicle)

                if (DoesEntityExist(vehicle)) then 
                	TriggerEvent("pNotify:SendNotification",{text = "Kunne ikke slette bilen, prøv igen",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Køretøj slettet",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end 
					else 
					TriggerEvent("pNotify:SendNotification",{text = "Du skal være i nærheden af bilen, eller i føresædet",type = "error",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end 
        end 
    end 
end)

AddEventHandler('on:deletevehicle',function()
local ped = GetPlayerPed(-1)
if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
  local pos = GetEntityCoords(ped)
  if (IsPedSittingInAnyVehicle(ped)) then 
	local vehicle = GetVehiclePedIsIn(ped,false)
	if (GetPedInVehicleSeat(vehicle,-1) == ped) then 
		local damage = GetVehicleBodyHealth(vehicle)
		if damage < 980 or not AreAllVehicleWindowsIntact(vehicle) or IsVehicleDoorDamaged(vehicle,0) or IsVehicleDoorDamaged(vehicle,1) or IsVehicleDoorDamaged(vehicle,2) or IsVehicleDoorDamaged(vehicle,3) then
			TriggerEvent("pNotify:SendNotification",{text = "Dit køretøj er skadet, reparer det før du parkerer",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			elseif (DoesEntityExist(vehicle)) then 
				SetEntityAsMissionEntity(vehicle,true,true)
				Citizen.Wait(150)
				deleteCar(vehicle)
				TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#4E9350'>parkeret</b>",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end 
				else 
				TriggerEvent("pNotify:SendNotification",{text = "Du skal være i føresædet",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
			end
        end 
    end 
end)

function deleteCar(entity)
    Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(entity))
end

function GetVehicleInDirection(coordFrom,coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x,coordFrom.y,coordFrom.z,coordTo.x,coordTo.y,coordTo.z,10,GetPlayerPed(-1),0)
    local _,_,_,_,vehicle = GetRaycastResult(rayHandle)
    return vehicle
end

function DrawText3d(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
		local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		for _, garage in pairs(garages) do
			local player = GetPlayerPed(-1)
			local health = GetEntityHealth(player)
			local car = GetVehiclePedIsIn(ped)
		
			local playerPed = GetPlayerPed(-1)
				if IsPedInAnyVehicle(playerPed,false) then
					local playerCar = GetVehiclePedIsIn(playerPed,false)
					if (GetPedInVehicleSeat( playerCar,-1) == playerPed) then 
						if health >= 106 and GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(GetPlayerPed(-1))) < 3 then
						--DrawMarker(27, 215.124, -791.377, 29.946, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
						-- ply_drawTxt(lang_string.menu8,0,1,0.5,0.8,0.6,255,255,255,255)
						DrawText3d(garage.x, garage.y, garage.z + 1, "Tryk ~g~E~s~ for at parkere køretøjet")
							if IsControlJustPressed(1, 51) then
							TriggerEvent("on:deletevehicle")
						end
					end
				end
            end
        end
    end
end)

RegisterNetEvent('hp:spawnvehicle')
AddEventHandler('hp:spawnvehicle',function(car)
  -- load vehicle model
  local mhash = GetHashKey(car)

  local i = 0
  while not HasModelLoaded(mhash) and i < 10000 do
    RequestModel(mhash)
    Citizen.Wait(10)
    i = i+1
  end

  -- spawn car
  if HasModelLoaded(mhash) then
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    local nveh = CreateVehicle(mhash, x,y,z+0.5, GetEntityHeading(GetPlayerPed(-1)), true, false) -- added player heading
    SetVehicleOnGroundProperly(nveh)
    SetEntityInvincible(nveh,false)
    SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
    SetVehicleNumberPlateText(nveh, "ORIGIN")
    SetEntityAsMissionEntity(nveh, true, true) -- set as mission entity
	  
	Citizen.CreateThread(function()
	    Citizen.Wait(1000)
		TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
	end)

    SetModelAsNoLongerNeeded(mhash)
	TriggerEvent("pNotify:SendNotification",{
    text = "Køretøj spawned.",
    type = "success",
    timeout = (1000),
    layout = "centerLeft",
    queue = "global",
	animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
	killer = true
	})	
  end
end)