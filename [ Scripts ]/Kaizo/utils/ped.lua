local scenarios = {
    'WORLD_VEHICLE_ATTRACTOR',
    'WORLD_VEHICLE_AMBULANCE',
    'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
    'WORLD_VEHICLE_BICYCLE_ROAD',
    'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
    'WORLD_VEHICLE_BIKER',
    'WORLD_VEHICLE_BOAT_IDLE',
    'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BROKEN_DOWN',
    'WORLD_VEHICLE_BUSINESSMEN',
    'WORLD_VEHICLE_HELI_LIFEGUARD',
    'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
    'WORLD_VEHICLE_CONSTRUCTION_SOLO',
    'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
    'WORLD_VEHICLE_DRIVE_SOLO',
    'WORLD_VEHICLE_FIRE_TRUCK',
    'WORLD_VEHICLE_EMPTY',
    'WORLD_VEHICLE_MARIACHI',
    'WORLD_VEHICLE_MECHANIC',
    'WORLD_VEHICLE_MILITARY_PLANES_BIG',
    'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
    'WORLD_VEHICLE_PARK_PARALLEL',
    'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
    'WORLD_VEHICLE_PASSENGER_EXIT',
    'WORLD_VEHICLE_POLICE_BIKE',
    'WORLD_VEHICLE_POLICE_CAR',
    'WORLD_VEHICLE_POLICE',
    'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
    'WORLD_VEHICLE_QUARRY',
    'WORLD_VEHICLE_SALTON',
    'WORLD_VEHICLE_SALTON_DIRT_BIKE',
    'WORLD_VEHICLE_SECURITY_CAR',
    'WORLD_VEHICLE_STREETRACE',
    'WORLD_VEHICLE_TOURBUS',
    'WORLD_VEHICLE_TOURIST',
    'WORLD_VEHICLE_TANDL',
    'WORLD_VEHICLE_TRACTOR',
    'WORLD_VEHICLE_TRACTOR_BEACH',
    'WORLD_VEHICLE_TRUCK_LOGS',
    'WORLD_VEHICLE_TRUCKS_TRAILERS',
    'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
}

local numbers = 0.3
local NonNpcZone = {}

Citizen.CreateThread(function()
    while true do
        local players = GetActivePlayers()
        local pPed = GetPlayerPed(-1)
        if #players > 5 then
            numbers = 0.3
        end


        if #players > 10 then
            numbers = 0.2 
        end


        if #players > 30 then
            numbers = 0.0
        end

        if #players == 1 then
            numbers = 0.5
        end

        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(NonNpcZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v, false)
            if dst <= 70.0 then
                numbers = 0.0
            end
        end

        if pPlayerNumber ~= nil then
            if pPlayerNumber > 120 then
                numbers = 0.0
            end
        end
        Wait(3000)
    end
end)

local ListVehicleBlacklistPNJ = {
    'armytanker',
    'armytrailer',
    'armytrailer2',
    'baletrailer',
    'boattrailer',
    'cablecar',
    'docktrailer',
    'freighttrailer',
    'graintrailer',
    'proptrailer',
    'raketrailer',
    'tr2',
    'tr3',
    'tr4',
    'trflat',
    'tvtrailer',
    'tanker',
    'tanker2',
    'trailerlarge',
    'trailerlogs',
    'trailersmall',
    'trailers',
    'trailers2',
    'trailers3',
    'trailers4',
    'airbus',
    'freight',
    'freightcar',
    'freightcont1',
    'freightcont2',
    'freightgrain',
    'metrotrain',
    'tankercar',
    'tug',
    'submersible',
    'submersible2',
    'lazer',
    'cargobob',
    'buzzard',
    'blimp',
    'blimp2',
    'blimp3',
}

