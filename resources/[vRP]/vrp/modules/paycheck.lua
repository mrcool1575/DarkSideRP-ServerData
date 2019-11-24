local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
    function format_thousands(v)
        local s = string.format("%d", math.floor(v))
        local pos = string.len(s) % 3
        if pos == 0 then pos = 3 end
     return string.sub(s, 1, pos)
        .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
    end

  	local user_id = vRP.getUserId(source)
  	local bankamount = vRP.getBankMoney(user_id)
	
	if vRP.hasPermission(user_id,"policechief.paycheck") then -- Politichef
		local salary = 15000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Rigspolitichef</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"vice.paycheck") then -- Politi
		local salary = 12500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Vice-rigspolitichef</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
	elseif vRP.hasPermission(user_id,"police.paycheck") then -- Politi
		local salary = 10500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Betjent</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
	elseif vRP.hasPermission(user_id,"policestudent.paycheck") then -- Politielev
		local salary = 8000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Betjent</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
		elseif vRP.hasPermission(user_id,"chef.paycheck") then -- Lægechef
		local salary = 16000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Lægechef</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"emergency.paycheck") then -- Læge
		local salary = 9500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Ambulanceredder</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
elseif vRP.hasPermission(user_id,"emergencystudent.paycheck") then -- Lægeelev
		local salary = 7500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Ambulanceredder</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		elseif vRP.hasPermission(user_id,"judge.paycheck") then -- Højesteretsdommer
		local salary = 14200
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Højesteretsdommer</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"journalist.paycheck") then -- Journalist
		local salary = 11000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Journalist</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"lawyer.paycheck") then -- Advokat
		local salary = 10250
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Journalist</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"teslak.paycheck") then -- Teslak Auto A/S
		local salary = 7500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Journalist</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"bilsælgerchef.paycheck") then -- Bilsælger Chef
		local salary = 10000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Journalist</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"bilsælger.paycheck") then -- Bilsælger
		local salary = 8000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Journalist</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"bilsælgerelev.paycheck") then -- Bilsælger Elev
		local salary = 5000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Advokat</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"psych.paycheck") then -- Psyokolog
		local salary = 7500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Psykolog</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"bankdriver.paycheck") then -- Pengetransporter
		local salary = 7500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Pengetransporter</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"repairchief.paycheck") then -- Mekanikerchef
		local salary = 11000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Mekanikerchef</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"repair.paycheck") then -- Mekaniker
		local salary = 8500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Mekaniker</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"skraldemand.paycheck") then -- Skraldemand
		local salary = 6230
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Skraldemand</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"trucker.paycheck") then -- Lastbilchauffør
		local salary = 6230
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Lastbilchauffør</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"taxi.paycheck") then -- Taxi
		local salary = 6290
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Lastbilchauffør</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"stripper.paycheck") then -- stripper
		local salary = 6290
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Taxachauffør</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"tree.paycheck") then -- Træhugger
		local salary = 6250
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Træhugger</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"mining.paycheck") then -- Minearbejder
		local salary = 5820
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Minearbejder</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})		
	elseif vRP.hasPermission(user_id,"delivery.paycheck") then -- Udbringer
		local salary = 5000
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Pizzamand</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
	elseif vRP.hasPermission(user_id,"postman.paycheck") then -- Postbud
		local salary = 5750
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Postbud</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"fisher.paycheck") then -- Fisker
		local salary = 5750
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Lønudbetaling: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Fisker</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	elseif vRP.hasPermission(user_id,"user.paycheck") then -- Civil
		local salary = 2500
		vRP.giveBankMoney(user_id,salary)
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Kontanthjælp: <b style='color: #4E9350'>"..format_thousands(math.floor(salary)).." DKK</b>.<br/>Erhverv: <b style='color: #72AEE5'>Arbejdsløs</b>.<br/>Bankkonto: <b style='color: #4E9350'>"..format_thousands(math.floor(bankamount)).. "</b>.", type = "info", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end

	local money = vRP.getBankMoney({user_id})
	TriggerClientEvent("vRP:updateBalanceGc", source, money)

	--local id = 1
	--local salaries = 9000
	--local pung = vRP.getMoney(id)
	--local bank = vRP.getBankMoney(id)
	--local total = (pung+bank+salaries)
	--vRP.giveBankMoney(id,salaries)
	--TriggerClientEvent("pNotify:SendNotification", -1,{text = "Udbetaling til borgmesteren: <b style='color: #4E9350'>"..format_thousands(math.floor(salaries)).." DKK</b>.<br/>Total formue: <b>"..format_thousands(math.floor(total)).." DKK</b>.", type = "success", queue = "global",timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
end)