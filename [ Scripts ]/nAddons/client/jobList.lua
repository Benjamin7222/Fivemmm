
--[[
  This file is part of LS.Experience RolePlay.

  Copyright (c) LS.Experience RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local avaibleJobs = {
    "realestateagent",
    "ojap"
}

for k,v in pairs(avaibleJobs) do
    Jobs.list[v] = {}
end

NewKaizo.netHandle("esxloaded", function()
    NewKaizo.newThread(function()
        while true do
            if Jobs.list[Job.name] ~= nil and Jobs.list[Job.name].openMenu ~= nil then
                if IsControlJustPressed(0, 167) then
                    Jobs.list[Job.name].openMenu()
                end
            end
            Wait(0)
        end
    end)
end)