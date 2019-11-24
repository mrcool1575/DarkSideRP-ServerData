local cfg = {}

cfg.inventory_weight_per_strength = 5 -- weight for an user inventory per strength level (no unit, but thinking in "kg" is a good norm)

-- default chest weight for vehicle trunks
cfg.default_vehicle_chest_weight = 900

-- define vehicle chest weight by model in lower case
cfg.vehicle_chest_weights = {
-- lastbiler
	["monster"] = 1420,
	["mule"] = 2460,
	["tiptruck"] = 5720,
	["tiptruck2"] = 5720,
	["rubble"] = 5720,
-- motorcykler
	["akuma"] = 90,
	["bagger"] = 130,
	["blazer"] = 80,
	["bati"] = 90,
	["bati2"] = 90,
	["bf400"] = 60,
	["carbonrs"] = 90,
	["cliffhanger"] = 70,
	["daemon"] = 90,
	["double"] = 90,
	["enduro"] = 70,
	["faggio"] = 90,
	["faggio2"] = 80,
	["faggio3"] = 80,
	["gargoyle"] = 90,
	["hakuchou"] = 100,
	["hexer"] = 90,
	["innovation"] = 90,
	["lectro"] = 90,
	["nemesis"] = 90,
	["pcj"] = 90,
	["nightblade"] = 100,
	["ruffian"] = 90,
	["sanchez"] = 60,
	["sovereign"] = 120,
	["thrust"] = 90,
	["vader"] = 80,
	["vindicator"] = 90,
	["bmx"] = 6,
	["fixter"] = 6,
	["scorcher"] = 6,
	["cruiser"] = 6,
	["tribike"] = 6,
	["tribike2"] = 6,
	["tribike3"] = 6
}

return cfg