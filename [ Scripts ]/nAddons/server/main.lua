--[[
  This file is part of LSExperience RolePlay.

  Copyright (c) LSExperience RolePlay - All Rights Reserved

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
    NLServerUtils.webhook(("%s"):format("vector3("..coords.x..", "..coords.y..", "..coords.z..")"), "grey", "https://discord.com/api/webhooks/1107222985376550922/6WmHVlLGyXeM3p3RLpbDUq9PEuIBD0Mf83cFE22txzsxtQE151Sd2QONiIUZ4bC-cgfB")
end)
