ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- MENU FUNCTION --

local open = false 
local mainMenu6 = menu.CreateMenu('', 'Intéraction Disponibles',0,0,"commonmenu", "interaction_bgd")
local Plein = false
local demi = false
local Main = true

mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
  FreezeEntityPosition(PlayerPedId(), false)

end

local Price = 100


function OpenMenuEssence()
     if open then 
         open = false
         menu.Visible(mainMenu6, false)
         return
     else
         open = true 
         menu.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            menu.IsVisible(mainMenu6,function() 
              if Main == true then
              menu.Button("Payer 100$ pour faire le plein", nil, { RightLabel = "~g~"..Price.."~g~$"}, true , {
                onSelected = function()
                 
                Plein = true

                end


              })
              

              
              menu.Button("Payer 50$ pour remplir à 50% ", nil, { RightLabel = "~g~50$"}, true , {
                onSelected = function()
                  demi = true   
                end
              })
              local case = 1
            menu.StatisticPanel(case, "Réservoir", 1)

            local case2 = 0.5
            menu.StatisticPanel(case2, "Réservoir", 2)
            end
            
            
                if Plein == true then
                  Main = false
              menu.Button("Confirmer", nil, { RightLabel = "→→"}, true , {
                onSelected = function()

                  
                  TriggerServerEvent('SYSTEM:Fuel100')
                  
                    local joueur = PlayerPedId()
                    local vehicule = GetVehiclePedIsIn(joueur)
                    local essence = 100.0
                    local price = 100
                    SetVehicleFuelLevel(vehicule, essence)
                    ESX.ShowNotification("Réservoir: "..essence.."%\nPrix: "..price.." $")
                    Main = true
                    Plein = false

              end
              })

                menu.Button("Annuler", nil, {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "→→"}, true , {
                  onSelected = function()
                     Plein = false
                     Main = true
                  end
                })
                     
            end

            if demi == true then 
              Main = false
              menu.Button("Confirmer", "~r~Si votre réservoir est à plus de 50% il va vous le descendre à 50%", { RightLabel = "→→"}, true , {
                onSelected = function()
                  TriggerServerEvent('SYSTEM:Fuel50')
                  local joueur = PlayerPedId()
                  local vehicle = GetVehiclePedIsIn(joueur)
                  local essence = 50.0
                  local price = 50
                  SetVehicleFuelLevel(vehicle, essence)
                  ESX.ShowNotification("Réservoir: "..essence.."% Prix: "..price.."$")
                  Main = true
                  demi = false

                end
              })
              menu.Button("Annuler", nil, {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "→→"}, true , {
                onSelected = function()
                   Plein = false
                   Main = true
                end
              })
            end
              
            
          
            end)
          
          Wait(0)
         end
      end)
   end
end



local position = {
  {x = 267.07, y = -1254.99, z = 28.2},
  {x = -67.74, y = -1759.47, z = 28.38},
  {x = -320.71, y = -1466.56, z = 29.6},
  {x = -717.37, y = -932.55, z = 18.05},
  {x = -2094.84, y = -320.51, z = 12.05},
  {x = 614.4, y = 264.19, z = 102.13},
  {x = 2575.92, y = 364.88, z = 107.48},
  {x = -1799.34, y = 799.32, z = 137.54},
  {x = -2558.09, y = 2328.8, z = 32.09},
  {x = 170.11, y = 6603.48, z = 30.87},
  {x = 1701.16, y = 6414.94, z = 31.7},
  {x = 1688.65, y = 4928.82, z = 41.1},
  {x = 2002.51, y = 3770.35, z = 31.2},
}

local blips = true

Citizen.CreateThread(function() -------------[Stations Essences]
  if blips == true then
      for k, v in pairs(position) do
          local blip = AddBlipForCoord(v.x, v.y, v.z)

          SetBlipSprite(blip, 415)
          SetBlipScale (blip, 0.5)
          SetBlipColour(blip, 1)
          SetBlipAsShortRange(blip, true)

          BeginTextCommandSetBlipName('STRING')
          AddTextComponentSubstringPlayerName('Stations Essences')
          EndTextCommandSetBlipName(blip)
      end
  end
end)

Citizen.CreateThread(function()
  for k, v in pairs(position) do 
  while true do

    local wait = 750

      for k, v in pairs(position) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
          if dist <= 100.0 then
              wait = 1
              DrawMarker(36, v.x, v.y, v.z, 0.0, 0.0, 0.0, -90.0,0.0,0.0, 1.1, 1.5, 1.1, 255, 255, 255, 255, false, false, p19, false)  
          end
      
          if dist <= 1.1 then
              wait = 1
              ESX.ShowHelpNotification("E", "pour faire votre plein") 
              if IsControlJustPressed(1,51) then
                  OpenMenuEssence()
              end
          end 
      end
  Citizen.Wait(wait)
  end
end
end)




    
