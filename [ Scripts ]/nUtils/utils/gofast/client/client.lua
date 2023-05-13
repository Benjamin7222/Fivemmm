Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

cangofast = {}

local mainMenu = menu.CreateMenu("", "Interaction")
local droguesprise,gofastlance,dejalancee = true,false,false
local listdrugs = 1
local open = false

mainMenu.Closed = function() 
	open,droguesprise,gofastlance,dejalancee = false,true,false,false
	ESX.ShowNotification("Le GoFast a été annulé")
end

function Gofast()
    if not open then open = true menu.Visible(mainMenu, true)
        CreateThread(function()
            while open do 
				menu.IsVisible(mainMenu, function()
					if droguesprise then
						if ConfigGoFast.ActiverSeparator then
							menu.Separator(ConfigGoFast.Couleur2.."↓ "..ConfigGoFast.Separator.." "..ConfigGoFast.Couleur2.."↓")
						end
						menu.List("Drogues à embarquer", {ConfigGoFast.Drogue.n1, ConfigGoFast.Drogue.n2, ConfigGoFast.Drogue.n3, ConfigGoFast.Drogue.n4}, listdrugs, nil, {}, true, {
							onListChange = function(list) listdrugs = list end,
							onSelected = function(list)
								if list == 1 then
									local montantweed = KeyboardInput("Montant de "..ConfigGoFast.Drogue.n1.." que vous souhaitez prendre ", "", nil)
									chiffrefinal = tonumber(montantweed)
									if chiffrefinal then
										price = 50
										droguesprise = false
										gofastlance = true
										ESX.ShowNotification(ConfigGoFast.Couleur2.."Vous avez mit "..chiffrefinal.." "..ConfigGoFast.Couleur2.."de "..ConfigGoFast.Drogue.n1.." "..ConfigGoFast.Couleur2.."dans le coffre")
									else
										ESX.ShowNotification(ConfigGoFast.Couleur1.."Vous devez spécifier un montant")
									end
								elseif list == 2 then
									local montantcoke = KeyboardInput("Montant de "..ConfigGoFast.Drogue.n2.." que vous souhaitez prendre ", "", nil)
									chiffrefinal = tonumber(montantcoke)
									if chiffrefinal then
										price = 100
										droguesprise = false
										gofastlance = true
										ESX.ShowNotification("Vous avez mit "..chiffrefinal.." de "..ConfigGoFast.Drogue.n2.." "..ConfigGoFast.Couleur2.." dans le coffre")
									else
										ESX.ShowNotification("Vous devez spécifier un montant")
									end
								elseif list == 3 then
									local montantopium = KeyboardInput("Montant de "..ConfigGoFast.Drogue.n3.." que vous souhaitez prendre ", "", nil)
									chiffrefinal = tonumber(montantopium)
									if chiffrefinal then
										price = 150
										droguesprise = false
										gofastlance = true
										ESX.ShowNotification("Vous avez mit "..chiffrefinal.." de "..ConfigGoFast.Drogue.n3.." dans le coffre")
									else
										ESX.ShowNotification(ConfigGoFast.Couleur1.."Vous devez spécifier un montant")
									end
								elseif list == 4 then
									local montantmeth = KeyboardInput("Montant de "..ConfigGoFast.Drogue.n4.." que vous souhaitez prendre ", "", nil)
									chiffrefinal = tonumber(montantmeth)
									if chiffrefinal then
										price = 200
										droguesprise = false
										gofastlance = true
										ESX.ShowNotification(ConfigGoFast.Couleur2.."Vous avez mit "..chiffrefinal.." de "..ConfigGoFast.Drogue.n4.." dans le coffre")
									else
										ESX.ShowNotification(ConfigGoFast.Couleur1.."Vous devez spécifier un montant")
									end
								end
							end
						})
					else
						menu.Button("Drogues à embarquer", ConfigGoFast.Couleur1.."Vous avez déjà selectionné un montant", {}, false, {})
					end
					if gofastlance then
						if ESX.Game.IsSpawnPointClear(vector3(90.52, -2214.69, 6.04), 2.0) then
							menu.Button("Lancer le GoFast", "Nombre de Gofast disponible : ~r~1", {RightLabel = "→"}, true, {
								onSelected = function()
									menu.CloseAll()
									open = false
									dejalancee = true
									gofastlance = false
									ESX.ShowNotification("C'est parti ! Fonce à l'arrivée")
									SpawnVehGofast(chiffrefinal)
									Pointdevente()
									Wait(10 * 2000)
									ESX.ShowAdvancedNotification("Complice", ConfigGoFast.Couleur1.."Message du Complice", "Dépêche toi ! Une taupe t'as balancé aux poulets ! Ils ont ton signal GPS !", "CHAR_MP_ROBERTO", 7)
								end
							})
						else
							menu.Button("Lancer le GoFast", ConfigGoFast.Couleur1.."La sortie du véhicule est bloquée", {}, false, {})
						end
					else
						menu.Button("Lancer le GoFast", ConfigGoFast.Couleur1.."Vous devez d'abord prendre de la drogue", {}, false, {})
					end
				end)
         	Wait(0)
        	end
     	end)
  	end
