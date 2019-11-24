AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	TriggerClientEvent("hp_carplacer:place", source)
end)
