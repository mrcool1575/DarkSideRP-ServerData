
-- define emotes
-- use the custom emotes admin action to test emotes on-the-fly
-- animation list: http://docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm

local cfg = {}

-- map of emote_name => {upper,seq,looping} and an optional permissions property
-- seq can also be a task definition, check the examples below

	-- ["Handsup"] = { handsup state, use clear to lower hands
    -- true,
    -- { sequence, list of {dict,name,loops}
	-- {"random@mugging3", "handsup_standing_base", 1}
    -- },
    -- true
    -- ,permissions = {"player.emote.handsup"}  -- you can add a permissions check
	-- },

cfg.emotes = {
	[" Giv penge"] = {false, {task="PROP_HUMAN_PARKING_METER"}, false},
	[" Læn"] = {false, {task="WORLD_HUMAN_LEANING"}, false},
	[" Plant"] = {false, {task="WORLD_HUMAN_GARDENER_PLANT"}, false},
	[" Sid på stol"] = {false, {task="PROP_HUMAN_SEAT_CHAIR_MP_PLAYER"}, false},
	[" Stå med mobil"] = {false, {task="WORLD_HUMAN_STAND_MOBILE"}, false},
	[" Udklipsholder"] = {false, {task="WORLD_HUMAN_CLIPBOARD"}, false},
	["--------------------------------------"] = {false, {task=""}, false},
	["Armbøjninger"] = {false, {task="WORLD_HUMAN_PUSH_UPS"}, false},
	["Bladblæser"] = {false, {task="WORLD_HUMAN_GARDENER_LEAF_BLOWER"}, false},
	["Bor i jorden"] = {false, {task="WORLD_HUMAN_CONST_DRILL"}, false},
	["Damn"] = {true, {{"gestures@f@standing@casual","gesture_damn",1}}, false},
	["Dans 2"] = {false, {task="WORLD_HUMAN_STRIP_WATCH_STAND"}, false},
	["Dans"] = {false, { {"rcmnigel1bnmt_1b","dance_intro_tyler",1},{"rcmnigel1bnmt_1b","dance_loop_tyler",1}},false},
	["Drik øl og dans"] = {false, {task="WORLD_HUMAN_PARTYING"}, false},
	["Drik"] = {false, {task="WORLD_HUMAN_DRINKING"}, false},
	["Fiskestang"] = {false, {task="WORLD_HUMAN_STAND_FISHING"}, false},
	["Flex muskler"] = {false, {task="WORLD_HUMAN_MUSCLE_FLEX"}, false},
	["Hammer"] = {false, {task="WORLD_HUMAN_HAMMERING"}, false},
	["Hep og klap"] = {false, {task="WORLD_HUMAN_CHEERING"}, false},
	["Hold styr på menneskemængde"] = {false, {task="CODE_HUMAN_POLICE_CROWD_CONTROL"}, false},
	["Hæng ud"] = {false, {task="WORLD_HUMAN_HANG_OUT_STREET"}, false},
	["Kamera"] = {false, {task="WORLD_HUMAN_PAPARAZZI"}, false},
	["Kikkert"] = {false, {task="WORLD_HUMAN_BINOCULARS"}, false},
	["Lig på maven"] = {false, {task="WORLD_HUMAN_SUNBATHE"}, false},
	["Lig på ryggen"] = {false, {task="WORLD_HUMAN_SUNBATHE_BACK"}, false},
	["Lig på siden"] = {false, {task="WORLD_HUMAN_BUM_SLUMPED"}, false},
	["Lys med lommelygte"] = {false, {task="WORLD_HUMAN_SECURITY_SHINE_TORCH"}, false},
	["Løb på stedet"] = {false, {task="WORLD_HUMAN_JOG_STANDING"}, false},
	["Løft vægt"] = {false, {task="WORLD_HUMAN_MUSCLE_FREE_WEIGHTS"}, false},
	["Mavebøjninger"] = {false, {task="WORLD_HUMAN_SIT_UPS"}, false},
	["Notesblok"] = {false, {task="CODE_HUMAN_MEDIC_TIME_OF_DEATH"}, false},
	["Optag med mobil"] = {false, {task="WORLD_HUMAN_MOBILE_FILM_SHOCKING"}, false},
	["Reparer bil"] = {false, {task="WORLD_HUMAN_VEHICLE_MECHANIC"}, false, permissions = {"mechanic.emotes"}},
	["Ryg cigaret"] = {false, {task="WORLD_HUMAN_SMOKING"}, false},
	["Ryg joint"] = {false, {task="WORLD_HUMAN_DRUG_DEALER"}, false},
	["Salut"] = {true,{{"mp_player_int_uppersalute","mp_player_int_salute",1}},false},
	["Sid ned"] = {false, {task="WORLD_HUMAN_PICNIC"}, false},
	["Sid på knæ"] = {false, {task="CODE_HUMAN_MEDIC_KNEEL"}, false},
	["Spil musik"] = {false, {task="WORLD_HUMAN_MUSICIAN"}, false},
	["Stop trafik"] = {false, {task="WORLD_HUMAN_CAR_PARK_ATTENDANT"}, false},
	["Stå med kost"] = {false, {task="WORLD_HUMAN_JANITOR"}, false},
	["Stå som politimand"] = {false, {task="WORLD_HUMAN_COP_IDLES"}, false},
	["Stå som prostitueret og ryg"] = {false, {task="WORLD_HUMAN_PROSTITUTE_LOW_CLASS"}, false},
	["Stå som prostitueret"] = {false, {task="WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}, false},
	["Stå som sikkerhedsvagt"] = {false, {task="WORLD_HUMAN_GUARD_STAND"}, false},
	["Stå som statue"] = {false, {task="WORLD_HUMAN_HUMAN_STATUE"}, false},
	["Svejsning"] = {false, {task="WORLD_HUMAN_WELDING"}, false, permissions = {"mechanic.emotes"}},
	["Tigger"] = {false, {task="WORLD_HUMAN_BUM_FREEWAY"}, false},
	["Tjek person"] = {false, {task="CODE_HUMAN_MEDIC_TEND_TO_DEAD"}, false},
	["Turistkort"] = {false, {task="WORLD_HUMAN_TOURIST_MAP"}, false},
	["Undersøg"] = {false, {task="CODE_HUMAN_POLICE_INVESTIGATE"}, false},
	["Utålmodig"] = {false, {task="WORLD_HUMAN_STAND_IMPATIENT"}, false},
	["Vask vindue"] = {false, {task="WORLD_HUMAN_MAID_CLEAN"}, false},
	["Vask"] = {false, {task="WORLD_HUMAN_BUM_WASH"}, false},
	["Yoga"] = {false, {task="WORLD_HUMAN_YOGA"}, false},
}

return cfg
