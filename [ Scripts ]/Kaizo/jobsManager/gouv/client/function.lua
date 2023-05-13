  RegisterNetEvent('gouv:putInVehicle')
  AddEventHandler('gouv:putInVehicle', function()
  
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
  
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
  
      local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)
  
      if DoesEntityExist(vehicle) then
  
        local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
        local freeSeat = nil
  
        for i=maxSeats - 1, 0, -1 do
          if IsVehicleSeatFree(vehicle,  i) then
            freeSeat = i
            break
          end
        end
  
        if freeSeat ~= nil then
          TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
        end
  
      end
  
    end
  
  end)
  
  
  RegisterNetEvent("gouv:OutVehicle")
  AddEventHandler("gouv:OutVehicle", function()
      TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
  end)
  
  
  local EnTrainEscorter = false
  local PolicierEscorte = nil
  RegisterNetEvent("gouv:drag")
  AddEventHandler("gouv:drag", function(player)
      EnTrainEscorter = not EnTrainEscorter
      print(EnTrainEscorter)
      PolicierEscorte = tonumber(player)
      if EnTrainEscorter then
          escort()
      end
  end)
  
  function escort()
      Citizen.CreateThread(function()
          local pPed = PlayerPedId()
          while EnTrainEscorter do
              Wait(1)
              pPed = PlayerPedId()
              local targetPed = GetPlayerPed(GetPlayerFromServerId(PolicierEscorte))
  
              if not IsPedSittingInAnyVehicle(targetPed) then
                  AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
              else
                  EnTrainEscorter = false
                  DetachEntity(pPed, true, false)
              end
  
              if IsPedDeadOrDying(targetPed, true) then
                  EnTrainEscorter = false
                  DetachEntity(pPed, true, false)
              end
          end
          DetachEntity(pPed, true, false)
      end)
  end
  
  function GetClosestPlayer()
      local pPed = PlayerPedId()
      local players = GetActivePlayers()
      local coords = GetEntityCoords(pPed)
      local pCloset = nil
      local pClosetPos = nil
      local pClosetDst = nil
      for k,v in pairs(players) do
          if GetPlayerPed(v) ~= pPed then
              local oPed = GetPlayerPed(v)
              local oCoords = GetEntityCoords(oPed)
              local dst = GetDistanceBetweenCoords(oCoords, coords, true)
              if pCloset == nil then
                  pCloset = v
                  pClosetPos = oCoords
                  pClosetDst = dst
              else
                  if dst < pClosetDst then
                      pCloset = v
                      pClosetPos = oCoords
                      pClosetDst = dst
                  end
              end
          end
      end
  
      return pCloset, pClosetDst
  end
  
  function MarquerJoueur()
    local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
    local pos = GetEntityCoords(ped)
    local target, distance = ESX.Game.GetClosestPlayer()
    if distance <= 4.0 then
    DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
  end
  end
  
  function getPlayerInv(player)
    Items = {}
    Armes = {}
    ArgentSale = {}
    
    ESX.TriggerServerCallback('gouv:getOtherPlayerData', function(data)
      for i=1, #data.accounts, 1 do
        if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
          table.insert(ArgentSale, {
            label    = ESX.Math.Round(data.accounts[i].money),
            value    = 'dirtycash',
            itemType = 'item_account',
            amount   = data.accounts[i].money
          })
    
          break
        end
      end
    
      for i=1, #data.weapons, 1 do
        table.insert(Armes, {
          label    = ESX.GetWeaponLabel(data.weapons[i].name),
          value    = data.weapons[i].name,
          right    = data.weapons[i].ammo,
          itemType = 'item_weapon',
          amount   = data.weapons[i].ammo
        })
      end
    
      for i=1, #data.inventory, 1 do
        if data.inventory[i].count > 0 then
          table.insert(Items, {
            label    = data.inventory[i].label,
            right    = data.inventory[i].count,
            value    = data.inventory[i].name,
            itemType = 'item_standard',
            amount   = data.inventory[i].count
          })
        end
      end
    end, GetPlayerServerId(player))
    end

    function getInventoryGouv()
      ESX.TriggerServerCallback('gouv:playerinventory', function(inventory)               
                  
          all_items = inventory
          
      end)
    end
    
    function getStockGouv()
      ESX.TriggerServerCallback('gouv:getStockItems', function(inventory)               
                  
          all_items = inventory
    
      end)
    end

    function RefreshMoneyGouv()
      if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
          ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
              societygouv = money
          end, "society_"..ESX.PlayerData.job.name)
      end
    end
    
function Updatessocietygouvmoney(money)
    societygouv = ESX.Math.GroupDigits(money)
end   
    
  
function RemoveServiceWeapons()
	local pPed = PlayerPedId()
	for k,v in pairs(cfg_gouv.serviceWeapons) do
		RemoveWeaponFromPed(pPed, GetHashKey(v))
	end
end
