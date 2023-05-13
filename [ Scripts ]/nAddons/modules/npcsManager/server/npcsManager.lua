--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoSNpcsManager = {}
NewKaizoSNpcsManager.list = {}

NewKaizoSNpcsManager.createPublic = function(model, ai, frozen, position, animation, onCreate)
    local npc = Npc(model, ai, frozen, position, animation, false)
    npc:setOnCreate(onCreate or function() end)
    NLServerUtils.toAll("newNpc", npc)
    return npc
end

NewKaizoSNpcsManager.createPrivate = function(model, ai, frozen, position, animation, baseAllowed, onCreate)
    local npc = Npc(model, ai, frozen, position, animation, true, baseAllowed)
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if npc:isAllowed(v) then
            NLServerUtils.toClient("newNpc", v, npc)
        end
    end
    return npc
end

NewKaizoSNpcsManager.addAllowed = function(npcId, playerId)
    if not NewKaizoSNpcsManager.list[npcId] then
        return
    end
    ---@type Npc
    local npc = NewKaizoSNpcsManager.list[npcId]
    if npc:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.npcs,("Tentative d'ajouter l'ID %s au npc %s alors qu'il est déjà autorisé"):format(playerId, npcId)))
        return
    end
    npc:addAllowed(playerId)
    NLServerUtils.toClient("newNpc", playerId, npc)
    NewKaizoSNpcsManager.list[npcId] = npc
end

NewKaizoSNpcsManager.removeAllowed = function(npcId, playerId)
    if not NewKaizoSNpcsManager.list[npcId] then
        return
    end
    ---@type Npc
    local npc = NewKaizoSNpcsManager.list[npcId]
    if not npc:isAllowed(playerId) then
        print(NewKaizo.prefix(NewKaizoPrefixes.npcs,("Tentative de supprimer l'ID %s au blip %s alors qu'il n'est déjà pas autorisé"):format(playerId, npcId)))
        return
    end
    npc:removeAllowed(playerId)
    NLServerUtils.toClient("delNpc", playerId, npcId)
    NewKaizoSNpcsManager.list[npcId] = npc
end

NewKaizoSNpcsManager.updateOne = function(source)
    local npcs = {}
    ---@param npc Npc
    for npcId, npc in pairs(NewKaizoSNpcsManager.list) do
        if npc:isRestricted() then
            if npc:isAllowed(source) then
                npcs[npcId] = npc
            end
        else
            npcs[npcId] = npc
        end
    end
    NLServerUtils.toClient("cbNpcs", source, npcs)
end

NewKaizo.netRegisterAndHandle("requestPredefinedNpcs", function()
    local source = source
    NewKaizoSNpcsManager.updateOne(source)
end)

