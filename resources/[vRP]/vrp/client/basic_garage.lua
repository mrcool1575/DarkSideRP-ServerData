local vehicles = {}

AddEventHandler('vrp_garages:setVehicle', function(vtype, vehicle)
  vehicles[vtype] = vehicle
end)

function tvRP.spawnGarageVehicle(vtype,name,pos) -- vtype is the vehicle type (one vehicle per type allowed at the same time)

  local vehicle = vehicles[vtype]
  if vehicle and not IsVehicleDriveable(vehicle[3]) then -- precheck if vehicle is undriveable
    -- despawn vehicle
    SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
    vehicles[vtype] = nil
  end

  vehicle = vehicles[vtype]
  if vehicle == nil then
    -- load vehicle model
    local mhash = GetHashKey(name)

    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end

    -- spawn car
    if HasModelLoaded(mhash) then
      local x,y,z = tvRP.getPosition()
    if pos then
        x,y,z = table.unpack(pos)
      end

      local nveh = CreateVehicle(mhash, x,y,z+0.5, 0.0, true, false)
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetVehicleNumberPlateText(nveh, "P "..tvRP.getRegistrationNumber())
      -- Citizen.InvokeNative(0xAD738C3085FE7E11, nveh, true, true) -- set as mission entity
      SetVehicleHasBeenOwnedByPlayer(nveh,true)

      local nid = NetworkGetNetworkIdFromEntity(nveh)
      SetNetworkIdCanMigrate(nid,true)


      vehicles[vtype] = {vtype,name,nveh} -- set current vehicule

      SetModelAsNoLongerNeeded(mhash)
    end
  else      
  local cartype = ""
  if vtype == "car" then
      cartype = "bil"
  elseif vtype == "bike" then 
      cartype = "motorcykel"
  elseif vtype == "citybike" then
      cartype = "cykel"
  end
  TriggerEvent("pNotify:SendNotification",{text = "Du kan kun have én <b style='color:#DB4646'>"..cartype.."</b> ude",type = "warning",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})   
  end
end

function tvRP.despawnGarageVehicle(vtype,max_range)
  local vehicle = vehicles[vtype]
  if vehicle then
    local x,y,z = table.unpack(GetEntityCoords(vehicle[3],true))
    local px,py,pz = tvRP.getPosition()

    if GetDistanceBetweenCoords(x,y,z,px,py,pz,true) < max_range then -- check distance with the vehicule
      -- remove vehicle
      SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
      Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle[3], false, true) -- set not as mission entity
      SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle[3]))
      vehicles[vtype] = nil
      TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#4E9350'>parkeret.</b>",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    else
      TriggerEvent("pNotify:SendNotification",{text = "Du er for langt fra <b style='color:#DB4646'>køretøjet.</b>",type = "error",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end
  end
end

-- (experimental) this function return the nearest vehicle
-- (don't work with all vehicles, but aim to)
function tvRP.getNearestVehicle(radius)
  local x,y,z = tvRP.getPosition()
  local ped = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ped) then
    return GetVehiclePedIsIn(ped, true)
  else
    -- flags used:
    --- 8192: boat
    --- 4096: helicos
    --- 4,2,1: cars (with police)

    local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+0.0001, 0, 8192+4096+4+2+1)  -- boats, helicos
    if not IsEntityAVehicle(veh) then veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001, radius+0.0001, 0, 4+2+1) end -- cars
    return veh
  end
end

function tvRP.fixeNearestVehicle(radius)
	local veh = tvRP.getNearestVehicle(radius)
	if IsEntityAVehicle(veh) then
		SetVehicleFixed(veh)
	end
end

