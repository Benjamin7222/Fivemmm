ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'mecano', 'mecano', 'society_mecano', 'society_mecano', 'society_mecano', {type = 'public'})

RegisterServerEvent('Ouvre:benny')
AddEventHandler('Ouvre:benny', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'RedLine Perf', 'RedLine Perf', 'Le RedLine Performance est désormais ouvert, venez faire votre custom et réparation !', 'CHAR_MECANO', 8)
	end
end)

RegisterServerEvent('Ferme:benny')
AddEventHandler('Ferme:benny', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'RedLine Perf', 'RedLine Perf', 'La RedLine Performance est désormais fermé, passez plus tard !', 'CHAR_MECANO', 8)
	end
end)

RegisterCommand('meca', function(source, args, rawCommand)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  if xPlayer.job.name == "mecano" then
      local src = source
      local msg = rawCommand:sub(5)
      local args = msg
      if player ~= false then
          local name = GetPlayerName(source)
          local xPlayers	= ESX.GetPlayers()
      for i=1, #xPlayers, 1 do
          local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'RedLine Perf', 'RedLine Perf', ''..msg..'', 'CHAR_MECANO', 0)
      end
  else
      TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_MECANO', 0)
  end
else
  TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_MECANO', 0)
end
end, false)



--COFFRE

ESX.RegisterServerCallback('benny:playerinventory', function(source, cb)
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

ESX.RegisterServerCallback('benny:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('benny:putStockItems')
AddEventHandler('benny:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Dépot\n- Coffre : Benny's \n- Quantitée ~s~: "..count.."")
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('benny:takeStockItems')
AddEventHandler('benny:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Retrait\n- Coffre : Benny's \n- Quantitée : "..count.."")
	end)
end)



-- Creation Kit 

RegisterServerEvent('benny:creationkitrepa')
AddEventHandler('benny:creationkitrepa', function(price, item, nombre) 
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, nombre) 
    TriggerClientEvent('esx:showNotification', source, "Fabrication terminer : \n-Objet :  Kit de réparation \n-Prix : "..price.."$", "", 1)
end)  

RegisterServerEvent('benny:creationkitcaro')
AddEventHandler('benny:creationkitcaro', function(price, item, nombre) 
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, nombre) 
    TriggerClientEvent('esx:showNotification', source, "Fabrication terminer : \n-Objet : Kit carroserie\n-Prix : "..price.."$", "", 1)
end) 



-- Utilisation Kit 

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('pawal:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', source, "Vous venez d'utilisé un  Kit de réparation !")   
end)

ESX.RegisterUsableItem('carokit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('pawal:onCarokit', _source)
	TriggerClientEvent('esx:showNotification', source, "Vous venez d'utilisé un  Kit de réparation Carrosserie !")    
end)

RegisterServerEvent('message:benny')
AddEventHandler('message:benny', function(PriseOuFin, message)
    local _source = source
    local _raison = PriseOuFin
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local name = xPlayer.getName(_source)


    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'mecano' then
            TriggerClientEvent('message:benny', xPlayers[i], _raison, name, message)
        end
    end
end)