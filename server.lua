ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterCommand('gvitem', {'admin'}, function(xPlayer, args, showError)
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('gvitem:showGiveItemDialog', xPlayer.source)
    else
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'You do not have permission to use this command.'})
    end
end, true, {help = 'Give item to player', validate = true})

RegisterNetEvent('gvitem:giveItemToPlayer', function(targetId, itemName, itemQuantity)
    local xSource = ESX.GetPlayerFromId(source)
    if xSource.getGroup() == 'admin' then
        local xTarget = ESX.GetPlayerFromId(targetId)

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
    else
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'You are not authorized to execute this action.'})
    end
end)
