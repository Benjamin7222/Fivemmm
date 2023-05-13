
RegisterNetEvent("ui:interaction")
AddEventHandler("ui:interaction", function(key, message)
    SendNUIMessage({
        type = "showInteraction",
        key = key,
        message = message
    })
end)