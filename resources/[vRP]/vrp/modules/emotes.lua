
-- this module define the emotes menu

local cfg = module("cfg/emotes")
local lang = vRP.lang

local emotes = cfg.emotes
timerup = false

local function ch_emote(player,choice)
  local emote = emotes[choice]
  if emote then
    if not timerup then
    vRPclient.playAnim(player,{emote[1],emote[2],emote[3]})
    timerup = true
  end
  end
end
timeren = function()
  timerup = false
  SetTimeout(10000,timeren)
end
SetTimeout(10000,timeren)

-- add emotes menu to main menu

