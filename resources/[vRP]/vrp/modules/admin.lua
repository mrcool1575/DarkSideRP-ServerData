local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")
local lang = vRP.lang
local cfg = module("cfg/admin")

MySQL.createCommand("vRP/warning_column", "ALTER TABLE vrp_users ADD warnings integer")

MySQL.createCommand("vRP/set_warnings", "UPDATE vrp_users SET warnings = @warnings WHERE id = @user_id")
MySQL.createCommand("vRP/get_warnings", "SELECT * FROM vrp_users WHERE id = @user_id")

-- init
--MySQL.query("vRP/warning_column")

function vRP.getWarnings(user_id, cbr)
  local task = Task(cbr)

  MySQL.query("vRP/get_warnings", {user_id = user_id}, function(rows, affected)
    if #rows > 0 and rows ~= nil then
      if rows[1].warnings == 0 or rows[1].warnings == nil then
        return 0
      else
        task({rows[1].warnings})
      end
    end
  end)
end

-- this module define some admin menu functions
local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        if source ~= nil then
          vRP.getUserIdentity(k, function(identity)
            if identity then
              content = content.."("..k..") <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> - <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> CPR: <span class=\"reg\">"..identity.registration.."</span> TLF: <span class=\"phone\">"..identity.phone.."</span><br>"
            end
          end)

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
				.div_user_list{ 
				  margin: auto; 
				  padding: 8px; 
				  width: 650px; 
				  margin-top: 58px; 
				  background: black; 
				  color: white; 
				  font-weight: bold; 
				  font-size: 16px;
				  font-family: arial;
				} 

				.div_user_list .pseudo{ 
				  color: rgb(0,255,125);
				}

				.div_user_list .endpoint{ 
				  color: rgb(255,0,0);
				}

				.div_user_list .name{ 
				  color: #309eff;
				}

				.div_user_list .reg{ 
				  color: rgb(0,125,255);
				}
							  
				.div_user_list .phone{ 
				  color: rgb(211, 0, 255);
				}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end
      end
    end
  end
end

