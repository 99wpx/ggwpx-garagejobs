# GGWPx Garage Jobs

## Description
GGWPx Garage Jobs is a dynamic garage system designed for FiveM servers, allowing specific job roles such as `police` and `ambulance` to spawn and manage vehicles, including cars and helicopters, through interaction with NPCs. This system offers a seamless experience for roleplay servers where players can access various vehicles based on their jobs, enhancing immersion and gameplay.

### Key Features:
- **Job-based Vehicle Spawns:** Customize vehicles for jobs such as `police` and `ambulance` with separate spawn points.
- **Support for Multiple Vehicle Types:** Includes both car and helicopter vehicle types for emergency services.
- **Configurable Locations:** Easily set up spawn points for vehicles and NPCs in various locations.
- **Interact System Integration:** Uses `qb-target` or `interact` to allow players to access the garage system through interaction.
- **Customizable Vehicles:** Add and manage various vehicles based on the job role, allowing players to choose from different types of cars and helicopters.
- **Clean and Efficient Code:** Well-structured configuration for easy modifications and scalability.

## Configuration

The configuration is stored in `config.lua` where you can define the following settings:

- **typeTarget:** The interaction system used (`'qb-target'` or `'interact'`).
- **Locations:** A table defining the locations for vehicle spawns, NPC interactions, and specific job roles. Each location can have customized coordinates for both vehicle and helicopter spawn points.
- **Vehicles:** List of vehicles available for each location, with options for car or helicopter types.

Example Configuration for `police` vehicles:

```lua
Config.Locations = {
    -- Car police at MRPD
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
            { model = 'POLMAV', name = 'Helicopter', type = 'heli' },
        }
    },
    -- More locations can be added...
}
