-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 15 mai 2023 à 21:20
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fivem`
--

-- --------------------------------------------------------

--
-- Structure de la table `account_info`
--

CREATE TABLE `account_info` (
  `account_id` int(11) NOT NULL,
  `license` varchar(50) NOT NULL,
  `steam` varchar(22) DEFAULT NULL,
  `xbl` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `live` varchar(50) DEFAULT NULL,
  `fivem` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `guid` varchar(20) DEFAULT NULL,
  `first_connection` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `account_info`
--

INSERT INTO `account_info` (`account_id`, `license`, `steam`, `xbl`, `discord`, `live`, `fivem`, `name`, `ip`, `guid`, `first_connection`) VALUES
(1688, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'steam:1100001416a65a1', 'xbl:2535468000446034', '', 'live:844425696990856', '', 'LeBledAno', '192.168.0.153', '148618792079688493', '2023-01-22 11:58:08'),
(1689, 'license:a0ddd60d64e43f8ca3b5e19bfc30502bc7f3b950', 'steam:1100001143c7571', 'xbl:2533274894533308', 'discord:540870820826710016', 'live:1688852954788454', '', 'Edward Carter', '192.168.31.211', '148618792347123680', '2023-05-13 19:57:03');

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `recolte` varchar(255) NOT NULL,
  `itemrecolte` varchar(255) NOT NULL,
  `traitement` varchar(255) NOT NULL,
  `itemtraitement` varchar(255) NOT NULL,
  `vente` varchar(255) NOT NULL,
  `PrixVente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_dirtycash', 'Argent Sale Propriété', 0),
