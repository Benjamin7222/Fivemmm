TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'gouvernement', 'Gouvernement', 'society_gouvernement', 'society_gouvernement', 'society_gouvernement', {type = 'public'})

RegisterServerEvent('gouv:drag')
AddEventHandler('gouv:drag', function(target)
  local _source = source
  TriggerClientEvent('gouv:drag', target, _source)
end)

RegisterServerEvent('gouv:putInVehicle')
AddEventHandler('gouv:putInVehicle', function(target)
  TriggerClientEvent('gouv:putInVehicle', target)
end)

RegisterServerEvent('gouv:OutVehicle')
AddEventHandler('gouv:OutVehicle', function(target)
    TriggerClientEvent('gouv:OutVehicle', target)
end)


RegisterNetEvent('gouv:confiscatePlayerItem')
AddEventHandler('gouv:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem(itemName, amount)
            TriggerClientEvent("esx:showNotification", source, "Vous avez pris "..amount..' '..sourceItem.label..".")
            TriggerClientEvent("esx:showNotification", target, "Il t'a été pris "..amount..' '..sourceItem.label..".")
        else
			--TriggerClientEvent("esx:showNotification", source, "quantité invalide")
		end
        
    if itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney   (itemName, amount)
        
        TriggerClientEvent("esx:showNotification", source, "Vous avez pris "..amount.."€ Argent sale.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été pris "..amount.."€ Argent sale.")
        
    elseif itemType == 'item_weapon' then
        if amount == nil then amount = 0 end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon   (itemName, amount)

        TriggerClientEvent("esx:showNotification", source, "Vous avez pris "..ESX.GetWeaponLabel(itemName).." avec "..amount.." munitions.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été pris "..ESX.GetWeaponLabel(itemName).." avec "..amount.." munitions.")
    end
end)


ESX.RegisterServerCallback('gouv:getOtherPlayerData', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent("esx:showNotification", target, "Tu es entrain de te faire fouillé...")

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }

        cb(data)
    end
end)

RegisterServerEvent('Ouvre:gouvernement')
AddEventHandler('Ouvre:gouvernement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Gouvernement', 'Gouvernement', 'Le Gouvernement est désormais Ouvert!', 'CHAR_ABIGAIL', 8)
	end
end)

RegisterServerEvent('Ferme:gouvernement')
AddEventHandler('Ferme:gouvernement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Gouvernement', 'Gouvernement', 'Le Gouvernement est désormais Fermer!', 'CHAR_ABIGAIL', 8)
	end
end)

RegisterCommand('gouv', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "gouvernement" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Gouvernement', 'Gouvernement', ''..msg..'', 'CHAR_ABIGAIL', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_ABIGAIL', 0)
    end
else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_ABIGAIL', 0)
end
end, false)

ESX.RegisterServerCallback('gouv:playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end

	cb(all_items)

	
end)


ESX.RegisterServerCallback('gouv:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('gouv:putStockItems')
AddEventHandler('gouv:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Dépot\n- Item : "..itemName.."\n- Quantitée : "..count.."")
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('gouv:takeStockItems')
AddEventHandler('gouv:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Retrait\n- Item : "..itemName.."\n- Quantitée : "..count.."")
	end)
end)

RegisterServerEvent('gouv:depositMoney')
AddEventHandler('gouv:depositMoney', function(society, amount)

	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getAccount("cash").money
	local src = source
  
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
	  if money >= tonumber(amount) then
		xPlayer.removeAccountMoney('cash', amount)
		  account.addMoney(amount)
		  TriggerClientEvent("esx:showNotification", src, "- Déposé \n- Somme : "..amount.."$")
	  else
		  TriggerClientEvent("esx:showNotification", src, "- Erreur \n- Pas assez d'argent")
	  end
	end)
	
end)


RegisterNetEvent('vestaiaire:déposer')
AddEventHandler('vestaiaire:déposer', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	for k,v in pairs(cfg_gouv.serviceWeapons) do
		xPlayer.removeWeapon(v.Name)
	end
	TriggerClientEvent('esx:showNotification', source, "Vous avez posé tous vos armes")
end)

RegisterNetEvent('vestaiaire:equipement')
AddEventHandler('vestaiaire:equipement', function(item,price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	for k,v in pairs(cfg_gouv.serviceWeapons) do
	xPlayer.addWeapon(v.Name, cfg_gouv.Nombredeballe)
	--xPlayer.addInventoryItem(v.Name, 1)
	end
end)
