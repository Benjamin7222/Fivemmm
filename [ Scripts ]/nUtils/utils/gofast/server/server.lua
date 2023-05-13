ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gofast:renfort')
AddEventHandler('gofast:renfort', function()
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Information", "GoFast en cours","Demande de renfort demandé.\nUn signal GPS vous sera vous fournis toutes les 10 secondes !", "CHAR_ABIGAIL", 7)
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Information", "GoFast en cours","L\'individus transporte plus de 50 de drogue !", "CHAR_ABIGAIL", 7)
		end
	end
end)

RegisterServerEvent('gofast:renfort2')
AddEventHandler('gofast:renfort2', function()
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Information", "GoFast en cours","Demande de renfort demandé.\nUn signal GPS vous sera vous fournis toutes les 20 secondes !", 'CHAR_ABIGAIL', 7)
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Information", "GoFast en cours","L\'individus transporte moins de 50 de drogue !", 'CHAR_ABIGAIL', 7)
		end
	end
end)

RegisterServerEvent('gofast:messagelspd')
AddEventHandler('gofast:messagelspd', function(coords)
    local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'police' then
            TriggerClientEvent('gofast:blip', xPlayers[i], coords)
        end
    end
end)

RegisterServerEvent("gofast:venteduvehicle")
AddEventHandler("gofast:venteduvehicle", function(chiffrefinal, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local prix = 5000
    local total = chiffrefinal * price
    xPlayer.addAccountMoney('dirtycash', total)
    TriggerClientEvent('esx:showAdvancedNotification', source, "GoFast", "Inconnu", "Vous avez gagné "..total.."$ grâce a la drogue transportée", "CHAR_MULTIPLAYER", 3)
    xPlayer.addAccountMoney('dirtycash', 5000)
    TriggerClientEvent('esx:showAdvancedNotification', source, "GoFast", "Inconnu", "Vous avez gagné "..prix.."$ grâce au véhicule", "CHAR_MULTIPLAYER", 3)
    local vehe = GetVehicleEngineHealth(veh) / 10
    if vehe > 50 then 
        TriggerClientEvent('esx:showAdvancedNotification', source, "GoFast", "Inconnu", "Le véhicule est en bonne état, Vous avez gagné 5000$ en plus !", "CHAR_MULTIPLAYER", 3)
        xPlayer.addAccountMoney('dirtycash', 5000)
    elseif vehe < 50 then 
        TriggerClientEvent('esx:showAdvancedNotification', source, "GoFast", "Inconnu", "Le véhicule est en moyenne état, Vous avez gagné 2500$ en plus !", "CHAR_MULTIPLAYER", 3)
        xPlayer.addAccountMoney('dirtycash', 2500)
    end
end)


ESX.RegisterServerCallback("gofast:countcops", function(source, cb)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         if xPlayer.job.name == 'police' then
              cb(true)
         else
              cb(true)
         end
    end
end)