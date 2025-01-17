---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [interactionMenu] created at [11/05/2021 23:48]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local cat, desc = "robberies", "Cambriolages"
local isWaitingServerResponse = false
local sub = function(str)
    return cat .. "_" .. str
end

NewKaizo.netRegisterAndHandle("robberiesOpenMenu", function(id, active, difficulty)
    if menuIsOpened then
        return
    end

    local streetName = GetStreetNameFromHashKey(Citizen.InvokeNative(0x2EB41072B4C1E4C0, GetEntityCoords(PlayerPedId()), Citizen.PointerValueInt(), Citizen.PointerValueInt()))

    if isWaitingServerResponse then
        ESX.ShowNotification("Une transaction est encore en cours avec le serveur...")
        return
    end

    FreezeEntityPosition(PlayerPedId(), true)
    menuIsOpened = true


    RMenu.Add(cat, sub("main"), RageUI.CreateMenu("", desc))
    RMenu:Get(cat, sub("main")).Closed = function()
    end

    RageUI.Visible(RMenu:Get(cat, sub("main")), true)

    NewKaizo.newThread(function()
        while menuIsOpened do
            local shouldStayOpened = false
            local function tick()
                shouldStayOpened = true
            end

            RageUI.IsVisible(RMenu:Get(cat, sub("main")), true, true, true, function()
                tick()
                if active then
                        RageUI.ButtonWithStyle("Crocheter la serrure", "Vous permets de tenter de crocheter la serrure et de pénetrer dans la propriétée si ce crochetage se solde par une réussite", {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                KaizoClientUtils.toServer("robberiesStart", id)
                                shouldStayOpened = false
                            end
                        end)
                end
            end, function()
                if active then
                    RageUI.StatisticPanelAdvanced("Difficultée", 0.0, nil, difficulty, { 255,0,0,255 }, nil, i)
                end
            end)

            if not shouldStayOpened and menuIsOpened then
                menuIsOpened = false
            end
            Wait(0)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        RMenu:Delete(cat, sub("main"))
    end)
end)