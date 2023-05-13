
Config = {
   armeitem = false, -- Oui : true | Non : false
   gradeopenmenu = {"_dev"},
   OpenBuilderMenu = "F9",
}

---------------------Configuration : Ouverture Menu ---------------------
Keys.Register("F9", 'Builder', 'Ouvrir le menu Coffre Builder', function()
   ESX.TriggerServerCallback('pawal:verifrankstaff', function(group)
   playergroup = group
       for k,v in pairs(Config.gradeopenmenu) do
           if playergroup == v then
               menubuilder()
           end
       end
 end)
end)
--------------------------------------------------------------------------
