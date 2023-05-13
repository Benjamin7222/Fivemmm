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

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('~y~Garage', '~y~Véhicule')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenGarageTaxi()
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
                  local playerPed = PlayerPedId()
      
                  if IsPedSittingInAnyVehicle(playerPed) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                      ESX.ShowNotification('La voiture a été mis en dans le garage')
                      ESX.Game.DeleteVehicle(vehicle)
                       
                    else
                      ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                    end
                  else
                    local vehicle = ESX.Game.GetVehicleInDirection()
            
                    if DoesEntityExist(vehicle) then
                      ESX.ShowNotification('La voiture à été placer dans le garage.')
                      ESX.Game.DeleteVehicle(vehicle)
            
                    else
                      ESX.ShowNotification('Aucune voitures autours')
                    end
                  end
              end,})

              RageUI.Separator("↓ Véhicules ↓")

                RageUI.Button("Taxi", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("taxi")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 911.85, -169.89, 74.24, 152.5, true, true)
                      RageUI.CloseAll()
                    end
                })

            end)
          Wait(0)
         end
      end)
   end
end

----OUVRIR LE MENU------------

local position = {
    {x = 905.96, y = -165.77, z = 74.11} 
}

Citizen.CreateThread(function()
  local inZone = false
  local enteredZone = false
  while true do 
      inZone = false

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 25.0 then
              wait = 0
              DrawMarker(6, 905.96, -165.77, 74.11-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, 1.3, 1.3, 1.3, 255, 232, 7, 180, false, false, p19, false)  

        
            if dist <= 1.0 then
               wait = 0
               ESX.ShowHelpNotification("E", "pour intéragir")
                if IsControlJustPressed(1,51) then
                  OpenGarageTaxi()
            end
        end
    end
    end

    Citizen.Wait(wait)
    end
end
end)
