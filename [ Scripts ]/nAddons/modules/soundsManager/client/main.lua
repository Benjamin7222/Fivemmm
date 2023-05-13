--[[
  This file is part of Onore RolePlay.

  Copyright (c) Onore RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoClientSoundsManager = {}

NewKaizoClientSoundsManager.playSound = function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = soundFile,
        transactionVolume = soundVolume
    })
end

NewKaizoClientSoundsManager.playSound3d = function(soundFile, soundVolume, coords, heading)
    SendNUIMessage({
        playSound3d = true,
        transactionFile = soundFile,
        transactionVolume = soundVolume,
        audioCoords = coords,
        audioRot = heading or 0.0,
    })
end

NewKaizoClientSoundsManager.playYouTube = function(id, url, volume, isLoop)
    PlayUrl(id,url,volume,isLoop)
end