
vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
	local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
	SetVehicleHasBeenOwnedByPlayer(v,false)
	SetEntityAsMissionEntity(v, false, true) -- set not as mission entity
	SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
	DeleteEntity(v)
end

local vehshop = {
	opened = false,
	title = "Bilforhandler",
	currentmenu = "Bilforhandler",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.2,
		y = 0.08,
		width = 0.25,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["Bilforhandler"] = {
			title = "Bilforhandler",
			name = "Bilforhandler",
			buttons = {
				{name = "Biler", description = ""},
				{name = "Motorcykler", description = ""},
				{name = "Cykler", description = ""},
				{name = "Tilbuds biler", description = ""},
				{name = "Tilbuds motorcykler", description = ""}
			}
		},
		["Biler"] = {
			title = "Biler",
			name = "Biler",
			buttons = {
				{name = "Audi", description = ''},
				{name = "Mercedes", description = ''},
				{name = "BMW", description = ''},
				{name = "Luksus", description = ''},
				{name = "Porsche", description = ''},
				{name = "Andre", description = ''},
				--{name = "Ugens Biler", description = ''},
				--{name = "Ugens Tilbud", description = ''},
				--{name = "suvs", description = ''},
				{name = "Ferrari", description = ''},
				--{name = "cycles", description = ''},
			}
		},
		["Tilbuds biler"] = {
			title = "Tilbuds biler",
			name = "Tilbuds biler",
			buttons = {
				{name = "Baller LE LWB", costs = 1850000, description = {}, model = "baller4"},
				{name = "Dominator GTX", costs = 2500000, description = {}, model = "dominator3"},
				{name = "Maserati Ghibli S", costs = 7500000, description = {}, model = "ghibli"}
			}
		},
		["Tilbuds motorcykler"] = {
			title = "Tilbuds motorcykler",
			name = "Tilbuds motorcykler",
			buttons = {
				{name = "Randers knallert", costs = 60000, description = {}, model = "faggio"}
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "Audi RS6 C7", costs = 4700000, description = {}, model = "rs6"},
				{name = "Audi RS5", costs = 3700000, description = {}, model = "rs5"},
				{name = "Audi S4", costs = 2700000, description = {}, model = "s4avant"},
				{name = "Audi RS4", costs = 2700000, description = {}, model = "rs4avant"},
				{name = "Audi S8", costs = 2300000, description = {}, model = "audis8om"},
				{name = "Audi SQ7", costs = 2000000, description = {}, model = "sq72016"},
				{name = "Audi RS3", costs = 2700000, description = {}, model = "rs318"},

			}
		},
		["Mercedes"] = {
			title = "Mercedes",
			name = "Mercedes",
			buttons = {
				{name = "Mercedes A45 AMG", costs = 700000, description = {}, model = "a45amg"},
				{name = "Mercedes CLA45 AMG", costs = 1600000, description = {}, model = "cla45sb"},
				{name = "Mercedes C63s AMG", costs = 2300000, description = {}, model = "c63s"},
				{name = "Mercedes E63s", costs = 2600000, description = {}, model = "e63w213"},
				--{name = "Mercedes E63 AMG", costs = 2700000, description = {}, model = "e63amg"},
				{name = "Mercedes S65 AMG", costs = 2000000, description = {}, model = "S65"},
				{name = "Mercedes S500", costs = 1800000, description = {}, model = "s500w222"},
				{name = "Mercedes GL63", costs = 1800000, description = {}, model = "gl63"},
				{name = "Mercedes Brabus", costs = 3200000, description = {}, model = "mlbrabus"},
				{name = "Mercedes-Benz G65 AMG", costs = 1500000, description = {}, model = "g65amg"},


			}
		},
		["Luksus"] = {
			title = "Luksus",
			name = "Luksus",
			buttons = {
				{name = "Ford Mustang GT", costs = 1900000, description = {}, model = "mgt"},
				{name = "Jaguar F Pace", costs = 5200000, description = {}, model = "fpace"},
				{name = "Chevrolet Camaro", costs = 4200000, description = {}, model = "zl12017"},
				{name = "Dodge Charger SXT", costs = 4000000, description = {}, model = "16charger"},
				{name = "Dodge Challenger Demon", costs = 4600000, description = {}, model = "demon"},
				{name = "Bentley Bentayga Lumma", costs = 4500000, description = {}, model = "urus"},
				{name = "GMC Yukon Denali", costs = 2000000, description = {}, model = "gmcyd"},
				{name = "Chevrolet Corvette", costs = 2900000, description = {}, model = "c7"},
				{name = "Nissan Titan", costs = 1500000, description = {}, model = "titan17"},
				{name = "Nissan GTR", costs = 5200000, description = {}, model = "gtr"},
				{name = "MCLaren", costs = 16300000, description = {}, model = "p1"},
				{name = "MCLaren 720s", costs = 10000000, description = {}, model = "720s"},
				{name = "Lamborghini Huracan LP610", costs = 5300000, description = {}, model = "hurper"},
				{name = "Lamborghini Centenario", costs = 7500000, description = {}, model = "lp770"},
				{name = "Lamborghini Aventador", costs = 7500000, description = {}, model = "sv"},
				{name = "Maserati Quattro Porte", costs = 4000000, description = {}, model = "mqgts"},
				{name = "Rolls-Royce Wraith", costs = 5300000, description = {}, model = "wraith"},
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Porsche 911 GT3 RS", costs = 4500000, description = {}, model = "911gtrs"},
				{name = "Porsche 718 Boxster S", costs = 3700000, description = {}, model = "718boxster"},
				{name = "Porsche Cayenne Turbo S", costs = 4200000, description = {}, model = "cayenne"},
				{name = "Porsche Macan Turbo", costs = 3400000, description = {}, model = "macan"},
				{name = "Porsche Panamera Turbo", costs = 7600000, description = {}, model = "panamera17turbo"},

			}
		},
		["Andre"] = {
			title = "Andre",
			name = "Andre",
			buttons = {
				{name = "Volvo S60", costs = 150000, description = {}, model = "s60pole"},
				{name = "VW Touran", costs = 300000, description = {}, model = "vwtouran"},
				{name = "Ford Focus", costs = 600000, description = {}, model = "st"},
				{name = "Suzuki Swift", costs = 30000, description = {}, model = "suzuswift"},
				{name = "Citroën C4", costs = 50000, description = {}, model = "citroc4"},
				{name = "Peugeot 108", costs = 50000, description = {}, model = "peug108"},
				--{name = "Peugeot 207", costs = 20000, description = {}, model = "p207"},
				{name = "Kia Stinger", costs = 650000, description = {}, model = "kiagt"},
				{name = "Varevogn", costs = 100000, description = {}, model = "Youga"},
				{name = "Honda Civic SI99", costs = 100000, description = {}, model = "civic"},
				{name = "Hyundai Santa Fe", costs = 350000, description = {}, model = "santafe"},

			}
		},
		["Ferrari"] = {
			title = "Ferrari",
			name = "Ferrari",
			buttons = {
				{name = "Ferrari 488 GTB", costs = 8200000, description = {}, model = "4881"},
				{name = "Ferrari LaFerrari", costs = 11000000, description = {}, model = "aperta"},
				{name = "Ferrari 812", costs = 7200000, description = {}, model = "f812"},

			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "BMW 440i", costs = 2300000, description = {}, model = "440i"},
				{name = "BMW i8", costs = 7400000, description = {}, model = "i8"},
				{name = "BMW M2 F87", costs = 1900000, description = {}, model = "m2f22"},
				{name = "BMW M3 E92", costs = 2100000, description = {}, model = "e92"},
				{name = "BMW M5 Touring", costs = 2300000, description = {}, model = "16m5"},
				{name = "BMW M3 E30", costs = 400000, description = {}, model = "m3e30"},
				{name = "BMW M4 F82", costs = 3400000, description = {}, model = "m4f82"},
				{name = "BMW X5M", costs = 2500000, description = {}, model = "x5m2016"},
				{name = "BMW X6M F16", costs = 2700000, description = {}, model = "x6m"},

			}
		},
		["Motorcykler"] = {
			title = "Motorcykler",
			name = "Motorcykler",
			buttons = {
				{name = "Yamaha YZF R6", costs = 800000, description = {}, model = "r6"},
				{name = "KTM EXC F250", costs = 200000, description = {}, model = "exc250sm"},
			}
		},
		["Cykler"] = {
			title = "Cykler",
			name = "Cykler",
			buttons = {
				{name = "BMX", costs = 6000, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 9500, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 6000, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 9000, description = {}, model = "scorcher"},
				{name = "Tribike 1", costs = 14500, description = {}, model = "tribike"},
				{name = "Tribike 2", costs = 14500, description = {}, model = "tribike2"},
				{name = "Tribike 3", costs = 14500, description = {}, model = "tribike3"},
			}
		}
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
	{entering = {-33.803,-1102.322,25.422}, inside = {-32.239929199219,-1090.1534423828,26.422235488892,156.01826477051}, outside = {-17.242038726807,-1109.6545410156,26.672069549561,161.03179931641}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function DrawText3d(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())

	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 370
	DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		vehSR_ShowVehshopText(true)
		firstspawn = 1
	end
end)

