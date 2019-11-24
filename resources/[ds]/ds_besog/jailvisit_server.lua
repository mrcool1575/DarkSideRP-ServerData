-- Huge server file.

local jailvisits = {
	[1] = { ["xe"] = 1636.4305419922, ["ye"] = 2565.3474121094, ["ze"] = 45.564880371094, ["he"] = 53.646823883057, ["xo"] = 1642.8188476563, ["yo"] = 2573.6228027344, ["zo"] = 45.56485748291, ["ho"] = 270.60205078125, ["name"] = 'Fængselscelle'}
	
}

RegisterServerEvent("jailvisits:sendData_s")
AddEventHandler("jailvisits:sendData_s", function()
    TriggerClientEvent("jailvisits:f_sendData", source, jailvisits)
end)