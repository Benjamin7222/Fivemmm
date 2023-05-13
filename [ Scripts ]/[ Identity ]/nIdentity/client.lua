ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RMenu.Add('example', 'main', RageUI.CreateMenu("", "Interaction"))
RMenu.Add('example', 'chargeur', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "", "Interaction"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Carte d'identité", "Acheter votre carte d'identité", {RightLabel = "~g~100$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('ozne:achetersacarte')
                      end
                end)


        end, function()
        end)

                RageUI.IsVisible(RMenu:Get('example', 'couteau'), true, true, true, function()

                        
            end, function()
                
            end, 1)
    
            Citizen.Wait(0)
        end
    end)


    local position = {
        {x =  -1033.18, y = -2734.99, z = 20.17 }
    } 
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then
                    ESX.ShowHelpNotification("E", "Acheter votre carte d'identité")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)

     Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_cop_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20) 
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_cop_01", -1033.18, -2734.99, 19.15, 125.97, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES")
end)

local v1 = vector3(-1033.18, -2734.99, 20.17)

local distance = 10