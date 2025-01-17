_Client.MainMenu = {} or {} 
_Client.MainMenu.MaskIndex = 1
_Client.MainMenu.MaskColorIndex = 1

_Client.MainMenu.Open = function(Mask)
    local main = RageUI.CreateMenu(_Client.Function.Locales["mainMenu"], _Client.Function.Locales["mainMenuTitle"])
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 14, 0), [2] = _Client.Function.Locales["mainMenuInstructionalButtonZoomBack"]})
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 15, 0), [2] = _Client.Function.Locales["mainMenuInstructionalButtonZoomBefore"]})
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = _Client.Function.Locales["mainMenuInstructionalButtonRight"]})
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = _Client.Function.Locales["mainMenuInstructionalButtonLeft"]})
    _Client.MainMenu.getColor = {} for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, _Client.MainMenu.MaskIndex) -1 do _Client.MainMenu.getColor[i] = i end
    _Client.MainMenu.getMask = {} for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1, 1 do _Client.MainMenu.getMask[i] = i end
    RageUI.Visible(main, true)
    while main do
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()
            RageUI.List(_Client.Function.Locales["mainMenuButtonMask"], _Client.MainMenu.getMask, _Client.MainMenu.MaskIndex or 1, nil, {}, true, {
                onActive = function()
                    _Client.Function.FovCam()
                    _Client.Function.OnRenderCam()
                end,
                onListChange = function(Index)
                    _Client.MainMenu.MaskColorIndex = 0
                    _Client.MainMenu.MaskIndex = Index
                    SetPedComponentVariation(PlayerPedId(), 1, _Client.MainMenu.MaskIndex, _Client.MainMenu.MaskColorIndex, 2)
                end,
            })
            RageUI.List(_Client.Function.Locales["mainMenuButtonMaskColor"], _Client.MainMenu.getColor, _Client.MainMenu.MaskColorIndex or 1, nil, {}, true, {
                onActive = function()
                    _Client.Function.FovCam()
                    _Client.Function.OnRenderCam()
                end,
                onListChange = function(Index)
                    _Client.MainMenu.MaskColorIndex = Index
                    SetPedComponentVariation(PlayerPedId(), 1, _Client.MainMenu.MaskIndex, _Client.MainMenu.MaskColorIndex, 2)
                end,
            })
            RageUI.Button((_Client.Function.Locales["mainMenuButtonPrice"]):format(KaizoMasques.Utils.Price), nil, {Color = {BackgroundColor = { 0, 140, 0, 160 }}}, true, {
                onActive = function()
                    _Client.Function.FovCam()
                    _Client.Function.OnRenderCam()
                end,
                onSelected = function()
                    KaizoMasques.Utils.ServerSide(("%s:buyMask"):format(KaizoMasques.Utils.GetESX), Mask.pos, KaizoMasques.Utils.Price)
                end
            })
        end)
        if (not (RageUI.Visible(main))) then
            main = RMenu:DeleteType(main, true, _Client.Function.NoSave(), _Client.Function.DestoryCam(), FreezeEntityPosition(PlayerPedId(), false))
        end
    end
end

