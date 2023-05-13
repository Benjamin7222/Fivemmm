Config = {
    --[[
        -1  ->  Tous les groupes (sauf user)
    --]]
    authorizations = {
        ["vehicles"] = {"_dev", "superadmin", "admin", "responsable"},
        ["vehicles2"] = {"_dev", "superadmin", "admin", "responsable"},
        ["ped"] = {"_dev"},
        ["kick"] = -1,
        ["mess"] = -1,
        ["jail"] = -1,
        ["unjail"] = -1,
        ["teleport"] = -1,
        ["revive"] = -1,
        ["heal"] = -1,
        ["tppc"] = -1,
        ["warn"] = -1,
        ["permInventaire"] = {"_dev", "superadmin", "admin", "responsable", "modo", "helper"},
        ["clearInventory"] = {"_dev", "superadmin", "responsable"},
        ["clearLoadout"] = {"_dev", "superadmin", "responsable"},
        ["ban"] = {"_dev", "superadmin", "responsable", "admin"},
        ["setGroup"] = {"_dev", "responsable"},
        ["give"] = {"_dev", "superadmin", "responsable"},
        ["giveMoney"] = {"_dev", "superadmin", "responsable"},
        ["wipe"] = {"_dev", "superadmin", "responsable"},
        ["clearvéhicules"] = {"_dev", "superadmin", "responsable"},
    },

    webhook = {
        onTeleport = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onBan = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onKick = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onMessage = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onMoneyGive = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onItemGive = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onClear = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onGroupChange = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onRevive = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onHeal = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        onWipe = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR"
    }
}