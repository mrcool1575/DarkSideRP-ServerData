vRPCcl = {}
Tunnel.bindInterface("vRP_atm",vRPCcl)
Proxy.addInterface("vRP_atm",vRPCcl)
vRPcl = Tunnel.getInterface("vRP_atm","vRP_atm")
vRP = Proxy.getInterface("vRP")

function returnHealth(source)
    if source ~= nil then
        local ped = GetPlayerPed(source)
        
        return GetEntityHealth(GetPlayerPed)
    end
end