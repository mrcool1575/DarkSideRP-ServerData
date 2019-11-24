local barriers = {
	"p_barier_test_s",
	"prop_sec_barier_01a",
	"prop_sec_barier_02a",
	"prop_sec_barier_02b",
	"prop_sec_barier_03a",
	"prop_sec_barier_03b",
	"prop_sec_barier_04a",
	"prop_sec_barier_04b",
	"prop_sec_barier_base_01",
	"prop_sec_barrier_ld_01a",
	"prop_sec_barrier_ld_02a"
}

Citizen.CreateThread(function()
   while true do
		for a = 1, #barriers do
			local player = PlayerId()
			local Ped = GetPlayerPed(player)
			local pedPos = GetEntityCoords(Ped, false)
			local barrier = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 500.0, GetHashKey(barriers[a]), 0, 0, 0)
			if barrier ~= 0 then
				SetEntityAsMissionEntity(barrier, 1, 1)
				DeleteObject(barrier)
				SetEntityAsNoLongerNeeded(barrier)
			end
		end
	   Citizen.Wait(2500)
   end
end)
