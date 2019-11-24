

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp_basic_mission", "cfg/missions")

-- load global and local languages
local glang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
local lang = Lang.new(module("vrp_basic_mission", "cfg/lang/"..cfg.lang) or {})

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_mission")
Mclient = Tunnel.getInterface("vRP_basic_mission","vRP_basic_mission")

function task_mission()
  -- REPAIR
  for k,v in pairs(cfg.repair) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.repair({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.repair({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"repairkit",1,false}) then
                  vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"repairkit",1,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
				else
                    TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du mangler et reparations kit"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
   -- SKRALDEMAND
  for k,v in pairs(cfg.skraldemand) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.skraldemand({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.skraldemand({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"skraldesæk",1,true}) then
                  vRPclient.playAnim(player,{false,{task="PROP_HUMAN_PARKING_METER"},false})
                  SetTimeout(5000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"skraldesæk",1,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
                      --vRPclient.notify(player,{glang.money.received({v.reward})})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
				else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du mangler en skraldesæk"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
   -- ADVOKAT
  for k,v in pairs(cfg.advokat) do
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.advokat({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.advokat({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"kuglepen",1,false}) then
                  vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_CLIPBOARD"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"kuglepen",1,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
				else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du mangler din kuglepen"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end

     -- BANK
  for k,v in pairs(cfg.bankdriver) do -- each repair perm def
    -- Tilføj missioner
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button. 
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.bankdriver({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.bankdriver({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                 if vRP.tryGetInventoryItem({user_id,"bank_money",500000,true}) then
                  vRPclient.playAnim(player,{false,{task="CODE_HUMAN_POLICE_INVESTIGATE"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"bank_money",500000,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
				 else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du mangler 500.000 bankpenge"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
  -- DELIVERY
  for k,v in pairs(cfg.delivery) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.delivery.title()

          -- generate items
          local todo = 0
          local delivery_items = {}
          for idname,data in pairs(v.items) do
            local amount = math.random(data[1],data[2]+1)
            if amount > 0 then
              delivery_items[idname] = amount
              todo = todo+1
            end
          end

          local step = {
            text = "",
            onenter = function(player, area)
              for idname,amount in pairs(delivery_items) do
                if amount > 0 then -- check if not done
                  if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                    local reward = v.items[idname][3]*amount
					vRP.giveBankMoney({user_id,reward})
					vRPclient.notify(player,{glang.money.received({reward})})
                    todo = todo-1
                    delivery_items[idname] = 0
                    if todo == 0 then -- all received, finish mission
                      vRP.nextMissionStep({player})
                    end
                  end
				else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Der mangler noget"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end
            end,
            position = v.positions[math.random(1,#v.positions)]
          }

          -- mission display
          for idname,amount in pairs(delivery_items) do
            local name = vRP.getItemName({idname})
            step.text = step.text..lang.delivery.item({name,amount}).."<br />"
          end

          mdata.steps = {step}

          if todo > 0 then
            vRP.startMission({player,mdata})
          end
        end
      end
    end
  end
  
  -- EMERGENCY
  for k,v in pairs(cfg.emergency) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.transfer().."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"medkit",1,false}) then
					Mclient.freezePedVehicle(player,{true})
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Vent til patienten stiger ind"}, type = "info", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					SetTimeout(10000, function()
                    vRP.nextMissionStep({player})
					vRP.giveInventoryItem({user_id,"medkit",1,false})
                    Mclient.freezePedVehicle(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = "Modtog <b style='color:#4E9350'>" .. v.reward .. "", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Patienten er inde, kør personenen til det nærmeste hospital!"}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
				else
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du mangler et medkit"}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
  -- TAXI
  for k,v in pairs(cfg.taxi) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) and vRP.hasGroup({user_id,"onservice"}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = v.text.."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
					Mclient.freezePedVehicle(player,{true})
					TriggerClientEvent("pNotify:SendNotification", player,{text = {"Vent på at kunden stiger ind."}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					SetTimeout(5000, function()
                    vRP.nextMissionStep({player})
					Mclient.freezePedVehicle(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
						TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
						TriggerClientEvent("pNotify:SendNotification", player,{text = {"Det var det for nu."}, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					else
						TriggerClientEvent("pNotify:SendNotification", player,{text = {"Kør kunden til den ønskede destination."}, type = "info", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  SetTimeout(60000,task_mission)
end
task_mission()
