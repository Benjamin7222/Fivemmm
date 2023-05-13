

-- Boucle pour la vitesse des vhécules
Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1000)
		ped = PlayerPedId()
		if IsPedSittingInAnyVehicle(ped) then
			local veh = GetVehiclePedIsIn(ped, false)
			local vehClass = GetVehicleClass(veh)
			if vehClass == 18 then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), false), 2.0 * 15.0)
			elseif vehClass == 16 then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 2.0 * 500.0)
			end
		end
	end
end)