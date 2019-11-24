--[[
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
]]
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "kasperr_inventory")

local show = false
local temp_inventory = nil
local temp_weight = nil
local temp_maxWeight = nil
local cooldown = 0

function openGui(inventory, weight, maxWeight)
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        inventory = inventory,
        weight = weight,
        maxWeight = maxWeight
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterNetEvent("kasperr_inventory:openGui")
AddEventHandler(
  "kasperr_inventory:openGui",
  function()
    if cooldown > 0 and temp_inventory ~= nil and temp_weight ~= nil and temp_maxWeight ~= nil then
      openGui(temp_inventory, temp_weight, temp_maxWeight)
    else
      TriggerServerEvent("kasperr_inventory:openGui")
    end
  end
)

RegisterNetEvent("kasperr_inventory:updateInventory")
AddEventHandler(
  "kasperr_inventory:updateInventory",
  function(inventory, weight, maxWeight)
    cooldown = Config.AntiSpamCooldown
    temp_inventory = inventory
    temp_weight = weight
    temp_maxWeight = maxWeight
    openGui(temp_inventory, temp_weight, temp_maxWeight)
  end
)

RegisterNetEvent("kasperr_inventory:UINotification")
AddEventHandler(
  "kasperr_inventory:UINotification",
  function(type, title, message)
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        notification = true,
        type = type,
        title = title,
        message = message
      }
    )
  end
)

RegisterNetEvent("kasperr_inventory:closeGui")
AddEventHandler(
  "kasperr_inventory:closeGui",
  function()
    closeGui()
  end
)

RegisterNetEvent("kasperr_inventory:objectForAnimation")
AddEventHandler(
  "kasperr_inventory:objectForAnimation",
  function(type)
    local ped = GetPlayerPed(-1)
    DeleteObject(object)
    bone = GetPedBoneIndex(ped, 60309)
    coords = GetEntityCoords(ped)
    modelHash = GetHashKey(type)

    RequestModel(modelHash)
    object = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, false)
    AttachEntityToEntity(object, ped, bone, 0.1, 0.0, 0.0, 1.0, 1.0, 1.0, 1, 1, 0, 0, 2, 1)
    Citizen.Wait(2500)
    DeleteObject(object)
  end
)

RegisterNUICallback(
  "close",
  function(data)
    closeGui()
  end
)

RegisterNUICallback(
  "useItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerEvent("kasperr_progress_handler:open", Config.Language.PleaseWait, 3000, "server", "kasperr_inventory:useItem", {data})
  end
)

RegisterNUICallback(
  "dropItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("kasperr_inventory:dropItem", data)
  end
)

RegisterNUICallback(
  "giveItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("kasperr_inventory:giveItem", data)
  end
)

RegisterCommand(
  "inventory",
  function(source, args)
    TriggerEvent("kasperr_inventory:openGui")
  end
)

Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)
      if IsControlPressed(0, Config.OpenMenu) then
        TriggerEvent("kasperr_inventory:openGui")
      end
    end
  end
)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)

AddEventHandler(
  "onResourceStop",
  function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)
