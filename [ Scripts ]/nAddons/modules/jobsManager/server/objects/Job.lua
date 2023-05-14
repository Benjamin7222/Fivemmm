---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@class Job
---@field public id number
---@field public name string
---@field public label string

---@field public safeMarker number
---@field public laundryMarker number
---@field public bossMarker number
---@field public otherMarkers table
Job = {}
Job.__index = Job

setmetatable(Job, {
    __call = function(_, name, label)
        local self = setmetatable({}, Job);
        self.id = #NewKaizoSJobsManager.list + 1
        self.name = name
        self.label = label
        self.otherMarkers = {}
        self:init()
        NewKaizoSJobsManager.list[self.name] = self
        return self;
    end
})

---init
---@public
---@return void
function Job:init()
    local infos = NewKaizoSharedCustomJobs[self.name]
    --[[
    self.safeMarker = LS.ExperienceSZonesManager.createPrivate(infos.inventory, 22, {r = 255, g = 0, b = 0, a = 255}, function(source)
        -- TODO -> InventoryManager.openInventory(source)
    end, "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le coffre-fort", 20.0, 1.0, {})
    --]]

    self.laundryMarker = LS.ExperienceSZonesManager.createPrivate(infos.laundry, 22, { r = 255, g = 0, b = 0, a = 255}, function(source)
        self:openCloackRoom(source)
    end, "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir les vestiaires", 20.0, 1.0, {})

    self.bossMarker = LS.ExperienceSZonesManager.createPrivate(infos.boss, 22, { r = 255, g = 0, b = 0, a = 255}, function(source)
        self:openBoss(source)
    end, "Appuyez sur ~INPUT_CONTEXT~ pour gérer l'entreprise", 20.0, 1.0, {})
end

---unsubscribe
---@public
---@return void
function Job:unsubscribe(source, gradeName)
    --LS.ExperienceSZonesManager.removeAllowed(self.safeMarker, source)
    LS.ExperienceSZonesManager.removeAllowed(self.laundryMarker, source)
    for _,v in pairs(self.otherMarkers) do
        LS.ExperienceSZonesManager.removeAllowed(v, source)
    end
    if gradeName == "boss" then
        LS.ExperienceSZonesManager.removeAllowed(self.bossMarker, source)
    end
end

---subscribe
---@public
---@return void
function Job:subscribe(source, gradeName)
    LS.ExperienceSZonesManager.addAllowed(self.safeMarker, source)
    LS.ExperienceSZonesManager.addAllowed(self.laundryMarker, source)
    for _,v in pairs(self.otherMarkers) do
        LS.ExperienceSZonesManager.addAllowed(v, source)
    end
    if gradeName == "boss" then
        LS.ExperienceSZonesManager.addAllowed(self.bossMarker, source)
    end
end

---alterBossAccess
---@public
---@return void
function Job:alterBossAccess(source, bool)
    if bool then
        LS.ExperienceSZonesManager.addAllowed(self.bossMarker, source)
    else
        LS.ExperienceSZonesManager.removeAllowed(self.bossMarker, source)
    end
end

---openCloackRoom
---@public
---@return void
function Job:openCloackRoom(source)
    NLServerUtils.toClient("openCloackroom", source, self.name)
end

---openBoss
---@public
---@return void
function Job:openBoss(source)
    NLServerUtils.toClient("openBossMenu", source, self.name)
end

---notifyEmployees
---@public
---@return void
function Job:notifyEmployees(message)
    local players = ESX.GetPlayers()
    for k,v in pairs(players) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer.getJob() == self.name then
            TriggerClientEvent("esx:showNotifciation", v, message)
        end
    end
end

---registerAdditionalZone
---@public
---@return void
function Job:registerAdditionalZone(zoneId)
    table.insert(self.otherMarkers, zoneId)
end

---getActiveEmployees
---@public
---@return table
function Job:getActiveEmployees()
    local players, employees = ESX.GetPlayers(), {}
    for k,v in pairs(players) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer.getJob() == self.name then
            employees[v] = xPlayer
        end
    end
    return employees
end
