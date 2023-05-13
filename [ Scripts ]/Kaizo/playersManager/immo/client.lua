
AddEventHandler('esx_realestateagentjob:hasEnteredMarker', function(zone)

    if zone == 'OfficeEnter' then
      local playerPed = PlayerPedId()
      SetEntityCoords(playerPed,  Configi.Zones.OfficeInside.Pos.x,  Configi.Zones.OfficeInside.Pos.y,  Configi.Zones.OfficeInside.Pos.z)
    end
  
    if zone == 'OfficeExit' then
      local playerPed = PlayerPedId()
      SetEntityCoords(playerPed,  Configi.Zones.OfficeOutside.Pos.x,  Configi.Zones.OfficeOutside.Pos.y,  Configi.Zones.OfficeOutside.Pos.z)
    end
end)
  
AddEventHandler('esx_realestateagentjob:hasExitedMarker', function(zone)
    CurrentAction = nil
end)