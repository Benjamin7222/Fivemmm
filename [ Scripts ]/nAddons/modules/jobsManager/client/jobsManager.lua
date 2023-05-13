---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizo.netRegisterAndHandle("openBossMenu", function(job)
    TriggerEvent('esx_society:openBossMenu', job, function(data, menu)
        menu.close()
    end, { wash = false })
end)