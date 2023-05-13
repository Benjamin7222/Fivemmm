ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'carshop', 'carshopionnaire', 'society_carshop', 'society_carshop', 'society_carshop', {type = 'public'})


ESX.RegisterServerCallback('h4ci_carshop:recuperercategorievehicule', function(source, cb)
    local catevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(catevehi, {
                name = result[i].name,
                label = result[i].label
            })
        end

        cb(catevehi)
    end)
end)

ESX.RegisterServerCallback('h4ci_carshop:recupererlistevehicule', function(source, cb, categorievehi)
    local catevehi = categorievehi
    local listevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles WHERE category = @category', {
        ['@category'] = catevehi
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(listevehi, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price
            })
        end

        cb(listevehi)
    end)
end)

ESX.RegisterServerCallback('h4ci_carshop:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('h4ci_carshop:vendrevoiturejoueur')
AddEventHandler('h4ci_carshop:vendrevoiturejoueur', function (playerId, vehicleProps, prix, voiture, client, vendeur)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_carshop', function (account)
            account.removeMoney(prix)
    end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
    {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function (rowsChanged)
    TriggerEvent('esx:customDiscordConcess', ('`%s` a vendu a `%s` une `%s` immatriculé `%s` pour `%s`'):format(vendeur, client, voiture, vehicleProps.plate, prix))
    TriggerClientEvent('esx:showNotification', xPlayer, "Tu as reçu la voiture ~y~"..vehicleProps.model.."~s~ immatriculé ~y~"..vehicleProps.plate.." pour ~y~" ..prix.. "$")
    end)
end)

RegisterServerEvent('shop:vehicule')
AddEventHandler('shop:vehicule', function(vehicleProps, prix, client, nomv)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_carshop', function (account)
        account.removeMoney(prix)
end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function(rowsChange)
        TriggerEvent('esx:customDiscordConcess', ('`%s` a acheter une `%s` immatriculé `%s` pour `%s`$'):format(client, nomv, vehicleProps.plate, prix))
        TriggerClientEvent('esx:showNotification', xPlayer, "Tu as reçu la voiture ~y~"..nomv.."~s~ immatriculé ~y~"..vehicleProps.plate.." pour ~y~" ..prix.. "$")
    end)
end)

ESX.RegisterServerCallback('h4ci_carshop:verifsouscarshop', function(source, cb, prixvoiture)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_carshop', function (account)
        if account.money >= prixvoiture then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('Open:Ads')
AddEventHandler('Open:Ads', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'carshop', 'Concessionnaire Auto', 'Le concessionnaire est désormais Ouvert !', 'CHAR_CARSITE', 8)
	end
end)

RegisterServerEvent('Close:Ads')
AddEventHandler('Close:Ads', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'carshop', 'Concessionnaire Auto', 'Le concessionnaire est désormais Fermer !', 'CHAR_CARSITE', 8)
	end
end)

RegisterServerEvent('Perso:Ads')
AddEventHandler('Perso:Ads', function(msg)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'carshop', 'Concessionnaire Auto', msg, 'CHAR_CARSITE', 8)
	end
end)

RegisterCommand('acon', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "carshop" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'carshop', 'Concessionnaire Auto', ''..msg..'', 'CHAR_CARSITE', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~y~Erreur' , 'Tu n\'est pas carshopionnaire pour faire cette commande', 'CHAR_CARSITE', 0)
    end
else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~y~Erreur' , 'Tu n\'est pas carshopionnaire pour faire cette commande', 'CHAR_CARSITE', 0)
end
end, false)