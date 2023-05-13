---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [eventMusicPlayer] created at [20/04/2021 00:53]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizo.netRegisterAndHandle("fivemPlayMusic", function(music)
    PrepareMusicEvent(music)
    TriggerMusicEvent(music)
end)

NewKaizo.netRegisterAndHandle("fivemStopMusic", function(music)
    CancelMusicEvent(music)
end)