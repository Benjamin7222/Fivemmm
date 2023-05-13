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

-- Function --

function applySkinSpecificArmee(infos)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject
		if skin.sex == 0 then
			uniformObject = infos.variations.male
		else
			uniformObject = infos.variations.female
		end
		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		end

		infos.onEquip()
	end)
end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', '~b~Vestiaire')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function VestiaireArmee()
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

              
              RageUI.Separator("↓ ~b~Equipement ~s~↓")
			
              for _,infos in pairs(cfg_armee.ArmeeCloak.clothes.specials) do
                RageUI.Button(infos.label, nil, {RightLabel = ">"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                onSelected = function()
                    servicearmee = false
                    local info = 'fin'
                    --TriggerServerEvent('lsarmy:PriseEtFinservice', info)
                     applySkinSpecificArmee(infos)
                  end
                })	

                RageUI.Separator("↓ ~b~Tenues de service ~s~↓")
                for _,infos in pairs(cfg_armee.ArmeeCloak.clothes.grades) do
                  RageUI.Button(infos.label, nil, {RightLabel = ">"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                    onSelected = function()
                        servicearmee = true
                        local info = 'prise'
                        --TriggerServerEvent('lsarmy:PriseEtFinservice', info)
                        applySkinSpecificArmee(infos)
                      end
                    })

            


                  end
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
    for k in pairs(cfg_armee.Position.Vestaire) do
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local pos = cfg_armee.Position.Vestaire
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= cfg_armee.MarkerDistance then
                  wait = 0
                  DrawMarker(cfg_armee.MarkerType, pos[k].x, pos[k].y, pos[k].z-0.98, 0.0, 0.0, 0.0, -90.0,0.0,0.0, cfg_armee.MarkerSizeLargeur, cfg_armee.MarkerSizeEpaisseur, cfg_armee.MarkerSizeHauteur, cfg_armee.MarkerColorR, cfg_armee.MarkerColorG, cfg_armee.MarkerColorB, cfg_armee.MarkerOpacite, cfg_armee.MarkerSaute, true, p19, cfg_armee.MarkerTourne)  
              end

              if dist <= 1.0 then
                  wait = 0
                  ESX.ShowHelpNotification("E", "pour intéragir")
                  if IsControlJustPressed(1,51) then
                    VestiaireArmee()
                  end
              end
          end
  end


  Citizen.Wait(wait)
  end
end)