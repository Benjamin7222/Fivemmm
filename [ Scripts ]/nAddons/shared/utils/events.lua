--[[
  This file is part of NewLand RolePlay.

  Copyright (c) NewLand RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---toInternal
---@public
---@return void
NewKaizo.toInternal = function(eventName, ...)
    TriggerEvent("Kaizo:" .. NewKaizo.hash(eventName), ...)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end
---netRegisterAndHandle
---@public
---@return void
NewKaizo.netRegisterAndHandle = function(eventName, handler)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end

---netRegister
---@public
---@return void
NewKaizo.netRegister = function(eventName)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    RegisterNetEvent(event)
end

---netHandle
---@public
---@return void
NewKaizo.netHandle = function(eventName, handler)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    AddEventHandler(event, handler)
end

---netHandleBasic
---@public
---@return void
NewKaizo.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

---hash
---@public
---@return any
NewKaizo.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

---second
---@public
---@return number
NewKaizo.second = function(from)
    return from*1000
end