ESX = nil
lastRob = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}
discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1054469953077661706/ZmDIhthPx_MXhTnbshU9tZmB0h7U5w2kVICd_OA1XBxv1Ue6H8QOuomRRz1PQVaX2qAs',
    ['name'] = 'rm_fleecaheist',
    ['image'] = 'https://cdn.discordapp.com/avatars/869260464775921675/dea34d25f883049a798a241c8d94020c.png?size=1024'
}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

ESX.RegisterServerCallback('fleecaheist:server:checkPoliceCount', function(source, cb)
    local src = source
    local xPlayers = ESX.GetPlayers()
    local policeCount = 0

    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer['job']['name'] == 'police' then
            policeCount = policeCount + 1
        end
    end

    if policeCount >= Config['FleecaMain']['requiredPoliceCount'] then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['need_police'])
    end
end)

ESX.RegisterServerCallback('fleecaheist:server:checkTime', function(source, cb, index)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastRob[index]) < Config['FleecaHeist'][index]['nextRob'] and lastRob[index] ~= 0 then
        local seconds = Config['FleecaHeist'][index]['nextRob'] - (os.time() - lastRob[index])
        TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['wait_nextheist'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
        cb(false)
    else
        lastRob[index] = os.time()
        cb(true)
    end
end)

ESX.RegisterServerCallback('fleecaheist:server:hasItem', function(source, cb, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerItem = xPlayer.getInventoryItem(item)

    if xPlayer and xPlayerItem ~= nil then
        if xPlayerItem.count >= 1 then
            cb(true, xPlayerItem.label)
        else
            cb(false, playerItem.label)
        end
    else
        print('[rm_fleecaheist] you need add required items to server database')
    end
end)

RegisterNetEvent('fleecaheist:server:policeAlert')
AddEventHandler('fleecaheist:server:policeAlert', function(coords)
    local xPlayers = ESX.GetPlayers()
    
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer['job']['name'] == 'police' then
            TriggerClientEvent('fleecaheist:client:policeAlert', xPlayers[i], coords)
        end
    end
end)

RegisterServerEvent('fleecaheist:server:rewardItem')
AddEventHandler('fleecaheist:server:rewardItem', function(reward, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        if reward.item ~= nil then 
            if count ~= nil then
                if xPlayer.canCarryItem(reward.item, count) then
                    xPlayer.addInventoryItem(reward.item, count)
                else
                    TriggerClientEvent('esx:showAdvancedNotification', src, "Mehmet", "~r~Inventaire","Tu n'as plus de place sur toi !", 'CHAR_MANUEL', 7)
                end
            else
                if xPlayer.canCarryItem(reward.item, reward.count) then
                    xPlayer.addInventoryItem(reward.item, reward.count)
                else
                    TriggerClientEvent('esx:showAdvancedNotification', src, "Mehmet", "~r~Inventaire","Tu n'as plus de place sur toi !", 'CHAR_MANUEL', 7)
                end
            end
        else
            if count ~= nil then
                xPlayer.addAccountMoney('dirtycash', count)
            else
                xPlayer.addAccountMoney('dirtycash', reward.count)
            end
        end
    end
end)

RegisterServerEvent('fleecaheist:server:sellRewardItems')
AddEventHandler('fleecaheist:server:sellRewardItems', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if player then
        local totalMoney = 0
        local rewardItems = Config['FleecaMain']['rewardItems']
        local diamondCount = xPlayer.getInventoryItem(rewardItems['diamondTrolly']['item']).count
        local goldCount = xPlayer.getInventoryItem(rewardItems['goldTrolly']['item']).count

        if diamondCount > 0 then
            xPlayer.removeInventoryItem(rewardItems['diamondTrolly']['item'], diamondCount)
            xPlayer.addAccountMoney(rewardItems['diamondTrolly']['sellPrice'] * diamondCount)
            totalMoney = totalMoney + (rewardItems['diamondTrolly']['sellPrice'] * diamondCount)
        end
        if goldCount > 0 then
            xPlayer.removeInventoryItem(rewardItems['goldTrolly']['item'], goldCount)
            xPlayer.addAccountMoney(rewardItems['goldTrolly']['sellPrice'] * goldCount)
            totalMoney = totalMoney + (rewardItems['goldTrolly']['sellPrice'] * goldCount)
        end

        discordLog(xPlayer.getName() ..  ' - ' .. xPlayer.getIdentifier(), ' Gain $' .. totalMoney .. ' on the Fleeca Heist Buyer!')
        TriggerClientEvent('fleecaheist:client:showNotification', src, Strings['total_money'] .. ' $' .. totalMoney)
    end
end)

RegisterServerEvent('fleecaheist:server:doorSync')
AddEventHandler('fleecaheist:server:doorSync', function(index)
    TriggerClientEvent('fleecaheist:client:doorSync', -1, index)
end)

RegisterServerEvent('fleecaheist:server:lootSync')
AddEventHandler('fleecaheist:server:lootSync', function(index, type, k)
    TriggerClientEvent('fleecaheist:client:lootSync', -1, index, type, k)
end)

RegisterServerEvent('fleecaheist:server:modelSync')
AddEventHandler('fleecaheist:server:modelSync', function(index, k, model)
    TriggerClientEvent('fleecaheist:client:modelSync', -1, index, k, model)
end)

RegisterServerEvent('fleecaheist:server:grabSync')
AddEventHandler('fleecaheist:server:grabSync', function(index, k, model)
    TriggerClientEvent('fleecaheist:client:grabSync', -1, index, k, model)
end)

RegisterServerEvent('fleecaheist:server:resetHeist')
AddEventHandler('fleecaheist:server:resetHeist', function(index)
    TriggerClientEvent('fleecaheist:client:resetHeist', -1, index)
end)

RegisterCommand('pdfleeca', function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if xPlayer then
        if xPlayer['job']['name'] == 'police' then
            TriggerClientEvent('fleecaheist:client:nearBank', src)
        else
            TriggerClientEvent('fleecaheist:client:showNotification', src, 'You are not cop!')
        end
    end
end)

function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end

