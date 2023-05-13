--[[
  This file is part of NewLand RolePlay.

  Copyright (c) NewLand RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizo = {}
NewKaizo.newThread = Citizen.CreateThread
NewKaizo.newWaitingThread = Citizen.SetTimeout
Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

NewKaizoPrefixes = {
    zones = "^1ZONE",
    err = "^1ERREUR",
    blips = "^1BLIPS",
    npcs = "^1NPCS",
    dev = "^4INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

NewKaizo.prefix = function(title, message)
    return ("^1NewLand ^7- (%s^7) %s" .. "^7"):format(title, message)
end