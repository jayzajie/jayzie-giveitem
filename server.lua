ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterCommand('gvitem', {'admin'}, function(xPlayer, args, showError)
    TriggerClientEvent('gvitem:showGiveItemDialog', xPlayer.source)
end, true, {help = 'Give item to player', validate = true})

RegisterNetEvent('gvitem:giveItemToPlayer', function(targetId, itemName, itemQuantity)
    local xTarget = ESX.GetPlayerFromId(targetId)
    local xSource = ESX.GetPlayerFromId(source)

    if xTarget then
        if exports.ox_inventory:CanCarryItem(targetId, itemName, itemQuantity) then
            exports.ox_inventory:AddItem(targetId, itemName, itemQuantity)

            TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Item successfully given!'})
        else
            TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Target player cannot carry this item.'})
        end
    else
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Player not found.'})
    end
end)
