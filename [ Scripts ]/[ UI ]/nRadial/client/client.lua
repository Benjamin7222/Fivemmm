local menuOn = false

local keybindControls = {
	["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166
}

local ouvert = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local keybindControl = keybindControls["F2"]
        if IsControlPressed(0, keybindControl) then
            menuOn = true
            SendNUIMessage({
                type = 'init',
                resourceName = GetCurrentResourceName()
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
            while menuOn == true do Citizen.Wait(100) end
            Citizen.Wait(100)
            while IsControlPressed(0, keybindControl) do Citizen.Wait(100) end
        end
    end
end)

RegisterNUICallback('closemenu', function(data, cb)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    cb('ok')
end)

RegisterNUICallback('openmenu', function(data)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    if data.id == 'aide' then
        ExecuteCommand("ouvririnventaire")  -- inventaire

    elseif data.id == 'billing' then
        ExecuteCommand("invoices") -- facture

    elseif data.id == 'dance' then
        ExecuteCommand('gw_animation')  -- emote


    elseif data.id == 'phone' then
    	ExecuteCommand("TooglePhone")   --telephone
        --TriggerEvent("gcPhone:forceOpenPhone")    --telephone 
    

    elseif data.id == 'skelly' then
        ExecuteCommand('donate') -- Check boutique 
    end



--[[
    PATTERN FOR CLIENT
    RegisterNetEvent("esx_billing:openBillings")
    AddEventHandler("esx_billing:openBillings", function()
            ShowBillsMenu()
    end)
]]--

end)

Citizen.CreateThread(function()
    while true do 
        local poids = 75
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.bags_1 == 96 or skin.bags_1 == 95 or skin.bags_1 == 92 or skin.bags_1 == 91 or skin.bags_1 == 55 or skin.bags_1 == 54 or skin.bags_1 == 51 or skin.bags_1 == 50 or skin.bags_1 == 11 or skin.bags_1 == 9 then 
                poids = 125
            end
        end)

        TriggerServerEvent("BackUtils:setWeight", poids)

        Citizen.Wait(5000)
    end
end)