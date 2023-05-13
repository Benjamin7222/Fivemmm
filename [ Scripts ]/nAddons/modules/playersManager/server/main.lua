---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [main] created at [19/04/2021 23:51]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoSPlayersManager = {}
NewKaizoSPlayersManager.eventOverrider = {}
NewKaizoSPlayersManager.addonCache = {}
NewKaizoSPlayersManager.list = {}

NewKaizoSPlayersManager.registerAddonCache = function(index, onConnect, onDisconnect, onChange)
    NLServerUtils.trace(("Enregistrement d'un cache joueur: ^3%s"):format(index), NewKaizoPrefixes.dev)
    NewKaizoSPlayersManager.addonCache[index] = { onConnect, onDisconnect, onChange }
end

NewKaizoSPlayersManager.registerEventOverrider = function(type, func)
    NewKaizoSPlayersManager.eventOverrider[(#NewKaizoSPlayersManager.eventOverrider + 1)] = { on = type, handle = func }
end

NewKaizoSPlayersManager.exists = function(source)
    return NewKaizoSPlayersManager.list[source] ~= nil
end

NewKaizoSPlayersManager.createPlayer = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local steam, license = xPlayer.identifier, NLServerUtils.getLicense(source)
    NewKaizoSPlayersManager.list[source] = Player(source, steam, license)
end

NewKaizoSPlayersManager.getPlayer = function(source)
    return NewKaizoSPlayersManager.list[source]
end

NewKaizoSPlayersManager.removePlayer = function(source)
    NewKaizoSPlayersManager.list[source] = nil
end

NewKaizo.netHandleBasic("playerDropped", function(reason)
    local source = source
    if not NewKaizoSPlayersManager.exists(source) then
        return
    end
    NLServerUtils.trace(("Déconnexion de %s"):format(GetPlayerName(source)), NewKaizoPrefixes.dev)
    for _, eventOverriderInfos in pairs(NewKaizoSPlayersManager.eventOverrider) do
        if eventOverriderInfos.on == PLAYER_EVENT_TYPE.LEAVING then
            eventOverriderInfos.handle(source)
        end
    end
    for _, handlers in pairs(NewKaizoSPlayersManager.addonCache) do
        handlers[2](NewKaizoSPlayersManager.list[source])
    end
    NewKaizoSPlayersManager.removePlayer(source)
end)

NewKaizo.netHandleBasic('esx:playerLoaded', function(source, xPlayer)
    local source = source
    NLServerUtils.trace(("Connexion de %s"):format(GetPlayerName(source)), NewKaizoPrefixes.dev)
    NewKaizoSPlayersManager.createPlayer(source)
    for _, eventOverriderInfos in pairs(NewKaizoSPlayersManager.eventOverrider) do
        if eventOverriderInfos.on == PLAYER_EVENT_TYPE.CONNECTED then
            eventOverriderInfos.handle(source)
        end
    end
    for _, handlers in pairs(NewKaizoSPlayersManager.addonCache) do
        handlers[1](NewKaizoSPlayersManager.list[source])
    end
end)

NewKaizo.newRepeatingTask(function()
    ---@param player Player
    for _, player in pairs(NewKaizoSPlayersManager.list) do
        player:incrementSessionTimePlayed()
    end
end, nil, 0, NewKaizo.second(60))