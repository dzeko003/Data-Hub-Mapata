-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 23 fév. 2026 à 01:28
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `datahub`
--

CREATE DATABASE IF NOT EXISTS datahub;
USE datahub;
-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `icon` varchar(10) DEFAULT NULL COMMENT 'Emoji icon',
  `description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `label`, `icon`, `description`, `display_order`, `is_active`, `created_at`) VALUES
(1, 'climat', 'Climat & Environnement', '🌍', NULL, 1, 1, '2026-02-14 15:13:12'),
(2, 'telecom', 'Télécommunications', '📡', NULL, 2, 1, '2026-02-14 15:13:12'),
(3, 'finance', 'Finance & Économie', '💰', NULL, 3, 1, '2026-02-14 15:13:12'),
(4, 'sante', 'Santé', '🏥', NULL, 4, 1, '2026-02-14 15:13:12'),
(5, 'mobilite', 'Mobilité & Transport', '🚗', NULL, 5, 1, '2026-02-14 15:13:12'),
(6, 'agriculture', 'Agriculture', '🌾', NULL, 6, 1, '2026-02-14 15:13:12'),
(7, 'education', 'Éducation', '📚', NULL, 7, 1, '2026-02-14 15:13:12'),
(8, 'energie', 'Énergie', '⚡', NULL, 8, 1, '2026-02-14 15:13:12'),
(9, 'demographie', 'Démographie', '👥', NULL, 9, 1, '2026-02-14 15:13:12'),
(10, 'commerce', 'Commerce', '🛒', NULL, 10, 1, '2026-02-14 15:13:12');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(3) NOT NULL COMMENT 'ISO 3166-1 alpha-3',
  `name_fr` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `region` varchar(50) DEFAULT NULL COMMENT 'North Africa, West Africa, etc.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name_fr`, `name_en`, `region`, `created_at`) VALUES
(1, 'DZA', 'Algérie', 'Algeria', 'North Africa', '2026-02-14 15:13:12'),
(2, 'AGO', 'Angola', 'Angola', 'Central Africa', '2026-02-14 15:13:12'),
(3, 'BEN', 'Bénin', 'Benin', 'West Africa', '2026-02-14 15:13:12'),
(4, 'BWA', 'Botswana', 'Botswana', 'Southern Africa', '2026-02-14 15:13:12'),
(5, 'BFA', 'Burkina Faso', 'Burkina Faso', 'West Africa', '2026-02-14 15:13:12'),
(6, 'BDI', 'Burundi', 'Burundi', 'East Africa', '2026-02-14 15:13:12'),
(7, 'CMR', 'Cameroun', 'Cameroon', 'Central Africa', '2026-02-14 15:13:12'),
(8, 'CPV', 'Cap-Vert', 'Cape Verde', 'West Africa', '2026-02-14 15:13:12'),
(9, 'CAF', 'Centrafrique', 'Central African Republic', 'Central Africa', '2026-02-14 15:13:12'),
(10, 'COM', 'Comores', 'Comoros', 'East Africa', '2026-02-14 15:13:12'),
(11, 'COG', 'Congo', 'Republic of the Congo', 'Central Africa', '2026-02-14 15:13:12'),
(12, 'CIV', 'Côte d\'Ivoire', 'Ivory Coast', 'West Africa', '2026-02-14 15:13:12'),
(13, 'DJI', 'Djibouti', 'Djibouti', 'East Africa', '2026-02-14 15:13:12'),
(14, 'EGY', 'Égypte', 'Egypt', 'North Africa', '2026-02-14 15:13:12'),
(15, 'ERI', 'Érythrée', 'Eritrea', 'East Africa', '2026-02-14 15:13:12'),
(16, 'SWZ', 'Eswatini', 'Eswatini', 'Southern Africa', '2026-02-14 15:13:12'),
(17, 'ETH', 'Éthiopie', 'Ethiopia', 'East Africa', '2026-02-14 15:13:12'),
(18, 'GAB', 'Gabon', 'Gabon', 'Central Africa', '2026-02-14 15:13:12'),
(19, 'GMB', 'Gambie', 'Gambia', 'West Africa', '2026-02-14 15:13:12'),
(20, 'GHA', 'Ghana', 'Ghana', 'West Africa', '2026-02-14 15:13:12'),
(21, 'GIN', 'Guinée', 'Guinea', 'West Africa', '2026-02-14 15:13:12'),
(22, 'GNB', 'Guinée-Bissau', 'Guinea-Bissau', 'West Africa', '2026-02-14 15:13:12'),
(23, 'GNQ', 'Guinée équatoriale', 'Equatorial Guinea', 'Central Africa', '2026-02-14 15:13:12'),
(24, 'KEN', 'Kenya', 'Kenya', 'East Africa', '2026-02-14 15:13:12'),
(25, 'LSO', 'Lesotho', 'Lesotho', 'Southern Africa', '2026-02-14 15:13:12'),
(26, 'LBR', 'Liberia', 'Liberia', 'West Africa', '2026-02-14 15:13:12'),
(27, 'LBY', 'Libye', 'Libya', 'North Africa', '2026-02-14 15:13:12'),
(28, 'MDG', 'Madagascar', 'Madagascar', 'East Africa', '2026-02-14 15:13:12'),
(29, 'MWI', 'Malawi', 'Malawi', 'East Africa', '2026-02-14 15:13:12'),
(30, 'MLI', 'Mali', 'Mali', 'West Africa', '2026-02-14 15:13:12'),
(31, 'MAR', 'Maroc', 'Morocco', 'North Africa', '2026-02-14 15:13:12'),
(32, 'MUS', 'Maurice', 'Mauritius', 'East Africa', '2026-02-14 15:13:12'),
(33, 'MRT', 'Mauritanie', 'Mauritania', 'West Africa', '2026-02-14 15:13:12'),
(34, 'MOZ', 'Mozambique', 'Mozambique', 'East Africa', '2026-02-14 15:13:12'),
(35, 'NAM', 'Namibie', 'Namibia', 'Southern Africa', '2026-02-14 15:13:12'),
(36, 'NER', 'Niger', 'Niger', 'West Africa', '2026-02-14 15:13:12'),
(37, 'NGA', 'Nigeria', 'Nigeria', 'West Africa', '2026-02-14 15:13:12'),
(38, 'UGA', 'Ouganda', 'Uganda', 'East Africa', '2026-02-14 15:13:12'),
(39, 'COD', 'RD Congo', 'Democratic Republic of the Congo', 'Central Africa', '2026-02-14 15:13:12'),
(40, 'RWA', 'Rwanda', 'Rwanda', 'East Africa', '2026-02-14 15:13:12'),
(41, 'STP', 'São Tomé-et-Príncipe', 'São Tomé and Príncipe', 'Central Africa', '2026-02-14 15:13:12'),
(42, 'SEN', 'Sénégal', 'Senegal', 'West Africa', '2026-02-14 15:13:12'),
(43, 'SYC', 'Seychelles', 'Seychelles', 'East Africa', '2026-02-14 15:13:12'),
(44, 'SLE', 'Sierra Leone', 'Sierra Leone', 'West Africa', '2026-02-14 15:13:12'),
(45, 'SOM', 'Somalie', 'Somalia', 'East Africa', '2026-02-14 15:13:12'),
(46, 'SDN', 'Soudan', 'Sudan', 'East Africa', '2026-02-14 15:13:12'),
(47, 'SSD', 'Soudan du Sud', 'South Sudan', 'East Africa', '2026-02-14 15:13:12'),
(48, 'TZA', 'Tanzanie', 'Tanzania', 'East Africa', '2026-02-14 15:13:12'),
(49, 'TCD', 'Tchad', 'Chad', 'Central Africa', '2026-02-14 15:13:12'),
(50, 'TGO', 'Togo', 'Togo', 'West Africa', '2026-02-14 15:13:12'),
(51, 'TUN', 'Tunisie', 'Tunisia', 'North Africa', '2026-02-14 15:13:12'),
(52, 'ZMB', 'Zambie', 'Zambia', 'East Africa', '2026-02-14 15:13:12'),
(53, 'ZWE', 'Zimbabwe', 'Zimbabwe', 'East Africa', '2026-02-14 15:13:12');

-- --------------------------------------------------------

--
-- Structure de la table `datasets`
--

CREATE TABLE `datasets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `license_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `long_description` text DEFAULT NULL COMMENT 'Detailed markdown description',
  `format` varchar(20) NOT NULL COMMENT 'csv, xlsx, json, xml, shp, zip, etc.',
  `file_size` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Size in bytes',
  `file_url` varchar(500) DEFAULT NULL COMMENT 'S3, local storage path',
  `preview_url` varchar(500) DEFAULT NULL COMMENT 'URL to preview/thumbnail',
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sector` bigint(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `geographic_coverage` varchar(100) DEFAULT NULL COMMENT 'National, Regional, Local, Pan-African',
  `is_free` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `downloads_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `views_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `favorites_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rating_average` decimal(3,2) NOT NULL DEFAULT 0.00 COMMENT '0.00 to 5.00',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `current_version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `update_frequency` varchar(50) DEFAULT NULL COMMENT 'Daily, Weekly, Monthly, Yearly, One-time',
  `temporal_coverage_start` date DEFAULT NULL COMMENT 'Data start date',
  `temporal_coverage_end` date DEFAULT NULL COMMENT 'Data end date',
  `source` varchar(255) DEFAULT NULL COMMENT 'Original data source',
  `methodology` text DEFAULT NULL COMMENT 'How data was collected',
  `status` enum('draft','published','archived','suspended') NOT NULL DEFAULT 'draft',
  `published_at` timestamp NULL DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL COMMENT 'When data was last updated',
  `meta_keywords` text DEFAULT NULL COMMENT 'Comma-separated keywords',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `datasets`
