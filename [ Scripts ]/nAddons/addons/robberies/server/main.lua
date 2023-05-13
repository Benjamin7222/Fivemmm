---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [main] created at [11/05/2021 20:34]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoSRobberiesManager = {}
NewKaizoSRobberiesManager.list = {}
NewKaizoSRobberiesManager.players = {}

NewKaizo.netHandle("esxloaded", function()
    for id, robberyInfos in pairs(NewKaizoSharedRobberies) do
        ---@type Robbery
        local robbery = Robbery(id,robberyInfos)
        NewKaizoSRobberiesManager.list[id] = robbery
    end
end)

NewKaizo.netRegisterAndHandle("robberiesStart", function(id, xPlayers)
    local _src = source
	local xPlayer  = ESX.GetPlayerFromId(_src)
	local xPlayers = ESX.GetPlayers()
    ---@type Robbery
    local cops = 0
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
            cops = cops + 1
        end
    end

    if not rob then
        if cops >= 3 then
            rob = true

            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
                    TriggerClientEvent('esx:showNotification', xPlayers[i], 'Un cambriolage est en cours ! (Position sur votre GPS)')
                    TriggerClientEvent('rsetBlip', xPlayers[i], NewKaizoSharedRobberies[id].entry)
                end
            end

                local robbery = NewKaizoSRobberiesManager.list[id]
                robbery:handleStart(_src)
        else
			TriggerClientEvent('esx:showNotification', _src, 'Il y a aucun membre des forces de l\'ordres en ville !')
        end
    end
end)

NewKaizo.netRegisterAndHandle("robberiesDiedDuring", function()
    local _src = source
    local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        local robbery = NewKaizoSRobberiesManager.list[NewKaizoSRobberiesManager.players[_src].id]
        robbery:exitRobbery(_src, true)
        TriggerClientEvent('rkillBlip', xPlayers[i])
    end
end)

NewKaizo.netRegisterAndHandle("robberiesRemoveBlip", function()
    local _src = source
    local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('rkillBlip', xPlayers[i])
    end
end)

NewKaizo.netRegisterAndHandle("robberiesAddItem", function(itemTable)
    local _src = source
    if not NewKaizoSRobberiesManager.players[_src] then
        --@TODO -> Faire une liste d'error
        DropPlayer(_src, "Une erreur est survenue, contactez un staff, Erreur: 16489")
        return
    end
    table.insert(NewKaizoSRobberiesManager.players[_src].bag, itemTable)
end)