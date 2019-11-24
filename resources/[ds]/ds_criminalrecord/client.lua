vRPCCre = {}
Tunnel.bindInterface("vRP_criminalrecords",vRPCCre)
Proxy.addInterface("vRP_criminalrecords",vRPCCre)
vRPSatm = Tunnel.getInterface("vRP_criminalrecords","vRP_criminalrecords")
vRP = Proxy.getInterface("vRP")

local inMarker = false


-- Notification
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- Display marker and Enter/Exit events
Citizen.CreateThread(function ()
	local time = 0

  while true do
    Wait(time)
		v = Config.Marker

	  if( v.Type ~= -1 and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.Pos.x, v.Pos.y, v.Pos.z, true) < 20 ) then
	    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			time = 0
		elseif v.Type ~= -1 and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.Pos.x, v.Pos.y, v.Pos.z, true) > 60 then
			time = 500
		end

		if( v.Type ~= -1 and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x ) then
	    inMarker = true
			hintToDisplay(v.Hint)
		else
			inMarker = false
		end
	end
end)

-- Key event
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 38) and inMarker then
			ESX.TriggerServerCallback('jsfour-criminalrecord:fetch', function( d )
				SetNuiFocus(true, true)

				SendNUIMessage({
				  action = "open",
					array  = d
				})
		  end, data, 'start')
		end
	end
end)

-- NUI Callback - Close
RegisterNUICallback('escape', function(data, cb)
	SetNuiFocus(false, false)
	cb('ok')
end)

-- NUI Callback - Fetch
RegisterNUICallback('fetch', function(data, cb)
	ESX.TriggerServerCallback('jsfour-criminalrecord:fetch', function( d )
    cb(d)
  end, data, data.type)
end)

-- NUI Callback - Search
RegisterNUICallback('search', function(data, cb)
	ESX.TriggerServerCallback('jsfour-criminalrecord:search', function( d )
    cb(d)
  end, data)
end)

-- NUI Callback - Add
RegisterNUICallback('add', function(data, cb)
	ESX.TriggerServerCallback('jsfour-criminalrecord:add', function( d )
    cb(d)
  end, data)
end)

-- NUI Callback - Update
RegisterNUICallback('update', function(data, cb)
	ESX.TriggerServerCallback('jsfour-criminalrecord:update', function( d )
    cb(d)
  end, data)
end)

-- NUI Callback - Remove
RegisterNUICallback('remove', function(data, cb)
	ESX.TriggerServerCallback('jsfour-criminalrecord:remove', function( d )
    cb(d)
  end, data)
end)