function vehSR_ShowVehshopText(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Bilforhandler")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 3 then
						DrawText3d(-33.803,-1102.322,26.422, "Tryk [~g~E~s~] For at se på bilerne")
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	SetEntityCoords(ped,pos[1],pos[2],pos[3])
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "Bilforhandler"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-17.242038726807,-1109.6545410156,26.672069549561,161.03179931641})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
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

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,51) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
							vehSR_drawMenuRight(button.costs.." DKK",0.174,y,selected)
						if vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Luksus" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "Ugens Biler" or vehshop.currentmenu == "Ugens Tilbud" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "Motorcykler" or vehshop.currentmenu == "Cykler" then
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
						if vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Luksus" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "Ugens Biler" or vehshop.currentmenu == "Ugens Tilbud" or vehshop.currentmenu == "Ferrari" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "Motorcykler" or vehshop.currentmenu == "Cykler" then
						 if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									DeleteEntity(fakecar.car)
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 25 do
										Citizen.Wait(1)
										vehSR_drawTxt("Indlæsning mislykkedes...",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "Bilforhandler" then
		if btn == "Biler" then
			vehSR_OpenMenu('Biler')
		elseif btn == "Motorcykler" then
			vehSR_OpenMenu('Motorcykler')
		elseif btn == "Cykler" then
			vehSR_OpenMenu('Cykler')
		elseif btn == "Tilbuds biler" then
			vehSR_OpenMenu('Tilbuds biler')
		elseif btn == "Tilbuds motorcykler" then
			vehSR_OpenMenu('Tilbuds motorcykler')
		end
	elseif this == "Biler" then
		if btn == "Luksus" then
			vehSR_OpenMenu('Luksus')
		elseif btn == "BMW" then
			vehSR_OpenMenu('BMW')
		elseif btn == "Audi" then
			vehSR_OpenMenu('Audi')
		elseif btn == "Mercedes" then
			vehSR_OpenMenu('Mercedes')
		elseif btn == "Porsche" then
			vehSR_OpenMenu("Porsche")
		elseif btn == "Andre" then
			vehSR_OpenMenu('Andre')
		elseif btn == "Ugens Biler" then
			vehSR_OpenMenu('Ugens Biler')
		elseif btn == "Ugens Tilbud" then
			vehSR_OpenMenu('Ugens Tilbud')
		elseif btn == "Ferrari" then
			vehSR_OpenMenu('Ferrari')
		end
	elseif this == "Tilbuds biler" or this == "Audi" or this == "Mercedes" or this == "BMW" or this == "Luksus" or this == "Porsche" or this == "Andre" or this == "Ugens Biler" or this == "Ugens Tilbud" or this == "Ferrari" or this == "industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"car")
    elseif this == "Motorcykler" or this == "Tilbuds motorcykler" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"bike")
    elseif this == "Cykler" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"citybike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Biler" then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Motorcykler"  then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == 'Cykler' then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Tilbuds biler"  then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Tilbuds motorcykler" then
		vehshop.lastmenu = "Bilforhandler"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "Bilforhandler" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Audi" or vehshop.currentmenu == "Mercedes" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Luksus" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Andre" or vehshop.currentmenu == "Ugens Biler" or vehshop.currentmenu == "Ugens Tilbud" or vehshop.currentmenu  == "Ferrari" or vehshop.currentmenu == "industrial" or vehshop.currentmenu ==  "Motorcykler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Cykler" then
		if DoesEntityExist(fakecar.car) then
			DeleteEntity(fakecar.car)
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end