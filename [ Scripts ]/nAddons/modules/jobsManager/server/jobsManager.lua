---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local playersJobsCache = {}

NewKaizoSJobsManager = {}
NewKaizoSJobsManager.list = {}

---getJob
---@public
---@return Job
NewKaizoSJobsManager.getJob = function(job)
    return NewKaizoSJobsManager.list[job]
end

NewKaizo.netHandleBasic("playerDropped", function(reason)
    playersJobsCache[source] = nil
end)

--[[
NewKaizo.netHandle("esxloaded", function()
    MySQL.Async.fetchAll("SELECT * FROM jobs WHERE useCutomSystem = 1", {}, function(result)
        for _,job in pairs(result) do
            if not NewKaizoSharedCustomJobs[job.name] then
                print(NewKaizo.prefix(NewKaizoPrefixes.jobs,("Impossible de charger le job %s"):format(job.label)))
            else
                local society = ("society_%s"):format(job.name)
                TriggerEvent('esx_society:registerSociety', job.name, job.label, society, society, society, {type = 'private'})
                print(NewKaizo.prefix(NewKaizoPrefixes.jobs,("Chargement du job ^1%s ^7!"):format(job.name)))
                Job(job.name, job.label)
                NewKaizoSharedCustomJobs[job.name].onThisJobInit(NewKaizoSJobsManager.list[job.name])
            end
        end
    end)
end)
--]]

NewKaizo.netRegisterAndHandle("jobInitiated", function(job)
    local source = source
    playersJobsCache[source] = {name = job.name, grade = job.grade_name, isCustom = NewKaizoSJobsManager.getJob(job.name) ~= nil}
    if not NewKaizoSJobsManager.getJob(job.name) then
        return
    end
    ---@type Job
    local NewKaizoJob = NewKaizoSJobsManager.getJob(job.name)
    NewKaizoJob:subscribe(source, job.grade_name)
end)

NewKaizo.netRegisterAndHandle("jobUpdated", function(newJob)
    local source = source
    local previousCache = playersJobsCache[source]
    local newCache = {name = newJob.name, grade = newJob.grade_name, isCustom = NewKaizoSJobsManager.getJob(newJob.name) ~= nil}

    if previousCache.name ~= newJob.name then
        -- Changement de job
        ---@type Job
        if previousCache.isCustom then
            local previousJob = NewKaizoSJobsManager.getJob(previousCache.name)
            previousJob:unsubscribe(source, previousCache.grade)
        end
        if newCache.isCustom then
            local newNewKaizoJob = NewKaizoSJobsManager.getJob(newCache.name)
            newNewKaizoJob:subscribe(source, newCache.grade)
        end
    else
        if newCache.isCustom then
            if previousCache.grade ~= newCache.grade then
                local NewKaizoJob = NewKaizoSJobsManager.getJob(newCache.name)
                if previousCache.grade == "boss" then
                    NewKaizoJob:alterBossAccess(source, false)
                elseif newCache.grade == "boss" then
                    NewKaizoJob:alterBossAccess(source, true)
                end
            end
        end
    end

    playersJobsCache[source] = newCache
end)