--

INSERT INTO `datasets` (`id`, `user_id`, `category_id`, `license_id`, `name`, `slug`, `description`, `long_description`, `format`, `file_size`, `file_url`, `preview_url`, `country_id`, `sector`, `city`, `geographic_coverage`, `is_free`, `price`, `currency`, `downloads_count`, `views_count`, `favorites_count`, `rating_average`, `rating_count`, `current_version`, `update_frequency`, `temporal_coverage_start`, `temporal_coverage_end`, `source`, `methodology`, `status`, `published_at`, `last_updated_at`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(2, 8, 1, 1, 'Amazone_sales', 'amazone-sales', 'sales of years', 'azertyy', 'csv', 1877207, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/2/1771548071_nWcc3UIuNU.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/2/1771548071_nWcc3UIuNU.csv', 1, NULL, 'Brazzaville', NULL, 1, 0.00, 'EUR', 0, 1, 0, 4.20, 5, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-19 23:41:11', '2026-02-19 23:41:11', NULL, '2026-02-19 23:41:11', '2026-02-22 14:49:39'),
(3, 8, 1, 1, 'amazon_sales_dataset.csv', 'amazon-sales-datasetcsv', 'Statistiques détaillées sur le système éducatif marocain: taux de scolarisation, alphabétisation, infrastructures.', 'Données sur la couverture réseau mobile, pénétration internet et infrastructures télécom dans 54 pays africains.', 'csv', 1877207, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/3/1771659205_HNHEoncGCR.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/3/1771659205_HNHEoncGCR.csv', 1, NULL, 'Brazzaville', NULL, 1, 0.00, 'EUR', 0, 1, 0, 3.00, 4, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-21 06:33:25', '2026-02-21 06:33:25', NULL, '2026-02-21 06:33:25', '2026-02-22 14:15:13'),
(4, 8, 1, 1, 'amazon_sales_dataset.csv', 'amazon-sales-datasetcsv-1', 'Statistiques détaillées sur le système éducatif marocain: taux de scolarisation, alphabétisation, infrastructures.', 'Données sur la couverture réseau mobile, pénétration internet et infrastructures télécom dans 54 pays africains.', 'csv', 1877207, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/4/1771659238_Y3ObBadoDZ.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/4/1771659238_Y3ObBadoDZ.csv', 1, NULL, 'Brazzaville', NULL, 1, 0.00, 'EUR', 1, 13, 0, 4.00, 8, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-21 06:33:58', '2026-02-21 06:33:58', NULL, '2026-02-21 06:33:58', '2026-02-22 15:41:36'),
(5, 8, 4, 2, 'the oval saison 2', 'the-oval-saison-2', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 'csv', 1877207, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/5/1771674636_bX1MVgTAfA.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/5/1771674636_bX1MVgTAfA.csv', 7, 3, 'yaounde', NULL, 1, 0.00, 'EUR', 0, 18, 0, 4.40, 5, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-21 10:50:36', '2026-02-21 10:50:36', NULL, '2026-02-21 10:50:36', '2026-02-22 14:48:40'),
(6, 8, 4, 2, 'Données climatiques du Sénégal 2020-2024', 'donnees-climatiques-du-senegal-2020-2024', 'Données météorologiques historiques incluant température, précipitations et humidité pour toutes les régions du Sénégal.', 'Données météorologiques historiques incluant température, précipitations et humidité pour toutes les régions du Sénégal.', 'csv', 1877207, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/6/1771714151_yxTNZbydI2.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/6/1771714151_yxTNZbydI2.csv', 42, 7, 'Dakar', NULL, 0, 15.00, 'EUR', 0, 9, 0, 4.00, 6, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-21 21:49:11', '2026-02-21 21:49:11', NULL, '2026-02-21 21:49:11', '2026-02-22 14:47:31'),
(7, 8, 5, 1, 'Football Transfer Value Intelligence 2026', 'football-transfer-value-intelligence-2026', 'Football transfer valuations tell a story — not just of money, but of careers, peak performances, club decisions and the economics of the modern game. This dataset captures the full market value trajectory of 508 professional footballers across Europe\'s top 5 leagues: the Premier League, La Liga, Bundesliga, Serie A and Ligue 1, sourced entirely from Transfermarkt.com — the world\'s most referenced football valuation platform.\r\n\r\nEach player record combines their current and peak valuation with a full career value time-series spanning from their first recorded valuation to the present day, producing 9,779 individual datapoints across the history file. On top of the raw scraped data, 25+ features have been engineered to make this immediately useful for modelling, analysis and research without additional preprocessing.\r\n\r\nThis is not a raw dump. Every record has been cleaned, validated, enriched with derived metrics and passed through a structured quality control process before publication.\r\n\r\nData Science Applications\r\nThis dataset is well suited to the following analytical and modelling tasks:\r\n\r\nRegression & Prediction — predict a player\'s current or future market value using age, position, league and career trajectory features. The engineered CAGR and value multiplier columns make feature construction straightforward for a baseline model with ~35 usable features.\r\n\r\n', 'Football transfer valuations tell a story — not just of money, but of careers, peak performances, club decisions and the economics of the modern game. This dataset captures the full market value trajectory of 508 professional footballers across Europe\'s top 5 leagues: the Premier League, La Liga, Bundesliga, Serie A and Ligue 1, sourced entirely from Transfermarkt.com — the world\'s most referenced football valuation platform.\r\n\r\nEach player record combines their current and peak valuation with a full career value time-series spanning from their first recorded valuation to the present day, producing 9,779 individual datapoints across the history file. On top of the raw scraped data, 25+ features have been engineered to make this immediately useful for modelling, analysis and research without additional preprocessing.\r\n\r\nThis is not a raw dump. Every record has been cleaned, validated, enriched with derived metrics and passed through a structured quality control process before publication.\r\n\r\nData Science Applications\r\nThis dataset is well suited to the following analytical and modelling tasks:\r\n\r\nRegression & Prediction — predict a player\'s current or future market value using age, position, league and career trajectory features. The engineered CAGR and value multiplier columns make feature construction straightforward for a baseline model with ~35 usable features.\r\n\r\nClassification — classify players into trajectory categories (rising star, growing, stable, declining, falling sharply) using career value patterns. A ready-made target column is included.\r\n\r\nTime-Series Analysis — the companion history file contains the full valuation timeline per player, suitable for trend analysis, peak detection and longitudinal studies. Average career span in the dataset is approximately 4–6 years of valuation history per player.\r\n\r\nClustering & Segmentation — group players by career arc, positional value patterns or league-level valuation norms. With 508 players this is well suited to K-Means or hierarchical clustering as an exploratory exercise.\r\n\r\nSports Economics Research — analyse how transfer market valuations correlate with age curves, club tier changes and league context. Suitable for undergraduate and postgraduate dissertations.\r\n\r\nEDA & Visualisation — straightforward dataset for beginners building football dashboards, value heatmaps or career trajectory plots. Clean column names, minimal missing values and a logical structure make it accessible without deep preprocessing knowledge.\r\n\r\nNote: With 508 players this dataset is ideal for focused analysis, teaching and modelling experiments. It is not intended as a complete census of all professional footballers globally.\r\n\r\nColumn Descriptors\r\ntransfermarkt_player_values.csv — one row per player, 38 columns\r\n\r\nplayer_id — Unique Transfermarkt player identifier used as the join key to the history file\r\n\r\nname — Player full name as listed on Transfermarkt at time of scrape\r\n\r\nage — Player age in years at time of scrape\r\n\r\nnationality — Player\'s primary nationality as listed on Transfermarkt\r\n\r\nposition — Specific playing position (e.g. Centre-Forward, Left-Back, Defensive Midfield)\r\n\r\nposition_group — Grouped position bracket: Forward, Midfielder, Defender or Goalkeeper\r\n\r\ncurrent_club — Club the player was registered with at time of data collection\r\n\r\nleague_name — League in which the player was listed (Premier League, La Liga, Bundesliga, Serie A, Ligue 1)\r\n\r\ncurrent_value_eur — Most recent market valuation in EUR at time of scrape\r\n\r\ncurrent_value_tier — Bucketed valuation band: World Class (100M+), Elite (50–100M), Top (20–50M), Regular (5–20M), Developing (<5M)\r\n\r\npeak_value_eur — Highest market valuation ever recorded for the player in EUR\r\n\r\npeak_value_tier — Valuation band at the player\'s career peak\r\n\r\npeak_date — Calendar date on which the player\'s peak valuation was recorded\r\n\r\npeak_club — Club the player was at when reaching their peak valuation\r\n\r\nage_at_peak — Player\'s age when their peak market value was recorded\r\n\r\nfirst_value_eur — First ever recorded market valuation in EUR (career start reference point)\r\n\r\nfirst_date — Date of the player\'s first recorded valuation\r\n\r\nlast_value_eur — Most recent valuation in the history record (aligns with current_value_eur)\r\n\r\nlast_date — Date of the most recent valuation record\r\n\r\ncareer_span_years — Total years between first and last valuation record\r\n\r\nyears_to_peak — Number of years from first valuation to peak valuation\r\n\r\nvalue_cagr — Compound Annual Growth Rate of market value from first to last record\r\n\r\nvalue_to_peak_cagr — CAGR calculated from first valuation to peak valuation only\r\n\r\nvalue_multiplier_x — Ratio of peak value to first value — how many times the player\'s valuation grew\r\n\r\npost_peak_decline_pct — Percentage decline from peak valuation to most recent valuation\r\n\r\nvalue_volatility — Standard deviation divided by mean across all valuation points — measures career value stability\r\n\r\nmean_yoy_growth_rate — Average annualised growth rate computed across all consecutive valuation intervals\r\n\r\nnum_valuation_points — Total number of individual valuation records in the player\'s career history\r\n\r\nnum_clubs_career — Count of distinct clubs appearing across the player\'s full valuation history\r\n\r\ntrajectory — Career arc classification: rising_star, growing, stable, declining or falling_sharply\r\n\r\nis_at_peak — Binary flag: 1 if the player\'s most recent valuation equals their career peak\r\n\r\never_100m — Binary flag: 1 if the player ever reached a €100M+ valuation\r\n\r\never_50m — Binary flag: 1 if the player ever reached a €50M+ valuation\r\n\r\never_10m — Binary flag: 1 if the player ever reached a €10M+ valuation\r\n\r\ndata_source — Source attribution field, value: Transfermarkt.com\r\n\r\ndataset_built_at — ISO date on which this dataset version was compiled\r\n\r\ntransfermarkt_value_history.csv — one row per valuation event, ~9,779 rows\r\n\r\nplayer_id — Join key to master file\r\n\r\nvaluation_date — Date of the individual valuation record\r\n\r\nvalue_eur — Market value in EUR on that date\r\n\r\nvalue_display — Raw display string as shown on Transfermarkt (e.g. €85.00m)\r\n\r\nclub — Club the player was at on the valuation date\r\n\r\nage_at_date — Player\'s age at the time of this specific valuation\r\n\r\nyear — Calendar year extracted from valuation date\r\n\r\nmonth — Calendar month extracted from valuation date\r\n\r\nProvenance & Methodology\r\nSource: All data was collected from Transfermarkt.com, the internationally recognised football market valuation platform operated by Axel Springer SE. Transfermarkt valuations are editorial estimates produced by their community of football analysts and are widely cited in academic research, journalism and professional scouting.\r\n\r\nCollection method: A custom Python scraper was built using cloudscraper and BeautifulSoup to collect player listings from the top 5 European leagues across 15 pages per league. Career market value histories were retrieved via Transfermarkt\'s public-facing JSON graph endpoint (/ceapi/marketValueDevelopment/graph/{player_id}), which returns structured valuation data without requiring authentication.\r\n\r\nRate limiting: All requests were made with randomised delays of 3–7 seconds between calls and exponential backoff on failures, in adherence with responsible scraping practices.\r\n\r\nCollection date: February 2026\r\n\r\nProcessing pipeline: Raw data was parsed, type-cast, deduplicated and validated in Python using pandas. All 25+ engineered features were computed programmatically. A commercial-grade QC report was run prior to publication.\r\n\r\n** Data collection was conducted in accordance with the ethical guidelines for internet research as outlined by the Association of Internet Researchers (AoIR).\r\n\r\nEthically Mined Data\r\nThis dataset was constructed with responsible data collection principles throughout:\r\n\r\nAll data collected is publicly accessible on Transfermarkt.com without authentication, registration or paywall bypass\r\nNo personal private data is included — all subjects are professional public figures whose valuations are openly published and widely reported in global media\r\nCollection was performed with rate-limited, polite scraping that avoids server strain\r\nNo data was obtained through credential stuffing, CAPTCHA bypass, or any circumvention of access controls\r\nPlayer market valuations constitute editorial estimates on public figures and do not constitute private financial, medical or personal information\r\nThe dataset is published for research, education and analytical purposes\r\nTools & Acknowledgements\r\n\r\nData collection and processing: Python (cloudscraper, BeautifulSoup, pandas, numpy)\r\n\r\nDataset cover image generated with OpenAI DALL·E 3\r\n\r\nValuation data sourced from Transfermarkt.com — all intellectual property in the underlying valuations remains with Transfermarkt / Axel Springer SE. Users of this dataset are encouraged to review Transfermarkt\'s terms of service for their intended use case.\r\n\r\nQA / QC Details\r\nA structured quality control report was executed programmatically on the final dataset prior to upload. Results are summarised below.\r\n\r\nOverall QC Score: 90 / 100 — 🟢 APPROVED FOR DISTRIBUTION\r\n\r\nCheck	Result\r\nTotal rows	508\r\nTotal columns	38\r\nDuplicate rows	0\r\nOverall completeness	96%+\r\nCritical field nulls (name, player_id, current_value_eur, peak_value_eur)	0\r\nNumeric column integrity	Validated — all values type-cast and range-checked\r\nValue parsing accuracy	EUR values parsed from raw strings and cross-validated against history file\r\nTrajectory labels	Recalculated using multi-signal logic (CAGR + decline % + peak flag + multiplier)\r\nMetadata fields	Present on all rows\r\nKnown limitations: Transfermarkt valuations are community editorial estimates, not official transaction prices. A small number of players may have incomplete early-career history if they were not tracked by Transfermarkt from their professional debut. The dataset reflects a point-in-time snapshot from February 2025 and will not auto-update.', 'csv', 755729, 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/7/1771775653_3sdRcwWRjb.csv', 'https://datahub-africa-bucket.s3.eu-west-3.amazonaws.com/datasets/7/1771775653_3sdRcwWRjb.csv', 20, 8, 'Accra', NULL, 1, 0.00, 'EUR', 4, 12, 0, 0.00, 0, 1, NULL, NULL, NULL, NULL, NULL, 'published', '2026-02-22 14:54:13', '2026-02-22 14:54:13', 'sport,Football,Europe', '2026-02-22 14:54:13', '2026-02-22 15:40:38');

-- --------------------------------------------------------

--
-- Structure de la table `dataset_favorites`
--

CREATE TABLE `dataset_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dataset_files`
--

CREATE TABLE `dataset_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `is_preview` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dataset_files`
--

INSERT INTO `dataset_files` (`id`, `dataset_id`, `original_name`, `file_name`, `file_path`, `file_size`, `mime_type`, `extension`, `is_preview`, `order`, `created_at`, `updated_at`) VALUES
(1, 2, 'amazon_sales_dataset.csv', '1771548071_nWcc3UIuNU.csv', 'datasets/2/1771548071_nWcc3UIuNU.csv', 1877207, 'text/csv', 'csv', 1, 0, '2026-02-19 23:41:20', '2026-02-19 23:41:20'),
(2, 3, 'amazon_sales_dataset.csv', '1771659205_HNHEoncGCR.csv', 'datasets/3/1771659205_HNHEoncGCR.csv', 1877207, 'text/csv', 'csv', 1, 0, '2026-02-21 06:33:43', '2026-02-21 06:33:43'),
(3, 4, 'amazon_sales_dataset.csv', '1771659238_Y3ObBadoDZ.csv', 'datasets/4/1771659238_Y3ObBadoDZ.csv', 1877207, 'text/csv', 'csv', 1, 0, '2026-02-21 06:34:07', '2026-02-21 06:34:07'),
(4, 5, 'amazon_sales_dataset.csv', '1771674636_bX1MVgTAfA.csv', 'datasets/5/1771674636_bX1MVgTAfA.csv', 1877207, 'text/csv', 'csv', 1, 0, '2026-02-21 10:50:45', '2026-02-21 10:50:45'),
(5, 6, 'amazon_sales_dataset.csv', '1771714151_yxTNZbydI2.csv', 'datasets/6/1771714151_yxTNZbydI2.csv', 1877207, 'text/csv', 'csv', 1, 0, '2026-02-21 21:49:21', '2026-02-21 21:49:21'),
(6, 7, 'data_dictionary.csv', '1771775653_3sdRcwWRjb.csv', 'datasets/7/1771775653_3sdRcwWRjb.csv', 2196, 'text/csv', 'csv', 1, 0, '2026-02-22 14:54:18', '2026-02-22 14:54:18'),
(7, 7, 'transfermarkt_player_values.csv', '1771775654_7Eu0EKkIo7.csv', 'datasets/7/1771775654_7Eu0EKkIo7.csv', 145645, 'text/csv', 'csv', 0, 1, '2026-02-22 14:54:18', '2026-02-22 14:54:18'),
(8, 7, 'transfermarkt_value_history.csv', '1771775655_mNPzRORJay.csv', 'datasets/7/1771775655_mNPzRORJay.csv', 607888, 'text/csv', 'csv', 0, 2, '2026-02-22 14:54:18', '2026-02-22 14:54:18');

-- --------------------------------------------------------

--
-- Structure de la table `dataset_reviews`
--

CREATE TABLE `dataset_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL COMMENT '1-5 stars',
  `title` varchar(200) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_verified_download` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'User actually downloaded it',
  `helpful_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dataset_reviews`
--

INSERT INTO `dataset_reviews` (`id`, `dataset_id`, `user_id`, `rating`, `title`, `comment`, `is_verified_download`, `helpful_count`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 3, 'Données de qualité', 'Très utile pour notre projet de modélisation. Les données sont propres et faciles à utiliser.', 1, 11, '2026-01-05 22:23:54', '2026-01-05 22:23:54'),
(2, 2, 8, 3, 'Excellent dataset', 'Parfait pour mes analyses. La documentation est claire et précise.', 0, 6, '2026-01-08 22:23:54', '2026-01-08 22:23:54'),
(3, 2, 14, 5, 'Je recommande', 'Très utile pour notre projet de modélisation. Les données sont propres et faciles à utiliser.', 0, 2, '2026-02-16 22:23:54', '2026-02-16 22:23:54'),
(4, 2, 18, 5, 'Parfait pour mes recherches', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 0, 25, '2026-01-05 22:23:54', '2026-01-05 22:23:54'),
(5, 2, 11, 5, 'Très complet', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 0, 15, '2026-01-13 22:23:54', '2026-01-13 22:23:54'),
(6, 3, 8, 1, 'Très complet', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 0, 18, '2026-01-10 22:23:54', '2026-01-10 22:23:54'),
(7, 3, 15, 4, 'Très complet', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 1, 8, '2025-12-29 22:23:54', '2025-12-29 22:23:54'),
(8, 3, 6, 2, 'Très utile', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 0, 14, '2026-01-16 22:23:54', '2026-01-16 22:23:54'),
(9, 3, 7, 5, 'Excellent dataset', 'Parfait pour mes analyses. La documentation est claire et précise.', 1, 4, '2026-01-28 22:23:54', '2026-01-28 22:23:54'),
(10, 4, 7, 5, 'Superbe travail', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 1, 10, '2026-02-01 22:23:54', '2026-02-01 22:23:54'),
(11, 4, 18, 5, 'Très satisfait', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 0, 21, '2026-01-28 22:23:54', '2026-01-28 22:23:54'),
(12, 4, 6, 5, 'Je recommande', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 0, 17, '2026-01-31 22:23:54', '2026-01-31 22:23:54'),
(13, 4, 9, 3, 'Superbe travail', 'Les données sont très complètes et bien documentées. Je les utilise pour mes recherches sur le changement climatique.', 1, 17, '2025-12-29 22:23:54', '2025-12-29 22:23:54'),
(14, 4, 15, 3, 'Très satisfait', 'Les données correspondent exactement à ce que je cherchais. Merci !', 1, 18, '2026-02-03 22:23:54', '2026-02-03 22:23:54'),
(15, 4, 14, 4, 'Très complet', 'Les données sont très complètes et bien documentées. Je les utilise pour mes recherches sur le changement climatique.', 1, 2, '2026-02-08 22:23:54', '2026-02-08 22:23:54'),
(16, 4, 17, 5, 'Très utile', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 0, 0, '2026-01-30 22:23:54', '2026-01-30 22:23:54'),
(17, 5, 13, 5, 'Très complet', 'Parfait pour mes analyses. La documentation est claire et précise.', 1, 7, '2026-02-03 22:23:54', '2026-02-03 22:23:54'),
(18, 5, 16, 5, 'Je recommande', 'Je recommande vivement ce dataset. Il m\'a fait gagner un temps précieux.', 0, 2, '2026-01-18 22:23:54', '2026-01-18 22:23:54'),
(19, 5, 14, 5, 'Très satisfait', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 1, 7, '2026-02-03 22:23:54', '2026-02-03 22:23:54'),
(20, 5, 12, 5, 'Très complet', 'Très satisfait de la qualité des données. Je vais certainement utiliser d\'autres datasets sur la plateforme.', 1, 4, '2026-02-02 22:23:54', '2026-02-02 22:23:54'),
(21, 6, 9, 4, 'Excellent dataset', 'Très satisfait de la qualité des données. Je vais certainement utiliser d\'autres datasets sur la plateforme.', 1, 24, '2025-12-24 22:23:54', '2025-12-24 22:23:54'),
(22, 6, 13, 3, 'Parfait pour mes recherches', 'Excellent travail ! Les visualisations sont très parlantes. Merci pour ce partage.', 0, 2, '2026-01-01 22:23:54', '2026-01-01 22:23:54'),
(23, 6, 10, 5, 'Très satisfait', 'Les données sont très complètes et bien documentées. Je les utilise pour mes recherches sur le changement climatique.', 0, 23, '2026-01-29 22:23:54', '2026-01-29 22:23:54'),
(24, 6, 15, 4, 'Très satisfait', 'Données de très bonne qualité. Serait-il possible d\'avoir des mises à jour plus fréquentes ?', 0, 25, '2026-02-12 22:23:54', '2026-02-12 22:23:54'),
(25, 6, 8, 5, 'Je recommande', 'Les données sont très complètes et bien documentées. Je les utilise pour mes recherches sur le changement climatique.', 1, 21, '2026-01-11 22:23:54', '2026-01-11 22:23:54'),
(26, 6, 18, 3, 'Données de qualité', 'Les données sont très complètes et bien documentées. Je les utilise pour mes recherches sur le changement climatique.', 0, 0, '2026-01-21 22:23:54', '2026-01-21 22:23:54'),
(27, 5, 8, 2, NULL, 'cool', 0, 0, '2026-02-22 13:57:46', '2026-02-22 13:57:46'),
(28, 4, 8, 2, NULL, 'Merci', 0, 0, '2026-02-22 14:15:42', '2026-02-22 14:15:42');

-- --------------------------------------------------------

--
-- Structure de la table `dataset_tags`
--

CREATE TABLE `dataset_tags` (
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dataset_tags`
--

INSERT INTO `dataset_tags` (`dataset_id`, `tag_id`, `created_at`) VALUES
(7, 1, '2026-02-22 15:54:13'),
(7, 2, '2026-02-22 15:54:13'),
(7, 3, '2026-02-22 15:54:13');

-- --------------------------------------------------------

--
-- Structure de la table `dataset_versions`
--

CREATE TABLE `dataset_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `version_number` int(10) UNSIGNED NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `changelog` text DEFAULT NULL COMMENT 'What changed in this version',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `download_history`
--

CREATE TABLE `download_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dataset_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `version_number` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IPv4 or IPv6',
  `user_agent` varchar(500) DEFAULT NULL,
  `download_type` enum('free','purchased','subscription') NOT NULL DEFAULT 'free',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `file_formats`
--

CREATE TABLE `file_formats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `file_formats`
--

INSERT INTO `file_formats` (`id`, `slug`, `label`, `color`, `icon`, `mime_type`, `description`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'csv', 'CSV', 'bg-green-500', '📊', 'text/csv', 'Comma-Separated Values - Format universel pour données tabulaires', 1, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35'),
(2, 'xlsx', 'XLSX', 'bg-blue-500', '📈', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Microsoft Excel - Format de tableur avec support de multiples feuilles', 2, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35'),
(3, 'json', 'JSON', 'bg-yellow-500', '📋', 'application/json', 'JavaScript Object Notation - Format léger pour échange de données', 3, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35'),
(4, 'xml', 'XML', 'bg-orange-500', '📄', 'application/xml', 'eXtensible Markup Language - Format structuré et extensible', 4, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35'),
(5, 'shp', 'SHP', 'bg-purple-500', '🗺️', 'application/zip', 'Shapefile - Format de données géospatiales (nécessite plusieurs fichiers)', 5, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35'),
(6, 'zip', 'ZIP', 'bg-gray-500', '📦', 'application/zip', 'Archive compressée contenant plusieurs fichiers', 6, 1, '2026-02-21 08:16:35', '2026-02-21 08:16:35');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `allows_commercial` tinyint(1) NOT NULL DEFAULT 0,
  `allows_modification` tinyint(1) NOT NULL DEFAULT 0,
  `requires_attribution` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`id`, `slug`, `label`, `description`, `allows_commercial`, `allows_modification`, `requires_attribution`, `is_active`, `created_at`) VALUES
(1, 'open', 'Open Data', 'Libre d\'utilisation, modification et redistribution', 1, 1, 1, 1, '2026-02-14 15:13:12'),
(2, 'commercial', 'Commerciale', 'Usage commercial autorisé avec restrictions', 1, 0, 1, 1, '2026-02-14 15:13:12'),
(3, 'private', 'Privée', 'Accès restreint, usage limité', 0, 0, 1, 1, '2026-02-14 15:13:12'),
(4, 'cc-by', 'Creative Commons BY', 'Attribution requise', 1, 1, 1, 1, '2026-02-14 15:13:12'),
(5, 'cc-by-sa', 'Creative Commons BY-SA', 'Attribution et partage à l\'identique', 1, 1, 1, 1, '2026-02-14 15:13:12'),
(6, 'cc-by-nc', 'Creative Commons BY-NC', 'Attribution, pas d\'usage commercial', 0, 1, 1, 1, '2026-02-14 15:13:12');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2026_02_14_143050_create_datahub_tables', 1),
(5, '2026_02_19_210044_add_dataset_files_tables', 2),
(6, '2026_02_21_084931_create_file_formats_table', 3),
(7, '2026_02_21_091308_create_file_formats_table', 4),
(8, '2026_02_21_101105_create_sectors_table', 5),
(9, '2026_02_21_102507_create_testimonials_table', 6),
(10, '2026_02_21_113354_add_sector_fiels_in_dataset_table', 7);

-- --------------------------------------------------------

--
-- Structure de la table `mobile_money_operators`
--

CREATE TABLE `mobile_money_operators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL COMMENT 'e.g., MTN, ORANGE, MOOV, AIRTEL',
  `country_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Array of country codes where available' CHECK (json_valid(`country_codes`)),
  `logo_url` varchar(500) DEFAULT NULL,
  `ussd_code` varchar(20) DEFAULT NULL COMMENT 'e.g., *170#',
  `min_amount` decimal(10,2) NOT NULL DEFAULT 1.00,
  `max_amount` decimal(10,2) NOT NULL DEFAULT 1000000.00,
  `transaction_fee_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `transaction_fee_fixed` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mobile_money_operators`
--

INSERT INTO `mobile_money_operators` (`id`, `name`, `code`, `country_codes`, `logo_url`, `ussd_code`, `min_amount`, `max_amount`, `transaction_fee_percent`, `transaction_fee_fixed`, `is_active`, `created_at`) VALUES
(1, 'MTN Mobile Money', 'MTN', '[\"CMR\",\"CIV\",\"GHA\",\"GIN\",\"BEN\",\"RWA\",\"UGA\",\"ZMB\",\"SSD\"]', NULL, '*170#', 100.00, 5000000.00, 1.50, 0.00, 1, '2026-02-14 15:13:12'),
(2, 'Orange Money', 'ORANGE', '[\"SEN\",\"CIV\",\"MLI\",\"NER\",\"BFA\",\"CMR\",\"MDG\",\"GIN\",\"CAF\"]', NULL, '#144#', 100.00, 2000000.00, 1.00, 0.00, 1, '2026-02-14 15:13:12'),
(3, 'Moov Money', 'MOOV', '[\"BEN\",\"TGO\",\"CIV\",\"GAB\",\"NER\",\"CAF\",\"BFA\"]', NULL, '*155#', 50.00, 1000000.00, 1.20, 0.00, 1, '2026-02-14 15:13:12'),
(4, 'Airtel Money', 'AIRTEL', '[\"KEN\",\"TZA\",\"UGA\",\"RWA\",\"ZMB\",\"MWI\",\"NGA\",\"TCD\",\"NER\",\"MDG\"]', NULL, '*185#', 100.00, 3000000.00, 1.00, 0.00, 1, '2026-02-14 15:13:12'),
(5, 'Wave', 'WAVE', '[\"SEN\",\"CIV\",\"BFA\",\"MLI\",\"UGA\",\"BEN\",\"TGO\"]', NULL, NULL, 1.00, 10000000.00, 0.00, 0.00, 1, '2026-02-14 15:13:12'),
(6, 'M-Pesa (Safaricom)', 'MPESA_KE', '[\"KEN\"]', NULL, '*234#', 10.00, 5000000.00, 0.00, 0.00, 1, '2026-02-14 15:13:12'),
(7, 'M-Pesa (Vodacom)', 'MPESA_TZ', '[\"TZA\"]', NULL, '*150*00#', 1000.00, 5000000.00, 0.50, 0.00, 1, '2026-02-14 15:13:12'),
(8, 'Flooz (Moov Togo)', 'FLOOZ', '[\"TGO\",\"BEN\"]', NULL, '*155#', 100.00, 1000000.00, 1.00, 0.00, 1, '2026-02-14 15:13:12'),
(9, 'Free Money', 'FREE', '[\"SEN\"]', NULL, '*144#', 100.00, 2000000.00, 1.00, 0.00, 1, '2026-02-14 15:13:12'),
(10, 'Wizall Money', 'WIZALL', '[\"SEN\"]', NULL, '*770#', 100.00, 2000000.00, 1.50, 0.00, 1, '2026-02-14 15:13:12');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` enum('google','github','facebook','twitter') NOT NULL,
  `provider_user_id` varchar(255) NOT NULL COMMENT 'ID from OAuth provider',
  `provider_email` varchar(255) DEFAULT NULL,
  `provider_username` varchar(255) DEFAULT NULL,
  `provider_avatar` varchar(500) DEFAULT NULL,
  `access_token` text DEFAULT NULL COMMENT 'Encrypted OAuth access token',
  `refresh_token` text DEFAULT NULL COMMENT 'Encrypted OAuth refresh token',
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Additional data from provider' CHECK (json_valid(`provider_data`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('credit_card','mobile_money','bank_account','paypal') NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `card_brand` varchar(50) DEFAULT NULL COMMENT 'visa, mastercard, amex',
  `card_last4` varchar(4) DEFAULT NULL COMMENT 'Last 4 digits',
  `card_exp_month` tinyint(3) UNSIGNED DEFAULT NULL,
  `card_exp_year` smallint(5) UNSIGNED DEFAULT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `mobile_money_operator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL COMMENT 'Phone number for mobile money',
  `mobile_number_country_code` varchar(5) DEFAULT NULL COMMENT 'e.g., +221, +237',
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number_last4` varchar(4) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `payment_provider` varchar(50) DEFAULT NULL COMMENT 'stripe, flutterwave, paystack, etc.',
  `provider_payment_method_id` varchar(255) DEFAULT NULL COMMENT 'ID from payment provider',
  `provider_customer_id` varchar(255) DEFAULT NULL COMMENT 'Customer ID from provider',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Additional provider-specific data' CHECK (json_valid(`metadata`)),
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sectors`
--

CREATE TABLE `sectors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sectors`
--

INSERT INTO `sectors` (`id`, `slug`, `name`, `name_en`, `description`, `icon`, `color`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'gouvernement', 'Gouvernement', 'Government', 'Institutions gouvernementales, ministères, agences publiques', '🏛️', 'bg-blue-600', 1, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(2, 'entreprise-privee', 'Entreprise privée', 'Private Company', 'Entreprises du secteur privé, PME, grandes entreprises', '🏢', 'bg-green-600', 2, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(3, 'ong', 'ONG', 'NGO', 'Organisations non gouvernementales, associations à but non lucratif', '🤝', 'bg-orange-500', 3, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(4, 'recherche-academique', 'Recherche académique', 'Academic Research', 'Universités, centres de recherche, instituts d\'études', '📚', 'bg-purple-600', 4, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(5, 'startup', 'Startup', 'Startup', 'Jeunes entreprises innovantes, scale-ups', '🚀', 'bg-yellow-500', 5, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(6, 'organisation-internationale', 'Organisation internationale', 'International Organization', 'Nations Unies, Union Africaine, Banque Mondiale, etc.', '🌍', 'bg-indigo-600', 6, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(7, 'media', 'Média', 'Media', 'Presse, télévision, radio, médias en ligne', '📺', 'bg-red-500', 7, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53'),
(8, 'autre', 'Autre', 'Other', 'Autres types d\'organisations', '📌', 'bg-gray-500', 8, 1, '2026-02-21 09:20:53', '2026-02-21 09:20:53');

-- --------------------------------------------------------

--
-- Structure de la table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','cancelled','expired','suspended','past_due') NOT NULL DEFAULT 'active',
  `billing_cycle` enum('monthly','yearly') NOT NULL DEFAULT 'monthly',
  `price_paid` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `starts_at` timestamp NULL DEFAULT NULL,
  `current_period_start` timestamp NULL DEFAULT NULL,
  `current_period_end` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancel_at_period_end` tinyint(1) NOT NULL DEFAULT 0,
  `auto_renew` tinyint(1) NOT NULL DEFAULT 1,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `is_trial` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `price_monthly` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price_yearly` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_datasets` int(11) DEFAULT NULL COMMENT 'NULL = unlimited',
  `max_downloads_per_month` int(11) DEFAULT NULL COMMENT 'NULL = unlimited',
  `allows_commercial_datasets` tinyint(1) NOT NULL DEFAULT 0,
  `priority_support` tinyint(1) NOT NULL DEFAULT 0,
  `api_access` tinyint(1) NOT NULL DEFAULT 0,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Array of feature descriptions' CHECK (json_valid(`features`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `name`, `slug`, `price_monthly`, `price_yearly`, `max_datasets`, `max_downloads_per_month`, `allows_commercial_datasets`, `priority_support`, `api_access`, `features`, `is_active`, `display_order`, `created_at`) VALUES
(1, 'Gratuit', 'free', 0.00, 0.00, 3, 10, 0, 0, 0, '[\"3 datasets maximum\",\"10 t\\u00e9l\\u00e9chargements par mois\",\"Support communautaire\"]', 1, 1, '2026-02-14 15:13:12'),
(2, 'Pro', 'pro', 19.99, 199.00, 20, 100, 1, 0, 1, '[\"20 datasets\",\"100 t\\u00e9l\\u00e9chargements par mois\",\"Datasets commerciaux\",\"Acc\\u00e8s API\",\"Support email\"]', 1, 2, '2026-02-14 15:13:12'),
(3, 'Business', 'business', 49.99, 499.00, NULL, NULL, 1, 1, 1, '[\"Datasets illimit\\u00e9s\",\"T\\u00e9l\\u00e9chargements illimit\\u00e9s\",\"Datasets commerciaux\",\"Acc\\u00e8s API complet\",\"Support prioritaire\",\"Analyses avanc\\u00e9es\"]', 1, 3, '2026-02-14 15:13:12'),
(4, 'Enterprise', 'enterprise', 199.99, 1999.00, NULL, NULL, 1, 1, 1, '[\"Tout du Business\",\"D\\u00e9ploiement on-premise\",\"SLA garanti\",\"Account manager d\\u00e9di\\u00e9\",\"Formation personnalis\\u00e9e\",\"Int\\u00e9grations custom\"]', 1, 4, '2026-02-14 15:13:12');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `usage_count`, `created_at`) VALUES
(1, 'sport', 'sport', 0, '2026-02-22 15:54:13'),
(2, 'Football', 'football', 0, '2026-02-22 15:54:13'),
(3, 'Europe', 'europe', 0, '2026-02-22 15:54:13');

-- --------------------------------------------------------

--
-- Structure de la table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(200) NOT NULL,
  `organization` varchar(200) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `content` text NOT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `rating` int(10) UNSIGNED DEFAULT NULL COMMENT 'Note sur 5',
  `country` varchar(100) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `role`, `organization`, `avatar`, `content`, `video_url`, `rating`, `country`, `sector`, `display_order`, `is_active`, `is_featured`, `created_at`, `updated_at`, `published_at`) VALUES
(1, 'Dr. Aminata Diallo', 'Chercheuse en économie', 'Université Cheikh Anta Diop', 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=100&h=100&fit=crop', 'DataHub Africa a révolutionné ma façon de faire de la recherche. L\'accès à des données africaines de qualité était un défi majeur jusqu\'à présent.', NULL, 5, 'Sénégal', 'Recherche académique', 1, 1, 1, '2026-02-21 09:34:41', '2026-02-21 09:34:41', '2026-02-21 09:34:41'),
(2, 'Emmanuel Okonkwo', 'Data Scientist', 'FinTech Nigeria', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop', 'Une plateforme indispensable pour tout professionnel des données travaillant sur le continent africain. La qualité des datasets est exceptionnelle.', NULL, 5, 'Nigeria', 'Entreprise privée', 2, 1, 1, '2026-02-21 09:34:41', '2026-02-21 09:34:41', '2026-02-21 09:34:41'),
(3, 'Sarah Mensah', 'Directrice', 'Climate Action Ghana', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Grâce à DataHub Africa, nous avons pu accéder à des données climatiques cruciales pour nos projets de terrain. Merci pour cette initiative !', NULL, 5, 'Ghana', 'ONG', 3, 1, 1, '2026-02-21 09:34:41', '2026-02-21 09:34:41', '2026-02-21 09:34:41'),
(4, 'Dr. Aminata Diallo', 'Chercheuse en économie', 'Université Cheikh Anta Diop', 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=100&h=100&fit=crop', 'DataHub Africa a révolutionné ma façon de faire de la recherche. L\'accès à des données africaines de qualité était un défi majeur jusqu\'à présent.', NULL, 5, 'Sénégal', 'Recherche académique', 1, 1, 1, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2026-02-21 09:36:46'),
(5, 'Emmanuel Okonkwo', 'Data Scientist', 'FinTech Nigeria', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop', 'Une plateforme indispensable pour tout professionnel des données travaillant sur le continent africain. La qualité des datasets est exceptionnelle.', NULL, 5, 'Nigeria', 'Entreprise privée', 2, 1, 1, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2026-02-21 09:36:46'),
(6, 'Sarah Mensah', 'Directrice', 'Climate Action Ghana', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Grâce à DataHub Africa, nous avons pu accéder à des données climatiques cruciales pour nos projets de terrain. Merci pour cette initiative !', NULL, 5, 'Ghana', 'ONG', 3, 1, 1, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2026-02-21 09:36:46'),
(7, 'Estrella Trantow', 'Expert', NULL, 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop', 'Consectetur possimus accusantium rerum voluptas perspiciatis voluptates. Tempore earum minima repellat quos.\n\nIncidunt eos temporibus unde dolores error ut. Est harum sit porro quia necessitatibus aut explicabo.\n\nEarum autem incidunt temporibus natus id fugiat aut. Voluptatem ratione quam officia iure illo. Adipisci non tempora ipsa nihil.', NULL, NULL, 'Kenya', 'Entreprise privée', 64, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-09-01 19:58:34'),
(8, 'Alexandre O\'Hara', 'Directrice', 'Banque Africaine de Développement', 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=100&h=100&fit=crop', 'Et ducimus commodi inventore dolor ut dolores fugiat. Velit consequatur facere molestiae dicta quia iure ea sequi. Recusandae dolorum repudiandae et ea porro nam.\n\nIn quibusdam perspiciatis voluptates quas velit impedit vel dolorem. Sed sed soluta sit officiis placeat nesciunt laborum. Eaque cupiditate voluptas aliquam dolores voluptatem facere aut.\n\nTempore earum non unde et ex sed labore. Eaque perspiciatis aperiam repudiandae voluptas dicta ex ratione explicabo. Voluptate debitis eligendi earum laudantium eum optio sed. Harum enim earum nihil voluptas.', NULL, 5, NULL, 'Recherche académique', 6, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-06-14 11:47:32'),
(9, 'Hilton Lueilwitz', 'Lead Data Scientist', NULL, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop', 'Quod ea sequi omnis quod incidunt. In minima error possimus quas ad mollitia. Vero earum occaecati sit velit dicta. Soluta aspernatur sunt velit pariatur.\n\nDignissimos necessitatibus eveniet velit explicabo. Est sed excepturi corrupti enim optio et qui. Voluptatum et est ipsa expedita libero enim. Sunt expedita similique fuga est qui autem corporis.\n\nEa quo veniam et ea accusantium in quia. Possimus voluptatibus aut iusto enim vel aliquid. Quo enim rerum doloribus ipsa. Error at excepturi voluptates numquam sed maiores.', NULL, NULL, 'Ghana', 'ONG', 74, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-03-22 22:42:40'),
(10, 'Rafael Labadie', 'Expert', NULL, 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop', 'Et provident autem saepe. Dolores optio autem totam ut quia quidem. Et at sunt velit.\n\nVero porro labore officiis. Aut consequatur nihil debitis ut. Veritatis quis veritatis quisquam quae autem facilis.\n\nEst et eveniet nulla. Minima voluptatum aut voluptates et aut. Quam modi veniam cumque ab dicta. Et error et accusamus sed molestias corporis hic. Consequuntur aliquam qui excepturi dolores reprehenderit aut.', NULL, 5, 'Kenya', NULL, 92, 1, 1, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-08-15 10:04:44'),
(11, 'Nils Nicolas', 'Consultant en données', NULL, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop', 'Ut qui pariatur magnam quis aut odio. Sed natus dicta omnis ullam non quia quia alias. Nisi eos adipisci et voluptatem quisquam et reprehenderit. Ipsa debitis corrupti unde eum. Modi iusto aut voluptatem sed.\n\nNulla et dolorem architecto quaerat explicabo. Aut dolor aut voluptatem tempore magnam molestiae. Debitis dolorum ipsa vel doloribus perferendis ad. Non sint beatae voluptatem nostrum maiores ex excepturi.\n\nProvident aliquam perspiciatis voluptas voluptatem molestiae. Cumque veritatis sit expedita beatae at omnis fugiat. Consequatur eos deserunt et placeat aut nesciunt nam. Eveniet tempore non itaque dolorum asperiores.', NULL, NULL, 'Maroc', 'Gouvernement', 64, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-08-26 14:00:19'),
(12, 'Abbey McGlynn Sr.', 'Fondateur', 'FinTech Nigeria', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Eum ipsum illo voluptate quasi. Sunt eius magnam dolorem ex ea dolorem. Cumque qui temporibus eveniet ipsa.\n\nNulla modi alias molestiae adipisci ut ab fugiat. Perferendis voluptas ipsa placeat ex.\n\nNobis aut ratione veritatis rem aperiam. Qui doloremque eius laudantium qui et voluptate ducimus. Magnam consectetur molestiae placeat nam.', NULL, 5, 'Côte d\'Ivoire', 'Entreprise privée', 49, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-02-28 13:12:23'),
(13, 'Mr. Gerson Pagac', 'Fondateur', 'FinTech Nigeria', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop', 'Asperiores rerum officia voluptatum libero libero sed et. Nostrum rerum excepturi molestiae porro. Id qui sed libero laboriosam. Quo eum non ullam ad. Deleniti animi soluta soluta dignissimos ea qui maiores veniam.\n\nEst atque et veritatis et recusandae non. Qui sit eos doloribus cumque dolore est. Ipsam delectus aperiam hic aspernatur dolor rerum qui recusandae.\n\nNisi facilis soluta odio doloremque numquam. Pariatur qui omnis officiis aut qui. Voluptatum praesentium quis dolor debitis sed accusantium.', NULL, 4, 'Maroc', NULL, 22, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-02-28 18:02:54'),
(14, 'Prof. Giuseppe Murray', 'CEO', 'Université du Cap', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Assumenda et mollitia tenetur ipsa numquam. Perspiciatis libero fugit accusamus laboriosam ipsam assumenda. Consequatur at rerum rem sed voluptate assumenda.\n\nOmnis magni ab et quae dolore debitis cumque. Et assumenda pariatur adipisci nesciunt ducimus.\n\nDolorem in ut aperiam reiciendis enim atque error omnis. Sit ut ut error. Suscipit adipisci praesentium sit ut minus a omnis similique. Perferendis et quia molestias vel.', NULL, 4, 'Kenya', 'ONG', 96, 1, 1, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2025-12-31 07:29:09'),
(15, 'Kirk Green', 'Lead Data Scientist', 'Orange Digital Center', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop', 'Et at sint est vitae sint explicabo. Consequatur nostrum aut eveniet quo sed numquam. Expedita impedit dolores minus ut quia soluta illum. Voluptatem in assumenda ut.\n\nNemo modi et qui fugit illum. Sint tempora est eius quis non ipsam corrupti. Deserunt ipsum officiis necessitatibus ipsam nam delectus enim. Aut corrupti dolorem et ipsam animi omnis quibusdam.\n\nPlaceat ut dicta veritatis. Iste soluta ipsum laudantium ut id at sit quisquam.', NULL, 5, NULL, 'Entreprise privée', 7, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2026-01-22 04:20:51'),
(16, 'Dr. May Spencer Sr.', 'Consultant indépendant', NULL, 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Soluta odio deserunt sunt veniam et voluptates. Id nesciunt atque unde nulla. Sunt dolorem maxime rem corrupti.\n\nId pariatur blanditiis nam voluptatum non. Autem et dolor iure deserunt fugit. Fugiat tenetur magnam pariatur officiis tempore porro consequuntur ullam. Velit natus harum iure nulla accusamus.\n\nImpedit ipsum eligendi vero ut nemo minima perferendis. Soluta deleniti consequatur ut eos quia dolorem cumque. Vitae exercitationem rem sunt autem cumque accusantium. Aut amet rerum omnis at ut adipisci.', NULL, NULL, 'Sénégal', NULL, 8, 1, 0, '2026-02-21 09:36:46', '2026-02-21 09:36:46', '2026-01-05 07:29:05');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Buyer',
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Dataset owner (NULL for subscriptions)',
  `dataset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('dataset_purchase','subscription_payment','subscription_renewal','refund','payout') NOT NULL,
  `transaction_reference` varchar(100) NOT NULL COMMENT 'Unique transaction ID',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `exchange_rate` decimal(12,6) NOT NULL DEFAULT 1.000000 COMMENT 'To USD if different currency',
  `platform_fee` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'DataHub commission',
  `payment_processor_fee` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Stripe/Flutterwave fee',
  `mobile_money_fee` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Mobile money operator fee',
  `seller_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Amount to seller after all fees',
  `payment_method_type` enum('credit_card','mobile_money','bank_account','paypal','cash') NOT NULL,
  `payment_provider` varchar(50) DEFAULT NULL,
  `payment_status` enum('pending','processing','completed','failed','refunded','cancelled') NOT NULL DEFAULT 'pending',
  `payment_reference` varchar(255) DEFAULT NULL COMMENT 'External payment ID from provider',
  `mobile_money_operator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `mobile_transaction_id` varchar(255) DEFAULT NULL,
  `card_brand` varchar(50) DEFAULT NULL,
  `card_last4` varchar(4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `customer_note` text DEFAULT NULL,
  `payment_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_metadata`)),
  `error_message` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `fraud_score` decimal(5,2) DEFAULT NULL COMMENT 'Fraud detection score 0-100',
  `is_flagged` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Flagged for manual review',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `processing_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` enum('dataset','subscription','fee','tax','discount') NOT NULL,
  `dataset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `organization` varchar(150) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL COMMENT 'Gouvernement, Entreprise privée, ONG, etc.',
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `github_url` varchar(255) DEFAULT NULL,
  `total_datasets` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_downloads` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_revenue` decimal(12,2) NOT NULL DEFAULT 0.00,
  `reputation_score` int(11) NOT NULL DEFAULT 0 COMMENT 'Computed from ratings, contributions',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `newsletter_subscribed` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `avatar`, `bio`, `organization`, `sector`, `country_id`, `city`, `phone`, `website`, `linkedin_url`, `twitter_url`, `github_url`, `total_datasets`, `total_downloads`, `total_revenue`, `reputation_score`, `email_verified`, `email_verified_at`, `newsletter_subscribed`, `is_active`, `is_admin`, `last_login_at`, `created_at`, `updated_at`) VALUES
(6, 'berenis@gmail.com', '$2y$12$G16nAplysblsejbvcJzKx.pN3/covY6uHNO7VAaz4RoKNnGShWBI.', 'Berenis  MASSAMBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0.00, 0, 0, NULL, 1, 1, 0, '2026-02-15 15:48:40', '2026-02-15 13:01:52', '2026-02-15 15:48:40'),
(7, 'vitalys@gmail.com', '$2y$12$HsScWknV.iTnHg0UEfDF../86OVvB8mrAbk9uWqiy8JxMttBWRSPW', 'vitalys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0.00, 0, 0, NULL, 1, 1, 0, NULL, '2026-02-15 13:04:48', '2026-02-15 13:04:48'),
(8, 'berenismassamba@gmail.com', '$2y$12$b2I5/5yPGPZB6IZ9F22vT.z2jZHvHPelaAMsKBkVnHOBVQwK90N4q', 'berenis vitaly\'s jorhelvi Massamba', 'https://lh3.googleusercontent.com/a/ACg8ocL17FctgCTTMseShwWHVQcExvbFOfSrz8iYj3n_4e89ajYTtUQ3=s96-c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0.00, 0, 1, NULL, 1, 1, 0, '2026-02-22 14:55:55', '2026-02-15 14:03:25', '2026-02-22 15:41:36'),
(9, 'baba@gmail.com', '$2y$12$2Z9kE9HLMnUaL12wtf378OaJ0DfUny2F1ZWl8Lm77jx8bDEqW/GPG', 'Baba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0.00, 0, 0, NULL, 1, 1, 0, NULL, '2026-02-15 14:55:10', '2026-02-15 14:55:10'),
(10, 'admin@datahubafrica.com', '$2y$12$UArBsmZ0VKFpCU/pyTkCA.lkugyC.MMjTANybrBRYneCqFJrW9haK', 'Admin DataHub', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop', 'Fondateur de DataHub Africa, passionné par les données et leur impact sur le développement du continent.', 'DataHub Africa', 'Technology', 1, 'Dakar', '+221 77 123 45 67', 'https://datahubafrica.com', 'https://linkedin.com/in/admin', 'https://twitter.com/datahubafrica', 'https://github.com/datahubafrica', 15, 1250, 2500.00, 98, 1, '2026-02-21 22:14:08', 1, 1, 1, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(11, 'moderator@datahubafrica.com', '$2y$12$ick0dqiusL/wqVd.SJWOJeuAHv7D.gimb3feqZC8rdJd7xR8sv7U.', 'Moderator DataHub', 'https://images.unsplash.com/photo-1494790108777-766d99f5a969?w=100&h=100&fit=crop', 'Modératrice de la plateforme, garant de la qualité des données.', 'DataHub Africa', 'Technology', 2, 'Lagos', '+234 801 234 5678', NULL, 'https://linkedin.com/in/moderator', NULL, NULL, 5, 450, 0.00, 95, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(12, 'aminata.diallo@ucad.sn', '$2y$12$sdNePXD1Am59ruNtfy9Os.zCAPMPAKjnxhEdRkBHbY2qVK4LuC4GS', 'Dr. Aminata Diallo', 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=100&h=100&fit=crop', 'Chercheuse en économie du développement à l\'Université Cheikh Anta Diop de Dakar. Spécialiste des données économiques ouest-africaines.', 'Université Cheikh Anta Diop', 'Académique', 1, 'Dakar', '+221 77 234 56 78', 'https://ucad.sn/aminata-diallo', 'https://linkedin.com/in/aminata-diallo', 'https://twitter.com/aminata_diallo', 'https://github.com/aminata-diallo', 8, 2340, 0.00, 92, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(13, 'jean.mensah@ug.edu.gh', '$2y$12$TKPE46YxYmINK11TSdKdCeFi2g0vlZSiPrcTGa7xDG8.T7xquUQ1C', 'Prof. Jean Mensah', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop', 'Professeur de climatologie à l\'Université du Ghana. Mes recherches portent sur l\'impact du changement climatique en Afrique de l\'Ouest.', 'University of Ghana', 'Académique', 3, 'Accra', '+233 24 123 4567', 'https://ug.edu.gh/jean-mensah', 'https://linkedin.com/in/jean-mensah', 'https://twitter.com/jean_mensah', 'https://github.com/jean-mensah', 12, 3450, 0.00, 96, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(14, 'emmanuel.okonkwo@fintech.ng', '$2y$12$W8uv6A8BzTQ0q9hz5X4Esuz2PGjEh0SUuS.8gbvZe7a2jnpXK8SNq', 'Emmanuel Okonkwo', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop', 'Data Scientist chez FinTech Nigeria. Passionné par l\'analyse de données financières et la modélisation prédictive.', 'FinTech Nigeria', 'Entreprise privée', 2, 'Lagos', '+234 802 345 6789', NULL, 'https://linkedin.com/in/emmanuel-okonkwo', 'https://twitter.com/emmanuel_o', 'https://github.com/emmanuel-okonkwo', 3, 890, 150.00, 88, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(15, 'sarah.mensah@climate.gh', '$2y$12$ts.3f4qlHWMqRfXI9WLmXeUPUcKcmtJkgSEAlZlCZ.xAOfG0zwrDW', 'Sarah Mensah', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&h=100&fit=crop', 'Directrice de Climate Action Ghana. Nous utilisons les données climatiques pour informer les politiques publiques.', 'Climate Action Ghana', 'ONG', 3, 'Accra', '+233 20 456 7890', 'https://climateactionghana.org', 'https://linkedin.com/in/sarah-mensah', 'https://twitter.com/sarah_mensah', NULL, 0, 567, 0.00, 85, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(16, 'fatou.ndiaye@orange.sn', '$2y$12$mtznMizZ/cC1VhlkNmAQA.xWCIXs3YAmt6L1p1F7ig/bOFoElznoK', 'Fatou Ndiaye', 'https://images.unsplash.com/photo-1526510747491-58f928ec870f?w=100&h=100&fit=crop', 'Ingénieure télécom chez Orange Sénégal. Intéressée par les données de connectivité et de couverture réseau.', 'Orange Sénégal', 'Télécommunications', 1, 'Dakar', '+221 78 345 67 89', NULL, 'https://linkedin.com/in/fatou-ndiaye', 'https://twitter.com/fatou_ndiaye', 'https://github.com/fatou-ndiaye', 2, 234, 0.00, 82, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(17, 'kwame.boateng@mofa.gov.gh', '$2y$12$VrDvDvrqfY6U0.v7LDIsROxb.3qXLmVP4B8rlkJJBOXw/id9UHEoa', 'Kwame Boateng', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop', 'Statisticien au Ministère de l\'Agriculture du Ghana. Responsable des données agricoles nationales.', 'Ministry of Food and Agriculture', 'Gouvernement', 3, 'Accra', '+233 26 789 0123', 'https://mofa.gov.gh', 'https://linkedin.com/in/kwame-boateng', NULL, NULL, 7, 1890, 0.00, 91, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08'),
(18, 'grace.mwangi@worldbank.org', '$2y$12$qChUPIVf1axpa.ewz7ZXD.T8Q552ZAOOFNBNUTyyAi5uRdTbAXC8O', 'Grace Mwangi', 'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=100&h=100&fit=crop', 'Économiste à la Banque Mondiale, spécialiste des données de développement en Afrique de l\'Est.', 'World Bank', 'Organisation internationale', 4, 'Nairobi', '+254 722 345 678', 'https://worldbank.org', 'https://linkedin.com/in/grace-mwangi', 'https://twitter.com/grace_mwangi', 'https://github.com/grace-mwangi', 4, 1234, 0.00, 94, 1, '2026-02-21 22:14:08', 1, 1, 0, '2026-02-21 22:14:08', '2026-02-21 22:14:08', '2026-02-21 22:14:08');

-- --------------------------------------------------------

--
-- Structure de la table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet',
  `browser` varchar(100) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_active_order` (`is_active`,`display_order`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`),
  ADD KEY `idx_region` (`region`);

--
-- Index pour la table `datasets`
--
ALTER TABLE `datasets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datasets_slug_unique` (`slug`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_license` (`license_id`),
  ADD KEY `idx_country` (`country_id`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_published` (`published_at`),
  ADD KEY `idx_price` (`is_free`,`price`),
  ADD KEY `idx_format` (`format`),
  ADD KEY `idx_rating` (`rating_average`,`rating_count`),
  ADD KEY `idx_downloads` (`downloads_count`),
  ADD KEY `idx_search` (`status`,`category_id`,`country_id`);
ALTER TABLE `datasets` ADD FULLTEXT KEY `idx_fulltext_search` (`name`,`description`,`meta_keywords`);

--
-- Index pour la table `dataset_favorites`
--
ALTER TABLE `dataset_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_dataset_favorite` (`user_id`,`dataset_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_dataset` (`dataset_id`);

--
-- Index pour la table `dataset_files`
--
ALTER TABLE `dataset_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dataset_files_dataset_id_foreign` (`dataset_id`);

--
-- Index pour la table `dataset_reviews`
--
ALTER TABLE `dataset_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_dataset_review` (`user_id`,`dataset_id`),
  ADD KEY `idx_dataset` (`dataset_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_rating` (`rating`),
  ADD KEY `idx_created` (`created_at`);

--
-- Index pour la table `dataset_tags`
--
ALTER TABLE `dataset_tags`
  ADD PRIMARY KEY (`dataset_id`,`tag_id`),
  ADD KEY `idx_tag` (`tag_id`);

--
-- Index pour la table `dataset_versions`
--
ALTER TABLE `dataset_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_dataset_version` (`dataset_id`,`version_number`),
  ADD KEY `dataset_versions_created_by_foreign` (`created_by`),
  ADD KEY `idx_dataset` (`dataset_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Index pour la table `download_history`
--
ALTER TABLE `download_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dataset` (`dataset_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_user_dataset` (`user_id`,`dataset_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `file_formats`
--
ALTER TABLE `file_formats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_formats_slug_unique` (`slug`),
  ADD KEY `file_formats_slug_index` (`slug`),
  ADD KEY `file_formats_is_active_index` (`is_active`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `licenses_slug_unique` (`slug`),
  ADD KEY `idx_slug` (`slug`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mobile_money_operators`
--
ALTER TABLE `mobile_money_operators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_money_operators_code_unique` (`code`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_active` (`is_active`);

--
-- Index pour la table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_provider_user` (`provider`,`provider_user_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_provider` (`provider`),
  ADD KEY `idx_provider_email` (`provider_email`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_mobile_money_operator_id_foreign` (`mobile_money_operator_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_default` (`user_id`,`is_default`),
  ADD KEY `idx_provider` (`payment_provider`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sectors_slug_unique` (`slug`),
  ADD KEY `sectors_slug_index` (`slug`),
  ADD KEY `sectors_is_active_index` (`is_active`),
  ADD KEY `sectors_display_order_index` (`display_order`);

--
-- Index pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_plan` (`plan_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_expires` (`expires_at`),
  ADD KEY `idx_active_subscriptions` (`user_id`,`status`,`expires_at`);

--
-- Index pour la table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_plans_slug_unique` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_active` (`is_active`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_usage` (`usage_count`);

--
-- Index pour la table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_is_active_index` (`is_active`),
  ADD KEY `testimonials_is_featured_index` (`is_featured`),
  ADD KEY `testimonials_display_order_index` (`display_order`),
  ADD KEY `testimonials_rating_index` (`rating`),
  ADD KEY `testimonials_published_at_index` (`published_at`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_transaction_reference_unique` (`transaction_reference`),
  ADD KEY `transactions_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `transactions_mobile_money_operator_id_foreign` (`mobile_money_operator_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_dataset` (`dataset_id`),
  ADD KEY `idx_subscription` (`subscription_id`),
  ADD KEY `idx_reference` (`transaction_reference`),
  ADD KEY `idx_status` (`payment_status`),
  ADD KEY `idx_type` (`transaction_type`),
  ADD KEY `idx_provider` (`payment_provider`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_payment_reference` (`payment_reference`),
  ADD KEY `idx_flagged` (`is_flagged`);

--
-- Index pour la table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_items_dataset_id_foreign` (`dataset_id`),
  ADD KEY `idx_transaction` (`transaction_id`),
  ADD KEY `idx_item_type` (`item_type`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_country` (`country_id`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_created` (`created_at`);

--
-- Index pour la table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_sessions_session_token_unique` (`session_token`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_token` (`session_token`),
  ADD KEY `idx_expires` (`expires_at`),
  ADD KEY `idx_last_activity` (`last_activity`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `datasets`
--
ALTER TABLE `datasets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `dataset_favorites`
--
ALTER TABLE `dataset_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dataset_files`
--
ALTER TABLE `dataset_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `dataset_reviews`
--
ALTER TABLE `dataset_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `dataset_versions`
--
ALTER TABLE `dataset_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `download_history`
--
ALTER TABLE `download_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `file_formats`
--
ALTER TABLE `file_formats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `mobile_money_operators`
--
ALTER TABLE `mobile_money_operators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `datasets`
--
ALTER TABLE `datasets`
  ADD CONSTRAINT `datasets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `datasets_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `datasets_license_id_foreign` FOREIGN KEY (`license_id`) REFERENCES `licenses` (`id`),
  ADD CONSTRAINT `datasets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dataset_favorites`
--
ALTER TABLE `dataset_favorites`
  ADD CONSTRAINT `dataset_favorites_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dataset_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dataset_files`
--
ALTER TABLE `dataset_files`
  ADD CONSTRAINT `dataset_files_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dataset_reviews`
--
ALTER TABLE `dataset_reviews`
  ADD CONSTRAINT `dataset_reviews_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dataset_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dataset_tags`
--
ALTER TABLE `dataset_tags`
  ADD CONSTRAINT `dataset_tags_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dataset_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dataset_versions`
--
ALTER TABLE `dataset_versions`
  ADD CONSTRAINT `dataset_versions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dataset_versions_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `download_history`
--
ALTER TABLE `download_history`
  ADD CONSTRAINT `download_history_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `download_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_mobile_money_operator_id_foreign` FOREIGN KEY (`mobile_money_operator_id`) REFERENCES `mobile_money_operators` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_methods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`),
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_mobile_money_operator_id_foreign` FOREIGN KEY (`mobile_money_operator_id`) REFERENCES `mobile_money_operators` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_dataset_id_foreign` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transaction_items_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
