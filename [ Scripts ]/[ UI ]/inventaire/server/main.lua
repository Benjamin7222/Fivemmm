ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterServerCallback("esx_inventoryhud:getPlayerInventory", function(source, cb, target)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if targetXPlayer ~= nil then
		cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getAccount("cash").money, dirtycash = targetXPlayer.getAccount("dirtycash").money, weapons = targetXPlayer.loadout})
	else
		cb(nil)
	end
end)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler("esx_inventoryhud:tradePlayerItem",	function(from, target, type, itemName, itemCount)
	local _source = from

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == "item_standard" then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetXPlayer.canCarryItem(itemName, itemCount) then

				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem(itemName, itemCount)
			else
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, "Vous n'avez pas assez de place sur vous.")
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "La personne n'a pas assez de place.")
			end
		end
	elseif type == "item_money" then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemCount)
			targetXPlayer.addAccountMoney(itemCount)
		end
	elseif type == "item_account" then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney(itemName, itemCount)
		end
	elseif type == "item_weapon" then
		if sourceXPlayer.hasWeapon(itemName) then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end
end)

RegisterNetEvent("sPolice:OpenPlayerInventory")
AddEventHandler("sPolice:OpenPlayerInventory", function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" or xPlayer.job.name == "sheriff" then
		local targetxPlayer = ESX.GetPlayerFromId(target)
		if targetxPlayer then
			TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetxPlayer.name)
		end
	end
end)

RegisterNetEvent("sStaff:OpenPlayerInventory")
AddEventHandler("sStaff:OpenPlayerInventory", function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() ~= "user" then
		local targetxPlayer = ESX.GetPlayerFromId(target)
		if targetxPlayer then
			TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetxPlayer.name)
		end
	else
		exports.sCore:banPlayerAC(xPlayer.source, {
            name = "changestateuser",
            title = "Anticheat : Try to access inventory",
            description = "Anticheat : Try to access inventory"
        })
        return
	end
end)

