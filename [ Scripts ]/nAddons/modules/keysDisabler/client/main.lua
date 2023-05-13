---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [main.lua] created at [11/06/2021 13:07]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoCKeysDisabler = {}

NewKaizoCKeysDisabler.disableKey = function(key)
    NewKaizoCKeysDisabler[key] = true
end

NewKaizoCKeysDisabler.enableKey = function(key)
    NewKaizoCKeysDisabler[key] = nil
    Wait(150)
    EnableControlAction(0, key, true)
end

NewKaizo.netHandle("esxloaded", function()
    NewKaizo.newThread(function()
        while true do
            for k,v in pairs(NewKaizoCKeysDisabler) do
                DisableControlAction(0, k, true)
            end
            Wait(0)
        end
    end)
end)