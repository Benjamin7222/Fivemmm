local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('rz-core:blanchiement')
AddEventHandler('rz-core:blanchiement', function(argent)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	--local taxe = 0.60    -- Le blanchisseur prend 35% (1-0.65 = 0.35)
	local coords = GetEntityCoords(GetPlayerPed(source))
	blanchi = vector3(1240.2126464844, -3053.5283203125, 14.297695159912)
	ZoneSize = 5.0

	argent = ESX.Math.Round(tonumber(argent))
	--pourcentage = argent * taxe
	--Total = ESX.Math.Round(tonumber(pourcentage))

	if #(coords - blanchi) < ZoneSize / 2 then

		if argent > 0 and xPlayer.getAccount('dirtycash').money >= argent then
			xPlayer.removeAccountMoney('dirtycash', argent)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', 'Joan', 'Patiente 10 secondes', 'CHAR_MP_ROBERTO', 8)
			Citizen.Wait(10000)
		
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', 'Joan', 'Tu as reçu ' .. ESX.Math.GroupDigits(argent) .. '$ ', 'CHAR_MP_ROBERTO', 8)
			xPlayer.addAccountMoney('cash', argent)
		else
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', 'Joan', 'Montant invalide', 'CHAR_MP_ROBERTO', 8)
		end
	end
end)