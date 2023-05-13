--[[
    Copyright (c) 2022 Razzway - Tout droit réservé.
    Ce fichier a été créé pour Razzway - FiveM Store.
    Vous n'êtes pas autorisé à revendre/partager la ressource.
--]]

---@author Razzway
---@version 2.0.0

---@class Outfit
Outfit = {};
Outfit.minPrice = 120
Outfit.maxPrice = 250

Outfit.available = { --> Configuration des tenues prédéfinies
    { label = "Summer", desc = "Une tenue simple à porter lors des saisons chaude.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 5, torso_2 = 0,
                arms = 5, arms_2 = 0,
                pants_1 = 12, pants_2 = 7,
                shoes_1 = 7, shoes_2 = 0,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 5, torso_2 = 0,
                arms = 5, arms_2 = 0,
                pants_1 = 12, pants_2 = 7,
                shoes_1 = 7, shoes_2 = 0,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Col roulé", desc = "Dans un style plutôt sobre, elle est idéale à porter durant les périodes hivernales.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 111, torso_2 = 3,
                arms = 4, arms_2 = 0,
                pants_1 = 25, pants_2 = 0,
                shoes_1 = 15, shoes_2 = 0,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 111, torso_2 = 3,
                arms = 4, arms_2 = 0,
                pants_1 = 25, pants_2 = 0,
                shoes_1 = 15, shoes_2 = 0,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Dégradé", desc = "Un style contemporain & fashion avec un dégradé de couleur.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 204, torso_2 = 10,
                arms = 57, arms_2 = 0,
                pants_1 = 4, pants_2 = 4,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 96, helmet_2 = 0,
                glasses_1 = 5, glasses_2 = 2,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 204, torso_2 = 10,
                arms = 57, arms_2 = 0,
                pants_1 = 4, pants_2 = 4,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 96, helmet_2 = 0,
                glasses_1 = 5, glasses_2 = 2,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Bigness", desc = "Un flow digne des plus grands rappeurs d'Hollywood.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 23, tshirt_2 = 0,
                torso_1 = 191, torso_2 = 15,
                arms = 14, arms_2 = 0,
                pants_1 = 83, pants_2 = 1,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 96, helmet_2 = 0,
                glasses_1 = 18, glasses_2 = 3,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 23, tshirt_2 = 0,
                torso_1 = 191, torso_2 = 15,
                arms = 14, arms_2 = 0,
                pants_1 = 83, pants_2 = 1,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 96, helmet_2 = 0,
                glasses_1 = 18, glasses_2 = 3,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Templier", desc = "Discret et efficace, se porte en toute circonstance.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 23, tshirt_2 = 0,
                torso_1 = 346, torso_2 = 0,
                arms = 11, arms_2 = 0,
                pants_1 = 31, pants_2 = 0,
                shoes_1 = 7, shoes_2 = 2,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 56, helmet_2 = 0,
                glasses_1 = 4, glasses_2 = 2,
                chain_1 = 141, chain_2 = 1,
                watches_1 = 3, watches_2 = 0,
                bracelets_1 = 7, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 23, tshirt_2 = 0,
                torso_1 = 346, torso_2 = 0,
                arms = 11, arms_2 = 0,
                pants_1 = 31, pants_2 = 0,
                shoes_1 = 7, shoes_2 = 2,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 56, helmet_2 = 0,
                glasses_1 = 4, glasses_2 = 2,
                chain_1 = 141, chain_2 = 1,
                watches_1 = 3, watches_2 = 0,
                bracelets_1 = 7, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Horizon", desc = "Un bleu marine rappelant les couleurs du ciel et de l'horizon.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 306, torso_2 = 6,
                arms = 12, arms_2 = 0,
                pants_1 = 31, pants_2 = 0,
                shoes_1 = 8, shoes_2 = 5,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 135, helmet_2 = 1,
                glasses_1 = 4, glasses_2 = 2,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 306, torso_2 = 6,
                arms = 12, arms_2 = 0,
                pants_1 = 31, pants_2 = 0,
                shoes_1 = 8, shoes_2 = 5,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 135, helmet_2 = 1,
                glasses_1 = 4, glasses_2 = 2,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
    { label = "Décontracté", desc = "Un t-shirt oversize dans un style décontracté.", price = math.random(Outfit.minPrice, Outfit.maxPrice),
        clothes = {
            ["male"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 193, torso_2 = 8,
                arms = 11, arms_2 = 0,
                pants_1 = 26, pants_2 = 6,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            ["female"] = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 15, tshirt_2 = 0,
                torso_1 = 193, torso_2 = 8,
                arms = 11, arms_2 = 0,
                pants_1 = 26, pants_2 = 6,
                shoes_1 = 57, shoes_2 = 9,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 0, bproof_2 = 0,
                helmet_1 = 0, helmet_2 = 0,
                glasses_1 = 0, glasses_2 = 0,
                chain_1 = 0, chain_2 = 0,
                watches_1 = -1, watches_2 = 0,
                bracelets_1 = -1, bracelets_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
        },
    },
}