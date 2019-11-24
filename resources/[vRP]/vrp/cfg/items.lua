-- define items, see the Inventory API on github

local cfg = {}
-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here
cfg.items = {
	-- farming
	["weed"] = {"Hampblad", "Bruges til fremstilling af hashklumper.", nil, 0.30}, -- civil
	["jointpapir"] = {"Joint papir", "Bruges til at rulle hash.", nil, 0.01}, -- civil
	["cocaineplant"] = {"Kokaplante", "Bruges til fremstilling af kokain.", nil, 0.15}, -- civil
	["acid"] = {"Syre", "Bruges til fremstilling af LSD.", nil, 0.30}, -- civil
	["raw_fish"] = {"Rå fisk", "Skal behandles før de kan spises eller sælges.", nil, 0.01}, -- fisker
	["kul"] = {"Kul", "Bruges til fremstilling af diamant.", nil, 1.00}, -- minearbejder
	["diamant"] = {"Diamant", "Kan sælges i en butik for penge.", nil, 0.01}, -- minearbejder
	["jernmalm"] = {"Jernmalm", "Bruges til fremstilling af jern.", nil, 1.00}, -- minearbejder
	["jern"] = {"Jern", "Kan sælges videre for penge.", nil, 5.00}, -- minearbejder
	["guldmalm"] = {"Guldmalm", "Bruges til fremstilling af guld.", nil, 1.00}, -- minearbejder
	["guld"] = {"Guld", "Kan sælges videre for penge.", nil, 10.00}, -- minearbejder
	["tree"] = {"Træstamme", "Stammerne skal hugges op, før de kan bruges til noget.", nil,10.00}, -- træhugger
	["planks"] = {"Planke", "Skal sælges til de byggepladser som efterspørger dem.", nil,5.00}, -- træhugger
	
	-- diverse
	["strip"] = {"Strips", "Bruges til at binde en anden persons hænder.", nil, 0.30}, -- telefonbutik
	["phone1"] = {"OnePlus", "En telefon, som kan bruges til at sende sms'er, tweets osv.", nil, 0.30}, -- telefonbutik
	["phone"] = {"iPhone", "En telefon, som kan bruges til at sende sms'er, tweets osv.", nil, 0.30}, -- telefonbutik
	["zombie_papir"] = {"Registrerings papir", "Zombie A registreringspapirer - Køretøjet må føres på offentlige veje uden nummerplade. (#0001)", nil, 0.30}, -- telefonbutik
	["pose"] = {"Sæk", "Sæk som kan puttes på folk", nil, 0.20},
	
	-- nøgler
	["key_PD"] = {"💳 Politi nøglekort", "Kan bruges til at låse døre op på alle politistationer.", nil, 0.01},
	["key_HP"] = {"💳 Læge nøglekort", "Denne nøgle kan låse døre op på alle hospitaler.", nil,0.01}, -- nøgle til Hospitalet
	["key_RS"] = {"💳 Retssal nøglekort", "Denne nøgle kan låse døre op i retssalen.", nil,0.01}, -- nøgle til retssalen
	["key_SL"] = {"🔑 Skummel lejlighed", "Denne nøgle kan låse den skumle lejlighed op.", nil,0.01}, -- nøgle til Skummel lejlighed
	["key_MIC"] = {"🔑 Michael's hus", "Denne nøgle kan låse Michael's hus op.", nil, 0.01}, -- nøgle til Michaels hus
	["key_DC"] = {"🔑 Denice's hus", "Denne nøgle kan låse Denice's hus op.", nil, 0.01}, -- nøgle til Denices hus
	["key_FR"] = {"🔑 Franklin's hus", "Denne nøgle kan låse Franklin's hus op.", nil, 0.01}, -- nøgle til Franklins hus
	["key_LMC"] = {"🔑 The Lost MC's klubhus", "Denne nøgle kan låse The Lost MC's klubhus op.", nil, 0.01}, -- nøgle til Lost MCs klubhus
	["key_LES"] = {"🔑 Lesters hus", "Denne nøgle kan låse Lesters hus op.", nil, 0.01}, -- nøgle til Lesters hus
	["key_FL"] = {"🔑 Floyds lejlighed", "Denne nøgle kan låse Floyds lejlighed op.", nil, 0.01}, -- nøgle til Floyds lejlighed
	["key_TR"] = {"🔑 Trevors trailer", "Denne nøgle kan låse Trevors trailer op.", nil, 0.01}, -- nøgle til Trevors trailer
	
	-- jobs
	["kuglepen"] = {"Kuglepen", "Bruges til at underskrive dokumenter til dine klienter.", nil,0.01}, -- advokat
	["skraldesæk"] = {"Skraldesæk", "Bruges af skraldemænd til at tømme skraldespande.", nil,0.01}, -- skraldemand
	["bank_money"] = {"Bankpenge", "DKK. Bruges udelukkende til pengetransporter-jobbet.", nil, 0.00}, -- pengetransporter
	["screwdriver"] = {"Skruetrækker", "Bruges til at åbne biler med sammen med et dirkesæt.", nil, 0.01}, -- mekaniker

  -- Våben
	["wbody|WEAPON_VINTAGEPISTOL"] = {"Fartmåler", "", nil, 0.01},
	["wammo|WEAPON_VINTAGEPISTOL"] = {"Fartmåler ammo", "", nil, 0.01},
	["wbody|WEAPON_PISTOL"] = {"Håndpistol", "", nil, 0.01},
	["wammo|WEAPON_PISTOL"] = {"Håndpistol ammo", "", nil, 0.01},
	["wbody|WEAPON_PISTOL_MK2"] = {"Håndpistol Mk2", "", nil, 0.01},
	["wammo|WEAPON_PISTOL_MK2"] = {"Håndpistol Mk2 ammo", "", nil, 0.01},
	["wbody|WEAPON_MARKSMANPISTOL"] = {"Marksmanpistol", "", nil, 0.01},
	["wammo|WEAPON_MARKSMANPISTOL"] = {"Marksmanpistol ammo", "", nil, 0.01},
	["wbody|WEAPON_SNSPISTOL"] = {"SNS Pistol", "", nil, 0.01},
	["wammo|WEAPON_SNSPISTOL"] = {"SNS Pistol ammo", "", nil, 0.01},
	["wbody|WEAPON_REVOLVER"] = {"Smith&Wesson", "", nil, 0.01},
	["wammo|WEAPON_REVOLVER"] = {"Smith&Wesson ammo", "", nil, 0.01},
	["wbody|WEAPON_HEAVYPISTOL"] = {"Heavypistol", "", nil, 0.01},
	["wammo|WEAPON_HEAVYPISTOL"] = {"Heavypistol ammo", "", nil, 0.01},
	["wbody|WEAPON_MACHINEPISTOL"] = {"Maskinpistol", "", nil, 0.01},
	["wammo|WEAPON_MACHINEPISTOL"] = {"Maskinpistol ammo", "", nil, 0.01},
	["wbody|WEAPON_PISTOL50"] = {".50 Desert Eagle", "", nil, 0.01},
	["wammo|WEAPON_PISTOL50"] = {".50 Desert Eagle ammo", "", nil, 0.01},
	["wbody|WEAPON_MOLOTOV"] = {"Molotov", "", nil, 0.01},
	["wammo|WEAPON_MOLOTOV"] = {"Molotov brændstof", "", nil, 0.01},
	["wbody|WEAPON_PUMPSHOTGUN"] = {"Pumpshotgun", "", nil, 0.01},
	["wammo|WEAPON_PUMPSHOTGUN"] = {"Pumpshotgun shells", "", nil, 0.01},
	["wbody|WEAPON_ASSAULTSHOTGUN"] = {"Kampshotgun", "", nil, 0.01},
	["wammo|WEAPON_ASSAULTSHOTGUN"] = {"Kampshotgun shells", "", nil, 0.01},
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = {"Afskåret shotgun", "", nil, 0.01},
	["wammo|WEAPON_SAWNOFFSHOTGUN"] = {"Afskåret shotgun shells", "", nil, 0.01},
	["wbody|WEAPON_ASSAULTRIFLE"] = {"Kamprifle", "", nil, 0.01},
	["wammo|WEAPON_ASSAULTRIFLE"] = {"Kamprifle ammo", "", nil, 0.01},
	["wbody|WEAPON_CARBINERIFLE"] = {"Karbinriffel", "", nil, 0.01},
	["wammo|WEAPON_CARBINERIFLE"] = {"Karbinriffel ammo", "", nil, 0.01},
	["wbody|WEAPON_HEAVYSNIPER"] = {"Snigskytte riffel", "", nil, 0.01},
	["wammo|WEAPON_HEAVYSNIPER"] = {"Snigskytte riffel ammo", "", nil, 0.01},
	["wbody|WEAPON_SNIPERRIFLE"] = {"Jagtriffel", "", nil, 0.01},
	["wammo|WEAPON_SNIPERRIFLE"] = {"Jagtriffel ammo", "", nil, 0.01},
	["wbody|WEAPON_GUSENBERG"] = {"Tommygun", "", nil, 0.01},
	["wammo|WEAPON_GUSENBERG"] = {"Tommygun drum-mag", "", nil, 0.01},
	["wbody|WEAPON_STUNGUN"] = {"Strømpistol", "", nil, 0.01},
	["wbody|WEAPON_COMBATPISTOL"] = {"Tjenestepistol", "", nil, 0.01},
	["wammo|WEAPON_COMBATPISTOL"] = {"Tjenestepistol ammo", "", nil, 0.01},
	["wbody|WEAPON_COMBATPDW"] = {"Kamp PDW", "", nil, 0.01},
	["wammo|WEAPON_COMBATPDW"] = {"Kamp PDW ammo", "", nil, 0.01},
	["wbody|WEAPON_CARBINERIFLE_MK2"] = {"Karbinriffel Mk2", "", nil, 0.01},
	["wammo|WEAPON_CARBINERIFLE_MK2"] = {"Karbinriffel Mk2 ammo", "", nil, 0.01},
	["wbody|WEAPON_HEAVYSNIPER_MK2"] = {"Barrett M82 .50cal", "", nil, 0.01},
	["wammo|WEAPON_HEAVYSNIPER_MK2"] = {"Barrett M82 .50cal ammo", "", nil, 0.01},
	["wbody|WEAPON_SMG"] = {"SMG", "", nil, 0.01},
	["wammo|WEAPON_SMG"] = {"SMG ammo", "", nil, 0.01},
	["wbody|WEAPON_MINISMG"] = {"MiniSMG", "", nil, 0.01},
	["wammo|WEAPON_MINISMG"] = {"MiniSMG ammo", "", nil, 0.01},
	["wbody|WEAPON_MICROSMG"] = {"MicroSMG", "", nil, 0.01},
	["wammo|WEAPON_MICROSMG"] = {"MicroSMG ammo", "", nil, 0.01},
	["wbody|WEAPON_BATTLEAXE"] = {"Kampøkse", "", nil, 0.01},
	["wbody|WEAPON_BALL"] = {"Baseballbold", "", nil, 0.01},
	["wbody|WEAPON_GOLFCLUB"] = {"Golfkølle", "", nil, 0.01},
	["wbody|WEAPON_KNIFE"] = {"Kniv", "", nil, 0.01},
	["wbody|WEAPON_BAT"] = {"Baseball bat", "", nil, 0.01},
	["wbody|WEAPON_POOLCUE"] = {"Poolkø", "", nil, 0.01},
	["wbody|WEAPON_MACHETE"] = {"Machete", "", nil, 0.01},
	["wbody|WEAPON_CROWBAR"] = {"Brækjern", "", nil, 0.01},
	["wbody|WEAPON_SWITCHBLADE"] = {"Foldekniv", "", nil, 0.01},
	["wbody|WEAPON_KNUCKLE"] = {"Knojern", "", nil, 0.01},
	["wbody|WEAPON_WRENCH"] = {"Svensknøgle", "", nil, 0.01},
	["wbody|WEAPON_HAMMER"] = {"Hammer", "", nil, 0.01}
  }

-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg
