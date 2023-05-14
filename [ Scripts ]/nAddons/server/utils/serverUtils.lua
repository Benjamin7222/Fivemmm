--[[
  This file is part of LSExperience RolePlay.

  Copyright (c) LSExperience RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NLServerUtils = {}

NLServerUtils.toClient = function(eventName, targetId, ...)
    TriggerClientEvent("Kaizo:" .. NewKaizo.hash(eventName), targetId, ...)
end

NLServerUtils.toAll = function(eventName, ...)
    TriggerClientEvent("Kaizo:" .. NewKaizo.hash(eventName), -1, ...)
end

NLServerUtils.registerConsoleCommand = function(command, func)
    RegisterCommand(command, function(source,args)
        if source ~= 0 then return end
        func(source, args)
    end, false)
end

NLServerUtils.getLicense = function(source)
    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
    return ""
end

NLServerUtils.trace = function(message, prefix)
    --print("^LSExperience ^7- (" .. prefix .. "^7) " .. message .. "^7")
end

local webhookColors = {
    ["red"] = 16711680,
    ["green"] = 56108,
    ["grey"] = 8421504,
    ["orange"] = 16744192
}

NLServerUtils.getIdentifiers = function(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[_]
        end
        return identifiers
    end
end

NLServerUtils.webhook = function(message, color, url)
    local DiscordWebHook = url
    local embeds = {
        {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = webhookColors[color],
            ["footer"] = {
                ["text"] = "LSExperience | Logs",
            },
        }
    }
    PerformHttpRequest(DiscordWebHook, function(err, text, headers)
    end, 'POST', json.encode({ username = "LSExperience | Logs", embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

NewKaizo.newRepeatingTask(function()
    local restrictedZones, publicZones = 0, 0
    local restrictedBlips, publicBlips = 0, 0
    local restrictedNpcs, publicNpcs = 0, 0
    ---@param zone Zone
    for _, zone in pairs(LSExperienceSZonesManager.list) do
        if zone:isRestricted() then
            restrictedZones = restrictedZones + 1
        else
            publicZones = publicZones + 1
        end
    end
    ---@param blip Blip
    for _, blip in pairs(KaizoSBlipsManager.list) do
        if blip:isRestricted() then
            restrictedBlips = restrictedBlips + 1
        else
            publicBlips = publicBlips + 1
        end
    end
    ---@param npc Npc
    for _, npc in pairs(NewKaizoSNpcsManager.list) do
        if npc:isRestricted() then
            restrictedNpcs = restrictedNpcs + 1
        else
            publicNpcs = publicNpcs + 1
        end
    end
    --[[NLServerUtils.trace(("Zones: %s%i%s (+%s%i%s) | Blips: %s%i%s (+%s%i%s) | Npcs: %s%i%s (+%s%i%s)"):format(
            "^2",
            publicZones,
            "^7",
            "^3",
            restrictedZones,
            "^7",
            "^2",
            publicBlips,
            "^7",
            "^3",
            restrictedBlips,
            "^7",
            "^2",
            publicNpcs,
            "^7",
            "^3",
            restrictedNpcs,
            "^7"
    ), NewKaizoPrefixes.dev)]]--
end, nil, 0, NewKaizo.second(30))