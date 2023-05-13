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
local mainMenu6 = RageUI.CreateMenu('', 'Interaction')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  FreezeEntityPosition(PlayerPedId(), false)
  open = false
end

function OpenArmurieArmee()
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
            
                RageUI.Button("Déposer vos armes", nil, {RightLabel = "→→"}, true , {
                onSelected = function() 
                    TriggerServerEvent("armureriepolice")
                    ESX.ShowNotification("Vous avez déposé toutes vos armes.")
                  end
                })

                RageUI.Separator("Armurerie")
                if servicearmee then
                for k,v in pairs(cfg_armee.armurie) do
                    RageUI.Button("Armement - "..v.grade, nil, { RightLabel = "→→" }, ESX.PlayerData.job.grade >= v.minimum_grade, {
                        onSelected = function()
                            for k,v in pairs(v.weapons) do
                                TriggerServerEvent("core:arme", v)
                            end
                            ESX.ShowNotification("Vous avez récuperer vos armes")
                        end,
                    })
                end
              else
                RageUI.Separator("")
                RageUI.Separator("~r~Vous n\'êtes pas en service")
                RageUI.Separator("")
              end

                end)
                Wait(0)
               end
            end)
         end
      end
      

----OUVRIR LE MENU------------

local position = {
	{x = -2350.0407714844, y = 3266.2307128906, z = 32.810764312744}
}

Citizen.CreateThread(function()
  local inZone = false
  local enteredZone = false
  while true do 
      inZone = false

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 10.0 then
            wait = 0
            DrawMarker(cfg_armee.MarkerType, -2350.0407714844,3266.2307128906,32.810764312744-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  

        
            if dist <= 1.0 then
               wait = 0
               ESX.ShowHelpNotification("E", "pour intéragir")
                if IsControlJustPressed(1,51) then
                  FreezeEntityPosition(PlayerPedId(), true)
                    OpenArmurieArmee()
            end
        end
    end
    end


    Citizen.Wait(wait)
    end
end
end)









