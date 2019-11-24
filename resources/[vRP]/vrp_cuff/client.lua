vRPccuff = {}
Tunnel.bindInterface("vRP_cuff",vRPccuff)
Proxy.addInterface("vRP_cuff",vRPccuff)
vRPscuff = Tunnel.getInterface("vRP_cuff","vRP_cuff")
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        if IsControlJustPressed(1,311) then
            print("pressed")
            TriggerServerEvent('handcuff:checkjob')
            Citizen.Wait(1500)
        end
    end
end)

RegisterNetEvent("cuff")
AddEventHandler("cuff", function()
	if not vRPccuff.isHandcuffed() then
		if IsPedInAnyVehicle(PlayerPedId(), true) then
			TriggerEvent("pNotify:SendNotification",{text = "Du kan ikke give håndjern på fra et køretøj.",type = "error",timeout = (5000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    else
			TriggerServerEvent('handcuff:cuffHim')
		end
	end
end)

function vRPccuff.toggleHandcuff()
  handcuffed = not handcuffed
  print("toggl cuff runs")

  print("1")

  SetEnableHandcuffs(GetPlayerPed(-1), handcuffed)
  if handcuffed then
    RequestAnimDict("mp_arresting")

    while not HasAnimDictLoaded("mp_arresting") do
      Citizen.Wait(100)
    end

    TaskPlayAnim(GetPlayerPed(-1), "mp_arresting", "arrested_spin_r_180", 8.0, -8, -1, 49, 0, 0, 0, 0)
    Wait(1800)
    TaskPlayAnim(GetPlayerPed(-1), "missmurder", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
  else
    ClearPedTasks(GetPlayerPed(-1))
    SetPedStealthMovement(GetPlayerPed(-1),false,"") 
  end
end

function vRPccuff.cuffing()
  RequestAnimDict("mp_arrest_paired")
  while not HasAnimDictLoaded("mp_arrest_paired") do
    Citizen.Wait(100)
  end

  TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "cop_p2_fwd_right", 8.0, -8, -1, 49, 0, 0, 0, 0)
  Wait(1800)
  ClearPedTasks(GetPlayerPed(-1))
end

function vRPccuff.setHandcuffed(flag)
    if handcuffed ~= flag then
        vRPccuff.toggleHandcuff()
    end
end
  
function vRPccuff.isHandcuffed()
    return handcuffed
end
  