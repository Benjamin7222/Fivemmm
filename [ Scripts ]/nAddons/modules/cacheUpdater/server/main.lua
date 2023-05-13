--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoSCache = {}

NewKaizoSCache.caches = {}
NewKaizoSCache.relativesDb = {}

NewKaizoSCache.getCache = function(index)
    return NewKaizoSCache.caches[index] or {}
end

NewKaizoSCache.addCacheRule = function(index, sqlTable, updateFrequency)
    NewKaizoSCache.caches[index] = {}
    NewKaizoSCache.relativesDb[sqlTable] = { index = index, interval = updateFrequency }
    NLServerUtils.trace(("Ajout d'une règle de cache: ^2%s ^7sur ^3%s"):format(index,sqlTable), NewKaizoPrefixes.sync)
end

NewKaizoSCache.removeCacheRule = function(sql)
    NewKaizoSCache.caches[NewKaizoSCache.relativesDb[sql]] = nil
    NewKaizo.cancelTaskNow(NewKaizoSCache.relativesDb[sql].processId)
    NLServerUtils.trace(("Retrait d'une règle de cache: ^2%s"):format(NewKaizoSCache.relativesDb[sql].index), NewKaizoPrefixes.sync)
    NewKaizoSCache.relativesDb[sql] = nil
end

NewKaizo.netHandle("esxloaded", function()
    while true do
        for sqlTable, infos in pairs(NewKaizoSCache.relativesDb) do
            if not infos.processId then
                infos.processId = NewKaizo.newRepeatingTask(function()
                    MySQL.Async.fetchAll(("SELECT * FROM %s"):format(sqlTable), {}, function(result)
                        if NewKaizoSCache.caches[infos.index] ~= nil then
                            NewKaizoSCache.caches[infos.index] = result
                        end
                    end)
                end, nil, 0, infos.interval)
            end
        end
        Wait(NewKaizo.second(1))
    end
end)

