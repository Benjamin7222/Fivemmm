--[[
  This file is part of NewLand RolePlay.

  Copyright (c) NewLand RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
devMode = false

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
    Wait(100)
    NewKaizo.toInternal("esxloaded")
end)

NewKaizo.netRegisterAndHandle("coords", function(coords)
    local source = source
    local name = GetPlayerName(source)
    NLServerUtils.webhook(("%s"):format("vector3("..coords.x..", "..coords.y..", "..coords.z..")"), "grey", "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR")
end)
