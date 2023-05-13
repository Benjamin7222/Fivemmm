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

 Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VarColor == "~r~" then VarColor = "~s~" else VarColor = "~r~" end 
   end 
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end
 
 -- MENU
 local mainMenu = RageUI.CreateMenu("", "BurgerShot") 
 local MenuGPS = RageUI.CreateSubMenu(mainMenu, "", "GPS") 
 local annoncemenu = RageUI.CreateSubMenu(mainMenu, "", "MENU")


 local open = false
 
 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
 end 
 
 function menuburgershot()
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

                    RageUI.Separator(VarColor.."↓ Option ↓") 

                       RageUI.Button("Menu GPS", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                       }, MenuGPS)

                       RageUI.Button("Facture", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.UI.Menu.Open(
                                'dialog', GetCurrentResourceName(), 'facture',
                                {
                                    title = 'Donner une facture'
                                },
                                function(data, menu)
                        
                                    local amount = tonumber(data.value)
                        
                                    if amount == nil or amount <= 0 then
                                        ESX.ShowNotification('Montant invalide')
                                    else
                                        menu.close()
                        
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                            ESX.ShowNotification('Pas de joueurs proche')
                                        else
                                            local playerPed        = GetPlayerPed(-1)
                        
                                            Citizen.CreateThread(function()
                                                TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                                                Citizen.Wait(5000)
                                                ClearPedTasks(playerPed)
                                                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_burgershot', 'BurgerShot', amount)
                                                ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
                                            end)
                                        end
                                    end
                                end,
                                function(data, menu)
                                    menu.close()
                            end)
                         end
                        })
                        RageUI.List("Annonce", BurgerShot.AnnonceList, BurgerShot.AnnonceList.Index, nil, {}, true, {
                            onListChange = function(Index)
                                BurgerShot.AnnonceList.Index = Index
                            end,
                            onSelected = function(Index)
                                if Index == 1 then
                                   TriggerServerEvent('Ouvre:burgershot')
                                end
                                if Index == 2 then
                                    TriggerServerEvent('Ferme:burgershot')
                                end
                                if Index == 3 then
                                    TriggerServerEvent('Recru:burgershot')
                                end
                                if Index == 4 then
                                    local message = KeyboardInput("Texte de l'annonce", "", 100)
                                    ExecuteCommand("shot " ..message)
                                end
                           end
                        })    
            end)

            RageUI.IsVisible(MenuGPS, function()

                RageUI.Separator(VarColor.."↓ Recolte ↓") 
                RageUI.Button("Récolte de viande", nil, {RightLabel = "→ ~r~Mettre le point"}, true, {
                    onSelected = function()
                        SetNewWaypoint(BurgerShot.RecolteViandeGPS)
                        ESX.ShowNotification('~g~GPS mise à jour !')
                    end
                   })
                   RageUI.Button("Récolte de pain", nil, {RightLabel = "→ ~r~Mettre le point"}, true, {
                    onSelected = function()
                        SetNewWaypoint(BurgerShot.RecoltePainGPS)
                        ESX.ShowNotification('~g~GPS mise à jour !')
                    end
                   })
                   RageUI.Button("Récolte de frites", nil, {RightLabel = "→ ~r~Mettre le point"}, true, {
                    onSelected = function()
                        SetNewWaypoint(BurgerShot.RecolteFritesGPS)
                        ESX.ShowNotification('~g~GPS mise à jour !')
                    end
                   })
                   RageUI.Separator(VarColor..'↓ Vente ↓')
                   RageUI.Button("Vente de nourriture", nil, {RightLabel = "→ ~r~Mettre le point"}, true, {
                    onSelected = function()
                        SetNewWaypoint(BurgerShot.VenteItemGPS)
                        ESX.ShowNotification('~g~GPS mise à jour !')
                    end
                   })
            end)

        
             Wait(0)
             end
         end)
     end
 end
 
 -- MARKERS
 
 Keys.Register('F6', 'burgershot', 'Ouvrir le menu burgershot', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
        if IsControlJustPressed(1,167) then
            if serviceBurgerShot == true then
        menuburgershot()
        else
            ESX.ShowNotification('~r~Vous devez être en tenue pour accedez au menu !')
        end
        end
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
aucun = {}

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

    
function Coffreburgershot() 
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
                getStock()
            end},GetMenu);

            RageUI.Button("Déposer un objet", nil, {RightLabel = "→"}, true, {onSelected = function()
                getInventory()
            end},PutMenu);
            

        end)

        RageUI.IsVisible(GetMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("burgershot:takeStockItems",v.item, count)
                    else
                        ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                    end
                    getStock()
                end});
            end
        end)

        RageUI.IsVisible(PutMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    TriggerServerEvent("burgershot:putStockItems",v.item, count)
                    getInventory()
                end});
            end
            

       end)


        Wait(0)
    end
 end)
 end
 end