('society_410th', '410th', 1),
('society_agentimmo', 'Agent immobilier', 1),
('society_ambulance', 'Ambulance', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_ballas', 'Ballas', 1),
('society_blanchi', 'Blanchisseur', 1),
('society_bloods', 'Bloods', 1),
('society_burgershot', 'Burgershot', 1),
('society_camorra', 'Camorra', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Cosa-Nostra', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_lost', 'Lost MC', 1),
('society_lsarmy', 'Armée', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_mecano', 'Mécano', 1),
('society_police', 'Police', 1),
('society_sheriff', 'Sheriff', 1),
('society_sixbullets', 'Six Bullets', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('society_white', 'White', 1),
('trunk_dirtycash', 'Argent Sale Coffre Véhicule', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(10538, 'society_police', 60, NULL),
(10683, 'society_carshop', 7468049, NULL),
(12267, 'society_unicorn', 2199, NULL),
(12608, 'society_mecano', 997000, NULL),
(13286, 'society_gouvernement', 25, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_410th', '410th', 1),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Les Arménien', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bahamas_fridge', 'Bahamas (frigo)', 1),
('society_ballas', 'Ballas', 1),
('society_blanchi', 'Blanchisseur', 1),
('society_bloods', 'Bloods', 1),
('society_burgershot', 'Burgershot', 1),
('society_cali', 'Cartel de Cali', 1),
('society_camorra', 'Camorra', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_cartelcali', 'Cartel De Cali', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Cosa-Nostra', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_journalist', 'Journaliste', 1),
('society_logger', 'logger', 1),
('society_logger_fridge', 'logger (frigo)', 1),
('society_lost', 'Lost MC', 1),
('society_lsarmy', 'Armée', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_mecano', 'Mécano', 1),
('society_motoshop', 'Concessionnaire Motos', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rockford', 'Rockfords studio', 1),
('society_sheriff', 'Sheriff', 1),
('society_sixbullets', 'Six Bullets', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_testtest', 'testtest', 1),
('society_unicorn', 'Unicorn', 1),
('society_unicorn_fridge', 'Unicorn (frigo)', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('society_white', 'White', 1),
('trunk', 'Coffre Véhicule', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(395, 'society_ballas', 'weed_pooch', 50, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appels_ems`
--

CREATE TABLE `appels_ems` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `reporteur` varchar(255) DEFAULT NULL,
  `nomreporter` varchar(255) DEFAULT NULL,
  `raison` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `playername` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) NOT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` varchar(50) NOT NULL,
  `expiration` varchar(50) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `blanchiment`
--

CREATE TABLE `blanchiment` (
  `id` int(11) NOT NULL,
  `licence` varchar(255) NOT NULL,
  `montant` int(11) NOT NULL,
  `time` varchar(255) NOT NULL,
  `type` int(2) NOT NULL,
  `averti` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`, `society`) VALUES
(6892, 'mt09', 55000, 'motoshop');

-- --------------------------------------------------------

--
-- Structure de la table `car_parking`
--

CREATE TABLE `car_parking` (
  `id` int(10) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_data`
--

CREATE TABLE `clothes_data` (
  `id` int(11) NOT NULL,
  `identifier` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clothes_data`
--

INSERT INTO `clothes_data` (`id`, `identifier`, `name`, `data`) VALUES
(6, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'TESTE2', '{\"beard_1\":0,\"shoes_1\":0,\"bodyb_1\":0,\"makeup_2\":0,\"moles_1\":0,\"bproof_2\":0,\"chest_2\":0,\"bodyb_2\":0,\"torso_1\":504,\"sun_2\":0,\"mask_2\":2,\"lipstick_4\":0,\"eyebrows_1\":0,\"sun_1\":0,\"moles_2\":0,\"watches_2\":0,\"ears_1\":-1,\"makeup_1\":0,\"age_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"blush_3\":0,\"beard_4\":0,\"hair_1\":0,\"bracelets_1\":-1,\"tshirt_2\":0,\"chest_1\":0,\"pants_2\":0,\"bracelets_2\":0,\"hair_2\":0,\"chest_3\":0,\"eyebrows_4\":0,\"eye_color\":0,\"bags_2\":0,\"blush_1\":0,\"lipstick_3\":0,\"watches_1\":-1,\"blemishes_2\":0,\"helmet_1\":-1,\"arms_2\":0,\"makeup_4\":0,\"complexion_1\":0,\"tshirt_1\":0,\"decals_2\":0,\"glasses_1\":0,\"face\":0,\"blush_2\":0,\"hair_color_1\":0,\"sex\":0,\"beard_2\":0,\"chain_2\":0,\"makeup_3\":0,\"ears_2\":0,\"lipstick_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"hair_color_2\":0,\"mask_1\":235,\"complexion_2\":0,\"bags_1\":1,\"lipstick_2\":0,\"beard_3\":0,\"torso_2\":0,\"age_2\":0,\"skin\":0,\"eyebrows_3\":0,\"arms\":193,\"glasses_2\":0,\"pants_1\":23,\"bproof_1\":0,\"chain_1\":0,\"blemishes_1\":0}');

-- --------------------------------------------------------

--
-- Structure de la table `coffre_builder`
--

CREATE TABLE `coffre_builder` (
  `id` int(11) NOT NULL,
  `position` varchar(500) NOT NULL,
  `namecoffre` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `argentsaleactivation` varchar(50) NOT NULL,
  `argentpropreactivation` varchar(50) NOT NULL,
  `armeactivation` longtext DEFAULT '0',
  `objetactivation` longtext DEFAULT '0',
  `amountpropre` longtext DEFAULT '0',
  `amountsale` longtext DEFAULT '0',
  `autorisationretraititem` longtext DEFAULT '0',
  `autorisationdepotitem` longtext DEFAULT '0',
  `autorisationretraitargent` longtext DEFAULT '0',
  `autorisationdepotargent` longtext DEFAULT '0',
  `autorisationcoffrefort` longtext DEFAULT '0',
  `autorisationdepotarme` longtext DEFAULT '0',
  `autorisationretraitarme` longtext DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_410th', '410th', 1),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Les Arménien', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_ballas', 'Ballas', 1),
('society_blanchi', 'Blanchisseur', 1),
('society_bloods', 'Bloods', 1),
('society_burgershot', 'Burgershot', 1),
('society_cali', 'Cartel de Cali', 1),
('society_camorra', 'Camorra', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_cartelcali', 'Cartel De Cali', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Cosa-Nostra', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_journalist', 'Journaliste', 1),
('society_logger', 'logger', 1),
('society_lost', 'Lost MC', 1),
('society_lsarmy', 'Armée', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_mecano', 'Mécano', 1),
('society_motoshop', 'Concessionnaire Motos', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rockford', 'Rockfords studio', 1),
('society_sheriff', 'Sheriff', 1),
('society_sixbullets', 'Six Bullets', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_testtest', 'testtest', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('society_white', 'White', 1),
('trunk', 'Coffre Véhicule', 0),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `data` longtext DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `data`, `owner`) VALUES
(35475, 'society_police', '{\"weapons\":[{\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":0}]}', NULL),
(37014, 'society_ballas', '{\"weapons\":[{\"count\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":0,\"name\":\"WEAPON_PUMPSHOTGUN\"}]}', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `data_inventory`
--

CREATE TABLE `data_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `data_inventory`
--

INSERT INTO `data_inventory` (`id`, `plate`, `data`, `owned`) VALUES
(1, 'property_9', '{}', 1),
(2, 'property_10', '{}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `storage` longtext DEFAULT '{}',
  `production` longtext DEFAULT '{}',
  `password` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `drugs`
--

INSERT INTO `drugs` (`id`, `owner`, `type`, `value`, `data`, `storage`, `production`, `password`) VALUES
(1, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'Cocaïne', 1, '{\"interior\":[\"set_up\",\"equipment_upgrade\",\"coke_press_upgrade\",\"production_upgrade\",\"table_equipment_upgrade\"],\"interiorStatus\":\"upgrade\"}', '{}', '[1,1,1,2,2]', 4422);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `PosVestiaire` varchar(255) DEFAULT NULL,
  `PosCustom` varchar(255) DEFAULT NULL,
  `PosBoss` varchar(255) DEFAULT NULL,
  `namerecolteitem` varchar(255) DEFAULT NULL,
  `PosRecolte` varchar(255) DEFAULT NULL,
  `nametraitementitem` varchar(255) DEFAULT NULL,
  `PosTraitement` varchar(255) DEFAULT NULL,
  `PosVente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eventspresets`
--

CREATE TABLE `eventspresets` (
  `id` int(11) NOT NULL,
  `createdBy` text NOT NULL,
  `label` varchar(50) NOT NULL,
  `presetInfos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fav_emote`
--

CREATE TABLE `fav_emote` (
  `id` int(11) NOT NULL,
  `licence` varchar(80) NOT NULL,
  `dict` text NOT NULL,
  `anim` text NOT NULL,
  `name` text NOT NULL,
  `param` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fav_emote`
--

INSERT INTO `fav_emote` (`id`, `licence`, `dict`, `anim`, `name`, `param`) VALUES
(0, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'amb@prop_human_movie_bulb@idle_a', 'idle_b', 'teste', '{\"EmoteLoop\":true}');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 50, 0),
(2, 'Franchir une ligne continue', 100, 0),
(3, 'Circulation à contresens', 150, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 300, 0),
(6, 'Non-respect des distances de sécurité', 100, 0),
(7, 'Arrêt dangereux / interdit', 300, 0),
(8, 'Stationnement gênant / interdit', 300, 0),
(9, 'Non respect  de la priorité à droite', 200, 0),
(10, 'Non-respect à un véhicule prioritaire', 300, 0),
(11, 'Non-respect d\'un stop', 200, 0),
(12, 'Non-respect d\'un feu rouge', 400, 0),
(13, 'Dépassement dangereux', 500, 0),
(14, 'Véhicule non en état', 600, 0),
(15, 'Conduite sans permis', 2000, 0),
(16, 'Délit de fuite', 19680, 0),
(17, 'Excès de vitesse < 5 kmh', 2450, 0),
(18, 'Excès de vitesse 5-15 kmh', 4800, 0),
(19, 'Excès de vitesse 15-30 kmh', 8450, 0),
(20, 'Excès de vitesse > 30 kmh', 9980, 0),
(21, 'Entrave de la circulation', 2130, 1),
(22, 'Dégradation de la voie publique', 1300, 1),
(23, 'Trouble à l\'ordre publique', 1970, 1),
(24, 'Entrave opération de police', 15630, 1),
(25, 'Insulte envers / entre civils', 14300, 1),
(26, 'Outrage à agent de police', 19600, 1),
(27, 'Menace verbale ou intimidation evers civils', 9630, 1),
(28, 'Menace verbale ou intimidation envers policier', 8600, 1),
(29, 'Manifestation illégale', 4960, 1),
(30, 'Tentative de corruption', 17800, 1),
(31, 'Arme blanche sortie en ville', 21500, 2),
(32, 'Arme léthale sortie en ville', 27830, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 24600, 2),
(34, 'Port d\'arme illégal', 28900, 2),
(35, 'Pris en flag lockpick', 14600, 2),
(36, 'Vol de voiture', 13300, 2),
(37, 'Vente de drogue', 45600, 2),
(38, 'Fabriquation de drogue', 34650, 2),
(39, 'Possession de drogue', 39650, 2),
(40, 'Prise d\'ôtage civil', 75000, 2),
(41, 'Prise d\'ôtage agent de l\'état', 125000, 2),
(42, 'Braquage particulier', 86000, 2),
(43, 'Braquage magasin', 52000, 2),
(44, 'Braquage de banque', 136000, 2),
(45, 'Tir sur civil', 56300, 3),
(46, 'Tir sur agent de l\'état', 65300, 3),
(47, 'Tentative de meurtre sur civil', 65300, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 72300, 3),
(49, 'Meurtre sur civil', 82300, 3),
(50, 'Meurte sur agent de l\'état', 102300, 3),
(51, 'Meurtre involontaire', 36000, 3),
(52, 'Escroquerie à l\'entreprise', 82360, 2),
(53, 'Vol de Vehicule Aeriens', 62220, 1),
(54, 'Default de permis Aeriens', 28920, 1),
(55, 'Default de permis de BATEAU', 22630, 1),
(56, 'Vol de Vehicule Aquatique', 42560, 1),
(57, 'Refus d\'obtempérer', 21300, 2),
(58, 'Usurpation d\'identité', 22300, 2),
(59, 'Complice du meurtre ', 35600, 2),
(60, 'Tentative de kidnapping', 36500, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fuel_stations`
--

CREATE TABLE `fuel_stations` (
  `id` int(40) NOT NULL,
  `station_id` varchar(255) NOT NULL,
  `station_fuel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fuel_stations`
--

INSERT INTO `fuel_stations` (`id`, `station_id`, `station_fuel`) VALUES
(1216, '3', '0.0'),
(1217, '2', '0.0'),
(1218, '1', '1'),
(1219, '5', '0.0'),
(1220, '4', '0.0'),
(1221, '7', '0.0'),
(1222, '6', '0.0'),
(1223, '8', '0.0'),
(1224, '9', '0.0'),
(1225, '11', '0.0'),
(1226, '10', '0.0'),
(1227, '12', '0.0'),
(1228, '13', '0.0'),
(1229, '14', '0.0'),
(1230, '15', '0.0'),
(1231, '17', '0.0'),
(1232, '18', '0.0'),
(1233, '16', '0.0'),
(1234, '19', '0.0'),
(1235, '22', '0.0'),
(1236, '21', '0.0'),
(1237, '20', '0.0'),
(1238, '23', '0.0'),
(1239, '24', '0.0'),
(1240, '25', '0.0'),
(1241, '26', '0.0'),
(1242, '27', '0.0');

-- --------------------------------------------------------

--
-- Structure de la table `garage`
--

CREATE TABLE `garage` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `blip` tinyint(1) NOT NULL DEFAULT 0,
  `pos` varchar(255) NOT NULL,
  `SpawnPoint` varchar(255) NOT NULL,
  `DeletePoint` varchar(255) NOT NULL,
  `Heading` varchar(255) DEFAULT '150.0',
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `garage`
--

INSERT INTO `garage` (`id`, `name`, `blip`, `pos`, `SpawnPoint`, `DeletePoint`, `Heading`, `type`) VALUES
(1, 'Publique', 1, '{\"x\":-286.2185974121094,\"y\":-888.1900634765625,\"z\":31.08062744140625}', '{\"x\":-300.0462341308594,\"y\":-892.3636474609375,\"z\":30.60844993591308}', '{\"x\":-295.4961242675781,\"y\":-886.49169921875,\"z\":31.08063888549804}', '79.09886932373047', 'car'),
(3, 'Publique', 1, '{\"x\":-1085.937744140625,\"y\":-2960.134521484375,\"z\":13.97393321990966}', '{\"x\":-1074.4617919921876,\"y\":-2960.578369140625,\"z\":13.94506740570068}', '{\"x\":-1077.1876220703126,\"y\":-2974.656982421875,\"z\":13.94538784027099}', '100.0', 'aircraft'),
(4, 'Publique', 1, '{\"x\":-735.09716796875,\"y\":-1313.6939697265626,\"z\":5.00036144256591}', '{\"x\":-723.1688842773438,\"y\":-1328.103515625,\"z\":1.43767821788787}', '{\"x\":-729.2232055664063,\"y\":-1333.73828125,\"z\":1.59542262554168}', '100.0', 'boat'),
(5, 'Publique', 1, '{\"x\":-756.7083740234375,\"y\":-806.9389038085938,\"z\":23.23968315124511}', '{\"x\":-748.302001953125,\"y\":-812.2930297851563,\"z\":22.98050498962402}', '{\"x\":-763.8430786132813,\"y\":-812.49951171875,\"z\":22.49257469177246}', '100.0', 'car'),
(6, 'Publique', 1, '{\"x\":-3142.822998046875,\"y\":1063.7686767578126,\"z\":20.51234245300293}', '{\"x\":-3145.9990234375,\"y\":1074.3148193359376,\"z\":20.65127372741699}', '{\"x\":-3141.290771484375,\"y\":1079.5494384765626,\"z\":20.64495086669922}', '100.0', 'car'),
(7, 'Publique', 1, '{\"x\":-139.64768981933595,\"y\":6315.994140625,\"z\":31.374267578125}', '{\"x\":-138.16207885742188,\"y\":6314.837890625,\"z\":31.35720062255859}', '{\"x\":-135.56105041503907,\"y\":6309.82080078125,\"z\":31.48172187805175}', '100.0', 'car'),
(8, 'Publique', 1, '{\"x\":1710.4476318359376,\"y\":6395.37744140625,\"z\":33.26231384277344}', '{\"x\":1702.0047607421876,\"y\":6397.98583984375,\"z\":32.74243927001953}', '{\"x\":1687.256591796875,\"y\":6413.009765625,\"z\":32.27307891845703}', '100.0', 'car'),
(9, 'Publique', 1, '{\"x\":1849.6995849609376,\"y\":2586.606201171875,\"z\":45.67205047607422}', '{\"x\":1859.8485107421876,\"y\":2580.78564453125,\"z\":45.67208099365234}', '{\"x\":1856.5838623046876,\"y\":2573.51025390625,\"z\":45.67208099365234}', '100.0', 'car'),
(11, 'Publique', 1, '{\"x\":218.31312561035157,\"y\":-810.2802734375,\"z\":30.67979431152343}', '{\"x\":230.41650390625,\"y\":-793.6564331054688,\"z\":30.60744285583496}', '{\"x\":230.32943725585938,\"y\":-741.4286499023438,\"z\":30.82157707214355}', '100.0', 'car'),
(12, 'Publique', 1, '{\"x\":-324.48309326171877,\"y\":-1531.0142822265626,\"z\":27.58699798583984}', '{\"x\":-317.27410888671877,\"y\":-1525.6873779296876,\"z\":27.55734062194824}', '{\"x\":-316.8323974609375,\"y\":-1532.6744384765626,\"z\":27.59610748291015}', '100.0', 'car'),
(13, 'Publique', 1, '{\"x\":-251.5725555419922,\"y\":-315.4530334472656,\"z\":30.17339324951172}', '{\"x\":-261.2003479003906,\"y\":-313.7845764160156,\"z\":30.14310073852539}', '{\"x\":-268.1453552246094,\"y\":-316.5836486816406,\"z\":30.19263458251953}', '100.0', 'car'),
(14, 'Publique', 1, '{\"x\":1138.7801513671876,\"y\":-1475.3477783203126,\"z\":34.80468368530273}', '{\"x\":1149.9158935546876,\"y\":-1485.677001953125,\"z\":34.69258499145508}', '{\"x\":1156.6241455078126,\"y\":-1470.638916015625,\"z\":34.69258117675781}', '360.0', 'car'),
(15, 'Publique', 1, '{\"x\":-1702.275390625,\"y\":63.38345336914062,\"z\":65.29515838623047}', '{\"x\":-1706.6854248046876,\"y\":59.29095840454101,\"z\":65.71300506591797}', '{\"x\":-1712.329345703125,\"y\":57.25455474853515,\"z\":66.26611328125}', '38.01088333129883', 'car'),
(16, 'Publique ', 1, '{\"x\":281.16619873046877,\"y\":-339.44927978515627,\"z\":45.04780960083008}', '{\"x\":274.49200439453127,\"y\":-328.7698669433594,\"z\":44.92010498046875}', '{\"x\":291.981201171875,\"y\":-334.0784606933594,\"z\":44.92010116577148}', '151.1200408935547', 'car '),
(17, 'Police', 0, '{\"x\":449.7087097167969,\"y\":-976.3132934570313,\"z\":25.6998176574707}', '{\"x\":449.4909362792969,\"y\":-980.3712768554688,\"z\":25.6998176574707}', '{\"x\":435.6808776855469,\"y\":-975.9804077148438,\"z\":25.6998176574707}', '90.86654663085938', 'car'),
(18, 'Cosa', 0, '{\"x\":-1528.465087890625,\"y\":79.70974731445313,\"z\":56.71517181396484}', '{\"x\":-1526.491943359375,\"y\":85.4797134399414,\"z\":56.56673431396484}', '{\"x\":-1528.4649658203126,\"y\":88.25432586669922,\"z\":56.62092971801758}', '269.47161865234375', 'car'),
(19, 'Bloods', 0, '{\"x\":-1567.5697021484376,\"y\":-388.6427917480469,\"z\":41.98134613037109}', '{\"x\":-1563.4959716796876,\"y\":-394.0887756347656,\"z\":41.98134613037109}', '{\"x\":-1563.9620361328126,\"y\":-387.1329040527344,\"z\":41.98134613037109}', '227.1092529296875', 'car'),
(20, 'Arméniens', 0, '{\"x\":-2670.234375,\"y\":1310.0,\"z\":147.118408203125}', '{\"x\":-2661.6337890625,\"y\":1307.8035888671876,\"z\":147.118408203125}', '{\"x\":-2667.19140625,\"y\":1305.195556640625,\"z\":147.118408203125}', '270.07159423828125', 'car'),
(21, 'Cali', 0, '{\"x\":-130.6696014404297,\"y\":1007.6240844726563,\"z\":235.73196411132813}', '{\"x\":-125.25582122802735,\"y\":1000.0921020507813,\"z\":235.73348999023438}', '{\"x\":-114.40357971191406,\"y\":1004.719482421875,\"z\":235.76553344726563}', '162.16395568847656', 'car'),
(22, 'Families', 0, '{\"x\":-189.68853759765626,\"y\":-1585.0567626953126,\"z\":34.77092361450195}', '{\"x\":-182.13771057128907,\"y\":-1589.26318359375,\"z\":34.66521453857422}', '{\"x\":-175.09422302246095,\"y\":-1579.021240234375,\"z\":35.20468521118164}', '278.9406433105469', 'car'),
(23, 'Ballas', 0, '{\"x\":84.51411437988281,\"y\":-1967.1263427734376,\"z\":20.74746894836425}', '{\"x\":88.40389251708985,\"y\":-1968.259033203125,\"z\":20.74746894836425}', '{\"x\":85.95897674560547,\"y\":-1971.0721435546876,\"z\":20.74746894836425}', '305.7662353515625', 'car'),
(24, 'Vagos', 0, '{\"x\":313.8995361328125,\"y\":-2040.1591796875,\"z\":20.93598365783691}', '{\"x\":319.3062438964844,\"y\":-2035.474853515625,\"z\":20.59438133239746}', '{\"x\":326.7835998535156,\"y\":-2028.5296630859376,\"z\":20.97792625427246}', '317.9423828125', 'car'),
(25, 'Marabunta', 0, '{\"x\":1423.0048828125,\"y\":-1503.673095703125,\"z\":60.91851806640625}', '{\"x\":1423.598388671875,\"y\":-1511.56982421875,\"z\":60.86135482788086}', '{\"x\":1414.854248046875,\"y\":-1504.1624755859376,\"z\":60.07293319702148}', '91.48240661621094', 'car'),
(26, 'Lost', 0, '{\"x\":963.6705932617188,\"y\":-119.39775848388672,\"z\":74.35302734375}', '{\"x\":967.7109985351563,\"y\":-125.0157699584961,\"z\":74.35302734375}', '{\"x\":968.4821166992188,\"y\":-140.43170166015626,\"z\":74.41034698486328}', '144.65518188476562', 'car'),
(27, 'Cayo', 0, '{\"x\":4969.6357421875,\"y\":-5738.3515625,\"z\":19.88018035888672}', '{\"x\":4974.5283203125,\"y\":-5740.763671875,\"z\":19.88018035888672}', '{\"x\":4969.73095703125,\"y\":-5747.5703125,\"z\":19.88018035888672}', '326.62139892578125', 'car'),
(28, 'Publique', 1, '{\"x\":4519.53564453125,\"y\":-4513.92822265625,\"z\":4.5181565284729}', '{\"x\":4513.48291015625,\"y\":-4505.158203125,\"z\":4.13732194900512}', '{\"x\":4517.89013671875,\"y\":-4498.3115234375,\"z\":4.18394374847412}', '324.9219055175781', 'car'),
(29, 'Publique', 1, '{\"x\":4443.36474609375,\"y\":-4482.42138671875,\"z\":4.27916193008422}', '{\"x\":4454.89990234375,\"y\":-4504.5703125,\"z\":4.18589496612548}', '{\"x\":4467.3701171875,\"y\":-4500.837890625,\"z\":4.18794298171997}', '107.54987335205078', 'aircraft'),
(30, 'Publique', 1, '{\"x\":4929.994140625,\"y\":-5145.31298828125,\"z\":2.44834899902343}', '{\"x\":4916.83447265625,\"y\":-5142.41162109375,\"z\":-0.39991840720176}', '{\"x\":4934.08935546875,\"y\":-5154.7587890625,\"z\":-0.39992746710777}', '94.52375030517578', 'boat'),
(31, 'Blé', 0, '{\"x\":1216.454345703125,\"y\":1846.26611328125,\"z\":78.90983581542969}', '{\"x\":1217.611572265625,\"y\":1841.5767822265626,\"z\":79.03668212890625}', '{\"x\":1212.2613525390626,\"y\":1838.5465087890626,\"z\":78.97137451171875}', '138.74661254882812', 'car'),
(32, 'Tabac', 0, '{\"x\":2338.859619140625,\"y\":3140.670654296875,\"z\":48.20288848876953}', '{\"x\":2333.12548828125,\"y\":3142.2724609375,\"z\":48.17715454101562}', '{\"x\":2340.206298828125,\"y\":3152.462158203125,\"z\":48.1626968383789}', '106.96446990966797', 'car'),
(33, 'Rafineur', 0, '{\"x\":2698.94775390625,\"y\":1390.5811767578126,\"z\":24.53535270690918}', '{\"x\":2699.8564453125,\"y\":1382.8826904296876,\"z\":24.51975440979004}', '{\"x\":2706.650146484375,\"y\":1389.8701171875,\"z\":24.51102447509765}', '123.51485443115234', 'car'),
(34, 'Abateur', 0, '{\"x\":-66.0855941772461,\"y\":6271.701171875,\"z\":31.32715225219726}', '{\"x\":-72.7325668334961,\"y\":6274.826171875,\"z\":31.37635231018066}', '{\"x\":-59.6205940246582,\"y\":6277.2158203125,\"z\":31.30797004699707}', '62.948646545410156', 'car'),
(35, 'Braseur', 0, '{\"x\":473.86669921875,\"y\":-1943.6697998046876,\"z\":24.95118522644043}', '{\"x\":466.0289001464844,\"y\":-1950.4962158203126,\"z\":24.65712165832519}', '{\"x\":475.33599853515627,\"y\":-1962.010498046875,\"z\":24.53724670410156}', '30.281129837036133', 'car'),
(36, 'Six Bullets', 0, '{\"x\":-3197.7114,\"y\":836.7517,\"z\":8.9284}', '{\"x\":-3207.9548,\"y\":832.0176,\"z\":8.9271}\r\n', '{\"x\":-3196.4700,\"y\":829.4448,\"z\":8.9284}', '185.8714', 'car');

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_app_chat`
--

CREATE TABLE `gksphone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_bank_transfer`
--

CREATE TABLE `gksphone_bank_transfer` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `price` longtext NOT NULL,
  `name` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_blockednumber`
--

CREATE TABLE `gksphone_blockednumber` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `hex` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_calls`
--

CREATE TABLE `gksphone_calls` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL COMMENT 'Num tel proprio',
  `num` longtext NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gallery`
--

CREATE TABLE `gksphone_gallery` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gksphone_gallery`
--

INSERT INTO `gksphone_gallery` (`id`, `hex`, `image`, `time`) VALUES
(1, 'license:a0ddd60d64e43f8ca3b5e19bfc30502bc7f3b950', '0', '2023-05-14 08:49:57');

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gotur`
--

CREATE TABLE `gksphone_gotur` (
  `id` int(11) NOT NULL,
  `label` longtext NOT NULL,
  `price` int(11) DEFAULT 0,
  `count` int(11) NOT NULL,
  `item` longtext NOT NULL,
  `kapat` varchar(50) DEFAULT 'false',
  `adet` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gps`
--

CREATE TABLE `gksphone_gps` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `nott` longtext DEFAULT NULL,
  `gps` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_group_message`
--

CREATE TABLE `gksphone_group_message` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(50) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `messages` longtext NOT NULL,
  `contacts` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_accounts`
--

CREATE TABLE `gksphone_insto_accounts` (
  `id` int(11) NOT NULL,
  `forename` longtext NOT NULL,
  `surname` longtext NOT NULL,
  `username` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` longtext NOT NULL,
  `avatar_url` longtext DEFAULT NULL,
  `takip` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_instas`
--

CREATE TABLE `gksphone_insto_instas` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `image` longtext NOT NULL,
  `filters` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_likes`
--

CREATE TABLE `gksphone_insto_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_story`
--

CREATE TABLE `gksphone_insto_story` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext DEFAULT NULL,
  `stories` longtext NOT NULL,
  `isRead` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_job_message`
--

CREATE TABLE `gksphone_job_message` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `number` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `photo` longtext DEFAULT NULL,
  `gps` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `jobm` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gksphone_job_message`
--

INSERT INTO `gksphone_job_message` (`id`, `name`, `number`, `message`, `photo`, `gps`, `owner`, `jobm`, `time`) VALUES
(1, 'edward carter', '7223205', 'dedzddzzd', '', 'GPS: 357.98266601563, -1063.6749267578', 1, 'police', '2023-05-14 10:47:45');

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_mails`
--

CREATE TABLE `gksphone_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL DEFAULT '0',
  `sender` varchar(255) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `message` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_messages`
--

CREATE TABLE `gksphone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_messages_group`
--

CREATE TABLE `gksphone_messages_group` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(50) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `gimage` longtext NOT NULL,
  `contacts` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_news`
--

CREATE TABLE `gksphone_news` (
  `id` int(11) NOT NULL,
  `hex` longtext DEFAULT NULL,
  `haber` longtext DEFAULT NULL,
  `baslik` longtext DEFAULT NULL,
  `resim` longtext DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `zaman` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_settings`
--

CREATE TABLE `gksphone_settings` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `crypto` longtext NOT NULL DEFAULT '{}',
  `phone_number` varchar(50) DEFAULT NULL,
  `avatar_url` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gksphone_settings`
--

INSERT INTO `gksphone_settings` (`id`, `identifier`, `crypto`, `phone_number`, `avatar_url`) VALUES
(1, 'license:a0ddd60d64e43f8ca3b5e19bfc30502bc7f3b950', '{}', '7223205', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tinderacc`
--

CREATE TABLE `gksphone_tinderacc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passaword` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tindermatch`
--

CREATE TABLE `gksphone_tindermatch` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `friend_id` int(11) NOT NULL DEFAULT 0,
  `is_match` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tindermessage`
--

CREATE TABLE `gksphone_tindermessage` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `tinderes` text NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_accounts`
--

CREATE TABLE `gksphone_twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL DEFAULT '0',
  `avatar_url` longtext DEFAULT NULL,
  `profilavatar` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_likes`
--

CREATE TABLE `gksphone_twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_tweets`
--

CREATE TABLE `gksphone_twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `image` longtext DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_users_contacts`
--

CREATE TABLE `gksphone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `display` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '-1',
  `avatar` longtext NOT NULL DEFAULT 'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_vehicle_sales`
--

CREATE TABLE `gksphone_vehicle_sales` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_yellow`
--

CREATE TABLE `gksphone_yellow` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `message` longtext NOT NULL,
  `image` longtext DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `id_card`
--

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `porteur` varchar(255) DEFAULT NULL,
  `vehchest` varchar(255) DEFAULT NULL,
  `propchest` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateofbirth` varchar(255) DEFAULT NULL,
  `ldn` varchar(255) DEFAULT NULL,
  `permisCar` int(11) NOT NULL DEFAULT 0,
  `pointCar` int(11) NOT NULL DEFAULT 0,
  `permisMoto` int(11) NOT NULL DEFAULT 0,
  `pointMoto` int(11) NOT NULL DEFAULT 0,
  `permisCamion` int(11) NOT NULL DEFAULT 0,
  `pointCamion` int(11) NOT NULL DEFAULT 0,
  `permisBoat` int(11) NOT NULL DEFAULT 0,
  `permisAirplanes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inside_jobs`
--

CREATE TABLE `inside_jobs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `experience` int(11) NOT NULL,
  `job` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `isdead`
--

CREATE TABLE `isdead` (
  `id` int(25) DEFAULT NULL,
  `license` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('acierrecolte', 'Acier Brut', 1, 0, 1),
('aciertraitement', 'Acier Traiter', 0.5, 0, 1),
('appats', 'Appâts à Poissons', 1, 0, 1),
('appats_tortue', 'Appâts à Tortue', 1, 0, 1),
('bag', 'Sac', 1, 0, 1),
('bandage', 'Bandage', 0.2, 0, 1),
('basic_cuff', 'Menottes', 0.3, 0, 1),
('basic_key', 'Clefs de Menottes', 0.1, 0, 1),
('beer', 'Bière', 0.1, 0, 1),
('biere', 'Bière', 0, 0, 1),
('bigmac', 'Bigmac', 1, 0, 1),
('ble', 'Blé', 1, 0, 1),
('blowpipe', 'Chalumeaux', 1.5, 0, 1),
('bread', 'Pain', 1, 0, 1),
('burger', 'Burger', 0.3, 0, 1),
('cabillaud', 'Cabillaud', 1, 0, 1),
('caca', 'caca', 0, 0, 1),
('cafe', 'Café', 0.1, 0, 1),
('canne_a_peche', 'Canne à Pêche', 1, 0, 1),
('carokit', 'Kit carosserie', 3, 0, 1),
('carotool', 'Outils carosserie', 4, 0, 1),
('carpe', 'Carpe', 1, 0, 1),
('cartebanque', 'Carte Bancaire', 1, 0, 1),
('carteidentite', 'Carte d\'indentité', 1, 0, 1),
('cartons_verres', 'Cartons de verres', 2, 0, 1),
('cb', 'Carte Bleu', 1, 0, 1),
('chip', 'Jeton', 0, 0, 1),
('chocolat_chaud', 'Chocolat Chaud', 0.1, 0, 1),
('clip', 'Chargeur', 0.3, 0, 1),
('coca', 'Coca', 0.1, 0, 1),
('coke', 'Coke', 1, 0, 1),
('coke_pooch', 'Pochon de coke', 0.25, 0, 1),
('cola', 'Cola', 0.2, 0, 1),
('cornichons', 'Cornichons', -1, 0, 1),
('diamond', 'Diamant', 0.1, 0, 1),
('drill', 'Perceuse', 1, 0, 1),
('espresso', 'Espresso', 0.1, 0, 1),
('essence', 'Essence', 1, 0, 1),
('fauxbillet', 'Faux Billet', 1, 0, 1),
('ferrailles', 'Ferrailles', -1, 0, 1),
('feuille_coca', 'Feuille de coca', 1, 0, 1),
('fixkit', 'Kit réparation', 1.5, 0, 1),
('fixtool', 'Outils réparation', 2, 0, 1),
('frites', 'Frites', 2, 0, 1),
('garnitures', 'Garnitures', 2, 0, 1),
('gitanes', 'Gitanes', 0.1, 0, 1),
('gold', 'Lingot d\'or', 0.1, 0, 1),
('goldNecklace', 'Gold Necklace', -1, 0, 1),
('grand_cru', 'Grand cru', 0.2, 0, 1),
('grapperaisin', 'Grappe de raisin', 0.3, 0, 1),
('grip', 'Poignée', 1, 0, 1),
('hamburger', 'Hamburger', 1, 0, 1),
('handcuff', 'Serre câble ', 0.3, 0, 1),
('jager', 'Jägermeister', 0.5, 0, 1),
('jagerbomb', 'Jägermeister', 0.5, 0, 1),
('jagercerbere', 'Jäger Cerbère', 0.5, 0, 1),
('jewels', 'Bijouts', 1, 0, 1),
('jumelles', 'Jumelles', 0.25, 0, 1),
('jus_coca', 'Jus de coca', 0.5, 0, 1),
('jus_orange', 'Jus de orange', -1, 0, 1),
('jus_raisin', 'Jus de raisin', 0.5, 0, 1),
('jusfruit', 'Jus de fruits', 0.5, 0, 1),
('laptop', 'Laptop', -1, 0, 1),
('limonade', 'Limonade', 0.5, 0, 1),
('lockpick', 'Pied de Biche', 1, 0, 1),
('malbora', 'Malboro', 0.1, 0, 1),
('malt', 'Malt', 0, 0, 1),
('martini', 'Martini blanc', 1, 0, 1),
('medikit', 'Medikit', 2, 0, 1),
('menthe', 'Feuille de menthe', 1, 0, 1),
('menuburgershot', 'Menu Burgershot', 1, 0, 1),
('menuburgershotluxe', 'Menu Burgershot luxe', 1, 0, 1),
('meth', 'Meth', 1, 0, 1),
('meth_pooch', 'Pochon de meth', 0.25, 0, 1),
('metreshooter', 'Mètre de shooter', 0.1, 0, 1),
('mixapero', 'Mix Apéritif', 0.1, 0, 1),
('mojito', 'Mojito', 0.1, 0, 1),
('morue', 'Morue', 1, 0, 1),
('opium', 'Opium', 1, 0, 1),
('opium_pooch', 'Pochon d\'opium', 0.25, 0, 1),
('orange', 'Orange', 0.1, 0, 1),
('orange_juice', 'Jus d\'orange', 0.3, 0, 1),
('orangina', 'Orangina', 2, 0, 1),
('painburger', 'Pain Burger', 2, 0, 1),
('papier', 'Papier', 1, 0, 1),
('patate', 'Patate', 1, 0, 1),
('pepsi', 'Pepsi', 1, 0, 1),
('permisconduire', 'Permis de Conduire', -1, 0, 1),
('petrol', 'Pétrol', 1, 0, 1),
('phone', 'Téléphone', 0.3, 0, 1),
('pieces_detacher', 'pieces detacher', -1, 0, 1),
('piluleoubli', 'GHB', 1, 0, 1),
('police_cuff', 'Menottes LSPD', 0.3, 0, 1),
('police_key', 'Clefs de Menottes LSPD', 0.1, 0, 1),
('pomme', 'Pomme', 0.1, 0, 1),
('poulet', 'Poulet', 0, 0, 1),
('radio', 'Radio', 0.5, 0, 1),
('raisin', 'Raisin', 0.3, 0, 1),
('redbull', 'Redbull', 0.3, 0, 1),
('rhum', 'Rhum', 0.4, 0, 1),
('rhumcoca', 'Rhum-Coca', 0.5, 0, 1),
('rhumfruit', 'Rhum-Jus de fruits', 0.5, 0, 1),
('ring', 'Ring', -1, 0, 1),
('salade', 'Salades', 2, 0, 1),
('sandwich', 'Sandwich', 1, 0, 1),
('sardine', 'Sardine', 1, 0, 1),
('saumon', 'Saumon', 1, 0, 1),
('saumonrose', 'Saumon Rose', 1, 0, 1),
('soda', 'Soda', 0.1, 0, 1),
('steak', 'Steak haché', 1, 0, 1),
('tabac', 'Tabac', 0.5, 0, 1),
('tabacblond', 'Tabac Blond', 0.5, 0, 1),
('tabacblondsec', 'Tabac Blond Séché', 0.5, 0, 1),
('tabacbrun', 'Tabac Brun', 0.5, 0, 1),
('tabacbrunsec', 'Tabac Brun Séché', 0.5, 0, 1),
('tablet', 'Tablet', 1, 0, 1),
('tarte_pomme', 'Tarte aux Pommes', 0.3, 0, 1),
('teqpaf', 'Teq\'paf', 0.5, 0, 1),
('tequila', 'Tequila', 0.5, 0, 1),
('thon', 'Thon', 1, 0, 1),
('tomate', 'Tomate', 6, 0, 1),
('tortue', 'Tortue', 1, 0, 1),
('truite', 'Truite', 1, 0, 1),
('verre', 'Verre', 0.1, 0, 1),
('viande', 'Viande', 1, 0, 1),
('vine', 'Vin', 0.5, 0, 1),
('vittvin', 'Vin Blanc', 0.5, 0, 1),
('vodka', 'Vodka', 0.3, 0, 1),
('vodkaenergy', 'Vodka-Energy', 0.4, 0, 1),
('vodkafruit', 'Vodka-Jus de fruits', 0.3, 0, 1),
('vodkaredbull', 'Vodka-Redbull', 0.3, 0, 1),
('water', 'Bouteille d\'eau', 0.1, 0, 1),
('weed', 'Weed', 1, 0, 1),
('weed_pooch', 'Pochon de weed', 0.25, 0, 1),
('whisky', 'Whisky', 0.4, 0, 1),
('whiskycoca', 'Whisky-coca', 0.5, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jail_player`
--

CREATE TABLE `jail_player` (
  `identifier` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `raison` varchar(50) DEFAULT NULL,
  `staffname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `handyservice` varchar(2) NOT NULL DEFAULT '0',
  `hasapp` int(2) NOT NULL DEFAULT 0,
  `onlyboss` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `handyservice`, `hasapp`, `onlyboss`) VALUES
('410th', '410th', 1, '0', 0, 0),
('abateur', 'Abateur', 1, '0', 0, 0),
('agentimmo', 'Agent immobilier', 0, '0', 0, 0),
('ambulance', 'Ocean Medical', 1, '0', 0, 0),
('armeniens', 'Armeniens', 1, '0', 0, 0),
('avocat', 'Avocat', 1, '0', 0, 0),
('bahamas', 'bahamas', 1, '0', 0, 0),
('ballas', 'Ballas', 1, '0', 0, 0),
('blanchi', 'Blanchisseur', 1, '0', 0, 0),
('bloods', 'Bloods', 1, '0', 0, 0),
('brasseur', 'Brasseur', 1, '0', 0, 0),
('burgershot', 'Burgershot', 0, '0', 0, 0),
('camorra', 'Camorra', 1, '0', 0, 0),
('carshop', 'Concessionnaire', 1, '0', 0, 0),
('carteldecali', 'Cartel De Cali', 1, '0', 0, 0),
('cayo', 'Cartel de Cayo', 1, '0', 0, 0),
('cosanostra', 'Cosa-Nostra', 1, '0', 0, 0),
('families', 'Families', 1, '0', 0, 0),
('famillies', 'Famillies', 1, '0', 0, 0),
('gouvernement', 'Gouvernement', 1, '0', 0, 0),
('lost', 'Lost MC', 1, '0', 0, 0),
('lsarmy', 'Armée', 0, '0', 0, 0),
('madrazo', 'Madrazo', 1, '0', 0, 0),
('marabunta', 'Marabunta', 1, '0', 0, 0),
('mecano', 'Mecano', 1, '0', 0, 0),
('police', 'L.S.P.D', 1, '0', 0, 0),
('rafineur', 'Rafineur', 1, '0', 0, 0),
('sheriff', 'Sheriff', 0, '0', 0, 0),
('sixbullets', 'Six Bullets', 1, '0', 0, 0),
('taxi', 'Taxi', 1, '0', 0, 0),
('unemployed', 'Chomeur', 0, '0', 0, 0),
('unemployed2', 'Citoyens', 1, '0', 0, 0),
('unicorn', 'Unicorn', 1, '0', 0, 0),
('vagos', 'Vagos', 1, '0', 0, 0),
('vigne', 'Vigneron', 1, '0', 0, 0),
('white', 'White', 1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'ambulance', 0, 'ambulance', 'Ambulancier', 1000, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":23,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":1,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":65,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":105,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":257,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(2, 'ambulance', 1, 'doctor', 'Medecin', 1500, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":7,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":1,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":106,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":9,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(3, 'ambulance', 2, 'chief_doctor', 'Médecin-Chef', 2000, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":50,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":258,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(4, 'ambulance', 3, 'boss', 'Directeur', 2500, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":81,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":14,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(7, 'avocat', 0, 'recruit', 'Recrue', 1000, '{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}', '{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
(8, 'avocat', 1, 'boss', 'Patron', 2000, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(66, 'taxi', 0, 'recrue', 'Recrue', 300, '{}', '{}'),
(67, 'taxi', 1, 'novice', 'Novice', 400, '{}', '{}'),
(68, 'taxi', 2, 'experimente', 'Experimente', 600, '{}', '{}'),
(69, 'taxi', 3, 'uber', 'Uber', 800, '{}', '{}'),
(70, 'taxi', 4, 'boss', 'Patron', 1000, '{}', '{}'),
(74, 'unemployed', 0, 'unemployed', 'R.S.A', 200, '{}', '{}'),
(79, 'vigne', 0, 'recrue', 'Recrue', 100, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(80, 'vigne', 1, 'novice', 'Novice', 100, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(81, 'vigne', 2, 'cdisenior', 'Chef de Chai', 100, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(82, 'vigne', 3, 'boss', 'Patron', 100, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(90, 'burgershot', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(91, 'burgershot', 1, 'novice', 'Novice', 24, '{}', '{}'),
(92, 'burgershot', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(93, 'burgershot', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(94, 'burgershot', 4, 'boss', 'Patron', 0, '{}', '{}'),
(157, 'unemployed2', 0, 'unemployed2', 'Citoyen', 0, '{}', '{}'),
(462, 'carshop', 0, 'novice', 'Novice', 500, '{}', '{}'),
(463, 'carshop', 1, 'sergeant', 'Intermediaire', 1000, '{}', '{}'),
(464, 'carshop', 2, 'experienced', 'Experimente', 100, '{}', '{}'),
(465, 'carshop', 3, 'boss', 'Patron', 150, '{}', '{}'),
(692, 'unicorn', 0, 'barman', 'Barman', 500, '{}', '{}'),
(693, 'unicorn', 1, 'ambianceur', 'Ambianceur', 700, '{}', '{}'),
(694, 'unicorn', 2, 'secu', 'Securiter', 800, '{}', '{}'),
(695, 'unicorn', 3, 'chefsecu', 'Chef-Securiter', 980, '{}', '{}'),
(696, 'unicorn', 4, 'viceboss', 'Co-Gérant', 1000, '{}', '{}'),
(697, 'unicorn', 5, 'boss', 'Gérant', 1000, '{}', '{}'),
(37530, 'lsarmy', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(37531, 'lsarmy', 1, 'officer', 'Officier', 40, '{}', '{}'),
(37532, 'lsarmy', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(37533, 'lsarmy', 3, 'lieutenant', 'Capitaine', 85, '{}', '{}'),
(37534, 'lsarmy', 4, 'boss', 'Colonel', 100, '{}', '{}'),
(375607, 'agentimmo', 0, 'location', 'Location', 10, '{}', '{}'),
(375608, 'agentimmo', 1, 'vendeur', 'Vendeur', 25, '{}', '{}'),
(375609, 'agentimmo', 2, 'gestion', 'Gestion', 40, '{}', '{}'),
(375610, 'agentimmo', 3, 'boss', 'Patron', 0, '{}', '{}'),
(78418289, 'police', 0, 'recruit', 'Recrue', 99, '{}', '{}'),
(78418290, 'police', 1, 'officer', 'Officier', 150, '{}', '{}'),
(78418291, 'police', 2, 'officerii', 'Officier II', 200, '{}', '{}'),
(78418292, 'police', 3, 'officeriii', 'Officier III', 400, '{}', '{}'),
(78418293, 'police', 6, 'slo', 'DOA', 400, '{}', '{}'),
(78418294, 'police', 4, 'sergeant', 'Sergent', 500, '{}', '{}'),
(78418295, 'police', 5, 'sergeantii', 'Sergent II', 600, '{}', '{}'),
(78418296, 'police', 7, 'lieutenant', 'Lieutenant', 700, '{}', '{}'),
(78418297, 'police', 8, 'chef', 'Capitaine', 800, '{}', '{}'),
(78418298, 'police', 9, 'boss', 'Commandant', 1000, '{}', '{}'),
(78418302, 'bahamas', 0, 'barman', 'Barman', 0, '{}', '{}'),
(78418303, 'bahamas', 1, 'dancer', 'Danseur', 0, '{}', '{}'),
(78418304, 'bahamas', 2, 'viceboss', 'Co-gérant', 0, '{}', '{}'),
(78418305, 'bahamas', 3, 'boss', 'Gérant', 0, '{}', '{}'),
(78418306, 'gouvernement', 0, 'secu', 'SR 3ème CLASSE', 3000, '{}', '{}'),
(78418307, 'gouvernement', 1, 'secuii', 'SR 2ème CLASSE', 5000, '{}', '{}'),
(78418308, 'gouvernement', 2, 'secuchef', 'SR 1er CLASSE', 15000, '{}', '{}'),
(78418309, 'gouvernement', 4, 'proc', 'Procureur', 22000, '{}', '{}'),
(78418310, 'gouvernement', 5, 'juge', 'Juge', 25000, '{}', '{}'),
(78418311, 'gouvernement', 6, 'secretaire', 'Secrétaire d état', 30000, '{}', '{}'),
(78418312, 'gouvernement', 7, 'viceboss', 'Représentant', 40000, '{}', '{}'),
(78418313, 'gouvernement', 8, 'boss', 'Gouverneur', 50000, '{}', '{}'),
(78418317, 'ballas', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418318, 'ballas', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418319, 'ballas', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418320, 'ballas', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418321, 'ballas', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418322, 'ballas', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418323, 'vagos', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418324, 'vagos', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418325, 'vagos', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418326, 'vagos', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418327, 'vagos', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418328, 'vagos', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418329, 'madrazo', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418330, 'madrazo', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418331, 'madrazo', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418332, 'madrazo', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418333, 'madrazo', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418334, 'madrazo', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418335, 'white', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418336, 'white', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418337, 'white', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418338, 'white', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418339, 'white', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418340, 'white', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418341, 'famillies', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418342, 'famillies', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418343, 'famillies', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418344, 'famillies', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418345, 'famillies', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418346, 'famillies', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418347, 'mecano', 2, 'boss', 'PDG', 2000, '{}', '{}'),
(78418348, 'mecano', 0, 'employer', 'Employer', 750, '{}', '{}'),
(78418349, 'mecano', 1, 'responsable', 'Responsable', 1500, '{}', '{}'),
(78418350, 'bloods', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418351, 'bloods', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418352, 'bloods', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418353, 'bloods', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418354, 'bloods', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418355, 'bloods', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418359, 'marabunta', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418360, 'marabunta', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418361, 'marabunta', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418362, 'marabunta', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418363, 'marabunta', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418364, 'marabunta', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418369, 'brasseur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418370, 'brasseur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418371, 'brasseur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418375, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418376, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418377, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418378, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418379, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418380, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418381, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418382, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418383, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418396, 'carteldecali', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418397, 'carteldecali', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418398, 'carteldecali', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418399, 'carteldecali', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418400, 'carteldecali', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418401, 'carteldecali', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418423, 'rafineur', 0, 'employer', 'Employer', 200, '{}', '{}'),
(78418424, 'rafineur', 1, 'responsable', 'Responsable', 500, '{}', '{}'),
(78418425, 'rafineur', 2, 'boss', 'PDG', 1000, '{}', '{}'),
(78418426, 'cayo', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418427, 'cayo', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418428, 'cayo', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418429, 'cayo', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418430, 'cayo', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418431, 'cayo', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418432, 'gouvernement', 3, 'avocat', 'Avocat', 20000, '{}', '{}'),
(78418433, 'sheriff', 0, 'recruit', 'Deputy', 100, '{}', '{}'),
(78418434, 'sheriff', 1, 'deputy', 'Deputy I', 200, '{}', '{}'),
(78418435, 'sheriff', 2, 'deputyii', 'Deputy II', 300, '{}', '{}'),
(78418436, 'sheriff', 4, 'adjudant', 'Senior Deputy', 400, '{}', '{}'),
(78418437, 'sheriff', 5, 'adjudantii', 'Caporal', 500, '{}', '{}'),
(78418438, 'sheriff', 6, 'caporal', 'Senior Caporal', 600, '{}', '{}'),
(78418439, 'sheriff', 7, 'major', 'Sergent', 700, '{}', '{}'),
(78418440, 'sheriff', 8, 'lieutenant', 'Senior Sergent', 800, '{}', '{}'),
(78418441, 'sheriff', 9, 'lieutenantii', 'Lieutenant', 900, '{}', '{}'),
(78418442, 'sheriff', 10, 'colonel', 'Capitaine', 915, '{}', '{}'),
(78418443, 'sheriff', 11, 'colonelii', 'Major', 925, '{}', '{}'),
(78418444, 'sheriff', 12, 'commandant', 'Commandant', 935, '{}', '{}'),
(78418445, 'sheriff', 13, 'chef', 'Undersheriff', 945, '{}', '{}'),
(78418446, 'sheriff', 14, 'boss', 'Sheriff', 1000, '{}', '{}'),
(78418451, 'vagos', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418452, 'vagos', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418453, 'vagos', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418454, 'vagos', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418455, 'armeniens', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418456, 'armeniens', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418457, 'armeniens', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418458, 'armeniens', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418459, 'ballas', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418460, 'ballas', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418461, 'ballas', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418462, 'ballas', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418463, 'families', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418464, 'families', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418465, 'families', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418466, 'families', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418467, 'cayo', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418468, 'cayo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418469, 'cayo', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418470, 'cayo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418471, 'marabunta', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418472, 'marabunta', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418473, 'marabunta', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418474, 'marabunta', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418475, 'lost', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418476, 'lost', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418477, 'lost', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418478, 'lost', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418479, 'bloods', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418480, 'bloods', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418481, 'bloods', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418482, 'bloods', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418483, 'white', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418484, 'white', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418485, 'white', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418486, 'white', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418487, 'blanchi', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418488, 'blanchi', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418489, 'blanchi', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418490, 'blanchi', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418504, 'cosanostra', 3, 'boss', 'Patron', 0, '{}', '{}'),
(78418505, 'cosanostra', 2, 'gerant', 'Sous-Patron', 0, '{}', '{}'),
(78418506, 'cosanostra', 1, 'membre', 'Consigliere', 0, '{}', '{}'),
(78418507, 'cosanostra', 0, 'recrue', 'Soldat', 0, '{}', '{}'),
(78418508, 'sheriff', 3, 'deputyiii', 'Deputy III', 350, '{}', '{}'),
(78418509, 'sixbullets', 5, 'boss', '1ere Balle', 0, '{}', '{}'),
(78418510, 'sixbullets', 4, '2balle', '2nd Balle', 0, '{}', '{}'),
(78418511, 'sixbullets', 3, '3balle', '3eme Balle', 0, '{}', '{}'),
(78418512, 'sixbullets', 2, '4balle', '4eme Balle', 0, '{}', '{}'),
(78418513, 'sixbullets', 1, '5balle', '5eme Balle', 0, '{}', '{}'),
(78418514, 'sixbullets', 0, '6balle', '6eme Balle', 0, '{}', '{}'),
(78418515, '410th', 2, 'gerant', 'Grand', 0, '{}', '{}'),
(78418516, '410th', 4, 'boss', 'OG', 0, '{}', '{}'),
(78418517, '410th', 1, 'membre', 'OJ', 0, '{}', '{}'),
(78418518, '410th', 0, 'recrue', 'Petite Frappe', 0, '{}', '{}'),
(78418519, '410th', 3, 'yg', 'YG', 0, '{}', '{}'),
(78418520, 'camorra', 4, 'boss', 'Leader', 0, '{}', '{}'),
(78418521, 'camorra', 2, 'Lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418522, 'camorra', 1, 'membre', 'Petit confirmé', 0, '{}', '{}'),
(78418523, 'camorra', 0, 'recrue', 'Petit', 0, '{}', '{}'),
(78418524, 'camorra', 3, 'droit', 'Bras Droit', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `kc_jails`
--

CREATE TABLE `kc_jails` (
  `id` int(11) NOT NULL,
  `license` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `admin_name` varchar(100) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `time` varchar(100) NOT NULL DEFAULT '0',
  `time_s` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `kc_warns`
--

CREATE TABLE `kc_warns` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `license` varchar(100) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL DEFAULT '0',
  `admin_name` varchar(250) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `timestamp` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion');

-- --------------------------------------------------------

--
-- Structure de la table `newkaizo_houses`
--

CREATE TABLE `newkaizo_houses` (
  `id` int(11) NOT NULL,
  `owner` varchar(80) NOT NULL,
  `ownerInfo` varchar(255) NOT NULL DEFAULT 'none',
  `infos` text NOT NULL,
  `inventory` text NOT NULL,
  `createdAt` text NOT NULL,
  `createdBy` varchar(80) NOT NULL,
  `street` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `newkaizo_housesinside`
--

CREATE TABLE `newkaizo_housesinside` (
  `license` varchar(80) NOT NULL,
  `houseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `okokbanking_societies`
--

CREATE TABLE `okokbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `okokbanking_societies`
--

INSERT INTO `okokbanking_societies` (`society`, `society_name`, `value`, `iban`, `is_withdrawing`) VALUES
('society_police', 'L.S.P.D', 0, 'OKL.S.P.D', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `okokbanking_transactions`
--

CREATE TABLE `okokbanking_transactions` (
  `id` int(11) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `okokbanking_transactions`
--

INSERT INTO `okokbanking_transactions` (`id`, `receiver_identifier`, `receiver_name`, `sender_identifier`, `sender_name`, `date`, `value`, `type`) VALUES
(1, 'bank', 'Bank (IBAN)', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:22:58', 5000, 'transfer'),
(2, 'bank', 'Bank (IBAN)', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:23:55', 5000, 'transfer'),
(3, 'bank', 'Bank (PIN)', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:23:58', 1000, 'transfer'),
(4, 'bank', 'Bank (IBAN)', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:26:57', 5000, 'transfer'),
(5, 'bank', 'Bank Account', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:27:17', 1000, 'deposit'),
(6, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', 'bank', 'Bank Account', '2023-02-02 20:30:47', 1000, 'withdraw'),
(7, 'bank', 'Bank Account', 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', '2023-02-02 20:32:17', 1000, 'deposit'),
(8, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'LeBledAno', 'bank', 'Bank Account', '2023-02-02 20:32:24', 7000, 'withdraw');

-- --------------------------------------------------------

--
-- Structure de la table `okokbilling`
--

CREATE TABLE `okokbilling` (
  `id` int(50) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` varchar(255) DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) DEFAULT NULL,
  `fees_amount` int(50) DEFAULT 0,
  `paid_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `owner` varchar(50) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `open_car`
--

INSERT INTO `open_car` (`owner`, `plate`, `NB`) VALUES
('license:45786f26910517a5fe4e767b7f0e97d10329e5b9', 'PSNJ865', 1),
('license:9cbd10dc12fcd7f0d055f09c1dcb4ab9649abbd7', 'FXFU8630', 1),
('license:eb0ed881c65e12ca4c255c31e04f7aff2bc37bfb', 'YFEO4546', 1),
('license:7f0363b766375117ed89952266229a0121d3d47f', 'XCCX2981', 1),
('license:715516336d61fc6e0eb98cef49b4a677e4802654', 'RTXU8887', 1),
('license:ae95cd88d383f0f247f3651086d27bc3fad0f331', 'VZYS0239', 1),
('license:79e48dee233cc1d5945d51bcc7b234c65277b234', 'KRHG4293', 1),
('license:79e48dee233cc1d5945d51bcc7b234c65277b234', 'FFRT8061', 1),
('license:99d945342f6b9f0adb89b4b22620ddb82f1df31f', 'TQNP1839', 1),
('license:9bc6b473535ca0aac15334148c0e071d51cf8900', 'QNZK9532', 1),
('license:88e925ad690ede27ed0f37428a621ae08672352e', '04BUH743', 1),
('license:6ed8b3645c3178a20399a77054ed4617c7732767', 'HBUN4630', 1),
('license:39e4ddaaeaba42c3de540fc900623ca0d8f90f32', 'QFFH4108', 1),
('license:1ed46e6793fa091377b9cb9e5d7d57b2cfba09b6', 'ZIOX2511', 1),
('license:ecfc94962b4ec865c4bddaaa1ee1fb8b13d7f459', 'CIIN7714', 1),
('license:714b6c84a897f0e40c765254f2eef7706ba3fb6b', 'YFMH3306', 1),
('license:89ae6305af83aad7e398d0b2dbd70e5512f4ecfe', 'KPFS3236', 1),
('license:68a1db1eab95b1dd88792e9de1a4ac2118ec300f', 'HWUX5624', 1),
('license:bddc6f91f51864233c9f54ac66ebf8790ab365be', '65BFV811', 1),
('license:50f6854078cacc6d9c2cb206c43c3ed0603c88ba', 'JVVC4153', 1),
('license:0c79be6e4f7629c1e5b1ca5e3aee24f9066b4be7', 'BZTU0278', 1),
('license:fccdb91459dbf00a5c7bad45b6efb66b0017f94c', 'VIQZ2369', 1),
('license:eb7b519a9676d60f1c1c19d0b0823ed80fd44ea3', 'YSQE556', 1),
('license:7f0363b766375117ed89952266229a0121d3d47f', 'JMYH226', 1),
('license:d2e3e0e486403e665e159edde8083c7154614f4b', 'TYXW8720', 1),
('license:c7fc2f69240ee72ca9ec0f35a05cd7fc3eed9775', 'VKHF5643', 1),
('license:13dfd2d6c840baa228a5154e4c7db94766f0c910', 'LVJM2868', 1),
('license:0d7ba262444e7588726402f6311d57f6b2a6eeda', 'HXUJ9846', 1),
('license:1a77564e7f1a1157a20acc9b4a3e118920a6b1ac', 'FNTF4910', 1),
('license:252c0d33b4551ab9255cdbde1c53511975910149', 'WFZZ2409', 1),
('license:f3693c89a414996d4521cb0cf3f9071e3f52d77b', 'NEHT9996', 1),
('license:39ecb7d04c25a1eca06e7b613f876f4751b0fa88', 'OEKQ1858', 1),
('license:6f826680bd2df137bf51baae7fe894fae65cab80', 'MESB459', 1),
('license:7fa3614ece1df88467132d36e1f79563def096bc', 'NTYD595', 1),
('license:815c76e1feeb639f67f30bb9035ee67b6475c2e9', '05DGK748', 1),
('license:7f0363b766375117ed89952266229a0121d3d47f', 'XIEY658', 1),
('license:acc386c86d52c30b5225c03a15212ba081f2b3ca', 'TDJY457', 1),
('license:c7fc2f69240ee72ca9ec0f35a05cd7fc3eed9775', 'VKHF5643', 1);

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `shared` varchar(60) DEFAULT NULL,
  `arleady_owned` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `label` varchar(255) NOT NULL DEFAULT 'Votre voiture',
  `boutique` tinyint(1) NOT NULL DEFAULT 0,
  `carseller` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`id`, `owner`, `plate`, `vehicle`, `type`, `state`, `label`, `boutique`, `carseller`) VALUES
(418, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'KZSX675', '{\"modHood\":-1,\"modHydrolic\":-1,\"drift\":false,\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modAerials\":-1,\"intcolor\":0,\"color2\":134,\"tyreSmokeColor\":[255,255,255],\"modXenon\":false,\"xenonColor\":255,\"paintType\":[7,7],\"plate\":\"KZSX675\",\"model\":-1229221301,\"modDoorSpeaker\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"engineHealth\":998.9,\"modTrimA\":-1,\"modTyresBurst\":1,\"modAPlate\":-1,\"modSpoilers\":-1,\"bodyHealth\":999.3,\"modGrille\":-1,\"modHorns\":-1,\"modTrunk\":-1,\"modWheelVariat\":false,\"neonColor\":[255,0,255],\"color3\":[255,255,255],\"modWindows\":-1,\"pearlescentColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modLivery2\":-1,\"modAirFilter\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modEngine\":3,\"modShifterLeavers\":-1,\"extras\":[],\"modTurbo\":1,\"wheels\":3,\"modDial\":-1,\"modArchCover\":-1,\"ColorType\":[-1,-1],\"modEngineBlock\":-1,\"wheelColor\":0,\"modStruts\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"color4\":[255,255,255],\"modLivery\":-1,\"modSeats\":-1,\"windowTint\":-1,\"modSpeakers\":-1,\"plateIndex\":4,\"fuelLevel\":62.5,\"dirtLevel\":4.7,\"dshcolor\":0,\"modTransmission\":-1,\"modFrame\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"modSuspension\":3,\"modFender\":-1,\"color1\":134,\"modVanityPlate\":-1}', 'car', 0, 'Votre voiture', 1, 0),
(419, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'JZYA118', '{\"modTyresBurst\":1,\"modPlateHolder\":-1,\"paintType\":[7,7],\"modTrimA\":-1,\"modSmokeEnabled\":false,\"color1\":89,\"modLivery\":1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"modFrame\":-1,\"modArmor\":-1,\"color2\":30,\"modHood\":-1,\"modTransmission\":-1,\"modSuspension\":-1,\"bodyHealth\":1000.0,\"dirtLevel\":3.0,\"modBrakes\":-1,\"pearlescentColor\":111,\"modWindows\":-1,\"modFender\":-1,\"modRightFender\":-1,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"extras\":[],\"modSeats\":-1,\"modDial\":-1,\"modGrille\":-1,\"engineHealth\":1000.0,\"fuelLevel\":47.5,\"modBackWheels\":-1,\"drift\":false,\"modEngineBlock\":-1,\"windowTint\":-1,\"color4\":[97,16,9],\"modXenon\":false,\"modDoorSpeaker\":-1,\"modTank\":-1,\"color3\":[217,166,0],\"modExhaust\":-1,\"model\":-395327071,\"modEngine\":-1,\"modAerials\":-1,\"intcolor\":112,\"modAPlate\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modVanityPlate\":-1,\"wheels\":0,\"plate\":\"JZYA118\",\"modHorns\":-1,\"ColorType\":[-1,-1],\"modSpeakers\":-1,\"modStruts\":-1,\"modOrnaments\":-1,\"wheelColor\":30,\"xenonColor\":255,\"modTurbo\":false,\"modSpoilers\":-1,\"modHydrolic\":-1,\"modWheelVariat\":false,\"modTrunk\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modSideSkirt\":-1,\"modShifterLeavers\":-1,\"modLivery2\":-1,\"dshcolor\":0}', 'car', 1, 'Votre voiture', 1, 0),
(420, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'AMAB549', '{\"plate\":\"AMAB549\",\"model\":\"G63AMG6x6\"}', 'car', 1, 'Votre voiture', 1, 0),
(421, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'DZLW9791', '{\"modFender\":-1,\"model\":1549126457,\"modVanityPlate\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modAirFilter\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"modBrakes\":-1,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modTrimB\":-1,\"modSpeakers\":-1,\"color1\":0,\"modTrimA\":-1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"modSteeringWheel\":-1,\"modEngineBlock\":-1,\"engineHealth\":1000.0,\"modSuspension\":-1,\"modDial\":-1,\"modTrunk\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"neonColor\":[255,0,255],\"modHood\":-1,\"modSmokeEnabled\":false,\"wheels\":5,\"pearlescentColor\":5,\"modTransmission\":-1,\"modSeats\":-1,\"modFrame\":-1,\"extras\":[],\"modSpoilers\":-1,\"modHorns\":-1,\"modStruts\":-1,\"modAerials\":-1,\"modAPlate\":-1,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"windowTint\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modArmor\":-1,\"color2\":4,\"modXenon\":false,\"plateIndex\":0,\"modDashboard\":-1,\"modRightFender\":-1,\"modPlateHolder\":-1,\"modTurbo\":false,\"dirtLevel\":4.0,\"modFrontBumper\":-1,\"fuelLevel\":65.0,\"modOrnaments\":-1,\"modTank\":-1,\"modEngine\":-1,\"plate\":\"DZLW9791\",\"modDoorSpeaker\":-1,\"wheelColor\":112,\"tyreSmokeColor\":[255,255,255]}', 'car', 0, 'Votre voiture', 0, 0),
(422, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'TZLN3612', '{\"modXenon\":false,\"modTrunk\":-1,\"modTrimA\":-1,\"fuelLevel\":60.0,\"modRightFender\":-1,\"modRoof\":-1,\"modSmokeEnabled\":false,\"modArmor\":-1,\"model\":-1728685474,\"modTransmission\":-1,\"wheels\":7,\"modStruts\":-1,\"modHood\":-1,\"plate\":\"TZLN3612\",\"windowTint\":-1,\"modShifterLeavers\":-1,\"color2\":111,\"modFender\":-1,\"modLivery\":-1,\"modTank\":-1,\"modVanityPlate\":-1,\"bodyHealth\":998.7,\"engineHealth\":1000.0,\"modSpeakers\":-1,\"modTurbo\":false,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"wheelColor\":156,\"neonColor\":[255,0,255],\"modDial\":-1,\"modOrnaments\":-1,\"modEngine\":-1,\"modGrille\":-1,\"modAerials\":-1,\"pearlescentColor\":74,\"extras\":{\"1\":true},\"modBrakes\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"dirtLevel\":3.2,\"modBackWheels\":-1,\"color1\":73,\"xenonColor\":255,\"modSpoilers\":-1,\"modHydrolic\":-1,\"modDashboard\":-1,\"tyreSmokeColor\":[255,255,255],\"modHorns\":-1,\"modSuspension\":-1,\"modExhaust\":-1,\"modAirFilter\":-1,\"modSeats\":-1,\"modArchCover\":-1,\"modSideSkirt\":-1,\"modFrontWheels\":-1}', 'car', 1, 'Votre voiture', 0, 0),
(423, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'KTYE4360', '{\"color2\":3,\"wheelColor\":156,\"modTurbo\":false,\"modXenon\":false,\"modBackWheels\":-1,\"fuelLevel\":58.2,\"modShifterLeavers\":-1,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"xenonColor\":255,\"wheels\":7,\"dirtLevel\":1.3,\"modTrimA\":-1,\"modHydrolic\":-1,\"bodyHealth\":977.2,\"plate\":\"KTYE4360\",\"modFender\":-1,\"modHorns\":-1,\"modLivery\":-1,\"modSideSkirt\":-1,\"modFrontWheels\":-1,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modAerials\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"extras\":[],\"modBrakes\":-1,\"pearlescentColor\":5,\"modTank\":-1,\"modFrame\":-1,\"modGrille\":-1,\"modHood\":-1,\"neonEnabled\":[false,false,false,false],\"modSteeringWheel\":-1,\"modTransmission\":-1,\"modDial\":-1,\"modVanityPlate\":-1,\"plateIndex\":0,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"modEngineBlock\":-1,\"modSpeakers\":-1,\"modSuspension\":-1,\"modOrnaments\":-1,\"modRearBumper\":-1,\"modPlateHolder\":-1,\"windowTint\":-1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"modStruts\":-1,\"modWindows\":-1,\"engineHealth\":994.9,\"color1\":3,\"modTrimB\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"model\":408192225,\"modRightFender\":-1,\"modTrunk\":-1,\"modDashboard\":-1}', 'car', 0, 'Votre voiture', 0, 0),
(424, 'license:4eb476b42bed74ba3527b01906b105d2d53a56d4', 'IDVF3175', '{\"modWindows\":-1,\"modSteeringWheel\":-1,\"color1\":36,\"pearlescentColor\":88,\"modSmokeEnabled\":false,\"modArmor\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modSideSkirt\":-1,\"modRoof\":-1,\"modXenon\":false,\"modHydrolic\":-1,\"modAirFilter\":-1,\"modSpoilers\":-1,\"wheels\":7,\"modHorns\":-1,\"modStruts\":-1,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modFrontWheels\":-1,\"modTank\":-1,\"modOrnaments\":-1,\"model\":-313185164,\"modGrille\":-1,\"neonEnabled\":[false,false,false,false],\"xenonColor\":255,\"fuelLevel\":65.0,\"wheelColor\":12,\"modArchCover\":-1,\"modPlateHolder\":-1,\"modTrimA\":-1,\"modFender\":-1,\"modHood\":-1,\"modTurbo\":false,\"plateIndex\":0,\"modBackWheels\":-1,\"modBrakes\":-1,\"color2\":36,\"windowTint\":-1,\"modLivery\":-1,\"modEngine\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"extras\":[],\"modFrontBumper\":-1,\"neonColor\":[255,0,255],\"modTransmission\":-1,\"engineHealth\":1000.0,\"modEngineBlock\":-1,\"modTrunk\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"dirtLevel\":1.0,\"modTrimB\":-1,\"bodyHealth\":1000.0,\"modDashboard\":-1,\"modDial\":-1,\"modRearBumper\":-1,\"plate\":\"IDVF3175\",\"modFrame\":-1}', 'car', 0, 'Votre voiture', 0, 0),
(425, 'license:a0ddd60d64e43f8ca3b5e19bfc30502bc7f3b950', 'RRMM7925', '{\"dirtLevel\":2.0,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"wheelColor\":156,\"modFrame\":-1,\"modEngineBlock\":-1,\"modHood\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"fuelLevel\":65.0,\"modTrunk\":-1,\"modDial\":-1,\"color2\":0,\"wheels\":0,\"modExhaust\":-1,\"xenonColor\":255,\"modArmor\":-1,\"modHorns\":-1,\"modLivery\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"modWindows\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":false,\"modPlateHolder\":-1,\"windowTint\":-1,\"modStruts\":-1,\"neonColor\":[255,0,255],\"modTrimA\":-1,\"modBackWheels\":-1,\"engineHealth\":1000.0,\"modSpoilers\":-1,\"modEngine\":-1,\"modSeats\":-1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modVanityPlate\":-1,\"modRearBumper\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modFender\":-1,\"modAerials\":-1,\"plate\":\"RRMM7925\",\"modRightFender\":-1,\"modFrontWheels\":-1,\"modShifterLeavers\":-1,\"modSideSkirt\":-1,\"extras\":{\"10\":false,\"12\":true},\"modSmokeEnabled\":false,\"modHydrolic\":-1,\"plateIndex\":0,\"modArchCover\":-1,\"pearlescentColor\":111,\"modSteeringWheel\":-1,\"modXenon\":false,\"modTransmission\":-1,\"color1\":6,\"model\":-344943009,\"modSuspension\":-1,\"modOrnaments\":-1}', 'car', 0, 'Votre voiture', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `identifier` varchar(50) NOT NULL,
  `tattoos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `playerstattoos`
--

INSERT INTO `playerstattoos` (`identifier`, `tattoos`) VALUES
('license:0b980cca5448e10263636c603819286a1663731b', '[{\"name\":-776248682,\"cat\":-240234547},{\"name\":1126903931,\"cat\":1347816957}]'),
('license:0d7ba262444e7588726402f6311d57f6b2a6eeda', '[{\"name\":827974775,\"cat\":-2086773},{\"name\":1372737856,\"cat\":-1056335443}]'),
('license:17a29ffeac815e5a6c16106ccbd7fcc32e3bad8a', '[{\"cat\":-2086773,\"name\":1860213958},{\"cat\":1185637852,\"name\":-1820938681},{\"cat\":-1201369729,\"name\":-869824793},{\"cat\":1616273011,\"name\":573261452},{\"cat\":-975527441,\"name\":1963590204},{\"cat\":1926256505,\"name\":1480738976},{\"cat\":-1016521996,\"name\":-636780127},{\"cat\":1347816957,\"name\":-1681829257},{\"cat\":598190139,\"name\":-814317724}]'),
('license:1ea675fa27496758f3fb5660bfa1d2632e644290', '[{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773}]'),
('license:1eb706fbcdfe98708f805cdc88daea979623b173', '[{\"name\":-817251083,\"cat\":-240234547},{\"name\":1832021545,\"cat\":1616273011},{\"name\":-1630649997,\"cat\":1026837500},{\"name\":-1926213636,\"cat\":1347816957}]'),
('license:1ed46e6793fa091377b9cb9e5d7d57b2cfba09b6', '[{\"name\":193320466,\"cat\":-2086773},{\"name\":1880932522,\"cat\":598190139},{\"name\":800453786,\"cat\":-1719270477}]'),
('license:3db5142e8e7eb5eda5021736f5f0986f92d073f5', '[{\"cat\":598190139,\"name\":301211484},{\"cat\":598190139,\"name\":-1123743653},{\"cat\":598190139,\"name\":-1352706360},{\"cat\":598190139,\"name\":1237582095}]'),
('license:472f479ce3076a547a9dff3cc066ad3c36b7b73c', '[{\"cat\":-2086773,\"name\":-1953737187},{\"cat\":-2086773,\"name\":-1953737187},{\"cat\":-1016521996,\"name\":603013184},{\"cat\":-975527441,\"name\":2056773549}]'),
('license:4eb476b42bed74ba3527b01906b105d2d53a56d4', '[{\"name\":-599666460,\"cat\":1347816957},{\"name\":987747946,\"cat\":1347816957},{\"name\":65224538,\"cat\":1347816957},{\"name\":65224538,\"cat\":1347816957},{\"name\":65224538,\"cat\":1347816957},{\"name\":65224538,\"cat\":1347816957}]'),
('license:5a55f8dd90940aa27f3660e6ceb206ed96a25f7b', '[{\"cat\":-975527441,\"name\":893288510},{\"cat\":1926256505,\"name\":-1233797068},{\"cat\":-363871405,\"name\":-1060893559}]'),
('license:5b889b1c91290df5fd72f5b88ee5cd470b7cc798', '[{\"cat\":1185637852,\"name\":1849315700},{\"cat\":1185637852,\"name\":-1820938681},{\"cat\":1529191571,\"name\":154845196},{\"cat\":-1368357453,\"name\":-260837802},{\"cat\":484754152,\"name\":939374190},{\"cat\":484754152,\"name\":-965491494},{\"cat\":484754152,\"name\":-1261787835},{\"cat\":484754152,\"name\":266230635},{\"cat\":484754152,\"name\":-1918158051},{\"cat\":1347816957,\"name\":-346130454},{\"cat\":-1201369729,\"name\":-1525589690},{\"cat\":1529191571,\"name\":-546150284},{\"cat\":1529191571,\"name\":-357466888},{\"cat\":62137527,\"name\":-552358316}]'),
('license:630c859aac89e836fff5373e41d4164564c3cff7', '[{\"cat\":-1016521996,\"name\":-1119071247},{\"cat\":-975527441,\"name\":893288510},{\"cat\":1529191571,\"name\":718674880},{\"cat\":1529191571,\"name\":788520303},{\"cat\":-363871405,\"name\":335386038},{\"cat\":598190139,\"name\":-2064472355}]'),
('license:6ed8b3645c3178a20399a77054ed4617c7732767', '[{\"cat\":-975527441,\"name\":-1425414573},{\"cat\":-975527441,\"name\":-1425414573},{\"cat\":62137527,\"name\":-2053984264},{\"cat\":62137527,\"name\":-2053984264},{\"cat\":62137527,\"name\":-2053984264},{\"cat\":62137527,\"name\":-2053984264},{\"cat\":62137527,\"name\":-2053984264}]'),
('license:6f826680bd2df137bf51baae7fe894fae65cab80', '[{\"cat\":-2086773,\"name\":665432114},{\"cat\":-1016521996,\"name\":-1219430710},{\"cat\":-975527441,\"name\":893288510}]'),
('license:701c80cf279cc0ba0028e3c42b6c1d368701ce24', '[{\"cat\":-975527441,\"name\":2056773549},{\"cat\":-975527441,\"name\":1428588096}]'),
('license:7a8916f3e9ff50e9c89040604b7b04ea3cb7fd0f', '[{\"cat\":-1056335443,\"name\":1617489838},{\"cat\":-1056335443,\"name\":1617489838}]'),
('license:7f0363b766375117ed89952266229a0121d3d47f', '[{\"cat\":-1398869298,\"name\":-434629734}]'),
('license:815c76e1feeb639f67f30bb9035ee67b6475c2e9', '[{\"cat\":-1056335443,\"name\":1617489838},{\"cat\":-1056335443,\"name\":252924758},{\"cat\":-1056335443,\"name\":1043745875},{\"cat\":-1056335443,\"name\":582246031},{\"cat\":-1056335443,\"name\":-675719916},{\"cat\":484754152,\"name\":907364848},{\"cat\":484754152,\"name\":1429817922},{\"cat\":484754152,\"name\":956061600},{\"cat\":-1016521996,\"name\":-355946577},{\"cat\":-1016521996,\"name\":-247186222},{\"cat\":-240234547,\"name\":1182549017}]'),
('license:8660865f9713eadd3df99dc314145e1c3fdc7788', '[{\"name\":-2147244302,\"cat\":62137527},{\"name\":843062770,\"cat\":1926256505}]'),
('license:88e925ad690ede27ed0f37428a621ae08672352e', '[{\"name\":827974775,\"cat\":-2086773},{\"name\":827974775,\"cat\":-2086773},{\"name\":827974775,\"cat\":-2086773},{\"name\":827974775,\"cat\":-2086773},{\"name\":827974775,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":1366782677,\"cat\":-1056335443},{\"name\":1366782677,\"cat\":-1056335443},{\"name\":1366782677,\"cat\":-1056335443}]'),
('license:88f15e2cc61ac1814279c60df190ba3611626149', '[{\"cat\":-2086773,\"name\":-2128873857},{\"cat\":484754152,\"name\":1525596308},{\"cat\":484754152,\"name\":956061600},{\"cat\":484754152,\"name\":1775476370},{\"cat\":484754152,\"name\":-588549683},{\"cat\":484754152,\"name\":-588549683},{\"cat\":1026837500,\"name\":415527077},{\"cat\":1026837500,\"name\":-1014948306},{\"cat\":1026837500,\"name\":-1265767186}]'),
('license:91a76b41453188388d2800d31727b0f47f3ef9d7', '[{\"name\":1860213958,\"cat\":-2086773},{\"name\":1860213958,\"cat\":-2086773},{\"name\":1860213958,\"cat\":-2086773},{\"name\":-1953737187,\"cat\":-2086773},{\"name\":709663738,\"cat\":-2086773},{\"name\":-1126042648,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":827974775,\"cat\":-2086773},{\"name\":1643127889,\"cat\":598190139},{\"name\":-1757770003,\"cat\":598190139},{\"name\":-2038633110,\"cat\":598190139},{\"name\":-1967196682,\"cat\":598190139},{\"name\":1953024330,\"cat\":598190139}]'),
('license:946aa32ecba23f1965a90a383fa1cc5e0470a010', '[{\"cat\":-240234547,\"name\":745912106},{\"cat\":-240234547,\"name\":745912106},{\"cat\":-240234547,\"name\":745912106},{\"cat\":-240234547,\"name\":745912106},{\"cat\":-240234547,\"name\":745912106}]'),
('license:9cbd10dc12fcd7f0d055f09c1dcb4ab9649abbd7', '[{\"name\":1936646403,\"cat\":-2086773},{\"name\":-1350495965,\"cat\":-2086773},{\"name\":43105745,\"cat\":-1398869298},{\"name\":254662409,\"cat\":-1398869298},{\"name\":-694786597,\"cat\":-1398869298},{\"name\":-1004417654,\"cat\":-1398869298},{\"name\":1332405298,\"cat\":-1398869298},{\"name\":-1653801207,\"cat\":-1398869298},{\"name\":1285643631,\"cat\":-1398869298},{\"name\":1851597906,\"cat\":-1398869298},{\"name\":-301227387,\"cat\":-1398869298},{\"name\":-701762906,\"cat\":-1398869298},{\"name\":-1614279399,\"cat\":-1398869298},{\"name\":-1758069771,\"cat\":-1398869298},{\"name\":1182549017,\"cat\":-240234547},{\"name\":1779534675,\"cat\":-240234547},{\"name\":-335233377,\"cat\":-240234547},{\"name\":1957517559,\"cat\":-240234547},{\"name\":1648112645,\"cat\":-240234547},{\"name\":1593302778,\"cat\":-240234547},{\"name\":1332845224,\"cat\":-240234547},{\"name\":-817251083,\"cat\":-240234547},{\"name\":872613482,\"cat\":-240234547},{\"name\":1368234729,\"cat\":-240234547},{\"name\":765481743,\"cat\":-240234547},{\"name\":-798409911,\"cat\":-1201369729},{\"name\":-869824793,\"cat\":-1201369729},{\"name\":560877895,\"cat\":1616273011},{\"name\":-1425414573,\"cat\":-975527441},{\"name\":-241894528,\"cat\":-975527441},{\"name\":-241894528,\"cat\":-975527441},{\"name\":-1788493673,\"cat\":-975527441},{\"name\":-88186884,\"cat\":-975527441},{\"name\":-88186884,\"cat\":-975527441},{\"name\":919272855,\"cat\":-975527441},{\"name\":919272855,\"cat\":-975527441},{\"name\":1963590204,\"cat\":-975527441},{\"name\":919272855,\"cat\":-975527441},{\"name\":1963590204,\"cat\":-975527441},{\"name\":-1425414573,\"cat\":-975527441},{\"name\":-356634497,\"cat\":1926256505},{\"name\":1420328020,\"cat\":1926256505},{\"name\":-791841628,\"cat\":1926256505},{\"name\":843062770,\"cat\":1926256505},{\"name\":1745422723,\"cat\":1926256505},{\"name\":-989614805,\"cat\":-1368357453},{\"name\":-783205403,\"cat\":-1368357453},{\"name\":745069308,\"cat\":-1368357453}]'),
('license:adc729f6bf4c08432d5c4d0369300720b570a57e', '[{\"cat\":-2086773,\"name\":1860213958},{\"cat\":-2086773,\"name\":193320466},{\"cat\":-1398869298,\"name\":-951688727},{\"cat\":-1719270477,\"name\":-754981437},{\"cat\":-1719270477,\"name\":-754981437},{\"cat\":-1719270477,\"name\":-754981437},{\"cat\":-1719270477,\"name\":25158851},{\"cat\":1616273011,\"name\":820296726},{\"cat\":1616273011,\"name\":1832021545},{\"cat\":1616273011,\"name\":209273925},{\"cat\":1616273011,\"name\":-1521133289},{\"cat\":1616273011,\"name\":1361186211},{\"cat\":1616273011,\"name\":2145953489},{\"cat\":1616273011,\"name\":-545474062},{\"cat\":1616273011,\"name\":-1097074643},{\"cat\":1529191571,\"name\":788520303},{\"cat\":62137527,\"name\":990079224},{\"cat\":-363871405,\"name\":-1170154756},{\"cat\":-363871405,\"name\":-969884576},{\"cat\":-363871405,\"name\":335386038},{\"cat\":-363871405,\"name\":335386038},{\"cat\":-363871405,\"name\":-1763320016},{\"cat\":-1368357453,\"name\":-1966471661},{\"cat\":-363871405,\"name\":211084},{\"cat\":-363871405,\"name\":501566279},{\"cat\":-363871405,\"name\":-1020450678},{\"cat\":-1016521996,\"name\":-962894007}]'),
('license:afc3808322427ea827d1c811ea27eab597621c77', '[{\"cat\":598190139,\"name\":-1967196682},{\"cat\":598190139,\"name\":554422379},{\"cat\":598190139,\"name\":-2057725691},{\"cat\":1347816957,\"name\":1852311340},{\"cat\":1026837500,\"name\":415527077},{\"cat\":-240234547,\"name\":1593302778}]'),
('license:b135416e3d256124db030a05fc20e4afe083b8fa', '[{\"cat\":598190139,\"name\":420418200},{\"cat\":598190139,\"name\":420418200},{\"cat\":598190139,\"name\":-1123743653},{\"cat\":598190139,\"name\":-1835950503},{\"cat\":1347816957,\"name\":1852311340},{\"cat\":1026837500,\"name\":-773345516},{\"cat\":1616273011,\"name\":673922718}]'),
('license:b66f3a5aaea2a8c9c5de0f884c5f6a4508023c40', '[{\"cat\":-2086773,\"name\":1819096318}]'),
('license:ba4d5e6819bcb90efc5b41f56da959967b0c34d4', '[{\"cat\":-2086773,\"name\":1860213958},{\"cat\":-2086773,\"name\":193320466},{\"cat\":-2086773,\"name\":827974775},{\"cat\":-2086773,\"name\":-2128873857},{\"cat\":62137527,\"name\":-1783296601},{\"cat\":-1016521996,\"name\":-1028499109},{\"cat\":598190139,\"name\":420522541},{\"cat\":-2086773,\"name\":1198780358},{\"cat\":-1719270477,\"name\":1187637739},{\"cat\":-363871405,\"name\":-1337421708},{\"cat\":-363871405,\"name\":516389880}]'),
('license:c4aff89587ef7fc7112b26688755ed061931e4ca', '[{\"cat\":-975527441,\"name\":1963590204},{\"cat\":-975527441,\"name\":1963590204},{\"cat\":-2086773,\"name\":-1953737187},{\"cat\":-2086773,\"name\":434115743},{\"cat\":1026837500,\"name\":933419071},{\"cat\":598190139,\"name\":1643127889},{\"cat\":598190139,\"name\":-1700476005}]'),
('license:d2447919dbd52a0c4d74c4dac4014aa3c4b82225', '[{\"name\":31003408,\"cat\":-1201369729},{\"name\":31003408,\"cat\":-1201369729}]'),
('license:d5c27500b85b4b67f98c42b201500e4853d1faa3', '[{\"cat\":-2086773,\"name\":-1126042648},{\"cat\":-2086773,\"name\":1936646403},{\"cat\":-2086773,\"name\":1198780358},{\"cat\":-2086773,\"name\":1819096318},{\"cat\":-363871405,\"name\":-1170154756},{\"cat\":-363871405,\"name\":-969884576},{\"cat\":598190139,\"name\":1369179057},{\"cat\":598190139,\"name\":-636632468},{\"cat\":-1056335443,\"name\":1060644905}]'),
('license:d657161b33ae4af01203732dd3d24933c46ca285', '[{\"name\":92806870,\"cat\":1616273011},{\"name\":1963590204,\"cat\":-975527441},{\"name\":-1218730541,\"cat\":-975527441},{\"name\":-636780127,\"cat\":-1016521996},{\"name\":1852583670,\"cat\":1347816957}]'),
('license:d91b5b8a8672dc4754f71cb224b916edef339a25', '[{\"cat\":-2086773,\"name\":2119318441},{\"cat\":-2086773,\"name\":2119318441},{\"cat\":-2086773,\"name\":2119318441},{\"cat\":-1056335443,\"name\":24304530},{\"cat\":-975527441,\"name\":1428588096}]'),
('license:da59de78118a120fd28b81d23aae956aa9f790e9', '[{\"cat\":-2086773,\"name\":-175559233},{\"cat\":-2086773,\"name\":-543948331},{\"cat\":-2086773,\"name\":-2018143375},{\"cat\":-2086773,\"name\":-1304369017},{\"cat\":-2086773,\"name\":-150859291},{\"cat\":-2086773,\"name\":-148547780},{\"cat\":-2086773,\"name\":193320466},{\"cat\":-2086773,\"name\":-2128873857},{\"cat\":-2086773,\"name\":-1350495965},{\"cat\":-2086773,\"name\":1860213958},{\"cat\":-2086773,\"name\":1819096318},{\"cat\":-2086773,\"name\":1058197095},{\"cat\":-2086773,\"name\":717727185},{\"cat\":-2086773,\"name\":-1513653662},{\"cat\":-2086773,\"name\":-1206837515},{\"cat\":-2086773,\"name\":-1186193045},{\"cat\":-2086773,\"name\":1198780358},{\"cat\":-2086773,\"name\":665432114},{\"cat\":-2086773,\"name\":434115743},{\"cat\":-2086773,\"name\":1560551467},{\"cat\":-2086773,\"name\":1595162603},{\"cat\":-2086773,\"name\":827974775},{\"cat\":-2086773,\"name\":-1125022512},{\"cat\":-2086773,\"name\":-1126042648},{\"cat\":-2086773,\"name\":1936646403},{\"cat\":-2086773,\"name\":990002533},{\"cat\":-2086773,\"name\":709663738},{\"cat\":-2086773,\"name\":193320466},{\"cat\":-2086773,\"name\":-1953737187},{\"cat\":-2086773,\"name\":2119318441},{\"cat\":-2086773,\"name\":1860213958},{\"cat\":-1398869298,\"name\":1157448359},{\"cat\":-1398869298,\"name\":43105745},{\"cat\":-1398869298,\"name\":-270395278},{\"cat\":-1398869298,\"name\":505181414},{\"cat\":-1398869298,\"name\":254662409},{\"cat\":-1398869298,\"name\":-89113946},{\"cat\":-1398869298,\"name\":-1210698509},{\"cat\":-1398869298,\"name\":552929095},{\"cat\":-1398869298,\"name\":-87213624},{\"cat\":-1398869298,\"name\":523240077},{\"cat\":-1398869298,\"name\":123359970},{\"cat\":-1398869298,\"name\":-337142787},{\"cat\":-1398869298,\"name\":-1092860637},{\"cat\":-1398869298,\"name\":-1829180023},{\"cat\":-1398869298,\"name\":-434629734},{\"cat\":-1398869298,\"name\":1252285617},{\"cat\":-1398869298,\"name\":-1433887872},{\"cat\":-1398869298,\"name\":-701762906},{\"cat\":-1398869298,\"name\":258827560},{\"cat\":-1398869298,\"name\":-1004151544},{\"cat\":-1398869298,\"name\":-63910623},{\"cat\":-1398869298,\"name\":-423845319},{\"cat\":-1398869298,\"name\":-1712879828},{\"cat\":-1398869298,\"name\":-1132639145},{\"cat\":-1398869298,\"name\":36296627},{\"cat\":-1398869298,\"name\":957564293},{\"cat\":-1398869298,\"name\":-1451286393},{\"cat\":-1398869298,\"name\":-1225475222},{\"cat\":-1398869298,\"name\":-1992892433},{\"cat\":-1398869298,\"name\":-1838157215},{\"cat\":-1398869298,\"name\":1688803028},{\"cat\":-1398869298,\"name\":1844259164},{\"cat\":-1398869298,\"name\":1070943545},{\"cat\":-1398869298,\"name\":1234460855},{\"cat\":-1398869298,\"name\":-753798460},{\"cat\":-1398869298,\"name\":-1308053326},{\"cat\":-1398869298,\"name\":-1308053326},{\"cat\":-1398869298,\"name\":-2083859401},{\"cat\":-1398869298,\"name\":1586137527},{\"cat\":-1398869298,\"name\":1884564810},{\"cat\":-1398869298,\"name\":1092964089},{\"cat\":-1398869298,\"name\":1092964089},{\"cat\":-1398869298,\"name\":1264280421},{\"cat\":-1398869298,\"name\":496601058},{\"cat\":-1398869298,\"name\":496601058},{\"cat\":-1398869298,\"name\":496601058},{\"cat\":-1398869298,\"name\":861352797},{\"cat\":-1398869298,\"name\":861352797},{\"cat\":-1398869298,\"name\":1784554566},{\"cat\":-1398869298,\"name\":1784554566},{\"cat\":-1398869298,\"name\":-1897271971},{\"cat\":-1398869298,\"name\":-1666742056},{\"cat\":-1398869298,\"name\":-1282165072},{\"cat\":-1398869298,\"name\":-1052880379},{\"cat\":-1398869298,\"name\":-745474390},{\"cat\":-1398869298,\"name\":-745474390},{\"cat\":-1398869298,\"name\":965649655},{\"cat\":-1398869298,\"name\":718800778},{\"cat\":-1398869298,\"name\":1959959422},{\"cat\":-1398869298,\"name\":1200177388},{\"cat\":-1398869298,\"name\":-1874439579},{\"cat\":-1398869298,\"name\":-1845683606}]'),
('license:de3e60370b3fc4cf301d28f4b94ba06e53b8607a', '[{\"cat\":-975527441,\"name\":-241894528},{\"cat\":-975527441,\"name\":1797163947}]'),
('license:e21473c2670ffb6f36c157a999e08aae50612e07', '[{\"name\":866219414,\"cat\":598190139},{\"name\":1404700877,\"cat\":598190139},{\"name\":-1268397497,\"cat\":598190139},{\"name\":1369179057,\"cat\":598190139},{\"name\":1708731435,\"cat\":598190139},{\"name\":-1967196682,\"cat\":598190139},{\"name\":420418200,\"cat\":598190139},{\"name\":65224538,\"cat\":1347816957},{\"name\":1757650301,\"cat\":1347816957},{\"name\":-667753083,\"cat\":1347816957},{\"name\":-145302944,\"cat\":1347816957},{\"name\":1560551467,\"cat\":-2086773},{\"name\":689952604,\"cat\":-2086773},{\"name\":1157448359,\"cat\":-1398869298},{\"name\":-369452741,\"cat\":-1398869298},{\"name\":-1248612522,\"cat\":-1398869298},{\"name\":823174734,\"cat\":-1398869298},{\"name\":1889485313,\"cat\":-975527441},{\"name\":-192802570,\"cat\":-240234547},{\"name\":821579887,\"cat\":-240234547},{\"name\":1403255481,\"cat\":-240234547},{\"name\":1670479428,\"cat\":-240234547},{\"name\":1415278623,\"cat\":-1398869298},{\"name\":-1571403599,\"cat\":-1719270477},{\"name\":-711123906,\"cat\":-1719270477}]'),
('license:e45369df4b143110bdd68687ecaf6bff7d46293a', '[{\"cat\":-1056335443,\"name\":711811694},{\"cat\":-1056335443,\"name\":711811694},{\"cat\":-1056335443,\"name\":711811694},{\"name\":-2063712125,\"cat\":-1056335443},{\"name\":-2063712125,\"cat\":-1056335443}]'),
('license:e50d660e242f3d6f38c512258f2f73a826e215cd', '[{\"name\":-736721263,\"cat\":1347816957},{\"name\":-736721263,\"cat\":1347816957},{\"name\":-736721263,\"cat\":1347816957}]'),
('license:e551434a8984050817d46273fe618d4c3136e27e', '[{\"name\":956061600,\"cat\":484754152},{\"name\":956061600,\"cat\":484754152},{\"name\":1146362323,\"cat\":484754152},{\"name\":1146362323,\"cat\":484754152},{\"name\":1146362323,\"cat\":484754152},{\"name\":1060644905,\"cat\":-1056335443},{\"name\":1060644905,\"cat\":-1056335443},{\"name\":1060644905,\"cat\":-1056335443},{\"name\":1060644905,\"cat\":-1056335443},{\"name\":1060644905,\"cat\":-1056335443},{\"name\":-47863515,\"cat\":-1056335443},{\"name\":-288852985,\"cat\":-1016521996},{\"name\":-766009308,\"cat\":598190139},{\"name\":-766009308,\"cat\":598190139},{\"name\":-982924414,\"cat\":-1398869298},{\"name\":-982924414,\"cat\":-1398869298},{\"name\":-982924414,\"cat\":-1398869298},{\"name\":-982924414,\"cat\":-1398869298},{\"name\":193320466,\"cat\":-2086773},{\"name\":-938326281,\"cat\":484754152}]'),
('license:e9eeee185198b94fdb937c71273b240312c5957f', '[{\"cat\":484754152,\"name\":1498524677}]'),
('license:eb7b519a9676d60f1c1c19d0b0823ed80fd44ea3', '[{\"name\":1963590204,\"cat\":-975527441},{\"name\":-1020450678,\"cat\":-363871405},{\"name\":-1873628095,\"cat\":-363871405},{\"name\":-1170154756,\"cat\":-363871405},{\"name\":1293748604,\"cat\":-363871405},{\"name\":-905045993,\"cat\":62137527},{\"name\":-1869294378,\"cat\":-1016521996},{\"name\":-1365916084,\"cat\":1616273011},{\"name\":-718909970,\"cat\":1529191571},{\"name\":-2147244302,\"cat\":62137527},{\"name\":2119761078,\"cat\":62137527},{\"name\":284091254,\"cat\":1347816957}]'),
('license:ed8a639b4121f83706c17dff026837b30f744320', '[{\"cat\":-2086773,\"name\":1595162603},{\"cat\":484754152,\"name\":1498524677},{\"cat\":-363871405,\"name\":-1009472289},{\"cat\":-363871405,\"name\":-1009472289},{\"cat\":-1016521996,\"name\":-869172334},{\"cat\":-1016521996,\"name\":603013184},{\"cat\":1926256505,\"name\":-1346341418},{\"cat\":-1368357453,\"name\":-989614805},{\"cat\":-1368357453,\"name\":-1458871109},{\"cat\":-363871405,\"name\":-914435716},{\"cat\":1026837500,\"name\":-686624622},{\"cat\":1026837500,\"name\":765001063},{\"cat\":1026837500,\"name\":413611416},{\"cat\":1026837500,\"name\":2070931859},{\"cat\":1026837500,\"name\":-1265767186},{\"cat\":1026837500,\"name\":-1014948306},{\"cat\":1026837500,\"name\":975745281},{\"cat\":1026837500,\"name\":-1278086171},{\"cat\":1026837500,\"name\":-1876234625},{\"cat\":1026837500,\"name\":-593355218},{\"cat\":1026837500,\"name\":-170855031},{\"cat\":1026837500,\"name\":-1306490297},{\"cat\":1026837500,\"name\":1211025296},{\"cat\":1026837500,\"name\":-2071204405},{\"cat\":1026837500,\"name\":-1094679264},{\"cat\":1026837500,\"name\":1232443120},{\"cat\":1026837500,\"name\":-743048780},{\"cat\":1026837500,\"name\":1567227108},{\"cat\":1026837500,\"name\":-842699589},{\"cat\":1026837500,\"name\":130721536},{\"cat\":1026837500,\"name\":1520437442},{\"cat\":1026837500,\"name\":1848661824},{\"cat\":1026837500,\"name\":-1736839817},{\"cat\":1026837500,\"name\":-488127340},{\"cat\":1026837500,\"name\":-1021851577},{\"cat\":1026837500,\"name\":-956136061},{\"cat\":1026837500,\"name\":-686624622},{\"cat\":1026837500,\"name\":2070931859},{\"cat\":1026837500,\"name\":-1265767186},{\"cat\":1026837500,\"name\":-1265767186},{\"cat\":1026837500,\"name\":-1510892268},{\"cat\":1026837500,\"name\":-1876234625},{\"cat\":1026837500,\"name\":-141369051},{\"cat\":-363871405,\"name\":1048452439},{\"cat\":-363871405,\"name\":211084},{\"cat\":-363871405,\"name\":-511607931},{\"cat\":-363871405,\"name\":-1836767787},{\"cat\":-363871405,\"name\":-1020450678},{\"cat\":-363871405,\"name\":-1060893559},{\"cat\":-363871405,\"name\":516389880},{\"cat\":-363871405,\"name\":-1461327573},{\"cat\":-363871405,\"name\":-815856869},{\"cat\":-363871405,\"name\":1459074393},{\"cat\":-363871405,\"name\":-1406186689},{\"cat\":-363871405,\"name\":778786183},{\"cat\":-363871405,\"name\":778786183},{\"cat\":-363871405,\"name\":778786183},{\"cat\":-363871405,\"name\":2124190452},{\"cat\":-363871405,\"name\":1273491948},{\"cat\":-363871405,\"name\":-1378330859},{\"cat\":-363871405,\"name\":1489278440},{\"cat\":-363871405,\"name\":-880824798},{\"cat\":-363871405,\"name\":-914435716},{\"cat\":-363871405,\"name\":-1060893559},{\"cat\":-363871405,\"name\":-770265298},{\"cat\":1185637852,\"name\":-1820938681},{\"cat\":1185637852,\"name\":1605199232},{\"cat\":1185637852,\"name\":113768799},{\"cat\":1185637852,\"name\":1849315700},{\"cat\":-1398869298,\"name\":-1950199756},{\"cat\":-1398869298,\"name\":-89113946},{\"cat\":-1398869298,\"name\":-1004417654},{\"cat\":-1398869298,\"name\":1332405298},{\"cat\":-1398869298,\"name\":-87213624},{\"cat\":-1398869298,\"name\":-1248612522},{\"cat\":-1398869298,\"name\":-1829180023},{\"cat\":-1398869298,\"name\":1415278623},{\"cat\":-1398869298,\"name\":423819507},{\"cat\":-1398869298,\"name\":-701762906},{\"cat\":-1398869298,\"name\":1939258347},{\"cat\":-1398869298,\"name\":-63910623},{\"cat\":-1398869298,\"name\":963561372},{\"cat\":-1398869298,\"name\":-1132639145},{\"cat\":-1398869298,\"name\":614243480},{\"cat\":-1398869298,\"name\":-1451286393},{\"cat\":-1398869298,\"name\":-1838157215},{\"cat\":-1398869298,\"name\":-1453351072},{\"cat\":-1398869298,\"name\":1092964089},{\"cat\":-1398869298,\"name\":1418328330}]'),
('license:f0db2812d313908357b4c4a9513be93aa0782e3b', '[{\"cat\":598190139,\"name\":-1960626826},{\"cat\":1347816957,\"name\":2137077332},{\"cat\":1026837500,\"name\":1232443120},{\"cat\":-363871405,\"name\":-1836767787},{\"cat\":-363871405,\"name\":820753849},{\"cat\":1529191571,\"name\":-357466888},{\"cat\":1529191571,\"name\":-148312642},{\"cat\":-975527441,\"name\":2056773549},{\"cat\":-975527441,\"name\":962023066},{\"cat\":1616273011,\"name\":-1707377523},{\"cat\":1616273011,\"name\":820296726},{\"cat\":-1719270477,\"name\":1801787829}]');

-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `label` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `playlists`
--

INSERT INTO `playlists` (`id`, `label`) VALUES
(56, 'Kaizo 1');

-- --------------------------------------------------------

--
-- Structure de la table `playlist_songs`
--

CREATE TABLE `playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `playlist_songs`
--

INSERT INTO `playlist_songs` (`id`, `playlist`, `link`) VALUES
(26, 0, 'https://www.youtube.com/watch?v=EYAjqqWuBxg'),
(28, 0, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
(29, 54, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
(30, 54, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
(32, 50, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
(33, 54, 'https://www.youtube.com/watch?v=L3wKzyIN1yk'),
(34, 55, 'https://www.youtube.com/watch?v=1QAjskjHQQE'),
(35, 56, 'https://www.youtube.com/watch?v=4AedOd4k4iE');

-- --------------------------------------------------------

--
-- Structure de la table `prop`
--

CREATE TABLE `prop` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT NULL,
  `is_single` tinyint(1) DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL,
  `is_buyable` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `depends` varchar(60) DEFAULT NULL,
  `is_unique` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prop`
--

INSERT INTO `prop` (`id`, `name`, `label`, `entering`, `inside`, `room_menu`, `ipls`, `is_single`, `type`, `is_buyable`, `price`, `depends`, `is_unique`) VALUES
(20, '2677WhispymoundDrive', '2677 Whispymound Drive', '{\"x\":119.2,\"y\":564.62,\"z\":183.96}', '{\"x\":117.21,\"y\":559.67,\"z\":184.3}', '{\"x\":122.17,\"y\":548.84,\"z\":180.5}', '[]', 1, 'House', 1, 1000000, '0', 1),
(21, '2874HillcrestAvenue', '2874 Hillcrest Avenue', '{\"x\":-853.15,\"y\":695.91,\"z\":148.79}', '{\"x\":-859.97,\"y\":691.07,\"z\":152.86}', '{\"x\":-855.23,\"y\":680.13,\"z\":149.05}', '[]', 1, 'House', 1, 1000000, '0', 1),
(22, '3655WildOatsDrive', '3655 Wild Oats Drive', '{\"x\":-175.29,\"y\":502.37,\"z\":137.42}', '{\"x\":-174.23,\"y\":497.29,\"z\":137.67}', '{\"x\":-167.38,\"y\":487.78,\"z\":133.84}', '[]', 1, 'House', 1, 1000000, '0', 1),
(23, '2862HillcrestAvenue', '2862 Hillcrest Avenue', '{\"x\":-686.07,\"y\":596.35,\"z\":143.64}', '{\"x\":-682.39,\"y\":592.65,\"z\":145.38}', '{\"x\":-671.59,\"y\":587.37,\"z\":141.57}', '[]', 1, 'House', 1, 1000000, '0', 0),
(24, '2133MadWayneThunder', '2133 Mad Wayne Thunder', '{\"x\":-1294.4,\"y\":454.66,\"z\":97.52}', '{\"x\":-1289.97,\"y\":449.55,\"z\":97.9}', '{\"x\":-1286.31,\"y\":438.16,\"z\":94.09}', '[]', 1, 'House', 1, 1000000, '0', 1),
(25, '2868 Hillcrest Avenue', '2868 Hillcrest Avenue', '{\"x\":-752.81,\"y\":620.51,\"z\":142.59}', '{\"x\":-758.55,\"y\":618.94,\"z\":144.15}', '{\"x\":-767.49,\"y\":610.98,\"z\":140.33}', '[]', 1, 'House', 1, 1000000, '0', 0),
(26, '2045NorthConkerAvenue', '2045 North Conker Avenue', '{\"x\":373.06,\"y\":428.48,\"z\":145.69}', '{\"x\":373.43,\"y\":423.41,\"z\":145.91}', '{\"x\":374.58,\"y\":411.65,\"z\":142.1}', '[]', 1, 'House', 1, 1000000, '0', 0),
(27, '2044NorthConkerAvenue', '2044 North Conker Avenue', '{\"x\":347.21,\"y\":440.86,\"z\":147.7}', '{\"x\":341.76,\"y\":437.84,\"z\":149.39}', '{\"x\":334.36,\"y\":428.34,\"z\":145.57}', '[]', 1, 'House', 1, 1000000, '0', 0),
(28, 'EclipseTower', 'Eclipse Tower', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '0', '0', '[]', 1, '0', 1, 0, 'Collector', 0),
(29, 'EclipseTowerApartment', 'Eclipse Tower, Apt', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-784.81,\"y\":323.59,\"z\":212.0}', '{\"x\":-793.33,\"y\":326.62,\"z\":210.8}', '[]', 0, 'Apartment', 1, 525000, 'EclipseTower', 0),
(30, 'EclipseTowerPenthouse', 'Eclipse Tower, Pnt', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-781.84,\"y\":323.68,\"z\":176.8}', '{\"x\":-761.08,\"y\":325.41,\"z\":170.61}', '[]', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(31, 'ModernPenthouse', 'Modern Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_01_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(32, 'StimmungsvollPenthouse', 'Moody Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_02_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(33, 'DynastischPenthouse', 'Vibrant Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_03_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(34, 'PraegnantPenthouse', 'Sharp Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_04_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(35, 'MonochromePenthouse', 'Monochrome Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_05_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(36, 'VerfuehrerischPenthouse', 'Seductive Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_06_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(37, 'MajestetischPenthouse', 'Regal Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_07_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(38, 'MaritimPenthouse', 'Aqua Penthouse', '{\"x\":-776.20,\"y\":313.54,\"z\":85.14}', '{\"x\":-774.21,\"y\":341.97,\"z\":196.69}', '{\"x\":-763.33,\"y\":329.09,\"z\":199.49}', 'apa_v_mp_h_08_b', 0, 'Penthouse', 1, 400000, 'EclipseTower', 0),
(39, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1446.4,\"y\":-539.1,\"z\":34.74}', '0', '0', '[]', 1, '0', 1, 0, 'Collector', 0),
(40, 'DellPerroHeightsApt ', 'Dell Perro Heights, Apt', '{\"x\":-1446.4,\"y\":-539.1,\"z\":34.74}', '{\"x\":-1452.42,\"y\":-540.32,\"z\":74.04}', '{\"x\":-1449.84,\"y\":-548.88,\"z\":72.84}', '[]', 0, 'Apartment', 1, 525000, 'DellPerroHeights', 0),
(41, 'DellPerroHeightsPnt', 'Dell Perro Heights, Pnt', '{\"x\":-1446.4,\"y\":-539.1,\"z\":34.74}', '{\"x\":-1451.33,\"y\":-524.05,\"z\":69.65}', '{\"x\":-1467.42,\"y\":-537.1,\"z\":63.36}', '[]', 0, 'Penthouse', 1, 575000, 'DellPerroHeights', 0),
(42, 'BondsLowApartment', 'Bonds, Apt', '{\"x\":329.1,\"y\":-800.87,\"z\":29.27}', '{\"x\":266.12,\"y\":-1007.05,\"z\":-100.95}', '{\"x\":259.76,\"y\":-1003.94,\"z\":-99.01}', '[]', 1, 'Wohnung', 1, 156000, '0', 0),
(43, 'WeazelPlazaPnt', 'Weazel Plaze, Pnt', '{\"x\":-916.7,\"y\":-450.77,\"z\":39.6}', '{\"x\":-888.86,\"y\":-451.74,\"z\":95.46}', '{\"x\":-899.47,\"y\":-434.26,\"z\":89.26}', '[]', 1, 'Penthouse', 1, 575000, '0', 0),
(44, 'TinselTower', 'Tinsel Tower, Apt', '{\"x\":-618.36,\"y\":36.37,\"z\":43.57}', '{\"x\":-603.21,\"y\":58.93,\"z\":98.2}', '{\"x\":-594.77,\"y\":56.14,\"z\":97.0}', '[]', 1, 'Apartment', 1, 525000, '0', 0),
(45, 'ThePinkCage', 'Pink Cage Hotel', '{\"x\":314.88,\"y\":-227.43,\"z\":54.02}', '{\"x\":151.4,\"y\":-1007.46,\"z\":-99.0}', '{\"x\":152.29,\"y\":-1001.29,\"z\":-99.0}', '[]', 1, 'Hotel', 1, 40000, '0', 0),
(48, 'RichardMajesticApartment', 'Richard Majestic, Apt', '{\"x\":-937.02,\"y\":-379.41,\"z\":38.96}', '{\"x\":-912.82,\"y\":-365.27,\"z\":114.27}', '{\"x\":-903.92,\"y\":-363.59,\"z\":113.07}', '[]', 1, 'Apartment', 1, 525000, '0', 0),
(50, 'MiRd6085', '6085 Milton Road', '{\"x\":-658.87,\"y\":888.0,\"z\":229.24}', '{\"x\":-682.39,\"y\":592.65,\"z\":145.38}', '{\"x\":-671.59,\"y\":587.37,\"z\":141.57}', '[]', 1, 'House', 1, 20000, '0', 1),
(51, 'LakeVWEst', 'Lake Vinewood Est', '{\"x\":-152.43,\"y\":911.2,\"z\":234.65}', '{\"x\":-174.23,\"y\":497.29,\"z\":137.67}', '{\"x\":-167.38,\"y\":487.78,\"z\":133.84}', '[]', 1, 'House', 1, 20000, '0', 1),
(56, 'VWPowerSt', 'PowerSt 0702', '{\"x\":284.71,\"y\":47.19,\"z\":91.66}', '{\"x\":151.4,\"y\":-1007.46,\"z\":-99.0}', '{\"x\":152.29,\"y\":-1001.29,\"z\":-99.0}', '[]', 1, 'Hotel', 1, 320000, '0', 0),
(57, 'LaPuGomaSt', 'La Puerta GomaSt', '{\"x\":-970.14,\"y\":-1431.4,\"z\":6.67}', '{\"x\":151.4,\"y\":-1007.46,\"z\":-99.0}', '{\"x\":152.29,\"y\":-1001.29,\"z\":-99.0}', '[]', 1, 'Hotel', 1, 320000, '0', 0),
(58, 'Tahitian', 'The Tahitian', '{\"x\":-25.50,\"y\":-1556.38,\"z\":29.68}', '{\"x\":151.4,\"y\":-1007.46,\"z\":-99.0}', '{\"x\":152.29,\"y\":-1001.29,\"z\":-99.0}', '[]', 1, 'Hotel', 1, 320000, '0', 0),
(67, 'WhDr3673', '3673 Whispymound Drive', '{\"x\":45.69,\"y\":556.71,\"z\":179.18}', '{\"x\":117.21,\"y\":559.67,\"z\":184.3}', '{\"x\":122.17,\"y\":548.84,\"z\":180.5}', '[]', 1, 'House', 1, 20000, '0', 1),
(68, 'MeSt', 'Melanoma St', '{\"x\":-1114.6,\"y\":-1579.04,\"z\":7.68}', '{\"x\":151.4,\"y\":-1007.46,\"z\":-99.0}', '{\"x\":152.29,\"y\":-1001.29,\"z\":-99.0}', '[]', 1, 'Hotel', 1, 320000, '0', 0),
(69, '1018NRF', '1018 North Rockford', '{\"x\":-1973.91,\"y\":630.68,\"z\":121.54}', '{\"x\":-174.23,\"y\":497.29,\"z\":137.67}', '{\"x\":-167.38,\"y\":487.78,\"z\":133.84}', '[]', 1, 'House', 1, 320000, '0', 1),
(78, 'MazeBank', 'Maze Bank', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '0', '0', '[]', 1, '0', 0, 0, 'Collector', 0),
(79, 'MBO1', 'MB Executive Rich', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_02b', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(80, 'MBO2', 'MB Executive Cool', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_02c', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(81, 'MBO3', 'MB Executive Contrast', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_02a', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(82, 'MBO4', 'MB Old Spice Warm', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_01a', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(83, 'MBO5', 'MB Old Spice Classical', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_01b', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(84, 'MBO6', 'MB Old Spice Vintage', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_01c', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(85, 'MBO7', 'MB Power Broker Ice', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_03a', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(86, 'MBO8', 'MB Power Broker Conservative', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_03b', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(87, 'MBO9', 'MB Power Broker Polished', '{\"x\":-68.4,\"y\":-800.57,\"z\":44.23}', '{\"x\":-77.71,\"y\":-829.89,\"z\":243.39}', '{\"x\":-78.1,\"y\":-810.65,\"z\":243.39}', 'ex_dt1_11_office_03c', 0, 'Office', 1, 1200000, 'MazeBank', 0),
(88, 'VespucciClubhouse', 'Vespucci Clubhouse', '{\"x\":-1134.61,\"y\":-1568.99,\"z\":4.41}', '{\"x\":997.64,\"y\":-3158.04,\"z\":-38.91}', '{\"x\":1009.89,\"y\":-3168.35,\"z\":-38.89}', '[]', 1, 'ClubHouse', 1, 200000, '0', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property_created`
--

CREATE TABLE `property_created` (
  `propertyID` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `pNumber` varchar(255) DEFAULT NULL,
  `pEnterPos` varchar(255) DEFAULT NULL,
  `gEnterPos` varchar(255) DEFAULT NULL,
  `gPlaces` varchar(255) DEFAULT NULL,
  `stockCapacity` varchar(255) DEFAULT NULL,
  `pInventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pVehicules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pKeys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prop_owner`
--

CREATE TABLE `prop_owner` (
  `id` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `charactername` varchar(255) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rented` int(11) DEFAULT NULL,
  `trusted` varchar(1000) DEFAULT NULL,
  `locked` int(11) DEFAULT 1,
  `deposit` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `society`
--

CREATE TABLE `society` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `money` varchar(255) NOT NULL,
  `moneysale` varchar(255) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `truck_inventory2`
--

CREATE TABLE `truck_inventory2` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) NOT NULL,
  `permission_group` varchar(50) DEFAULT 'user',
  `permission_level` int(11) DEFAULT 0,
  `position` varchar(255) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `loadout` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `isDead` int(11) DEFAULT 0,
  `status` longtext DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dateofbirth` varchar(25) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `animations` longtext DEFAULT NULL,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) DEFAULT 1,
  `cloths` text DEFAULT NULL,
  `statuscompte` tinyint(1) DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  `hotbar` longtext DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `foto` longtext DEFAULT 'https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200008/91087328-icono-de-perfil-de-avatar-predeterminado-para-mujer-marcador-de-posición-de-foto-gris-vector-de-ilus.jpg?ver=6',
  `search` varchar(255) DEFAULT '{"inSearch":false,"motivo":""}',
  `dangerous` varchar(255) DEFAULT '{"danger":false,"motivo":""}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `permission_group`, `permission_level`, `position`, `skin`, `accounts`, `inventory`, `loadout`, `job`, `job_grade`, `job2`, `job2_grade`, `isDead`, `status`, `last_property`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `animations`, `jail_time`, `xp`, `cloths`, `statuscompte`, `phone_number`, `hotbar`, `iban`, `pincode`, `foto`, `search`, `dangerous`) VALUES
('license:4eb476b42bed74ba3527b01906b105d2d53a56d4', '_dev', 4, '{\"z\":59.70000076293945,\"y\":-193.10000610351563,\"x\":19.60000038146972}', '{\"chest_3\":0,\"moles_2\":0,\"makeup_1\":0,\"bracelets_1\":-1,\"tshirt_2\":0,\"decals_2\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"mask_2\":0,\"age_2\":0,\"moles_1\":0,\"sun_1\":0,\"face\":0,\"bproof_1\":7,\"chain_2\":0,\"pants_2\":0,\"arms_2\":0,\"bodyb_2\":0,\"chain_1\":1,\"eyebrows_3\":0,\"beard_4\":0,\"shoes_1\":90,\"mask_1\":210,\"lipstick_4\":0,\"hair_2\":0,\"bags_1\":0,\"blemishes_2\":0,\"watches_2\":0,\"torso_1\":206,\"makeup_4\":0,\"glasses_1\":0,\"shoes_2\":0,\"eyebrows_1\":0,\"watches_1\":-1,\"eyebrows_4\":0,\"age_1\":0,\"bracelets_2\":0,\"chest_2\":0,\"arms\":19,\"sex\":0,\"sun_2\":0,\"blush_1\":0,\"beard_3\":0,\"complexion_1\":0,\"lipstick_2\":0,\"helmet_2\":0,\"blush_2\":0,\"skin\":0,\"chest_1\":0,\"glasses_2\":0,\"eyebrows_2\":0,\"complexion_2\":0,\"tshirt_1\":82,\"helmet_1\":195,\"blush_3\":0,\"makeup_3\":0,\"pants_1\":133,\"beard_1\":0,\"hair_1\":0,\"makeup_2\":0,\"hair_color_1\":0,\"eye_color\":0,\"hair_color_2\":0,\"torso_2\":0,\"beard_2\":0,\"bags_2\":0,\"decals_1\":0,\"bproof_2\":4,\"lipstick_1\":0,\"ears_2\":0,\"ears_1\":2,\"bodyb_1\":0}', '[{\"money\":5856,\"name\":\"cash\"},{\"money\":12611,\"name\":\"dirtycash\"},{\"money\":64554,\"name\":\"bank\"},{\"money\":0,\"name\":\"chip\"}]', '[{\"name\":\"basic_key\",\"count\":1},{\"name\":\"phone\",\"count\":1}]', '[]', 'police', 9, 'ballas', 1, 0, '[{\"name\":\"hunger\",\"val\":156500,\"percent\":15.65},{\"name\":\"thirst\",\"val\":242375,\"percent\":24.2375}]', NULL, 'jjo', 'kkp', '29/03/2000', 'm', '180', NULL, 0, 1, NULL, 0, NULL, NULL, 'NL1234', 1234, 'https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200008/91087328-icono-de-perfil-de-avatar-predeterminado-para-mujer-marcador-de-posición-de-foto-gris-vector-de-ilus.jpg?ver=6', '{\"inSearch\":false,\"motivo\":\"\"}', '{\"danger\":false,\"motivo\":\"\"}'),
('license:a0ddd60d64e43f8ca3b5e19bfc30502bc7f3b950', '_dev', 0, '{\"z\":31.89999961853027,\"y\":-978.4000244140625,\"x\":426.6000061035156}', '{\"decals_2\":0,\"bproof_1\":0,\"makeup_1\":0,\"helmet_1\":-1,\"age_2\":0,\"ears_2\":0,\"helmet_2\":0,\"chest_2\":0,\"eyebrows_2\":0,\"hair_1\":0,\"bags_1\":0,\"chest_1\":0,\"bracelets_2\":0,\"lipstick_3\":0,\"complexion_2\":0,\"shoes_1\":7,\"mask_1\":0,\"blemishes_1\":0,\"bags_2\":0,\"torso_1\":282,\"chain_1\":0,\"arms\":0,\"hair_color_2\":0,\"eyebrows_4\":0,\"pants_1\":27,\"watches_1\":-1,\"bracelets_1\":-1,\"lipstick_4\":0,\"ears_1\":-1,\"hair_2\":0,\"lipstick_2\":0,\"chest_3\":0,\"skin\":0,\"face\":0,\"shoes_2\":0,\"sex\":0,\"glasses_1\":0,\"blush_1\":0,\"bproof_2\":0,\"sun_2\":0,\"complexion_1\":0,\"blemishes_2\":0,\"eye_color\":0,\"glasses_2\":0,\"eyebrows_1\":0,\"torso_2\":0,\"beard_3\":0,\"lipstick_1\":0,\"beard_2\":0,\"bodyb_1\":0,\"age_1\":0,\"beard_4\":0,\"decals_1\":0,\"moles_2\":0,\"watches_2\":0,\"chain_2\":0,\"arms_2\":0,\"makeup_2\":0,\"blush_2\":0,\"mask_2\":0,\"eyebrows_3\":0,\"hair_color_1\":0,\"sun_1\":0,\"moles_1\":0,\"pants_2\":3,\"makeup_3\":0,\"beard_1\":0,\"makeup_4\":0,\"tshirt_2\":3,\"blush_3\":0,\"bodyb_2\":0,\"tshirt_1\":15}', '[{\"name\":\"cash\",\"money\":0},{\"name\":\"dirtycash\",\"money\":206},{\"name\":\"bank\",\"money\":72316},{\"name\":\"chip\",\"money\":0}]', '[{\"name\":\"weed_pooch\",\"count\":60},{\"name\":\"radio\",\"count\":2},{\"name\":\"phone\",\"count\":1}]', '[{\"name\":\"WEAPON_CARBINERIFLE\",\"label\":\"Carabine d\'assaut\",\"components\":[],\"ammo\":250},{\"name\":\"WEAPON_SNIPERRIFLE\",\"label\":\"Fusil de sniper\",\"components\":[],\"ammo\":250},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"label\":\"Fusil à pompe\",\"components\":[],\"ammo\":60},{\"name\":\"WEAPON_FLASHLIGHT\",\"label\":\"Lampe torche\",\"components\":[],\"ammo\":250},{\"name\":\"WEAPON_NIGHTSTICK\",\"label\":\"Matraque\",\"components\":[],\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"label\":\"Pistolet de combat\",\"components\":[],\"ammo\":60},{\"name\":\"WEAPON_STUNGUN\",\"label\":\"Tazer\",\"components\":[],\"ammo\":250}]', 'police', 3, 'vagos', 2, 0, '[{\"name\":\"hunger\",\"val\":311400,\"percent\":31.14},{\"name\":\"thirst\",\"val\":358550,\"percent\":35.855}]', NULL, 'edward', 'carter', '23/10/1996', 'm', '180', NULL, 0, 1, NULL, 0, NULL, NULL, 'OK370971', NULL, 'https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200008/91087328-icono-de-perfil-de-avatar-predeterminado-para-mujer-marcador-de-posición-de-foto-gris-vector-de-ilus.jpg?ver=6', '{\"inSearch\":false,\"motivo\":\"\"}', '{\"danger\":false,\"motivo\":\"\"}');

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`model`, `name`, `price`, `category`) VALUES
('CHIMERA', 'CHIMERA', 55000, 'motorcycles'),
('adder', 'Adder', 500000, 'super'),
('akuma', 'Akuma', 17500, 'motorcycles'),
('alpha', 'Alpha', 60000, 'sports'),
('asea', 'Asea', 15000, 'sedans'),
('autarch', 'Autarch', 900000, 'super'),
('avarus', 'Avarus', 42000, 'motorcycles'),
('bagger', 'Bagger', 14000, 'motorcycles'),
('baller2', 'Baller', 50000, 'suvs'),
('baller3', 'Baller Sport', 75000, 'suvs'),
('banshee', 'Banshee', 40000, 'sports'),
('banshee2', 'Banshee 900R', 125000, 'super'),
('bati', 'Bati 801', 38500, 'motorcycles'),
('bati2', 'Bati 801RR', 14000, 'motorcycles'),
('bestiagts', 'Bestia GTS', 55000, 'sports'),
('bf400', 'BF400', 13500, 'motorcycles'),
('bfinjection', 'Bf Injection', 16000, 'offroad'),
('bifta', 'Bifta', 12000, 'offroad'),
('bike', 'Velo Moteur', 17500, 'motorcycles'),
('bison', 'Bison', 45000, 'vans'),
('blade', 'Blade', 15000, 'muscle'),
('blazer', 'Blazer', 6950, 'offroad'),
('blazer4', 'Blazer Sport', 8500, 'offroad'),
('blista', 'Blista', 7250, 'compacts'),
('bmws19', 'Bmw', 50000, 'motorcycles'),
('bmx', 'BMX (velo)', 820, 'motorcycles'),
('bobcatxl', 'Bobcat XL', 32000, 'vans'),
('brawler', 'Brawler', 125000, 'offroad'),
('brioso', 'Brioso R/A', 7500, 'compacts'),
('brioso2', 'Brioso', 5000, 'compacts'),
('btype', 'Btype', 110000, 'sportsclassics'),
('btype2', 'Btype Hotroad', 155000, 'sportsclassics'),
('btype3', 'Btype Luxe', 120000, 'sportsclassics'),
('buccaneer', 'Buccaneer', 18000, 'muscle'),
('buccaneer2', 'Buccaneer Rider', 15000, 'muscle'),
('buffalo', 'Buffalo', 18000, 'sports'),
('buffalo2', 'Buffalo S', 28750, 'sports'),
('bullet', 'Bullet', 90000, 'super'),
('burrito3', 'Burrito', 19000, 'vans'),
('camper', 'Camper', 35000, 'vans'),
('carbonizzare', 'Carbonizzare', 75000, 'sports'),
('carbonrs', 'Carbon RS', 14500, 'motorcycles'),
('casco', 'Casco', 30000, 'sportsclassics'),
('cavalcade2', 'Cavalcade', 40000, 'suvs'),
('cheetah', 'Cheetah', 22000, 'super'),
('chimera', 'Chimera', 12800, 'motorcycles'),
('chino', 'Chino', 18000, 'muscle'),
('chino2', 'Chino Luxe', 18000, 'muscle'),
('cliffhanger', 'cliffhanger', 30000, 'motorcycles'),
('cogcabrio', 'Cognoscenti Cabrio', 55000, 'coupes'),
('cognoscenti', 'Cognoscenti', 19000, 'sedans'),
('comet2', 'Comet', 75000, 'sports'),
('comet5', 'Comet 5', 400000, 'sports'),
('contender', 'Contender', 35000, 'suvs'),
('coquette', 'Coquette', 65000, 'sports'),
('coquette2', 'Coquette Classic', 40000, 'sportsclassics'),
('coquette3', 'Coquette BlackFin', 55000, 'muscle'),
('coquette4', 'Coquette 4', 300000, 'super'),
('cruiser', 'Cruiser (velo)', 875, 'motorcycles'),
('cyclone', 'Cyclone', 1890000, 'super'),
('daemon', 'Daemon', 11500, 'motorcycles'),
('daemon2', 'Daemon High', 19000, 'motorcycles'),
('defiler', 'Defiler', 20000, 'motorcycles'),
('dinghy3', 'Dinghy', 2500000, 'superboat'),
('dominator', 'Dominator', 35000, 'muscle'),
('double', 'Double T', 15000, 'motorcycles'),
('dubsta', 'Dubsta', 45000, 'suvs'),
('dubsta2', 'Dubsta Luxuary', 60000, 'suvs'),
('dubsta3', 'Bubsta 6x6', 235000, 'offroad'),
('dukes', 'Dukes', 28000, 'muscle'),
('dune', 'Dune Buggy', 8000, 'offroad'),
('elegy2', 'Elegy', 38500, 'sports'),
('emperor', 'Emperor', 8500, 'sedans'),
('enduro', 'Enduro', 10500, 'motorcycles'),
('entityxf', 'Entity XF', 210000, 'super'),
('esskey', 'Esskey', 14000, 'motorcycles'),
('exemplar', 'Exemplar', 25500, 'coupes'),
('f620', 'F620', 22000, 'coupes'),
('faction', 'Faction', 20000, 'muscle'),
('faction2', 'Faction Rider', 30000, 'muscle'),
('faction3', 'Faction XL', 40000, 'muscle'),
('faggio', 'Faggio', 2500, 'motorcycles'),
('faggio2', 'Vespa', 5250, 'motorcycles'),
('felon', 'Felon', 42000, 'coupes'),
('felon2', 'Felon GT', 18000, 'coupes'),
('feltzer2', 'Feltzer', 62000, 'sports'),
('feltzer3', 'Stirling GT', 65000, 'sportsclassics'),
('fixter', 'Fixter (velo)', 500, 'motorcycles'),
('fmj', 'FMJ', 185000, 'super'),
('fq2', 'Fhantom', 12500, 'suvs'),
('frogger', 'Frogger', 3250000, 'avionfdp'),
('fugitive', 'Fugitive', 12000, 'sedans'),
('furoregt', 'Furore GT', 45000, 'sports'),
('fusilade', 'Fusilade', 40000, 'sports'),
('gargoyle', 'Gargoyle', 24000, 'motorcycles'),
('gauntlet', 'Gauntlet', 30000, 'muscle'),
('gburrito', 'Gang Burrito', 45000, 'vans'),
('gburrito2', 'Burrito', 29000, 'vans'),
('glendale', 'Glendale', 12300, 'sedans'),
('granger', 'Grabger', 50000, 'suvs'),
('gresley', 'Gresley', 30000, 'suvs'),
('gt500', 'GT 500', 75000, 'sportsclassics'),
('guardian', 'Guardian', 45000, 'offroad'),
('hakuchou', 'Hakuchou', 41000, 'motorcycles'),
('hakuchou2', 'Hakuchou Sport', 47000, 'motorcycles'),
('hermes', 'Hermes', 535000, 'muscle'),
('hexer', 'Hexer', 7500, 'motorcycles'),
('hotknife', 'Hotknife', 125000, 'muscle'),
('huntley', 'Huntley S', 40000, 'suvs'),
('hustler', 'Hustler', 530000, 'muscle'),
('infernus', 'Infernus', 180000, 'super'),
('innovation', 'Innovation', 8000, 'motorcycles'),
('intruder', 'Intruder', 7500, 'sedans'),
('italigto', 'Italigto ', 450000, 'super'),
('italirsx', 'Italirsx', 250000, 'super'),
('jackal', 'Jackal', 42000, 'coupes'),
('jester', 'Jester', 65000, 'sports'),
('jester2', 'Jester(Racecar)', 135000, 'sports'),
('jetmax', 'Jetmax', 1500000, 'superboat'),
('journey', 'Journey', 6850, 'vans'),
('kamacho', 'Kamacho', 345000, 'offroad'),
('khamelion', 'Khamelion', 75000, 'sports'),
('kuruma', 'Kuruma', 50000, 'sports'),
('landstalker', 'Landstalker', 35000, 'suvs'),
('le7b', 'RE-7B', 325000, 'super'),
('luxor', 'Luxor', 5000000, 'avionfdp'),
('luxor2', 'Luxor Deluxe', 10000000, 'avionfdp'),
('lynx', 'Lynx', 40000, 'sports'),
('mamba', 'Mamba', 90000, 'sports'),
('mammatus', 'Mammatus', 2750000, 'avionfdp'),
('manana', 'Manana', 12800, 'sportsclassics'),
('manchez', 'Manchez', 19000, 'motorcycles'),
('manchez2', 'Manchez 2', 16500, 'motorcycles'),
('marquis', 'Marquis', 3500000, 'superboat'),
('massacro', 'Massacro', 65000, 'sports'),
('massacro2', 'Massacro(Racecar)', 130000, 'sports'),
('mesa', 'Mesa', 16000, 'suvs'),
('mesa3', 'Mesa Trail', 32500, 'suvs'),
('minivan', 'Minivan', 8000, 'vans'),
('monroe', 'Monroe', 55000, 'sportsclassics'),
('moonbeam', 'Moonbeam', 18000, 'vans'),
('moonbeam2', 'Moonbeam Rider', 35000, 'vans'),
('mt09', 'mt09', 55000, 'motorcycles'),
('nemesis', 'Nemesis', 19000, 'motorcycles'),
('neon', 'Neon', 400000, 'sports'),
('nightblade', 'Nightblade', 45000, 'motorcycles'),
('nightshade', 'Nightshade', 110000, 'muscle'),
('ninef2', '9F Cabrio', 80000, 'sports'),
('novak ', 'Novak', 175000, 'suvs'),
('omnis', 'Omnis', 120000, 'sports'),
('oracle2', 'Oracle XS', 13000, 'coupes'),
('osiris', 'Osiris', 190000, 'super'),
('panto', 'Panto', 2750, 'compacts'),
('paradise', 'Paradise', 10000, 'vans'),
('paragon', 'Paragon', 475000, 'sports'),
('pariah', 'Pariah', 1420000, 'sports'),
('patriot', 'Patriot', 35000, 'suvs'),
('pcj', 'PCJ-600', 14000, 'motorcycles'),
('penumbra', 'Penumbra', 28000, 'sports'),
('pfister811', 'Pfister', 145000, 'super'),
('phoenix', 'Phoenix', 12500, 'muscle'),
('picador', 'Picador', 18000, 'muscle'),
('pigalle', 'Pigalle', 20000, 'sportsclassics'),
('prairie', 'Prairie', 6750, 'compacts'),
('premier', 'Premier', 8000, 'sedans'),
('primo2', 'Primo Custom', 14000, 'sedans'),
('prototipo', 'X80 Proto', 2500000, 'super'),
('r6', 'Yamaha r6', 75000, 'motorcycles'),
('radi', 'Radius', 29000, 'suvs'),
('raiden', 'raiden', 150000, 'sports'),
('rapidgt', 'Rapid GT', 55000, 'sports'),
('rapidgt2', 'Rapid GT Convertible', 75000, 'sports'),
('rapidgt3', 'Rapid GT3', 88500, 'sportsclassics'),
('reaper', 'Reaper', 150000, 'super'),
('rebel2', 'Rebel', 35000, 'offroad'),
('rebla', 'Rebla', 350000, 'suvs'),
('regina', 'Regina', 5500, 'sedans'),
('retinue', 'Retinue', 61500, 'sportsclassics'),
('riata', 'riata', 380000, 'offroad'),
('rocoto', 'Rocoto', 33000, 'suvs'),
('rogue', 'Rogue', 4500000, 'avionfdp'),
('ruffian', 'Ruffian', 12000, 'motorcycles'),
('rumpo', 'Rumpo', 15000, 'vans'),
('rumpo3', 'Rumpo Trail', 19500, 'vans'),
('sabregt', 'Sabre Turbo', 20000, 'muscle'),
('sabregt2', 'Sabre GT', 25000, 'muscle'),
('sanchez', 'Sanchez', 13000, 'motorcycles'),
('sanchez2', 'Sanchez Sport', 19000, 'motorcycles'),
('sanctus', 'Sanctus', 55000, 'motorcycles'),
('sandking', 'Sandking', 55000, 'offroad'),
('savestra', 'Savestra', 75000, 'sportsclassics'),
('sc1', 'SC 1', 800000, 'super'),
('schafter2', 'Schafter', 80000, 'sedans'),
('schafter3', 'Schafter V12', 100000, 'sports'),
('scorcher', 'Scorcher (velo)', 650, 'motorcycles'),
('seashark', 'SeaShark', 375000, 'superboat'),
('seashark2', 'Seashark2', 450000, 'superboat'),
('seminole', 'Seminole', 150000, 'suvs'),
('sentinel', 'Sentinel', 32000, 'coupes'),
('sentinel2', 'Sentinel XS', 15500, 'coupes'),
('sentinel3', 'Sentinel3', 11500, 'sports'),
('seven70', 'Seven 70', 39500, 'sports'),
('sheava', 'ETR1', 220000, 'super'),
('slamvan3', 'Slam Van', 11500, 'muscle'),
('sovereign', 'Sovereign', 20000, 'motorcycles'),
('speeder', 'Speeder', 2500000, 'superboat'),
('squalo', 'Squalo', 1350000, 'superboat'),
('stinger', 'Stinger', 80000, 'sportsclassics'),
('stingergt', 'Stinger GT', 75000, 'sportsclassics'),
('streiter', 'Streiter', 250000, 'sports'),
('stretch', 'Stretch', 90000, 'sedans'),
('sultan', 'Sultan', 40000, 'sports'),
('sultan3', 'Sultan 3', 65000, 'sports'),
('sultanrs', 'Sultan RS', 250000, 'super'),
('suntrap', 'Stuntrap', 1250000, 'superboat'),
('superd', 'Super Diamond', 130000, 'sedans'),
('supervolito', 'SuperVolito', 8500000, 'avionfdp'),
('surano', 'Surano', 50000, 'sports'),
('surfer', 'Surfer', 12000, 'vans'),
('swift', 'Swift', 6500000, 'avionfdp'),
('swift2', 'Swift Deluxe', 7500000, 'avionfdp'),
('t20', 'T20', 500000, 'super'),
('tampa', 'Tampa', 16000, 'muscle'),
('tampa2', 'Drift Tampa', 80000, 'sports'),
('thrax ', 'Thrax', 350000, 'super'),
('thrust', 'Thrust', 22000, 'motorcycles'),
('toro', 'Toro', 1750000, 'superboat'),
('tribike3', 'Tri bike (velo)', 850, 'motorcycles'),
('trophytruck', 'Trophy Truck', 60000, 'offroad'),
('trophytruck2', 'Trophy Truck Limited', 80000, 'offroad'),
('tropic', 'Tropic', 1000000, 'superboat'),
('tropos', 'Tropos', 175000, 'sports'),
('turismor', 'Turismo R', 340000, 'super'),
('tyrus', 'Tyrus', 600000, 'super'),
('vacca', 'Vacca', 120000, 'super'),
('vader', 'Vader', 9000, 'motorcycles'),
('vagrant', 'vagrant', 55000, 'offroad'),
('velum', 'Velum', 2250000, 'avionfdp'),
('verlierer2', 'Verlierer', 70000, 'sports'),
('verus ', 'Verus', 15000, 'offroad'),
('vestra', 'Vestra', 4250000, 'avionfdp'),
('vigero', 'Vigero', 12500, 'muscle'),
('virgo', 'Virgo', 14000, 'muscle'),
('viseris', 'Viseris', 90000, 'sportsclassics'),
('visione', 'Visione', 2250000, 'super'),
('voltic', 'Voltic', 900000, 'super'),
('voodoo', 'Voodoo', 7200, 'muscle'),
('vortex', 'Vortex', 15000, 'motorcycles'),
('warrener', 'Warrener', 5000, 'sedans'),
('washington', 'Washington', 9000, 'sedans'),
('weevil', 'Weevil', 7500, 'compacts'),
('windsor', 'Windsor', 95000, 'coupes'),
('windsor2', 'Windsor Drop', 42000, 'coupes'),
('wolfsbane', 'Woflsbane', 18000, 'motorcycles'),
('xls', 'XLS', 21000, 'suvs'),
('yosemite', 'Yosemite', 120000, 'muscle'),
('youga', 'Youga', 10800, 'vans'),
('youga2', 'Youga Luxuary', 6500, 'vans'),
('z190', 'Z190', 90000, 'sportsclassics'),
('zentorno', 'Zentorno', 700000, 'super'),
('zion', 'Zion', 36000, 'coupes'),
('zion2', 'Zion Cabrio', 12500, 'coupes'),
('zombiea', 'Zombie', 9500, 'motorcycles'),
('zombieb', 'Zombie Luxuary', 10000, 'motorcycles'),
('ztype', 'Z-Type', 80000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`, `society`) VALUES
('compacts', 'Compacts', 'carshop'),
('coupes', 'Coupes', 'carshop'),
('motorcycles', 'Motos', 'carshop'),
('muscle', 'Muscle', 'carshop'),
('offroad', 'Off Road', 'carshop'),
('sedans', 'Sedans', 'carshop'),
('sports', 'Sports', 'carshop'),
('sportsclassics', 'Sports Classics', 'carshop'),
('super', 'Super', 'carshop'),
('suvs', 'SUVs', 'carshop'),
('vans', 'Vans', 'carshop');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `license` (`license`);

--
-- Index pour la table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_account_data_account_name` (`account_name`(191)) USING BTREE,
  ADD KEY `index_addon_account_data_account_name_owner` (`account_name`(191),`owner`) USING BTREE;

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE;

--
-- Index pour la table `appels_ems`
--
ALTER TABLE `appels_ems`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `car_parking`
--
ALTER TABLE `car_parking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_characters_identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `clothes_data`
--
ALTER TABLE `clothes_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffre_builder`
--
ALTER TABLE `coffre_builder`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_datastore_data_name` (`name`) USING BTREE,
  ADD KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE;

--
-- Index pour la table `data_inventory`
--
ALTER TABLE `data_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Index pour la table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `eventspresets`
--
ALTER TABLE `eventspresets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fav_emote`
--
ALTER TABLE `fav_emote`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `fuel_stations`
--
ALTER TABLE `fuel_stations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `garage`
--
ALTER TABLE `garage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `groupid` (`groupid`) USING BTREE;

--
-- Index pour la table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Index pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_instas_gksphone_insto_accounts` (`authorId`);

--
-- Index pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_accounts` (`authorId`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_instas` (`inapId`);

--
-- Index pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_gksphone_insto_story_gksphone_insto_accounts` (`authorId`) USING BTREE;

--
-- Index pour la table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_mails`
--
ALTER TABLE `gksphone_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tinderacc`
--
ALTER TABLE `gksphone_tinderacc`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tindermatch`
--
ALTER TABLE `gksphone_tindermatch`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tindermessage`
--
ALTER TABLE `gksphone_tindermessage`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Index pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_accounts` (`authorId`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_tweets` (`tweetId`);

--
-- Index pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` (`authorId`);

--
-- Index pour la table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `id_card`
--
ALTER TABLE `id_card`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inside_jobs`
--
ALTER TABLE `inside_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `kc_jails`
--
ALTER TABLE `kc_jails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `kc_warns`
--
ALTER TABLE `kc_warns`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `newkaizo_houses`
--
ALTER TABLE `newkaizo_houses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `okokbanking_transactions`
--
ALTER TABLE `okokbanking_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `okokbilling`
--
ALTER TABLE `okokbilling`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Index pour la table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prop`
--
ALTER TABLE `prop`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `property_created`
--
ALTER TABLE `property_created`
  ADD PRIMARY KEY (`propertyID`);

--
-- Index pour la table `prop_owner`
--
ALTER TABLE `prop_owner`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `society`
--
ALTER TABLE `society`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `truck_inventory2`
--
ALTER TABLE `truck_inventory2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `identifier_2` (`identifier`),
  ADD UNIQUE KEY `identifier_3` (`identifier`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account_info`
--
ALTER TABLE `account_info`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1690;

--
-- AUTO_INCREMENT pour la table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16599;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT pour la table `appels_ems`
--
ALTER TABLE `appels_ems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6902;

--
-- AUTO_INCREMENT pour la table `car_parking`
--
ALTER TABLE `car_parking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clothes_data`
--
ALTER TABLE `clothes_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `coffre_builder`
--
ALTER TABLE `coffre_builder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40440;

--
-- AUTO_INCREMENT pour la table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fuel_stations`
--
ALTER TABLE `fuel_stations`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1243;

--
-- AUTO_INCREMENT pour la table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gksphone_mails`
--
ALTER TABLE `gksphone_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gksphone_tinderacc`
--
ALTER TABLE `gksphone_tinderacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_tindermatch`
--
ALTER TABLE `gksphone_tindermatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_tindermessage`
--
ALTER TABLE `gksphone_tindermessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78418525;

--
-- AUTO_INCREMENT pour la table `kc_jails`
--
ALTER TABLE `kc_jails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `kc_warns`
--
ALTER TABLE `kc_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `okokbanking_transactions`
--
ALTER TABLE `okokbanking_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `okokbilling`
--
ALTER TABLE `okokbilling`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT pour la table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `property_created`
--
ALTER TABLE `property_created`
  MODIFY `propertyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `truck_inventory2`
--
ALTER TABLE `truck_inventory2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD CONSTRAINT `FK_phonegroupmessage` FOREIGN KEY (`groupid`) REFERENCES `gksphone_messages_group` (`id`);

--
-- Contraintes pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD CONSTRAINT `FK_gksphone_insto_instas_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Contraintes pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `gksphone_insto_instas` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD CONSTRAINT `FK_gksphone_insto_story_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Contraintes pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `gksphone_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD CONSTRAINT `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
