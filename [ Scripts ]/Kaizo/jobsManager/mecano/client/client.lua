ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
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

local VarColor = "~b~"

 Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VarColor == "~b~" then VarColor = "~s~" else VarColor = "~b~" end 
   end 
end)


 
 -- MENU
 local mainMenu = RageUI.CreateMenu("", "MENU MECANO") 
 local MenuVehicule = RageUI.CreateSubMenu(mainMenu, "", "MENU") 
 local annoncemenu = RageUI.CreateSubMenu(mainMenu, "", "MENU")


 local open = false
 
 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
 end 
 
 function menumecano()
     if open then 
         open = false 
             RageUI.Visible(mainMenu, false) 
             return 
     else 
         open = true 
             RageUI.Visible(mainMenu, true)
         Citizen.CreateThread(function()
             while open do 
                 RageUI.IsVisible(mainMenu, function()
                    RageUI.Checkbox("Prendre son service Mécano", nil, serviceMecano, {}, {
                        onChecked = function(index, items)
                            serviceMecano = true
                            TriggerServerEvent('benny:prisedeservice')
                            ESX.ShowNotification("Vous avez pris votre service !")
                        end,
                        onUnChecked = function(index, items)
                            serviceMecano = false
                            TriggerServerEvent('benny:prisedeservice')
                            ESX.ShowNotification("Vous avez quitter votre service !")
                        end
                    })

                 if serviceMecano then

                    RageUI.Separator("~r~RedLine~s~") 

                       RageUI.Button("Intéractions sur un véhicule", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                       }, MenuVehicule)

                       RageUI.Button("Gestion Publicité", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                       }, annoncemenu)
                    end       
            end)

            RageUI.IsVisible(MenuVehicule, function()

                RageUI.Button("Faire une réparation", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous ne pouvez pas faire cette action depuis un véhicule", 'CHAR_CARSITE3', 7)
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(20000)

					SetVehicleFixed(vehicle)
					SetVehicleDeformationFixed(vehicle)
					SetVehicleUndriveable(vehicle, false)
					SetVehicleEngineOn(vehicle, true, true)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous avez réparer le véhicule", 'CHAR_CARSITE3', 7)
					isBusy = false
				end)
			else
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Aucun véhicule à proximité", 'CHAR_CARSITE3', 7)
			end
                    end
                   })

                RageUI.Button("Nettoyer le véhicule", nil, {RightLabel = "→→"}, true, {
                 onSelected = function()
                    local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous ne pouvez pas faire cette action depuis un véhicule", 'CHAR_CARSITE3', 7)
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous avez nettoyer le véhicule", 'CHAR_CARSITE3', 7)
					isBusy = false
				end)
			else
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Aucun véhicule à proximité", 'CHAR_CARSITE3', 7)
			end
                  end
                })

                RageUI.Button("Procédure de mise en fourrière", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local playerPed = PlayerPedId()


			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                Citizen.Wait(6500)
                ClearPedTasks(playerPed)
                Citizen.Wait(2500)
                ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Mise en fourrière terminer", 'CHAR_CARSITE3', 7)
                ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous devez être sur la place conducteur !", 'CHAR_CARSITE3', 7)
				end
			else
				local vehicle = ESX.Game.GetVehicleInDirection()

				if DoesEntityExist(vehicle) then
                    TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                    Citizen.Wait(6500)
                    ClearPedTasks(playerPed)
                    Citizen.Wait(4000)
                    ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Mise en fourrière terminer", 'CHAR_CARSITE3', 7)
					ESX.Game.DeleteVehicle(vehicle)
				else
					ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous devez être prêt d'un véhicule pour commencer la mise en fourrière", 'CHAR_CARSITE3', 7)
				end
			end
                    end 
                })

                RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Vous ne pouvez pas faire cette action depuis un véhicule", 'CHAR_CARSITE3', 7)
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Crochetage terminer", 'CHAR_CARSITE3', 7)
					isBusy = false
				end)
			else
				ESX.ShowAdvancedNotification('Mecano', 'RedLine Perf', "Aucun véhicule à proximité", 'CHAR_CARSITE3', 7)
			end
                    end
                })

            end)

                RageUI.IsVisible(annoncemenu, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    RageUI.Button("Annonce", nil, {RightLabel = "~g~Ouverture~w~ →→"}, true, {
                        onSelected = function()
                            TriggerServerEvent('Ouvre:benny')
                        end
                       })

                       RageUI.Button("Annonce", nil, {RightLabel = "~r~Fermeture~w~ →→"}, true, {
                        onSelected = function()
                            TriggerServerEvent('Ferme:benny')  
                        end
                       })

                        RageUI.Button("Publicité",  "Cooldown de 10secondes entre chaque nouvelle annonce.", {RightLabel = "~o~Personalisé~w~ →→"}, not codesCooldown4 , {
                         onSelected = function()
                             codesCooldown4 = true 
                             local message = KeyboardInput('', '','', 100)
                             ExecuteCommand("meca " ..message)
                             Citizen.SetTimeout(10000, function() codesCooldown4 = false end)
                        end
                    })
                    
                end)

        
             Wait(0)
             end
         end)
     end
 end
 
 -- MARKERS
 
 Keys.Register('F6', 'mécano', 'Ouvrir le menu mécano', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
        menumecano()
	end
end)

