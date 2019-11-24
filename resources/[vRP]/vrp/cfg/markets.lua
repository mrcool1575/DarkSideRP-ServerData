
local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {

	["Butik"] = {
		_config = {blipid=52, blipcolor=2},
		["milk"] = 2,
		["beer"] = 30,
		["beer2"] = 25,
		["water"] = 2,
		["coffee"] = 4,
		["tea"] = 4,
		["icetea"] = 8,
		["orangejuice"] = 8,
		["gocagola"] = 12,
		["redgull"] = 12,
		["lemonlimonad"] = 14,
		["vodka"] = 30,
		["bread"] = 2,
		["donut"] = 2,
		["tacos"] = 8,
		["sandwich"] = 20,
		["kebab"] = 20,
		["pdonut"] = 65,
		["kuglepen"] = 120,
		["jointpapir"] = 5
	},
	["Apotek"] = {
		_config = {blipid=51, blipcolor=2},
		["firstaidkit"] = 17500
	},
	["Dykkerudstyr"] = {
		_config = {blipid=366, blipcolor=40},
		["dykkerdragt"] = 55000,
	},
	["Telefonbutik"] = {
		_config = {blipid=459, blipcolor=13},
		["phone"] = 5000,
		["phone1"] = 5000
	}, 
	["Ambulanceredder"] = {
		_config = {blipid=51, blipcolor=68, permissions={"emergency.market"}},
		["medkit"] = 0,
		["bandage"] = 0,
		["water"] = 0,
		["sandwich"] = 0
	},
	["politireder"] = {
		_config = {blipid=51, blipcolor=68, permissions={"politi.koleskab"}},
		["medkit"] = 0,
		["bandage"] = 0,
		["water"] = 0,
		["sandwich"] = 0
	},
	["Værktøj"] = {
		_config = {blipid=402, blipcolor=47, permissions={"repair.market"}},
		["repairkit"] = 50,
		["lockpicking_kit"] = 50,
		["screwdriver"] = 50,
	},
	["Skraldesække"] = {
		_config = {blipid=402, blipcolor=47, permissions={"skraldemand.market"}},
		["skraldesæk"] = 0
	},
	["Bar"] = { 
		_config = {blipid=0, blipcolor=0},
		["beer"] = 30,
		["beer2"] = 30,
		["vodka"] = 30,
		["mokai"] = 30,
		["hvidvin"] = 30,
		["rodvin"] = 30,
		["redgull"] = 30,
		["water"] = 30,
		["icetea"] = 8,
		["gocagola"] = 12
	},
	["Gunnars Køkken"] = { 
		_config = {blipid=0, blipcolor=0},
		["vand2"] = 0,
		["juicebrik"] = 0,
		["budding"] = 0,
		["mos"] = 0
	},
	["politi"] = {
		_config = {blipid=40, blipcolor=5,permissions={"politi.koleskab"}},
		["milk"] = 0,
		["beer"] = 0,
		["beer2"] = 0,
		["water"] = 0,
		["coffee"] = 0,
		["tea"] = 0,
		["icetea"] = 0,
		["orangejuice"] = 0,
		["gocagola"] = 0,
		["redgull"] = 0,
		["lemonlimonad"] = 0,
		["vodka"] = 0,
		["bread"] = 0,
		["donut"] = 0,
		["tacos"] = 0,
		["sandwich"] = 0,
		["kebab"] = 0,
		["pdonut"] = 0,
		["kuglepen"] = 0,
		["jointpapir"] = 0
	},
	["Køleskab"] = {
		_config = {blipid=40, blipcolor=5,permissions={"fucking.koleskab"}},
		["pizza4"] = 70,
		["pizza6"] = 70,
		["pizza7"] = 70,
		["sandwich"] = 35,
		["bolle"] = 20,
		["kebab"] = 20,
		["lemonlimonad"] = 14,
		["milk"] = 12,
		["vodka"] = 40,
		["beer2"] = 20,
		["water"] = 10,
		["cocio"] = 20,
		["rødvin"] = 50,
		["hvidvin"] = 50,
		["mokai"] = 20,
		["coffee"] = 20
	},
	["Køleskab2"] = {
		_config = {blipid=40, blipcolor=5,permissions={"fucking.koleskab"}},
		["pizza4"] = 70,
		["pizza6"] = 70,
		["pizza7"] = 70,
		["sandwich"] = 35,
		["kebab"] = 20,
		["lemonlimonad"] = 14,
		["milk"] = 12,
		["vodka"] = 40,
		["beer2"] = 20,
		["water"] = 10,
		["rødvin"] = 50,
		["hvidvin"] = 50,
		["mokai"] = 20,
		["coffee"] = 20
	},
}

