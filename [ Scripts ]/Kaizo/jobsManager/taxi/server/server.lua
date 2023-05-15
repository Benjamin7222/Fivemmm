TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'taxi', 'taxi', 'society_taxi', 'society_taxi', 'society_taxi', {type = 'public'})

RegisterServerEvent('Ouvre:taxi')
AddEventHandler('Ouvre:taxi', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', 'Taxi', 'Le taxi est désormais Ouvert!', 'CHAR_FLOYD', 8)
	end
end)

RegisterServerEvent('Ferme:taxi')
AddEventHandler('Ferme:taxi', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', 'Taxi', 'Le taxi est désormais Fermer!', 'CHAR_FLOYD', 8)
	end
end)


-- Mission 

RegisterNetEvent("taxi:FinishMission")
AddEventHandler("taxi:FinishMission", function(bonus)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then
        TriggerEvent("AC:Violations", 24, "Event: taxi:FinishMission job: "..xPlayer.job.name, source)
        return
    end

    local gain = math.random(70,120) + bonus
    xPlayer.addAccountMoney('bank', gain)

    TriggerClientEvent("esx:showNotification", source, "Vous avez terminé votre mission.\nGain: "..gain.."$", "CHAR_FLOYD", 5000, "danger")
end)