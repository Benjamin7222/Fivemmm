--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

KaizoSBlipsManager = {}
KaizoSBlipsManager.list = {}

KaizoSBlipsManager.createPublic = function(position, sprite, color, scale, text, shortRange)
    local blip = Blip(position, sprite, color, scale, text, shortRange, false)
    NLServerUtils.toAll("newBlip", blip)
    return blip.blipId
end

KaizoSBlipsManager.createPrivate = function(position, sprite, color, scale, text, shortRange, baseAllowed)
    local blip = Blip(position, sprite, color, scale, text, shortRange, true, baseAllowed)
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if blip:isAllowed(v) then
            NLServerUtils.toClient("newBlip", v, blip)
        end
    end
    return blip.blipId
end

KaizoSBlipsManager.addAllowed = function(blipID, playerId)
    if not KaizoSBlipsManager.list[blipID] then
        return
    end
    ---@type Blip
    local blip = KaizoSBlipsManager.list[blipID]
    if blip:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.blips,("Tentative d'ajouter l'ID %s au blip %s alors qu'il est déjà autorisé"):format(playerId,blipID)))
        return
    end
    blip:addAllowed(playerId)
    NLServerUtils.toClient("newBlip", playerId, blip)
    KaizoSBlipsManager.list[blipID] = blip
end

KaizoSBlipsManager.removeAllowed = function(blipID, playerId)
    if not KaizoSBlipsManager.list[blipID] then
        return
    end
    ---@type Blip
    local blip = KaizoSBlipsManager.list[blipID]
    if not blip:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.blips,("Tentative de supprimer l'ID %s au blip %s alors qu'il n'est déjà pas autorisé"):format(playerId,blipID)))
        return
    end
    blip:removeAllowed(playerId)
    NLServerUtils.toClient("delBlip", playerId, blipID)
    KaizoSBlipsManager.list[blipID] = blip
end

KaizoSBlipsManager.updateOne = function(source)
    local blips = {}
    ---@param blip Blip
    for blipID, blip in pairs(KaizoSBlipsManager.list) do
        if blip:isRestricted() then
            if blip:isAllowed(source) then
                blips[blipID] = blip
            end
        else
            blips[blipID] = blip
        end
    end
    NLServerUtils.toClient("cbBlips", source, blips)
end

KaizoSBlipsManager.delete = function(blipID)
    if not KaizoSBlipsManager.list[blipID] then
        return
    end
    ---@type Zone
    local blip = KaizoSBlipsManager.list[blipID]
    if blip:isRestricted() then
        local players = ESX.GetPlayers()
        for k, playerId in pairs(players) do
            if blip:isAllowed(playerId) then
                NLServerUtils.toClient("delBlip", playerId, blipID)
            end
        end
    else
        NLServerUtils.toAll("delBlip", blipID)
    end
end

NewKaizo.netRegisterAndHandle("requestPredefinedBlips", function()
    local source = source
    KaizoSBlipsManager.updateOne(source)
end)