-- Coffre

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mainMenu = RageUI.CreateMenu("", "Action :")
local PutMenu = RageUI.CreateSubMenu(mainMenu,"", "Contenue :")
local GetMenu = RageUI.CreateSubMenu(mainMenu,"", "Contenue :")

local open = false

mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    open = false
end

all_items = {}

    
function CoffreBenny() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Prendre un objet", nil, {RightLabel = "→"}, true, {onSelected = function()
                getStockMecano()
            end},GetMenu);

            RageUI.Button("Déposer un objet", nil, {RightLabel = "→"}, true, {onSelected = function()
                getInventoryMecano()
            end},PutMenu);
            

        end)

        RageUI.IsVisible(GetMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput('', '','', 100)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("benny:takeStockItems",v.item, count)
                    else
                        ESX.ShowNotification("Vous n'en avez pas assez sur vous")
                    end
                    getStockMecano()
                end});
            end

        end)

        RageUI.IsVisible(PutMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput('', '','', 100)
                    count = tonumber(count)
                    TriggerServerEvent("benny:putStockItems",v.item, count)
                    getInventoryMecano()
                end});
            end
            

       end)


        Wait(0)
    end
 end)
 end
 end



function getInventoryMecano()
    ESX.TriggerServerCallback('benny:playerinventory', function(inventory)               
                
        all_items = inventory
        
    end)
end

function getStockMecano()
    ESX.TriggerServerCallback('benny:getStockItems', function(inventory)               
                
        all_items = inventory
        
    end)
end

Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
				for k in pairs(cfg_mecano.Position.Coffre) do
				local plyCoords = GetEntityCoords(PlayerPedId(), false)
				local pos = cfg_mecano.Position.Coffre
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

				if dist <= cfg_mecano.MarkerDistance then
					wait = 0
					DrawMarker(cfg_mecano.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_mecano.MarkerSizeLargeur, cfg_mecano.MarkerSizeEpaisseur, cfg_mecano.MarkerSizeHauteur, cfg_mecano.MarkerColorR, cfg_mecano.MarkerColorG, cfg_mecano.MarkerColorB, cfg_mecano.MarkerOpacite, cfg_mecano.MarkerSaute, true, p19, cfg_mecano.MarkerTourne)  
				end

				if dist <= 1.0 then
					wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir")
					if IsControlJustPressed(1,51) then
						CoffreBenny()
					end
				end
			end
		end


    Citizen.Wait(wait)
    end
end)


-- Garage

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Faites votre choix ?')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function GarageBenny()
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

              RageUI.Separator("↓ Véhicules ↓")

                for k,v in pairs(cfg_mecano.VehiculeBenny) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("Benny's\nPoint de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local ambuveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        SetVehicleNumberPlateText(ambuveh, "Benny's"..math.random(50, 999))
                        SetVehicleFixed(ambuveh)
                        SetVehRadioStation(ambuveh, 0)
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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
            for k in pairs(cfg_mecano.Position.GarageVehicule) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local pos = cfg_mecano.Position.GarageVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
  
                if dist <= 50.0 then 
                    wait = 0
                    DrawMarker(cfg_mecano.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_mecano.MarkerSizeLargeur, cfg_mecano.MarkerSizeEpaisseur, cfg_mecano.MarkerSizeHauteur, cfg_mecano.MarkerColorR, cfg_mecano.MarkerColorG, cfg_mecano.MarkerColorB, cfg_mecano.MarkerOpacite, cfg_mecano.MarkerSaute, true, p19, cfg_mecano.MarkerTourne)  
                end
  
                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir")
                    if IsControlJustPressed(1,51) then
                        GarageBenny()
                    end
                end
            end
        end


    Citizen.Wait(wait)
    end
  end)
 
  --Ranger voiture

  local open = false 
