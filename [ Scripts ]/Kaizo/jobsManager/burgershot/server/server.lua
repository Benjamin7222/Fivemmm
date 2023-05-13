ESX = nil

 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
 TriggerEvent('esx_phone:registerNumber', 'burgershot', 'Client Mécano', true, true)
 TriggerEvent('esx_society:registerSociety', 'burgershot', 'burgershot', 'society_burgershot', 'society_burgershot', 'society_burgershot', {type = 'private'})

RegisterServerEvent('Ouvre:burgershot')
AddEventHandler('Ouvre:burgershot', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Burgershot', 'Burgershot', 'Le Burgershot est ouvert !', 'CHAR_PAKAT', 8)
	end
end)

RegisterServerEvent('Ferme:burgershot')
AddEventHandler('Ferme:burgershot', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Burgershot', 'Burgershot', 'Le Burgershot vien de fermer !', 'CHAR_PAKAT', 8)
	end
end)

RegisterServerEvent('Recru:burgershot')
AddEventHandler('Recru:burgershot', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Burgershot', 'Burgershot', 'Recrutement en cours, rendez-vous au Burgershot', 'CHAR_PAKAT', 8)
	end
end)

RegisterServerEvent('Burgershot:Farmviande')
AddEventHandler('Burgershot:Farmviande', function(type, reason)
	local item = "viande"
    local limiteitem = 50
	local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

	local xPlayers	= ESX.GetPlayers()
    if type == 1 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 1)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end    
    elseif type == 2 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 5)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end       
    elseif type == 3 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 10)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end   
    end
end)

RegisterServerEvent('Burgershot:Farmpain')
AddEventHandler('Burgershot:Farmpain', function(type, reason)
	local item = "painburger"
	local source = source
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

	local xPlayers	= ESX.GetPlayers()
    if type == 1 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 1)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end    
    elseif type == 2 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 5)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end       
    elseif type == 3 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 10)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end   
    end
end)


RegisterServerEvent('Burgershot:CreationSoda')
AddEventHandler('Burgershot:CreationSoda', function(type, reason)
	local item = "sodaburgershot"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
	local source = source

	local xPlayers	= ESX.GetPlayers()
    if type == 1 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 1)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end    
    elseif type == 2 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 2)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end       
    elseif type == 3 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 5)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end   
    end
end)

