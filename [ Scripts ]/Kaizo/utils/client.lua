
local ESX = nil

-- Trigger ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)


-- Vol de véhicule de service

local vehicle = {
	"riot",
	"ambulance3",
	"police",
	"police2",
	"police3",
	"police4",
	"ambulance",
	"polmav",
	"policeb",
	"fbi",
    "fbi2",
}

AddEventHandler("gameEventTriggered", function(name, args)
	if name == "CEventNetworkPlayerEnteredVehicle" then
		if (args[1] == PlayerId()) then
			local ped = PlayerPedId();
			local veh = GetVehiclePedIsIn(ped, false);
			local playerVeh = veh ~= 0 and veh or false;
			if (args[2] == playerVeh) then
				local playerData = ESX.GetPlayerData()
				for i = 1, #vehicle,1 do
					if IsVehicleModel(GetVehiclePedIsIn(PlayerPedId(), true), GetHashKey(vehicle[i])) then
						local veh = GetVehiclePedIsUsing(ped, false)
						if (GetPedInVehicleSeat(playerVeh, -1) == ped) then
							if playerData.job ~= nil and playerData.job.name == 'police' or playerData.job.name == 'ambulance' or playerData.job.name == 'sheriff' then
								SetVehicleUndriveable(playerVeh, false)
							else
								ESX.ShowNotification("Un système de sécurité t'empêche de démarrer")
								while (GetVehiclePedIsIn(ped, false) ~= 0 and GetVehiclePedIsIn(ped, false) == playerVeh) do
									local LOOP_INTERVAL = 0
									SetVehicleUndriveable(playerVeh, true)
									Wait(LOOP_INTERVAL)
								end
							end
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)