local function ch_warn(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"admin.tickets") then
    vRP.prompt(player,"Bruger ID: ","",function(player,tar_id)
      tar_id = parseInt(tar_id)
      if tar_id ~= nil then
        local source = vRP.getUserSource(tar_id)
        if source ~= nil then
          vRP.prompt(player,"Antal Advarsler: ","",function(player,warnings)
            warnings = parseInt(warnings)
            if warnings == nil then warnings = 0 end
            if warnings > 0 then
              vRP.getWarnings(tar_id, function(curwarnings)
                if curwarnings == nil then curwarnings = 0 end
                local newwarn = math.floor(warnings + curwarnings)
                MySQL.execute("vRP/set_warnings", {user_id = tar_id, warnings = newwarn})

                local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
                local dmessage = "**Advarelser** \n```\nID: ".. tostring(user_id).. "\nModtager ID: ".. tostring(tar_id).. "\nAdvarelser: ".. tostring(warnings).. "\n```"
                PerformHttpRequest('https://discordapp.com/api/webhooks/525850484960133131/mngTZlNKobT5-IdqFPIOGsd-xgT1c4lPSdmJpEvJPp0PJFfQ1UJ_L1WEPitSWF9QjVWq', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

                if warnings > 1 then
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har fået <b style='color: #DB4646'>".. warnings.."<b style='color: #fff'> advarsler! Du har I alt <b style='color: #DB4646'>".. newwarn.."<b style='color: #fff'> advarsler!", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har givet <b style='color: #5DB6E5'>".. warnings.."<b style='color: #fff'> advarsler til ID: <b style='color: #5DB6E5'>".. tar_id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                -- vRPclient.notify(source,{"Du har fået ".. warnings.." advarsler! Du har I alt ".. newwarn.." advarsler!"})
                -- vRPclient.notify(player,{"Du har givet ".. warnings.." advarsler til ID: ".. tar_id})
                else
              TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har fået <b style='color: #DB4646'>".. warnings.."<b style='color: #fff'> advarsl! Du har I alt <b style='color: #DB4646'>".. newwarn.."<b style='color: #fff'> advarsl!", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
              TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har givet <b style='color: #5DB6E5'>".. warnings.."<b style='color: #fff'> advarsl til ID: <b style='color: #5DB6E5'>".. tar_id, type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                -- vRPclient.notify(source,{"Du har fået ".. warnings.." advarsel! Du har I alt ".. newwarn.." advarsler!"})
                -- vRPclient.notify(player,{"Du har givet ".. warnings.." advarsel til ID: ".. tar_id})
                end
                
                if newwarn > 3 then
                  local reason = "Du har fået 3 advarsler!"
                  if source ~= nil then
                    vRP.ban(source,reason)
                  end
                end
              end)
            end
          end)
        else
          TriggerClientEvent("pNotify:SendNotification", player,{text = "Spilleren er ikke på!", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      end
    end)
  end
end

local function ch_getwarn(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"admin.tickets") then 
    vRP.prompt(player,"Bruger ID: ","",function(player,tar_id)
      tar_id = parseInt(tar_id)
      if tar_id ~= nil then
        vRP.getWarnings(tar_id, function(curwarnings)
            if curwarnings == nil then curwarnings = 0 end
            if curwarnings == 0 then 
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID: <b style='color: #5DB6E5'>".. tar_id.. "<b style='color: #fff'> har <b style='color: #5DB6E5'> ingen <b style='color: #fff'>advarsler!", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID: <b style='color: #5DB6E5'>".. tar_id.. "<b style='color: #fff'> har <b style='color: #5DB6E5'>".. curwarnings.. " <b style='color: #fff'>advarsler!", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                --  vRPclient.notify(player,{"ID: ".. tar_id.. " har ".. curwarnings.. " advarsler!"})
            end
        end)
      end
    end)
  end
end

local function ch_clearwarn(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"Bruger ID: ","",function(player,tar_id)
      tar_id = parseInt(tar_id)
      if tar_id ~= nil then
        MySQL.execute("vRP/set_warnings", {user_id = tar_id, warnings = 0})
		TriggerClientEvent("pNotify:SendNotification", player,{text = "Du fjernede Id: <b style='color: #5DB6E5'>".. tar_id .. "'s <b style='color: #fff'>advarelser", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
       -- vRPclient.notify(player,{"Du fjernede Id: ".. tar_id .. "'s advarelser"})
      end
    end)
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
		if id == " " or id == "" or id == null or id == 0 or id == nil then
			TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et ID.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		else
			id = parseInt(id)
			vRP.setWhitelisted(id,true)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du whitelistede #"..id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})   
		end		
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
		if id == " " or id == "" or id == null or id == 0 or id == nil then
			TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et ID.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		else
			id = parseInt(id)
			vRP.setWhitelisted(id,false)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du blacklistede #"..id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
	end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
	  local checkid = vRP.getUserSource(tonumber(id))
		if checkid ~= nil then
			vRP.prompt(player,"Job: ","",function(player,group)
				if group == " " or group == "" or group == null or group == 0 or group == nil then
					TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
				else
					if group == "thanighthawk" or group == "uc" or group == "superadmin" or group == "admin" or group == "moderator" then
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke rettigheder til at tildele rangen "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					else
						vRP.addUserGroup(id,group)
						TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev ansat som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					end
				end
			end)
		else
			TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
	  local checkid = vRP.getUserSource(tonumber(id))
	  local checkid = vRP.getUserSource(tonumber(id))
		if checkid ~= nil then
			vRP.prompt(player,"Job: ","",function(player,group)
				if group == " " or group == "" or group == null or group == 0 or group == nil then
					TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
				else
					if group == "thanighthawk" or group == "uc" or group == "superadmin" or group == "admin" or group == "moderator" then
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke rettigheder til at fyre rangen "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					else
						vRP.removeUserGroup(id,group)
						TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev fyret som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					end
				end
			end)
		else
			TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
    end)
  end
end

local function ch_addgroup_staff(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add.staff") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
	  local checkid = vRP.getUserSource(tonumber(id))
		if checkid ~= nil then
		  vRP.prompt(player,"Job: ","",function(player,group)
			if group == " " or group == "" or group == null or group == 0 or group == nil then
				TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job/rang.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			else
				vRP.addUserGroup(id,group)
				TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev ansat som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			end
		  end)
		else
			TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
    end)
  end
end

local function ch_removegroup_staff(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove.staff") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
	  local checkid = vRP.getUserSource(tonumber(id))
		if checkid ~= nil then
		  vRP.prompt(player,"Job: ","",function(player,group)
			if group == " " or group == "" or group == null or group == 0 or group == nil then
				TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job/rang.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			else
				vRP.removeUserGroup(id,group)
				TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev fyret som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			end
		  end)
		else
			TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		end
    end)
  end
end

local function ch_seize(player,choice)
  local user_id = vRP.getUserId(player)
  local seized_items = {}
  if user_id ~= nil then
	vRPclient.getNearestPlayer(player, {5}, function(nplayer)
		local nuser_id = vRP.getUserId(nplayer)
		 if nuser_id ~= nil and vRP.hasPermission(nuser_id, "staff.seizable") then
			vRP.getUserIdentity(user_id, function(identity_cop)
				vRP.getUserIdentity(nuser_id, function(identity_civ)
					if identity_cop and identity_civ then
						local cop_name = identity_cop.firstname
						local cop_lname = identity_cop.name
						local civ_name = identity_civ.firstname
						local civ_lname = identity_civ.name
						table.insert(seized_items, "**"..cop_name.." "..cop_lname.." ("..user_id..")** beslaglagde følgende genstande fra **"..civ_name.." "..civ_lname.." ("..nuser_id..")**: \n")
							for k,v in pairs(cfg.removeable_items) do -- transfer seizable items
								local amount = vRP.getInventoryItemAmount(nuser_id,v)
								if amount > 0 then
									local item = vRP.items[v]
									if item then -- do transfer
										if vRP.tryGetInventoryItem(nuser_id,v,amount,true) then
											table.insert(seized_items, "- "..amount.."x "..vRP.getItemName(v).."\n")
											TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.police.menu.seize.seized({item.name,amount})}, type = "info", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
										end
									end
								end
							end
						PerformHttpRequest('https://discordapp.com/api/webhooks/520280390456311818/cwoCcQEftUS3H9VqKFv60oQzeL4jMLrKfyu-nSbIafSPAoWFUmEkrxag4tPw6t_mXz-2', function(err, text, headers) end, 'POST', json.encode({username = "Origin Staff - SRV " .. GetConvar("servernumber","0"), content = table.concat(seized_items)}), { ['Content-Type'] = 'application/json' })
						TriggerClientEvent("pNotify:SendNotification", nplayer,{text = {lang.police.menu.seize.items.seized()}, type = "info", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					end
				end)
			end)
			else
				TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.no_player_near()}, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		end)
	end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Årsag: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
			vRP.kick(source,reason)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kickede "..id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Årsag: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
      TriggerClientEvent("pNotify:SendNotification", player,{text = "Du bannede "..id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      end)
    end)
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"Spiller ID: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Årsag: ","Unban: ",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.unban(source,reason)
         TriggerClientEvent("pNotify:SendNotification", player,{text = "Du unbannede "..id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      end)
    end)
  end
end

local function ch_revivePlayer(player,choice)
  local user_id = vRP.getUserId(player)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id) 
      local deadplayer = vRP.getUserSource(tonumber(user_id))
      if deadplayer == nil then
		TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt eller manglende ID", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
      else
		TriggerClientEvent("pNotify:SendNotification", player,{text = "Du genoplivede spilleren med ID "..user_id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
        vRPclient.varyHealth(deadplayer, {100})
		vRP.setHunger(tonumber(user_id), 0)
		vRP.setThirst(tonumber(user_id), 0)
      end
    end)
end

local function ch_Killerplayer(player, choice)
   vRPclient.Killerplayer(player, {})
end

local function ch_repairVehicle(player,choice)
	vRPclient.fixeNearestVehicleAdmin(player,{3})
end

local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRPclient.getHeading(player,{},function(h)
		vRP.prompt(player,"Kopier koordinaterne med CTRL-A CTRL-C",x..","..y..","..z..","..h,function(player,choice) end)
	end)
  end)
end

local function ch_coords_no_h(player,choice)
	vRPclient.getPosition(player,{},function(x,y,z)
	vRP.prompt(player,"Kopier koordinaterne med CTRL-A CTRL-C",x..","..y..","..z,function(player,choice) end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"Spiller ID:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  vRP.prompt(player,"Koordinater x,y,z:","",function(player,fcoords) 
    local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
		  table.insert(coords,tonumber(coord))
		end

		local x,y,z = 0,0,0
		if coords[1] ~= nil then x = coords[1] end
		if coords[2] ~= nil then y = coords[2] end
		if coords[3] ~= nil then z = coords[3] end
		
		if x == 0 and y == 0 and z == 0 then
			TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldige koordinater.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		else
			vRPclient.teleport(player,{x,y,z})
		end
  end)
end

-- teleport waypoint
local function ch_tptowaypoint(player,choice)
  TriggerClientEvent("TpToWaypoint", player)
end

local function ch_givemoney(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
		local steamname = GetPlayerName(player)
		vRP.prompt(player,"Beløb:","",function(player,amount) 
			vRP.prompt(player,"Formål ved spawn af penge:","",function(player,reason) 
				if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
					reason = "Ingen kommentar..."
				end
				amount = parseInt(amount)
				if amount == " " or amount == "" or amount == null or amount == 0 or amount == nil then
					TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt pengebeløb.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
				else
					vRP.giveMoney(user_id, amount)
					TriggerClientEvent("pNotify:SendNotification", player,{text = "Du spawnede " ..amount.. "DKK", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
					PerformHttpRequest('https://discordapp.com/api/webhooks/522776370745704450/WoF01Rby4mF9Rl0_U6H1PDmVPAY0C9RNDX1RKZXu3jMSakBuQhaiUO71pSSxypvJdLA_', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "**ID: "..user_id.."** spawnede **"..amount.." DKK** - Kommentar: *"..reason.."*"}), { ['Content-Type'] = 'application/json' })
				end
			end)
		end)
	end
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
	vRP.getUserIdentity(user_id, function(identity)
	  if identity then
	  local steamname = GetPlayerName(player)
		vRP.prompt(player,"Tingens ID:","",function(player,idname) 
		  idname = idname
			if idname == " " or idname == "" or idname == null or idname == nil then
				TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt ID.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
			else
				vRP.prompt(player,"Antal:","",function(player,amount) 
					vRP.prompt(player,"Formål ved spawn af ting:","",function(player,reason) 
						if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
							reason = "Ingen kommentar..."
						end
						if amount == " " or amount == "" or amount == null or amount == nil then
							TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt antal.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
						else
							amount = parseInt(amount)
							vRP.giveInventoryItem(user_id, idname, amount,true)
							PerformHttpRequest('https://discordapp.com/api/webhooks/522776370745704450/WoF01Rby4mF9Rl0_U6H1PDmVPAY0C9RNDX1RKZXu3jMSakBuQhaiUO71pSSxypvJdLA_', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "**ID: "..user_id.." ("..identity.firstname.." "..identity.name..")** spawnede **"..amount.." stk. "..idname.."** - Kommentar: *"..reason.."*"}), { ['Content-Type'] = 'application/json' })
						end
					end)
				end)
			end
		end)
	  end
	end)
  end
end

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Beskriv dit problem:","",function(player,desc) 
      desc = desc

      local answered = false
      local players = {}
      for k,v in pairs(vRP.rusers) do
        local player = vRP.getUserSource(tonumber(k))
        -- check user
        if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
          table.insert(players,player)
        end
      end

      -- send notify and alert to all listening players
	  if desc == " " or desc == "" or desc == null then
        TriggerClientEvent("pNotify:SendNotification",player,{text = "Din admin-sag blev ikke sendt.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
	  else 
      for k,v in pairs(players) do
        vRP.request(v,"Admin report fra "..user_id.." - Tager du den?: "..htmlEntities.encode(desc), 60, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(player,{"Din sag blev taget."})
              vRPclient.getPosition(player, {}, function(x,y,z)
                vRPclient.teleport(v,{x,y,z})
              end)
              answered = true
            else
              vRPclient.notify(v,{"Sagen er allerede blevet taget."})
            end
          end
        end)
		end
      end
    end)
  end
end

local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
   vRPclient.toggleNoclip(player, {})
end

local function ch_freezeplayer(player, choice)
  local user_id = vRP.getUserId(player)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id) 
      local frozenplayer = vRP.getUserSource(tonumber(user_id))
      if frozenplayer == nil then
		TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt eller manglende ID", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
      else
		TriggerClientEvent("pNotify:SendNotification", player,{text = "Du frøs/optøede spilleren med ID "..user_id, type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
		vRPclient.toggleFreeze(frozenplayer, {})
      end
    end)
end

local function ch_spawnvehicle(player, choice)
	vRP.prompt(player,"Bilen's modelnavn f.eks. police3:","",function(player,veh)
		if veh ~= "" then
			TriggerClientEvent("hp:spawnvehicle",player,veh)
		end
	end)
end

local function ch_deletevehicle(player, choice)
  TriggerClientEvent("hp:deletevehicle", player)
end

local function ch_unlockvehicle(player, choice)
	vRPclient.vehicleUnlockAdmin(player)
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices[" - Staff"] = {function(player,choice)

      local menu = {name="Staff panel",css={top="75px",header_color="rgba(225,160,0,0.75)"}}
      menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

      if vRP.hasPermission(user_id,"player.list") then
        menu["> Brugerliste"] = {ch_list,"Vis/Gem"}
      end
      if vRP.hasPermission(user_id,"player.group.add") then
        menu["Tilføj job"] = {ch_addgroup}
      end
      if vRP.hasPermission(user_id,"player.group.remove") then
        menu["Fjern job"] = {ch_removegroup}
      end
      if vRP.hasPermission(user_id,"player.group.add.staff") then
        menu["Tilføj job/rang"] = {ch_addgroup_staff}
      end
      if vRP.hasPermission(user_id,"player.group.remove.staff") then
        menu["Fjern job/rang"] = {ch_removegroup_staff}
      end
	  if vRP.hasPermission(user_id,"admin.tickets") then
        menu["@Giv Advarseler"] = {ch_warn}
       end
        if vRP.hasPermission(user_id,"admin.tickets") then
        menu["@Antal Advarsler"] = {ch_getwarn}
        end
       if vRP.hasPermission(user_id,"player.unban") then
        menu["@Fjern Advarsler"] = {ch_clearwarn}
        end
      if vRP.hasPermission(user_id,"player.kick") then
        menu["Kick"] = {ch_kick}
      end
      if vRP.hasPermission(user_id,"staff.seizable") then
      	menu["Fjern items"] = {ch_seize}
      end
      if vRP.hasPermission(user_id,"player.ban") then
        menu["Ban"] = {ch_ban}
      end
      if vRP.hasPermission(user_id,"player.unban") then
        menu["Unban"] = {ch_unban}
      end
      if vRP.hasPermission(user_id,"player.freeze") then
        menu["Frys/optø spiller"] = {ch_freezeplayer}
      end
      if vRP.hasPermission(user_id,"player.revival") then
        menu["Genopliv spiller"] = {ch_revivePlayer}
      end
      if vRP.hasPermission(user_id,"player.repairvehicle") then
        menu["Reparer køretøj"] = {ch_repairVehicle}
      end
      if vRP.hasPermission(user_id,"player.noclip") then
        menu["Noclip"] = {ch_noclip}
      end
      if vRP.hasPermission(user_id,"player.spawnvehicle") then
        menu["Spawn køretøj"] = {ch_spawnvehicle}
      end
      if vRP.hasPermission(user_id,"player.deletevehicle") then
        menu["Fjern køretøj"] = {ch_deletevehicle}
      end
      if vRP.hasPermission(user_id,"player.unlockvehicle") then
        menu["Lås køretøj op"] = {ch_unlockvehicle}
      end
      if vRP.hasPermission(user_id,"player.coords") then
        menu["Koordinater"] = {ch_coords}
      end
      if vRP.hasPermission(user_id,"player.coordsnoheading") then
        menu["Koordinater (uden h)"] = {ch_coords_no_h}
      end
      if vRP.hasPermission(user_id,"player.tptome") then
        menu["TP person til mig"] = {ch_tptome}
      end
      if vRP.hasPermission(user_id,"player.tpto") then
        menu["TP til person"] = {ch_tpto}
      end
      if vRP.hasPermission(user_id,"player.whitelist") then
        menu["Whitelist en person"] = {ch_whitelist}
      end
      if vRP.hasPermission(user_id,"player.tpto") then
        menu["TP til koordinater"] = {ch_tptocoords}
      end
      if vRP.hasPermission(user_id,"player.tptowaypoint") then
        menu["TP til waypoint"] = {ch_tptowaypoint} -- teleport user to map blip
      end
      if vRP.hasPermission(user_id,"player.givemoney") then
        menu["Spawn penge"] = {ch_givemoney}
      end
      if vRP.hasPermission(user_id,"player.blips") then
        menu["Blips"] = {ch_blips}
      end
      if vRP.hasPermission(user_id,"player.giveitem") then
        menu["Spawn ting"] = {ch_giveitem}
      end
      if vRP.hasPermission(user_id,"player.calladmin") then
        menu["Tilkald staff"] = {ch_calladmin}
      end

      vRP.openMenu(player,menu)
    end}

    add(choices)
  end
end)

-- admin god mode
function task_god()
  SetTimeout(10000, task_god)

  for k,v in pairs(vRP.getUsersByPermission("admin.god")) do
    vRP.setHunger(v, 0)
    vRP.setThirst(v, 0)

    local player = vRP.getUserSource(v)
    if player ~= nil then
      vRPclient.setHealth(player, {200})
    end
  end
end

task_god()

count = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if count == 0 then  
			print("Server lavet oMarkez, Skovsboell, Flake og Hermansen")
			count = count + 1
		end
	end
end)
