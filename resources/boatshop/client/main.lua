-----------------------
-------- Décla --------
-----------------------
ESX = nil

if ConfigBoat.Debug == true then print = printcacao end

SwLife = {}
SwLife.NewThread = Citizen.CreateThread
SwLife.InternalToServer = TriggerServerEvent
SwLife.init = TriggerEvent
SwLife.NewThread(function()
	while ESX == nil do
		SwLife.init(ConfigBoat.Init, function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
end)

-------------------
------- Pos -------
-------------------

local BoatLoca = {
    {x = -756.85, y = -1489.81, z = 4.0, h = 301.46}
}

local Garages = {
    {x = -772.4, y = -1430.9, z = 0.5, h = 149.51},

    {x = 3864.9, y = 4463.9, z = 1.6, h = 99.6},
            
    {x = -1614.0, y = 5260.1, z = 2.8, h = 197.6},
        
    {x = 712.6, y = 4093.3, z = 33.7},
        
    {x = 23.8, y = -2806.8, z = 4.8},

    {x = 4764.13, y = -4779.65, z = 2.8},

    {x = -3427.3, y = 956.9, z = 7.3}

}

local RangerBateaux = {
    {x = -798.4, y = -1456.0, z = 1.0},

    {x = 3857.0, y = 4446.9, z = 1.0},
            
    {x = -1600.3, y = 5261.9, z = 1.0},
        
    {x = 705.1, y = 4110.1, z = 31.2},
        
    {x = -1.0, y = -2799.2, z = 1.5},

    {x = 4756.67, y = -4790.07, z = 1.5},

    {x = -3436.5, y = 946.6, z = 1.3}
}

local Fourr = {
    {x = -700.8, y = -1401.65, z = 4.5, h = 158.14}
}

-----------------------
-------- Main ---------
-----------------------

local sBoat = {}

RMenu.Add('boatshop', 'main', RageUI.CreateMenu("Boutique de Bateaux", "~b~Achetez vos bateaux"))
RMenu.Add('boatshop', 'listevehicule', RageUI.CreateSubMenu(RMenu:Get('boatshop', 'main'), "Catalogue", "~b~Voici la liste de nos bateaux"))
RMenu:Get('boatshop', 'main').EnableMouse = false
RMenu:Get('boatshop', 'main').Closed = function() sBoat.Menu = false FreezeEntityPosition(GetPlayerPed(-1), false) end

local boatgrr = {}

function OpenBoatShopMenu()

	if sBoat.Menu then
        sBoat.Menu = false
    else
        sBoat.Menu = true
        RageUI.Visible(RMenu:Get('boatshop', 'main'), true)
        FreezeEntityPosition(GetPlayerPed(-1), true)

        SwLife.NewThread(function()
			while sBoat.Menu do
                x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                RageUI.IsVisible(RMenu:Get('boatshop', 'main'), true, true, true, function()
					RageUI.ButtonWithStyle("Achetez vos bateaux", nil, {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                    end,RMenu:Get("boatshop","listevehicule"))
                end)
                RageUI.IsVisible(RMenu:Get('boatshop', 'listevehicule'), true, false, true, function()
                    RageUI.ButtonWithStyle("Jetski (couleur aléatoire)", "Prix : ~b~7500$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('jetski', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'seashark'
                                    local price = 7500
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Suntrap", "Prix : ~b~10000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Suntrap', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'suntrap'
                                    local price = 10000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Jetmax", "Prix : ~b~45000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Jetmax', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'jetmax'
                                    local price = 45000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Tropic", "Prix : ~b~65000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Jetmax', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'tropic2'
                                    local price = 65000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)

                        end
                    end)

                    RageUI.ButtonWithStyle("Dinghy (Black)", "Prix : ~b~32500$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Dinghy', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'dinghy2'
                                    local price = 32500
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end     
                    end)

                    RageUI.ButtonWithStyle("Dinghy (couleur aléatoire)", "Prix : ~b~40000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Dinghya', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'dinghy'
                                    local price = 40000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Speeder", "Prix : ~b~85000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Speeder', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'speeder'
                                    local price = 85000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Toro", "Prix : ~b~200000$", {RightLabel = "~y~Acheter~s~ →"}, true, function(h,a,s)
                        if s then
                            ESX.TriggerServerCallback('Toro', function(suffisantsous)
                                if suffisantsous then
                                    local vehicle = 'toro'
                                    local price = 200000
                                    local playerPed = PlayerPedId()
                                    ESX.Game.SpawnVehicle(vehicle, {x = x, y = y, z = z}, 251.959, function (vehicle)
                                        table.insert(boatgrr, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetModelAsNoLongerNeeded(vehicle)
                                        local plaque = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(boatgrr[#boatgrr])
                                        printcacao(vehicleProps)
                                        vehicleProps.plate = plaque
                                        printcacao(vehicleProps.plate)
                                        SwLife.InternalToServer('payeboat', vehicleProps)
                                        ESX.Game.DeleteVehicle(vehicle)
                                    end)
                                else
                                    ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                end
                            end)
                        end
                    end)
                end)
				Wait(0)
			end
		end)
	end
end

local sGarageBoat = {}

RMenu.Add('boatgarage', 'main1', RageUI.CreateMenu("Vos bateaux", "~b~Sortez vos bateaux"))
RMenu.Add('boatgarage', 'listebateaux', RageUI.CreateSubMenu(RMenu:Get('boatgarage', 'main1'), "Garage", "~b~Voici la liste de vos bateaux"))
RMenu:Get('boatgarage', 'main1').EnableMouse = false
RMenu:Get('boatgarage', 'main1').Closed = function() sGarageBoat.Menu = false FreezeEntityPosition(GetPlayerPed(-1), false) end

local boataspawn = {}

--local spawnpoint = {
  --  {x = -772.4, y = -1430.9, z = 0.5},

  --  {x = 3864.9, y = 4463.9, z = 1.6},
            
  --  {x = -1614.0, y = 5260.1, z = 2.8},
        
  --  {x = 712.6, y = 4093.3, z = 33.7},
        
   -- {x = 23.8, y = -2806.8, z = 4.8},
--
   -- {x = 4764.13, y = -4779.65, z = 2.8},

  --  {x = -3427.3, y = 956.9, z = 7.3}
--}

local spawnpoint = nil

function OpenBoatGarage()
    ESX.TriggerServerCallback('::{razzway.xyz}::getGarage', function(ownedBoats)
        if sGarageBoat.Menu then
            sGarageBoat.Menu = false
        else
            sGarageBoat.Menu = true
            RageUI.Visible(RMenu:Get('boatgarage', 'main1'), true)
            FreezeEntityPosition(GetPlayerPed(-1), true)

            SwLife.NewThread(function()
                while sGarageBoat.Menu do
                    local pos1 = vector3(-772.4, -1430.9, 0.5)
                    local pos2 = vector3(3864.9, 4463.9, 1.6)
                    local pos3 = vector3(-1614.0, 5260.1, 2.8)
                    local pos4 = vector3(712.6, 4093.3, 33.7)
                    local pos5 = vector3(23.8, -2806.8, 4.8)
                    local pos6 = vector3(4764.13, -4779.65, 2.8)
                    local pos7 = vector3(-3427.3, 956.9, 7.3)
                    local coords = GetEntityCoords(PlayerPedId(), false)
                    RageUI.IsVisible(RMenu:Get('boatgarage', 'main1'), true, true, true, function()
                        RageUI.ButtonWithStyle("Sortez vos bateaux", nil, {RightLabel = "→→"}, true, function(h,a,s)
                        end,RMenu:Get("boatgarage","listebateaux"))
                    end)

                        RageUI.IsVisible(RMenu:Get('boatgarage', 'listebateaux'), true, false, false, function()
                            --ESX.TriggerServerCallback('::{razzway.xyz}::getGarage', function (ownedBoats)
                                --if #ownedBoats == 0 then
                                   -- ESX.ShowNotification("Vous n'avez aucun bateau")
                                   -- RageUI.CloseAll()
                               -- else
                                    for _,v in pairs(ownedBoats) do
                                        local hashvoiture = v.vehicle.model
                                        local modelevoiturespawn = v.vehicle
                                        local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
                                        local nomvoituretexte  = GetLabelText(nomvoituremodele)
                                        local plaque = v.plate
                                        local playerPed = PlayerPedId()
                                        if nomvoituremodele == 'TROPIC' then
                                            nomvoituremodele = "Tropic"
                                        elseif nomvoituremodele == 'TORO' then
                                            nomvoituremodele = "Toro"
                                        elseif nomvoituremodele == 'SEASHARK' then
                                            nomvoituremodele = "Jetski"
                                        elseif nomvoituremodele == 'DINGHY' then
                                            nomvoituremodele = "Dinghy"
                                        elseif nomvoituremodele == 'SUNTRAP' then
                                            nomvoituremodele = "Suntrap"
                                        elseif nomvoituremodele == 'SPEEDER' then
                                            nomvoituremodele = "Speeder"
                                        elseif nomvoituremodele == 'JETMAX' then
                                            nomvoituremodele = "Jetmax"
                                        end
                                        if v.state then
                                            RageUI.ButtonWithStyle("Nom : "..nomvoituremodele.. "", nil, {RightLabel = "~y~Sortir~s~ →"}, true, function(h,a,s)
                                                if s then
                                                    if #(coords - pos1) < 10 / 2 then
                                                             spawnpoint = vector3(-785.39, -1426.3, 0.0)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                                            printcacao(modelevoiturespawn)
                                                            printcacao(plaque)
                                                            printcacao(spawnpoint)
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 146.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                            --RageUI.CloseAll()
                                                        --else
                                                        -- ESX.ShowNotification("Le garage est bloqué.")
                                                    -- end

                                                    elseif #(coords - pos2) < 10 / 2 then
                                                        spawnpoint = vector3(3854.4, 4477.2, 0.0)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 273.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                           -- RageUI.CloseAll()
                                                    -- else
                                                        --  ESX.ShowNotification("Le garage est bloqué.")
                                                    --  end

                                                    elseif #(coords - pos3) < 10 / 2 then
                                                        spawnpoint = vector3(-1622.5, 5247.1, 0.0)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 21.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                            --RageUI.CloseAll()
                                                    --  else
                                                        --    ESX.ShowNotification("Le garage est bloqué.")
                                                    --  end

                                                    elseif #(coords - pos4) < 10 / 2 then
                                                        spawnpoint = vector3(712.8, 4080.2, 29.3)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 181.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                            --RageUI.CloseAll()
                                                    --  else
                                                    --      ESX.ShowNotification("Le garage est bloqué.")
                                                    -- end

                                                    elseif #(coords - pos5) < 10 / 2 then
                                                        spawnpoint = vector3(23.3, -2828.6, 0.8)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 181.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                            --RageUI.CloseAll()
                                                    -- else
                                                        --    ESX.ShowNotification("Le garage est bloqué.")
                                                    -- end

                                                    elseif #(coords - pos6) < 10 / 2 then
                                                        spawnpoint = vector3(4749.01, -4765.37, 0.8)
                                                        --if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 147.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                           -- RageUI.CloseAll()
                                                        --else
                                                        --    ESX.ShowNotification("Le garage est bloqué.")
                                                    -- end

                                                    elseif #(coords - pos7) < 10 / 2 then
                                                        spawnpoint = vector3(-3448.9, 953.8, 0.0)
                                                    -- if ESX.Game.IsSpawnPointClear(spawnpoint, 4.0) then
                                                            SwLife.InternalToServer('::{razzway.xyz}::takeOutVehicle', plaque)
                                                            ESX.ShowNotification("Vous avez sortit votre bateau. Bonne navigation !")
                                        
                                                            ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 147.0, function(vehicle)
                                                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                                ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                            end)
                                        
                                                            --RageUI.CloseAll()
                                                    -- else
                                                        --  ESX.ShowNotification("Le garage est bloqué.")
                                                    -- end
                                                    end

                                                end
                                            end)
                                        else
                                            RageUI.ButtonWithStyle("Nom : "..nomvoituremodele.. "", nil, {RightLabel = "~y~Véhicule sortit~s~ →"}, true, function(h,a,s)
                                                if s then
                                                end
                                            end)
                                        end
                                    end
                                --end
                            --end)
                        end)
                   -- end)

                    Wait(0)
                end
            end)
        end
    end)
end

local sFour = {}

RMenu.Add('boatfoufou', 'main', RageUI.CreateMenu("Vos bateaux", "~b~Récupérez vos bateaux"))
RMenu.Add('boatfoufou', 'listebateaux', RageUI.CreateSubMenu(RMenu:Get('boatfoufou', 'main'), "Garage", "~b~Voici la liste de vos bateaux"))
RMenu:Get('boatfoufou', 'main').EnableMouse = false
RMenu:Get('boatfoufou', 'main').Closed = function() sFour.Menu = false FreezeEntityPosition(GetPlayerPed(-1), false) end

function OpenBoatFourriere()
    ESX.TriggerServerCallback('::{razzway.xyz}::getFourriere', function(ownedBoats)
        if sFour.Menu then
            sFour.Menu = false
        else
            sFour.Menu = true
            RageUI.Visible(RMenu:Get('boatfoufou', 'main'), true)
            FreezeEntityPosition(GetPlayerPed(-1), true)

            SwLife.NewThread(function()
                while sFour.Menu do
                    RageUI.IsVisible(RMenu:Get('boatfoufou', 'main'), true, true, true, function()
                        RageUI.ButtonWithStyle("Récupérez vos bateaux", nil, {RightLabel = "→→"}, true, function(h,a,s)
                        end,RMenu:Get("boatfoufou","listebateaux"))
                    end)

                    RageUI.IsVisible(RMenu:Get('boatfoufou', 'listebateaux'), true, false, false, function()
                        for _,v in pairs(ownedBoats) do
                            local hashvoiture = v.vehicle.model
                            local modelevoiturespawn = v.vehicle
                            local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
                            local nomvoituretexte  = GetLabelText(nomvoituremodele)
                            local plaque = v.plate
                            local playerPed = PlayerPedId()
                            if nomvoituremodele == 'TROPIC' then
                                nomvoituremodele = "Tropic"
                            elseif nomvoituremodele == 'TORO' then
                                nomvoituremodele = "Toro"
                            elseif nomvoituremodele == 'SEASHARK' then
                                nomvoituremodele = "Jetski"
                            elseif nomvoituremodele == 'DINGHY' then
                                nomvoituremodele = "Dinghy"
                            elseif nomvoituremodele == 'SUNTRAP' then
                                nomvoituremodele = "Suntrap"
                            elseif nomvoituremodele == 'SPEEDER' then
                                nomvoituremodele = "Speeder"
                            elseif nomvoituremodele == 'JETMAX' then
                                nomvoituremodele = "Jetmax"
                            end
                            if not v.state then
                                RageUI.ButtonWithStyle("Nom : "..nomvoituremodele.. "", nil, {RightLabel = "~y~5000$~s~ →"}, true, function(h,a,s)
                                    if s then
                                        ESX.TriggerServerCallback('Fourr', function(suffisantsous)
                                            if suffisantsous then
                                                spawnpoint = vector3(-785.39, -1426.3, 0.0)
                                                ESX.ShowNotification("Vous avez récupérer votre bateau. Bonne navigation !")
                                                
                                                ESX.Game.SpawnVehicle(modelevoiturespawn.model, spawnpoint, 146.0, function(vehicle)
                                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                                    ESX.Game.SetVehicleProperties(vehicle, modelevoiturespawn)
                                                end)
                                            else
                                                ESX.ShowNotification('Tu n\'as pas assez d argent!')
                                            end
                                        end)
                                    end
                                end)
                            else
                                RageUI.ButtonWithStyle("Nom : "..nomvoituremodele.. " n'est pas en fourrière", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, function(h,a,s)
                                    if s then
                                    end
                                end)
                            end
                        end
                    end)
                    Wait(0)
                end
            end)
        end
    end)
end

----------------------
------- Check --------
----------------------

SwLife.NewThread(function()
    while true do
        local delay = 500

        local pCoords = GetEntityCoords(GetPlayerPed(-1), false)

        for k,v in pairs(BoatLoca) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, BoatLoca[k].x, BoatLoca[k].y, BoatLoca[k].z)
            if not sBoat.Menu then
                if distance <= 10.0 then
                    delay = 1
                    Draw3DText(BoatLoca[k].x, BoatLoca[k].y, 29.8, "Appuyez sur ~b~E~s~ pour accéder à ~b~au boat shop")
                    --DrawMarker(6, BoatLoca[k].x, BoatLoca[k].y, BoatLoca[k].z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 128, 255, 170, 0, 0, 0, 1, nil, nil, 0)
                
                    if distance <= 1.5 then
                        ShowHelpNotification("Appuyez sur ~b~E~s~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            OpenBoatShopMenu()
                        end
                    end
                end
            end
        end

        for k,v in pairs(Garages) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, Garages[k].x, Garages[k].y, Garages[k].z)
            if not sGarageBoat.Menu then
                if distance <= 10.0 then
                    delay = 1
                    Draw3DText(Garages[k].x, Garages[k].y, 29.8, "Appuyez sur ~b~E~s~ pour ouvrir votre ~b~garage")
                    --DrawMarker(6, Garages[k].x, Garages[k].y, Garages[k].z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 128, 255, 170, 0, 0, 0, 1, nil, nil, 0)
                
                    if distance <= 1.5 then
                        ShowHelpNotification("Appuyez sur ~b~E~s~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            OpenBoatGarage()
                        end
                    end
                end
            end
        end

        for k,v in pairs(RangerBateaux) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, RangerBateaux[k].x, RangerBateaux[k].y, RangerBateaux[k].z)
            if not sGarageBoat.Menu then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    if distance <= 25.0 then
                        delay = 1
                        Draw3DText(RangerBateaux[k].x, RangerBateaux[k].y, 29.8, "Appuyez sur ~b~E~s~ pour ranger votre ~b~bateau")
                        DrawMarker(28, RangerBateaux[k].x, RangerBateaux[k].y, RangerBateaux[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
                    
                        if distance <= 10.0 then
                            ShowHelpNotification("Appuyez sur ~b~E~s~ pour ranger votre bateau")
                            if IsControlJustPressed(0, 51) then
                                local playerPed    = GetPlayerPed(-1)
                                local coords       = GetEntityCoords(playerPed)
                                local vehicle      = GetVehiclePedIsIn(playerPed, false)
                                local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                                local current 	   = GetPlayersLastVehicle(GetPlayerPed(-1), true)
                                local engineHealth = GetVehicleEngineHealth(current)
                                local plate        = vehicleProps.plate
                                ESX.Game.DeleteVehicle(vehicle)
                                ESX.ShowNotification("Votre véhicule a été rangé !")
                                SwLife.InternalToServer('::{razzway.xyz}::storeVehicle', vehicleProps, true)
                            end
                        end
                    end
                elseif not IsPedInAnyVehicle(PlayerPedId(), false) then
                    if distance <= 25.0 then
                        delay = 1
                       -- Draw3DText(Garages[k].x, Garages[k].y, 29.8, "Appuyez sur ~b~E~s~ pour ranger votre ~b~bateau")
                       DrawMarker(28, RangerBateaux[k].x, RangerBateaux[k].y, RangerBateaux[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
                    
                        if distance <= 10.0 then
                            --ShowHelpNotification("Appuyez sur ~b~E~s~ pour ranger votre bateau")
                            if IsControlJustPressed(0, 51) then
                            end
                        end
                    end
                end
            end
        end

        for k,v in pairs(Fourr) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, Fourr[k].x, Fourr[k].y, Fourr[k].z)
            if not sFour.Menu then
                if distance <= 10.0 then
                    delay = 1
                    Draw3DText(Fourr[k].x, Fourr[k].y, 29.8, "Appuyez sur ~b~E~s~ pour ouvrir le ~b~menu")
                    --DrawMarker(6, Fourr[k].x, Fourr[k].y, Fourr[k].z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 128, 255, 170, 0, 0, 0, 1, nil, nil, 0)
                
                    if distance <= 1.5 then
                        ShowHelpNotification("Appuyez sur ~b~E~s~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            OpenBoatFourriere()
                        end
                    end
                end
            end
        end

        Citizen.Wait(delay)
        
    end
end)

-----------------------
-------- Blips --------
-----------------------

SwLife.NewThread(function()
    print("Debug is actually set to false, credit for this script is for Alcao#0001")
    printcacao("Debug is actually set to true, credit for this script is for Alcao#0001")
    for k in pairs(BoatLoca) do
       local blipBoatLoca = AddBlipForCoord(BoatLoca[k].x, BoatLoca[k].y, BoatLoca[k].z)
       SetBlipSprite(blipBoatLoca, 427)
       SetBlipColour(blipBoatLoca, 3)
       SetBlipScale(blipBoatLoca, 0.6)
       SetBlipAsShortRange(blipBoatLoca, true)

       BeginTextCommandSetBlipName('STRING')
       AddTextComponentString("Boatshop")
       EndTextCommandSetBlipName(blipBoatLoca)
   end

   for k in pairs(Fourr) do
        local fourriere = AddBlipForCoord(Fourr[k].x, Fourr[k].y, Fourr[k].z)
        SetBlipSprite(fourriere, 427)
        SetBlipColour(fourriere, 3)
        SetBlipScale(fourriere, 0.6)
        SetBlipAsShortRange(fourriere, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Fourrière à bateaux")
        EndTextCommandSetBlipName(fourriere)
    end

    for k in pairs(Garages) do
        local blipBoatGarage = AddBlipForCoord(Garages[k].x, Garages[k].y, Garages[k].z)
        SetBlipSprite(blipBoatGarage, 356)
        SetBlipColour(blipBoatGarage, 3)
        SetBlipScale(blipBoatGarage, 0.6)
        SetBlipAsShortRange(blipBoatGarage, true)
 
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Garage à bateaux")
        EndTextCommandSetBlipName(blipBoatGarage)
    end
end)

-----------------------
-------- Peds ---------
-----------------------

CreateThread(function()
    for k,v in pairs(BoatLoca) do
        local hash = GetHashKey("a_m_y_smartcaspat_01")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(2000)
        end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_smartcaspat_01", BoatLoca[k].x, BoatLoca[k].y, BoatLoca[k].z, BoatLoca[k].h, false, true) 
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        
        local blipauto = AddBlipForCoord(-2187.3, -409.25, 13.12)
        SetBlipSprite (blipauto, 498)
        SetBlipDisplay(blipauto, 4)
        SetBlipScale  (blipauto, 0.7)
        SetBlipAsShortRange(blipauto, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Auto Ecole")
        EndTextCommandSetBlipName(blipauto)
    end

    for k,v in pairs(Garages) do
        local hash = GetHashKey("a_m_y_smartcaspat_01")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(2000)
        end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_smartcaspat_01", Garages[k].x, Garages[k].y, Garages[k].z, Garages[k].h, false, true) 
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        
        local blipauto = AddBlipForCoord(-2187.3, -409.25, 13.12)
        SetBlipSprite (blipauto, 498)
        SetBlipDisplay(blipauto, 4)
        SetBlipScale  (blipauto, 0.7)
        SetBlipAsShortRange(blipauto, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Auto Ecole")
        EndTextCommandSetBlipName(blipauto)
    end

    for k,v in pairs(Fourr) do
        local hash = GetHashKey("a_m_y_smartcaspat_01")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(2000)
        end
        local ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_smartcaspat_01", Fourr[k].x, Fourr[k].y, Fourr[k].z, Fourr[k].h, false, true) 
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        
        local blipauto = AddBlipForCoord(-2187.3, -409.25, 13.12)
        SetBlipSprite (blipauto, 498)
        SetBlipDisplay(blipauto, 4)
        SetBlipScale  (blipauto, 0.7)
        SetBlipAsShortRange(blipauto, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Auto Ecole")
        EndTextCommandSetBlipName(blipauto)
    end
end)

-----------------------
-------- Util ---------
-----------------------

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		generatedPlate = string.upper(GetRandomLetter(ConfigBoat.PlateLetters) .. GetRandomNumber(ConfigBoat.PlateNumbers))

		ESX.TriggerServerCallback('plaquebateau', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GenerateSocietyPlate(societyPlate)
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		generatedPlate = string.upper(societyPlate .. GetRandomNumber(ConfigBoat.PlateNumbers))

		ESX.TriggerServerCallback('plaquebateau', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('plaquebateau', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())

	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())

	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

function ShowHelpNotification(msg)
    AddTextEntry('HelpNotification', msg)
	BeginTextCommandDisplayHelp('HelpNotification')
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
