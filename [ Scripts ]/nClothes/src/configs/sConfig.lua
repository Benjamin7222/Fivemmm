--[[
    Copyright (c) 2022 Razzway - Tout droit réservé.
    Ce fichier a été créé pour Razzway - FiveM Store.
    Vous n'êtes pas autorisé à revendre/partager la ressource.
--]]

---@author Razzway
---@version 2.0.0

---@class _ServerConfig
_ServerConfig = {
    enableLogs = true, --> Activer ou non les logs discord
    enableConsoleLogs = true, --> Activer ou non les logs console
    logs = {
        name = "Magasin de vêtement (LOGS)",
        wehbook = "https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR",
        logo = "https://cdn.discordapp.com/attachments/748844923977203762/878079023480205332/20210820_025221.jpg", --> Lien du logo
        color = { --> https://convertingcolors.com/
            yellow = 15450635, --> Couleur Jaune
            green = 586558, --> Couleur Verte
            orange = 13926963, --> Couleur Orange
            red = 15927354, --> Couleur Rouge
            cyan = 578547, --> Couleur Bleu Cyan
            darkblue = 2061822, --> Couleur Bleu Foncé
        },
    },
}

---@class _Server
_Server = {} or {};