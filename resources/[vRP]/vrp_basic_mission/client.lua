--bind client tunnel interface
vRPmt = {}
Tunnel.bindInterface("vRP_basic_mission",vRPmt)

function vRPmt.freezePed(flag)
  FreezeEntityPosition(GetPlayerPed(-1),flag)
end

function vRPmt.getPlayerName(player)
  return GetPlayerName(player)
end

function vRPmt.freezePedVehicle(flag)
  FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1),false),flag)
end