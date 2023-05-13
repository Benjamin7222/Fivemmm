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
local mainMenu6 = RageUI.CreateMenu('Armurie', 'Interaction')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  FreezeEntityPosition(PlayerPedId(), false)
  open = false
end

function OpenArmuriesheriff()
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
              
              RageUI.Separator("↓ ~y~   Déposer ses armes  ~s~↓")

              RageUI.Button("~w~Déposer ses armes", nil, {RightLabel = "→→"}, true , {
                onSelected = function() 
                    TriggerServerEvent("armureriepolice")
                    ESX.ShowNotification("Vous avez déposé toutes vos armes.")
                  end
                })

                RageUI.Separator("↓ Récupèrer un équipement ↓")
                for k,v in pairs(cfg_sheriff.armurie) do
                  print(ESX.PlayerData.job.grade )
                    RageUI.Button("Équipement ~y~"..v.grade, nil, { RightLabel = "→→" }, ESX.PlayerData.job.grade >= v.minimum_grade, {
                        onSelected = function()
                            local pPed = PlayerPedId()
                            for k,v in pairs(v.weapons) do
                              TriggerServerEvent("core:arme", v)
                            end
                            ESX.ShowNotification("Armes de service récupérer.")
                        end,
                    })
                end

                end)
                Wait(0)
               end
            end)
         end
      end
      

----OUVRIR LE MENU------------

local position = {
	{x = -444.3, y = 6013.47, z = 37.01}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sheriff' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 25.0 then
            wait = 0
            DrawMarker(6, -444.3, 6013.47, 37.01-1.0, 0.0, 0.0, 0.0, -90.0,0.0,0.0, 0.8, 0.8, 0.8, 20, 146, 0, 255, false, false, p19, false)  

        
            if dist <= 1.0 then
               wait = 0
               ESX.ShowHelpNotification("E", "pour intéragir")
                if IsControlJustPressed(1,51) then
                  FreezeEntityPosition(PlayerPedId(), true)
                  OpenArmuriesheriff()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)









