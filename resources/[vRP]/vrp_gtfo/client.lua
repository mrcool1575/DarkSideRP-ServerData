--[[-----------------
	vRP_doorsControl By XanderWP from Ukraine with <3
------------------------]]--
local LockHotkey = {0,38}

doorList = {
	-- Politistationer
		[1] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true},
		[2] = { ["ishash"] = 0, ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true},
		[3] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true},
		[4] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true},
		[5] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -989.705,["z"]= 30.6896,["locked"]= true},
		[6] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 464.0, ["y"]= -992.265,["z"]= 24.9149,["locked"]= true},
		[7] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true},
		[8] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true},
		[9] = { ["ishash"] = 0, ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true},
		[10] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor", ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true},
		[11] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor", ["x"]= 464.18, ["y"]= -1004.31,["z"]= 24.9152,["locked"]= true},
		[12] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true},
		[13] = { ["ishash"] = 0, ["objName"] = "v_ilev_gtdoor02", ["x"]= 462.979, ["y"]= -984.163,["z"]= 43.6919,["locked"]= true},
		[14] = { ["ishash"] = 1, ["objName"] = 320433149, ["x"]= 99999, ["y"]= -99999,["z"]= 99999,["locked"]= false},
		[15] = { ["ishash"] = 1, ["objName"] = -1215222675, ["x"]= 99999, ["y"]= -99999,["z"]= 99999,["locked"]= true},
		[16] = { ["ishash"] = 1, ["objName"] = -131296141, ["x"]= 443.0298, ["y"]= -993.5412,["z"]= 30.8393,["locked"]= true},
		[17] = { ["ishash"] = 1, ["objName"] = -131296141, ["x"]= 443.0298, ["y"]= -992.941,["z"]= 30.8393,["locked"]= true},
		[18] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 468.3716, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true},
		[19] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 468.9679, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true},
		[20] = { ["ishash"] = 1, ["objName"] = -2023754432, ["x"]= 452.6248, ["y"]= -987.3626,["z"]= 30.83926,["locked"]= true},
		[21] = { ["ishash"] = 1, ["objName"] = 749848321, ["x"]= 461.2865, ["y"]= -985.3206,["z"]= 30.83926,["locked"]= true},
		[22] = { ["ishash"] = 0, ["objName"] = "v_ilev_shrfdoor", ["x"]= 1855.105, ["y"]= 3683.516,["z"]= 34.266,["locked"]= true},

	-- Hospitalet
		[23] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 253.93524169922, ["y"]= -1360.0373535156,["z"]= 24.537809371948,["locked"]= true},
		[24] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_firedoorwide", ["x"]= 271.64025878906, ["y"]= -1361.0727539063,["z"]= 24.537803649902,["locked"]= true}, 
		[25] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_firedoorwide", ["x"]= 265.51382446289, ["y"]= -1362.8316650391,["z"]= 24.5378074646,["locked"]= true},
		[26] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 253.26365661621, ["y"]= -1360.9027099609,["z"]= 24.537809371948,["locked"]= true},
		[27] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 256.78393554688, ["y"]= -1348.3902587891,["z"]= 24.537803649902,["locked"]= true},	 
		[28] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 266.32699584961, ["y"]= -1345.3035888672,["z"]= 24.537809371948,["locked"]= true},
		[29] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 282.44570922852, ["y"]= -1342.2663574219,["z"]= 24.537809371948,["locked"]= true},
		[30] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassb", ["x"]= 286.68811035156, ["y"]= -1344.5770263672,["z"]= 24.537809371948,["locked"]= true},	 
		[31] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 286.06695556641, ["y"]= -1345.3585205078,["z"]= 24.537809371948,["locked"]= true,},
		[32] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 283.08840942383, ["y"]= -1341.5966796875,["z"]= 24.537809371948,["locked"]= true},
		[33] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 267.06994628906, ["y"]= -1344.4372558594,["z"]= 24.537788391113,["locked"]= true},
		[34] = { ["ishash"] = 0, ["objName"] = "v_ilev_cor_doorglassa", ["x"]= 255.89952087402, ["y"]= -1347.6993408203,["z"]= 39.534374237061,["locked"]= true},	

	-- Skummel lejlighed
		[35] = { ["ishash"] = 0, ["objName"] = "v_ilev_janitor_frontdoor", ["x"]=-107.28658294678, ["y"]=-8.3825073242188,["z"] = 70.525100708008, ["locked"]=true},
		
	-- Michaels hus
		[36] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doorm_r", ["x"]= -816.34075927734, ["y"]= 178.02558898926,["z"]= 72.227691650391,["locked"]= true},
		[37] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doorm_l", ["x"]= -816.58001708984, ["y"]= 178.50416564941,["z"]= 72.227813720703,["locked"]= true},	 
		[38] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_door", ["x"]= -807.15789794922, ["y"]= 185.71429443359,["z"]= 72.484481811523,["locked"]= true},
		[39] = { ["ishash"] = 0, ["objName"] = "prop_bh1_48_backdoor_l", ["x"]=-793.64440917969, ["y"]= 181.22857666016,["z"]= 72.83528137207,["locked"]= true},
		[40] = { ["ishash"] = 0, ["objName"] = "prop_bh1_48_backdoor_l", ["x"]=-796.09320068359, ["y"]= 177.35055541992,["z"]= 72.835258483887,["locked"]= true},
		[41] = { ["ishash"] = 0, ["objName"] = "prop_bh1_48_backdoor_r", ["x"]= -795.15954589844, ["y"]= 177.74322509766,["z"]= 72.835266113281,["locked"]= true},	 
		[42] = { ["ishash"] = 0, ["objName"] = "prop_bh1_48_backdoor_r", ["x"]= -793.95068359375, ["y"]=182.0545501709,["z"]= 72.835350036621,["locked"]= true},
		[43] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doorson", ["x"]=-806.5517578125, ["y"]= 173.26977539063,["z"]= 76.740684509277,["locked"]= true},
		[44] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doordaughter", ["x"]= -803.38580322266, ["y"]= 175.837890625,["z"]= 76.740699768066,["locked"]= true},	 
		[45] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doorw", ["x"]= -810.033203125, ["y"]=177.47737121582,["z"]= 76.740783691406,["locked"]= true},
		[46] = { ["ishash"] = 0, ["objName"] = "v_ilev_mm_doorw", ["x"]= -804.22302246094, ["y"]=172.21383666992,["z"]= 76.740455627441,["locked"]= true},
		[47] = { ["ishash"] = 0, ["objName"] = "prop_bh1_48_gate_1", ["x"]= -848.94976806641, ["y"]=178.50018310547,["z"]= 69.815139770508,["locked"]= true},
		[48] = { ["ishash"] = 1, ["objName"] = -2125423493, ["x"]= -843.4931, ["y"]= 155.8496,["z"]= 66.8763,["locked"]= true},
		
	-- Denice's hus
		[49] = { ["ishash"] = 1, ["objName"] = 520341586, ["x"]= -14.1750, ["y"]= -1440.6750, ["z"]= 31.1015,["locked"]= true},
		
	-- Franklins hus
		[50] = { ["ishash"] = 1, ["objName"] = 308207762, ["x"]= 8.1706, ["y"]= 538.9403, ["z"]= 176.0281,["locked"]= true},
		
	-- The Lost MC
		[51] = { ["ishash"] = 1, ["objName"] = 190770132, ["x"]= 981.9177, ["y"]= -103.1663, ["z"]= 74.8487,["locked"]= true},
		
	-- Lesters hus
		[52] = { ["ishash"] = 1, ["objName"] = 1145337974, ["x"]= 1274.7567, ["y"]= -1720.9866, ["z"]= 54.6807,["locked"]= true},
		
	-- Floyds lejlighed
		[53] = { ["ishash"] = 1, ["objName"] = -607040053, ["x"]= -1149.8902, ["y"]= -1521.6926, ["z"]= 10.6280,["locked"]= true},
		
	-- Trevors trailer
		[54] = { ["ishash"] = 1, ["objName"] = 132154435, ["x"]= 1973.3065, ["y"]= 3815.7919, ["z"]= 33.5102,["locked"]= true},
		
	-- Sandyshore jail
		[55] = { ["ishash"] = 1, ["objName"] = -1033001619, ["x"]= 1864.214, ["y"]= 3669.902,["z"]= -116.789,["locked"]= true},
		[56] = { ["ishash"] = 1, ["objName"] = -1033001619, ["x"]= 1866.419, ["y"]= 3671.670,["z"]= -116.789,["locked"]= true},
		[57] = { ["ishash"] = 1, ["objName"] = -725970636, ["x"]= 1862.783, ["y"]= 3672.248,["z"]= -116.789,["locked"]= true},
		[58] = { ["ishash"] = 1, ["objName"] = -642608865, ["x"]= 1846.403, ["y"]= 3662.672,["z"]= -116.789,["locked"]= true},
		[59] = { ["ishash"] = 1, ["objName"] = -642608865, ["x"]= 1852.128, ["y"]= 3665.897,["z"]= -116.789,["locked"]= true},
		[60] = { ["ishash"] = 1, ["objName"] = -642608865, ["x"]= 1857.671, ["y"]= 3668.900,["z"]= -116.789,["locked"]= true},
		
	-- Paleto PD
		[61] = { ["ishash"] = 1, ["objName"] = -1501157055, ["x"]= -444.123, ["y"]= 6016.644,["z"]= 31.716,["locked"]= true},
		[62] = { ["ishash"] = 1, ["objName"] = -1501157055, ["x"]= -442.938, ["y"]= 6015.612,["z"]= 31.715,["locked"]= true},
	-- Fængslet
	
		[63] = { ["ishash"] = 1, ["objName"] = 1526539404, ["x"]= 1729.0032, ["y"]= 2561.4580,["z"]= 45.5648,["locked"]= true},
		[64] = { ["ishash"] = 1, ["objName"] = 1526539404, ["x"]= 1691.6375, ["y"]= 2563.22607,["z"]= 45.5648,["locked"]= true},
		[65] = { ["ishash"] = 1, ["objName"] = -875157772, ["x"]= 1791.1616, ["y"]= 2604.7575,["z"]= 45.5649,["locked"]= true},
		[66] = { ["ishash"] = 1, ["objName"] = 1526539404, ["x"]= 1729.5678, ["y"]= 2560.8098, ["z"]= 45.5648,["locked"]= true},
		[67] = { ["ishash"] = 1, ["objName"] = 1526539404, ["x"]= 1637.3316, ["y"]= 2562.8107, ["z"]= 45.5648,["locked"]= true},
		
		
	-- Retssalen   238.26298522949,-421.62768554688,-118.46513366699
		[68] = { ["ishash"] = 1, ["objName"] = 110411286, ["x"]= 233.0989, ["y"]= -415.5225,["z"]= -118.4650,["locked"]= true},
		[69] = { ["ishash"] = 1, ["objName"] = 110411286, ["x"]= 234.3769, ["y"]= -416.1180,["z"]= -118.4651,["locked"]= true},
		[70] = { ["ishash"] = 1, ["objName"] = 110411286, ["x"]= 238.9955, ["y"]= -420.4943,["z"]= -118.4651,["locked"]= true},
		[71] = { ["ishash"] = 1, ["objName"] = 110411286, ["x"]= 238.2629, ["y"]= -421.6276,["z"]= -118.4651,["locked"]= true},
		[72] = { ["ishash"] = 1, ["objName"] = 34120519,  ["x"]= 227.5726, ["y"]= -416.0190,["z"]= -118.4651,["locked"]= true}

}

