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
local mainMenu6 = RageUI.CreateMenu('', 'Police Véhicules')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGaragePolice()
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

                for k,v in pairs(cfg_police.VehiculesPolice) do
                RageUI.Button("" .. v.buttoname, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                            ESX.ShowNotification("Vous ne pouvez pas faire spawn de véhicule !")
                        else
                            local model = GetHashKey(v.spawnname)
                            RequestModel(model)
                            while not HasModelLoaded(model) do Wait(10) end
                            local policeveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                            SetVehicleNumberPlateText(policeveh, "LSPD"..math.random(50, 999)..math.random(50, 999))
                            SetVehicleFixed(policeveh)
                            TaskWarpPedIntoVehicle(PlayerPedId(),  policeveh,  -1)
                            SetVehRadioStation(policeveh, 0)
                            SetVehicleMaxMods(policeveh)
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
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
          for k in pairs(cfg_police.Position.GarageVehicule) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_police.Position.GarageVehicule
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 50.0 then 
                  wait = 0
                  DrawMarker(cfg_police.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_police.MarkerSizeLargeur, cfg_police.MarkerSizeEpaisseur, cfg_police.MarkerSizeHauteur, cfg_police.MarkerColorR, cfg_police.MarkerColorG, cfg_police.MarkerColorB, cfg_police.MarkerOpacite, cfg_police.MarkerSaute, true, p19, cfg_police.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour ouvrir le garage")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGaragePolice()
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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            for k in pairs(cfg_police.Position.RentreVehicule) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local playerPed = PlayerPedId()
                local pos = cfg_police.Position.RentreVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 50.0 then 
                    wait = 0
                    DrawMarker(cfg_police.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_police.MarkerSizeLargeur, cfg_police.MarkerSizeEpaisseur, cfg_police.MarkerSizeHauteur, cfg_police.MarkerColorR, cfg_police.MarkerColorG, cfg_police.MarkerColorB, cfg_police.MarkerOpacite, cfg_police.MarkerSaute, true, p19, cfg_police.MarkerTourne)  
                end

                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour ranger votre véhicule")
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


-- Garage Helico

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Police Héhlico')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageHeliPolice()
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

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                  end
                    end
                  })

              RageUI.Separator("Véhicules Disponible")

                for k,v in pairs(cfg_police.HelicoPolice) do
                RageUI.Button(v.buttonameheli, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                        ESX.ShowNotification("Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnnameheli)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local policeheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                        SetVehicleNumberPlateText(policeheli, "police"..math.random(50, 999))
                        SetVehicleFixed(policeheli)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  policeheli,  -1)
                        SetVehRadioStation(policeheli, 0)
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
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
          for k in pairs(cfg_police.Position.GarageHeli) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_police.Position.GarageHeli
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(cfg_police.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_police.MarkerSizeLargeur, cfg_police.MarkerSizeEpaisseur, cfg_police.MarkerSizeHauteur, cfg_police.MarkerColorR, cfg_police.MarkerColorG, cfg_police.MarkerColorB, cfg_police.MarkerOpacite, cfg_police.MarkerSaute, true, p19, cfg_police.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour ouvrir le garage")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliPolice()
                  end
              end
          end
      end

     
  Citizen.Wait(wait)
  end
end)