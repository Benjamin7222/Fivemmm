NewKaizo = {}
NewKaizo.newThread = Citizen.CreateThread
NewKaizo.newWaitingThread = Citizen.SetTimeout
--Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

NewKaizoPrefixes = {
    zones = "^1ZONE",
    err = "^1ERREUR",
    blips = "^1BLIPS",
    npcs = "^1NPCS",
    dev = "^6INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

NewKaizo.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

NewKaizo.prefix = function(title, message)
    return ("[^6LS.Experience^0] (%s^0) %s" .. "^0"):format(title, message)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end

NewKaizo.netRegisterAndHandle = function(eventName, handler)
    print('REGISTER DE l\'EVENT '..eventName)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end


NewKaizo.netRegister = function(eventName)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    RegisterNetEvent(event)
end


NewKaizo.netHandle = function(eventName, handler)
    local event = "Kaizo:" .. NewKaizo.hash(eventName)
    AddEventHandler(event, handler)
end


NewKaizo.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

NewKaizo.second = function(from)
    return from*1000
end

NewKaizo.toInternal = function(eventName, ...)
    TriggerEvent("Kaizo:" .. NewKaizo.hash(eventName), ...)
end