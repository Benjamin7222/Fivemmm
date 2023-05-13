NewKaizo.Ambulance = {}
IsInServiceEMS = false
NewKaizo.Ambulance.OpenGetItemSoins = function()
    local menu = RageUI.CreateMenu('Emergency System', "Prends les objets que tu souhaites")

    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Trousse de soin', nil, {RightLabel = '>'}, true, {
                onSelected = function() 
                    TriggerServerEvent('EMS:GetItemSoins', 'medikit')
                end
            })
            RageUI.Button('Bandage', nil, {RightLabel = '>'}, true, {
                onSelected = function()
                    TriggerServerEvent('EMS:GetItemSoins', 'bandage')
                end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

NewKaizo.Ambulance.OpenAmbulanceMenu = function()
    local menu = RageUI.CreateMenu('Emergency System', "Voici les appeles disponibles")
    local OpenInteractAmbulanceMenu = RageUI.CreateSubMenu(menu, "Emergency System", 'Actions disponible')
    local OpenPubMenuAmbulance = RageUI.CreateSubMenu(menu, "Emergency System", 'Actions disponible')
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Menu Intéraction', nil, {RightLabel = '>'}, true, {
                onSelected = function() 
                end
            }, OpenInteractAmbulanceMenu)
            RageUI.Button('Menu Publicitaire', nil, {RightLabel = '>'}, true, {
                onSelected = function() 
                end
            }, OpenPubMenuAmbulance)
            RageUI.Button('Gestion des Appels', nil, {RightLabel = '>'}, true, {
                onSelected = function() 
                end
            }, OpenReportListEms)
        end, function()
        end)

        RageUI.IsVisible(OpenInteractAmbulanceMenu, function()
            RageUI.Button('Réanimer', nil, {RightLabel = '>'}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Aucun joueur au alentours.')
                    else
                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('EMS:RevivePlayer', GetPlayerServerId(closestPlayer))
                    end
                end
            })
            RageUI.Button('Faire un bandage', nil, {RightLabel = '>'}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Aucun joueur au alentours.')
                    else
                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('EMS:HealPlayer', GetPlayerServerId(closestPlayer))
                    end
                end
            })
        end)

        RageUI.IsVisible(OpenPubMenuAmbulance, function()
            RageUI.Button("EMS Disponible", nil, {RightLabel = "→→"}, true, {
                onSelected = function()
                    TriggerServerEvent('Ouvre:ems')
                end
               })

               RageUI.Button("EMS Indisponible", nil, {RightLabel = "→→"}, true, {
                onSelected = function()
                    TriggerServerEvent('Ferme:ems')  
                end
               })
        end)

        if not RageUI.Visible(menu) and not RageUI.Visible(OpenInteractAmbulanceMenu) and not RageUI.Visible(OpenPubMenuAmbulance) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

NewKaizo.Ambulance.OpenVestiaire = function()
    local menu = RageUI.CreateMenu('Coma', "Vous êtes dans le coma")
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Prendre son service', nil, {RightLabel = '>'}, true, {
                onSelected = function()
                    IsInServiceEMS = true
                    TriggerServerEvent('EMS:Service', true)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            TriggerEvent('skinchanger:loadClothes', skin, cfg_ems.Uniforms.male)
                        else
                            TriggerEvent('skinchanger:loadClothes', skin, cfg_ems.Uniforms.female)
                        end
                    end)
                end
            })
            RageUI.Button('Fin de service', nil, {RightLabel = '>'}, true, {
                onSelected = function()
                    IsInServiceEMS = false
                    TriggerServerEvent('EMS:Service', false)
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

RegisterNetEvent('EMS:HealClientPlayer')
AddEventHandler('EMS:HealClientPlayer', function()
    local healt = GetEntityHealth(PlayerPedId())
    if healt >= 175 then
        HealtMax = 200
    else
        HealtMax = healt + 25
    end
    SetEntityHealth(PlayerPedId(), HealtMax)
end)

Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local pos = cfg_ems.Position.GarageVehicule
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -447.93, -322.64, 34.91)
  
            if dist <= 25.0 then 
                wait = 0
                DrawMarker(cfg_ems.MarkerType, -447.93, -322.64, 34.91-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_ems.MarkerSizeLargeur, cfg_ems.MarkerSizeEpaisseur, cfg_ems.MarkerSizeHauteur, cfg_ems.MarkerColorR, cfg_ems.MarkerColorG, cfg_ems.MarkerColorB, cfg_ems.MarkerOpacite, cfg_ems.MarkerSaute, true, p19, cfg_ems.MarkerTourne)  
            end
  
            if dist <= 2.0 then 
                wait = 0
                ESX.ShowHelpNotification("E", "pour intéragir")
                if IsControlJustPressed(1,51) then
                    NewKaizo.Ambulance.OpenGetItemSoins()
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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local pos = cfg_ems.Position.GarageVehicule
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1814.67, -353.34, 49.47)
  
            if dist <= 25.0 then 
                wait = 0
                DrawMarker(cfg_ems.MarkerType, -1814.67, -353.34, 49.47-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_ems.MarkerSizeLargeur, cfg_ems.MarkerSizeEpaisseur, cfg_ems.MarkerSizeHauteur, cfg_ems.MarkerColorR, cfg_ems.MarkerColorG, cfg_ems.MarkerColorB, cfg_ems.MarkerOpacite, cfg_ems.MarkerSaute, true, p19, cfg_ems.MarkerTourne)  
            end
  
            if dist <= 2.0 then 
                wait = 0
                ESX.ShowHelpNotification("E", "pour intéragir")
                if IsControlJustPressed(1,51) then
                    NewKaizo.Ambulance.OpenVestiaire()
                end
            end
        end

    Citizen.Wait(wait)
    end
