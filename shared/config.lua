
Config = {}

Config.Vigneron = {
    blip = true,
    NameOfJob = "vigneron",
    BlipJob = {
        vector3(-1888.1695556641, 2050.4248046875, 140.9841003418)
    },
    Recolte = {
        vector3(-1884.2635498047, 2105.3522949219, 137.18792724609)
    },
    Traitement = {
        vector3(2242.9265136719, 5154.1508789063, 57.887016296387)
    },
    Vente = {
        vector3(-2544.2680664063, 2316.0153808594, 33.216148376465)
    },
    RecolteItem = "raisin", -- Item à récolter
    RecolteItemLabel = "Raisin", -- Label de l'item récolté
    RecolteCount = 3, --- Nombre d'item give lors de la récolte
    TraitementItem = "grand_cru", --- nom de l'item a give lors de la récolte
    TraitementItemLabel = "Grand cru", --- Label de l'item give lors de la récolte
    TraitementCount = 1, --- Nombre d'item give lors du traitement
    RecolteRemove = 5, --- Nombre d'item remove lors du traitement / nombre d'item qu'il faut pour traiter
    NumberForSell = 2, --- Nombre d'item qu'il faut pour vendre
    VenteCount = 1, --- Nombre d'item vendue lors de la vente
    PriceForSell = 100 --- Prix de vente
}

Config.Text = {
    ["recolte"] = "Récolter",
    ["interact"] = "Interaction",
    ["traitement"] = "Traitement",
    ["vente"] = "Vendre"
}

Config.Param = {
    load = 0.0,
}