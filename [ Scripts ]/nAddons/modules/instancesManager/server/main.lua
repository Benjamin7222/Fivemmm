--[[
  This file is part of NewKaizo RolePlay.

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local playerRestrictedBuckets = 5000

NewKaizo.netRegisterAndHandle("setBucket", function(bucketID)
    local source = source
    SetPlayerRoutingBucket(source, bucketID)
    NLServerUtils.trace(("Le joueur %s est désormais sur le bucket %s"):format(GetPlayerName(source), bucketID), NewKaizoPrefixes.sync)
end)

NewKaizo.netRegisterAndHandle("genPlayerBucket", function()
    local source = source
    local bucketID = (playerRestrictedBuckets+source)
    SetPlayerRoutingBucket(source, bucketID)
    NLServerUtils.trace(("Le joueur %s est désormais sur le bucket %s"):format(GetPlayerName(source), bucketID), NewKaizoPrefixes.sync)
end)

NewKaizo.netRegisterAndHandle("setOnPublicBucket", function()
    local source = source
    SetPlayerRoutingBucket(source, 0)
    NLServerUtils.trace(("Le joueur %s est désormais sur le bucket ^2public"):format(GetPlayerName(source)), NewKaizoPrefixes.sync)
end)