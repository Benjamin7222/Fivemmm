
function CustomAmount()
    local montant = nil
    AddTextEntry("BANK_CUSTOM_AMOUNT", "Entrez le montant")
    DisplayOnscreenKeyboard(1, "BANK_CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        montant = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(montant)
end

function setUniform(value, plyPed)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:getSkin', function(skina)
            if value == 'torso' then
                if skin.torso_1 ~= skina.torso_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15 })
                end
            elseif value == 'pants' then
                if skin.pants_1 ~= skina.pants_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2 })
                else
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skina, { ['pants_1'] = 55, ['pants_2'] = 0 })
                    else
                        TriggerEvent('skinchanger:loadClothes', skina, { ['pants_1'] = 15, ['pants_2'] = 0 })
                    end
                end
            elseif value == 'shoes' then
                if skin.shoes_1 ~= skina.shoes_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2 })
                else
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skina, { ['shoes_1'] = 49, ['shoes_2'] = 0 })
                    else
                        TriggerEvent('skinchanger:loadClothes', skina, { ['shoes_1'] = 35, ['shoes_2'] = 0 })
                    end
                end
            elseif value == 'bproof' then
                if skin.bproof_1 ~= skina.bproof_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['bproof_1'] = 0, ['bproof_2'] = 0 })
                end
            end
        end)
    end)
end

function setAccess(value, plyPed)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:getSkin', function(skina)
            if value == 'mask' then
                if skin.mask_1 ~= skina.mask_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['mask_1'] = 0, ['mask_2'] = 0 })
                end
            elseif value == 'chain' then
                if skin.chain_1 ~= skina.chain_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['chain_1'] = skin.chain_1, ['chain_2'] = skin.chain_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['chain_1'] = 0, ['chain_2'] = 0 })
                end
            elseif value == 'helmet' then
                if skin.helmet_1 ~= skina.helmet_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['helmet_1'] = -1, ['helmet_2'] = 0 })
                end
            elseif value == 'bag' then
                if skin.bags_1 ~= skina.bags_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['bags_1'] = 0, ['bags_2'] = 0 })
                end
            elseif value == 'glasses' then
                if skin.glasses_1 ~= skina.glasses_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['glasses_1'] = skin.glasses_1, ['glasses_2'] = skin.glasses_2 })
                else
                    if skin.sex == 0 then
                        TriggerEvent('skinchanger:loadClothes', skina, { ['glasses_1'] = 0, ['glasses_2'] = 0 })
                    else
                        TriggerEvent('skinchanger:loadClothes', skina, { ['glasses_1'] = 5, ['glasses_2'] = 0 })
                    end
                end
            elseif value == 'ears' then
                if skin.ears_1 ~= skina.ears_1 then
                    TriggerEvent('skinchanger:loadClothes', skina, { ['ears_1'] = skin.ears_1, ['ears_2'] = skin.ears_2 })
                else
                    TriggerEvent('skinchanger:loadClothes', skina, { ['ears_1'] = 0, ['ears_2'] = 0 })
                end
            end
        end)
    end)
end

