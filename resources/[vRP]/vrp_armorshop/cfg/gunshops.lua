
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
	["Våbenbutik"] = {
		_config = {blipid=110,blipcolor=1},
		["ARMOR1"] = {"Skudsikker vest",75000,0,""},
		["WEAPON_FLASHLIGHT"] = {"Lommelygte",5000,0,""},
		["WEAPON_KNIFE"] = {"Kniv",20000,0,""},
		["WEAPON_BAT"] = {"Baseballbat",25000,0,""},
		["WEAPON_CROWBAR"] = {"Brækjern",20000,0,""},
		["WEAPON_KNUCKLE"] = {"Knojern",20000,0,""},
		["WEAPON_WRENCH"] = {"Svensknøgle",20000,0,""},
		["WEAPON_SWITCHBLADE"] = {"Foldekniv",20000,0,""},
		["WEAPON_BATTLEAXE"] = {"Kampøkse",20000,0,""},
		["WEAPON_BALL"] = {"Baseball bold",2000,0,""},
		["WEAPON_GOLFCLUB"] = {"Golfkølle",20000,0,""},
		["WEAPON_HAMMER"] = {"Hammer",20000,0,""}
	},
	["Hygge"] = {
		_config = {blipid=110,blipcolor=1},
		["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,15,""},
		["WEAPON_SNSPISTOL"] = {"Pistol",2500,15,""},
		["WEAPON_VINTAGEPISTOL"] = {"Vintage Pistol",2500,15,""},
		["WEAPON_PISTOL"] = {"Pistol",2500,15,""},
		["WEAPON_COMBATPISTOL"] = {"Combat Pistol",5000,15,""},
		["WEAPON_HEAVYPISTOL"] = {"Heavy Pistol",5000,15,""},
		["WEAPON_HEAVYREVOLVER"] = {"Heavy Revolver",5000,15,""},
		["WEAPON_APPISTOL"] = {"Ap Pistol",7500,15,""},
		["WEAPON_DAGGER"] = {"Dagger",2000,0,""},
		["WEAPON_HAMMER"] = {"Hammer",2500,0,""},
		["WEAPON_HATCHET"] = {"Hatchet",3000,0,""},
		["WEAPON_BOTTLE"] = {"Bottle",1000,0,""},
		["WEAPON_BAT"] = {"Bat",1500,0,""},
		["WEAPON_KNUCKLE"] = {"Knuckle",1500,0,""},
		["WEAPON_KNIFE"] = {"Knife",2000,0,""},
		["WEAPON_MICROSMG"] = {"Mini SMG",50000,25,""},
		["WEAPON_SMG"] = {"SMG",5000,25,""},
		["WEAPON_ASSAULTSMG"] = {"Assault SMG",5500,25,""},
		["WEAPON_COMBATPDW"] = {"Combat PDW",7500,25,""},
		["WEAPON_MACHINEPISTOL"] = {"Machine Pistol",7500,25,""},
		["WEAPON_NIGHTSTICK"] = {"Nighstick",3000,0,""},
		["WEAPON_CROWBAR"] = {"Crowwbar",3000,0,""},
		["WEAPON_GOLFCLUB"] = {"Golf club",3500,0,""},
		["WEAPON_SWITCHBLADE"] = {"Blade",4000,0,""},
		["WEAPON_MACHETE"] = {"Machete",4500,0,""},
		["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,15,""},
		["WEAPON_SNSPISTOL"] = {"Pistol",2500,15,""},
		["WEAPON_COMPACTRIFLE"] = {"Mini SMG",200000,50,""},
		["WEAPON_ASSAULTRIFLE"] = {"Assault Rifle",200000,50,""},
		["WEAPON_CARBINERIFLE"] = {"Carabineri Rifle",200000,50,""},
		["WEAPON_GRENADE"] = {"Grenade",500000,70,""},
		["WEAPON_MOLOTOV"] = {"Molotv",150000,45,""},
		["WEAPON_FLARE"] = {"Flare",200000,50,""},
		["WEAPON_GUSENBERG"] = {"Gusenberg MG",200000,50,""},
		["WEAPON_MG"] = {"MG",250000,50,""},
		["WEAPON_COMBATMG"] = {"Combat MG",500000,70,""},
		["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,15,""},
		["WEAPON_SNSPISTOL"] = {"Pistol",2500,15,""},
		["WEAPON_MARKSMANRIFLE"] = {"Marksman Rifle",150000,45,""},
		["WEAPON_SNIPERRIFLE"] = {"Sniper Rifle",200000,50,""},
		["WEAPON_HEAVYSNIPER"] = {"Heavy Rifle",500000,50,""},
		["WEAPON_BULLPUPRIFLE"] = {"Bullpup Rifle",200000,50,""},
		["WEAPON_ADVANCEDRIFLE"] = {"Carabine",200000,50,""},
		["WEAPON_SPECIALCARBINE"] = {"Special Carabine",200000,50,""},
		["WEAPON_GRENADE"] = {"Grenade",500000,70,""},
		["WEAPON_MOLOTOV"] = {"Molotv",150000,45,""},
		["WEAPON_FLARE"] = {"Flare",200000,50,""},
		["WEAPON_SAWNOFFSHOTGUN"] = {"Saw Shotgun",350000,65,""},
		["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",500000,70,""},
		["WEAPON_BULLPUPSHOTGUN"] = {"BullUp Shotgun",650000,72,""},
		["WEAPON_HEAVYSHOTGUN"] = {"Heavy Shotgun",750000,75,""},
		["WEAPON_ASSAULTSHOTGUN"] = {"Assault Shotgun",1000000,80,""},
		["WEAPON_GRENADELAUNCHER_SMOKE"] = {"Grenade Launcher",500000,100,""},
		["WEAPON_FIREEXTINGUISHER"] = {"Fire Extinguisher",1000000,0,""},
		["WEAPON_FIREWORK"] = {"Firework",2000000,0,""},
		["WEAPON_SNOWBALL"] = {"SnowBall",3000000,0,""},
		["WEAPON_FLASHLIGHT"] = {"FlashLight",50000,0,""},
		["WEAPON_STUNGUN"] = {"Stungun",100000,0,""},
		["WEAPON_MUSKET"] = {"Musket",150000,0,""},
		["WEAPON_FLAREGUN"] = {"Flaregun",500000,0,""},
		["WEAPON_MARKSMANPISTOL"] = {"Marksman Pistol",1500,15,""},
		["WEAPON_SNSPISTOL"] = {"Pistol",2500,15,""},
		["WEAPON_GRENADE"] = {"Grenade",500000,70,""},
		["WEAPON_SMOKEGRENADE"] = {"Smoke Grenade",50000,0,""},
		["WEAPON_PETROLCAN"] = {"Petrol",50000,0,""}
	},
	["Våbendealer"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"dealer.bodyarmor"}},
		 ["WEAPON_SNIPERRIFLE"] = {"Finskytte-riffel",11000000,300,""},
		 ["WEAPON_COMPACTRIFLE"] = {"Mini Ak-47",6000000,150,""},
		 ["WEAPON_MACHINEPISTOL"] = {"Tec-9",2000000,35,""},
		 ["WEAPON_PISTOL"] = {"Pistol",500000,40,""}
	},
	["Politi"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"police.bodyarmor"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_CARBINERIFLE"] = {"[AKS] Karbin-riffel",0,0,""},
		["WEAPON_SNIPERRIFLE"] = {"[AKS] Finskytte-riffel",0,0,""},
		["WEAPON_SMOKEGRENADE"] = {"Tåregas",0,0,""}
	},
	["Politi Våben"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"police.bodyarmor"}},
		["WEAPON_VINTAGEPISTOL"] = {"Håndholdt Fartmåler (Fartkontrold)",0,0,""},
		["WEAPON_COMBATPISTOL"] = {"Tjenestepistol",0,0,""},
		["WEAPON_SMG"] = {"MP5",0,0,""},
		["WEAPON_STUNGUN"] = {"Strømpistol",0,0,""},
		["WEAPON_FLASHLIGHT"] = {"Lommelygte",0,0,""},
		["WEAPON_NIGHTSTICK"] = {"knebel",0,0,""},
		["WEAPON_SMOKEGRENADE"] = {"Tåregas",0,0,""}
	},
	["Aks"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"aks.bodyarmor"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_CARBINERIFLE"] = {"[AKS] Karbin-riffel",0,0,""},
		["WEAPON_SNIPERRIFLE"] = {"[AKS] Finskytte-riffel",0,0,""},
		["WEAPON_SMOKEGRENADE"] = {"Tåregas",0,0,""}
	},
	["PET"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"pet.bodyarmor"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_COMBATPISTOL"] = {"Håndpistol",0,0,""}
	}
}
-- list of gunshops positions