end)

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

cfg_ems = {

    MarkerType = 6, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.8, -- Largeur du marker
    MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
    MarkerSizeHauteur = 0.8, -- Hauteur du marker
    MarkerDistance = 25.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 92, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 164, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)

    Vehiculesambulance = { 
        {buttoname = "Ambulance", rightlabel = "→→", spawnname = "ambulance3", spawnzone = vector3(-1895.66, -316.13, 49.23), headingspawn = 314.26},
    },

    Helicoambulance = { 
        {buttoname = "Supervolito", rightlabel = "→→", spawnname = "supervolito", spawnzone = vector3(-1867.28, -352.62, 58.03), headingspawn = 133.80},
    },

    Uniforms = {
        male = {
            ['tshirt_1'] = 43, ['tshirt_2'] = 0,
            ['torso_1'] = 188, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 109, ['pants_2'] = 8,
            ['shoes_1'] = 79, ['shoes_2'] = 0,
            ['chain_1'] = 231, ['chain_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['bproof_1'] = 22,  ['bproof_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0
        },
        female = {
            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 29,['tshirt_2'] = 0,
            ['torso_1'] = 138, ['torso_2'] = 1,
            ['arms'] = 14, ['arms_2'] = 0,
            ['pants_1'] = 175, ['pants_2'] = 3,
            ['shoes_1'] = 119, ['shoes_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] = 0,
            ['bproof_1'] = 17,
            ['chain_1'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0
        }
    },

    Position = {
        GarageVehicule = {vector3(-1879.77, -314.45, 49.48)}, -- Menu Garage Vehicule
        RentreVehicule = {vector3(-1895.66, -316.13, 49.23)}, -- Menu Garage Vehicule
        GarageHeli = {vector3(-1867.28, -352.62, 58.03)}, -- Menu Garage Helico
   }
}

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('Garage', '🚑 Véhicules')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageambulance()
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

                for k,v in pairs(cfg_ems.Vehiculesambulance) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                            ESX.ShowNotification("Point de spawn bloquée")
                        else
                            local model = GetHashKey(v.spawnname)
                            RequestModel(model)
                            while not HasModelLoaded(model) do Wait(10) end
                            local ambulanceveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                            SetVehicleNumberPlateText(ambulanceveh, "ambulance"..math.random(50, 999))
                            SetVehicleFixed(ambulanceveh)
                            SetVehicleMaxMods(ambulanceveh)
                            TaskWarpPedIntoVehicle(PlayerPedId(),  ambulanceveh,  -1)
                            SetVehRadioStation(ambulanceveh, 0)
                            SetVehicleMaxMods(ambulanceveh)
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
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
          for k in pairs(cfg_ems.Position.GarageVehicule) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_ems.Position.GarageVehicule
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 25.0 then 
                  wait = 0
                  DrawMarker(cfg_ems.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_ems.MarkerSizeLargeur, cfg_ems.MarkerSizeEpaisseur, cfg_ems.MarkerSizeHauteur, cfg_ems.MarkerColorR, cfg_ems.MarkerColorG, cfg_ems.MarkerColorB, cfg_ems.MarkerOpacite, cfg_ems.MarkerSaute, true, p19, cfg_ems.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour intéragir")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageambulance()
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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
            for k in pairs(cfg_ems.Position.RentreVehicule) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local playerPed = PlayerPedId()
                local pos = cfg_ems.Position.RentreVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 25.0 then 
                    wait = 0
                    DrawMarker(cfg_ems.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_ems.MarkerSizeLargeur, cfg_ems.MarkerSizeEpaisseur, cfg_ems.MarkerSizeHauteur, cfg_ems.MarkerColorR, cfg_ems.MarkerColorG, cfg_ems.MarkerColorB, cfg_ems.MarkerOpacite, cfg_ems.MarkerSaute, true, p19, cfg_ems.MarkerTourne)  
                end

                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir")
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
local mainMenu6 = RageUI.CreateMenu('Garage', '🚁 Hélico')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageHeliambulance()
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

              RageUI.Button("Ranger votre hélicoptère", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                  end
                    end
                  })

              RageUI.Separator("Hélicoptère")

                for k,v in pairs(cfg_ems.Helicoambulance) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local ambulanceheli = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        SetVehicleNumberPlateText(ambulanceheli, "ambulance"..math.random(50, 999))
                        SetVehicleFixed(ambulanceheli)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  ambulanceheli,  -1)
                        SetVehRadioStation(ambulanceheli, 0)
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
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
          for k in pairs(cfg_ems.Position.GarageHeli) do 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_ems.Position.GarageHeli
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 25.0 then 
                  wait = 0
                  DrawMarker(cfg_ems.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_ems.MarkerSizeLargeur, cfg_ems.MarkerSizeEpaisseur, cfg_ems.MarkerSizeHauteur, cfg_ems.MarkerColorR, cfg_ems.MarkerColorG, cfg_ems.MarkerColorB, cfg_ems.MarkerOpacite, cfg_ems.MarkerSaute, true, p19, cfg_ems.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour intéragir")
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHeliambulance()
                  end
              end
          end
      end

  Citizen.Wait(wait)
  end
end)


function SetVehicleMaxMods(vehicle)
    local props = {
      modEngine       = 2,
      modBrakes       = 2,
      modTransmission = 2,
      modSuspension   = 3,
      modTurbo        = true,
    }
    SetVehicleWindowTint(vehicle, 3)
    ESX.Game.SetVehicleProperties(vehicle, props)
  end
  
  
  Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = falses
    while true do 
        inZone = false
        local wait = 750
        if ESX.PlayerData.job then
          local plyCoords = GetEntityCoords(PlayerPedId(), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -443.97, -331.67, 78.17)
  
          if dist <= 35.0 then 
              wait = 0
              DrawMarker(6, -443.97, -331.67, 78.17-0.90, 0.0, 0.0, 0.0, -90.0,0.0,0.0,  1.3, 1.3, 1.3, 255, 232, 7, 180, false, false, p19, true)   
          end
  
          if dist <= 2.0 then 
              wait = 0
              ESX.ShowHelpNotification("E", "pour intéragir")
              if IsControlJustPressed(1,51) then
                SetEntityCoords(PlayerPedId(), -436.03, -359.65, 34.95)
                SetEntityHeading(PlayerPedId(), 355.23)
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
        local plyCoords = GetEntityCoords(PlayerPedId(), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -436.03, -359.65, 34.95)
  
          if dist <= 35.0 then 
              wait = 0
              DrawMarker(6, -436.03, -359.65, 34.95-0.95, 0.0, 0.0, 0.0, -90.0,0.0,0.0,  1.3, 1.3, 1.3, 255, 232, 7, 180, false, false, p19, true)   
          end
  
          if dist <= 2.0 then 
              wait = 0
              ESX.ShowHelpNotification("E", "pour intéragir")
              if IsControlJustPressed(1,51) then
                SetEntityCoords(PlayerPedId(), -443.97, -331.67, 78.17)
                SetEntityHeading(PlayerPedId(), 11.07)
              end
          end

        
      Citizen.Wait(wait)
    end
  end)