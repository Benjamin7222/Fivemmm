ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('FuelKaizo:Fuel100')
AddEventHandler('FuelKaizo:Fuel100', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('cash').money
	xPlayer.removeAccountMoney('cash', 100)

end)

RegisterNetEvent('FuelKaizo:Fuel50')
AddEventHandler('FuelKaizo:Fuel50', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('cash').money
	xPlayer.removeAccountMoney('cash', 50) 

end)