
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
	["Våbenshop"] = {
		_config = {blipid=110,blipcolor=1},
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
	}
}
-- list of gunshops positions

cfg.gunshops = {}

return cfg