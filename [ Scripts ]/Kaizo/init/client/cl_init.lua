KaizoClientUtils = {}

KaizoClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("Kaizo:" .. NewKaizo.hash(eventName), ...)
end