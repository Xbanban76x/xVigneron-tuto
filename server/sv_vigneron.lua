local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'vigneron', 'Alerte vigneron', true, true) --- Si vous avez un GCPHONE
TriggerEvent('esx_society:registerSociety', 'vigneron', 'vigneron', 'society_vigneron', 'society_vigneron', 'society_vigneron', {type = 'public'})

RegisterServerEvent('vigneron:recolte')
AddEventHandler('vigneron:recolte', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = Config.Vigneron.RecolteItem
    local count = Config.Vigneron.RecolteCount
    local label = Config.Vigneron.RecolteItemLabel
    if xPlayer.canCarryItem(item, count) then
        xPlayer.addInventoryItem(item, count)
        TriggerClientEvent('esx:showNotification', _src, 'Vous avez récolté ' .. count .. ' ' .. label)
    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterServerEvent('vigneron:traitement')
AddEventHandler('vigneron:traitement', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item_give = Config.Vigneron.TraitementItem
    local count_give = Config.Vigneron.TraitementCount
    local item_remove = Config.Vigneron.RecolteItem
    local label_item_remove = Config.Vigneron.RecolteItemLabel
    local count_remove = Config.Vigneron.RecolteRemove
    local label_item_give = Config.Vigneron.TraitementItemLabel
    local countItem = xPlayer.getInventoryItem(item_remove).count

    if xPlayer.canCarryItem(item_give, count_give) then
        if countItem >= count_remove then
            xPlayer.removeInventoryItem(item_remove, count_remove)
            xPlayer.addInventoryItem(item_give, count_give)
            TriggerClientEvent('esx:showNotification', _src, "Vous avez traité " .. count_give .. " " .. label_item_give)
        else
            TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. label_item_remove .. " pour traiter il en faut "..count_remove)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de place dans votre inventaire")
    end
end)


RegisterServerEvent('vigneron:vente')
AddEventHandler('vigneron:vente', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item_vendue = Config.Vigneron.VenteCount
    local itemRequired = Config.Vigneron.TraitementItem
    local itemRequiredLabel = Config.Vigneron.TraitementItemLabel
    local numberRequired = Config.Vigneron.NumberForSell
    local countItem = xPlayer.getInventoryItem(itemRequired).count
    local itemVendu = Config.Vigneron.VenteCount
    local price = Config.Vigneron.PriceForSell

    if countItem >= numberRequired then
        xPlayer.removeInventoryItem(itemRequired, itemVendu)
        xPlayer.addMoney(price)
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. itemRequiredLabel .. " pour vendre")
    end
end)