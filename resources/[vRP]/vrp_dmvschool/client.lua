maxErrors = 5 -- Change the amount of Errors allowed for the player to pass the driver test, any number above this will result in a failed test

local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Kørelærer",
    menu_subtitle = "Kategorier",
    color_r = 0,
    color_g = 128,
    color_b = 255,
}

local dmvped = {
  {type=4, hash=0xc99f21c4, x=-1014.963, y=-1514.764, z=5.514 , a=3374176},
}
local dmvpedpos = {
	{ ['x'] = -1014.963, ['y'] = -1514.764, ['z'] = 6.514 },
}

--[[Locals]]--

local dmvschool_location = {-1014.963,-1514.764,6.514}

local kmh = 3.6
local VehSpeed = 0

local speed_limit_resi = 53
local speed_limit_town = 83
local speed_limit_freeway = 133
local speed = kmh

local DTutOpen = false

--[[Events]]--

AddEventHandler("playerSpawned", function()
	TriggerServerEvent('dmv:LicenseStatus')	
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
    TriggerServerEvent('dmv:LicenseStatus')	  
	end
end)

TestDone = false
schoolLock = false
testlock = false

RegisterNetEvent('dmv:CheckLicStatusNon')
AddEventHandler('dmv:CheckLicStatusNon', function()
--Check if player has completed theory test
	schoolLock = false
end)

RegisterNetEvent('dmv:CheckLicStatusTaken')
AddEventHandler('dmv:CheckLicStatusTaken', function()
--Check if player has completed theory test
	schoolLock = true
	TestDone = false
	theorylock = true
	testlock = true
end)

RegisterNetEvent('dmv:CheckLicStatusHas')
AddEventHandler('dmv:CheckLicStatusHas', function()
--Check if player has completed theory test
	schoolLock = true
	TestDone = false
	theorylock = true
	testlock = true
end)