-- list of markets {type,x,y,z,hidden}
cfg.markets = {
	{"Butik",-47.522762298584,-1756.85717773438,29.4210109710693,false},
	{"Butik",25.7454013824463,-1345.26232910156,29.4970207214355,false}, 
	{"Butik",1135.57678222656,-981.78125,46.4157981872559,false},
	{"politi",436.34005737304,-986.49426269532,30.689584732056,false},
	{"politireder",469.98071289062,-986.56451416016,30.689599990844,false},  
	{"Butik",1163.53820800781,-323.541320800781,69.2050552368164,false}, 
	{"Butik",374.190032958984,327.506713867188,103.566368103027,false}, 
	{"Butik",2555.35766601563,382.16845703125,108.622947692871,false}, 
	{"Butik",2676.76733398438,3281.57788085938,55.2411231994629,false}, 
	{"Butik",1960.50793457031,3741.84008789063,32.3437385559082,false},
	{"Butik",1393.23828125,3605.171875,34.9809303283691,true}, 
	{"Gunnars Køkken",1628.9061279297,2543.6860351563,45.564865112305,true}, 
	{"Butik",1166.18151855469,2709.35327148438,38.15771484375,false}, 
	{"Butik",547.987609863281,2669.7568359375,42.1565132141113,false}, 
	{"Butik",1698.30737304688,4924.37939453125,42.0636749267578,false}, 
	{"Butik",1729.54443359375,6415.76513671875,35.0372200012207,false}, 
	{"Butik",-3243.9013671875,1001.40405273438,12.8307056427002,false}, 
	{"Butik",-2967.8818359375,390.78662109375,15.0433149337769,false}, 
	{"Butik",-3041.17456054688,585.166198730469,7.90893363952637,false}, 
	{"Butik",-1820.55725097656,792.770568847656,138.113250732422,false}, 
	{"Butik",-1486.76574707031,-379.553985595703,40.163387298584,false}, 
	{"Butik",-1223.18127441406,-907.385681152344,12.3263463973999,false}, 
	{"Butik",-707.408996582031,-913.681701660156,19.2155857086182,false},
	{"Apotek",356.5361328125,-593.474304199219,28.7820014953613,false},
	{"Apotek",-242.88917541504,6325.7241210938,32.42618560791,false},
	{"Apotek",1815.8848876953,3678.9538574219,34.276477813721,false},
	{"Telefonbutik",338.05099487305,-776.43994140625,29.266498565674,242.46061706543,false}, -- Midtbyen
	{"Telefonbutik",66.879417419434,-1467.9372558594,29.291164398193,false}, -- Syd
	{"Telefonbutik",-11.724335670471,6500.0444335938,31.498868942261,false}, -- Nord
	{"Værktøj",966.40057373047,-2992.2470703125,-39.646965026855,false},
	{"Skraldesække",-429.42758178711,-1727.9305419922,19.783836364746,false},
	{"Bar",128.83824157714,-1282.4530029296,29.271251678466,true},
	{"Bar",-559.93737792969,286.55841064453,82.176445007324,true},
	{"Bar",-1393.2857666016,-606.36651611328,30.319547653198,true},
	{"Ambulanceredder",268.9587097168,-1361.146118164,24.53779220581,true},
	{"Køleskab",-803.26165771484,185.62341308594,72.205514526367,true}, -- Rockford Hills 3
	{"Køleskab2",-11.294752120972,516.56695556641,174.42805175781,true}, -- Whispymound 3671
	{"Dykkerudstyr",-2020.3081054688,-1044.6666259766,2.4468867778778,false},
}

return cfg
