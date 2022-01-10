local QBCore = exports['qb-core']:GetCoreObject()
local nativetheme = false -- true for NativeUI theme
local liverymenu = nativetheme and MenuV:CreateMenu('Livery Menu', '', 'topright', 220, 20, 60, 'size-125', 'default', 'menuv', 'liverymenu', 'native') or MenuV:CreateMenu(false, 'Livery Menu', 'topright', 220, 20, 60, 'size-125', 'none', 'menuv', 'liverymenu')

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
