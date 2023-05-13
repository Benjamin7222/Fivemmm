---@author Pablo Z.
---@version 1.0
--[[
  This file is part of NewKaizo RolePlay.
  
  File [Robbery] created at [11/05/2021 20:35]

  Copyright (c) NewKaizo RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@class Robbery
---@field public interior number
---@field public possibleObjects table
---@field public possibleOponents table
---@field public id number
---@field public name string

---@field protected savedInfos table
---@field protected isActive boolean


---@field protected entryZone number
---@field protected exitZone number
---@field protected exitBlip number

---@field protected blip number
---@field protected difficultyIndex number


Robbery = {}
Robbery.__index = Robbery

setmetatable(Robbery, {
    __call = function(_, receivedId, robberyInfos)
        local self = setmetatable({}, Robbery);
        self.isActive = true
        self.id = receivedId
        self.difficultyIndex = robberyInfos.difficultyIndex
        self.interior = robberyInfos.interior
        self.possibleObjects = robberyInfos.possibleObjects
        self.possibleOponents = robberyInfos.possibleOponents
        self.name = robberyInfos.name
        self.savedInfos = robberyInfos
        self.blip = KaizoSBlipsManager.createPublic(robberyInfos.entry, 811, 47, 0.7, "Cambriolage", true)
        self.entryZone = NewlandSZonesManager.createPublic(robberyInfos.entry, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:openMenu(source)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la serrure", 25.0, 1.0)
        self.exitZone = NewlandSZonesManager.createPrivate(NewKaizoSharedRobberiesInteriors[self.interior].out, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:exitRobbery(source, false)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour sortir de cette propriétée", 150.0, 1.0, {})
        self.exitBlip = KaizoSBlipsManager.createPrivate(NewKaizoSharedRobberiesInteriors[self.interior].out, 126, 69, 0.75, "Sortie", false)
        return self;
    end
})

---openMenu
---@public
---@return void
function Robbery:openMenu(source)
    NLServerUtils.toClient("robberiesOpenMenu", source, self.id, self.isActive, self.difficultyIndex)
end

---startCooldown
---@public
---@return void
function Robbery:startCooldown()
    NewKaizo.newWaitingThread(NewKaizo.second(60 * 15), function()
        self.entryZone = NewlandSZonesManager.createPublic(self.savedInfos.entry, 22, { r = 255, g = 0, b = 0, a = 255 }, function(source)
            self:openMenu(source)
        end, "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la serrure", 25.0, 1.0)
        self.blip = KaizoSBlipsManager.createPublic(self.savedInfos.entry, 171, 47, 0.6, "Cambriolage", true)
        self.isActive = true
    end)
end

---handleStart
---@public
---@return void
function Robbery:handleStart(source)
    if not self.isActive then
        TriggerClientEvent("esx:showNotification", source, "Cette propriétée se fait déjà cambrioler")
        return
    end
    NewKaizoSRobberiesManager.players[source] = { id = self.id, bag = {} }
    --SetPlayerRoutingBucket(source, (15000 + source))
    KaizoSBlipsManager.delete(self.blip)
    NewlandSZonesManager.delete(self.entryZone)
    NLServerUtils.toClient("robberiesStart", source)
    NLServerUtils.toClient("playScenario", source, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", NewKaizo.second(30), true)
    self.isActive = false
    NewKaizo.newWaitingThread(NewKaizo.second(30), function()
        self:startCooldown()
        NLServerUtils.toClient("robberiesEnter", source, { outSideRobbery = self.savedInfos.entry, entryRobbery = NewKaizoSharedRobberiesInteriors[self.interior].entry, possibleOponents = self.possibleOponents, objects = self.possibleObjects, itemsTable = NewKaizoSharedRobberiesItems, special = self.savedInfos.specialTaskOnPed or 0 })
        NewlandSZonesManager.addAllowed(self.exitZone, source)
        KaizoSBlipsManager.addAllowed(self.exitBlip, source)
    end)
end

---exitRobbery
---@public
---@return void
function Robbery:exitRobbery(source, failed)
    if not failed then
        local total = 0
        for k, v in pairs(NewKaizoSRobberiesManager.players[source].bag) do
            total = total + v.price
        end
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney("dirtycash", total)
        print(total)
        TriggerClientEvent("esx:showNotification", source, ("Bravo! Vous remportez %s$ pour votre cambriolage !"):format(total))
        if total > 0 then
            NLServerUtils.webhook(("%s a réussi le cambriolage \"__%s__\" pour __%s__$"):format(GetPlayerName(source), self.name, total), "green", "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR")
        else
            NLServerUtils.webhook(("%s a réussi le cambriolage \"__%s__\" sans rien emporter"):format(GetPlayerName(source), self.name), "orange", "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR")
        end
    end
    NewKaizoSRobberiesManager.players[source] = nil
    SetPlayerRoutingBucket(source, 0)
    NewlandSZonesManager.removeAllowed(self.exitZone, source)
    KaizoSBlipsManager.removeAllowed(self.exitBlip, source)
    NLServerUtils.toClient("destroy", source, "robb")
    NLServerUtils.toClient("robberiesExit", source, self.savedInfos.entry)
    if failed then
        NLServerUtils.webhook(("%s est mort dans le cambriolage \"__%s__\""):format(GetPlayerName(source),self.name), "red", "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR")
    end
end
