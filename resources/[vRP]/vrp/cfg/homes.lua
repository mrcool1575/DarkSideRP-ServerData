local cfg = {}

-- example of study transformer
local itemtr_study = {
	name="Kurser", -- menu name
	r=0,g=255,b=0, -- color
	max_units=100,
	units_per_minute=33,
	x=0,y=0,z=0, -- pos (doesn't matter as home component)
	radius=1.1, height=1.5, -- area
	recipes = {
		["Lær førstehjælp"] = { -- action name
			description="Læs førstehjælp", -- action description
			work=2,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={ -- optional
				["lifesaving.firstaid"] = 2 -- "group.aptitude", give 1 exp per unit
			}
		}
	}
}
------------------------------------------------ hacker
local itemtr_hacker = {
	name="Hack", -- menu name
	r=0,g=255,b=0, -- color
	max_units=20,
	units_per_minute=10,
	x=0,y=0,z=0, -- pos (doesn't matter as home component)
	radius=1.1, height=1.5, -- area
	recipes = {
		["PDF"] = { -- action name
			description="Læs en PDF", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={["hacker.logic"] = 10}
		},
		["C++ PDF"] = { -- action name
			description="Læs en C++ PDF", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={["hacker.c++"] = 1}
		},
		["LUA PDF"] = { -- action name
			description="Læs en LUA PDF", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={["hacker.lua"] = 1}
		}
	}
}

cfg.slot_types = {
	["basic_flat"] = {
		{
			{"entry",-774.131,331.090,207.621},
			{"chest",-782.118591308594,332.147399902344,207.629608154297, _config = {weight=1800}},
			{"wardrobe",-795.118469238281,331.631256103516,201.42431640625},
			{"gametable",-800.763427734375,338.574951171875,206.239105224609},
			{"itemtr", _config = itemtr_study, -797.283447265625,342.134338378906,206.21842956543},
			{"itemtr", _config = itemtr_hacker, -777.960876464844,330.808135986328,207.620849609375}
		},
		{
			{"entry",-774.551,331.526,159.998},
			{"chest",-782.66015625,332.523284912109,160.010223388672, _config = {weight=1800}},
			{"wardrobe",-795.550964355469,332.229614257813,153.804931640625},
			{"gametable",-801.228942871094,339.106231689453,158.619750976563},
			{"itemtr", _config = itemtr_study, -797.896728515625,342.543273925781,158.599044799805},
			{"itemtr", _config = itemtr_hacker, -778.430236816406,331.083160400391,160.001556396484}
		},
		{
			{"entry",-596.436,56.054,108.030},
			{"chest",-604.427001953125,57.0807762145996,108.035743713379, _config = {weight=1800}},
			{"wardrobe",-617.180358886719,56.9536590576172,101.830520629883},
			{"gametable",-623.078796386719,63.688045501709,106.645317077637},
			{"itemtr", _config = itemtr_study, -619.724853515625,67.1367950439453,106.624366760254},
			{"itemtr", _config = itemtr_hacker, -600.219604492188,55.7631721496582,108.027030944824}
		},
		{
			{"entry",-1450.029,-525.737,69.556},
			{"chest",-1457.28601074219,-529.699523925781,69.565315246582, _config = {weight=1800}},
			{"wardrobe",-1467.07995605469,-536.98583984375,63.3601188659668},
			{"gametable",-1476.12658691406,-534.873474121094,68.1748962402344},
			{"itemtr", _config = itemtr_study, -1475.36840820313,-530.117126464844,68.1540756225586},
			{"itemtr", _config = itemtr_hacker, -1452.96923828125,-528.350952148438,69.5566177368164}
		},
		{
			{"entry",-1450.024,-525.772,56.929},
			{"chest",-1457.3740234375,-529.737854003906,56.9376449584961, _config = {weight=1800}},
			{"wardrobe",-1467.7158203125,-537.308349609375,50.732494354248},
			{"gametable",-1476.12670898438,-534.895751953125,55.547306060791},
			{"itemtr", _config = itemtr_study, -1475.39453125,-530.135192871094,55.5264129638672},
			{"itemtr", _config = itemtr_hacker, -1452.95886230469,-528.371948242188,56.9289970397949}
		},
		{
			{"entry",-907.099,-372.492,109.440},
			{"chest",-914.79296875,-375.26416015625,109.448974609375, _config = {weight=1800}},
			{"wardrobe",-926.047912597656,-381.470153808594,103.243774414063},
			{"gametable",-934.216979980469,-378.082336425781,108.05859375},
			{"itemtr", _config = itemtr_study, -932.810302734375,-373.413330078125,108.03776550293},
			{"itemtr", _config = itemtr_hacker, -910.40234375,-374.561859130859,109.440299987793}
		},
		{
			{"entry",-923.034,-378.545,85.480},
			{"chest",-915.268737792969,-375.818084716797,85.4891815185547, _config = {weight=1800}},
			{"wardrobe",-904.0673828125,-369.910552978516,79.2839508056641},
			{"gametable",-895.890075683594,-373.167846679688,84.0987701416016},
			{"itemtr", _config = itemtr_study, -897.224792480469,-377.828887939453,84.0779266357422},
			{"itemtr", _config = itemtr_hacker, -919.742492675781,-376.550506591797,85.4804763793945}
		},
		{
			{"entry",-467.662,-708.605,77.086},
			{"chest",-466.566558837891,-700.528991699219,77.0956268310547, _config = {weight=1800}},
			{"wardrobe",-466.892852783203,-687.88720703125,70.8903503417969},
			{"gametable",-459.870513916016,-682.054565429688,75.7051773071289},
			{"itemtr", _config = itemtr_study, -456.510467529297,-685.274841308594,75.6842498779297},
			{"itemtr", _config = itemtr_hacker, -467.985504150391,-704.850036621094,77.0868835449219}
		},
		{
			{"entry",-468.051,-689.548,53.402},
			{"chest",-469.077453613281,-697.664672851563,53.4144515991211, _config = {weight=1800}},
			{"wardrobe",-468.939910888672,-710.398986816406,47.2093048095703},
			{"gametable",-475.543884277344,-716.226867675781,52.0241050720215},
			{"itemtr", _config = itemtr_study, -479.113037109375,-712.874938964844,52.0032043457031},
			{"itemtr", _config = itemtr_hacker, -467.812896728516,-693.403869628906,53.4058074951172}
		}
	},
	["other_flat"] = {
		{
			{"entry",-784.854,323.584,211.996},
			{"chest",-766.744384765625,328.375,211.396545410156, _config = {weight=3600}},
			{"wardrobe",-793.502136230469,326.861846923828,210.796630859375},
			{"gametable",-781.973083496094,338.788482666016,211.231979370117},
			{"itemtr", _config = itemtr_study, -778.560241699219,333.439453125,211.197128295898},
			{"itemtr", _config = itemtr_hacker, -762.913757324219,332.328216552734,211.396484375}
		},
		{
			{"entry",-603.125,58.982,98.200},
			{"chest",-621.323669433594,54.2074241638184,97.5995330810547, _config = {weight=3600}},
			{"wardrobe",-594.668823242188,55.5750961303711,96.9996185302734},
			{"gametable",-606.140441894531,43.8849754333496,97.4350128173828},
			{"itemtr", _config = itemtr_study, -608.968322753906,49.1769981384277,97.4001312255859},
			{"itemtr", _config = itemtr_hacker, -625.2353515625,50.4472694396973,97.5995254516602}
		},
		{
			{"entry",-1452.305,-540.387,74.044},
			{"chest",-1466.57763671875,-528.339294433594,73.4436492919922, _config = {weight=3600}},
			{"wardrobe",-1449.85034179688,-549.231323242188,72.8437194824219},
			{"gametable",-1466.37182617188,-546.663757324219,73.279052734375},
			{"itemtr", _config = itemtr_study, -1463.84411621094,-541.1962890625,73.2442169189453},
			{"itemtr", _config = itemtr_hacker, -1472.04296875,-527.374267578125,73.4436416625977}
		},
		{
			{"entry",-912.792,-365.110,114.274},
			{"chest",-926.693176269531,-377.596130371094,113.674102783203, _config = {weight=3600}},
			{"wardrobe",-903.66650390625,-364.023223876953,113.074157714844},
			{"gametable",-908.407165527344,-379.825714111328,113.509590148926},
			{"itemtr", _config = itemtr_study, -913.553588867188,-376.692016601563,113.474617004395},
			{"itemtr", _config = itemtr_hacker, -928.425598144531,-382.820159912109,113.67407989502}
		}
	},
	["hillcrest_2862"] = {
		{
			{"entry",-682.25927734375,592.38665771484,145.3929901123},
			{"chest",-671.66259765625,581.21563720704,144.97026062012, _config = {weight=5000}},
			{"wardrobe",-671.67584228516,587.41827392578,141.56982421875},
			{"gametable",-667.28289794922,582.45123291016,144.99137878418},
			{"itemtr", _config = itemtr_study, -682.49377441406,595.89477539062,137.76594543458},
			{"itemtr", _config = itemtr_hacker, -675.53448486328,589.27001953125,137.76976013184}
		}
	},
	["hillcrest_2874"] = {
		{
			{"entry",-859.88775634766,691.07940673828,152.86071777344},
			{"chest",-859.17980957032,675.21997070312,152.45338439942, _config = {weight=5000}},
			{"wardrobe",-855.3422241211,680.181640625,149.05296325684},
			{"gametable",-854.4730834961,673.67510986328,152.48028564454},
			{"itemtr", _config = itemtr_study, -863.05639648438,692.94213867188,145.25280761718},
			{"itemtr", _config = itemtr_hacker, -862.6376953125,700.24072265625,145.25300598144}
		}
	},
	["mad_wayne_thunder_2113"] = {
		{
			{"entry",-1289.750366211,449.55059814454,97.90251159668},
			{"chest",-1290.3693847656,433.66738891602,97.49510192871, _config = {weight=5000}},
			{"wardrobe",-1286.1365966796,438.11212158204,94.094818115234},
			{"gametable",-1285.7749023438,431.61834716796,97.52214050293},
			{"itemtr", _config = itemtr_study, -1292.9389648438,451.55081176758,90.294616699218},
			{"itemtr", _config = itemtr_hacker, -1291.8834228516,458.83129882812,90.294616699218}
		}
	},
	["normandy_2117"] = {
		{
			{"entry",-571.93273925782,661.89178466796,145.83987426758},
			{"chest",-576.38037109375,646.50732421875,145.43251037598, _config = {weight=5000}},
			{"wardrobe",-571.14770507812,649.9058227539,142.03213500976},
			{"gametable",-572.5669555664,643.47204589844,145.45962524414},
			{"itemtr", _config = itemtr_study, -574.39739990234,664.38293457032,138.23197937012},
			{"itemtr", _config = itemtr_hacker, -571.74578857422,671.3052368164,138.23197937012}
		}
	},
	["north_conker_2044"] = {
		{
			{"entry",341.880,437.759,149.394},
			{"chest",328.5173034668,430.13842773438,148.97131347656, _config = {weight=5000}},
			{"wardrobe",334.40032958984,428.49002075196,145.57090759278},
			{"gametable",328.61373901368,425.75439453125,148.99256896972},
			{"itemtr", _config = itemtr_study, 345.31307983398,437.0609741211,141.7670288086},
			{"itemtr", _config = itemtr_hacker, 337.04071044922,431.87118530274,141.7707824707}
		}
	},
	["north_conker_2045"] = {
		{
			{"entry",373.71838378906,423.68692016602,145.90785217286},
			{"chest",369.33474731446,408.25213623046,145.50053405762, _config = {weight=5000}},
			{"wardrobe",374.40264892578,411.73895263672,142.10028076172},
			{"gametable",373.0806274414,405.1827697754,145.5274963379},
			{"itemtr", _config = itemtr_study, 371.13583374024,426.13513183594,138.2999572754},
			{"itemtr", _config = itemtr_hacker, 374.02404785156,433.18807983398,138.2999572754}
		}
	},
	["wild_oats_3655"] = {
		{
			{"entry",-174.27947998046,497.62170410156,137.6668548584},
			{"chest",-170.5906829834,482.64450073242,137.24424743652, _config = {weight=5000}},
			{"wardrobe",-167.4889831543,487.82168579102,133.84381103516},
			{"gametable",-166.12393188476,481.45397949218,137.26531982422},
			{"itemtr", _config = itemtr_study, -172.6614074707,500.60311889648,130.04000854492},
			{"itemtr", _config = itemtr_hacker, -169.88256835938,491.48318481446,130.04354858398}
		}
	},
	["whispymound_3677"] = {
		{
			{"entry",117.1784210205,559.80603027344,184.30485534668},
			{"chest",118.35543060302,543.90454101562,183.89755249024, _config = {weight=5000}},
			{"wardrobe",122.00944519042,548.93389892578,180.4972076416},
			{"gametable",123.03867340088,542.50183105468,183.92448425292},
			{"itemtr", _config = itemtr_study, 114.01847076416,561.49688720704,176.69696044922},
			{"itemtr", _config = itemtr_hacker, 114.31466674804,568.91192626954,176.696975708}
		}
	},
	["latorre"] = {
		{
			{"entry",1396.7633056641,1141.8763427734,114.33366394043},
			{"chest",1397.8409423828,1164.1024169922,114.33365631104, _config = {weight=5000}},
			{"wardrobe",1400.3676757813,1159.6374511719,114.33363342285},
			{"gametable",1396.7829589844,1132.1831054688,114.33366394043}
		}
	},
	["whispymound_3671"] = {
		{
			{"entry",7.6060,538.6470,175.7281},
			{"chest",-9.7932,531.2894,170.6170, _config = {weight=5000}},
			{"wardrobe",9.012,528.7733,170.6349},
			{"gametable",4.4078,526.8072,174.6281},
			{"itemtr", _config = itemtr_study, -1.3617,535.8567,175.3424}
		},
		{
			{"entry",7.6060,538.6470,175.7281},
			{"chest",-9.7932,531.2894,170.6170, _config = {weight=5000}},
			{"wardrobe",9.012,528.7733,170.6349},
			{"gametable",4.4078,526.8072,174.6281},
			{"itemtr", _config = itemtr_study, -1.3617,535.8567,175.3424}
		},
		{
			{"entry",7.6060,538.6470,175.7281},
			{"chest",-9.7932,531.2894,170.6170, _config = {weight=5000}},
			{"wardrobe",9.012,528.7733,170.6349},
			{"gametable",4.4078,526.8072,174.6281},
			{"itemtr", _config = itemtr_study, -1.3617,535.8567,175.3424}
		},
		{
			{"entry",7.6060,538.6470,175.7281},
			{"chest",-9.7932,531.2894,170.6170, _config = {weight=5000}},
			{"wardrobe",9.012,528.7733,170.6349},
			{"gametable",4.4078,526.8072,174.6281},
			{"itemtr", _config = itemtr_study, -1.3617,535.8567,175.3424}
		},
		{
			{"entry",7.6060,538.6470,175.7281},
			{"chest",-9.7932,531.2894,170.6170, _config = {weight=5000}},
			{"wardrobe",9.012,528.7733,170.6349},
			{"gametable",4.4078,526.8072,174.6281},
			{"itemtr", _config = itemtr_study, -1.3617,535.8567,175.3424}
		},
	},
	["forumdrive_strawberry_4"] = {
		{
			{"entry",-14.2322,-1440.3913,30.9015},
			{"chest",-16.0440,-1430.3275,31.1015, _config = {weight=5000}},
			{"wardrobe",-17.8481,-1438.9688,31.1015},
			{"gametable",-10.1347,-1439.0474,31.1015},
			{"itemtr", _config = itemtr_study, -12.1933,-1435.1318,31.1015}
		},
	},
	-- ["lostmc"] = {
  	--	{    
	--	    {"entry",997.38403320313,-3158.2131347656,-38.907146453857},    
	--	    {"chest",1008.3574829102,-3171.3195800781,-38.894241333008, _config = {weight=5000}},    
	--	    {"wardrobe",1009.9095458984,-3167.849609375,-38.907115936279},
	--		{"gametable",1008.1345825195,-3164.3996582031,-34.077457427979}
    --	}
    --},
	 ["uno_por_ciento"] = {
  		{    
		    {"entry",1109.9649658203,-3166.7919921875,-37.518585205078},    
		    {"chest",1122.6766357422,-3161.7785644531,-36.870491027832, _config = {weight=5000}},    
		    {"wardrobe",1116.8862304688,-3162.8510742188,-36.870483398438}
    	}
   	},
	["Gambino"] = {
		{
			{"entry",-76.541931152344,-826.51110839844,243.38577270508},
			{"chest",-81.75080871582,-801.22509765625,243.40075683594, _config = {weight=5000}},
			{"wardrobe",-78.823265075684,-810.94653320313,243.38581848145},
			{"gametable",-62.057289123535,-808.47436523438,243.38592529297},
			{"itemtr", _config = itemtr_study,-64.920196533203,-814.76989746094,243.38592529297},
			{"itemtr", _config = itemtr_hacker,-80.527236938477,-801.76458740234,243.40078735352}
		}
	},
	--["acardius"] = {
	--	{
	--		{"entry",-140.79359436035,-617.57257080078,168.82051086426},
	--		{"chest",-128.04237365723,-633.68511962891,168.82051086426, _config = {weight=5000}},
	--		{"wardrobe",-131.65711975098,-628.21618652344,168.75799560547},
	--		{"gametable",-148.03350830078,-643.97326660156,168.82046508789},
	--		{"itemtr", _config = itemtr_study,-145.68884277344,-636.66333007813,168.82049560547},
	--		{"itemtr", _config = itemtr_hacker,-126.03672027588,-641.14959716797,168.8353729248}
	--	}
	--},
	["rockford_hills_3"] = {
		{
			{"entry",-796.05676269531,178.78352355957,76.712287902832},
			{"chest",-793.84295654297,179.25816345215,76.712287902832, _config = {weight=2500}},
			{"wardrobe",-797.94866943359,177.66410827637,76.712326049805}
		}
	},
	["Midtown_Penthouse_1"] = {
		{
			{"entry",-30.75048828125,-595.34356689453,80.030899047852},
			{"chest",-11.028531074524,-597.24609375,79.430213928223, _config = {weight=3600}},
			{"wardrobe",-38.09086227417,-589.00402832031,78.830322265625},
			{"gametable",-23.548984527588,-582.84271240234,79.866142272949},
			{"itemtr", _config = itemtr_study,-22.03270149231,-587.62487792969,79.23152923584},
			{"itemtr", _config = itemtr_hacker,-8.1155815124512,-594.30560302734,79.430229187012}
		}
	},
	["Midtown_Penthouse_2"] = {
		{
			{"entry",-18.575986862183,-591.17614746094,90.114906311035},
			{"chest",-26.886922836304,-588.41809082031,90.123573303223, _config = {weight=3800}},
			{"wardrobe",-37.156406402588,-583.82513427734,83.918319702148},
			{"gametable",-41.978778839111,-574.74835205078,88.712257385254,261},
			{"itemtr", _config = itemtr_study,-37.432102203369,-572.79821777344,88.712226867676},
			{"itemtr", _config = itemtr_hacker,-22.701108932495,-591.70928955078,90.114791870117}
		}
	},
	["3"] = {
		{
			{"entry",-269.91424560547,-941.03466796875,92.510879516602},
			{"chest",-272.31237792969,-948.96014404297,92.518508911133, _config = {weight=2000}},
			{"wardrobe",-277.69302368164,-960.16455078125,86.314407348633},
			{"gametable",-275.23767089844,-968.24713134766,91.108329772949},
			{"itemtr", _config = itemtr_study,-287.83438110352,-959.49340820313,91.108329772949},
			{"itemtr", _config = itemtr_hacker,-270.2272644043,-945.27661132813,92.510887145996}
		}
	},
	["4"] = {
		{
			{"entry",-467.52453613281,-708.71240234375,77.086875915527},
			{"chest",-467.62731933594,-700.18237304688,77.095207214355, _config = {weight=2000}},
			{"wardrobe",-466.68759155273,-688.01440429688,70.890403747559},
			{"gametable",-460.04055786133,-680.93377685547,75.68433380127},
			{"itemtr", _config = itemtr_study,-457.10317993164,-685.25836181641,75.684341430664},
			{"itemtr", _config = itemtr_hacker,-468.892578125,-704.57635498047,77.086906433105}
		}
	},
	["5"] = {
		{
			{"entry",-782.00500488281,326.22247314453,223.25758361816},
			{"chest",-772.74066162109,326.37301635742,223.26628112793, _config = {weight=2000}},
			{"wardrobe",-760.8203125,325.65524291992,217.06112670898},
			{"gametable",-754.81085205078,318.3493347168,221.85498046875},
			{"itemtr", _config = itemtr_study,-758.81530761719,315.57727050781,221.85511779785},
			{"itemtr", _config = itemtr_hacker,-777.78344726563,327.41662597656,223.25761413574}
		}
	},
	["6"] = {
		{
			{"entry",-912.95349121094,-365.26663208008,114.27474975586},
			{"chest",-927.86578369141,-377.95306396484,113.67407226563, _config = {weight=2000}},
			{"wardrobe",-904.21252441406,-363.35284423828,113.07417297363},
			{"gametable",-908.17645263672,-380.73883056641,113.47462463379},
			{"itemtr", _config = itemtr_study,-912.99499511719,-376.79867553711,113.47462463379},
			{"itemtr", _config = itemtr_hacker,-928.02563476563,-382.41354370117,113.67407226563}
		}
	},
	["7"] = {
		{
			{"entry",-907.15960693359,-372.50311279297,109.44026947021},
			{"chest",-914.35766601563,-376.30621337891,109.44828796387, _config = {weight=2000}},
			{"wardrobe",-926.10345458984,-381.53771972656,103.24379730225},
			{"gametable",-934.83447265625,-378.70867919922,108.03772735596},
			{"itemtr", _config = itemtr_study,-932.82293701172,-374.48406982422,108.03857421875},
			{"itemtr", _config = itemtr_hacker,-910.51715087891,-375.60025024414,109.44036102295}
		}
	},
	["8"] = {
		{
			{"entry",-921.90008544922,-380.64822387695,85.480476379395},
			{"chest",-915.28594970703,-374.54666137695,85.488975524902, _config = {weight=2000}},
			{"wardrobe",-904.40454101563,-369.91485595703,79.283988952637},
			{"gametable",-895.21276855469,-373.12051391602,84.077919006348},
			{"itemtr", _config = itemtr_study,-896.99694824219,-376.62847900391,84.083847045898},
			{"itemtr", _config = itemtr_hacker,-919.29058837891,-375.58981323242,85.480506896973}
		}
	},
	["9"] = {
		{
			{"entry",-907.82745361328,-453.37539672852,126.53440856934},
			{"chest",-899.89459228516,-449.60485839844,126.54309844971, _config = {weight=2000}},
			{"wardrobe",-889.39984130859,-444.73895263672,120.33792877197},
			{"gametable",-880.4921875,-447.50827026367,125.09782409668},
			{"itemtr", _config = itemtr_study,-881.58813476563,-450.9775390625,125.15274810791},
			{"itemtr", _config = itemtr_hacker,-903.55291748047,-449.93240356445,126.53423309326}
		}
	},
	["10"] = {
		{
			{"entry",-890.84857177734,-452.88397216797,95.461082458496},
			{"chest",-894.80975341797,-445.71347045898,95.468734741211, _config = {weight=2000}},
			{"wardrobe",-899.68273925781,-433.71728515625,89.264610290527},
			{"gametable",-896.81854248047,-425.12133789063,94.058547973633},
			{"itemtr", _config = itemtr_study,-892.85137939453,-426.5217590332,94.07942199707},
			{"itemtr", _config = itemtr_hacker,-894.10607910156,-448.96545410156,95.461097717285}
		}
	},	
	["Trailer"] = {
		{
			{"entry",1973.3017578125,3815.9514160156,33.428787231445},
			{"chest",1978.2276611328,3819.5556640625,33.450042724609, _config = {weight=5000}},
			{"wardrobe",1969.3685302734,3814.9196777344,33.428722381592},
			{"gametable",1976.0366210938,3820.9108886719,33.450057983398}
		}
	},
	--["AK_Kartellet"] = {
		--{
			--{"entry",-774.29119873047,341.89221191406,196.68630981445},
			--{"chest",-765.68756103516,331.36862182617,196.0858001709, _config = {weight=5000}},
			--{"wardrobe",-763.25225830078,329.24182128906,199.48873901367},
		--}
	--},
	["Cheap_Home_3"] = {
		{
			{"entry",346.56420898438,-1012.6823730469,-99.196243286133},
			{"chest",351.42984008789,-998.90441894531,-99.196159362793, _config = {weight=3500}},
			{"wardrobe",351.35720825195,-993.78961181641,-99.196151733398},
			{"gametable",340.46734619141,-996.14453125,-99.196159362793},
			{"itemtr", _config = itemtr_study, 345.1969909668,-995.84521484375,-99.196159362793}
		}
	}
}

-- define home clusters
cfg.homes = {
	["Basis hus 1 (1 Mil)"] = {
		slot = "basic_flat",
		entry_point = {-618.153,37.274,43.584},
		buy_price = 1000000,
		sell_price = 750000,
		max = 99,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Basis hus 2 (1 Mil)"] = {
		slot = "basic_flat",
		entry_point = {-1446.769,-538.531,34.740},
		buy_price = 1000000,
		sell_price = 750000,
		max = 99,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa (5 Mil)"] = {
		slot = "other_flat",
		entry_point = {-769.669,319.645,85.662},
		buy_price = 5000000,
		sell_price = 3000000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
    ["Villa Hillcrest Ave. 1 (10 Mil)"] = {
		slot = "hillcrest_2862",
		entry_point = {-686.359,596.561,143.642},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa Hillcrest Ave. 3 (10 Mil)"] = {
		slot = "hillcrest_2874",
		entry_point = {-853.0548,695.792,148.786},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa Mad Wayne Thunder Dr. (10 Mil)"] = {
		slot = "mad_wayne_thunder_2113",
		entry_point = {-1294.324,454.887,97.468},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa Normandy Dr. (10 Mil)"] = {
		slot = "normandy_2117",
		entry_point = {-559.592,664.243,145.456},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa North Conker Ave. 1 (10 Mil)"] = {
		slot = "north_conker_2044",
		entry_point = {346.842,440.745,147.702},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa North Conker Ave. 2 (10 Mil)"] = {
		slot = "north_conker_2045",
		entry_point = {373.506,427.904,145.684},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa Whispymound Dr. (10 Mil)"] = {
		slot = "whispymound_3677",
		entry_point = {119.364,564.404,183.959},
		buy_price = 100000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Villa Wild Oats Dr. (10 Mil)"] = {
		slot = "wild_oats_3655",
		entry_point = {-175.013,502.543,137.420},
		buy_price = 10000000,
		sell_price = 7500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["La Torre"] = {
		slot = "latorre",
		entry_point = {1394.767,1141.776,114.619},
		buy_price = 100000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=59,
		blip_hidden = false
	},
	["Uno Por Ciento"] = {
		slot = "uno_por_ciento",
		entry_point = {1951.5307617188,3825.0290527344,32.160453796387},
		buy_price = 1000000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=59,
		blip_hidden = false
	},
	--["AK Kartellet"] = {
		--slot = "AK_Kartellet",
		--entry_point = {-268.86975097656,-962.23614501953,31.22313117981},
		--buy_price = 1000000000,
		--sell_price = 0,
		--max = 10,
		--blipid=40,
		--blipcolor=59,
		--blip_hidden = false
	--},
	["Whispymound Drive 3671"] = {
		slot = "whispymound_3671",
		entry_point = {8.4600,539.8759,175.7275},
		buy_price = 100000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=59,
		blip_hidden = true
	},
	["The Family"] = {
		slot = "forumdrive_strawberry_4",
		entry_point = {-14.1117,-1442.1643,30.9008},
		buy_price = 100000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=59,
		blip_hidden = true
	},
	--["The Lost MC"] = {
   	--	slot = "lostmc",
	--	entry_point = {984.73181152344,-125.54241943359,73.947601318359},
   	--	buy_price = 100000000,
	--	sell_price = 0,
	--	max = 10,
	--	blipid=40,
	--	blipcolor=59,
	--	blip_hidden = false
	--},
	["Gambino Business"] = {
		slot = "Gambino",
		entry_point = {-69.159,-802.198,44.225},
		buy_price = 100000000,
		sell_price = 0,
		max = 1,
		blipid=40,
		blipcolor=59,
		blip_hidden = false
	},
    --["RoadRunners"] = {
	--	slot = "acardius",
	--	entry_point = {-116.683,-604.680,36.280},
	--	buy_price = 100000000,
	--	sell_price = 0,
	--	max = 1,
	--	blipid=40,
	--	blipcolor=59,
	--	blip_hidden = false
	--},
    ["Rockford Hills 3"] = {
		slot = "rockford_hills_3",
		entry_point = {-812.866,173.349,76.740},
		buy_price = 100000000,
		sell_price = 0,
		max = 10,
		blipid=40,
		blipcolor=19,
		blip_hidden = true
	},
	["Midtown Lejlighed 1"] = {
		slot = "Midtown_Penthouse_1",
		entry_point = {-48.858,-589.194,37.953},
		buy_price = 5000000,
		sell_price = 3500000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 2"] = {
		slot = "Midtown_Penthouse_2",
		entry_point = {-46.281,-582.457,37.953},
		buy_price = 7000000,
		sell_price = 5000000,
		max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Lavpris hus"] = {
		slot = "Cheap_Home_3",
		entry_point = {-346.496,6224.197,31.518},
		buy_price = 450000,
		sell_price = 337500,
		max = 100,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 3"] = {
		slot = "3",
		entry_point = {-282.807,-940.500,31.218},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 4"] = {
		slot = "4",
		entry_point = {-480.583, -688.393, 33.211},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 5"] = {
		slot = "5",
		entry_point = {-778.135,319.715,85.662},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 6"] = {
		slot = "6",
		entry_point = {-884.754,-329.819,38.981},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 7"] = {
		slot = "7",
		entry_point = {-936.031,-378.928,38.961},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 8"] = {
		slot = "8",
		entry_point = {-901.9268,-378.467,38.961},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 9"] = {
		slot = "9",
		entry_point = {-855.351,-363.884,38.680},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Midtown Lejlighed 10"] = {
		slot = "10",
		entry_point = {-881.431,-438.340,39.599},
		buy_price = 1500000,
		sell_price = 1125000,
		max = 10,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	},
	["Trailer"] = {
		slot = "Trailer",
		entry_point = {1973.7752685547,3815.119140625,33.424324035645},
		buy_price = 100000000,
		sell_price = 0,
     	max = 1,
		blipid=40,
		blipcolor=7,
		blip_hidden = false
	}
}

return cfg