--[[Functions]]--

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DrawMissionText2(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function LocalPed()
	return GetPlayerPed(-1)
end

function GetCar() 
	return GetVehiclePedIsIn(GetPlayerPed(-1),false) 
end

function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

--[[Arrays]]--
onTtest = false
onPtest = false
onTestEvent = 0
theorylock = true
testlock = true
DamageControl = 0
SpeedControl = 0
Error = 0

function startintro()
	if schoolLock then
		TriggerEvent("pNotify:SendNotification",{text = "<b style='color:red'>Køreskolen holder lukket lige nu.</b>",type = "error",timeout = (4000),layout = "center",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})			
	else
		DIntro() 
		theorylock = false
		schoolLock = true
	end
end

function startttest()
    if theorylock then
		TriggerEvent("pNotify:SendNotification",{text = "<b style='color:red'>Du har ikke færdiggjort introduktionen!</b>",type = "error",timeout = (4000),layout = "center",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})			
	else
		TriggerServerEvent('dmv:ttcharge')
		theorylock = true
	end
end

RegisterNetEvent('dmv:startttest')
AddEventHandler('dmv:startttest', function()
	openGui()
	Menu.hidden = not Menu.hidden
end)

function startptest()
        if testlock then
			TriggerEvent("pNotify:SendNotification",{text = "<b style='color:red'>Du har ikke færdiggjort introduktionen og teoriprøven!</b>",type = "error",timeout = (4000),layout = "center",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
		else
		    TriggerServerEvent('dmv:ptcharge')
		end
end

RegisterNetEvent('dmv:startptest')
AddEventHandler('dmv:startptest', function()
	onTestBlipp = AddBlipForCoord(-1035.6608886719,-1529.2098388672,5.0820016860962)
	N_0x80ead8e2e1d5d52e(onTestBlipp)
	SetBlipRoute(onTestBlipp, 1)
	onTestEvent = 1
	DamageControl = 1
	SpeedControl = 1
	onPtest = true
	DTut()
end)

function EndDTest()
	if Error > maxErrors then
		TriggerEvent("pNotify:SendNotification",{text = "Du dumpede køreprøven med <font style='color:#f90000'>"..Error.." fejl!</font>",type = "error",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
		onPtest = false
		schoolLock = true
		theorylock = true
		testlock = true
		EndTestTasks()
	else
		--local licID = 1
		TriggerServerEvent('dmv:success')
		onPtest = false
		TestDone = true
		theorylock = true
		testlock = false
		TriggerEvent("pNotify:SendNotification",{text = "Du bestod køreprøven med <font style='color:#4E9350'>"..Error.." fejl</font>, tillykke!",type = "success",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
		EndTestTasks()
	end
end

function EndTestTasks()
	onTestBlipp = nil
	onTestEvent = 0
	DamageControl = 0
	Error = 0
	TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
	Wait(1000)
	CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
	lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
	SetVehicleDoorsLocked(CarTargetForLock, 2)
	SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)
	SetEntityAsMissionEntity(CarTargetForLock, true, true)
	Wait(2000)
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( CarTargetForLock ) )
end

function SpawnTestCar()
	Citizen.Wait(0)
	local vehicle = GetHashKey('blista')
	local myPed = GetPlayerPed(-1)
	local i = 0
	while not HasModelLoaded(vehicle) and i < 10000 do
		RequestModel(vehicle)
		Citizen.Wait(10)
		i = i+1
	end

  -- spawn car
  if HasModelLoaded(vehicle) then
    local spawned_car = CreateVehicle(vehicle, -1023.114,-1520.862,5.595,125.388, true, false) -- added player heading
    SetVehicleOnGroundProperly(spawned_car)
    SetEntityInvincible(spawned_car,false)
    SetPedIntoVehicle(myPed,spawned_car,-1) -- put player inside
    SetVehicleNumberPlateText(spawned_car, "SKOLEBIL")
    SetEntityAsMissionEntity(spawned_car, true, true) -- set as mission entity
	CruiseControl = 0
	DTutOpen = false
	SetEntityVisible(myPed, true)
	SetVehicleDoorsLocked(GetCar(), 4)
	FreezeEntityPosition(myPed, false)

	Citizen.CreateThread(function()
		Citizen.Wait(1000)
		TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
	end)
		SetModelAsNoLongerNeeded(vehicle)
	end
end

function DIntro()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	DTutOpen = true
		SetEntityCoords(myPed,173.01181030273, -1391.4141845703, 29.408880233765,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Køreskole introduktion</b> <br /><br />Teori og praksis er begge vigtige elementer i køreundervisningen.<br />Denne introduktion vil dække det basale og sikre dig at du er forberedt med nok information og viden til din teori- og køreprøve.<br /><br />Din viden fra din teori-undervisning kombineret med din køre-undervisning er afgørende for hvordan du håndterer situationer og dilemmaer, som du støder på i trafikken.<br /><br />Sæt dig til rette og nyd introduktionen. Det anbefales kraftigt at du er opmærksom på alle deltajer, da de danner grundlag for din teori-prøve.",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(16500)
		SetEntityCoords(myPed,-428.49026489258, -993.306640625, 46.008815765381,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Uheld, hændeser og miljøhensyn</b><br /><br /><b style='color:#87CEFA'>Pligter under kørslen</b><br />Alle trafikanter har pligt til at følge færdselsreglerne, for at undgå ulykker og skader på andre trafikanter.<br /><br /> Når du hører en sirene nærme sig, skal du give førsteret til udrykningskøretøjet, ved f.eks. at holde til højre.<br />Du ska altid stoppe hvis en politi-/trafik-betjent beder dig om det.<br /><br /><b style='color:#87CEFA'>Aggressiv kørsel</b><br />Et køretøj der er til fare for trafikken eller er til fare for andre mennesker eller ejendomme, anses for at være en aggressiv bilist.<br />Aggressiv kørsel kan også fører til tragiske uæykker.  Det er langt klogere at køre defensivt og være på udkig efter potentielle risici for ulykker.<br />",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(16500)
		SetEntityCoords(myPed,-282.55557250977, -282.55557250977, 31.633310317993,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>By-område</b> <br /><br /> Oprethold en passede fart i by-zonen; aldrig hurtigere end den tilladte hastighedsgrænse og selvfølgelig langsommere hvis der er meget trafik.<br /><br />Hold altid din bane og lad vær med at parkere ved røde streger. Ved gule streger må du standse i 2 minutter.<br /><br />Oprethold en sikker distance til den forankørende.<br /><br />Hastighedsgrænsen i by-zonen er opgivet til 50 km/t.<br />",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })	
		Citizen.Wait(16500)
		SetEntityCoords(myPed,246.35220336914, -1204.3403320313, 43.669715881348,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Landevej</b> <br /><br />På en landevej eller ved mindre bebyggede områder er den tilladte hastighedsgrænse på 80 km/t.<br />Overskridelsen af denne hastighedsgrænse ifm. vejens forløb og tilstand kan der være risiko vor uheld. <br /><br />Du skal altid nedsætte hastigheden hvis du:<br /><br />&bull; Ser fodgængere eller børn<br />&bull; Kører om natten, da det kan være svært at se vejen og fodgængere<br />&bull; Hvis vejrforholdet gøre det mere sikkert<br /><br />Husk, større køretøjer skal bruge en længere distance for at bremse op<br />",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(16500)
		SetEntityCoords(myPed,-138.413, -2498.53, 52.2765,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Motorvej</b> <br /><br />Trafikken på motorvejen kører normalt meget hurtigere end på andre veje og det betyder at din reaktionstid bliver mindre.<br />Det er specielt vigtigt at bruge dine sanser tidligere og se længere frem end du ville gøre i andre kørsels-zoner.<br /><br />Hold øje med trafikken på motorvejen og tilpas din hastighed herefter. Du må selvfølgelig ikke overskride hastighedsgrænsen.<br /><br />Hastighedsgrænsen på motorvejen er opgivet til 130 km/t.<br />",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })				
		Citizen.Wait(16500)		
		SetEntityCoords(myPed,-1035.826, -1554.919 ,23.599,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Spiritus</b> <br /><br />Påvirkning af spiritus under kørslen er meget farligt. Spiritus og/andre stoffer forringer din dømmekraft. Forringet dømmekraft påvirker din reaktion til lyde og til dit syn. Imidlertid, er det dog lovligt at køre med en vidst alkoholpromille.<br /><br />En alkoholpromille på 0.5‰ er den tilladte grænse for alkohol koncetrantionen i blodet.<br />",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })				
		Citizen.Wait(16500)			
		SetEntityCoords(myPed,-1015.874,-1515.454,6.510,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{text = "Introduktionen er nu afsluttet.", type = "success",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})			
		SetEntityVisible(myPed, true)
		FreezeEntityPosition(myPed, false)
		DTutOpen = false
end

function DTut()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	DTutOpen = true
		SetEntityCoords(myPed,-1023.114,-1520.862,5.595,125.388,true, false, false,true)
	    SetEntityHeading(myPed, 125.388)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Køreskolelærer:</b> <br /><br /> Vi forbereder i øjeblikket din skolevogn til køreprøven, imens kan du læse nogle få vigtige linjer.<br /><br /><b style='color:#87CEFA'>Hastighedsgrænse:</b><br />- Vær opmærksom på trafikken og hold dig under <b style='color:#A52A2A'>hastigheds</b> grænsen<br /><br />- Nu kender du det grundlæggende, men vi vil forsøge at påmind dig, når du <b style='color:#DAA520'>køre ind i/køre ud af</b> et område med en skiltet hastighedsgrænse",
            type = "alert",
            timeout = (15000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(15200)
		SpawnTestCar()
		DTutOpen = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local ped = GetPlayerPed(-1)
		if HasEntityCollidedWithAnything(veh) and DamageControl == 1 then
		
		--Notification
		TriggerEvent("pNotify:SendNotification",{text = "Bilen fik en <b style='color:#B22222'>skade!</b><br /><br />Pas på!", type = "alert",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})			
		Citizen.Wait(1000)
		Error = Error + 1	
		elseif(IsControlJustReleased(1, 23)) and DamageControl == 1 then
		--Notification
		TriggerEvent("pNotify:SendNotification",{text = "Du kan <b style='color:#B22222'>ikke</b> forlade køretøjet under køreprøven",type = "alert",timeout = (4000), layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})	
    	end
		
		if onTestEvent == 1 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1035.6608886719,-1529.2098388672,5.0820016860962, true) > 4.0001 then
			   DrawMarker(1,-1035.6608886719,-1529.2098388672,3.8,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1018.8063964844,-1632.6959228516,4.5767226219177)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Kør til <b style='color:#ddf904'>næste</b> punkt.",type = "alert",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				TriggerEvent("pNotify:SendNotification",{text = "Husk sikkerhedsselen. Den aktiverer du ved at trykke på <b style='color:#ddf904'>Z</b>.",type = "info",timeout = (16000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

				onTestEvent = 2
			end
		end
		
		if onTestEvent == 2 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1018.8063964844,-1632.6959228516,4.5767226219177, true) > 4.0001 then
			   DrawMarker(1,-1018.8063964844,-1632.6959228516,3.3,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1095.9360351563,-1563.6368408203,4.371413230896)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Kør til <b style='color:#ddf904'>næste</b> punkt.",type = "alert",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	

				onTestEvent = 3		
			end
		end
		
		if onTestEvent == 3 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1095.9360351563,-1563.6368408203,4.371413230896, true) > 4.0001 then
			   DrawMarker(1,-1095.9360351563,-1563.6368408203,3.1,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1059.0584716797,-1528.6171875,5.0726861953735)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
			
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Vi holder lige et <b style='color:#ddf904'>stop</b> for fodgængerfeltet.", type = "info", timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

				PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
				Citizen.Wait(4000)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Lad os <b style='color:#ddf904'>rulle!</b>",type = "info",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				onTestEvent = 4
			end
		end	
		
		if onTestEvent == 4 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1059.0584716797,-1528.6171875,5.0726861953735, true) > 4.0001 then
			   DrawMarker(1,-1059.0584716797,-1528.6171875,3.8,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1087.4689941406,-1463.4940185547,5.1243143081665)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "<b style='color:#ddf904'>Stop</b> og orienter dig til begge sider før du kører videre",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
				
				PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
				Citizen.Wait(6000)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
				
				--Notifications
				TriggerEvent("pNotify:SendNotification",{text = "Kør til <b style='color:#ddf904'>venstre</b>.",type = "info",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				TriggerEvent("pNotify:SendNotification",{text = "Område: <font style='color:#ddf904'>Byzone</font> | <font style='color:#ddf904'>Fartgrænse</font> 50 km/t<br><font style='color:#afafaf'>Fejl</font> ".. Error.."/"..maxErrors,type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				
				SpeedControl = 2
				onTestEvent = 5
				Citizen.Wait(4000)
			end
		end	
		
		if onTestEvent == 5 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1087.4689941406,-1463.4940185547,5.1243143081665, true) > 4.0001 then
			   DrawMarker(1,-1087.4689941406,-1463.4940185547,3.9,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1273.4068603516,-941.32183837891,11.261880874634)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Husk også at <b style='color:#ddf904'>stoppe</b> for lyskryds, når der er rødt.", type = "info", timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

				PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
				Citizen.Wait(4000)
				FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
				
				--Notification
				TriggerEvent("pNotify:SendNotification",{text = "Lad os <b style='color:#ddf904'>fortsætte!</b>",type = "info",timeout = (3000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				
				onTestEvent = 6
			end
		end	

		if onTestEvent == 6 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1273.4068603516,-941.32183837891,11.261880874634, true) > 4.0001 then
			   DrawMarker(1,-1273.4068603516,-941.32183837891,9.7,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1185.0174560547,-856.97100830078,14.152346611023)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				onTestEvent = 7
			end
		end		
			
		
			if onTestEvent == 7 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1185.0174560547,-856.97100830078,14.152346611023, true) > 4.0001 then
			   DrawMarker(1,-1185.0174560547,-856.97100830078,12.8,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1097.0610351563,-776.57019042969,19.325546264648)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				--Notifications
				onTestEvent = 8
			end
		end			
		
		if onTestEvent == 8 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1097.0610351563,-776.57019042969,19.325546264648, true) > 4.0001 then
			   DrawMarker(1,-1097.0610351563,-776.57019042969,18.1,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1114.3015136719,-689.12902832031,20.911766052246)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				onTestEvent = 9
			end
		end			
		
		if onTestEvent == 9 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1114.3015136719,-689.12902832031,20.911766052246, true) > 4.0001 then
			   DrawMarker(1,-1114.3015136719,-689.12902832031,19.7,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1037.0772705078,-627.93316650391,18.381990432739)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				 --Notifications
				TriggerEvent("pNotify:SendNotification",{text = "Tid til at ramme <b style='color:#ddf904'>motorvejen. <br>Husk</b> at øge din hastighed for ikke at skabe uheld.",type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				
				PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
				 --Notifications
				
				TriggerEvent("pNotify:SendNotification",{text = "Område: <font style='color:#ddf904'>Motorvej</font> | <font style='color:#ddf904'>Fartgrænse</font> 130 km/t<br><font style='color:#afafaf'>Fejl</font> ".. Error.."/"..maxErrors,type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				onTestEvent = 10
				SpeedControl = 3
			end
		end		

		if onTestEvent == 10 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1037.0772705078,-627.93316650391,18.381990432739, true) > 4.0001 then
			   DrawMarker(1,-1037.0772705078,-627.93316650391,17.1,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(1020.9411621094,-1072.1005859375,37.09041595459)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				onTestEvent = 11
				Citizen.Wait(4000)
			end
		end		

		if onTestEvent == 11 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1020.9411621094,-1072.1005859375,37.09041595459, true) > 4.0001 then
			   DrawMarker(1,1020.9411621094,-1072.1005859375,35.8,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(744.21990966797,-1162.1119384766,44.965244293213)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				onTestEvent = 12
			end
		end
		
		if onTestEvent == 12 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),744.21990966797,-1162.1119384766,44.965244293213, true) > 4.0001 then
			   DrawMarker(1,744.21990966797,-1162.1119384766,43.7,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(814.29040527344,-1144.1585693359,28.876329421997)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				onTestEvent = 13
			end
		end	
		
		if onTestEvent == 13 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),814.29040527344,-1144.1585693359,28.876329421997, true) > 4.0001 then
			   DrawMarker(1,814.29040527344,-1144.1585693359,27.6,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(786.21728515625,-1023.3118896484,26.169235229492)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)			--Notifications
				TriggerEvent("pNotify:SendNotification",{text = "Du kører ind i <b style='color:#ddf904'>byzonen.</b><br>Pas på din hastighed.",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				TriggerEvent("pNotify:SendNotification",{text = "Område: <font style='color:#ddf904'>Byzone</font> | <font style='color:#ddf904'>Fartgrænse</font> 50 km/t<br><font style='color:#afafaf'>Fejl</font> ".. Error.."/"..maxErrors,type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				onTestEvent = 14
				SpeedControl = 2
			end
		end	
		
		if onTestEvent == 14 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),786.21728515625,-1023.3118896484,26.169235229492, true) > 4.0001 then
			   DrawMarker(1,786.21728515625,-1023.3118896484,24.9,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1066.8322753906,-777.30084228516,19.338710784912)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)		     

				onTestEvent = 15
			end
		end		
		
		if onTestEvent == 15 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1066.8322753906,-777.30084228516,19.3387107849121, true) > 4.0001 then
			   DrawMarker(1,-1066.8322753906,-777.30084228516,18.1,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				onTestBlipp = AddBlipForCoord(-1032.4080810547,-1526.9038085938,5.1278986930847)
				N_0x80ead8e2e1d5d52e(onTestBlipp)
				SetBlipRoute(onTestBlipp, 1)
				PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
				--Notifications
				TriggerEvent("pNotify:SendNotification",{text = "Fedt! Lad os køre tilbage til <b style='color:#ddf904'>køreskolen.</b>",type = "info",timeout = (5000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				TriggerEvent("pNotify:SendNotification",{text = "Område: <font style='color:#ddf904'>Byzone</font> | <font style='color:#ddf904'>Fartgrænse</font> 50 km/t<br><font style='color:#afafaf'>Fejl</font> ".. Error.."/"..maxErrors,type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				onTestEvent = 16
			end
		end		

		if onTestEvent == 16 then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1032.4080810547,-1526.9038085938,5.1278986930847, true) > 4.0001 then
			   DrawMarker(1,-1032.4080810547,-1526.9038085938,3.8,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
			else
				if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
				end
				EndDTest()
			end
		end		
	end
end)

----Theory Test NUI Operator

-- ***************** Open Gui and Focus NUI
function openGui()
  onTtest = true
  SetNuiFocus(true)
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    if onTtest then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening
RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  cb('ok')
  --Notifications				
  theorylock = true
  testlock = false
  onTtest = false
end)

RegisterNUICallback('kick', function(data, cb)
  closeGui()
  cb('ok')
  --Notifications
  onTtest = false
  theorylock = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		CarSpeed = GetEntitySpeed(GetCar()) * speed
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 1 and CarSpeed >= speed_limit_resi and onPtest == true then
		TriggerEvent("pNotify:SendNotification",{
            text = "Du kører for hurtigt! <b style='color:#B22222'>Sænk farten!</b><br /><br />Du kører i et <b style='color:#DAA520'>boligområde!</b>",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1	
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 2 and CarSpeed >= speed_limit_town and onPtest == true then
		TriggerEvent("pNotify:SendNotification",{
            text = "Du kører for hurtigt! <b style='color:#B22222'>Sænk farten!</b><br /><br />Du kører i en <b style='color:#DAA520'>byzone!</b>",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 3 and CarSpeed >= speed_limit_freeway and onPtest == true then
		TriggerEvent("pNotify:SendNotification",{
            text = "Du kører for hurtigt! <b style='color:#B22222'>Sænk farten!</b><br /><br />Du kører på <b style='color:#DAA520'>motorvejen!</b>",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1
			Citizen.Wait(10000)
		end
	end
end)


----Theory Test NUI Operator

-- ***************** Open Gui and Focus NUI
function openGui()
  onTtest = true
  SetNuiFocus(true)
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    if onTtest then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
    if DTutOpen then
      local ply = GetPlayerPed(-1)
      local active = true
	  SetEntityVisible(ply, false)
	  FreezeEntityPosition(ply, true)
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
    end
    Citizen.Wait(0)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening
RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  cb('ok')
  --Notifications
  theorylock = true
  testlock = false
  onTtest = false
end)

RegisterNUICallback('kick', function(data, cb)
  closeGui()
  cb('ok')
  --Notifications
   onTtest = false
end)

---------------------------------- DMV PED ----------------------------------

Citizen.CreateThread(function()

  RequestModel(GetHashKey("a_m_y_business_01"))
  while not HasModelLoaded(GetHashKey("a_m_y_business_01")) do
    Wait(1)
  end

  RequestAnimDict("mini@strip_club@idles@bouncer@base")
  while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
    Wait(1)
  end

 	    -- Spawn the DMV Ped
  for _, item in pairs(dmvped) do
    dmvmainped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
    SetEntityHeading(dmvmainped, 137.71)
    FreezeEntityPosition(dmvmainped, true)
	SetEntityInvincible(dmvmainped, true)
	SetBlockingOfNonTemporaryEvents(dmvmainped, true)
    TaskPlayAnim(dmvmainped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

local talktodmvped = true
--DMV Ped interaction
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.5)then
				drawTxt('[~g~E~s~] for at snakke med kørelæreren', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
					if(IsControlJustReleased(1, 38))then
						if talktodmvped then
						    Citizen.Wait(500)
							DMVMenu()
							Menu.hidden = false
							talktodmvped = false
						else
							talktodmvped = true
						end
				end
				Menu.renderGUI(options)
			end
		end
	end
end)

------------
------------ DRAW MENUS
------------
function DMVMenu()
	ClearMenu()
    options.menu_title = "Køreskole"
	Menu.addButton("Start med at tage kørekort","VehLicenseMenu",nil)
    Menu.addButton("Luk","CloseMenu",nil) 
end

function VehLicenseMenu()
    ClearMenu()
    options.menu_title = "Køreskole"
	Menu.addButton("1. Introduktion                   GRATIS","startintro",nil)
	Menu.addButton("2. Teoriprøve                2000 DKK","startttest",nil)
	Menu.addButton("3. Køreprøve                5000 DKK","startptest",nil)
    Menu.addButton("Tilbage","DMVMenu",nil) 
end

function CloseMenu()
		Menu.hidden = true
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

----------------
----------------blip
----------------



Citizen.CreateThread(function()
	pos = dmvschool_location
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip,408)
	SetBlipColour(blip,11)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Køreskole')
	SetBlipScale(blip, 0.8)
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
end)