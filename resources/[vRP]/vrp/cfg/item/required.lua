local items = {}

items["medkit"] = {"Medkit","Bruges til at genoplive bevistløse personer.",nil,0.10}
items["bandage"] = {"Plaster","Bruges til at helbrede personer.",nil,0.05}
items["firstaidkit"] = {"Førstehjælps-kasse","Bruges til at yde førstehjælp på tilskadekommende. Kræver førstehjælpskursus for at benytte.",nil,0.02}
items["dirty_money"] = {"Penge","Ulovligt anskaffede penge.",nil,0.00}
items["repairkit"] = {"Reparations kit","Bruges til at reparere køretøjer.",nil,0.50}

-- money
items["money"] = {"Pengebundt","Pengebundt.",function(args)
	local choices = {}
	local idname = args[1]

	choices["> Pak ud"] = {function(player,choice,mod)
	local user_id = vRP.getUserId(player)
		if user_id ~= nil then
		local amount = vRP.getInventoryItemAmount(user_id, idname)
			vRP.prompt(player, "Hvor meget vil du pakke ud? (max "..amount..")", "", function(player,ramount)
			ramount = parseInt(ramount)
				if vRP.tryGetInventoryItem(user_id, idname, ramount, true) then -- unpack the money
					vRP.giveMoney(user_id, ramount)
					vRP.closeMenu(player)
				end
			end)
		end
	end}

  return choices
end,0}

-- money binder
items["money_binder"] = {"Penge binder","Bruges til at lave et bundt af 10.000 DKK.",function(args)
	local choices = {}
	local idname = args[1]
	choices["> Lav pengebundt"] = {function(player,choice,mod) -- bind the money
		local user_id = vRP.getUserId(player)
		if user_id ~= nil then
			local money = vRP.getMoney(user_id)
			if money >= 10000 then
				if vRP.tryGetInventoryItem(user_id, idname, 1, true) and vRP.tryPayment(user_id,10000) then
					vRP.giveInventoryItem(user_id, "money", 10000, true)
					vRP.closeMenu(player)
				end
			else
				TriggerClientEvent("pNotify:SendNotification", player,{text = {vRP.lang.money.not_enough()}, type = "error", queue = "global", timeout = 3000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		end
	end}
	return choices
end,0}

-- parametric weapon items
-- give "wbody|WEAPON_PISTOL" and "wammo|WEAPON_PISTOL" to have pistol body and pistol bullets

local get_wname = function(weapon_id)
	local name = string.gsub(weapon_id,"WEAPON_","")
	name = string.upper(string.sub(name,1,1))..string.lower(string.sub(name,2))
	-- lang translation support, ex: weapon.pistol = "Pistol", by default use the native name
	return vRP.lang.weapon[string.lower(name)]({}, name)
end

--- weapon body
local wbody_name = function(args)
	return get_wname(args[2])
end

local wbody_desc = function(args)
	return ""
end

local wbody_choices = function(args)
	local choices = {}
	local fullidname = joinStrings(args,"|")
	choices["> Klargør"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
		if user_id ~= nil then
			if vRP.tryGetInventoryItem(user_id, fullidname, 1, true) then -- give weapon body
				local weapons = {}
				weapons[args[2]] = {ammo = 0}
				vRPclient.giveWeapons(player, {weapons})
				
				vRP.getUserIdentity(user_id, function(identity)
					local fornavn = identity.firstname
					local efternavn = identity.name
					local dato = os.date("**%d-%m-%Y** kl. **%X**")
					if identity then
						PerformHttpRequest('https://discordapp.com/api/webhooks/525310881643495435/Dwbhuj6xVakmIjIP4W5zrjQcowyuJb0ApikfN5sS9rZQB7CyHxen__A4GfWqzklQ3-TH', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = "**"..fornavn.." "..efternavn.." ("..user_id..")** har klarggjort sit våben **"..vRP.getItemName(fullidname).."** - ("..dato..")"}), { ['Content-Type'] = 'application/json' })
					end
				end)
				
				vRP.closeMenu(player)
			end
		end
	end}
  return choices
end

local wbody_weight = function(args)
	return 0.75
end

items["wbody"] = {wbody_name,wbody_desc,wbody_choices,wbody_weight}

--- weapon ammo
local wammo_name = function(args)
	return get_wname(args[2]).." - ammunition"
end

local wammo_desc = function(args)
	return ""
end

local wammo_choices = function(args)
	local choices = {}
	local fullidname = joinStrings(args,"|")

	choices["> Lad i våben"] = {function(player,choice)
    local user_id = vRP.getUserId(player)
		if user_id ~= nil then
		local amount = vRP.getInventoryItemAmount(user_id, fullidname)
			vRP.prompt(player, "Hvor meget vil du lade i dit våben? (max "..amount..")", "", function(player,ramount)
				ramount = parseInt(ramount)

				vRPclient.getWeapons(player, {}, function(uweapons)
					if uweapons[args[2]] ~= nil then -- check if the weapon is equiped
						if vRP.tryGetInventoryItem(user_id, fullidname, ramount, true) then -- give weapon ammo
							local weapons = {}
							weapons[args[2]] = {ammo = ramount}
							vRPclient.giveWeapons(player, {weapons,false})
							
							vRP.getUserIdentity(user_id, function(identity)
								local fornavn = identity.firstname
								local efternavn = identity.name
								local dato = os.date("**%d-%m-%Y** kl. **%X**")
								if identity then
									PerformHttpRequest('https://discordapp.com/api/webhooks/525310881643495435/Dwbhuj6xVakmIjIP4W5zrjQcowyuJb0ApikfN5sS9rZQB7CyHxen__A4GfWqzklQ3-TH', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0"), content = "**"..fornavn.." "..efternavn.." ("..user_id..")** har ladt sit våben med **"..ramount.."x "..vRP.getItemName(fullidname).."** - ("..dato..")"}), { ['Content-Type'] = 'application/json' })
								end
							end)
							vRP.closeMenu(player)
						end
					end
				end)
			end)
		end
	end}

	return choices
end

local wammo_weight = function(args)
	return 0.01
end

items["wammo"] = {wammo_name,wammo_desc,wammo_choices,wammo_weight}

return items
