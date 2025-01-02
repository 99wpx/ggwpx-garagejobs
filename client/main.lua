local QBCore = exports['qb-core']:GetCoreObject()

function SpawnPed(location, heading)
    local model = GetHashKey('ig_trafficwarden')

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end

    local x, y, z = location.x, location.y, location.z
    local success, groundZ = GetGroundZFor_3dCoord(x, y, z, 0)

    local attempts = 0
    while not success and attempts < 10 do
        Wait(100)  
        success, groundZ = GetGroundZFor_3dCoord(x, y, z, 0)
        attempts = attempts + 1
    end
    if success then
        z = groundZ + 0.0
    else
        --print("Failed to find ground Z, using default Z")
        z = location.z - 0.8
    end

    local ped = CreatePed(4, model, x, y, z, heading, false, true)
    FreezeEntityPosition(ped, true) 
    SetBlockingOfNonTemporaryEvents(ped, true) 
    SetEntityInvincible(ped, true) 
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) 

    return ped
end


Citizen.CreateThread(function()
    for index, location in pairs(Config.Locations) do
        local ped = SpawnPed(location.pedLocation, location.pedHeading)
        if Config.typeTarget == "qb-target" then
            exports['qb-target']:AddTargetEntity(ped, {
                options = {
                    {
                        type = "client",
                        event = "garage:menu",
                        icon = "fas fa-warehouse",
                        label = "Open Garage",
                        job = location.job,
                        locationIndex = index 
                    },
                    {
                        type = "client",
                        event = "ggwpx:storecar",
                        icon = "fas fa-car",
                        label = "Store Vehicles",
                        job = location.job,
                        locationIndex = index 
                    }
                },
                distance = 2.5
            })
        elseif Config.typeTarget == "interact" then
            exports.interact:AddInteraction({
                coords = location.pedLocation,
                distance = 8.0,
                interactDst = 2.5,
                id = 'garage_' .. index,
                name = 'garage_interaction_' .. index,
                groups = { ['police'] = 2 },
                options = {
                    {
                        label = 'Open Garage',
                        action = function(entity, coords, args)
                            TriggerEvent('garage:menu', { locationIndex = index })
                        end,
                    },
                    {
                        label = 'Store Vehicles',
                        action = function(entity, coords, args)
                            TriggerEvent('ggwpx:storecar', { locationIndex = index })
                        end,
                    }
                }
            })
        end
    end
end)

RegisterNetEvent('garage:menu', function(data)
    local locationIndex = data.locationIndex 
    local location = Config.Locations[locationIndex]
    local menuOptions = {}

    table.insert(menuOptions, {
        id = 1,
        header = "Garage at Location " .. locationIndex,
        txt = "Select a vehicle"
    })

    for vehicleIndex, vehicle in ipairs(location.vehicles) do
        table.insert(menuOptions, {
            id = locationIndex * 10 + vehicleIndex,  
            header = vehicle.name,
            txt = vehicle.name,
            params = {
                event = "ggwpx:garage",
                args = { vehicle = vehicle.model, type = vehicle.type, index = locationIndex }
            }
        })
    end

    table.insert(menuOptions, {
        id = 1000,
        header = "Store Vehicle",
        txt = "Store Vehicle Inside Garage",
        params = {
            event = "ggwpx:storecar"
        }
    })
    exports['qb-menu']:openMenu(menuOptions)
end)

RegisterNetEvent('ggwpx:garage')
AddEventHandler('ggwpx:garage', function(data)
    local location = Config.Locations[data.index]  
    local vehicleModel = data.vehicle
    local vehicleType = data.type  --  'car' or 'heli'

    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == location.job then
            local spawnPoint
            if vehicleType == 'heli' then
                spawnPoint = location.HeliSpawn 
            else
                spawnPoint = location.VehicleSpawn 
            end
            QBCore.Functions.SpawnVehicle(vehicleModel, function(veh)
                SetVehicleNumberPlateText(veh, "JOB"..tostring(math.random(1000, 9999)))
                exports['cdn-fuel']:SetFuel(veh, 100.0)
                SetEntityHeading(veh, spawnPoint.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, spawnPoint, true)
        else
            QBCore.Functions.Notify('You are not authorized for this vehicle.', 'error')
        end
    end)
end)

RegisterNetEvent('ggwpx:storecar')
AddEventHandler('ggwpx:storecar', function()
    local car = GetVehiclePedIsIn(PlayerPedId(), true)
    QBCore.Functions.Notify('Vehicle Stored!')
    NetworkFadeOutEntity(car, true, false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)