cfg.gunshops = {
	{"Våbenbutik", 1692.41, 3758.22, 34.7053,false},
	{"Våbenbutik", 252.696, -48.2487, 69.941,false},
	--{"Hygge", 7.902307510376, -1109.6002197266, 29.797023773193,false},
	{"Våbenbutik", 844.299, -1033.26, 28.1949,false},
	{"Våbenbutik", -331.624, 6082.46, 31.4548,false},
	{"Våbenbutik", -664.147, -935.119, 21.8292,false},
	{"Våbenbutik", -1305.4624, -392.4640, 36.6957,false},
	{"Våbenbutik", -1119.4880,2697.0866,18.554,false},
	{"Våbenbutik", 2569.62, 294.453, 108.735,false},
	{"Våbenbutik", -3172.6037,1085.7481,20.8387,false},
	{"Våbenbutik", 21.70, -1107.41, 29.79,false},
	{"Våbenbutik", 810.15, -2156.88, 29.61,false},
	{"PET", 460.597,-981.05,30.68,true},
	{"Politi", 460.597,-981.05,30.68,true},
	{"Aks", 460.597,-981.05,30.68,true},
	{"Politi Våben", 455.83178710938,-979.13293457032,30.689588546752,true},
	{"Våbendealer", -66.631881713868,-795.91912841796,44.225143432618,true},
	{"Politi Våben", 1852.7360839844,3691.75390625,34.26704788208,true},
	{"Politi Våben", -449.57556152344,6010.439453125,31.716388702392,true}
}

return cfg