function tvRP.fixeNearestVehicleAdmin(radius)
	local veh = tvRP.getNearestVehicle(radius)
	local ped = GetPlayerPed(-1)
	if IsEntityAVehicle(veh) then
		if not IsPedSittingInAnyVehicle(ped) then
			SetVehicleFixed(veh)
			TriggerEvent("pNotify:SendNotification",{text = "Nærmeste køretøj repareret.",type = "success",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		else
			TriggerEvent("pNotify:SendNotification",{text = "Du må ikke sidde i køretøjet, mens du reparerer det.",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	else
		TriggerEvent("pNotify:SendNotification",{text = "Køretøj blev ikke fundet.",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
	end
end

function tvRP.fixCurrentVehicle()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped,false)
  if IsEntityAVehicle(veh) then
      SetVehicleFixed(veh)
  else
    TriggerEvent("pNotify:SendNotification",{text = "Køretøj blev ikke fundet.",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
  end
end

function tvRP.replaceNearestVehicle(radius)
	local veh = tvRP.getNearestVehicle(radius)
	local ped = GetPlayerPed(-1)
	local roll = GetEntityRoll(veh)
	if not IsPedSittingInAnyVehicle(ped) then
		if IsEntityAVehicle(veh) and (roll > 75.0 or roll < -75.0) and GetEntitySpeed(veh) < 2 then
			local heading = GetEntityHeading(veh)
			SetEntityRotation(veh, 0, 0, 0, 0 ,0)
			SetVehicleOnGroundProperly(veh)
			SetEntityHeading(veh, heading)
			TriggerEvent("pNotify:SendNotification",{text = "Køretøjet blev vendt om.",type = "error",timeout = (3000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
		end
	end
end

-- try to get a vehicle at a specific position (using raycast)
function tvRP.getVehicleAtPosition(x,y,z)
  x = x+0.0001
  y = y+0.0001
  z = z+0.0001

  local ray = CastRayPointToPoint(x,y,z,x,y,z+4,10,GetPlayerPed(-1),0)
  local a, b, c, d, ent = GetRaycastResult(ray)
  return ent
end

-- return ok,vtype,name
function tvRP.getNearestOwnedVehicle(radius)
  local px,py,pz = tvRP.getPosition()
  for k,v in pairs(vehicles) do
    local x,y,z = table.unpack(GetEntityCoords(v[3],true))
    local dist = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
    if dist <= radius+0.0001 then return true,v[1],v[2] end
  end

  return false,"",""
end

-- return ok,x,y,z
function tvRP.getAnyOwnedVehiclePosition()
  for k,v in pairs(vehicles) do
    if IsEntityAVehicle(v[3]) then
      local x,y,z = table.unpack(GetEntityCoords(v[3],true))
      return true,x,y,z
    end
  end

  return false,0,0,0
end

-- return x,y,z
function tvRP.getOwnedVehiclePosition(vtype)
  local vehicle = vehicles[vtype]
  local x,y,z = 0,0,0

  if vehicle then
    x,y,z = table.unpack(GetEntityCoords(vehicle[3],true))
  end

  return x,y,z
end

-- return ok, vehicule network id
function tvRP.getOwnedVehicleId(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    return true, NetworkGetNetworkIdFromEntity(vehicle[3])
  else
    return false, 0
  end
end

-- eject the ped from the vehicle
function tvRP.ejectVehicle()
  local ped = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ped) then
    local veh = GetVehiclePedIsIn(ped,false)
    TaskLeaveVehicle(ped, veh, 4160)
  end
end

-- vehicle commands
local door
function tvRP.vc_toggleDoor(vtype, door_index)
  local vehicle = vehicles[vtype]
  if vehicle then
    if door then
      SetVehicleDoorOpen(vehicle[3],door_index,0,false)
    else
      SetVehicleDoorShut(vehicle[3],door_index,0,false)
    end
    door = not door
  end
end

local door
function tvRP.vc_openDoor(vtype, door_index)
  local vehicle = vehicles[vtype]
  if vehicle then
    if door then
    SetVehicleDoorShut(vehicle[3],door_index,0,false)
   else
    SetVehicleDoorOpen(vehicle[3],door_index)
  end
  door = not door
 end
end

function tvRP.vc_closeDoor(vtype, door_index)
  local vehicle = vehicles[vtype]
  if vehicle then
    SetVehicleDoorShut(vehicle[3],door_index)
  end
end

local neon
function tvRP.vc_NeonToggle(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    if neon then
      SetVehicleNeonLightEnabled(vehicle[3],0,false)
      SetVehicleNeonLightEnabled(vehicle[3],1,false)
      SetVehicleNeonLightEnabled(vehicle[3],2,false)
      SetVehicleNeonLightEnabled(vehicle[3],3,false)
      TriggerEvent("pNotify:SendNotification",{text = "Neonlys <b style='color: #DB4646'>slukket</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true}) 
    else
     SetVehicleNeonLightEnabled(vehicle[3],0,true)
     SetVehicleNeonLightEnabled(vehicle[3],1,true)
     SetVehicleNeonLightEnabled(vehicle[3],2,true)
     SetVehicleNeonLightEnabled(vehicle[3],3,true)
     TriggerEvent("pNotify:SendNotification",{text = "Neonlys <b style='color: #5DB6E5'>tændt</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true}) 
    end
    neon = not neon
  end
end

function tvRP.vc_detachTrailer(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    DetachVehicleFromTrailer(vehicle[3])
  end
end

function tvRP.vc_detachTowTruck(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    local ent = GetEntityAttachedToTowTruck(vehicle[3])
    if IsEntityAVehicle(ent) then
      DetachVehicleFromTowTruck(vehicle[3],ent)
    end
  end
end

function tvRP.vc_detachCargobob(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    local ent = GetVehicleAttachedToCargobob(vehicle[3])
    if IsEntityAVehicle(ent) then
      DetachVehicleFromCargobob(vehicle[3],ent)
    end
  end
end

function tvRP.vc_toggleEngine(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    local running = Citizen.InvokeNative(0xAE31E7DF9B5B132E,vehicle[3]) -- GetIsVehicleEngineRunning
    SetVehicleEngineOn(vehicle[3],not running,true,true)
    if running then
      SetVehicleUndriveable(vehicle[3],true)
    else
      SetVehicleUndriveable(vehicle[3],false)
    end
  end
end

function tvRP.vc_toggleLock(vtype)
  local vehicle = vehicles[vtype]
  if vehicle then
    local veh = vehicle[3]
    local locked = GetVehicleDoorLockStatus(veh) >= 2
    if locked then -- unlock
      SetVehicleDoorsLockedForAllPlayers(veh, false)
      SetVehicleDoorsLocked(veh,1)
      SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
      TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#4E9350'>låst op</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"carsound.mp3"},volume = 0.2,conditions = {"docVisible"}}, killer = true}) 
    
    else -- lock
      SetVehicleDoorsLocked(veh,2)
      SetVehicleDoorsLockedForAllPlayers(veh, true)
      TriggerEvent("pNotify:SendNotification",{text = "Køretøj <b style='color:#DB4646'>låst</b>.",type = "success",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"carsound.mp3"},volume = 0.2,conditions = {"docVisible"}}, killer = true}) 
    end
  end
end


