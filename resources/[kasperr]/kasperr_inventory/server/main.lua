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
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "kasperr_inventory")

RegisterServerEvent("kasperr_inventory:openGui")
AddEventHandler(
    "kasperr_inventory:openGui",
    function()
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local data = vRP.getUserDataTable({user_id})
        if data and data.inventory then
            local inventory = {}
            for data_k, data_v in pairs(data.inventory) do
                for items_k, items_v in pairs(items) do
                    if data_k == items_k then
                        local item_name = vRP.getItemName({data_k})
                        if item_name then
                            table.insert(
                                inventory,
                                {
                                    name = item_name,
                                    amount = data_v.amount,
                                    idname = data_k,
                                    icon = items_v[3]
                                }
                            )
                        end
                    end
                end
            end
            local weight = vRP.getInventoryWeight({user_id})
            local maxWeight = vRP.getInventoryMaxWeight({user_id})
            TriggerClientEvent("kasperr_inventory:updateInventory", source, inventory, weight, maxWeight)
        end
    end
)

RegisterServerEvent("kasperr_inventory:useItem")
AddEventHandler(
    "kasperr_inventory:useItem",
    function(args)
        local data = args[1]
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})

        if data.idname then
            for k, v in pairs(items) do
                if data.idname == k then
                    useItem(user_id, player, k, v[1], v[2], data.amount)
                end
            end
        end
    end
)

RegisterServerEvent("kasperr_inventory:dropItem")
AddEventHandler(
    "kasperr_inventory:dropItem",
    function(data)
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local amount = parseInt(data.amount)
        if vRP.tryGetInventoryItem({user_id, data.idname, amount, false}) then
            TriggerClientEvent("kasperr_inventory:closeGui", player)
            vRPclient.playAnim(player, {true, {{"pickup_object", "pickup_low", 1}}, false})
        else
            TriggerClientEvent(
                "kasperr_inventory:UINotification",
                player,
                "warning",
                Config.Language.WarningTitle,
                Config.Language.Error
            )
        end
    end
)

function split(str, sep)
    local array = {}
    local reg = string.format("([^%s]+)", sep)
    for mem in string.gmatch(str, reg) do
        table.insert(array, mem)
    end
    return array
end

function useItem(user_id, player, idname, type, variation, amount)
    if type == "drink" or type == "food" or type == "heal" or type == "weapon" or type == "ammo" then
        if type == "drink" then
            if vRP.tryGetInventoryItem({user_id, idname, tonumber(amount), false}) then
                TriggerClientEvent("kasperr_inventory:objectForAnimation", player, "prop_ld_flow_bottle")
                play_drink(player)
                for i = 1, tonumber(amount) do
                    vRP.varyThirst({user_id, variation})
                end
            end
        end
        if type == "food" then
            if vRP.tryGetInventoryItem({user_id, idname, tonumber(amount), false}) then
                TriggerClientEvent("kasperr_inventory:objectForAnimation", player, "prop_cs_burger_01")
                play_eat(player)
                for i = 1, tonumber(amount) do
                    vRP.varyHunger({user_id, variation})
                end
            end
        end
        if type == "heal" then
            if vRP.tryGetInventoryItem({user_id, idname, tonumber(amount), false}) then
                for i = 1, tonumber(amount) do
                    vRPclient.varyHealth(player, {25})
                end
            end
        end
        if type == "weapon" then
            if vRP.tryGetInventoryItem({user_id, idname, tonumber(amount), false}) then
                local fullidname = split(idname, "|")
                vRPclient.giveWeapons(
                    player,
                    {
                        {
                            [fullidname[2]] = {ammo = 0}
                        },
                        false
                    }
                )
            end
        end
        if type == "ammo" then
            local fullidname = split(idname, "|")
            local exists = false
            vRPclient.getWeapons(
                player,
                {},
                function(weapons)
                    for k, v in pairs(weapons) do
                        if k == fullidname[2] then
                            exists = true
                        end
                    end
                    if exists == true then
                        if vRP.tryGetInventoryItem({user_id, idname, tonumber(amount), false}) then
                            vRPclient.giveWeapons(
                                player,
                                {
                                    {
                                        [fullidname[2]] = {ammo = tonumber(amount)}
                                    },
                                    false
                                }
                            )
                        end
                    else
                        TriggerClientEvent(
                            "kasperr_inventory:UINotification",
                            player,
                            "warning",
                            Config.Language.WarningTitle,
                            Config.Language.WeaponNotEquipped
                        )
                    end
                end
            )
        end
    end
    if type == "none" then
        TriggerClientEvent(
            "kasperr_inventory:UINotification",
            player,
            "warning",
            Config.Language.WarningTitle,
            Config.Language.CannotBeUsed
        )
    end
end

RegisterServerEvent("kasperr_inventory:giveItem")
AddEventHandler(
    "kasperr_inventory:giveItem",
    function(data)
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if user_id ~= nil then
            vRPclient.getNearestPlayer(
                player,
                {10},
                function(nplayer)
                    if nplayer ~= nil then
                        local nuser_id = vRP.getUserId({nplayer})
                        if nuser_id ~= nil then
                            local amount = parseInt(data.amount)
                            local new_weight =
                                vRP.getInventoryWeight({nuser_id}) + vRP.getItemWeight({data.idname}) * amount
                            if new_weight <= vRP.getInventoryMaxWeight({nuser_id}) then
                                if vRP.tryGetInventoryItem({user_id, data.idname, amount, false}) then
                                    vRP.giveInventoryItem({nuser_id, data.idname, amount, true})

                                    vRPclient.playAnim(player, {true, {{"mp_common", "givetake1_a", 1}}, false})
                                    vRPclient.playAnim(nplayer, {true, {{"mp_common", "givetake2_a", 1}}, false})
                                else
                                    vRPclient.notify(player, {Config.Language.Error})
                                end
                            else
                                vRPclient.notify(player, {Config.Language.NotEnoughtSpace})
                            end
                        else
                            vRPclient.notify(player, {Config.Language.NoNearby})
                        end
                    else
                        vRPclient.notify(player, {Config.Language.NoNearby})
                    end
                end
            )
        end
    end
)

function play_eat(player)
    local seq = {
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
    }

    vRPclient.playAnim(player,{true,seq,false})
end

function play_drink(player)
    local seq = {
        {"mp_player_intdrink","intro_bottle",1},
        {"mp_player_intdrink","loop_bottle",1},
        {"mp_player_intdrink","outro_bottle",1}
    }

    vRPclient.playAnim(player,{true,seq,false})
end