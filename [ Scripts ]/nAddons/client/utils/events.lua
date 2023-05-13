--[[
  This file is part of NewLand RolePlay.

  Copyright (c) NewLand RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

KaizoClientUtils = {}

KaizoClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("Kaizo:" .. NewKaizo.hash(eventName), ...)
end