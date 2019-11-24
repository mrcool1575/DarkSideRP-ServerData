local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.75 -- sell for 75% of the original price

cfg.garage_types = {
	["Politi"] = {
		_config = {vtype="default",blipid=56,blipcolor=49,permissions={"police.vehicle"}},
		["police2"] = {"VW Touran",0, ""},
		["policers6"] = {"Audi RS6 (Fartkontrol)",0, ""},
		["policeb"] = {"Politimotorcykel",0, ""},
		["police3"] = {"Mercedes C250 (Uniformeret)",0, ""},
		["police"] = {"VW Passat (Uniformerert)",0, ""},
		["policeold5"] = {"VW Transporter (Indsatsleder)",0, ""},
		["ballsdeep"] = {"Psykolog",0, ""}
	},
	["Politi Civil"] = {
		_config = {vtype="default",blipid=56,blipcolor=49,permissions={"police.vehicle"}},
		["fbi"] = {"VW Passat (Civil)",0, ""},
		["police7"] = {"BMW M5 (Civil)",0, ""},
		["psp_bmwgs"] = {"BMW GS 1200 (Civil)(Sandy)",0, ""},
		["policegt350r"] = {"Audi RS6 (Civil)",0, ""},
		["police6"] = {"Mercedes C250 (Civil)",0, ""},
		["teslax"] = {"Tesla X Model (Civil)",0, ""},
		--["sheriff"] = {"Mercedes C250",0, ""},
		["fbi2"] = {"Mercedes V250",0, ""}
	},
	["Ambulanceredder"] = {
		_config = {vtype="default",blipid=50,blipcolor=3,permissions={"emergency.vehicle"}},
		["oambu"] = {"Ambulance",0, ""},
		["oakut"] = {"Akut (BMW)",0, ""},
		["paramed"] = {"Paramediciner",0, ""}
	},
	["Postbud"] = {
		_config = {vtype="default",blipid=50,blipcolor=3,permissions={"delivery.gopostal"}},
		["speedo"] = {"Postbil",0, ""}
	},
	["Helikopter"] = {
		_config = {vtype="default",blipid=50,blipcolor=3,permissions={"helikopter.vehicle"}},
		["frogger"] = {"Nyhedshelikopter",0, ""},
		["buzzard2"] = {"Buzzard",0, ""}
	},
	["Taxa"] = {
		_config = {vtype="default",blipid=50,blipcolor=81,permissions={"taxi.vehicle"}},
		["taxi"] = {"Taxa [Gul]",0, ""},
		["taxi2"] = {"Taxa [Sort]",0, ""}
	},
	["Stripper"] = {
		_config = {vtype="default",blipid=50,blipcolor=81,permissions={"stripper.vehicle"}},
		["pbus2"] = {"Party Bus",0, ""},
		["Stretch"] = {"limousine",0, ""}
	},
	["Johnson's pizzaria"] = {
		_config = {vtype="default",permissions={"delivery.vehicle"}},
		["vwcaddy"] = {"Pizza bil",0, ""},
		["faggio2"] = {"Pizza Scooter",0, ""}
	},
	["Mekaniker"] = {
		_config = {vtype="default",blipid=50,blipcolor=31,permissions={"repair.vehicle"}},
		["flatbed"] = {"Ladvogn",0, ""},
		["towtruck"] = {"TowTruck",0, ""}
	},
	["Teslak Auto A/S"] = {
		_config = {vtype="default",blipid=50,blipcolor=31,permissions={"teslak.vehicle"}},
		["dubsta"] = {"Pick Up",0, ""},
		["towtruck"] = {"TowTruck",0, ""},
		["flatbed"] = {"Ladvogn",0, ""}
	},
	["Lastbil garage"] = {
		_config = {vtype="default",blipid=477,blipcolor=4,permissions={"trucker.vehicle"}},
		["phantom"] = {"Phantom",0, ""},
		["packer"] = {"Packer",0, ""},
		["phantom3"] = {"Phantom High",0, ""}
	},
	["Fisker"] = {
		_config = {vtype="default",blipid=371,blipcolor=3,permissions={"fisher.vehicle"}},
		["suntrap"] = {"Fiskerbåd",0, ""}
	},
    ["Skraldemand"] = {
		_config = {vtype="default",blipid=50,blipcolor=81,permissions={"skraldemand.vehicle"}},
		["trash"] = {"Skraldebil",0, ""}
	},
	["Politihelikopter"] = {
		_config = {vtype="default",blipid=43,blipcolor=26,permissions={"police.vehicle"}},
		["polmav"] = {"Politihelikopter",0, ""}
	},
	["Politi og EMS båd"] = {
		_config = {vtype="default",blipid=455,blipcolor=26,permissions={"police.vehicle"}},
		["dinghy"] = {"Dinghy",0, ""},
		["ambuboat"] = {"Dinghy",0, ""}
	},
	["Politi og EMS både"] = {
		_config = {vtype="default",blipid=455,blipcolor=26,permissions={"emergency.vehicle"}},
		["dinghy"] = {"Dinghy",0, ""},
		["ambuboat"] = {"Dinghy",0, ""}
	},
	["Minelastbil"] = {
		_config = {vtype="default",blipid=477,blipcolor=4,permissions={"mining.vehicle"}},
		["rubble"] = {"Minelastbil 160KG",0, ""}
	},
	["Lægehelikopter"] = {
		_config  = {vtype="default",blipid=379,blipcolor=26,permissions={"emergency.vehicle"}},
		["supervolito"] = {"Lægehelikopter",0, ""}
	},  
	["Savværk"] = {
		_config  = {vtype="default",blipid=477,blipcolor=26,permissions={"tree.vehicle"}},
		["mule"] = {"Lastbil",0, ""}
	}, 
	["DemonsMC"] = {
		_config  = {vtype="default",blipid=477,blipcolor=26,permissions={"biker.vehicle"}},
		["hexor"] = {"Bike",0, ""}
	}, 
	["Advokat"] = {
		_config = {vtype="default",blipid=0,blipcolor=0,permissions={"advokat.vehicle"}},
		["wraith"] = {"Advokatbil",0, ""}
	},	
	["Civil båd"] = {
		_config  = {vtype="default",blipid=455,blipcolor=11},
		["seashark"] = {"Vandscooter",95000, ""},
		["seashark2"] = {"Vandscooter 2",95000, ""},
		["seashark3"] = {"Vandscooter 3",95000, ""},
		["toro"] = {"Toro",400000, ""},
		["toro2"] = {"Toro 2",400000, ""},
		["tropic"] = {"Tropic",185000, ""},
		["squalo"] = {"Squalo",160000, ""},
		["speeder"] = {"Speeder",425000, ""},
		["speeder2"] = {"Speeder 2",425000, ""},
		["jetmax"] = {"Jetmax",325000, ""},
		["dinghy"] = {"Dinghy",215000, ""},
		["dinghy2"] = {"Dinghy 2",215000, ""},
		["dinghy3"] = {"Dinghy 3",215000, ""},
		["dinghy4"] = {"Dinghy 4",215000, ""},
		["marquis"] = {"Marquis",1000000, ""},
	}
}