local firstLoad = false

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

Citizen.CreateThread(function()
    while firstLoad == false do
		TriggerServerEvent('door:load')
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('door:statusSend')
AddEventHandler('door:statusSend', function(i, status)
doorList[i]["locked"]=status
local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)
if heading < -0.01 or heading > 0.01 then
			syncFail = true
			else
			syncFail = false
			end
	if doorList[i]["locked"] == true and syncFail == true then
		FreezeEntityPosition(closeDoor, false)
	else
		FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
	end	
end)

RegisterNetEvent('door:loadSend')
AddEventHandler('door:loadSend', function(doorL)
	for i,v in pairs(doorL) do

		doorList[i]["locked"]=v.freeze

		local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 2.0, hash, false, false, false)
		locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)

		if heading < -0.01 or heading > 0.01 then
			syncFail = true
		else
			syncFail = false
		end
		if doorList[i]["locked"] == true and syncFail == true then
			FreezeEntityPosition(closeDoor, false)
		else
			FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
		end			
	end
firstLoad = true
end)

local drawTextNow = true
local playerCoords = 0
local playerDistance = 10

Citizen.CreateThread(function()
	while true do
		playerCoords = GetEntityCoords(GetPlayerPed(-1))
		for i = 1, #doorList do

			playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], true)
			if playerDistance < 1.15 then

				if doorList[i]["ishash"] == 0 then
					hash = GetHashKey(doorList[i]["objName"])
				else
					hash = doorList[i]["objName"]
				end

	            local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, hash, false, false, false)
	            locked, heading = GetStateOfClosestDoorOfType(hash, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], locked, heading)

	            SetEntityHealth(closeDoor, 1000)
				ClearEntityLastDamageEntity(closeDoor)
				SetEntityCanBeDamaged(closeDoor, false)

				if doorList[i]["locked"] == true then
					
					drawTxt('~r~LÅST', 0, 1, 0.5, 0.9, 0.5, 255, 255, 255, 255)
					if IsControlJustPressed(table.unpack(LockHotkey)) then	
						Citizen.Wait(250)
						TriggerServerEvent('door:status', i, false)
					end
                else
				
					drawTxt('~g~ÅBEN', 0, 1, 0.5, 0.9, 0.5, 255, 255, 255, 255)
                    if IsControlJustPressed(table.unpack(LockHotkey)) then
						Citizen.Wait(250)
                    	TriggerServerEvent('door:status', i, true)
					end
                end

                if heading < -0.01 or heading > 0.01 then
					syncFail = true
				else
					syncFail = false
				end

                if firstLoad == true then
					if doorList[i]["locked"] == true and syncFail == true then
						FreezeEntityPosition(closeDoor, false)
					else
						FreezeEntityPosition(closeDoor, doorList[i]["locked"])		
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)


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