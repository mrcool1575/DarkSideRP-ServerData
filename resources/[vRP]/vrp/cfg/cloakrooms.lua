

local cfg = {}

local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
local emergency_male = { model = "s_m_m_paramedic_01" }
local emergency_female = { model = "s_f_y_scrubs_01" }
local cop_male = { model = "s_m_y_cop_01" }
local cop_female = { model = "s_f_y_cop_01" }
local fbi_male = { model = "s_m_m_ciasec_01" }
local fbi_female = { model = "ig_michelle" }
local sheriff_male = { model = "s_m_y_sheriff_01"}
local sheriff_female = { model = "s_f_y_ranger_01"}
local swat_male = { model = "s_m_y_swat_01"}
local hway_cop = { model = "s_m_y_hwaycop_01"}
local swat1_male = { model = "s_m_y_blackops_01"}

for i=0,19 do
	surgery_female[i] = {0,0}
	surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
	["Politi"] = {
		_config = {
			permissions = {"police.cloakroom"}
		},
		["Betjent (Mand)"] = cop_male,
		["Betjent (Kvinde)"] = cop_female,
		["Civilbetjent (Mand)"] = fbi_male,
		["Civilbetjent (Kvinde)"] = fbi_female,
		["Indsatsleder (Mand)"] = sheriff_male,
		["MC Betjent (Mand)"] = hway_cop,
		["AKS (Mand)"] = swat_male,
		["Semi AKS (Mand)"] = swat1_male
	},
	["Ambulanceredder"] = {
		_config = {
			permissions = {"emergency.cloakroom"}
		},
		["Mand"] = emergency_male,
		["Kvinde"] = emergency_female
	},
	["Køn"] = {
		_config = {
			not_uniform = true
		},
		["Mand"] = surgery_male,
		["Kvinde"] = surgery_female
	}
}

cfg.cloakrooms = {
	{"Politi", 459.8098449707,-988.98229980469,30.689601898193},
	{"Politi", 1857.1024169922,3689.2727050781,34.267082214355},
	{"Politi", 875,31.716392517-448.68127441406,6015.987304609},
	{"Ambulanceredder",268.59744262696,-1365.6673583984,24.53779220581},
	{"Køn",75.3451766967773,-1392.86596679688,29.3761329650879},
	{"Køn",-700.089477539063,-151.570571899414,37.4151458740234},
	{"Køn",-170.416717529297,-296.563873291016,39.7332878112793},
	{"Køn",425.61181640625,-806.519897460938,29.4911422729492},
	{"Køn",-822.166687011719,-1073.58020019531,11.3281087875366},
	{"Køn",-1186.25744628906,-771.20166015625,17.3308639526367},
	{"Køn",-1450.98388671875,-238.164260864258,49.8105850219727},
	{"Køn",4.44537162780762,6512.244140625,31.8778476715088},
	{"Køn",1693.91735839844,4822.66162109375,42.0631141662598},
	{"Køn",118.071769714355,-224.893646240234,54.5578384399414},
	{"Køn",620.459167480469,2766.82641601563,42.0881042480469},
	{"Køn",1196.89221191406,2710.220703125,38.2226066589355},
	{"Køn",-3178.01000976563,1043.21044921875,20.8632164001465},
	{"Køn",-1101.15161132813,2710.8203125,19.1078643798828},
	{"Køn",459.40258789063,-992.83648681641,30.689605712891}
}

return cfg
