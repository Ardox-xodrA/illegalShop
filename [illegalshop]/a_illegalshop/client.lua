ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RMenu.Add('illegalshop', 'main', RageUI.CreateMenu("Darius", "Achète à Darius des objets illégaux"))
RMenu.Add('illegalshop', 'armes blanches', RageUI.CreateSubMenu(RMenu:Get('illegalshop', 'main'), "Armes Blanches", "Vente ~r~D'Armes Blanches"))
RMenu.Add('illegalshop', 'drogues', RageUI.CreateSubMenu(RMenu:Get('illegalshop', 'main'), "Drogues", "Vente ~r~De Drogues"))





Citizen.CreateThread(function()
    while true do
         RageUI.IsVisible(RMenu:Get('illegalshop', 'main'), true, true, true, function()
          
      RageUI.Button("Armes Blanches", "Les armes à feux ne sont pas discrète, prend une ~r~Arme blanche", {RightLabel = "→→→"},true, function()
      end, RMenu:Get('illegalshop', 'armes blanches'))

      RageUI.Button("Drogues", "Tu Veut te ~r~Défoncer ~w~? Ou ~r~Vendre Ta Came?", {RightLabel = "→→→"},true, function()
      end, RMenu:Get('illegalshop', 'drogues'))
    end, function()
    end)
 
--Sous menu armes blanches

        RageUI.IsVisible(RMenu:Get('illegalshop', 'armes blanches'), true, true, true, function()
            
            RageUI.Button("Poignard", "Avec ça tu pourras faire couler le ~r~sang", {RightLabel = "~g~ 5000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyPoignard')
                end 
            end) 

            RageUI.Button("Hachette", "Avec ça tu pourras faire couler le ~r~sang", {RightLabel = "~g~ 10000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyHachette')
                end 
            end) 
        end, function()
        end)

--Sous menu drogues

            RageUI.IsVisible(RMenu:Get('illegalshop', 'drogues'), true, true, true, function()
                 
            RageUI.Button("~g~Weed", "Avec ça tu pourras te ~r~Défoncer ~w~! Ou la ~r~Vendre ~w~! ~r~sang", {RightLabel = "~g~ 95$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyWeed')
                end 
            end)
            
            RageUI.Button("Coke", "Avec ça tu pourras te ~r~Défoncer ~w~! Ou la ~r~Vendre ~w~! ~r~sang", {RightLabel = "~g~ 150$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyCoke')
                end 
            end) 

            RageUI.Button("~y~Opium", "Avec ça tu pourras te ~r~Défoncer ~w~! Ou la ~r~Vendre ~w~! ~r~sang", {RightLabel = "~g~ 250$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyOpium')
                end 
            end) 

            RageUI.Button("~b~Meth", "Avec ça tu pourras te ~r~Défoncer ~w~! Ou la ~r~Vendre ~w~! ~r~sang", {RightLabel = "~g~ 350$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('player:BuyMeth')
                end 
            end)
 

            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)










    local position = {
        {x = 436.39 , y = -1883.17, z = 31.73, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Appuyez sur [~r~E~w~] pour parler à ~r~Darius",
                        time_display = 1
                    })
                   -- ESX.ShowHelpNotification("Appuyez sur [~r~E~w~] pour parler à ~r~Darius")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('illegalshop', 'main'), not RageUI.Visible(RMenu:Get('illegalshop', 'main')))
                    end
                end
            end
        end
    end)
    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_old_man2")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_old_man2", 436.47, -1883.28, 30.73, 197.78, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)