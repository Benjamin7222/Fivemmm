--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local blips = {}
blips.list = {}

NewKaizo.netHandle("esxloaded", function()
    KaizoClientUtils.toServer("requestPredefinedBlips")
end)

---@param blip Blip
NewKaizo.netRegisterAndHandle("newBlip", function(blip)
    blips.list[blip.blipId] = blip
    local b = AddBlipForCoord(blip.position)
    SetBlipSprite(b, blip.sprite)
    SetBlipColour(b, blip.color)
    SetBlipAsShortRange(b, blip.shortRange)
    SetBlipScale(b, blip.scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blip.text)
    EndTextCommandSetBlipName(b)
    blips.list[blip.blipId].blip = b
end)

NewKaizo.netRegisterAndHandle("delBlip", function(blipID)
    if blips.list[blipID] == nil then
        return
    end
    if blips.list[blipID].blip ~= nil and DoesBlipExist(blips.list[blipID].blip) then
        RemoveBlip(blips.list[blipID].blip)
    end
    blips.list[blipID] = nil
end)

NewKaizo.netRegisterAndHandle("cbBlips", function(incomingBlips)
    blips.list = incomingBlips
    ---@param blip Blip
    for blipID, blip in pairs(incomingBlips) do
        local b = AddBlipForCoord(blip.position)
        SetBlipSprite(b, blip.sprite)
        SetBlipColour(b, blip.color)
        SetBlipAsShortRange(b, blip.shortRange)
        SetBlipScale(b, blip.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.text)
        EndTextCommandSetBlipName(b)
        blips.list[blipID].blip = b
    end
end)