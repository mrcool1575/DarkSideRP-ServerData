-- local DynamicWeather = false

-- local AvailableWeatherTypes = {
    -- 'EXTRASUNNY',
    -- 'CLEAR',
    -- 'NEUTRAL',
    -- 'SMOG',
    -- 'FOGGY',
    -- 'OVERCAST',
    -- 'CLOUDS',
    -- 'CLEARING',
    -- 'THUNDER'
-- }

-- local CurrentWeather = "EXTRASUNNY"
-- local Time = {}

-- local timezone = 2

-- local newWeatherTimer = 120

-- function atualizarHora()
  -- Time.h = tonumber(os.date("%H", os.time() + timezone * 60 * 60))
  -- Time.m = tonumber(os.date("%M"))
  -- Time.s = tonumber(os.date("%S"))
  -- Time.y = tonumber(os.date("%Y"))
  -- Time.me = tonumber(os.date("%m"))
  -- Time.d = tonumber(os.date("%d"))
  -- end
-- end

-- RegisterServerEvent('JNS:requestSync')
-- AddEventHandler('JNS:requestSync', function()
    -- TriggerClientEvent('JNS:updateWeather', -1, CurrentWeather)
    -- TriggerClientEvent('JNS:updateTime', -1, Time.h, Time.m, Time.s, Time.y, Time.me, Time.d)
-- end)
-- Atualiza a data a cada segundo (Assim ele muda o mês e ano certinho) / Verifiy the date on every second so he can change the month later.
-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(100)
        -- atualizarHora()
    -- end
-- end)
-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(100)
        -- TriggerClientEvent('JNS:updateTime', -1, Time.h, Time.m, Time.s, Time.y, Time.me, Time.d)
    -- end
-- end)
-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(60000)
        -- TriggerClientEvent('JNS:updateWeather', -1, CurrentWeather)
    -- end
-- end)
-- Citizen.CreateThread(function()
    -- tempTimer = newWeatherTimer
    -- while true do
        -- tempTimer = tempTimer - 1
        -- Citizen.Wait(60000)
        -- if tempTimer == 0 then
            -- if DynamicWeather then
                -- NextWeatherStage()
            -- end
            -- tempTimer = newWeatherTimer
        -- end
    -- end
-- end)

if GetCurrentResourceName() ~= "dln_dyn" then
	print("## FEJL ## Resource: '" .. GetCurrentResourceName() .. "' skal hedde 'dln_dyn' for at fikse denne fejl.")
end

-- function NextWeatherStage()
    -- if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY" or CurrentWeather == "RAIN" then
        -- local new = math.random(1,2)
        -- if new == 1 then
            -- CurrentWeather = "CLEARING"
        -- else
            -- CurrentWeather = "OVERCAST"
        -- end
    -- elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        -- local new = math.random(1,6)
        -- if new == 1 then
            -- if CurrentWeather == "CLEARING" then CurrentWeather = "FOGGY" else CurrentWeather = "FOGGY" end
        -- elseif new == 2 then
            -- CurrentWeather = "CLOUDS"
        -- elseif new == 3 then
            -- CurrentWeather = "CLEAR"
        -- elseif new == 4 then
            -- CurrentWeather = "EXTRASUNNY"
        -- elseif new == 5 then
            -- CurrentWeather = "SMOG"
        -- else
            -- CurrentWeather = "FOGGY"
        -- end
    -- elseif CurrentWeather == "THUNDER" or CurrentWeather == "FOGGY" then
        -- CurrentWeather = "CLEARING"
    -- elseif CurrentWeather == "RAIN" then
        -- CurrentWeather = "EXTRASUNNY"
    -- elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        -- CurrentWeather = "CLEAR"
    -- end
    -- TriggerEvent("JNS:requestSync")
-- end
