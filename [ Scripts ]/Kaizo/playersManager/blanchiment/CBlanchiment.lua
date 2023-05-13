
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

function KeyboardInputBlanchi(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

RMenu.Add('razzblanchi', 'menublanchi', KaizoUI.CreateMenu("~b~Blanchiment", "Pourcentage : ~r~40%"))

CreateThread(function()
    while true do
        Wait(1)
        local playerPed = PlayerPedId()
        local Distance = Vdist2(GetEntityCoords(PlayerPedId()), 1240.2126464844, -3053.5283203125, 14.297695159912)
        if Distance < 500.0 then
            if Distance < 1 then
                AddTextEntry("BLANCHI", "Appuyer sur ~INPUT_PICKUP~ pour parler avec Joan.")
                DisplayHelpTextThisFrame("BLANCHI", false)
                if IsControlJustPressed(1, 38) then
                    KaizoUI.Visible(RMenu:Get('razzblanchi', 'menublanchi'), true)
                    local IsBlanchiMenuOpen = true
                    while IsBlanchiMenuOpen do
                        Wait(1)
                        if not KaizoUI.Visible(RMenu:Get('razzblanchi', 'menublanchi')) then
                            IsBlanchiMenuOpen = false
                        end
                        FreezeEntityPosition(playerPed, true)
                        KaizoUI.IsVisible(RMenu:Get('razzblanchi', 'menublanchi'), true, true, true, function()

                            KaizoUI.ButtonWithStyle("Blanchir de l'argent", nil, { RightLabel = "~b~→" }, true, function(h, a, s)
                                if s then
                                    local argent = KeyboardInputBlanchi("Combien d'argent as-tu ?", '' , '', 8)
                                    TriggerServerEvent('rz-core:blanchiement', argent)
                                end
                            end)

                        end, function()end, 1)
                        FreezeEntityPosition(playerPed, false)
                    end
                end
            end
        else
            Wait(5000)
        end
    end
end)

--------- PED & BLIPS -----------

DecorRegister("Blanchiment", 4)
pedHashbl = "ig_ortega"
zonebl = vector3(1240.2126464844, -3053.5283203125, 13.297695159912)
Headingbl = 181.87591552734
Pedbl = nil
HeadingSpawnbl = 181.87591552734

Citizen.CreateThread(function()
    LoadModel(pedHashbl)
    Pedbl = CreatePed(2, GetHashKey(pedHashbl), zonebl, Headingbl, 0, 0)
    DecorSetInt(Pedbl, "Blanchiment", 5431)
    FreezeEntityPosition(Pedbl, 1)
    TaskStartScenarioInPlace(Pedbl, "WORLD_HUMAN_DRUG_DEALER", 0, false)
    SetEntityInvincible(Pedbl, true)
    SetBlockingOfNonTemporaryEvents(Pedbl, 1)
    end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

