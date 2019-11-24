vRPbsT = {}
Tunnel.bindInterface("hp_takeoff",vRPbsT)
Proxy.addInterface("hp_takeoff",vRPbsT)
vRPbsS = Tunnel.getInterface("hp_takeoff","hp_takeoff")
vRP = Proxy.getInterface("vRP")

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('hp:fjernmaske') -- Fjern maske
AddEventHandler('hp:fjernmaske', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("veh@bike@common@front@base")
		TaskPlayAnim(ped, "veh@bike@common@front@base", "take_off_helmet_walk", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(700)
	SetPedComponentVariation(ped,1,0,0,1) -- maske
	if IsPedWearingHelmet(ped) then
		RemovePedHelmet(ped,true)
	end
	TriggerEvent("pNotify:SendNotification",{text = "Din maske blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernhat') -- Fjern hat
AddEventHandler('hp:fjernhat', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("veh@bike@common@front@base")
		TaskPlayAnim(ped, "veh@bike@common@front@base", "take_off_helmet_walk", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(700)
	ClearPedProp(ped,0)
	if IsPedWearingHelmet(ped) then
		RemovePedHelmet(ped,true)
	end
	TriggerEvent("pNotify:SendNotification",{text = "Din hat/hjelm blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernjakke') -- Fjern overtøj
AddEventHandler('hp:fjernjakke', function()
	local ped = PlayerPedId()
	SetPedComponentVariation(ped, 11, 0, 240, 0) -- overtøj
	TriggerEvent("pNotify:SendNotification",{text = "Dit overtøj blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjerntrøje') -- Fjern undertrøje
AddEventHandler('hp:fjerntrøje', function()
	local ped = PlayerPedId()
    SetPedComponentVariation(ped, 8, 0, 240, 0) -- undertrøje
	TriggerEvent("pNotify:SendNotification",{text = "Din undertrøje blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernhals') -- Fjern hals-tilbehør
AddEventHandler('hp:fjernhals', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingtie")
		TaskPlayAnim(ped, "clothingtie", "try_tie_neutral_b", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(1200)
    SetPedComponentVariation(ped, 7, 0, 240, 0) -- hals/slips
	TriggerEvent("pNotify:SendNotification",{text = "Dit slips/halskæde blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernur') -- Fjern ur
AddEventHandler('hp:fjernur', function()
	local ped = PlayerPedId()
	ClearPedProp(ped, 6)
	ClearPedProp(ped, 7)
	
	TriggerEvent("pNotify:SendNotification",{text = "Dit ur/armbånd blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernbriller') -- Fjern briller
AddEventHandler('hp:fjernbriller', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingspecs")
		TaskPlayAnim(ped, "clothingspecs", "try_glasses_positive_a", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(1800)
	ClearPedProp(ped, 1)
	Citizen.Wait(800)
	ClearPedSecondaryTask(ped)
	
	TriggerEvent("pNotify:SendNotification",{text = "Dine briller blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernsko') -- Fjern sko
AddEventHandler('hp:fjernsko', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingshoes")
		TaskPlayAnim(ped, "clothingshoes", "try_shoes_positive_d", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(1800)
	if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
		SetPedComponentVariation(ped, 6, 35, 0, 0)
	else
		SetPedComponentVariation(ped, 6, 34, 0, 0)
	end
	Citizen.Wait(800)
	ClearPedSecondaryTask(ped)
	
	TriggerEvent("pNotify:SendNotification",{text = "Dine sko blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernovertøj') -- Fjern undertrøje, overtøj og sæt arme på
AddEventHandler('hp:fjernovertøj', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingtie")
		TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(3000)
	SetPedComponentVariation(ped, 3, 15, 0, 0) -- arme
    SetPedComponentVariation(ped, 8, 0, 240, 0) -- undertrøje
	if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
		SetPedComponentVariation(ped, 11, 18, 0, 0) -- sæt bh på damekroppe
	else
		SetPedComponentVariation(ped, 11, 0, 240, 0) -- intet tøj på mandekroppe
	end
	TriggerEvent("pNotify:SendNotification",{text = "Du tog dine trøjer af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fjernbukser') -- Fjern bukser
AddEventHandler('hp:fjernbukser', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingshoes")
		TaskPlayAnim(ped, "clothingshoes", "try_shoes_positive_d", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(1800)
	if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
		SetPedComponentVariation(ped, 4, 19, 0, 0)
	else
		SetPedComponentVariation(ped, 4, 21, 0, 0)
	end
	Citizen.Wait(800)
	ClearPedSecondaryTask(ped)
	
	TriggerEvent("pNotify:SendNotification",{text = "Dine bukser blev taget af.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)

RegisterNetEvent('hp:fængselstøj') -- Tag fængselstøj på
AddEventHandler('hp:fængselstøj', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingtie")
		TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(3000)
    SetPedComponentVariation(ped, 8, 0, 240, 0) -- undertrøje
	if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
		SetPedComponentVariation(ped, 11, 117, 0, 2) -- sæt t-shirt på kvinde
		SetPedComponentVariation(ped, 4, 3, 15, 2) -- sæt bukser på kvinde
		SetPedComponentVariation(ped, 6, 69, 4, 2) -- sæt sko på kvinde
		SetPedComponentVariation(ped, 3, 11, 0, 2) -- arme på kvinde
	else
		SetPedComponentVariation(ped, 11, 22, 0, 2) -- sæt t-shirt på mand
		SetPedComponentVariation(ped, 4, 7, 15, 2) -- sæt bukser på mand
		SetPedComponentVariation(ped, 6, 66, 4, 2) -- sæt sko på mand
		SetPedComponentVariation(ped, 3, 0, 0, 2) -- arme på mand
	end
	TriggerEvent("pNotify:SendNotification",{text = "Du tog fængselstøj på.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)


RegisterNetEvent('hp:dykkerdragt') -- Tag dykkerdragt på
AddEventHandler('hp:dykkerdragt', function()
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		loadAnimDict("clothingtie")
		TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 5.0, 5.0, -1, 48, 0, 0, 0, 0)	
	end
	Citizen.Wait(3000)
    SetPedComponentVariation(ped, 8, 0, 240, 0) -- undertrøje
	if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
        SetPedComponentVariation(ped, 11, 251, 17, 2) -- dykkerdragt top på kvinde
        SetPedComponentVariation(ped, 8, 153, 0, 2) -- dykkertank kvinde
        SetPedComponentVariation(ped, 4, 97, 17, 2) -- dykkerdragt bund på kvinde
        SetPedComponentVariation(ped, 6, 70, 17, 2) -- svømmefødder på kvinde
        SetPedComponentVariation(ped, 3, 18, 0, 2) -- arme på kvinde
		SetPedPropIndex(GetPlayerPed(-1), 1, 28, 17, 2) -- dykkerbriller
    else
        SetPedComponentVariation(ped, 11, 243, 17, 2) -- dykkerdragt top på mand
        SetPedComponentVariation(ped, 8, 123, 0, 2) -- dykkertank mand
        SetPedComponentVariation(ped, 4, 94, 17, 2) -- dykkerdragt bund på mand
        SetPedComponentVariation(ped, 6, 67, 17, 2) -- svømmefødder på mand
        SetPedComponentVariation(ped, 3, 17, 0, 2) -- arme på mand
		SetPedPropIndex(GetPlayerPed(-1), 1, 26, 17, 2) -- dykkerbriller
    end
	TriggerEvent("pNotify:SendNotification",{text = "Du tog dykkerdragten på.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
end)
