-- Created by Deziel0495 and IllusiveTea --

-- NOTICE
-- This script is licensed under "No License". https://choosealicense.com/no-license/
-- You are allowed to: Download, Use and Edit the Script. 
-- You are not allowed to: Copy, re-release, re-distribute it without our written permission.

--- DO NOT EDIT THIS
local holstered = true

-- RESTRICTED PEDS --
-- I've only listed peds that have a remote speaker mic, but any ped listed here will do the animations.
local skins = {
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	"s_m_y_hwaycop_01",
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	"s_m_y_ranger_01",
	"s_f_y_ranger_01",
}

-- Add/remove weapon hashes here to be added for holster checks.
local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
}

-- RADIO ANIMATIONS --

Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and CheckSkin(ped) then
			if not IsPauseMenuActive() then 
				loadAnimDict( "random@arrests" )
				if IsControlJustReleased( 0, 19 ) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
					TriggerServerEvent('InteractSound_SV:PlayOnSource', 'off', 0.1)
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
				else
					if IsControlJustPressed( 0, 19 ) and CheckSkin(ped) and not IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
						TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetEnableHandcuffs(ped, true)
					elseif IsControlJustPressed( 0, 19 ) and CheckSkin(ped) and IsPlayerFreeAiming(PlayerId()) then -- INPUT_CHARACTER_WHEEL (LEFT ALT)
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'on', 0.1)
						TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetEnableHandcuffs(ped, true)
					end 
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
						DisableActions(ped)
					elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
						DisableActions(ped)
					end
				end
			end 
		end 
	end
end )

hbh = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(3, 168) then
			if hbh == false then
				loadAnimDict("random@arrests@busted")
				ClearPedSecondaryTask(GetPlayerPed(-1))
				Wait(100)
				TaskPlayAnim(GetPlayerPed(-1),"random@arrests@busted", "enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
				hbh = not hbh
			else
				ClearPedSecondaryTask(GetPlayerPed(-1))
				ClearPedTasks(GetPlayerPed(-1))
				hbh = not hbh
			end
		end
	end
end)

test = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 57) then
			print("pressed")
			if test == false then
				loadAnimDict("combat@aim_variations@1h@hillbilly")
				ClearPedSecondaryTask(GetPlayerPed(-1))
				Wait(100)
				TaskPlayAnim(GetPlayerPed(-1),"combat@aim_variations@1h@hillbilly", "aim_variation_a", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
				test = not test
			else
				ClearPedSecondaryTask(GetPlayerPed(-1))
				ClearPedTasks(GetPlayerPed(-1))
				test = not test
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  if hbh then
		DisableControlAction(0,21,true) -- disable sprint (SHIFT)
		DisableControlAction(0,22,true) -- disable jump (SPACE)
		DisableControlAction(0,23,true) -- disable enter vehicle (F)
		DisableControlAction(0,24,true) -- disable attack (LEFTCLICK)
		DisableControlAction(0,25,true) -- disable aim (RIGHTCLICK)
		DisableControlAction(0,29,true) -- disable point (B)
		DisableControlAction(0,47,true) -- disable weapon
		DisableControlAction(0,58,true) -- disable weapon 
		DisableControlAction(0,73,true) -- disable handsup (X)
		DisableControlAction(0,75,true) -- disable exit vehicle (F)
		DisableControlAction(27,75,true) -- disable exit vehicle (F)
		DisableControlAction(0,140,true) -- disable melee
		DisableControlAction(0,141,true) -- disable melee
		DisableControlAction(0,142,true) -- disable melee
		DisableControlAction(0,143,true) -- disable melee
		DisableControlAction(0,257,true) -- disable melee
		DisableControlAction(0,263,true) -- disable melee
		DisableControlAction(0,264,true) -- disable melee
		DisableControlAction(0,311,true) -- disable seatbelt (K)
		DisableControlAction(0,323,true) -- disable handsup2 (X)
		DisableControlAction(0,244,true) -- disable flipoff (M)
	  end
	end
  end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		if HasEntityBeenDamagedByWeapon(ped, "1737195953") or HasEntityBeenDamagedByWeapon(ped, 1737195953) or HasEntityBeenDamagedByWeapon(ped, 0x678B81B1) or HasEntityBeenDamagedByWeapon(ped, GetHashKey("weapon_nitghtstick")) or HasEntityBeenDamagedByWeapon(ped, GetHashKey("WEAPON_NIGHTSTICK")) then
			print("hit")
			SetPedToRagdoll(ped, 5000, 5000, 0, 0, 0, 0)
		end
	end
end)

local function GetDisarmOffsetsForPed (ped)
	local v

	if IsPedWalking(ped) then v = {['x'] = 0.6,['y'] = 4.7,['z'] = -0.1 }
	elseif IsPedSprinting(ped) then v = {['x'] = 0.6,['y'] = 5.7,['z'] = -0.1 }
	elseif IsPedRunning(ped) then v = {['x'] = 0.6,['y'] = 4.7,['z'] = -0.1 }
	else v = {
		['x'] = 0.4,
		['y'] = 4.7,
		['z'] = -0.1 
	} 
	end

	return v
end

handbones = {
	57005,
	18905
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		if HasEntityBeenDamagedByAnyPed(ped) then
			print("damaged")
			for k,v in pairs(handbones) do
				local bone, hit = GetPedLastDamageBone(ped)
				if hit == v then
					print("hand")
					local wephash = GetSelectedPedWeapon(ped)
					local offset = GetDisarmOffsetsForPed(ped)
					SetPedDropsInventoryWeapon(ped, wephash, offset['x'], offset['y'], offset['z'], GetAmmoInPedWeapon(ped, wephash))
					SetCurrentPedWeapon(ped,2725352035,true)
				end
				ClearEntityLastDamageEntity(ped)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		if HasEntityBeenDamagedByAnyPed(ped) then
			print("works")
			local bone, hit = GetPedLastDamageBone(ped)
			print(bone, hit)
		end
	end
end)


-- HOLD WEAPON HOLSTER ANIMATION --

Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then 
			DisableControlAction( 0, 20, true ) -- INPUT_MULTIPLAYER_INFO (Z)
			if not IsPauseMenuActive() then 
				loadAnimDict( "reaction@intimidation@cop@unarmed" )		
				if IsDisabledControlJustReleased( 0, 20 ) then -- INPUT_MULTIPLAYER_INFO (Z)
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				else
					if IsDisabledControlJustPressed( 0, 20 ) and CheckSkin(ped) then -- INPUT_MULTIPLAYER_INFO (Z)
						SetEnableHandcuffs(ped, true)
						SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true) 
						TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
					end
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "reaction@intimidation@cop@unarmed", "intro", 3) then 
						DisableActions(ped)
					end	
				end
			end 
		end 
	end
end )

-- HOLSTER/UNHOLSTER PISTOL --
 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) and CheckSkin(ped) then
			loadAnimDict( "rcmjosh4" )
			loadAnimDict( "weapons@pistol@" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(600)
					ClearPedTasks(ped)
					holstered = false
				end
				SetPedComponentVariation(ped, 9, 0, 0, 0)
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(500)
					ClearPedTasks(ped)
					holstered = true
				end
				SetPedComponentVariation(ped, 9, 1, 0, 0)
			end
		end
	end
end)

-- DO NOT REMOVE THESE! --

function CheckSkin(ped)
	for i = 1, #skins do
		if GetHashKey(skins[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end