local areaCleared = {
	{coords = vector3(1620.0, 1115.0, 80.0), radius = 100.0},
	{coords = vector3(-2480.0, -210.0, 20.0), radius = 100.0}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pPed = GetPlayerPed(-1)
        local PlayerCoords = GetEntityCoords(pPed)
        local playerId = PlayerId()

        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(GetPlayerPed(-1)))) then
            if GetVehicleDoorLockStatus(GetVehiclePedIsTryingToEnter(PlayerPedId(GetPlayerPed(-1)))) == 7 then
                SetVehicleDoorsLocked(GetVehiclePedIsTryingToEnter(PlayerPedId(GetPlayerPed(-1))), 2)
            end
            if GetPedInVehicleSeat(GetVehiclePedIsTryingToEnter(PlayerPedId(GetPlayerPed(-1))), -1) then
                SetPedCanBeDraggedOut(GetPedInVehicleSeat(GetVehiclePedIsTryingToEnter(PlayerPedId(GetPlayerPed(-1))), -1), false)
            end
        end

        DisablePlayerVehicleRewards(PlayerId()) -- RETRAIT ARME VEHICULES FLIC

        SetVehicleDensityMultiplierThisFrame(numbers)
        SetPedDensityMultiplierThisFrame(numbers)
        SetRandomVehicleDensityMultiplierThisFrame(numbers)
        SetParkedVehicleDensityMultiplierThisFrame(numbers)
        SetScenarioPedDensityMultiplierThisFrame(numbers, numbers)
        SetPedCanBeDraggedOut(PlayerPedId(), false)

        for k,v in pairs(ListVehicleBlacklistPNJ) do 
            SetVehicleModelIsSuppressed(GetHashKey(v), true)
        end

        ClearAreaOfCops(GetEntityCoords(GetPlayerPed(-1)), 400.0)

        for i = 1, #areaCleared, 1 do
            if #(PlayerCoords - areaCleared[i].coords) < 100 then
                ClearAreaOfVehicles(areaCleared[i].coords, areaCleared[i].radius, false, false, false, false, false)
                ClearAreaOfPeds(areaCleared[i].coords, areaCleared[i].radius, 1)
            end
        end

        RemoveVehiclesFromGeneratorsInArea(PlayerCoords - 5000.0, PlayerCoords + 5000.0)

        if GetPlayerWantedLevel(playerId) ~= 0 then
			SetPlayerWantedLevel(playerId, 0, false)
			SetPlayerWantedLevelNow(playerId, false)
	  	end

        for i = 1,15 do
            EnableDispatchService(i, false)
        end

        for i, v in ipairs(scenarios) do
            SetScenarioTypeEnabled(v, false)
        end

        HideHudComponentThisFrame(1) -- Wanted Stars
		HideHudComponentThisFrame(2) -- Weapon Icon
		HideHudComponentThisFrame(3) -- Cash
		HideHudComponentThisFrame(4) -- MP Cash
		HideHudComponentThisFrame(6) -- Vehicle Name
		HideHudComponentThisFrame(7) -- Area Name
		HideHudComponentThisFrame(8) -- Vehicle Class
		HideHudComponentThisFrame(9) -- Street Name
		HideHudComponentThisFrame(13) -- Cash Change
		HideHudComponentThisFrame(17) -- Save Game
		HideHudComponentThisFrame(20) -- Weapon Stats
        HideHudComponentThisFrame(21) -- COMPOSANTS_HUD
        HideHudComponentThisFrame(22) -- HUD_WEAPONS

        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2) -- Dégat Cout de poing
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.3) -- Dégat Matraque
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNOWBALL"), 0.3) -- Dégat Matraque
        N_0x4757f00bc6323cfe(-1553120962, 0.5) -- Dégat Véhicule
    end
end)

Citizen.CreateThread(function()
    while true do
        local handle, ped = FindFirstPed()
        local finished = false
    
        repeat
            if not IsEntityDead(ped) then
                SetPedDropsWeaponsWhenDead(ped, false)
            end
            finished, ped = FindNextPed(handle)
        until not finished
    
        EndFindPed(handle)
        Citizen.Wait(10000)
    end
end)