vRPsb = {}
Tunnel.bindInterface("on_playerlist",vRPsb)
users = {}
isEmergency = false
playerBlips = {}

RegisterNetEvent("on:playerlist")
AddEventHandler("on:playerlist", function(user_id,data)
  local source, name, job = table.unpack(data)
  if user_id ~= nil then
    if source ~= nil and name ~= nil then
      users[tonumber(user_id)] = { source = tonumber(source), name = tostring(name), job = tostring(job) }
      if PlayerId() == GetPlayerFromServerId(tonumber(source)) then
        if tostring(job) == "Betjent" or tostring(job) == "Elev" or tostring(job) == "AKS" or tostring(job) == "Lægeelev" or tostring(job) == "Læge" then
          isEmergency = true
        else
          isEmergency = false
        end
      end
    else
      users[tonumber(user_id)] = nil
    end
  end
end)

function DrawText3D(x,y,z,text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz,x,y,z,1)

  local scale = (1/dist)*2
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov
  
  if onScreen then
    SetTextScale(0.0*scale, 0.45*scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end

function updatePlayerBlip(id,ped,idtype,idcolor,text)
  if not DoesBlipExist(playerBlips[id]) then
    playerBlips[id] = AddBlipForEntity(ped)
    SetBlipSprite(playerBlips[id], idtype)
    SetBlipAsShortRange(playerBlips[id], true)
    SetBlipColour(playerBlips[id],idcolor)
    SetBlipScale(playerBlips[id],0.8)
    if text ~= nil and text ~= '' then
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(text)
      EndTextCommandSetBlipName(playerBlips[id])
    end
  end
end

Citizen.CreateThread(function()
  listOn = false
  while true do
    Citizen.Wait(0)
    if IsControlPressed(0, 213)--[[ INPUT_PHONE ]] then
      if not listOn then
        local players = {}
		local playersOn = 0
		local secondCounter = 0
		local police = 0
        local ems = 0
        local lawyer = 0
        local journalist = 0
        local mechanic = 0
        local taxi = 0
        local psycho = 0
		
        for k, v in pairs(users) do
		  if k ~= nil and v.source ~= nil and v.name ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
			  playersOn = playersOn+1
			  if v.job == "Betjent" then
				police = police+1
			  elseif v.job == "AKS" then
				police = police+1
			  elseif v.job == "Læge" then
				ems = ems+1
			  elseif v.job == "Lægeelev" then
				ems = ems+1
			  elseif v.job == "Advokat" then
				lawyer = lawyer+1
			  elseif v.job == "Journalist" then
				journalist = journalist+1
			  elseif v.job == "Dommer" then
				lawyer = lawyer+1
			  elseif v.job == "Psykolog" then
				psycho = psycho+1
			  elseif v.job == "Mekaniker" then
				mechanic = mechanic+1
			  elseif v.job == "Taxa" then
				taxi = taxi+1
			  end
		  end
        end
		table.insert(players,'<tr class="header"><td colspan="5"><table width="100%"><tr><td class="job">🚑 '..ems..'</td><td class="job">💼 '..lawyer..'</td><td class="job">🧠 '..psycho..'</td><td class="job">🔧 '..mechanic..'</td><td class="job">🚖 '..taxi..'</td><td class="job">✅ '..playersOn..'/32</td><tr></table></td></tr>')
		--table.insert(players,'<tr class="header"><td colspan="5"><table width="100%"><tr><td class="job">🚔 '..police..'</td><td class="job">🚑 '..ems..'</td><td class="job">💼 '..lawyer..'</td><td class="job">🧠 '..psycho..'</td><td class="job">🔧 '..mechanic..'</td><td class="job">🚖 '..taxi..'</td><td class="job">✅ '..playersOn..'/45</td><tr></table></td></tr>')
		table.insert(players,'<tr class="bluebar"><td class="bluebartext">SPILLERE ONLINE</td><td class="bluebartext"></td></tr>')
		table.insert(players,'<tr style="height: 5px;"><td></td><td></td></tr>')
		
		--TriggerServerEvent("vRP:proxys")

        for k, v in pairs(users) do
			if k ~= nil and v.source ~= nil and v.name ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
				r, g, b = GetPlayerRgbColour(GetPlayerFromServerId(v.source))

				if v.job == "Læge" then jobicon = "👨🏼‍⚕️"
				elseif v.job == "Lægeelev" then jobicon = "👨🏼‍⚕️"
				elseif v.job == "Betjent" then jobicon = "👱🏼"
				elseif v.job == "AKS" then jobicon = "👱🏼"
				elseif v.job == "PET-agent" then jobicon = "👱🏼"
				elseif v.job == "Elev" then jobicon = "👱🏼"
				elseif v.job == "Taxa" then jobicon = "🚖"
				elseif v.job == "Mekaniker" then jobicon = "🔧"
				elseif v.job == "Advokat" then jobicon = "💼"
				elseif v.job == "Journalist" then jobicon = "📰"
				elseif v.job == "Dommer" then jobicon = "💼"
				elseif v.job == "Skraldemand" then jobicon = "♻️"
				elseif v.job == "Postbud" then jobicon = "✉️"
				elseif v.job == "Udbringer" then jobicon = "🍕"
				elseif string.find(v.job, "Lastbil") then jobicon = "🚚" -- Lastbilchauffør
				elseif string.find(v.job, "hugger") then jobicon = "🌳" -- Træhugger 
				elseif v.job == "Pengetransport" then jobicon = "💰"
				elseif v.job == "Minearbejder" then jobicon = "⛏️"
				elseif v.job == "Fisker" then jobicon = "🐟"
				elseif v.job == "Psykolog" then jobicon = "🧠"
				else jobicon = "👱🏼"
				end
				
				secondCounter = secondCounter+1
				if (secondCounter % 2 == 0) then
					
					table.insert(players,'<td style="width: 232px; color: rgb('..r..','..g..','..b..')"><span style="font-size: 12px; vertical-align: 2px;">'..jobicon..'</span> '..v.name..'</td></tr>')
				else
					table.insert(players,'<tr><td style="width: 232px; color: rgb('..r..','..g..','..b..')"><span style="font-size: 12px; vertical-align: 2px;">'..jobicon..'</span> '..v.name..'</td>')
				end
				
			end
        end
	table.insert(players,'<tr class="footer"></tr>')
        SendNUIMessage({text = table.concat(players)})
        listOn = true
        while listOn do
          Citizen.Wait(0)
          if(IsControlPressed(0, 213) == false) then
            listOn = false
            SendNUIMessage({meta = 'close'})
            break
          end
        end
     --[[   timer = true
      if timer then
        Wait(5000) --Gør så der er en timeout på brugerlisten, så folk ikke kan åbne den mere end hvert 5. sekund. Yderligere forhindre den også spam af "** Du føler, at du blev kigget på **"
          timer = false
      end]]
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for i=0,99 do
      RemoveMpGamerTag(i)
    end
    for k, v in pairs(users) do
      if v.source ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(v.source)) then
        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.source)),true))
        distance = math.floor(GetDistanceBetweenCoords(x1,y1,z1,x2,y2,z2,true))
        if distance < 15 and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) and IsEntityVisible(GetPlayerPed(GetPlayerFromServerId(v.source))) then
          if IsControlPressed(3,173) then
          DrawText3D(x2,y2,z2+1.25,k)
          end
          if NetworkIsPlayerTalking(GetPlayerFromServerId(v.source)) then
            DrawMarker(27,x2,y2,z2-0.98,0,0,0,0,0,GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(v.source))),0.88,0.88,-0.25,6, 164, 255,100,0,0,2,0,0,0,0)
          else
            DrawMarker(27,x2,y2,z2-0.98,0,0,0,0,0,GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(v.source))),0.88,0.88,-0.25,255, 255, 255,0,0,0,2,0,0,0,0)
          end 
        end
        if isEmergency and v.job == "Betjent" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,29,"Betjent")
        elseif isEmergency and v.job == "AKS" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,35,"AKS")
        elseif isEmergency and v.job == "Elev" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,18,"Elev")
        elseif isEmergency and v.job == "Lægeelev" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,69,"Lægeelev")
        elseif isEmergency and v.job == "Læge" and GetPlayerPed(-1) ~= GetPlayerPed(GetPlayerFromServerId(v.source)) then
          updatePlayerBlip(k,GetPlayerPed(GetPlayerFromServerId(v.source)),1,69,"Læge")
        else
          if DoesBlipExist(playerBlips[k]) then RemoveBlip(playerBlips[k]) end
          playerBlips[k] = nil
        end
      else
        if DoesBlipExist(playerBlips[k]) then RemoveBlip(playerBlips[k]) end
        playerBlips[k] = nil
      end
    end
  end
end)