RegisterCommand('shot', function(source, args, rawCommand)
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "burgershot" then
      local src = source
      local msg = rawCommand:sub(5)
      local args = msg
      if player ~= false then
          local name = GetPlayerName(source)
          local xPlayers	= ESX.GetPlayers()
      for i=1, #xPlayers, 1 do
          local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Burgershot', 'Burgershot', ''..msg..'', 'CHAR_PAKAT', 0)
      end
  else
      TriggerClientEvent('esx:showAdvancedNotification', source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_PAKAT', 0)
  end
else
  TriggerClientEvent('esx:showAdvancedNotification', source, 'Avertisement', 'Erreur' , 'Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_PAKAT', 0)
end
end, false)



--COFFRE

ESX.RegisterServerCallback('burgershot:playerinventory', function(source, cb)
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

ESX.RegisterServerCallback('burgershot:getStockItems', function(source, cb)
	local all_items = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('burgershot:putStockItems')
AddEventHandler('burgershot:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Dépot\n- Coffre : BurgerShot \n- Quantitée : "..count.."")
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('burgershot:takeStockItems')
AddEventHandler('burgershot:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Retrait\n- Coffre : BurgerShot \n- Quantitée : "..count.."")
	end)
end)

RegisterServerEvent('message:burgershot')
AddEventHandler('message:burgershot', function(PriseOuFin, message)
    local source = source
    local _raison = PriseOuFin
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    local name = xPlayer.getName(source)


    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'mechanic' then
            TriggerClientEvent('message:burgershot', xPlayers[i], _raison, name, message)
        end
    end
end)

RegisterServerEvent('pawal:menu')
AddEventHandler('pawal:menu', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local menu = xPlayer.getInventoryItem('menuburgershot').count
    local frites = xPlayer.getInventoryItem('frites').count
	local hamburger = xPlayer.getInventoryItem('hamburger').count
	local boisson = xPlayer.getInventoryItem('sodaburgershot').count

    if menu > 50 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez trop de menu sur vous...')
    elseif frites < 1 and boisson < 1 and hamburger < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Il vous manque de la matière première !')
    else
		TriggerClientEvent('esx:showNotification', source, 'Création du menu terminer !')
        xPlayer.removeInventoryItem('sodaburgershot', 1)
		xPlayer.removeInventoryItem('frites', 1)
		xPlayer.removeInventoryItem('hamburger', 1)
        xPlayer.addInventoryItem('menuburgershot', 1)    
    end
end)

RegisterServerEvent('pawal:menuluxe')
AddEventHandler('pawal:menuluxe', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local menu = xPlayer.getInventoryItem('menuburgershotluxe').count
    local frites = xPlayer.getInventoryItem('frites').count
	local hamburger = xPlayer.getInventoryItem('hamburger').count
	local viande = xPlayer.getInventoryItem('sodaburgershot').count

    if menu > 50 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez trop de menu sur vous...')
    elseif frites < 2 and viande < 2 and hamburger < 2 then
        TriggerClientEvent('esx:showNotification', source, 'Il vous manque de la matière première !')
    else
		TriggerClientEvent('esx:showNotification', source, 'Création du menu terminer !')
        xPlayer.removeInventoryItem('sodaburgershot', 2)
		xPlayer.removeInventoryItem('frites', 2)
		xPlayer.removeInventoryItem('hamburger', 2)
        xPlayer.addInventoryItem('menuburgershotluxe', 1)    
    end
end)






RegisterServerEvent('pawal:fritescreation')
AddEventHandler('pawal:fritescreation', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local base = xPlayer.getInventoryItem('patate').count
    local frites = xPlayer.getInventoryItem('frites').count
    if frites > 50 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez trop de frites sur vous...')
    elseif base < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Il vous manque de la matière première !')
    else
		TriggerClientEvent('esx:showNotification', source, 'Création des frites terminer !')
		xPlayer.removeInventoryItem('patate', 1)
        xPlayer.addInventoryItem('frites', 1)    
    end
end)


RegisterServerEvent('pawal:steakcreation')
AddEventHandler('pawal:steakcreation', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local base = xPlayer.getInventoryItem('viande').count
    local frites = xPlayer.getInventoryItem('steak').count
    if frites > 50 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez trop de steaks sur vous...')
    elseif base < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Il vous manque de la matière première !')
    else
		TriggerClientEvent('esx:showNotification', source, 'Création des steaks terminer !')
		xPlayer.removeInventoryItem('viande', 1)
        xPlayer.addInventoryItem('steak', 1)    
    end
end)

RegisterServerEvent('pawal:hamburgercreation')
AddEventHandler('pawal:hamburgercreation', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local steak = xPlayer.getInventoryItem('steak').count
	local pain = xPlayer.getInventoryItem('painburger').count
    local hamburger = xPlayer.getInventoryItem('hamburger').count
    if hamburger > 50 then
        TriggerClientEvent('esx:showNotification', source, 'Vous avez trop de steaks sur vous...')
    elseif steak < 1 or pain < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Il vous manque de la matière première !')
    else
		TriggerClientEvent('esx:showNotification', source, 'Création des steaks terminer !')
		xPlayer.removeInventoryItem('steak', 1)
		xPlayer.removeInventoryItem('painburger', 1)
        xPlayer.addInventoryItem('hamburger', 1)    
    end
end)



RegisterServerEvent('Burgershot:Farmfrites')
AddEventHandler('Burgershot:Farmfrites', function(type, reason)
	local item = "patate"
	local source = source
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

	local xPlayers	= ESX.GetPlayers()
    if type == 1 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 1)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end    
    elseif type == 2 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 5)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end       
    elseif type == 3 then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Vous n\'avez plus de place dans votre inventaire !")
		else
			Citizen.Wait(4200)
			xPlayer.addInventoryItem(item, 10)
			TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		end   
    end
end)


RegisterServerEvent('burgershot:ventehamburger')
AddEventHandler('burgershot:ventehamburger', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local hamburger = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "hamburger" then
			hamburger = item.count
		end
	end
    
    if hamburger > 0 then
        xPlayer.removeInventoryItem('hamburger', 1)
        xPlayer.addMoney(10)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous venez de vendre x1 hamburger pour 10$')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez plus d\'hamburger sur vous !')
    end
end)

RegisterServerEvent('burgershot:ventesoda')
AddEventHandler('burgershot:ventesoda', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local soda = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "sodaburgershot" then
			soda = item.count
		end
	end
    
    if soda > 0 then
        xPlayer.removeInventoryItem('sodaburgershot', 1)
        xPlayer.addMoney(9)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous venez de vendre x1 soda-shot pour 9$')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez plus de soda-shot sur vous !')
    end
end)

RegisterServerEvent('burgershot:ventemenustandard')
AddEventHandler('burgershot:ventemenustandard', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local menustandard = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "menuburgershot" then
			menustandard = item.count
		end
	end
    
    if menustandard > 0 then
        xPlayer.removeInventoryItem('menuburgershot', 1)
        xPlayer.addMoney(15)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous venez de vendre x1 menu WhiteBurger pour 15$')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez plus de menu WhiteBurger sur vous !')
    end
end)

RegisterServerEvent('burgershot:ventemenuprestige')
AddEventHandler('burgershot:ventemenuprestige', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local menuprestige = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "menuburgershotluxe" then
			menuprestige = item.count
		end
	end
    
    if menuprestige > 0 then
        xPlayer.removeInventoryItem('menuburgershotluxe', 1)
        xPlayer.addMoney(25)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous venez de vendre x1 menu Burger Prestige pour 25$')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez plus de menu Burger Prestige sur vous !')
    end
end)

RegisterServerEvent('burgershot:ventefrites')
AddEventHandler('burgershot:ventefrites', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local frites = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "frites" then
			frites = item.count
		end
	end
    
    if frites > 0 then
        xPlayer.removeInventoryItem('frites', 1)
        xPlayer.addMoney(7)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous venez de vendre x1 frites pour 7$')
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez plus de frites sur vous !')
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------