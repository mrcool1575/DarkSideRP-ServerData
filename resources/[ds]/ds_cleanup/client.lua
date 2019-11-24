--------------------------------
-- Created by Mathias (Budji) --
--------------------------------

--GetClosestObjectOfType(x, y, z, radius, modelHash, false, p6, p7)
local objectslist = {
	307771752,
	-1184516519,
	1230099731,
	406416082,
	242636620,
	-940719073,
	-1519583462,
	-1894591898,
	1185366416,
	1916672189,
	103020963,
	961976194
}

Citizen.CreateThread(function()
	while true do
		local player = GetPlayerPed(-1)
		local pos = GetEntityCoords(player)

		local handle, object = FindFirstObject()
		local success


		if has_value(objectslist, GetEntityModel(object)) then
			RemoveObject(object)
		end
		repeat 
			success, object = FindNextObject(handle)

			if has_value(objectslist, GetEntityModel(object)) then
				RemoveObject(object)
			end
		until not success

		EndFindObject(handle)

		Citizen.Wait(0)
	end
end)

function RemoveObject(object)
	SetEntityAsMissionEntity(object,  false,  true)
	DeleteObject(object)
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end