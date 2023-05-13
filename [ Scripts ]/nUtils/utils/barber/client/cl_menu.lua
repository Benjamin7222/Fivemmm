ESX = nil

local SettingsMenu = {
    percentage = 0.0,
    ColorHear = {primary = {1, 1}, secondary = {1, 1}},
    ColorBrow = {primary = {1, 1}, secondary = {1, 1}},
    ColorBeard = {primary = {1, 1}, secondary = {1, 1}}

}

local MenuList = {List = 1, List1 = 1, List2 = 1}
local BarberMenu = false

------------------------------MENU SHOPS

local barber = menu.CreateMenu("", "Intéraction", 10, 80)
barber.Closed = function() 
    BarberMenu = false 
    FreezeEntityPosition(PlayerPedId(), false)
end
barber.Closable = false
barber.EnableMouse = true;

function OpenMenuBarber()
    if BarberMenu then
        BarberMenu = false
    else
        BarberMenu = true
        FreezeEntityPosition(PlayerPedId(), true)
        menu.Visible(barber, true)
        CreateThread(function()
            while BarberMenu do
                Wait(1)
                menu.IsVisible(barber, function()


                    menu.Button("Payer le coiffeur", nil, {Color = {BackgroundColor = {0, 255, 0, 100}}, RightLabel = "~b~50$"}, true, {
                        onSelected = function()
                            TriggerServerEvent('kaizo:coiffeur')
                        end
                    }) 

                    menu.Button("Fermer le menu", nil, {Color = {BackgroundColor = {255, 0, 0, 100}}}, true, {
                        onSelected = function()
                            BarberMenu = false 
                            menu.CloseAll()
                            FreezeEntityPosition(PlayerPedId(), false)
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    })
                    menu.Separator('↓ ~b~Coiffeur~s~ ↓')

                    menu.List('Cheveux', {"~b~1~s~", "~b~2~s~", "~b~3~s~", "~b~4~s~", "~b~5~s~", "~b~6~s~", "~b~7~s~", "~b~8~s~", "~b~9~s~", "~b~10~s~","~b~11~s~", "~b~12~s~", "~b~13~s~", "~b~14~s~","~b~15~s~", "~b~16~s~", "~b~17~s~", "~b~18~s~","~b~19~s~", "~b~20~s~", "~b~21~s~", "~b~22~s~", "~b~23~s~", "~b~24~s~", "~b~25~s~", "~b~26~s~","~b~27~s~", "~b~28~s~", "~b~29~s~", "~b~30~s~","~b~31~s~", "~b~32~s~", "~b~33~s~", "~b~34~s~","~b~35~s~", "~b~36~s~", "~b~37~s~", "~b~38~s~","~b~39~s~", "~b~40~s~", "~b~41~s~", "~b~42~s~","~b~43~s~", "~b~44~s~", "~b~45~s~" }, MenuList.List, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List = i;
                            TriggerEvent("skinchanger:change", "hair_1",MenuList.List)
                        end
                    })

                    menu.ColourPanel("Couleur cheveux", menu.PanelColour.HairCut, SettingsMenu.ColorHear.primary[1], SettingsMenu.ColorHear.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.primary[1] = MinimumIndex
                            SettingsMenu.ColorHear.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_1", SettingsMenu.ColorHear.primary[2])
                        end
                    }, 4);

                    menu.ColourPanel("Couleur cheveux", menu.PanelColour.HairCut, SettingsMenu.ColorHear.secondary[1], SettingsMenu.ColorHear.secondary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorHear.secondary[1] = MinimumIndex
                            SettingsMenu.ColorHear.secondary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "hair_color_2", SettingsMenu.ColorHear.secondary[2])
                        end
                    }, 4);

                    menu.List('Barbe', {"~b~1~s~", "~b~2~s~", "~b~3~s~", "~b~4~s~", "~b~5~s~", "~b~6~s~", "~b~7~s~", "~b~8~s~", "~b~9~s~", "~b~10~s~", "~b~11~s~", "~b~12~s~", "~b~13~s~", "~b~14~s~", "~b~15~s~", "~b~16~s~", "~b~17~s~", "~b~18~s~", "~b~19~s~", "~b~20~s~", "~b~21~s~", "~b~22~s~", "~b~23~s~", "~b~24~s~", "~b~25~s~", "~b~26~s~", "~b~27~s~", "~b~28~s~"
                    }, MenuList.List1, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List1 = i;
                            TriggerEvent("skinchanger:change", "beard_1", MenuList.List1)
                        end
                    })

                    menu.ColourPanel("Couleur Barbes", menu.PanelColour.HairCut, SettingsMenu.ColorBeard.primary[1], SettingsMenu.ColorBeard.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBeard.primary[1] = MinimumIndex
                            SettingsMenu.ColorBeard.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "beard_3",SettingsMenu.ColorBeard.primary[2])
                        end
                    }, 5);

                    menu.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "beard_2", Percentage * 10)
                        end
                    }, 5);

                    menu.List('Sourcils', {"~b~1~s~", "~b~2~s~", "~b~3~s~", "~b~4~s~", "~b~5~s~", "~b~6~s~", "~b~7~s~", "~b~8~s~", "~b~9~s~", "~b~10~s~", "~b~11~s~", "~b~12~s~", "~b~13~s~", "~b~14~s~", "~b~15~s~", "~b~16~s~", "~b~17~s~", "~b~18~s~", "~b~19~s~", "~b~20~s~", "~b~21~s~", "~b~22~s~", "~b~23~s~", "~b~24~s~", "~b~25~s~", "~b~26~s~", "~b~27~s~", "~b~28~s~", "~b~29~s~", "~b~30~s~", "~b~31~s~", "~b~32~s~", "~b~33~s~", "~b~34~s~", "~b~35~s~"
                    }, MenuList.List2, nil, {}, true, {
                        onListChange = function(i, Item)
                            MenuList.List2 = i;
                            TriggerEvent("skinchanger:change", "eyebrows_1", MenuList.List2)
                        end
                    })

                    menu.ColourPanel("Couleur Sourcils", menu.PanelColour.HairCut, SettingsMenu.ColorBrow.primary[1], SettingsMenu.ColorBrow.primary[2], {
                        onColorChange = function(MinimumIndex, CurrentIndex)
                            SettingsMenu.ColorBrow.primary[1] = MinimumIndex
                            SettingsMenu.ColorBrow.primary[2] = CurrentIndex
                            TriggerEvent("skinchanger:change", "eyebrows_3", SettingsMenu.ColorBrow.primary[2])
                        end
                    }, 6);

                    menu.PercentagePanel(SettingsMenu.percentage, 'Opacité', '0%', '100%', {
                        onProgressChange = function(Percentage)
                            SettingsMenu.percentage = Percentage
                            TriggerEvent("skinchanger:change", "eyebrows_2", Percentage * 10)
                        end
                    }, 6);

                end)
            end
        end)
    end
end

------------------------------DRAWMARKERS

CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for _, v in pairs(Shared.positionbarber) do
            if #(pCoords2 - v.position) < 1.0 then
                activerfps = true
                ESX.ShowHelpNotification("E", "pour intéragir")
                if BarberMenu == false then
                    if IsControlJustReleased(0, 38) then
                        OpenMenuBarber()
                    end
                end
            elseif #(pCoords2 - v.position) < 7.0 then
                activerfps = true
                DrawMarker(21, v.position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 69, 255, 1, 1, 2, 0, nil, nil, 0)
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)

------------------------------BLIPS

CreateThread(function()
    for _, info in pairs(Shared.blipsBarber) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

RegisterNetEvent("kaizo:saveSkin")
AddEventHandler("kaizo:saveSkin", function()
    FreezeEntityPosition(PlayerPedId(), false)
    menu.CloseAll()
    BarberMenu = false
    TriggerEvent("skinchanger:getSkin", function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)