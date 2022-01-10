local QBCore = exports['hrp-core']:GetCoreObject()

local liverymenu = MenuV:CreateMenu(false, 'Livery Menu', 'topright', 220, 20, 60, 'size-125', 'none', 'menuv', 'liverymenu')

RegisterCommand('livery', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == 'police' then
        if IsPedInAnyVehicle(PlayerPedId()) then
            MenuV:OpenMenu(liverymenu)
        end
    end
end)

RegisterKeyMapping('livery', 'Open Livery Menu', 'keyboard', 'F11')

local veh = GetVehiclePedIsIn(PlayerPedId())
for liveryCount = 1, GetVehicleLiveryCount(veh) do
    local livery = liverymenu:AddButton({
        label = 'Livery #' .. liveryCount,
        value = liveryCount,
        description = 'Select Livery #' .. liveryCount,
        select = function()
            SetVehicleLivery(veh, liveryCount)
        end})
end