function getInventory()
    ESX.TriggerServerCallback('burgershot:playerinventory', function(inventory)               
                
        all_items = inventory
        aucun = inventory

    end)
end

function getStock()
    ESX.TriggerServerCallback('burgershot:getStockItems', function(inventory)               
                
        all_items = inventory
        
    end)
end

Citizen.CreateThread(function()
    while true do
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
				for k in pairs(BurgerShot.Position.Coffre) do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
				local pos = BurgerShot.Position.Coffre
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

				if dist <= BurgerShot.MarkerDistance then
					wait = 0
					DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
				end

				if dist <= 1.0 then
					wait = 0
					ESX.ShowHelpNotification("E", "pour intéragir") 
					if IsControlJustPressed(1,51) then
						Coffreburgershot()
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

function Garageburgershot()
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

              RageUI.Separator(VarColor.."↓ Véhicules ↓")

                for k,v in pairs(BurgerShot.VehiculeBurgerShot) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("~g~burgershot's\n~r~Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local ambuveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        SetVehicleNumberPlateText(ambuveh, "burgershot's"..math.random(50, 999))
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
    while true do 
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
            for k in pairs(BurgerShot.Position.GarageVehicule) do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = BurgerShot.Position.GarageVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
  
                if dist <= 5.0 then 
                    wait = 0
                    DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                end
  
                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir") 
                    if IsControlJustPressed(1,51) then
                        Garageburgershot()
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


              RageUI.Separator(VarColor.."↓ Option ↓")

              RageUI.Button("Ranger votre véhicule", 'Vous devez ranger uniquement :\n- les véhicules de service ~r~burgershot\'s', {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 1 then
                      DeleteEntity(veh)
                      ESX.ShowNotification('~r~Garage \n~g~- Véhicule ranger !~s~')
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
    while true do 
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
            for k in pairs(BurgerShot.Position.RangerVehicule) do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = BurgerShot.Position.RangerVehicule
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
  
                if dist <= 5.0 then 
                    wait = 0
                    DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                end
  
                if dist <= 2.0 then 
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour intéragir") 
                    if IsControlJustPressed(1,51) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            RangerVoiture()
                      else
                        ESX.ShowNotification('Vous devez être dans un ~r~Véhicule !~s~')
                       end
            end
            end
            end
        end
    Citizen.Wait(wait)
    end
  end)

    --Récolte Viande

    local open = false 
    local Chargement = false
    local Percentage = 0.0
    local mainMenuRecolte = RageUI.CreateMenu('', 'recolte')
    mainMenuRecolte.Display.Header = true 
    mainMenuRecolte.Closed = function()
      open = false
    end

    function recolteviande()
        if open then 
            open = false
            local wait = 750
            RageUI.Visible(mainMenuRecolte, false)
            return
        else
            open = true 
            RageUI.Visible(mainMenuRecolte, true)
            CreateThread(function()
            while open do 
               RageUI.IsVisible(mainMenuRecolte,function() 
   
                RageUI.List("Nombre de viande à récupérer :", BurgerShot.FarmList, BurgerShot.FarmList.Index, 'Lancer le processus...', {}, true, {
                    onListChange = function(Index)
                        BurgerShot.FarmList.Index = Index
                    end,
                    onSelected = function(Index)
                        local playerPed = GetPlayerPed(-1)
                        Chargement = true 
                        TriggerServerEvent("Burgershot:Farmviande", Index, nil)
                        ESX.ShowNotification('Récolte en cours...')
                        ExecuteCommand('e parkingmeter')
                        Citizen.CreateThread(function()
                            Citizen.Wait(4000)
                            ESX.ShowNotification('~g~Récolte terminer !')
                            stopanim()
                        end)
                   end
                })
   
   
   
                 end)
             Wait(0)
            end
         end)
      end
   end
   
   local disponiblerecolte = false
    Citizen.CreateThread(function()
        while true do  
            local wait = 750
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                for k in pairs(BurgerShot.Position.RecolteViande) do 
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local pos = BurgerShot.Position.RecolteViande
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
      
                    if dist <= 5.0 then 
                        wait = 0
                        DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                    end
      
                    if dist <= 1.5 then 
                        wait = 0
                        ESX.ShowHelpNotification("E", "pour intéragir") 
                        if IsControlJustPressed(1,51) then
                            recolteviande()
                        end
                         end
                    end
                end
        Citizen.Wait(wait)
        end
      end)


     --Récolte Pain

     local open = false 
     local Chargement = false
     local Percentage = 0.0
     local mainMenuPain = RageUI.CreateMenu('', 'recolte')
     mainMenuPain.Display.Header = true 
     mainMenuPain.Closed = function()
       open = false
     end
 
     function recoltepain()
         if open then 
             open = false
             RageUI.Visible(mainMenuPain, false)
             return
         else
             open = true 
             RageUI.Visible(mainMenuPain, true)
             CreateThread(function()
             while open do 
                RageUI.IsVisible(mainMenuPain,function() 
    
                    RageUI.List("Nombre de pain à burger à récupérer :", BurgerShot.FarmList, BurgerShot.FarmList.Index, 'Lancer le processus...', {}, true, {
                        onListChange = function(Index)
                            BurgerShot.FarmList.Index = Index
                        end,
                        onSelected = function(Index)
                            local playerPed = GetPlayerPed(-1)
                            Chargement = true 
                            TriggerServerEvent("Burgershot:Farmpain", Index, nil)
                            ESX.ShowNotification('Récolte en cours...')
                            ExecuteCommand('e medic')
                            Citizen.CreateThread(function()
                                Citizen.Wait(4000)
                                ESX.ShowNotification('~g~Récolte terminer !')
                                stopanim()
                            end)
                       end
                    })
                   
       
       
       
                     end)
                 Wait(0)
                end
             end)
          end
       end
       
       local disponiblerecolte = false
     Citizen.CreateThread(function()
         while true do  
             local wait = 750
             if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                 for k in pairs(BurgerShot.Position.RecoltePain) do 
                     local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                     local pos = BurgerShot.Position.RecoltePain
                     local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
       
                     if dist <= 5.0 then 
                         wait = 0
                         DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                     end
       
                     if dist <= 1.5 then 
                         wait = 0
                         ESX.ShowHelpNotification("E", "pour intéragir") 
                         if IsControlJustPressed(1,51) then
                            recoltepain()
                            end
                      end
                     end
                 end
         Citizen.Wait(wait)
         end
       end)

         --Récolte Frites

         local open = false 
         local mainMenuFrites = RageUI.CreateMenu('', 'recolte')
         mainMenuFrites.Display.Header = true 
         mainMenuFrites.Closed = function()
           open = false
         end
     
         function recoltefrites()
             if open then 
                 open = false
                 RageUI.Visible(mainMenuFrites, false)
                 return
             else
                 open = true 
                 RageUI.Visible(mainMenuFrites, true)
                 CreateThread(function()
                 while open do 
                    RageUI.IsVisible(mainMenuFrites,function() 
        
                        RageUI.List("Nombre de patate à récupérer :", BurgerShot.FarmList, BurgerShot.FarmList.Index, 'Lancer le processus...', {}, true, {
                            onListChange = function(Index)
                                BurgerShot.FarmList.Index = Index
                            end,
                            onSelected = function(Index)
                                local playerPed = GetPlayerPed(-1)
                                Chargement = true 
                                TriggerServerEvent("Burgershot:Farmfrites", Index, nil)
                                ESX.ShowNotification('Récolte en cours...')
                                ExecuteCommand('e medic')
                                Citizen.CreateThread(function()
                                    Citizen.Wait(4000)
                                    ESX.ShowNotification('~g~Récolte terminer !')
                                    stopanim()
                                end)
                           end
                        })
                       

           
           
           
                         end)
                     Wait(0)
                    end
                 end)
              end
           end
           
           local disponiblerecolte = false
         Citizen.CreateThread(function()
             while true do  
                 local wait = 750
                 if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                     for k in pairs(BurgerShot.Position.RecolteFrites) do 
                         local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                         local pos = BurgerShot.Position.RecolteFrites
                         local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
           
                         if dist <= 5.0 then 
                             wait = 0
                             DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                         end
           
                         if dist <= 1.5 then 
                             wait = 0
                             ESX.ShowHelpNotification("E", "pour intéragir") 
                             if IsControlJustPressed(1,51) then
                                recoltefrites()
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
    
    
                  RageUI.Separator(VarColor.."↓ Vestiaire ↓")
    

                  RageUI.Checkbox("Prendre sa tenue Burgershot", nil, serviceBurgerShot, {}, {
                    onChecked = function(index, items)
                        serviceBurgerShot = true 
                        serviceon()
                        ESX.ShowAdvancedNotification('BurgerShot', 'BurgerShot', "Vous venez de prendre votre tenue", 'CHAR_PAKAT', 7)
                    end,
                    onUnChecked = function(index, items)
                        serviceBurgerShot = false
                        serviceoff()
                        ESX.ShowAdvancedNotification('BurgerShot', 'BurgerShot', "Vous venez de ranger votre tenue", 'CHAR_PAKAT', 7)
                    end
                })
    
    
    
                  end)
              Wait(0)
             end
          end)
       end
    end
    
    Citizen.CreateThread(function()
        while true do  
            local wait = 750
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                for k in pairs(BurgerShot.Position.VestiaireBurgerShot) do 
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local pos = BurgerShot.Position.VestiaireBurgerShot
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
      
                    if dist <= 5.0 then 
                        wait = 0
                        DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                    end
      
                    if dist <= 2.0 then 
                        wait = 0
                        ESX.ShowHelpNotification("E", "pour ouvrir le vestiaire") 
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
        local model = GetEntityModel(GetPlayerPed(-1))
        TriggerEvent('skinchanger:getSkin', function(skin)
            if model == GetHashKey("mp_m_freemode_01") then
                clothesSkin = {
                  ['tshirt_1'] = 15,  ['tshirt_2'] = 3,
                  ['torso_1'] = 282,   ['torso_2'] = 0,
                  ['arms'] = 0,
                  ['pants_1'] = 27,   ['pants_2'] = 3,
                  ['shoes_1'] = 7,   ['shoes_2'] = 0,
                  ['helmet_1'] = -1,  ['helmet_2'] = 0,
                  ['chain_1'] = 0,    ['chain_2'] = 0,
                  ['ears_1'] = -1,     ['ears_2'] = 0
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

RegisterNetEvent('message:burgershot')
AddEventHandler('message:burgershot', function(message, nom)
        ESX.ShowNotification('Message BurgerShot \n - De : '..nom..'\n- Message : ~r~'..message..'')
end)
     --Récolte Pain

     local open = false 
     local Chargement = false
     local Percentage = 0.0
     local mainMenuPain = RageUI.CreateMenu('', 'creation')
     mainMenuPain.Display.Header = true 
     mainMenuPain.Closed = function()
       open = false
     end
 
     function menuburger()
         if open then 
             open = false
             RageUI.Visible(mainMenuPain, false)
             return
         else
             open = true 
             RageUI.Visible(mainMenuPain, true)
             CreateThread(function()
             while open do 
                RageUI.IsVisible(mainMenuPain,function() 
    
                    RageUI.Button("Création menu WhiteBurger",  "~r~Requis : 1x Viande crue | 1x Pain Burger | 1x Frites", {RightLabel = ">>"}, true , {
                        onSelected = function()
                            menucreationburger()
                            end
                    })

                    RageUI.Button("Création menu Burger Prestige",  "~r~Requis : 2x Viande crue | 2x Pain Burger | 2x Frites", {RightLabel = ">>"}, true , {
                        onSelected = function()
                            menucreationprestige()
                            end
                    })
                   
       
       
       
                     end)
                 Wait(0)
                end
             end)
          end
       end

    local actionpossible = false
     Citizen.CreateThread(function()
         while true do  
             local wait = 750
             if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                 for k in pairs(BurgerShot.Position.CreationMenuBurger) do 
                     local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                     local pos = BurgerShot.Position.CreationMenuBurger
                     local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
       
                     if dist <= 5.0 then 
                         wait = 0
                         DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                     end
       
                     if dist <= 1.5 then 
                         wait = 0
                         ESX.ShowHelpNotification("E", "pour intéragir") 
                         if IsControlJustPressed(1,51) then
                            menuburger()
                        end
                    else
                        actionpossible = false
                      end
                     end
                 end
         Citizen.Wait(wait)
         end
       end)

       function menucreationburger()
        if not actionpossible then
            actionpossible = true
        if actionpossible == true then
                Citizen.Wait(200)
                ExecuteCommand('e parkingmeter')
                ESX.ShowNotification('Création en cours...')
                Citizen.Wait(4000)
                TriggerServerEvent('pawal:menu')
                stopanim()
        end
        else
            actionpossible = false
        end
    end

    function menucreationprestige()
        if not actionpossible then
            actionpossible = true
        if actionpossible == true then
                Citizen.Wait(200)
                ExecuteCommand('e parkingmeter')
                ESX.ShowNotification('Création en cours...')
                Citizen.Wait(4000)
                TriggerServerEvent('pawal:menuluxe')
                stopanim()
        end
        else
            actionpossible = false
        end
    end

    function stopanim()
        local playerPed = GetPlayerPed(-1)
        ClearPedTasks(playerPed)
    end

         --Comptoire N1

         local open = false 
         local Chargement = false
         local Percentage = 0.0
         local mainMenuPain = RageUI.CreateMenu('', 'comptoire')
         local PutMenu2 = RageUI.CreateSubMenu(mainMenuPain,"", "Contenue :")
         mainMenuPain.Display.Header = true 
         mainMenuPain.Closed = function()
           open = false
         end
     
         function menucomptoire1()
             if open then 
                 open = false
                 RageUI.Visible(mainMenuPain, false)
                 return
             else
                 open = true 
                 RageUI.Visible(mainMenuPain, true)
                 CreateThread(function()
                 while open do 
                    RageUI.IsVisible(mainMenuPain,function() 

RageUI.Separator(VarColor..'↓ Facture ↓')
                        RageUI.Button("Faire une facture",  nil, {RightLabel = ">>"}, true , {
                            onSelected = function()
                                ESX.UI.Menu.Open(
                                    'dialog', GetCurrentResourceName(), 'facture',
                                    {
                                        title = 'Donner une facture'
                                    },
                                    function(data, menu)
                            
                                        local amount = tonumber(data.value)
                            
                                        if amount == nil or amount <= 0 then
                                            ESX.ShowNotification('Montant invalide')
                                        else
                                            menu.close()
                            
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            
                                            if closestPlayer == -1 or closestDistance > 3.0 then
                                                ESX.ShowNotification('Pas de joueurs proche')
                                            else
                                                local playerPed        = GetPlayerPed(-1)
                            
                                                Citizen.CreateThread(function()
                                                    TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                                                    Citizen.Wait(5000)
                                                    ClearPedTasks(playerPed)
                                                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_burgershot', 'BurgerShot', amount)
                                                    ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
                                                end)
                                            end
                                        end
                                    end,
                                    function(data, menu)
                                        menu.close()
                                end)
                             end
                            })

                            RageUI.Separator(VarColor..'↓ Stockage ↓')

                            RageUI.Button("Regarder le stockage",  "Apperçue du contenue du coffre", {RightLabel = ">>"}, true , {
                                onSelected = function()
                                    getStock2()
                                end
                            }, PutMenu2)

                        end)



                        RageUI.IsVisible(PutMenu2, function()
            
                            for k,v in pairs(all_items) do
                                RageUI.Button(v.label, "~g~Ceci est qu'un appercus sur coffre", {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                                    getStock2()
                                end});
                            end
                        end)
                     Wait(0)
                    end
                 end)
              end
           end
    
        local actionpossible = false
         Citizen.CreateThread(function()
             while true do  
                 local wait = 750
                 if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                     for k in pairs(BurgerShot.Position.accueilmenu1) do 
                         local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                         local pos = BurgerShot.Position.accueilmenu1
                         local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
           
                         if dist <= 5.0 then 
                             wait = 0
                             DrawMarker(25, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.8, 0.8, 0.8, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, false, true, p19, false)  
                         end
           
                         if dist <= 1.0 then 
                             wait = 0
                             ESX.ShowHelpNotification("E", "pour intéragir") 
                             if IsControlJustPressed(1,51) then
                                menucomptoire1()
                            end
                        else
                            actionpossible = false
                          end
                         end
                     end
             Citizen.Wait(wait)
             end
           end)


           function getStock2()
            ESX.TriggerServerCallback('burgershot:getStockItems', function(inventory)               
                        
                all_items = inventory
                
            end)
        end
        




                 --Comptoire N2

                 local open = false 
                 local Chargement = false
                 local Percentage = 0.0
                 local mainMenuPain = RageUI.CreateMenu('', 'comptoire')
                 local PutMenu3 = RageUI.CreateSubMenu(mainMenuPain,"", "Contenue :")
                 mainMenuPain.Display.Header = true 
                 mainMenuPain.Closed = function()
                   open = false
                 end
             
                 function menucomptoire2()
                     if open then 
                         open = false
                         RageUI.Visible(mainMenuPain, false)
                         return
                     else
                         open = true 
                         RageUI.Visible(mainMenuPain, true)
                         CreateThread(function()
                         while open do 
                            RageUI.IsVisible(mainMenuPain,function() 
        
        RageUI.Separator(VarColor..'↓ Facture ↓')
                                RageUI.Button("Faire une facture",  nil, {RightLabel = ">>"}, true , {
                                    onSelected = function()
                                        ESX.UI.Menu.Open(
                                            'dialog', GetCurrentResourceName(), 'facture',
                                            {
                                                title = 'Donner une facture'
                                            },
                                            function(data, menu)
                                    
                                                local amount = tonumber(data.value)
                                    
                                                if amount == nil or amount <= 0 then
                                                    ESX.ShowNotification('Montant invalide')
                                                else
                                                    menu.close()
                                    
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    
                                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                                        ESX.ShowNotification('Pas de joueurs proche')
                                                    else
                                                        local playerPed        = GetPlayerPed(-1)
                                    
                                                        Citizen.CreateThread(function()
                                                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                                                            Citizen.Wait(5000)
                                                            ClearPedTasks(playerPed)
                                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_burgershot', 'BurgerShot', amount)
                                                            ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
                                                        end)
                                                    end
                                                end
                                            end,
                                            function(data, menu)
                                                menu.close()
                                        end)
                                     end
                                    })
        
                                    RageUI.Separator(VarColor..'↓ Stockage ↓')
        
                                    RageUI.Button("Regarder le stockage",  "Apperçue du contenue du coffre", {RightLabel = ">>"}, true , {
                                        onSelected = function()
                                            getStock2()
                                        end
                                    }, PutMenu3)
        
                                end)
        
        
        
                                RageUI.IsVisible(PutMenu3, function()
                    
                                    for k,v in pairs(all_items) do
                                        RageUI.Button(v.label, "~g~Ceci est qu'un appercus sur coffre", {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                                            getStock3()
                                        end});
                                    end
                                end)
                             Wait(0)
                            end
                         end)
                      end
                   end
            
                local actionpossible = false
                 Citizen.CreateThread(function()
                     while true do  
                         local wait = 750
                         if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                             for k in pairs(BurgerShot.Position.accueilmenu2) do 
                                 local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                 local pos = BurgerShot.Position.accueilmenu2
                                 local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                   
                                 if dist <= 5.0 then 
                                     wait = 0
                                     DrawMarker(25, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.8, 0.8, 0.8, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, false, true, p19, false)  
                                 end
                   
                                 if dist <= 1.0 then 
                                     wait = 0
                                     ESX.ShowHelpNotification("E", "pour intéragir") 
                                     if IsControlJustPressed(1,51) then
                                        menucomptoire2()
                                    end
                                else
                                    actionpossible = false
                                  end
                                 end
                             end
                     Citizen.Wait(wait)
                     end
                   end)
        
        
                   function getStock3()
                    ESX.TriggerServerCallback('burgershot:getStockItems', function(inventory)               
                                
                        all_items = inventory
                        
                    end)
                end
                

                     --Creation Frites

     local open = false 
     local Chargement = false
     local Percentage = 0.0
     local mainMenuPain = RageUI.CreateMenu('', 'creation')
     mainMenuPain.Display.Header = true 
     mainMenuPain.Closed = function()
       open = false
     end
 
     function menufritescreation()
         if open then 
             open = false
             RageUI.Visible(mainMenuPain, false)
             return
         else
             open = true 
             RageUI.Visible(mainMenuPain, true)
             CreateThread(function()
             while open do 
                RageUI.IsVisible(mainMenuPain,function() 
    
                    RageUI.Button("Création de frites",  "~r~Requis : 1x Patate", {RightLabel = ">>"}, true , {
                        onSelected = function()
                            menucreation2()
                            end
                    })
                   
       
       
       
                     end)
                 Wait(0)
                end
             end)
          end
       end

    local actionpossible = false
     Citizen.CreateThread(function()
         while true do  
             local wait = 750
             if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                 for k in pairs(BurgerShot.Position.CreationFrites) do 
                     local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                     local pos = BurgerShot.Position.CreationFrites
                     local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
       
                     if dist <= 5.0 then 
                         wait = 0
                         DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                     end
       
                     if dist <= 1.1 then 
                         wait = 0
                         ESX.ShowHelpNotification("E", "pour intéragir") 
                         if IsControlJustPressed(1,51) then
                            menufritescreation()
                        end
                    else
                        actionpossible = false
                      end
                     end
                 end
         Citizen.Wait(wait)
         end
       end)

       function menucreation2()
        if not actionpossible then
            actionpossible = true
        if actionpossible == true then
                Citizen.Wait(200)
                ExecuteCommand('e parkingmeter')
                ESX.ShowNotification('Création en cours...')
                Citizen.Wait(4000)
                TriggerServerEvent('pawal:fritescreation')
                stopanim()
        end
        else
            actionpossible = false
        end
    end


                        --Creation Steak

                        local open = false 
                        local Chargement = false
                        local Percentage = 0.0
                        local mainMenuPain = RageUI.CreateMenu('', 'creation')
                        mainMenuPain.Display.Header = true 
                        mainMenuPain.Closed = function()
                          open = false
                        end
                    
                        function menusteakcreation()
                            if open then 
                                open = false
                                RageUI.Visible(mainMenuPain, false)
                                return
                            else
                                open = true 
                                RageUI.Visible(mainMenuPain, true)
                                CreateThread(function()
                                while open do 
                                   RageUI.IsVisible(mainMenuPain,function() 
                       
                                       RageUI.Button("Création de Steak",  "~r~Requis : 1x Viande crue", {RightLabel = ">>"}, true , {
                                           onSelected = function()
                                               menucreation()
                                               end
                                       })
                                      
                          
                          
                          
                                        end)
                                    Wait(0)
                                   end
                                end)
                             end
                          end
                   
                       local actionpossible = false
                        Citizen.CreateThread(function()
                            while true do  
                                local wait = 750
                                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                                    for k in pairs(BurgerShot.Position.CreationSteak) do 
                                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                        local pos = BurgerShot.Position.CreationSteak
                                        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                          
                                        if dist <= 5.0 then 
                                            wait = 0
                                            DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                                        end
                          
                                        if dist <= 1.1 then 
                                            wait = 0
                                            ESX.ShowHelpNotification("E", "pour intéragir") 
                                            if IsControlJustPressed(1,51) then
                                               menusteakcreation()
                                           end
                                       else
                                           actionpossible = false
                                         end
                                        end
                                    end
                            Citizen.Wait(wait)
                            end
                          end)

                          

                                                  --Creation hamburger

                        local open = false 
                        local Chargement = false
                        local Percentage = 0.0
                        local mainMenuPain = RageUI.CreateMenu('', 'creation')
                        mainMenuPain.Display.Header = true 
                        mainMenuPain.Closed = function()
                          open = false
                        end
                    
                        function menuhamburgercreation()
                            if open then 
                                open = false
                                RageUI.Visible(mainMenuPain, false)
                                return
                            else
                                open = true 
                                RageUI.Visible(mainMenuPain, true)
                                CreateThread(function()
                                while open do 
                                   RageUI.IsVisible(mainMenuPain,function() 
                       
                                       RageUI.Button("Assemblager un hamburger",  "~r~Requis : 1x Steak | 1x Pain Burger", {RightLabel = ">>"}, true , {
                                           onSelected = function()
                                            menucreation3()
                                               end
                                       })
                                      
                          
                          
                          
                                        end)
                                    Wait(0)
                                   end
                                end)
                             end
                          end
                   
                       local actionpossible = false
                        Citizen.CreateThread(function()
                            while true do  
                                local wait = 750
                                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                                    for k in pairs(BurgerShot.Position.CreationHamburger) do 
                                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                        local pos = BurgerShot.Position.CreationHamburger
                                        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                          
                                        if dist <= 5.0 then 
                                            wait = 0
                                            DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                                        end
                          
                                        if dist <= 1.1 then 
                                            wait = 0
                                            ESX.ShowHelpNotification("E", "pour intéragir") 
                                            if IsControlJustPressed(1,51) then
                                                menuhamburgercreation()
                                           end
                                       else
                                           actionpossible = false
                                         end
                                        end
                                    end
                            Citizen.Wait(wait)
                            end
                          end)
                                                                   
                          function menucreation3()
                            if not actionpossible then
                                actionpossible = true
                            if actionpossible == true then
                                    Citizen.Wait(200)
                                    ExecuteCommand('e parkingmeter')
                                    ESX.ShowNotification('Création en cours...')
                                    Citizen.Wait(5000)
                                    TriggerServerEvent('pawal:hamburgercreation')
                                    stopanim()
                            end
                            else
                                actionpossible = false
                            end
                        end






                                              --Vente

                                              local open = false 
                                              local Chargement = false
                                              local Percentage = 0.0
                                              local MenuVente = RageUI.CreateSubMenu(mainMenu,"", "vente")
                                              local mainMenu = RageUI.CreateMenu('', 'vente')
                                              local tarifvente = RageUI.CreateSubMenu(MenuVente,"", "tarif")
                                              mainMenu.Display.Header = true 
                                              mainMenu.Closed = function()
                                                open = false
                                              end
                                          
                                              function menuvente()
                                                  if open then 
                                                      open = false
                                                      RageUI.Visible(mainMenu, false)
                                                      return
                                                  else
                                                      open = true 
                                                      RageUI.Visible(mainMenu, true)
                                                      CreateThread(function()
                                                      while open do 
                                                         RageUI.IsVisible(mainMenu,function()
                                                            RageUI.Button("Accedez au menu vente",  "Vendre votre marchandise", {RightLabel = ">>"}, true , {
                                                                onSelected = function()
                                                                    end
                                                            }, MenuVente)
                                                            
                                                        end)

                                                          RageUI.IsVisible(MenuVente,function() 
                                                            RageUI.Button("Voir les tarifs de vente",  nil, {RightLabel = ">>"}, true , {
                                                                onSelected = function()
                                                                    end
                                                            }, tarifvente)

                                                            RageUI.List("Vendre :", BurgerShot.VenteList, BurgerShot.VenteList.Index, nil, {}, true, {
                                                                onListChange = function(Index,a)
                                                                    BurgerShot.VenteList.Index = Index
                                                                end,
                                                                onSelected = function(Index)
                                                                    if Index == 1 then
                                                                        TriggerServerEvent('burgershot:ventehamburger')
                                                                    end
                                                                    if Index == 2 then
                                                                        TriggerServerEvent('burgershot:ventefrites')
                                                                    end
                                                                    if Index == 3 then
                                                                        TriggerServerEvent('burgershot:ventesoda')
                                                                    end
                                                                    if Index == 4 then
                                                                        TriggerServerEvent('burgershot:ventemenustandard')
                                                                    end
                                                                    if Index == 5 then
                                                                        TriggerServerEvent('burgershot:ventemenuprestige')
                                                                    end
                                                               end
                                                            })   
                                                        end)

                                                        RageUI.IsVisible(tarifvente,function() 

                                                        RageUI.Separator('Hamburger : ~g~10$')
                                                        RageUI.Separator('Frites : ~g~7$')
                                                        RageUI.Separator('Soda-shot : ~g~9$')
                                                        RageUI.Separator('Menu WhiteBurger : ~g~15$')
                                                        RageUI.Separator('Menu Burger Prestige : ~g~25$')


                                                            
                                                        end)
                                                          Wait(0)
                                                         end
                                                      end)
                                                   end
                                                end
                                         
                                             local actionpossible = false
                                              Citizen.CreateThread(function()
                                                  while true do  
                                                      local wait = 750
                                                      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
                                                          for k in pairs(BurgerShot.Position.menuvente) do 
                                                              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                                                              local pos = BurgerShot.Position.menuvente
                                                              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
                                                
                                                              if dist <= 5.0 then 
                                                                  wait = 0
                                                                  DrawMarker(BurgerShot.MarkerType, pos[k].x, pos[k].y, pos[k].z-1, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, BurgerShot.MarkerSizeLargeur, BurgerShot.MarkerSizeEpaisseur, BurgerShot.MarkerSizeHauteur, BurgerShot.MarkerColorR, BurgerShot.MarkerColorG, BurgerShot.MarkerColorB, BurgerShot.MarkerOpacite, BurgerShot.MarkerSaute, true, p19, BurgerShot.MarkerTourne)  
                                                              end
                                                
                                                              if dist <= 1.1 then 
                                                                  wait = 0
                                                                  ESX.ShowHelpNotification("E", "pour intéragir") 
                                                                  if IsControlJustPressed(1,51) then
                                                                     menuvente()
                                                                 end
                                                             else
                                                                 actionpossible = false
                                                               end
                                                              end
                                                          end
                                                  Citizen.Wait(wait)
                                                  end
                                                end)
                                         
                                                function menucreation()
                                                 if not actionpossible then
                                                     actionpossible = true
                                                 if actionpossible == true then
                                                         Citizen.Wait(200)
                                                         ExecuteCommand('e parkingmeter')
                                                         ESX.ShowNotification('Création en cours...')
                                                         Citizen.Wait(5000)
                                                         TriggerServerEvent('pawal:steakcreation')
                                                         stopanim()
                                                 end
                                                 else
                                                     actionpossible = false
                                                 end
                                             end