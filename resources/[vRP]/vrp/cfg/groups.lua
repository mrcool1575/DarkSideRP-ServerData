
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
	["udvikler"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Udvikler-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Udvikler-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.givemoney",
		"player.unban",
		"player.giveitem",
		"player.tptowaypoint",
		"admin.announce",
		"player.list",
		"player.whitelist",
		"player.kick",
		"player.ban",
		"player.noclip",
		"player.display_custom",
		"player.blips",
		"player.tptome",
		"player.tpto",
		"player.tptowaypoint",
		"player.spawnvehicle",
		"player.deletevehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.unlockvehicle",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"police.handcuff",
		"police.seize.weapons",
		"police.seize.items",
		"police.menu_interaction",
		"repair.menu",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.revive",
		"emergency.market",
		"staff.revive",
		"Mekaniker.dv",
		"staff.seizable"
	},
	["superadmin"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add.staff",
		"player.group.remove.staff",
		"ledelse.fix",
		"player.givemoney",
		"player.unban",
		"player.giveitem",
		"player.tptowaypoint",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.unlockvehicle",
		"player.freeze",
		"repair.menu",
		"staff.chattitle",
		"staff.revive",
		"Mekaniker.dv",
		"staff.seizable"
	},
	["admin"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"admin.tickets",
		"admin.announce",
		"player.list",
		"player.whitelist",
		"player.kick",
		"player.ban",
		"player.noclip",
		"player.display_custom",
		"player.tptome",
		"player.tpto",
		"player.tptowaypoint",
		"player.deletevehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.unban",
		"player.repairvehicle",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"police.handcuff",
		"police.seize.weapons",
		"police.seize.items",
		"police.menu_interaction",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.revive",
		"emergency.market",
		"repair.menu",
		"vehicle.replace",
		"staff.chattitle",
		"staff.revive",
		"Mekaniker.dv",
		"staff.seizable"
	},
	["moderator"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hjælper-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hjælper-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"admin.tickets",
		"admin.announce",
		"player.list",
		"player.kick",
		"player.noclip",
		"player.tpto",
		"player.unban",
		"player.tptome",
		"player.tptowaypoint",
		"player.deletevehicle",
		"player.unlockvehicle",
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.revival",
		"player.coordsnoheading",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"staff.chattitle",
		"staff.revive",
		"Mekaniker.dv",
		"staff.seizable"
	},
	["emschief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu lægechef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"emergencychief.paycheck",
		"-emergency.paycheck"
	},
	["mechchief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu mekanikerchef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"repairchief.paycheck",
		"Mekaniker.dv",
		"-repair.paycheck"
	},
	["policechief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu rigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"policechief.paycheck",
		"-police.paycheck"
	},
	["lawyerchief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu højesteretsdommer.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove"
	},
	["god"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Godmode aktiveret.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Godmode deaktiveret.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		},
		"admin.god", -- reset survivals/health periodically
		"god.chattitle"
	},
	["jailed"] = {
		"admin.god"
	},
	["user"] = {  -- the group user is auto added to all logged players
		"player.phone",
		"player.calladmin",
		"player.coords",
		"police.askid",
		"player.loot",
		"police.store_weapons",
		"user.askid",
		"police.seizable",  -- can be seized
		"player.fix_haircut",
		"user.firstaid"
	},
	["police"] = {
		_config = {
			onspawn = function(player) end
		},
		"cop.whitelisted",
		"police.robbery"
	},
	["helikopter"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Helikopter-licens tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"helikopter.whitelisted",
		"helikopter.vehicle"
	},
	["pet"] = {
		_config = {
			onspawn = function(player) end
		},
		"pet.whitelisted"
	},
	["ems"] = {
		_config = {
			onspawn = function(player) end
		},
		"ems.whitelisted"
	},
	["mech"] = {
		_config = {
			onspawn = function(player) end
		},
		"mechanic.whitelisted"
	},
	["lawyer"] = {
		_config = {
			onspawn = function(player) end
		},
		"lawyer.whitelisted"
	},
	["journal"] = {
		_config = {
			onspawn = function(player) end
		},
		"journalist.whitelisted"
	},
	["judge"] = {
		_config = {
			onspawn = function(player) end
		},
		"judge.whitelisted"
	},
	["psych"] = {
		_config = {
			onspawn = function(player) end
		},
		"psychologist.whitelisted"
	},
	["Køleskab"] = {
		_config = {
			onspawn = function(player) end
		},
		"fucking.koleskab"
	},
	["Skraldemand"] = {
		_config = { gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu skraldemand.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"skraldemand.vehicle",
		"skraldemand.paycheck",
		"toggle.service",
		"skraldemand.market",
		"mission.skraldemand",
		"mission.skraldemand2"
	},
    ["Postbud"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu postbud.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"delivery.gopostal",
		"postman.paycheck"
	},
    ["Lastbilchauffør"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu lastbilchauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"delivery.trucker",
		"trucker.vehicle",
		"trucker.paycheck"
	},
	["AKS"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu AKS.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"politi.koleskab",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"player.deletevehicle",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"police.paycheck",
		"police.came",
		"police.drag",
		"aks.bodyarmor",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Politi Betjent"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politi Betjent.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"police.service",
		"police.came",
		"politi.koleskab",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"police.paycheck",
		"player.deletevehicle",
		"police.drag",
		"police.bodyarmor",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Psykolog"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Psykolog.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.cloakroom",
		"police.pc",
		"police.putinveh",
		"police.came",
		"police.getoutveh",
		"police.check",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"politi.koleskab",
		"police.seize.items",
		"police.license",
		"policechief.paycheck",
		"police.fine",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"player.deletevehicle",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
		["Rigspolitichef"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Rigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.came",
		"police.getoutveh",
		"police.check",
		"aks.bodyarmor",
		"robbery.police",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"politi.koleskab",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"policechief.paycheck",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"police.drag",
		"police.bodyarmor",
		"player.deletevehicle",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
			["Vice Rigspolitichef"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Vice Rigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"police.service",
		"police.came",
		"police.wanted",
		"police.seize.weapons",
		"aks.bodyarmor",
		"police.seize.items",
		"politi.koleskab",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"player.deletevehicle",
		"vice.paycheck",
		"police.drag",
		"police.bodyarmor",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Politi Elev"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politi Elev.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"politi.koleskab",
		"police.check",
		"robbery.police",
		"player.deletevehicle",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.came",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"policestudent.paycheck",
		"police.drag",
		"police.bodyarmor",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["PET-agent"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu PET-agent.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 1},WEAPON_PISTOL = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 1},WEAPON_PISTOL = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 0},WEAPON_PISTOL = {ammo = 0}}})
			end
		},
		"pet.whitelisted",
		"police.menu",
		"police.carsearch",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"politi.koleskab",
		"police.service",
		"police.wanted",
		"police.came",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.vehicle",
		"police.easy_jail",
		"police.fine",
		"-police.store_weapons",
		"police.seizable", 
		"police.paycheck",
		"police.drag",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"pet.bodyarmor",
		"police.menu_interaction"
	},
	["Læge"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu læge.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergency.paycheck",
		"police.menu_interaction"
	},
	["Læge Elev"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Læge Elev.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"chef.paycheck",
		"police.menu_interaction"
	},
		["Vice Regionschef"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Vice Regionschef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"chef.paycheck",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"police.menu_interaction"
	},
		["Regionschef"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Regionschef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergencystudent.paycheck",
		"police.menu_interaction"
	},
		["Læge"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Læge.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergencystudent.paycheck",
		"police.menu_interaction"
	},
	["Overlæge"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Overlæge.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergencystudent.paycheck",
		"police.menu_interaction"
	},
		["Teslak Auto A/S"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Teslak Auto A/S.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mechanic.whitelisted",
		"mechanic.emotes",
		"mech.announce",
		"vehicle.repair",
		"vehicle.replace",
		"drugseller.sell",
		"drugseller.market",
		"drugseller.harvest",
		"drugseller.process",
		"teslak.vehicle",
		"repair.service",
		"mission.repair.satellite_dishes",
		"mission.repair.wind_turbines",
		"repair.vehicle",
		"repair.market",
		"repair.paycheck",
		"repair.scrap",
		"repair.menu",
		"Mekaniker.dv",
		"toggle.service"
	}, 
	["Mekaniker"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu mekaniker.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mechanic.whitelisted",
		"mechanic.emotes",
		"mech.announce",
		"vehicle.repair",
		"vehicle.replace",
		"repair.service",
		"mission.repair.satellite_dishes",
		"mission.repair.wind_turbines",
		"repair.vehicle",
		"repair.market",
		"teslak.paycheck",
		"repair.scrap",
		"repair.menu",
		"Mekaniker.dv",
		"toggle.service"
	}, 
	["Civil"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu civil borger.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"user.paycheck"
	},
	["Vanilla Unicorn"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Vanilla Unicorn.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mission.taxi.passenger",
		"toggle.service",
		"stripper.drunk",
		"stripper.vehicle",
		"stripper.paycheck"
	},
	["Taxa"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu taxachauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"taxi.service",
		"taxi.vehicle",
		"taxi.announce",
		"mission.taxi.passenger",
		"toggle.service",
		"taxi.paycheck"
	},
	["Bilsælger Chef"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Bilsælger Chef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"lawyer.service",
		"lawyer.announce",
		"bilsælgerchef.paycheck",
		"toggle.service"
	},
	["Bilsælger"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Bilsælger.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"lawyer.service",
		"lawyer.announce",
		"bilsælger.paycheck",
		"toggle.service"
	},
	["Bilsælger Elev"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Bilsælger Chef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"lawyer.service",
		"lawyer.announce",
		"bilsælgerelev.paycheck",
		"toggle.service"
	},
	["Advokat"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu advokat.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"lawyer.service",
		"lawyer.announce",
		"lawyer.paycheck",
		"toggle.service",
		"mission.advokat",
		"mission.advokat2",
		"advokat.keycard",
		"advokat.vehicle"
	},
	["Dommer"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu dommer.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"-lawyer.paycheck",
		"judge.paycheck",
		"lawyer.service",
		"lawyer.announce",
		"toggle.service",
		"mission.advokat",
		"mission.advokat2",
		"advokat.vehicle"
	},
	["Journalist"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu journalist.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"journalist.announce",
		"journalist.service",
		"journalist.vehicle",
		"journalist.paycheck"
	},
	["Træhugger"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu træhugger.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"tree.cutter",
		"tree.vehicle",
		"tree.paycheck"
	},
	["Våbenhandler"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Våbenhandler.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"drugseller.market",
		"drugseller.harvest",
		"dealer.bodyarmor",
		"la.keycard",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
	["Kriminel"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu kriminel.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"drugseller.market",
		"drugseller.harvest",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
			["La Mafia De Medellin"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af La Mafia De Medellin.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"drugseller.market",
		"la.keycard",
		"drugseller.harvest",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
		["Juarez Kartel"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Juarez Kartel.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"drugseller.market",
		"drugseller.harvest",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
	["DemonsMC"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af DemonsMC.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"biker.vehicle",
		"drugseller.market",
		"demon.keycard",
		"drugseller.harvest",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
	["Johnson pizza"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er Pizzamand", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"delivery.vehicle",
		"delivery.paycheck",
		"delivery.gopostal"
	},
	["Minearbejder"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu minearbejder.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mining.harvest",
		"mining.process",
		"mining.paycheck",
		"mining.sell",
		"mining.vehicle"
	},
	["Fisker"] = {
		_config = { gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu fisker.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"fisher.sell",
		"fisher.fish",
		"fisher.process",
		"fisher.vehicle",
		"fisher.paycheck"
	},
	["onservice"] = {}
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
	[1] = { -- give superadmin and admin group to the first created user on the database
		"udvikler"
	}
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
	["Jobcenter"] = {
		_config = {x = 238.18086242676, y = -412.20794677734, z =48.111930847168, blipid = 351, blipcolor = 47},
		"Taxa",
		"Udbringer",
		"Fisker",
		"Kriminel",
		"Minearbejder",
		"Skraldemand",
		"Lastbilchauffør",
		"Postbud",
		"Træhugger",
		"Johnson pizza"
	},
	["Politi Los Santos"] = {
		_config = {x = 454.47848510742, y = -988.86291503906, z = 30.689605712891, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Politi Betjent",
		"AKS",
		"Rigspolitichef",
		"PET-agent",
		"Vice Rigspolitichef",
		"Politi Elev",
		"Civil"
	},
	["PET agent"] = {
		_config = {x = 2476.4152832031, y = -384.03573608398, z = 93.06899261, blipid = 0, blipcolor = 0, permissions = {"cop.whitelisted"} },
		"PET-agent",
		"Civil"
	},
	["Politi Paleto Bay"] = {
		_config = {x =-442.57192993164, y = 6012.4140625, z = 31.716394424438, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Politi Betjent",
		"AKS",
		"Rigspolitichef",
		"PET-agent",
		"Vice Rigspolitichef",
		"Politi Elev",
		"Civil"
	},
	["Politi Sandy Shores"] = {
		_config = {x = 1851.4848632813, y = 3683.5070800781, z = 34.26708984375, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Politi Betjent",
		"AKS",
		"Rigspolitichef",
		"PET-agent",
		"Vice Rigspolitichef",
		"Politi Elev",
		"Civil"
	},
	["Advokat"] = {
		_config = {x = 126.38735198975, y = -752.14984130859, z =242.15205383301, blipid = 0, blipcolor = 0, permissions = {"lawyer.whitelisted"} },
		"Advokat",
		"Civil"
	},
	["Hospital Los Santos"] = {
		_config = {x = 266.20809936523, y = -1364.8111572266, z = 24.537786483765, blipid = 0, blipcolor = 0, permissions = {"ems.whitelisted"} },
		"Læge",
		"Læge Elev",
		"Overlæge",
		"Vice Regionschef",
		"Regionschef",
		"Civil"
	},
	["Journalist"] = {
		_config = {x = 1160.3024902344, y = -3191.966796875, z = -39.007976531982, blipid = 0, blipcolor = 0, permissions = {"journalist.whitelisted"} },
		"Journalist",
		"Civil"
	},
	["Mekaniker"] = {
		_config = {x = 964.46337890625, y = -3003.4372558594, z = -39.639892578125, blipid = 351, blipcolor = 3, permissions = {"mechanic.whitelisted"} },
		"Mekaniker",
		"Civil"
	}
}

return cfg
