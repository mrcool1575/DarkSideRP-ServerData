-- define some basic inventory items
local items = {}

local function play_eat(player)
	local seq = {
		{"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
		{"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
		{"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
		{"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
	}
	vRPclient.playAnim(player,{true,seq,false})
end

local function play_drink(player)
	local seq = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}
	vRPclient.playAnim(player,{true,seq,false})
end

local function gen(ftype, vary_hunger, vary_thirst)
	local fgen = function(args)
    local idname = args[1]
    local choices = {}
    local act = "Ukendt"
    if ftype == "eat" then act = "> Spis" elseif ftype == "drink" then act = "> Drik" end
		local name = vRP.getItemName(idname)
		choices[act] = {function(player,choice)
		local user_id = vRP.getUserId(player)
			if user_id ~= nil then
				if vRP.tryGetInventoryItem(user_id,idname,1,false) then
					if vary_hunger ~= 0 then vRP.varyHunger(user_id,vary_hunger) end
					if vary_thirst ~= 0 then vRP.varyThirst(user_id,vary_thirst) end

					if ftype == "drink" then
						TriggerClientEvent("pNotify:SetQueueMax", player, 5, 4)
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Drikker "..name..".", type = "success", queue = "5", timeout = 1000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
						play_drink(player)
					elseif ftype == "eat" then
						TriggerClientEvent("pNotify:SetQueueMax", player, 6, 4)
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Spiser "..name..".", type = "success", queue = "6", timeout = 1000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
						play_eat(player)
					end

				  vRP.closeMenu(player)
				end
			end
		end}
		return choices
	end
	return fgen
end

-- Drikke
items["water"] = {"Vandflaske","", gen("drink",0,-25),0.02}
items["beer"] = {"Guldøl","", gen("drink",0,-25),0.02}
items["beer2"] = {"Tuborg","", gen("drink",0,-25),0.02}
items["milk"] = {"Mælk","", gen("drink",0,-5),0.02}
items["coffee"] = {"Kaffe","", gen("drink",0,-10),0.20}
items["tea"] = {"Te","", gen("drink",0,-15),0.20}
items["icetea"] = {"Iste","", gen("drink",0,-20), 0.02}
items["orangejuice"] = {"Appelsinjuice","", gen("drink",0,-25),0.02}
items["gocagola"] = {"Coca Cola","", gen("drink",0,-35),0.20}
items["redgull"] = {"Redbull","", gen("drink",0,-40),0.20}
items["lemonlimonad"] = {"Lemonade","", gen("drink",0,-45),0.20}
items["vodka"] = {"Vodka","", gen("drink",15,-65),0.40}
items["cocio"] = {"Cocio","", gen("drink",0,-60),0.20}
items["rodvin"] = {"Rødvin","", gen("drink",0,-25),0.20} 
items["hvidvin"] = {"Hvidvin","", gen("drink",0,-25),0.20} 
items["mokai"] = {"Mokai","", gen("drink",0,-25),0.20} 
items["vand2"] = {"Vand","", gen("drink",0,-10),0.20} 
items["juicebrik"] = {"Juicebrik","", gen("drink",0,-5),0.20} 

-- Mad
items["bread"] = {"Brød","", gen("eat",-10,0),0.20}
items["donut"] = {"Donut","", gen("eat",-15,0),0.20}
items["tacos"] = {"Taco","", gen("eat",-20,0),0.20}
items["sandwich"] = {"Sandwich","", gen("eat",-25,0),0.20}
items["kebab"] = {"Kebab","", gen("eat",-45,0),0.20}
items["pdonut"] = {"Chokoladedonut","", gen("eat",-75,0),0.20}
items["pizza1"] = {"Pizza nr. 19","Kebab Pizza m. Dressing", gen("eat",-75,0),0.20}
items["pizza2"] = {"Pizza nr. 21","Bacon/Æg Pizza m. Cocktailpølser", gen("eat",-75,0),0.60}
items["pizza3"] = {"Pizza nr. 25","Salat Pizza", gen("eat",-75,0),0.20}
items["pizza4"] = {"Pizza nr. 35","Skinke Pizza", gen("eat",-75,0),0.20}
items["pizza5"] = {"Pizza nr. 69","Skinke Pizza m. Løg, Gogonzola ost og dressing", gen("eat",-75,0),0.20}
items["pizza6"] = {"Salat pizza","Tomat ost oksekød salat rød pebber agurk tomat m. dressing", gen("eat",-75,0),0.20}
items["pizza7"] = {"Meat lover pizza","Tomat ost skinke pepperoni kylling bacon og oksekød", gen("eat",-75,0),0.20}
items["bolle"] = {"Nutella bolle","", gen("eat",-60,0),0.20}
items["processed_fish"] = {"Behandlet fisk","En behandlet fisk.", gen("eat",-70,0),0.01}
items["budding"] = {"Budding","", gen("eat",-5,0),0.20}
items["mos"] = {"Mos og ærter","", gen("eat",-5,0),0.20}

return items