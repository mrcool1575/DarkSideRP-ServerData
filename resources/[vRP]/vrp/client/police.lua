
-- this module define some police tools and functions

local handcuffed = false
local cop = false

-- set player as cop (true or false)
function tvRP.setCop(flag)
  cop = flag
  SetPedAsCop(GetPlayerPed(-1),flag)
end

-- HANDCUFF

function tvRP.toggleHandcuff()
  handcuffed = not handcuffed

  SetEnableHandcuffs(GetPlayerPed(-1), handcuffed)
  if handcuffed then
    tvRP.playAnim(true,{{"missmurder","idle",1}},true)
  local flags = 16
  else
    tvRP.stopAnim(true)
    SetPedStealthMovement(GetPlayerPed(-1),false,"") 
  end
end

function tvRP.setHandcuffed(flag)
  if handcuffed ~= flag then
    tvRP.toggleHandcuff()
  end
end

function tvRP.isHandcuffed()
  return handcuffed
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
		if IsControlJustReleased(1,311) then
			TriggerServerEvent('handcuff:checkjob')
			Citizen.Wait(1500)
		end
	end
end)

RegisterNetEvent("cuff")
AddEventHandler("cuff", function()
	if not tvRP.isInComa() and not tvRP.isHandcuffed() then
		if IsPedInAnyVehicle(PlayerPedId(), true) then
			TriggerEvent("pNotify:SendNotification",{text = "Du kan ikke give håndjern på fra et køretøj.",type = "error",timeout = (5000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		else
			TriggerServerEvent('handcuff:cuffHim')
		end
	end
end)

function tvRP.spawnspikes()
  TriggerEvent('c_setSpike')
end

-- SEATBELT
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false

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

IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end 

Fwv = function (entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
  Citizen.Wait(500)
  while true do
    
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and (wasInCar or IsCar(car)) then
    
      wasInCar = true
      
      if beltOn then DisableControlAction(0, 75) end
      
      speedBuffer[2] = speedBuffer[1]
      speedBuffer[1] = GetEntitySpeed(car)
      
      if speedBuffer[2] ~= nil 
         and not beltOn
         and GetEntitySpeedVector(car, true).y > 1.0  
         and speedBuffer[1] > 9.25 
         and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
         
        local co = GetEntityCoords(ped)
        local fw = Fwv(ped)
        SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
        SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
        Citizen.Wait(1)
        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
      end
        
      velBuffer[2] = velBuffer[1]
      velBuffer[1] = GetEntityVelocity(car)

      if IsControlJustReleased(0, 20) then 
       beltOn = not beltOn        
        if beltOn then 
        exports.pNotify:SendNotification({text = "Sikkerhedssele <b style='color: #5DB6E5'>spændt</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"Sikkerhedssele_on.mp3"},volume = 0.3,conditions = {"docVisible"}}})
         else 
        exports.pNotify:SendNotification({text = "Sikkerhedssele <b style='color: #DB4646'>løsnet</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"Sikkerhedssele_off.mp3"},volume = 0.3,conditions = {"docVisible"}}})
        end
      end

      if (IsPedInAnyVehicle(ped, false)) and beltOn == true then      
        drawTxt(0.615,1.293, 1.0,1.0,0.45, "~b~S", 255, 255, 255, 255)
      else
        drawTxt(0.615,1.293, 1.0,1.0,0.45, "~r~S", 255, 255, 255, 255)
      end
      
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      speedBuffer[1], speedBuffer[2] = 0.0, 0.0
    end
    Citizen.Wait(0)
  end
end)

-- (experimental, based on experimental getNearestVehicle)
function tvRP.putInNearestVehicleAsPassenger(radius)
  local veh = tvRP.getNearestVehicle(radius)

  if IsEntityAVehicle(veh) then
    for i=1,math.max(GetVehicleMaxNumberOfPassengers(veh),3) do
      if IsVehicleSeatFree(veh,i) then
        SetPedIntoVehicle(GetPlayerPed(-1),veh,i)
    beltOn = true
        return true
      end
    end
  end
  return false
end

function tvRP.putInNetVehicleAsPassenger(net_veh)
  local veh = NetworkGetEntityFromNetworkId(net_veh)
  if IsEntityAVehicle(veh) then
    for i=1,GetVehicleMaxNumberOfPassengers(veh) do
      if IsVehicleSeatFree(veh,i) then
      DetachEntity(GetPlayerPed(-1), true, false)
        SetPedIntoVehicle(GetPlayerPed(-1),veh,i)
    beltOn = true
        return true
      end
    end
  end
end

function tvRP.putInVehiclePositionAsPassenger(x,y,z)
  local veh = tvRP.getVehicleAtPosition(x,y,z)
  if IsEntityAVehicle(veh) then
    for i=1,GetVehicleMaxNumberOfPassengers(veh) do
      if IsVehicleSeatFree(veh,i) then
      DetachEntity(GetPlayerPed(-1), true, false)
        SetPedIntoVehicle(GetPlayerPed(-1),veh,i)
    beltOn = true
        return true
      end
    end
  end
end

-- keep handcuffed animation
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(15000)
    if handcuffed then
      tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
    end
  end
end)

-- force stealth movement while handcuffed (prevent use of fist and slow the player)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if handcuffed then
      SetPedStealthMovement(GetPlayerPed(-1),true,"")
      DisableControlAction(0,21,true) -- disable sprint (SHIFT)
      DisableControlAction(0,22,true) -- disable jump (SPACE)
      DisableControlAction(0,23,true) -- disable enter vehicle (F)
      DisableControlAction(0,24,true) -- disable attack (LEFTCLICK)
      DisableControlAction(0,25,true) -- disable aim (RIGHTCLICK)
      DisableControlAction(0,29,true) -- disable point (B)
      DisableControlAction(0,47,true) -- disable weapon
      DisableControlAction(0,58,true) -- disable weapon 
      DisableControlAction(0,73,true) -- disable handsup (X)
      DisableControlAction(0,75,true) -- disable exit vehicle (F)
      DisableControlAction(27,75,true) -- disable exit vehicle (F)
      DisableControlAction(0,140,true) -- disable melee
      DisableControlAction(0,141,true) -- disable melee
      DisableControlAction(0,142,true) -- disable melee
      DisableControlAction(0,143,true) -- disable melee
      DisableControlAction(0,257,true) -- disable melee
      DisableControlAction(0,263,true) -- disable melee
      DisableControlAction(0,264,true) -- disable melee
      DisableControlAction(0,311,true) -- disable seatbelt (K)
      DisableControlAction(0,323,true) -- disable handsup2 (X)
      DisableControlAction(0,244,true) -- disable flipoff (M)
    end
  end
end)

-- JAIL

local jail = nil

-- jail the player in a no-top no-bottom cylinder 
function tvRP.jail(x,y,z,radius)
  tvRP.teleport(x,y,z) -- teleport to center
  jail = {x+0.0001,y+0.0001,z+0.0001,radius+0.0001}
end

-- unjail the player
function tvRP.unjail()
  jail = nil
end

function tvRP.isJailed()
  return jail ~= nil
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5)
    if jail then
      local x,y,z = tvRP.getPosition()

      local dx = x-jail[1]
      local dy = y-jail[2]
      local dist = math.sqrt(dx*dx+dy*dy)

      if dist >= jail[4] then
        local ped = GetPlayerPed(-1)
        SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001) -- stop player

        -- normalize + push to the edge + add origin
        dx = dx/dist*jail[4]+jail[1]
        dy = dy/dist*jail[4]+jail[2]

        -- teleport player at the edge
        SetEntityCoordsNoOffset(ped,dx,dy,z,true,true,true)
      end
    end
  end
end)

-- WANTED

-- wanted level sync
local wanted_level = 0

function tvRP.applyWantedLevel(new_wanted)
  Citizen.CreateThread(function()
    local old_wanted = GetPlayerWantedLevel(PlayerId())
    local wanted = math.max(old_wanted,new_wanted)
    ClearPlayerWantedLevel(PlayerId())
    SetPlayerWantedLevelNow(PlayerId(),false)
    Citizen.Wait(10)
    SetPlayerWantedLevel(PlayerId(),wanted,false)
    SetPlayerWantedLevelNow(PlayerId(),false)
  end)
end

-- update wanted level
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(2000)

    -- if cop, reset wanted level
    if cop then
      ClearPlayerWantedLevel(PlayerId())
      SetPlayerWantedLevelNow(PlayerId(),false)
    end
    
    -- update level
    local nwanted_level = GetPlayerWantedLevel(PlayerId())
    if nwanted_level ~= wanted_level then
      wanted_level = nwanted_level
      vRPserver.updateWantedLevel({wanted_level})
    end
  end
end)