local mainMenuRanger = RageUI.CreateMenu('', 'Faites votre choix ?')
mainMenuRanger.Display.Header = true 
mainMenuRanger.Closed = function()
  open = false
end

function RangerVoiture()
     if open then 
         open = false
         RageUI.Visible(mainMenuRanger, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenuRanger, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenuRanger,function() 


              RageUI.Separator("↓ Option ↓")

              RageUI.Button("Ranger votre véhicule", 'Vous devez ranger uniquement :\n- les véhicules de service Benny\'s', {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 1 then
                      DeleteEntity(veh)
                      ESX.ShowNotification('Véhicule ranger !')
                      RageUI.CloseAll()
                  end
                 end
             })



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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
            for k in pairs(cfg_mecano.Position.RangerVehicule) do 
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local pos = cfg_mecano.Position.RangerVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
  
                if dist <= 50.0 then 
                    wait = 0
                    DrawMarker(cfg_mecano.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_mecano.MarkerSizeLargeur, cfg_mecano.MarkerSizeEpaisseur, cfg_mecano.MarkerSizeHauteur, cfg_mecano.MarkerColorR, cfg_mecano.MarkerColorG, cfg_mecano.MarkerColorB, cfg_mecano.MarkerOpacite, cfg_mecano.MarkerSaute, true, p19, cfg_mecano.MarkerTourne)  
                end
  
                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir")
                    if IsControlJustPressed(1,51) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            RangerVoiture()
                      else
                        ESX.ShowNotification('Vous devez être dans un véhicule !')
                       end
            end
            end
            end
        end

    Citizen.Wait(wait)
    end
  end)

    --Fabrication kit

    local open = false 
    local mainMenuFrabrication = RageUI.CreateMenu('', 'Faites votre choix ?')
    mainMenuFrabrication.Display.Header = true 
    mainMenuFrabrication.Closed = function()
      open = false
    end
    
    function fabrication()
         if open then 
             open = false
             RageUI.Visible(mainMenuFrabrication, false)
             return
         else
             open = true 
             RageUI.Visible(mainMenuFrabrication, true)
             CreateThread(function()
             while open do 
                RageUI.IsVisible(mainMenuFrabrication,function() 
    
    
                  RageUI.Separator("↓ Fabrication de kit ↓")
    
                  RageUI.Button("Fabriquer un kit de réparation", 'Prix du matériel néceissaire : 10$', {RightLabel = "→→"}, true , {
                    onSelected = function()
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                        Citizen.CreateThread(function()
                        ESX.ShowAdvancedNotification('Mecano', 'Notification', "Fabrication en cours...", 'CHAR_CARSITE3', 7)
                        Citizen.Wait(7500)
                        ClearPedTasksImmediately(playerPed)
                        Citizen.Wait(100)
                        TriggerServerEvent('benny:creationkitrepa', 10, 'fixkit', 1)
                    end)
                end
                 })

                 RageUI.Button("Fabriquer un kit carroserie", 'Prix du matériel néceissaire : 15$', {RightLabel = "→→"}, true , {
                    onSelected = function()
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                        Citizen.CreateThread(function()
                        ESX.ShowAdvancedNotification('Mecano', 'Notification', "Fabrication en cours...", 'CHAR_CARSITE3', 7)
                        Citizen.Wait(7500)
                        ClearPedTasksImmediately(playerPed)
                        Citizen.Wait(100)
                        TriggerServerEvent('benny:creationkitcaro', 15, 'carokit', 1)
                    end)
                end
                 })
    
    
    
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
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
                for k in pairs(cfg_mecano.Position.FabricationKit) do 
                    local plyCoords = GetEntityCoords(PlayerPedId(), false)
                    local pos = cfg_mecano.Position.FabricationKit
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
      
                    if dist <= 50.0 then 
                        wait = 0
                        DrawMarker(cfg_mecano.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_mecano.MarkerSizeLargeur, cfg_mecano.MarkerSizeEpaisseur, cfg_mecano.MarkerSizeHauteur, cfg_mecano.MarkerColorR, cfg_mecano.MarkerColorG, cfg_mecano.MarkerColorB, cfg_mecano.MarkerOpacite, cfg_mecano.MarkerSaute, true, p19, cfg_mecano.MarkerTourne)  
                    end
      
                    if dist <= 2.0 then 
                        wait = 0
                        ESX.ShowHelpNotification("E", "pour intéragir")
                        if IsControlJustPressed(1,51) then
                            fabrication()
                           end
                     end
                    end
                end


        Citizen.Wait(wait)
        end
      end)

--Vestiaire

    local open = false 
    local mainMenuvestiaire = RageUI.CreateMenu('', 'Faites votre choix ?')
    mainMenuvestiaire.Display.Header = true 
    mainMenuvestiaire.Closed = function()
      open = false
    end
    
    function vestiaire()
         if open then 
             open = false
             RageUI.Visible(mainMenuvestiaire, false)
             return
         else
             open = true 
             RageUI.Visible(mainMenuvestiaire, true)
             CreateThread(function()
             while open do 
                RageUI.IsVisible(mainMenuvestiaire,function() 
    
    
                  RageUI.Separator("↓ Vestiaire ↓")
    

                  RageUI.Checkbox("Prendre sa tenue Mécano", nil, service, {}, {
                    onChecked = function(index, items)
                        service = true
                        serviceon()
                        ESX.ShowAdvancedNotification('Mecano', 'Notification', "Vous venez de prendre votre tenue", 'CHAR_CARSITE3', 7)
                    end,
                    onUnChecked = function(index, items)
                        service = false
                        serviceoff()
                        ESX.ShowAdvancedNotification('Mecano', 'Notification', "Vous venez de ranger votre tenue", 'CHAR_CARSITE3', 7)
                    end
                })
    
    
    
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
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
                for k in pairs(cfg_mecano.Position.Vestiaire) do 
                    local plyCoords = GetEntityCoords(PlayerPedId(), false)
                    local pos = cfg_mecano.Position.Vestiaire
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
      
                    if dist <= 50.0 then 
                        wait = 0
                        DrawMarker(cfg_mecano.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_mecano.MarkerSizeLargeur, cfg_mecano.MarkerSizeEpaisseur, cfg_mecano.MarkerSizeHauteur, cfg_mecano.MarkerColorR, cfg_mecano.MarkerColorG, cfg_mecano.MarkerColorB, cfg_mecano.MarkerOpacite, cfg_mecano.MarkerSaute, true, p19, cfg_mecano.MarkerTourne)  
                    end
      
                    if dist <= 2.0 then 
                        wait = 0
                        ESX.ShowHelpNotification("E", "pour intéragir")
                        if IsControlJustPressed(1,51) then
                            vestiaire()
                           end
                     end
                    end
                end


        Citizen.Wait(wait)
        end
      end)

      function  serviceon()
        local model = GetEntityModel(PlayerPedId())
        TriggerEvent('skinchanger:getSkin', function(skin)
            if model == GetHashKey("mp_m_freemode_01") then
                clothesSkin = {
                    ['tshirt_1'] = 114,  ['tshirt_2'] = 1,
                    ['torso_1'] = 179,   ['torso_2'] = 3,
                    ['arms'] = 31,
                    ['pants_1'] = 120,   ['pants_2'] = 3,
                    ['shoes_1'] = 90,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
                  }
              else
                  clothesSkin = {
                    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                    ['torso_1'] = 249,   ['torso_2'] = 0, 
                    ['arms'] = 31,
                    ['pants_1'] = 101,   ['pants_2'] = 0,
                    ['shoes_1'] = 6,   ['shoes_2'] = 0,  
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0
                  }
              end
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end)
    end
    
    function serviceoff()
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          TriggerEvent('skinchanger:loadSkin', skin)
         end)
      end

RegisterNetEvent('message:benny')
AddEventHandler('message:benny', function(message, nom)
		ESX.ShowAdvancedNotification('Notification Benny\'s', 'Message', 'De: '..nom..'\n~w~Message: '..message..'', 'CHAR_CARSITE3', 1)
end)