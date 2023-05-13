Citizen.CreateThread(function()
    Wait(2500)
    TriggerServerEvent('ewen:RetreiveIsDead')
end)

RegisterNetEvent('ewen:PlayerIsDead')
AddEventHandler('ewen:PlayerIsDead', function()
    SetEntityHealth(PlayerPedId(), 0)
end)

local ReportListTable = {}

RegisterNetEvent('ewen:UpdateTableSignalEms')
AddEventHandler('ewen:UpdateTableSignalEms', function(table)
    ReportListTable = table
end)

local AppelsSelected = 0
local SrcSelected = 0
local AppelEnCours = false
local blip = nil
function OpenReportListEms()
    local menu = RageUI.CreateMenu('Emergency System', "Voici les appeles disponibles")
    local OpenSelectedAppel = RageUI.CreateSubMenu(menu, "Emergency System", 'Actions disponible')
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            for k,v in pairs(ReportListTable) do
                RageUI.Separator('~b~Appel en Attente')
                if v.status == 0 then
                    RageUI.Button('Appel N*'..v.numbers, 'Description : '..v.raison, {RightLabel = 'Fait à '..v.heures..'h'..v.minutes.. 'm'..v.secondes..'s'}, true, {
                        onSelected = function() 
                            SrcSelected = v.src
                            AppelsSelected = v.numbers
                        end
                    }, OpenSelectedAppel)
                end
            end
            for k,v in pairs(ReportListTable) do
                RageUI.Separator('~b~Appel en Cours')
                if v.status == 1 then
                    RageUI.Button('Appel N*'..v.numbers, 'Description : '..v.raison..'\nAppel pris par ~y~'..v.EMSName, {RightLabel = 'Fait à '..v.heures..'h'..v.minutes.. 'm'..v.secondes..'s'}, true, {
                        onSelected = function() 
                            SrcSelected = v.src
                            AppelsSelected = v.numbers
                        end
                    }, OpenSelectedAppel)
                end
            end
        end, function()
        end)
        RageUI.IsVisible(OpenSelectedAppel, function()
            RageUI.Separator('')
            RageUI.Separator('Appel N*~y~'..AppelsSelected)
            if ReportListTable[SrcSelected].status == 1 then
                StatusText = 'Pris par ~y~'..ReportListTable[SrcSelected].EMSName
            else 
                StatusText = '~b~Appels en attente'
            end
            RageUI.Separator('Status : '..StatusText)
            RageUI.Separator('')
            if ReportListTable[SrcSelected].status == 0 then
                RageUI.Button('Prendre l\'appel','Permet de prendre l\'appel, Vos collegues seront informer', {RightLabel = '>'}, true, {
                    onSelected = function()
                        if not AppelEnCours then
                            AppelEnCours = true
                            blip = AddBlipForCoord(ReportListTable[SrcSelected].position)
                            SetBlipColour(blip, 60)
                            SetBlipRoute(blip, true)
                            ESX.ShowNotification('Vous avez pris l\'appel N*'..AppelsSelected)
                            TriggerServerEvent('EMS:UpdateReport', SrcSelected, true) --> TRUE = PRENDRE
                        else
                            ESX.ShowNotification('Vous avez déjà un appel en cours. Cloture le pour en reprendre un.')
                        end
                    end
                })
            else
                if GetPlayerServerId(PlayerId()) == ReportListTable[SrcSelected].EMS_SRC then
                    RageUI.Button('Informer le patient de votre arriver',nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                            TriggerServerEvent('EMS:InformPatient', SrcSelected)
                        end
                    })
                    RageUI.Button('Terminer l\'appel',nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                            AppelEnCours = false
                            RemoveBlip(blip)
                            ESX.ShowNotification('Vous avez terminer l\'intervention N*'..AppelsSelected)
                            TriggerServerEvent('EMS:UpdateReport', SrcSelected, false)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(menu) and not RageUI.Visible(OpenSelectedAppel) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

RegisterNetEvent('EMS:ForceStopAppel')
AddEventHandler('EMS:ForceStopAppel', function()
    AppelEnCours = false
    RemoveBlip(blip)
end)