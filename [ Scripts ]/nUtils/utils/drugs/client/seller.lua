SellDrugPointMenu = menu.CreateMenu("", "Gestion de l'illégal")
SellDrugPointSubMenu = menu.CreateSubMenu(SellDrugPointMenu, "", "Laboratoire(s) disponibles")
SellDrugPointMenu.Closed = function()  
    menu.Visible(SellDrugPointMenu, false) 
    menu.Visible(SellDrugPointSubMenu, false) 
    DrugsHandler.MenuIsOpen = false
    DrugsHandler.CurrentLabo = nil
    DrugsHandler.Infos = {}
    DrugsHandler.WaitingFor = false
    FreezeEntityPosition(PlayerPedId(), false)
end 

SellDrugPointSubMenu.Closed = function()
    DrugsHandler.WaitingFor = false
end

OpenSellDrugPointMenu = function()
    if DrugsHandler.MenuIsOpen then 
        DrugsHandler.MenuIsOpen = false 
        menu.Visible(SellDrugPointMenu,false)
    else
        DrugsHandler.MenuIsOpen = true 
        menu.Visible(SellDrugPointMenu, true)
        CreateThread(function()
            while DrugsHandler.MenuIsOpen do 
                FreezeEntityPosition(PlayerPedId(), true)
                menu.IsVisible(SellDrugPointMenu, function()
                    for drugs , value in pairs(DrugsHandler.Builds) do
                        menu.Button(drugs, false, {RightLabel = "→"}, true, {
                            onSelected = function()
                                DrugsHandler.CurrentLabo = drugs
                                Wait(180)
                                DrugsHandler.WaitingFor = true
                            end,
                            onActive = function()
                                RenderSprite("laboratory", DrugsHandler.Builds[drugs].Preview, 530, 0, 432, 259, 80)
                            end
                        },SellDrugPointSubMenu)
                    end
                end)
                menu.IsVisible(SellDrugPointSubMenu, function()
                    if DrugsHandler.WaitingFor == true then 
                        menu.Separator("↓ ~b~Laboratoire de "..DrugsHandler.CurrentLabo.." disponibles~s~ ↓")
                        for key, value in pairs (DrugsHandler.Builds[DrugsHandler.CurrentLabo].Labo) do 
                            menu.Button("Laboratoire de "..string.lower(DrugsHandler.CurrentLabo).." #"..key, "Prix d'achat : ~g~"..value.Price.."$~s~\nEndroit : ~b~"..DrugsHandler.Functions.GetZone(value.Entering), {RightLabel = "~g~Acheter~s~ →"}, true, {
                                onSelected = function()
                                    DrugsHandler.Infos = {Price = value.Price, Type = DrugsHandler.CurrentLabo, Value = key}
                                    TriggerServerEvent("Laboratories:BuyLaboratories", DrugsHandler.Infos)
                                    SellDrugPointMenu.Closed()
                                end
                            })
                        end 
                    end
                end)
                Wait(1)
            end
        end)
    end
end 
