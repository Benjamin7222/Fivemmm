Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

local mainMenu = menu.CreateMenu("", "Interaction")

function OpenMenu()
     if open then 
         open = false
         menu.Visible(mainMenu, false)
         return
     else
         open = true 
         menu.Visible(mainMenu, true)
         CreateThread(function()
         while open do 


            menu.IsVisible(mainMenu,function() 

                menu.Separator("Boutique")

				menu.Button("Téléphone", nil, {RightLabel = "300$"}, true , {
					onSelected = function()
						TriggerServerEvent('kaizoshop:BuyPhone')
					end
				})

                menu.Button("Radio", nil, {RightLabel = "500$"}, true , {
					onSelected = function()
						TriggerServerEvent('kaizoshop:BuyRadio')
					end
				})

            end)
          Wait(0)
         end
      end)
   end
end

local position = {
	{x = 149.79, y = -232.76, z = 54.42}
}  

Citizen.CreateThread(function()
    while true do
        NearZone = false

        for k,v in pairs(position) do

				local interval = 1
            	local pos = GetEntityCoords(GetPlayerPed(-1), false)
            	local dest = vector3(v.x, v.y, v.z)
            	local distance = GetDistanceBetweenCoords(pos, dest, true)
            	if distance > 2 then
                	interval = 1
            	else
                	interval = 1

                	local dist = Vdist(pos.x, pos.y, pos.z, position[k].x, position[k].y, position[k].z)
                	NearZone = true 

                	if distance < 3 then
                    	if not InAction then 
						Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour parler avec le vendeur", 0) 
                    end
                    if IsControlJustReleased(1,51) then
                        OpenMenu()
                    end
                end
                break
            end
        end
        if not NearZone then 
            Wait(500)
        else
            Wait(1)
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_bankman")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "ig_bankman", 148.9, -234.85, 54.42, 326.51, false, true) 
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end)

local blips = {
    {title="Apple Store", colour=73, id=459, x = 154.41, y = -222.27, z = 59.8}
}

Citizen.CreateThread(function()

for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.8)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)
