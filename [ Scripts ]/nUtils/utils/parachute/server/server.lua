ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('kaizo_parachute:buy', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source) 
	if xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
        xPlayer.addWeapon('GADGET_PARACHUTE', 42)
		TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter un parachute pour 100$")
		cb(true)
		Wait(1000)
		xPlayer.removeWeapon('GADGET_PARACHUTE')
	else
		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent")
		cb(false)
	end
end)