-- {garage_type,x,y,z,hidden,larger}
cfg.garages = {
	{"Minelastbil",2678.5417480469,2844.7697753906,39.969902038574,false,false},
	{"Taxa",916.49957275391,-163.49717712402,74.697868347168,false,false},
	{"DemonsMC",965.05633544922,-121.88689422608,74.353134155274,false,false},
	{"Johnson's pizzaria",289.47756958008,-954.86022949219,29.393228530884,false,false},  
	{"Mekaniker",468.99346923828,-594.82965087891,28.499515533447,false,false},  
	{"Mekaniker",-189.07847595215,6291.2768554688,31.488973617554,false,false},  
	{"Mekaniker",188.0345916748,2819.7502441406,44.374488830566,false,false},   
	{"Helikopter",-1090.0720214844,-2896.7944335938,13.746921348572,false,false},  
	{"Skraldemand",-459.29528808594,-1717.1359863281,18.639282226563,false,false},  
	{"Fisker",521.76110839844,-2872.54296875,-0.017442777752876,false,false}, 
	{"Stripper",152.67045593262,-1300.4711914062,29.116081237792,false,false},
	{"Lastbil garage",1184.154296875,-3243.0668945313,5.9887675857544,false,false},
	{"Teslak Auto A/S",-183.05157470704,-1374.5384521484,31.258228302002,false,false},
	{"Lastbil garage",160.06260681152,6407.921875,31.162828445435,false,false},
	{"Savværk",-598.49536132813,5298.60546875,70.214500427246,false,false},
	{"Politi og EMS båd",14.667664527893,-2812.0148925781,0.78065972685814,false,false},
	{"Politi og EMS båd",3855.5546875,4456.0424804688,-0.39966198801994,false,false},
	{"Politi og EMS båd",1732.5660400391,3987.9177246094,29.230627059937,false,false},
	{"Politi og EMS både",14.667664527893,-2812.0148925781,0.78065972685814,false,false},
	{"Politi og EMS både",3855.5546875,4456.0424804688,-0.39966198801994,false,false},
	{"Politi og EMS både",1732.5660400391,3987.9177246094,29.230627059937,false,false},
	{"Civil båd",-1787.3944091797,-1236.5512695313,0.88065972685814,false,true},
	{"Civil båd",1288.5843505859,4227.2446289063,31.054125213623,false,true},
	{"Civil båd",-844.21350097656,-1372.3095703125,-0.47438749670982,false,true},
	{"Civil båd",-1602.2725830078,5260.0571289063,-0.4744359254837,false,true},
	{"Postbud",62.344345092773,100.39775848389,78.973655700684,true,false},
    {"Advokat",69.736633300781,-708.87164306641,44.126056671143,true,false},	
	{"Politi Civil",433.42395019531,-1014.0863647461,28.772174835205,true,false},
	{"Politi",449.88772583008,-1012.7086791992,28.492702484131,true,false},
	{"Politi Civil",1862.9106445313,3703.884765625,33.457592010498,true,false},
	{"Politi",1869.4213867188,3694.3129882813,33.598960876465,true,false},
	{"Politi Civil",-474.39505004883,6029.3872070313,31.340530395508,true,false},
	{"Politi",-479.62719726563,6024.6723632813,31.340526580811,true,false},
	{"Politihelikopter",449.43023681641,-981.28009033203,43.691646575928,true,false}, 
	{"Politihelikopter",-474.74252319336,5989.5048828125,31.336685180664,true,false},
	{"Politihelikopter",1811.0076904297,3723.6652832031,35.42512512207,true,false}, 	
	{"Lægehelikopter",313.36541748047,-1465.0029296875,46.5094871521,true,false},
	{"Lægehelikopter",1770.2442626953,3239.7348632813,42.126319885254,true,false},
	{"Lægehelikopter",-474.74252319336,5989.5048828125,31.336685180664,true,false},
	{"Lægehelikopter",1811.0076904297,3723.6652832031,35.42512512207,true,false},
	{"Ambulanceredder",1157.1373291016,-1607.4422607422,34.692581176758,true,false},
	{"Ambulanceredder",1842.1536865234,3707.4333496094,33.503708343506,true,false},
	{"Ambulanceredder",-264.47171020508,6335.171875,32.421092987061,true,false},
	{"Ambulanceredder",295.31701660156,-1439.5307617188,29.80409812927,true,false}
}

return cfg