end

RegisterNetEvent('gofast:blip')
AddEventHandler('gofast:blip', function(coords)
    CreateThread(function()
        if not (coords == nil) then			
			local blip = AddBlipForCoord(coords)
			SetBlipSprite(blip, 161)
			SetBlipScale(blip, 0.8)
			SetBlipColour(blip, 1)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("GOFAST")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip, true)
			PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
			SetTimeout(20000, function()
				RemoveBlip(blip)	
			end)
		else
			RemoveBlip(blip)
		end
    end)
end)


function load()
	ESX.TriggerServerCallback("gofast:countcops", function(cb)
		cangofast = cb
		Wait(10 * 10000)
	end)
end

function Pointdevente()
	local list = {ConfigGoFast.PosVente1, ConfigGoFast.PosVente2, ConfigGoFast.PosVente3} 
	local pointvente = list[math.random(1,3)]
	if pointvente == ConfigGoFast.PosVente1 then
		SetNewWaypoint(-112.66, 6367.27, 31.47)	
	elseif pointvente == ConfigGoFast.PosVente2  then
		SetNewWaypoint(1466.92, 6554.37, 14.0)
	elseif pointvente == ConfigGoFast.PosVente3  then
		SetNewWaypoint(1300.39, 4319.85, 38.2)
	else 
		ESX.ShowNotification(ConfigGoFast.Couleur1.."Erreur non spécifiée")
	end
end

