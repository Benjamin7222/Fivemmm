Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine = 5,
		modBrakes = 5,
		modTransmission = 5,
		modSuspension = 5,
		modTurbo = true,
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Armée Véhicules')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageArmee()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

                for k,v in pairs(cfg_armee.VehiculesArmee) do
                RageUI.Button("" .. v.buttoname, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                            ESX.ShowNotification("Vous ne pouvez pas faire spawn de véhicule !")
                        else
                            local model = GetHashKey(v.spawnname)
                            RequestModel(model)
                            while not HasModelLoaded(model) do Wait(10) end
                            local armeeveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                            SetVehicleNumberPlateText(armeeveh, "LSPD"..math.random(50, 999)..math.random(50, 999))
                            SetVehicleFixed(armeeveh)
                            TaskWarpPedIntoVehicle(PlayerPedId(),  armeeveh,  -1)
                            SetVehRadioStation(armeeveh, 0)
                            SetVehicleMaxMods(armeeveh)
                            RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end


Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then
          for k in pairs(cfg_armee.Position.GarageVehicule) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_armee.Position.GarageVehicule
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 50.0 then 
                  wait = 0
                  DrawMarker(cfg_armee.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour sortir votre véhicule")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageArmee()
                  end
              end
          end
      end


  Citizen.Wait(wait)
  end
end)

Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then
            for k in pairs(cfg_armee.Position.RentreVehicule) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local playerPed = PlayerPedId()
                local pos = cfg_armee.Position.RentreVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 50.0 then 
                    wait = 0
                    DrawMarker(cfg_armee.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  
                end

                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour rentrer votre véhicule")
                    if IsControlJustPressed(1,51) then
                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                        if veh ~= nil then 
                            DeleteEntity(veh) 
                        end
                    end
                end
            end
        end

        Citizen.Wait(wait)
    end
end)


Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then
            for k in pairs(cfg_armee.Position.RentreAvion) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local playerPed = PlayerPedId()
                local pos = cfg_armee.Position.RentreAvion
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 50.0 then 
                    wait = 0
                    DrawMarker(cfg_armee.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  
                end

                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour rentrer votre véhicule")
                    if IsControlJustPressed(1,51) then
                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                        if veh ~= nil then 
                            DeleteEntity(veh) 
                        end
                    end
                end
            end
        end

        Citizen.Wait(wait)
    end
end)

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Armée Avions')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageHeliArmee()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

                for k,v in pairs(cfg_armee.HelicoArmee) do
                RageUI.Button(v.buttonameheli, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                        ESX.ShowNotification("Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnnameheli)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local armeeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                        SetVehicleNumberPlateText(armeeheli, "lsarmy"..math.random(50, 999))
                        SetVehicleFixed(armeeheli)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  armeeheli,  -1)
                        SetVehRadioStation(armeeheli, 0)
                        RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end


Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then
          for k in pairs(cfg_armee.Position.GarageHeli) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_armee.Position.GarageHeli
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(cfg_armee.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour intéragir")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliArmee()
                  end
              end
          end
      end

     
  Citizen.Wait(wait)
  end
end)