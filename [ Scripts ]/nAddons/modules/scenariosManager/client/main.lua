---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [main] created at [26/04/2021 19:16]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local busy = false

NewKaizo.netRegisterAndHandle("playScenario", function(scenario, ms, instant)
    if busy then return end
    busy = true
    TriggerEvent("dp:setCanX", false)
    TaskStartScenarioInPlace(PlayerPedId(), scenario, -1, instant or false)
    NewKaizo.newWaitingThread(ms, function()
        if instant then
            ClearPedTasksImmediately(PlayerPedId())
        else
            ClearPedTasks(PlayerPedId())
        end
        TriggerEvent("dp:setCanX", true)
        busy = false
    end)
end)