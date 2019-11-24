-----------------------------------------------------------------------------
-- Fartfælde customized fra vrp_stationaryRadars
-----------------------------------------------------------------------------
field = ""

local radar1 = { -- Punkter for Radar 1
    {x = 511.88848876953, y = -1041.5057373047, z = 36.734352111816}, -- PD
    {x = 316.88000488281, y = -799.82385253906, z = 29.332088470459}, -- Mod Motorvej fra midtby
    {x = -424.99047851563, y = -206.42329406738, z = 36.261260986328}, -- Mod basishus 1
}

local radar2 = { -- Punkter for Radar 2
    {x = 1208.7415771484, y = 664.14428710938, z = 99.312528991699}, -- La Torre
    {x = 2350.5783691406, y = 3886.9052734375, z = 34.595402526855}, -- Sandy
    {x = -260.32272338867, y = 6105.8530273438, z = 30.734342575073}, -- Paleto
}

local radar3 = { -- Punkter for Radar 3
    {x = 1693.8114013672, y = 1468.6546630859, z = 85.299354553223},
    {x = 2160.1149902344, y = 2683.041015625, z = 48.931442260742},
    {x = 2152.0427246094, y = 2692.1550292969, z = 48.933853149414},
}

local ignorecars = {
    -437372235,
    -1627000575,
    1171614426,
    -794924083,
    1127131465,
    -1291872016,
    -994755493,
    1190864906,
    -1647941228,
    -1205689942,
    1912215274,
    -1471916751,
    2046537925,
    -1683328900,
    -133288247,
	-1548338031,
	-1145771600,
	-1165163823,
	353883353
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar1) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar1[k].x, radar1[k].y, radar1[k].z, coords["x"], coords["y"], coords["z"]) < 12 then
                field = "1"
                checkSpeed()
                break
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar2) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar2[k].x, radar2[k].y, radar2[k].z, coords["x"], coords["y"], coords["z"]) < 8 then
                field = "2"
                checkSpeed()
                break
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar3) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar3[k].x, radar3[k].y, radar3[k].z, coords["x"], coords["y"], coords["z"]) < 13 then
                field = "3"
                checkSpeed()
                break
            end
        end
    end
end)
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function action()
    Wait(1000)
    StartScreenEffect("DeathFailMPDark", 100, 0)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "fartfaelde", 0.8)
end

local maxspeed = 0
function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local license = GetVehicleNumberPlateText(vehicle)
    if has_value(ignorecars, GetEntityModel(GetVehiclePedIsIn(pP, true))) then
        return false
    end
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local kmhspeed = math.ceil(speed*3.6)

    if field == "1" and kmhspeed > 66 and driver = pP  then
        maxspeed = 60
        tax = math.floor((kmhspeed-maxspeed) * 100)
        action()   
        TriggerServerEvent('betalFart',tax,kmhspeed,maxspeed,license)
    elseif field == "2" and kmhspeed > 86 and driver = pP then
        maxspeed = 80
        tax = math.floor((kmhspeed-maxspeed) * 100)
        action()   
        TriggerServerEvent('betalFart',tax,kmhspeed,maxspeed,license)
    elseif field == "3" and kmhspeed > 116 and driver = pP  then
        maxspeed = 110
        tax = math.floor((kmhspeed-maxspeed) * 100)
        action()   
        TriggerServerEvent('betalFart',tax,kmhspeed,maxspeed,license)
    end
end