Citizen.CreateThread(function()
    while true do
        local wait = 900
		for k,v in pairs(ConfigGoFast.PosMenu) do
			load()
            local coords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
			if dist <= 1.5 then 
				wait = 0
				if cangofast then
					if not dejalancee then
						ESX.ShowHelpNotification("E", "Pour faire un GoFast")
						if IsControlJustPressed(1,51) then 
							Gofast()
						end
					else
						ESX.ShowHelpNotification("Aucun GoFast disponible")
					end
				else
					ESX.ShowHelpNotification("Aucun Policier actuellement présent en ville.")
				end
			end
        end
        for k,v in pairs(ConfigGoFast.PosVente1) do
            if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                local coords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
                if dist <= 10.0 then
                    wait = 0
                    DrawMarker(ConfigGoFast.MarkVente, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, ConfigGoFast.Color.R, ConfigGoFast.Color.G, ConfigGoFast.Color.B, ConfigGoFast.Color.A, false, false, p19, true)
                    if dist <= 3.0 then
                        wait = 0
                        ESX.ShowHelpNotification("E", "Pour vendre le véhicule")
                        if IsControlJustPressed(1,51) then
							time = 1
							local veh = GetVehiclePedIsIn(ped, false)
							Message(veh, time)
							Wait(500)
							FinDeGoFast(chiffrefinal, price)
                        end
                    end
                end
            end
        end
		for k,v in pairs(ConfigGoFast.PosVente2) do
            if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                local coords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
                if dist <= 10.0 then
                    wait = 0
                    DrawMarker(ConfigGoFast.MarkVente, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, ConfigGoFast.Color.R, ConfigGoFast.Color.G, ConfigGoFast.Color.B, ConfigGoFast.Color.A, false, false, p19, true)
                    if dist <= 3.0 then
                        wait = 0
                        ESX.ShowHelpNotification("E", "Pour vendre le véhicule")
                        if IsControlJustPressed(1,51) then
							time = 1
							local veh = GetVehiclePedIsIn(ped, false)
							Message(veh, time)
							Wait(500)
							FinDeGoFast(chiffrefinal, price)
                        end
                    end
                end
            end
        end
		for k,v in pairs(ConfigGoFast.PosVente3) do
            if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                local coords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
                if dist <= 10.0 then
                    wait = 0
                    DrawMarker(ConfigGoFast.MarkVente, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, ConfigGoFast.Color.R, ConfigGoFast.Color.G, ConfigGoFast.Color.B, ConfigGoFast.Color.A, false, false, p19, true)
                    if dist <= 3.0 then
                        wait = 0
                        ESX.ShowHelpNotification("~INPUT_TALK~ pour vendre le véhicule")
                        if IsControlJustPressed(1,51) then
							time = 1
							local veh = GetVehiclePedIsIn(ped, false)
							Message(veh, time)
							Wait(500)
							FinDeGoFast(chiffrefinal, price)
                        end
                    end
                end
            end
        end
	Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
	if ConfigGoFast.ActiverPed then
		local hash = GetHashKey(ConfigGoFast.NomPed)
		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Wait(20)
		end
		ped = CreatePed("PED_TYPE_CIVFEMALE", ConfigGoFast.NomPed, ConfigGoFast.PedPosX, ConfigGoFast.PedPosY, ConfigGoFast.PedPosZ-1, ConfigGoFast.PedPosH, false, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
	end
end)

function SpawnVehGofast(chiffrefinal)
	local list = {"xa21", "elegy", "neon", "visione", "t20"}
	local index = list[math.random(1,5)]
	local veh = GetHashKey(index)
	ESX.Game.SpawnVehicle(veh, ConfigGoFast.PosVeh, ConfigGoFast.HashVeh, function(veh)
		SwitchInPlayer(GetPlayerPed(-1))
		SetVehicleNumberPlateText(veh, "GOFAST")
		SetVehicleEnginePowerMultiplier(veh, 2.0 * 20.0)
		SetModelAsNoLongerNeeded(veh)
		SetVehicleAsNoLongerNeeded(veh)		
		TaskEnterVehicle(GetPlayerPed(-1), veh, 1000, -1, 1.0, 1, 0)
		if chiffrefinal > 50 then
			TriggerServerEvent('gofast:renfort') 
			time = 10000
		else	
			TriggerServerEvent('gofast:renfort2')
			time = 20000
		end
		Message(veh, time)
	end)
end

function Message(veh, time)	
	value = not value
	while value do
		Wait(time)
		local coords = GetEntityCoords(veh)
		TriggerServerEvent("gofast:messagelspd", coords)
	end
end

function FinDeGoFast(chiffrefinal, price)
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false )
	local plate = GetVehicleNumberPlateText(vehicle)
	if plate == " GOFAST " then
		ESX.Game.DeleteVehicle(vehicle)
		ESX.ShowAdvancedNotification("GoFast", ConfigGoFast.Couleur2.."Inconnu", "Vehicule reçu ! Tu recevra bientot l'argent !", "CHAR_MULTIPLAYER", 7)
		Wait(10 * 2000)
		TriggerServerEvent("gofast:venteduvehicle", chiffrefinal, price)
		Wait(10)
		gofastlance = false
		chiffrefinal = 0
		local playerPed = GetPlayerPed(-1)
		Citizen.Wait(10 * 60000)
		dejalancee = false
	else
		ESX.ShowAdvancedNotification("GoFast", ConfigGoFast.Couleur2.."Inconnu", "Tu pense m'avoir comme ça ? Dépêche toi avant que j'appelle les flics !", "CHAR_MULTIPLAYER", 7)
	end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry.. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then local result = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false return result
    else Citizen.Wait(500) blockinput = false return nil end
end