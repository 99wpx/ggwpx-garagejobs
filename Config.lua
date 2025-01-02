Config = {}

--=========================================================
--  _______   ______ ____    __    ____  ______   ___   ___ 
-- /  _____| /  ____|\   \  /  \  /   / |   _  \  \  \ /  / 
--|  |  __  |  |  __  \   \/    \/   /  |  |_)  |  \  V  /  
--|  | |_ | |  | |_ |  \            /   |   ___/    >   <   
--|  |__| | |  |__| |   \    /\    /    |  |       /  .  \  
-- \______|  \______|    \__/  \__/     |__|      /__/ \__\ 
--=========================================================
--      JOIN DISCORD : https://discord.gg/Q6AbZgkJFq
--=========================================================

Config.typeTarget = "interact" --- 'qb-target' , 'interact'

Config.Locations = {
    --Car police
    [1] = {
        pedLocation = vector3(459.9347, -986.5914, 25.6999), -- MRPD
        pedHeading = 95.4371,
        job = 'police',
        VehicleSpawn = vector4(452.2177, -985.6328, 25.6998, 168.1406),
        HeliSpawn = vector4(0, 0, 0, 0),
        vehicles = {
            { model = 'Police', name = 'Police Car 1', type = 'car' },
            { model = 'Police2', name = 'Police Car 2', type = 'car' },
            { model = 'police3', name = 'Police Car 3', type = 'car' },
            { model = 'police4', name = 'Police Car 4', type = 'car' },
            { model = 'policeb', name = 'Police Bike', type = 'car' },
            { model = 'policet', name = 'Police SUV', type = 'car' },
            { model = 'sheriff', name = 'Sheriff Car', type = 'car' },
            { model = 'sheriff2', name = 'Sheriff SUV', type = 'car' },
            --{ model = 'polmav', name = 'Police Helicopter', type = 'heli' },  -- Helicopter entry
        }
    },
    --Car police
    [2] = {
        pedLocation = vector3(-463.3143, 6025.2690, 31.3404), -- Paleto
        pedHeading = 141.3671,
        job = 'police',
        VehicleSpawn = vector4(-476.3642, 6032.1655, 31.3404, 225.5327),
        HeliSpawn = vector4(0, 0, 0, 0),
        vehicles = {
            { model = 'Police', name = 'Police Car 1', type = 'car' },
            { model = 'Police2', name = 'Police Car 2', type = 'car' },
            { model = 'police3', name = 'Police Car 3', type = 'car' },
            { model = 'police4', name = 'Police Car 4', type = 'car' },
            { model = 'policeb', name = 'Police Bike', type = 'car' },
            { model = 'policet', name = 'Police SUV', type = 'car' },
            { model = 'sheriff', name = 'Sheriff Car', type = 'car' },
            { model = 'sheriff2', name = 'Sheriff SUV', type = 'car' },
            --{ model = 'polmav', name = 'Police Helicopter', type = 'heli' },  -- Helicopter entry
        }
    },
    --Heli police
    [3] = {
        pedLocation = vector3(463.8680, -982.4292, 43.6916), -- MRPD
        pedHeading = 89.8654,
        job = 'police',
        VehicleSpawn = vector4(0, 0, 0, 0),
        HeliSpawn = vector4(449.0814, -981.2746, 43.6913, 272.5706), 
        vehicles = {
            { model = 'POLMAV', name = 'Police Helicopter', type = 'heli' },  -- Helicopter entry
        }
    },
    --Heli police
    [4] = {
        pedLocation = vector3(-458.7746, 5998.4292, 31.4892), -- Paleto
        pedHeading = 137.4846,
        job = 'police',
        VehicleSpawn = vector4(0, 0, 0, 0),
        HeliSpawn = vector4(-475.4185, 5988.5269, 31.3365, 318.8048), 
        vehicles = {
            { model = 'POLMAV', name = 'Police Helicopter', type = 'heli' },  -- Helicopter entry
        }
    },

    --Heli ambulance
    [5] = {
        pedLocation = vector3(337.4922, -586.8177, 74.1645), 
        pedHeading = 259.4176,
        job = 'ambulance',
        VehicleSpawn = vector4(0, 0, 0, 0),
        HeliSpawn = vector4(352.1233, -587.9878, 74.1645, 78.7689), 
        vehicles = {
            { model = 'polmav', name = 'Police Helicopter', type = 'heli' },  -- Helicopter entry
        }
    },

    --car ambulance
    [6] = {
        pedLocation = vector3(301.0908, -602.1202, 43.3967), 
        pedHeading = 151.2665,
        job = 'ambulance',
        VehicleSpawn = vector4(0, 0, 0, 0),
        HeliSpawn = vector4(291.7368, -611.2463, 43.1436, 70.1015), 
        vehicles = {
            { model = 'ambulance', name = 'Ambulance', type = 'car' }, 
        }
    },
}
