ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('gvitem:showGiveItemDialog', function()
    local input = lib.inputDialog('Give Item', {
        {type = 'number', label = 'Player ID', description = 'Enter the target player ID'},
        {type = 'input', label = 'Item Name', description = 'Enter the item name'},
        {type = 'number', label = 'Item Quantity', description = 'Enter the quantity of the item'}
    })

    if input then
        local playerId = tonumber(input[1])
        local itemName = input[2]
        local itemQuantity = tonumber(input[3])

        if playerId and itemName and itemQuantity then
            TriggerServerEvent('gvitem:giveItemToPlayer', playerId, itemName, itemQuantity)
        else
            lib.notify({
                type = 'error',
                description = 'Invalid input data. Please try again.',
                duration = 5000
            })
        end
    else
        lib.notify({
            type = 'error',
            description = 'Input cancelled.',
            duration = 5000
        })
    end
end)
