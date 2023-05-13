--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewlandSZonesManager = {}
NewlandSZonesManager.list = {}

NewlandSZonesManager.createPublic = function(location, type, color, onInteract, helpText, drawDist, itrDist)
    local zone = Zone(location, type, color, onInteract, helpText, drawDist, itrDist, false)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    NLServerUtils.toAll("newMarker", marker)
    return zone.zoneID
end

NewlandSZonesManager.createPrivate = function(location, type, color, onInteract, helpText, drawDist, itrDist, baseAllowed)
    local zone = Zone(location, type, color, onInteract, helpText, drawDist, itrDist, true, baseAllowed)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if zone:isAllowed(v) then
            NLServerUtils.toClient("newMarker", v, marker)
        end
    end
    return zone.zoneID
end

NewlandSZonesManager.addAllowed = function(zoneID, playerId)
    if not NewlandSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = NewlandSZonesManager.list[zoneID]
    if zone:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.zones,("Tentative d'ajouter l'ID %s à la zone %s alors qu'il est déjà autorisé"):format(playerId,zoneID)))
        return
    end
    zone:addAllowed(playerId)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    NLServerUtils.toClient("newMarker", playerId, marker)
    NewlandSZonesManager.list[zoneID] = zone
end

NewlandSZonesManager.removeAllowed = function(zoneID, playerId)
    if not NewlandSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = NewlandSZonesManager.list[zoneID]
    if not zone:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.zones,("Tentative de supprimer l'ID %s à la zone %s alors qu'il n'est déjà pas autorisé"):format(playerId,zoneID)))
        return
    end
    zone:removeAllowed(playerId)
    NLServerUtils.toClient("delMarker", playerId, zoneID)
    NewlandSZonesManager.list[zoneID] = zone
end

NewlandSZonesManager.updatePrivacy = function(zoneID, newPrivacy)
    if not NewlandSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = NewlandSZonesManager.list[zoneID]
    local wereAllowed = {}
    local wasRestricted = zone:isRestricted()
    if zone:isRestricted() then
        wereAllowed = zone.allowed
    end
    zone.allowed = {}
    zone:setRestriction(newPrivacy)
    if zone:isRestricted() then
        local players = ESX.GetPlayers()
        if not wasRestricted then
            for _, playerId in pairs(players) do
                local isAllowedtoSee = false
                for _, allowed in pairs(wereAllowed) do
                    if allowed == playerId then
                        isAllowedtoSee = true
                    end
                end
                if not isAllowedtoSee then
                    NLServerUtils.toClient("delMarker", playerId, zone.zoneID)
                end
            end
        end
    else
        if wasRestricted then
            for _, playerId in pairs(players) do
                local isAllowedtoSee = false
                for _, allowed in pairs(wereAllowed) do
                    if allowed == playerId then
                        isAllowedtoSee = true
                    end
                end
                if isAllowedtoSee then
                    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
                    NLServerUtils.toClient("newMarker", playerId, marker)
                end
            end
        end
    end
    NewlandSZonesManager.list[zoneID] = zone
end

NewlandSZonesManager.delete = function(zoneID)
    if not NewlandSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = NewlandSZonesManager.list[zoneID]
    if zone:isRestricted() then
        local players = ESX.GetPlayers()
        for k, playerId in pairs(players) do
            if zone:isAllowed(playerId) then
                NLServerUtils.toClient("delMarker", playerId, zoneID)
            end
        end
    else
        NLServerUtils.toAll("delMarker", zoneID)
    end
end

NewlandSZonesManager.updateOne = function(source)
    local markers = {}
    ---@param zone Zone
    for zoneID, zone in pairs(NewlandSZonesManager.list) do
        if zone:isRestricted() then
            if zone:isAllowed(source) then
                markers[zoneID] = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
            end
        else
            markers[zoneID] = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
        end
    end
    NLServerUtils.toClient("cbZones", source, markers)
end

NewKaizo.netRegisterAndHandle("requestPredefinedZones", function()
    local source = source
    NewlandSZonesManager.updateOne(source)
end)

NewKaizo.netRegisterAndHandle("interactWithZone", function(zoneID)
    local source = source
    if not NewlandSZonesManager.list[zoneID] then
        DropPlayer("[NewKaizo] Tentative d'intéragir avec une zone inéxistante.")
        return
    end
    ---@type Zone
    local zone = NewlandSZonesManager.list[zoneID]
    zone:interact(source)
end)