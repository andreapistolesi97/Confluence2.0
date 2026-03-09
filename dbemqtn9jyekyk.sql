-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 09, 2026 alle 16:32
-- Versione del server: 8.4.5-5
-- Versione PHP: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbemqtn9jyekyk`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Archived_Contacts`
--

CREATE TABLE `Archived_Contacts` (
  `ID_Contact` int NOT NULL,
  `channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Timestamp_Ingestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Quality-Checked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Status_Preparation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_General` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_Marketing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_Profiling` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Blanks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Quality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-within-List` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-in-System` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-in-Customer-DB` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Vertical` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_B2C-B2B` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `mapping` json NOT NULL,
  `Click_Prefill_Timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Blacklist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_ad_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_campaign_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_spent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Confluence-Airtable-Check` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `blacklist_agg`
--

CREATE TABLE `blacklist_agg` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `blacklist_agg`
--

INSERT INTO `blacklist_agg` (`email`, `phone`, `timestamp`) VALUES
('00edamame-sumak@icloud.com', '613207844', '2023-05-24 14:24:30'),
('sara.compagnucci@revelopsrl.com', '', '2025-08-14 09:12:12');

-- --------------------------------------------------------

--
-- Struttura della tabella `blacklist_local`
--

CREATE TABLE `blacklist_local` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `blacklist_local`
--

INSERT INTO `blacklist_local` (`email`, `phone`, `timestamp`) VALUES
('test@example.com', '+3900000', '2025-08-14 15:45:56');

--
-- Trigger `blacklist_local`
--
DELIMITER $$
CREATE TRIGGER `central_blacklist_local_ad` AFTER DELETE ON `blacklist_local` FOR EACH ROW BEGIN
  DELETE FROM `Lean ADV - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Media Prospect - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Digity Solutions - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Dfusione - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Interactive Global Data - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Lithium Ads - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Levante Media - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
  DELETE FROM `Netpulse Media - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `central_blacklist_local_ai` AFTER INSERT ON `blacklist_local` FOR EACH ROW BEGIN
  INSERT INTO `Lean ADV - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Media Prospect - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Digity Solutions - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Dfusione - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Interactive Global Data - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Lithium Ads - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Levante Media - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  INSERT INTO `Netpulse Media - Production`.`Blacklists` (email, phone, `timestamp`)
    VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
    ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `central_blacklist_local_au` AFTER UPDATE ON `blacklist_local` FOR EACH ROW BEGIN
  IF (OLD.email <> NEW.email) OR (OLD.phone <> NEW.phone) THEN
    DELETE FROM `Lean ADV - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Media Prospect - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Digity Solutions - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Dfusione - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Interactive Global Data - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Lithium Ads - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Levante Media - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;
    DELETE FROM `Netpulse Media - Production`.`Blacklists` WHERE email=OLD.email AND phone=OLD.phone;

    INSERT INTO `Lean ADV - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Media Prospect - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Digity Solutions - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Dfusione - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Interactive Global Data - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Lithium Ads - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Levante Media - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
    INSERT INTO `Netpulse Media - Production`.`Blacklists` (email, phone, `timestamp`)
      VALUES (NEW.email, NEW.phone, NEW.`timestamp`)
      ON DUPLICATE KEY UPDATE `timestamp`=VALUES(`timestamp`);
  ELSE
    UPDATE `Lean ADV - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Media Prospect - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Digity Solutions - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Dfusione - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Interactive Global Data - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Lithium Ads - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Levante Media - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
    UPDATE `Netpulse Media - Production`.`Blacklists` SET `timestamp`=NEW.`timestamp` WHERE email=NEW.email AND phone=NEW.phone;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Contacts`
--

CREATE TABLE `Contacts` (
  `ID_Contact` int NOT NULL,
  `Timestamp_Ingestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Quality-Checked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Status_Preparation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_General` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_Marketing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_Profiling` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Privacy_Indirect_Marketing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Blanks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Quality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-within-List` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-in-System` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Duplicates-in-Customer-DB` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Vertical` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_B2C-B2B` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mapping` json NOT NULL,
  `Click_Prefill_Timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Blacklist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_ad_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_campaign_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `meta_spent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Confluence-Airtable-Check` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Email Response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registration_time` datetime NOT NULL,
  `ID_List` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Contacts`
--

INSERT INTO `Contacts` (`ID_Contact`, `Timestamp_Ingestion`, `Timestamp_Cleaned`, `Timestamp_Quality-Checked`, `Timestamp_Standardized`, `Status_Preparation`, `Privacy_General`, `Privacy_Marketing`, `Privacy_Profiling`, `Privacy_Indirect_Marketing`, `Check_Blanks`, `Check_Negative-Quality`, `Check_Negative-Email`, `Check_Negative-Phone`, `Check_Duplicates-within-List`, `Check_Duplicates-in-System`, `Check_Duplicates-in-Customer-DB`, `Info_Vertical`, `Info_Channel`, `Info_Country`, `Info_B2C-B2B`, `email`, `email_original`, `email_cleaned`, `email_standardized`, `firstname`, `firstname_original`, `firstname_cleaned`, `firstname_standardized`, `lastname`, `lastname_original`, `lastname_cleaned`, `lastname_standardized`, `phone`, `phone_original`, `phone_cleaned`, `phone_standardized`, `city`, `city_original`, `city_cleaned`, `city_standardized`, `address`, `address_original`, `address_cleaned`, `address_standardized`, `date-of-birth`, `date-of-birth_original`, `date-of-birth_cleaned`, `date-of-birth_standardized`, `zip-code`, `zip-code_original`, `zip-code_cleaned`, `zip-code_standardized`, `civic-number`, `civic-number_original`, `civic-number_cleaned`, `civic-number_standardized`, `gender`, `gender_original`, `gender_cleaned`, `gender_standardized`, `job_title`, `job_title_original`, `job_title_cleaned`, `job_title_standardized`, `company_name`, `company_name_original`, `company_name_cleaned`, `company_name_standardized`, `company_vat`, `company_vat_original`, `company_vat_cleaned`, `company_vat_standardized`, `industry`, `industry_original`, `industry_cleaned`, `industry_standardized`, `favorite_color`, `favorite_color_original`, `favorite_color_cleaned`, `favorite_color_standardized`, `lottery_number`, `lottery_number_original`, `lottery_number_cleaned`, `lottery_number_standardized`, `mapping`, `Click_Prefill_Timestamp`, `Check_Blacklist`, `meta_ad_id`, `meta_timestamp`, `meta_campaign_id`, `meta_spent`, `Timestamp_Confluence-Airtable-Check`, `field1`, `field1_original`, `field1_cleaned`, `field1_standardized`, `field2`, `field2_original`, `field2_cleaned`, `field2_standardized`, `field3`, `field3_original`, `field3_cleaned`, `field3_standardized`, `field4`, `field4_original`, `field4_cleaned`, `field4_standardized`, `field5`, `field5_original`, `field5_cleaned`, `field5_standardized`, `field6`, `field6_original`, `field6_cleaned`, `field6_standardized`, `field7`, `field7_original`, `field7_cleaned`, `field7_standardized`, `field8`, `field8_original`, `field8_cleaned`, `field8_standardized`, `field9`, `field9_original`, `field9_cleaned`, `field9_standardized`, `field10`, `field10_original`, `field10_cleaned`, `field10_standardized`, `field11`, `field11_original`, `field11_cleaned`, `field11_standardized`, `field12`, `field12_original`, `field12_cleaned`, `field12_standardized`, `field13`, `field13_original`, `field13_cleaned`, `field13_standardized`, `field14`, `field14_original`, `field14_cleaned`, `field14_standardized`, `field15`, `field15_original`, `field15_cleaned`, `field15_standardized`, `field16`, `field16_original`, `field16_cleaned`, `field16_standardized`, `field17`, `field17_original`, `field17_cleaned`, `field17_standardized`, `field18`, `field18_original`, `field18_cleaned`, `field18_standardized`, `field19`, `field19_original`, `field19_cleaned`, `field19_standardized`, `field20`, `field20_original`, `field20_cleaned`, `field20_standardized`, `Email Response`, `registration_time`, `ID_List`) VALUES
(2, '2025-08-14T12:08:09.623312+00:00', '2025-08-14T13:23:39.411819+00:00', '2025-08-18T07:09:34.934230+00:00', '2025-08-18T13:09:09.373323+00:00', 'Standardized', '1', '1', '1', '0', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'it', 'B2C', 'gAAAAABooySY8MgUY3qGci5MoHH1VuHjhv3IQ4mD2dp3yuPGdF9MuOVtiOujq2EBh5hY2fRdXyTh42YFTjBhxe4NyltrlaRMXid1XcgGvmsuEeVJ84Jvy2k=', 'gAAAAABondGp1o4aRbvIHGo0WrK1PiNzcMzX8UnKjHsNJSZwvFZP1V7CtSCKoQQSthbkQiaLbCknL_ZExgcaN84DtCiLbVJjwvlLAaiYiSkfQ5nR4n46qTQ=', 'gAAAAABoneMzbpIfsF9YK0WWQxH0TTnV3OqZwxWW6VFuSsmi0136fPTQ3Q0NRihWxOdrlwNsaosjyVMHBsjl48Zyz4hUzu7nVbRcHqFsF5bjsxajT2burwg=', 'gAAAAABooySYj8yMu3i0VFKo1RAgDrFYmwf7Gaqm2yN63PpM_wpLHMzmpxyMIIltJ4G_IVr4ZpPohjDjmBr51UE4Y6obUn7t-p-oznIec5Hm3glnoRnj1s0=', 'gAAAAABooySYnO7-E8GCUL51gOFHFonHPFuBHVOIwPWJg1FkydAfuQxf_Lv1BCGjZKu63M5VKrNTAUGmjezWBwO9hVoLTJbsBA==', 'gAAAAABondGpDAC1AVovl1r-LpqVM7WPAA8zAx4u4Nhx-nk9Fc9Bsrjd6DxHvUFftbl5Q9xBmptAY1IEWw-9ehujAlnnz4jV7A==', 'gAAAAABoneMznABSuari3o9kP3eyEQyigGKApum06IkWhhq0wThxYXFZWRM-7Ir-PUtEUqnnLavu2qjlk37a5whCmcmnP-mD4Q==', 'gAAAAABooySY8pYvt5ypBC8qfzd54CLbYlmkilA8WV0t15QIZP6y9Sblbde-BXgJYkmfm5xb5XdnLR9L_rjFGR4NPD9_afLRsA==', 'gAAAAABooySYPecyupENGEDhNwRLsCzPAYyNm90iZE4yeBwjrfR7UIfQ5SrSnva9zRlWKV5WMQX_oSR6cB8dsDvz9ZnjDibm8A==', 'gAAAAABondGpOo9VqZHvQSKsL7riLwSvLfC2_rc3L6SQ-bSBMSniM050Es5uZDdaOxY7YmWtZ_1HLcd34xgladr8rIihOWtGTQ==', 'gAAAAABoneMze4jPur9bRFkD3ImfPEgrDhq4A4kXx04PaTuef5FkSKIKb2yIfh1JhIQP8JW_cM7QZbMLiPj-uk1ahKHrnt8xew==', 'gAAAAABooySYvXwysefeK30s-2SMHg4_AwvOrlgF2LiMnfDVz8-VYN1DjnieX6wYBFMwUKuM8zcyln0r_byfZ_LzvwfwQrMDqw==', 'gAAAAABooySYWwY5y71BWLd1LGbpLmK9cgmcvL1Lw-XxjWkHqpOZRsgBzckHmKi3QrGWjTgSm_bGH0gM2cAA0m7wsl0hU_CMCQ==', 'gAAAAABondGpGQMJf76lSy0m833zGmUtG6evWPA38yaduc8y81hNJxrL_Y0Nm-J_EsEtPyCP0WvW1ozmssOdrdBwL7xXw4afHw==', 'gAAAAABoneMzhzgh_g-G4kLDLWfJ1Dj01Cq03G9D4lCKVq2F_TVV8OqfL4r0v0Otkl9czKZtknDAgoNvGes-NZKGejT37J2tOw==', 'gAAAAABooySYgiyX-gi9Q2rz_68jh6KbkUVa5UntIxgIKnHp8QPoezbEESFcF2ABf-c9QzhsbYwheh6XeW1Ul08RS9EEIbaobQ==', 'gAAAAABooySYsq4Hmpih-6iBe2wZ11Kr89cZ48SuPI00FHmW6hrWpz3kt2M8_ovJb-MaK8gVpGswTYQsao5hPIWOQUfOLfuUiw==', 'gAAAAABondGpQqIdgqPx7CyhmRrQko_yKgWHdoRNiYgBbqtteiME6ULY2qpkuz_X3unkdhJ4j2Qo2PCUtss4dkj99DWSahPgGA==', 'gAAAAABoneMzlYldU4NgHMudKLDFGooPU2U_k7-3jAIBt6uPxKLm1qBCV2pSUrU8Lbgny3CWbHhAiaXOHa7cS41Kzh1XWavlqA==', 'gAAAAABooySYuFiTjUjyh1pl9F_dJezlSP2IrqFwtG0aD57oPwx17w0x5DBFyO4oGRaiN6O_PYO1Is8gtZV3Q1Bm6nAHMVcJXA==', 'gAAAAABooySYi768GJnpfPFIWB-ZoSSPWqt6YxNBW9iaNTihWZ0d9tRG0bXc7Dax4kjV3ZiORpWR6z8Fec1PIaBv7gZXAQZfVw==', 'gAAAAABondGp8Iw3qoTHxMpMo14dgDb6crX-_hsTrJPemWIZra5IUfpIjYXrPYTFvjA2s3Tf1c06f861H_Z49zU7D0MJZq7mDA==', 'gAAAAABoneMz2BwaGSsUsEAGQVLmH-idJWxcFjFjLZW7RCU_zx1Q5ck5cqD7xfgfSumHLf2Lc5BI13Mmtykgu2SU7ONsFMLqFA==', 'gAAAAABooySYCzz5E-GxjfWQjGyCt7pv9tGjKavzIAvqElRabBvZ5cgOSsvIHkfy6WYpNG_HTzNllhBrI4IjU913pC5fTwNzRQ==', 'gAAAAABooySY7GzJQF_rwplKmLScwnKfYiEnbECAymSndL9nt8MBsepqJKCJ02eHGJYnniwByqCOdoM6Et3MBbUry72Jn_8i29vmpgZJzRPga0GEB4LudKA=', 'gAAAAABondGpRdffTUgSUM2gllpn4yS_GVlqvfDfINUfAqo076awobUGn8zfUX-Yv56N7MUUGZm_gsKGLDnAIZS5m07JeLA3hWKRyAhCKlPBwTTjA4j2LJk=', 'gAAAAABoneMz4u3lAWaZs6OACckf6_gLWWbA9cRapaR9KVP6pgbfqlf2mBJkTM0vKt2hL15R84KucmE65OEr6DygI_hGi78UmpU6SqzDss38vj4Avywf0eI=', 'gAAAAABooySYlC5X5O2MrFHlt7Iqxxt2zd55XgGUo6GuHMynFGioE9ESzN-jIKXOXwjYywFhAViI5F3p14f6HKQsnSHO9dTbDarNlHSXZOL25mUqBYsDqio=', 'gAAAAABooySYHYS5XyHITxh4X6XcS16ODIwAMTt3bxMOsYXkE9tWZx9RTfF2q1FqpUbRvaJthRniS0PEx7qfB2Ol05FuCBPWtQ==', 'gAAAAABondGpyP-Zf6ypWhq0Hw1jXofeVzGbKnf2sZEmiP0S22bSdbgR3lJAShWJylC7sgZo7Qu9qNv4BOF2kpQue7Z8sNm3sg==', 'gAAAAABoneMz_SoyI258zKsVu0GwK65WPKJfCwjMKIEh4o0bkb_roHwlPqcWlX2I_SSBUP6U24h7PuWiu3Ygcx_G4V4UXS6iGQ==', 'gAAAAABooySYtTOrw_2Q63o_zvEk_1hnboi_Z-VpyT0ciZu2fSDxnJhmSfvcdFA6JGBjYBxlFyLjxuWs0FUJvRVcsz7fBCNHOQ==', 'gAAAAABooySYl1vfCnoYkXVIVkqyh7TyRLr2qCeocOa6beZlRO4VCjeqvqgboGjGXvaB1OBejeJMmhDTrgKewD_IwQijMLobaQ==', 'gAAAAABondGpO_-KacLg900Pn6I5Xf-eE4LHTlqH-6rFIm355QE6yS32Ah7f2-9kqrKJ6cnsFHM03KvkX8P34b4Am02Bixhltw==', 'gAAAAABoneMzn6n9MsXhVOd9tpvE8-QvUm-XSAY7UmlT25nG017RRYoApMzqIsnoom5BCSWPVi5XzWmseox1ptTA8SOkNcpC_g==', 'gAAAAABooySYCeonXxHTB3tSVO8LKX59zjpF4JnsKahJzyRfbh-dI-ylISKgAuDH18nH0jRhnDR1AAJsa_8qzRFxbuy8G_k0MA==', 'gAAAAABooySYiCd47DcPyXWiHTQJDkRo5UFjDbkJLj3lLdZUt8hiYWm_rcZe4Vt-mNdUCxpkNIOkYkKIS27benPy23vxKLB10g==', 'gAAAAABondGpw4MGM76DIUUbOT13PVRMxUBCCwXeeRzn1rmrHlfZZEo2JdPoZD5-RcqFdRL_Twvt9J1wgeiMzppRMUcPVcQgQg==', 'gAAAAABoneMzKBnDCyAkGx68XyPpQmh5IXvKDcM3-Ksp2cB8pEkgsJaTOxiNXr-06YiqCy1KnqntkbuM8THBxKBVJNfZwkpiiw==', 'gAAAAABooySYXDulEuO5W_0o_APMUx-cqGaAfcTpnPk5gMeGqa_aBaQhz8K2ZGeNvbPNk_v7M9m8GaQGkImaDU9UtFVsgihigA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', NULL, NULL, 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'kooVxUMzRUqLp0QGqYwDAQ\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-12 09:29:11', 6),
(3, '2025-08-26T14:13:08.926052+00:00', '2025-08-26T14:29:47.656523+00:00', '2025-08-26T14:57:27.272110+00:00', '2025-08-26T15:10:27.204186+00:00', 'Standardized', '1', '1', '1', '0', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'it', 'B2C', 'gAAAAABorc4EEkhWV09DSEPOJ3Ob7DnKH8_xFlz73399BXEY8O5q_j8xG01EVM0KuHH6rKX9U6GFO4H_eg9hjlTLpFV2UxXUN7fPrAm8Q4Iq95US3ouQvvE=', 'gAAAAABorcD0ckyE5CCjSIIYl1sZh9bNLZfjVK9lixP2SOOw6-fHkyfTm58wsHW86b-Olrq5BYDXN2k-H4SAeJ5AOOa1HEdHkcIVwJfWVg899rD-zIG39o0=', 'gAAAAABorcRLdygoArygD8FE41Ch7QDTkcskosDCm_pZrk0qD5e0RslDNIkWYy-Whzd2NUmXlw0INaKFqzC8bJnzr5RQq58KuDdTMJuXRq_K2zUGXijpi-M=', 'gAAAAABorc4Er_cypR2cMmLFGcTFcY3n3VU2TRHpC0a2XjrvXMfmLRrjUo7949Rg27X6OWqmqHYrlRPGj8q9sgm8hjzgO3YZJpQIByqK0OM5Q-acZBArhxc=', 'gAAAAABorc4EHy6OnYzurQak27iLhyUwQKrp8RgX_1BH-oMz740ruyaPLE5hY28eeLI33KOhy4AiTqjtrnYmenOP4X-O3H6xGg==', 'gAAAAABorcD0wzWX4kHx7Hshrlj5xd4Vg-I6ugUl_4ouAh3MXeXPgMhqtfmX28DNVqxJOfe_gHIN3EY1pAIHwbxF44rsEwVeUg==', 'gAAAAABorcRLCIEwUH3OjI7Q3AW4HBDhAvrky92t3BdoJwfD4kJWpgEkLuvIxvmaoFZRMWXYjWzah4DpgsRDClsZ1NETLW9YIA==', 'gAAAAABorc4EL-dNQgE2PmMJX4skQOSy5jBl1-wu3UeZUrhcjNblw9cGv-w5UgUpGUWCN7BAV-N2llsnj5EudyHVurxEhM0Qtw==', 'gAAAAABorc4EeavukRzlYC0tlzkscly3PFTd_Km40Kv5KMv0sk1RB_HlNLTHpXzsthj-jSON7hExtI3g2Njt9xncJDMd_Bj7qA==', 'gAAAAABorcD0K48rkLPwz0Je-YPJuIS7AbHjwh1cn1-hU25UAX1-o-knpd2ziBUrwxiCpsOyI2eBDOU4brp9JhScM5JMdHHQCw==', 'gAAAAABorcRLkTnb5cWzl9Ha75HqUmPQNtsfF7lEnQBuUdRg1fYAqt0Zwqhe04g13JidjTpxGB-vmu4RaT2DysMMfUkQjCR67Q==', 'gAAAAABorc4EBt-jj6_XDP8ACZG3GgeHCkyb_iohUQnUMpAZnRLtPBdWRZihINsr5CXXCsq3gryOHWTIRe6-mhDI7y5GMSw5cA==', 'gAAAAABorc4EL1iDhI2muIjYp8qjckqrbybtAr4iDUJ0RX3pS4GtDHwext0HLARaxSfGcpn2UNU36uuPr7s8_63hylsXs1rrsQ==', 'gAAAAABorcD0bzMnpoHIBknFJ8kB_XhJstuJPtW_UkluuzP1zhRbSiZqXncB5WUzL-aJImgozMrdTLPGQTH9Wy7NvzI1A9573A==', 'gAAAAABorcRLiZUp7uTBr14Dfwi0cu4bf0SRl0aplK8hy1EA7myMEtyTJaDFqREpuuxT_2duIjzdMyOXVVXOhrBKEYQj9txUCw==', 'gAAAAABorc4E8qZ6QZNOmlI2x1X2CaYYpkanXejeIFPfk9gwilp3uaSK5ag6HQN0vfwKoa-kvtuVCYE7S9jG38WRK7-Ar4MCFQ==', 'gAAAAABorc4EEFgfaxH31_pYbxpk5Otdk1riiM9B8AfZQ8K1BKFSnDp_m3k-pSwCQASzhvgkTZIeLo5bCJ5KbCtxplzJyhMwlQ==', 'gAAAAABorcD0F-WMMAIxCPGusAMphKBJxxb7vHFE3i8yshFRcuCD6zcOUuD0B_kST-QJwHatVuImapCHD3JXSOCJroNB2j7_aA==', 'gAAAAABorcRL5CX5BJ8hT3uhn9jpCnzGSSJ65Y5TeZZ62leA_Kltgyd5EPM303f-MVwqiBJgliEatsHadnFeCppCOAyJ1__yig==', 'gAAAAABorc4EQpjECbWJnSQKE3iK7Lnxm0TYZob4sHTebw4upv26-l99P1iYq6MsbkwaowgsTCSFfT3DWcpUU_rlmMwOGNFPtw==', 'gAAAAABorc4EzfLrRJNDOtpeBIW5cNu2QDAx75Jicw4cLXf4-6FEIlRT9hTkeB7jBHpntYG3N0gQK3IOLQV2NQRTH2rakPOVbQ==', 'gAAAAABorcD0Q2lnukkl6L2AdNIlmBSDxCtRzMVEPLlbVsEDGtC7hXmmE_iZy-9zrznShLTcHOKOzY1coyI36LXoKrAA1dyp5w==', 'gAAAAABorcRLuOFWJ5pInO1p-1Qjjx1ZghD44BDyJrK8j34hKF_swEEZuQF4njepIiHiLhACHgSSKxic-eTMV8LNfk5QRfEEPQ==', 'gAAAAABorc4E8zPxbeHO3dzXU9smEjnK01xMS47aqIHJKihydvtmQkN68bVe8Huq1zMQG9fMw0gO0cu7ryxavzrjj3owtRNkyw==', 'gAAAAABorc4Efy5UUNelzlB8OzFjppl1Hs4n9yTsahFpKFoBgQTB70GShEqgcif1PXySEwpQ-KWmPg7zwCJkPOHahFJ-Lfql4g==', 'gAAAAABorcD0kCIuHF-vccuDw4cCodu9Bxz4WrxZH55MjDjCb6gIZfQmAhiBhXBZgJG2Vz8lJOkofr4acAWXjvSgIx7RVtvn3g==', 'gAAAAABorcRLox-MYcngCCwKctNStkG60wapGhfNdP1eo7fyMdgjqf0B0sQ_6hdqbs2L79flwpeY6GXNdyAM-2PJebSWKf9rbA==', 'gAAAAABorc4Emufngq9vWaH3YZj3MRAvDMEFyBvUun97ENnV0fdHZvBZ0KLB_SmGLNfePaak-WZPuB9Ir4gafEcrsiOaeRLngg==', 'gAAAAABorc4EJcNi4ZiZvyXYx3TngnNkTHqnXrmfrzHAFFv6XbSqi0nyB9ObNy74i-gQ7eq_x1zdg6v2jgw-r-Ioo17JVaJ1mQ==', 'gAAAAABorcD0nnYaIboELuThDNft-ocFBf5mS-AHzmAcyRNAyPutIsj7fwKYjDkRDtz_Qfqd_FL9JFM_6lH6jafjqzJarFVf1g==', 'gAAAAABorcRL52cd45cvpBB7DrQQTNWkro2KjD9-RA_V_9KgqT7Uba4InoK-qAE5EX4iQIRWip2FVoViDGzOdGJMdy7IRwbwVg==', 'gAAAAABorc4ErnL-kWZUkX6GT44vo4L_gdi7Cb72tLOM8bF6apVVtlaa0URYz_w6hBq_uc7fXUa9uLztDKlYZX9oDYk2v0XsOA==', 'gAAAAABorc4E2swf25Z_yz8Leeu2d66DrvNFMXM2Ooj3mjJ6yZB9e92WWpX90XTbfNaAXSoMnc39f3qSpC5Y_Xxbe4YwSp5L1w==', 'gAAAAABorcD0Oq9ei7v8qL_e4hy4BBW7l9_rTDIm6wDDmz4_1rKAjYCExEPaOO3Ut3oe2Bh-zqK1Ho1zb_zYG1gkQOjeVt4Ubg==', 'gAAAAABorcRLtQSOsM-2KrgMY12FzxSeYefcL-HvEti63YhJfyH12ZY9iaBsa-MXyZiFNAwWTTebPlvrVUGnyr05n-P5xEd8PQ==', 'gAAAAABorc4EZJrIIHK11bD8ynQMQPy7J7gqt6SeUcPjGQZJRvm7Wx6Rz54Z_pTwxEzoCpXwuXHEeH_LHGIg0Q00b0z_NZ9OaQ==', 'gAAAAABorc4Eya_S0JYqvCnGwqaF8IYRBdK32oAVgEf6KNU7jDYokm5pjKYvnAr-wM0hAkmfxpyEXwhlS_D1KgeT5-wusbN1kQ==', 'gAAAAABorcD0kKWMYdZO2EXxlrv0v1p6pJjuAtxVjyDLrzxas6ljAE-CliV-LTXlcnOFAyzpH4Iw-cPLZRo7wK8h-QEoSkCfmw==', 'gAAAAABorcRLkaoN_bUex5UI1VOPUR7ddLF0_-2LHwSYXEAz9NTzzy_TtrTZCz5JhaMwFYAjcdEVouv2PXfYz8UhUzvtQaq4ZQ==', 'gAAAAABorc4E1OeisCPcW2opjWKc0SJ8Gyhec6IZx47D-c3HdxzoASBw4pj-4rGzCEF2j5Iurc87JV1DMuk-uUGddibfmwW9QQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', NULL, NULL, 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'XruZFpWKQ12K-y0-ntlFUg\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-12 09:29:11', 6),
(4, '2025-08-26T14:19:30.416826+00:00', '2025-08-26T14:29:59.317197+00:00', NULL, NULL, 'Cleaned', '1', '1', '1', '0', 'False', NULL, NULL, NULL, NULL, NULL, NULL, 'Generic', 'Syntra', 'mx', 'B2C', 'gAAAAABorcRLNkBae5ApjBiTu5zoPo7yaRkPHpMjXG2S9RM4alZHAlu5Ky235Z1QS5LAYPtqIsA2bsNGKVFSUiQc6EUrfpqkUGwY50d9rh26s1igG5gGx9E=', 'gAAAAABorcJyfm4EO4wtP4RHs8OqkCiv1SKpSNuiqrn1o1KS0ee9_mmuEr_Z_0Ido0kvwinzD8-xuHB9RFGGfSafDVmgmSC7EOJ2YxcsGbf0hDkMvMCznnE=', 'gAAAAABorcRLigF511QR9Dc0FArHyeZvyzOaM4waBml1Cs7phmXVL1dyw3m-_ERoit4XefZtOcGMr_Xq4A-1BNo4fCyQH4kWANR5iB1U4M9FyUHiaNX35xY=', NULL, 'gAAAAABorcRLoP3yGIy3tG_NuQ1JAlh7KNVqpCL0bC9ktqfpsp1N-BUP5zey2_tUGUB6bX85Zc1Ydyka4u5Pi-0Nm2Bnf3_odg==', 'gAAAAABorcJyxxJjnCxh9qUuy3_waKZLd2DC6agFuN9Bnsb8veWZJ4Y3-py-Sao740aPBJOiRMozd41ahYpFKGj8IeaEfdLJsQ==', 'gAAAAABorcRLhnWIwKb1Qer0DWAJhZVyEenJ1nYZyrtd6i2Pogzhc_Yy5dyrMvnA2NY0uiDt4_gLbNnaV5nKNBijML_Qqo596w==', NULL, 'gAAAAABorcRLMJufb11OrF7Goliy-gFEtUqk3_LZNz0GWv66BDFvhlKxijWpVE1eoBfOIdnkerunmy5ImtKtK-IWhNBwjgbQkg==', 'gAAAAABorcJyAk4vNuSpNO7RAJJRxAv8gc4LhWmX3yLdyfK-x8uB5gp0hIt5T0vs5DeDw3EoXZTyQMVPv4fA4-2UM8aGj2uRuA==', 'gAAAAABorcRLNlFKhEudFylsJnGtw7XHCcEawyWwbst7EPTtMosps3mPjzIkR18ABK9RRcfZmpRPXGEdofA5spAsDoFDYpm1Tg==', NULL, 'gAAAAABorcRLXKUIp5jz0VZEf8vlLyej0nvVAHzNkSs8XOqlq0rFiS7G-yODOu1xC3wqtZlCPu5Bwy8XnD-dzMVNAYHqPBtyow==', 'gAAAAABorcJyTRFdhz-joeZccVoEjDf7VcU6mNvvjCdZuDSYN3UD_1aYs2-GBUCanpIrQbOFoig3XlNqvy0lHeteckFRN13dKQ==', 'gAAAAABorcRLpM5qIXbxtS3Si5qpVb8lUxBf9aXPGlSLCJPPYtC1Y5usqSyBIZP_VOJ5GqUI5sdApXtNj9hxBOCt1YreGRnBYA==', NULL, 'gAAAAABorcRLApYElWJLR3jSHjv_4SM4sWHw-S925xZi472xx4B6A_Bek926LKpoeKG07WwBzGhFv5560sOxon4ypLXplR445A==', 'gAAAAABorcJyLqtShe5XMWeFN36VIJYY4AUdsVXXWYrb0mJNEQiy-n5iIQ9OQdV6U8Xx6lVhtSjbYhH3iwSP_QRcd2tPBp2CcA==', 'gAAAAABorcRLHKqxX12eIkqOT4zx59S6R5RgnK5JbAAd2UUWFmJxh_FXYficnXo6IA1Hzm4Ohg2KOMlii763PYG8sddCaxwMvg==', NULL, 'gAAAAABorcRL1S8GvoJqdBFLX9JyWSp0aUNh_xPfpPXzFSmdzTitWv1-E4efcBw1w2eVhT1Rw9rB9dFZa3eA8VduzYMfOFwbjg==', 'gAAAAABorcJyiBAT7XwN3v7NOa9mx4p5xRcQ6Dt0l13ma6Ed_mT74pgT_Nzirs-qf1ZJpvL3y8cEqrrlkOhcJ6VBO3mWgzZMZQ==', 'gAAAAABorcRLlse5Ed1Hd9KvEKOUFwUuR0WAzZzvhQrnGl8ACvC32aI-9_1l10EsvarDkDjNR579YxTXRXAB-Yj_M29T-hmgXg==', NULL, NULL, NULL, NULL, NULL, 'gAAAAABorcRLsoe3dii_Mk2KrdIpps7ZEL6dFcf0fmXhFnUZR79CB-YuREzCPSKupQFow5r1sPbQJH0Ru2hrqhMsyqzHSzMrBQ==', 'gAAAAABorcJymp2DLvxDKdTDL0rh_3TyJxQMJKPVYmViBKbVXrVz1qO2wPb1FtnwafTmOcFV5vhuYlA7uNkIg2CHYDjLybQbiw==', 'gAAAAABorcRLRgmP72XzmsS1s9VWOJi66FgOe1VGfvxTR3WyTuVBYCVub_FcNh9LalKHCZXAbn3s70Y3WCfHVCbHhJamWNBpYg==', NULL, 'gAAAAABorcRLmFj5VxR5nmhup_57fO7bw4Nux7dg3PPgt4m-zSgOVNSg7o8xMZSzn_EiKUx5iIwik11M4ElXna738kTIGt61jw==', 'gAAAAABorcJy7prF-oUf078pDgvt0FCmlqoGhzQ8KoEsmxRGLc11wZm4YYBjiFZD4hKV41K2Fwix2OtPgZeQ_omMBSVhF2yXHg==', 'gAAAAABorcRLmeTmMqnVQ58CsOK1zCLAPXXa7xW73stHJtd0RGAoSqy7BHr8SqYDVMyJV_O1ncADhBxHWawa0i5Qo0o9wSf_VQ==', NULL, 'gAAAAABorcRLFmVrtXsdmAdEPi0zaZLHTpfZABBKcrMyGsQbeRrZRBSuXFWoEznidGpo3l1HMmVO8U_JdTvNySth5y9Jm0Xerg==', 'gAAAAABorcJygHU-wDfQZR_h5y6QXFE-VvFgDUKXrMUYxDspXOO438iw6nbmIq_TO5l1h0--8Z25SslMw9UvIajpxQRH1P4pLw==', 'gAAAAABorcRLzUBtAXCXxS-rrBOxVjJMOhHh7VlWuC2i9Mt96PO87T_6WFJv_rwWwEfYa3d4Xg2A4jHEyDtyGt_DDN264XxF5A==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'2RqnBW5KQZ-G-sz4R9_wHw\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-26 13:09:53', 6),
(5, '2025-08-26T14:20:02.816998+00:00', '2025-08-26T14:30:26.542119+00:00', '2025-08-26T15:05:11.993866+00:00', '2025-08-26T15:10:27.327631+00:00', 'Standardized', '1', '1', '1', '0', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'mx', 'B2C', 'gAAAAABorc4EK8CnOlyGzd5KWSk4CeexQmTqLGhvmW_-lqntd4mxCjl5nXgmNNhJNPnhYaT0V0DxPkDcichezWrufHUyHeeJb7fdYKLtKvnKIhf-g3QemNI=', 'gAAAAABorcKSzSwKX2v-b10XmuuuAoY1L8QoiqT0LGBxX5vpVFkvOcMqhK6Pd2KDtjU3IVavongJk07rdhZ5SE-gPn_bf3Kv-dVAKhLoX4_hrYm6GTKYM-c=', 'gAAAAABorcRLLyCXs5glejvYqAZ2bJ5iPG8KjrkODj4PL-MJQLA803FQDzmckWKgg4kuu795LBle8doMWcDIXyC4myXvJp2uu1sPYIhhP6ILurgAIkdjAuM=', 'gAAAAABorc4EwHcF4tjzKeVR7YFQ_ikhLSS8CKyiE4Nj23hclCdg-hWmb1o9xoCXg_9v09RElkC80PEBXD1GdwoTNRbg1NbcXSNgO9ORj-T3t8CtmDkwDvQ=', 'gAAAAABorc4EWPqHQJfQ-oqQOmL_qJq7vhGFaccVsqyWlFL-fv2df-Jdj3-SuUdH7JDAULWKCdYYHcE6pamRzZ1dCL_-ApvyyQ==', 'gAAAAABorcKSABkoLunpsO7nmFXUSI4-v6aZMvwUYYhgwfOiELlbasVV-CgVYhN-QYwFT8Q_y17zRVUK67_A0UIGKnve-Ek9mA==', 'gAAAAABorcRLejG0Qf4IVQNo8tzQwlfSdpsPOtAXI6TXuxhkKel3jnlJ3eNmTA3X6vKGpeFlseDdBWP_m0tgUONrDbDAndcqqQ==', 'gAAAAABorc4ExOpoGmdJ2Kd6vODMHP7__DbCbcP_4DuesxfTFrDErDovHg5qPCrXeAbD45cNulcn_WCJThal8ht68adCtjW-nw==', 'gAAAAABorc4Eg3E7jzSjk3QHJCStl50q8wc-pgyB13iaUJvJPzThTqoUy9PmeyEh6EEr6a-ZCO1ZfAfpLlJUi9mpXjG4rU9eRg==', 'gAAAAABorcKS5Mybp1X_oG1TMOIEs9kAscaANFECBSoZ9CnqzmAUplq4Sl3bDJfXVPGXiDNGETtXYtDn6a703xl3KVjrUuRsJw==', 'gAAAAABorcRL-nHcE1koY-6YB4IA8w9FoaRq4DIBZzOkzWmDLDHKXAqxv4zpfWzphjjGpgHv9W2Gymw2dCrqIjQY4mdpUBsy7A==', 'gAAAAABorc4E0qapJS6zrDQwuE1BmHWRlEDP9VtD4Cfuqs62Cj4O6NchK_WcwJajJO9_FatDIznJ3TuycIOkop5fZvXQBfeXrg==', 'gAAAAABorc4Et3yACtl3u7Kkqh1Su6ES6_D0bM_3up9-Yun1U4FKmz0MNWaW_w_qF0ieDbRK-b_Fw1ftfW3-J8XN8zQv45yb-g==', 'gAAAAABorcKSmGTWg8KQ3nFV4ECSPgDEMwpt_z2y0Et2ns-c_CXHYY4fyOMEXoWxlQJ-z65FYa971MiVYvtX-QFgAdy3zlu7ig==', 'gAAAAABorcRLBWnEnWHnmWVInKUH6bLMSflwlpBO1QH0wFYGEN12BEXV9WQjLiP_Y0WOskqWL05Z07lithibm-t7ApWXWEwEFQ==', 'gAAAAABorc4ESZ1T9fpkGlgGSKkUDS7izTPR_bg3o0v3CbvlvIiGMvNLJby66j6vOf12mhf3cBftXT5v-J9roYaokQgfjiqApA==', 'gAAAAABorc4ERZL9RlroyZKMyUzxTdSweEvFuDq3I3vUyaXL4sYMhpEusD1zES-hbxRhF4vZHUGAjLKWqLYL9DkoVPepRY5CJQ==', 'gAAAAABorcKSAxhBawandT8GbICDjZsgqW8oixSiVZCLDsOubBzEidJRHwES6S9uMhWcq-N8FRZB5RKNwwD3jwEpw1qneIXORA==', 'gAAAAABorcRLLi8eZvDsO16_Mk_m4k0NwR6x9Ie6v0-4Gb8uRWP5cWstXGf-0oJnv-XuvSPAEWih1xpYBXpM3RYLvP1CBKE05Q==', 'gAAAAABorc4EvTCDTjm4UJviIX9eoUhSm77BDbKs4bl5uxX0KhVAbQ8XAT4gelyPkMB8frEiUWQSOKDIs0FXPn-aERyma2FkSw==', 'gAAAAABorc4ECtaSjqVVAPXtMXiUxHFSrcyPOZK96i74b0cgGGbElT2v7Tp4LW_uQCjSWJGFbjBhTPgL7v2OhfPWVocDa2Br_g==', 'gAAAAABorcKSrUnmUlDZXzejyd1xn_jC8pZF7KCCEc-oT4ucBE6UGEslDXSHMhe3SwUO_32LPSSOaX6Yfx8W2EbG4dT5VdMuGw==', 'gAAAAABorcRL6DH-at6PkfrHk-u8ovLuQx5rvlOflTuFQQzGvWSgHGqVY47PTdtERwnHXfFuW1lOhoQ5_owRddDn9kBqHNWtzw==', 'gAAAAABorc4ECxBTX8Zo6TVfMU3R23RBMu0JHbWMESV4shkD9qM6b3PwwKJ1P4A2qmjJTaiDqlZqO3K3AEtEqOi9uXTg_7Qv0Q==', NULL, NULL, NULL, NULL, 'gAAAAABorc4ERVvGasnZ3a8fuRKQat4WLYpwuzD1RVknyjJcfBc3n3Yczn16_rnijTSSvghCBfb_t57Z2Komma7wn9iQKxqiee6yGpoanlRgXC668wr14Dgs21jKSH9Hj_5em2ywx1bel-rwX17yR3oOcVlnARZVI0QRic-EwNQnw_Fs6lpqU7jzPgIbikUkE7Q8wlDXoVvS8jT-vTE1ekChYC8L6Mbczw==', 'gAAAAABorcKSwtPzb9YAldkkL34uMEz7ij9HwUpsWOSa7H0atONgdKQXINwRMT7DBW0jQ_eCzmRh-6emw1FJGeVEry5KgLeg3A==', NULL, 'gAAAAABorc4EXSaL7INprh0LI_VB9aF2t93Yh2WZ9Q3F9rCwWgKxCzqBCkYSuqxX9kcr8lNrbaHxh6oBn9N0KRy4QsJExL5UGK8PSJEZOW5fGFcGGD7EMyTWzgt8GLgosJCNllfsxsFHafjnpJgfN8c3VDmN3ighIFby2uWHrwoCnKcQRXxDlePrDS6E0AI-SIK04-zB6s6PNEmbtjx7oF5R2eRVn_ZkPQ==', 'gAAAAABorc4EyKNYh1cBkxWB7-mDkjrCV8r3fJ-6MfHPq958yTru4kAXBd4ONZ3cNvVCnfOJqsYej0XohufmA_ihyCdul0kZkQ==', 'gAAAAABorcKS91ZoRdJIzSSzdYOGiYVU9YllyoB1aHf0ir-U30I6cZA05DZeuFB8ksHJtNh7cbJT_gAWGD7rDnLJHw1QlLnnOw==', NULL, 'gAAAAABorc4EHp95mT__8zsB80PzEb9oc6Aku8u-tKNsNcmopwY7rd5XcOEVKot2Yb0_Kr03odRZPBhgbBBLutRAI2YSWQhgIw==', 'gAAAAABorc4ES8juQVaMyZO7OMmVaS7zzgd7kRkJiAqxA3K059eV667RsTI-9x8nQCNHF0a7-mMDbIRmBgzZPPEUPcvS6YfU3w==', 'gAAAAABorcKSxnmdKtlDTpaHlIyQIPVaDq-64ENC8ijLuy3ba_YUyulTpFhjE7vt0zBuTbWRBHIkLpemaP9VBAN3j5tynbsQ0Q==', 'gAAAAABorcRL6SCMYXZU2e5ZrancxpUjkOw5uUiPYG-2yuY5hlJkd9hafUforpUmpPRwgugFJgSI-WYUgsjyvrkQ6k6xwNI47g==', 'gAAAAABorc4E7V-LkacOnoUdui41NKsYBk3YGez3WmE_l6uIMiubnKufwjeZfPwOqn5CCgUWF-LtH1pbGojyIk_LFcTSK-RijQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'2RqnBW5KQZ-G-sz4R9_wHw\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-26 13:09:53', 6),
(2, '2025-08-14T12:08:09.623312+00:00', '2025-08-14T13:23:39.411819+00:00', '2025-08-18T07:09:34.934230+00:00', '2025-08-18T13:09:09.373323+00:00', 'Standardized', '1', '1', '1', '', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'it', 'B2C', 'gAAAAABooySY8MgUY3qGci5MoHH1VuHjhv3IQ4mD2dp3yuPGdF9MuOVtiOujq2EBh5hY2fRdXyTh42YFTjBhxe4NyltrlaRMXid1XcgGvmsuEeVJ84Jvy2k=', 'gAAAAABondGp1o4aRbvIHGo0WrK1PiNzcMzX8UnKjHsNJSZwvFZP1V7CtSCKoQQSthbkQiaLbCknL_ZExgcaN84DtCiLbVJjwvlLAaiYiSkfQ5nR4n46qTQ=', 'gAAAAABoneMzbpIfsF9YK0WWQxH0TTnV3OqZwxWW6VFuSsmi0136fPTQ3Q0NRihWxOdrlwNsaosjyVMHBsjl48Zyz4hUzu7nVbRcHqFsF5bjsxajT2burwg=', 'gAAAAABooySYj8yMu3i0VFKo1RAgDrFYmwf7Gaqm2yN63PpM_wpLHMzmpxyMIIltJ4G_IVr4ZpPohjDjmBr51UE4Y6obUn7t-p-oznIec5Hm3glnoRnj1s0=', 'gAAAAABooySYnO7-E8GCUL51gOFHFonHPFuBHVOIwPWJg1FkydAfuQxf_Lv1BCGjZKu63M5VKrNTAUGmjezWBwO9hVoLTJbsBA==', 'gAAAAABondGpDAC1AVovl1r-LpqVM7WPAA8zAx4u4Nhx-nk9Fc9Bsrjd6DxHvUFftbl5Q9xBmptAY1IEWw-9ehujAlnnz4jV7A==', 'gAAAAABoneMznABSuari3o9kP3eyEQyigGKApum06IkWhhq0wThxYXFZWRM-7Ir-PUtEUqnnLavu2qjlk37a5whCmcmnP-mD4Q==', 'gAAAAABooySY8pYvt5ypBC8qfzd54CLbYlmkilA8WV0t15QIZP6y9Sblbde-BXgJYkmfm5xb5XdnLR9L_rjFGR4NPD9_afLRsA==', 'gAAAAABooySYPecyupENGEDhNwRLsCzPAYyNm90iZE4yeBwjrfR7UIfQ5SrSnva9zRlWKV5WMQX_oSR6cB8dsDvz9ZnjDibm8A==', 'gAAAAABondGpOo9VqZHvQSKsL7riLwSvLfC2_rc3L6SQ-bSBMSniM050Es5uZDdaOxY7YmWtZ_1HLcd34xgladr8rIihOWtGTQ==', 'gAAAAABoneMze4jPur9bRFkD3ImfPEgrDhq4A4kXx04PaTuef5FkSKIKb2yIfh1JhIQP8JW_cM7QZbMLiPj-uk1ahKHrnt8xew==', 'gAAAAABooySYvXwysefeK30s-2SMHg4_AwvOrlgF2LiMnfDVz8-VYN1DjnieX6wYBFMwUKuM8zcyln0r_byfZ_LzvwfwQrMDqw==', 'gAAAAABooySYWwY5y71BWLd1LGbpLmK9cgmcvL1Lw-XxjWkHqpOZRsgBzckHmKi3QrGWjTgSm_bGH0gM2cAA0m7wsl0hU_CMCQ==', 'gAAAAABondGpGQMJf76lSy0m833zGmUtG6evWPA38yaduc8y81hNJxrL_Y0Nm-J_EsEtPyCP0WvW1ozmssOdrdBwL7xXw4afHw==', 'gAAAAABoneMzhzgh_g-G4kLDLWfJ1Dj01Cq03G9D4lCKVq2F_TVV8OqfL4r0v0Otkl9czKZtknDAgoNvGes-NZKGejT37J2tOw==', 'gAAAAABooySYgiyX-gi9Q2rz_68jh6KbkUVa5UntIxgIKnHp8QPoezbEESFcF2ABf-c9QzhsbYwheh6XeW1Ul08RS9EEIbaobQ==', 'gAAAAABooySYsq4Hmpih-6iBe2wZ11Kr89cZ48SuPI00FHmW6hrWpz3kt2M8_ovJb-MaK8gVpGswTYQsao5hPIWOQUfOLfuUiw==', 'gAAAAABondGpQqIdgqPx7CyhmRrQko_yKgWHdoRNiYgBbqtteiME6ULY2qpkuz_X3unkdhJ4j2Qo2PCUtss4dkj99DWSahPgGA==', 'gAAAAABoneMzlYldU4NgHMudKLDFGooPU2U_k7-3jAIBt6uPxKLm1qBCV2pSUrU8Lbgny3CWbHhAiaXOHa7cS41Kzh1XWavlqA==', 'gAAAAABooySYuFiTjUjyh1pl9F_dJezlSP2IrqFwtG0aD57oPwx17w0x5DBFyO4oGRaiN6O_PYO1Is8gtZV3Q1Bm6nAHMVcJXA==', 'gAAAAABooySYi768GJnpfPFIWB-ZoSSPWqt6YxNBW9iaNTihWZ0d9tRG0bXc7Dax4kjV3ZiORpWR6z8Fec1PIaBv7gZXAQZfVw==', 'gAAAAABondGp8Iw3qoTHxMpMo14dgDb6crX-_hsTrJPemWIZra5IUfpIjYXrPYTFvjA2s3Tf1c06f861H_Z49zU7D0MJZq7mDA==', 'gAAAAABoneMz2BwaGSsUsEAGQVLmH-idJWxcFjFjLZW7RCU_zx1Q5ck5cqD7xfgfSumHLf2Lc5BI13Mmtykgu2SU7ONsFMLqFA==', 'gAAAAABooySYCzz5E-GxjfWQjGyCt7pv9tGjKavzIAvqElRabBvZ5cgOSsvIHkfy6WYpNG_HTzNllhBrI4IjU913pC5fTwNzRQ==', 'gAAAAABooySY7GzJQF_rwplKmLScwnKfYiEnbECAymSndL9nt8MBsepqJKCJ02eHGJYnniwByqCOdoM6Et3MBbUry72Jn_8i29vmpgZJzRPga0GEB4LudKA=', 'gAAAAABondGpRdffTUgSUM2gllpn4yS_GVlqvfDfINUfAqo076awobUGn8zfUX-Yv56N7MUUGZm_gsKGLDnAIZS5m07JeLA3hWKRyAhCKlPBwTTjA4j2LJk=', 'gAAAAABoneMz4u3lAWaZs6OACckf6_gLWWbA9cRapaR9KVP6pgbfqlf2mBJkTM0vKt2hL15R84KucmE65OEr6DygI_hGi78UmpU6SqzDss38vj4Avywf0eI=', 'gAAAAABooySYlC5X5O2MrFHlt7Iqxxt2zd55XgGUo6GuHMynFGioE9ESzN-jIKXOXwjYywFhAViI5F3p14f6HKQsnSHO9dTbDarNlHSXZOL25mUqBYsDqio=', 'gAAAAABooySYHYS5XyHITxh4X6XcS16ODIwAMTt3bxMOsYXkE9tWZx9RTfF2q1FqpUbRvaJthRniS0PEx7qfB2Ol05FuCBPWtQ==', 'gAAAAABondGpyP-Zf6ypWhq0Hw1jXofeVzGbKnf2sZEmiP0S22bSdbgR3lJAShWJylC7sgZo7Qu9qNv4BOF2kpQue7Z8sNm3sg==', 'gAAAAABoneMz_SoyI258zKsVu0GwK65WPKJfCwjMKIEh4o0bkb_roHwlPqcWlX2I_SSBUP6U24h7PuWiu3Ygcx_G4V4UXS6iGQ==', 'gAAAAABooySYtTOrw_2Q63o_zvEk_1hnboi_Z-VpyT0ciZu2fSDxnJhmSfvcdFA6JGBjYBxlFyLjxuWs0FUJvRVcsz7fBCNHOQ==', 'gAAAAABooySYl1vfCnoYkXVIVkqyh7TyRLr2qCeocOa6beZlRO4VCjeqvqgboGjGXvaB1OBejeJMmhDTrgKewD_IwQijMLobaQ==', 'gAAAAABondGpO_-KacLg900Pn6I5Xf-eE4LHTlqH-6rFIm355QE6yS32Ah7f2-9kqrKJ6cnsFHM03KvkX8P34b4Am02Bixhltw==', 'gAAAAABoneMzn6n9MsXhVOd9tpvE8-QvUm-XSAY7UmlT25nG017RRYoApMzqIsnoom5BCSWPVi5XzWmseox1ptTA8SOkNcpC_g==', 'gAAAAABooySYCeonXxHTB3tSVO8LKX59zjpF4JnsKahJzyRfbh-dI-ylISKgAuDH18nH0jRhnDR1AAJsa_8qzRFxbuy8G_k0MA==', 'gAAAAABooySYiCd47DcPyXWiHTQJDkRo5UFjDbkJLj3lLdZUt8hiYWm_rcZe4Vt-mNdUCxpkNIOkYkKIS27benPy23vxKLB10g==', 'gAAAAABondGpw4MGM76DIUUbOT13PVRMxUBCCwXeeRzn1rmrHlfZZEo2JdPoZD5-RcqFdRL_Twvt9J1wgeiMzppRMUcPVcQgQg==', 'gAAAAABoneMzKBnDCyAkGx68XyPpQmh5IXvKDcM3-Ksp2cB8pEkgsJaTOxiNXr-06YiqCy1KnqntkbuM8THBxKBVJNfZwkpiiw==', 'gAAAAABooySYXDulEuO5W_0o_APMUx-cqGaAfcTpnPk5gMeGqa_aBaQhz8K2ZGeNvbPNk_v7M9m8GaQGkImaDU9UtFVsgihigA==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', NULL, NULL, 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'kooVxUMzRUqLp0QGqYwDAQ\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-12 09:29:11', 6),
(3, '2025-08-26T14:13:08.926052+00:00', '2025-08-26T14:29:47.656523+00:00', '2025-08-26T14:57:27.272110+00:00', '2025-08-26T15:10:27.204186+00:00', 'Standardized', '1', '1', '1', '', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'it', 'B2C', 'gAAAAABorc4EEkhWV09DSEPOJ3Ob7DnKH8_xFlz73399BXEY8O5q_j8xG01EVM0KuHH6rKX9U6GFO4H_eg9hjlTLpFV2UxXUN7fPrAm8Q4Iq95US3ouQvvE=', 'gAAAAABorcD0ckyE5CCjSIIYl1sZh9bNLZfjVK9lixP2SOOw6-fHkyfTm58wsHW86b-Olrq5BYDXN2k-H4SAeJ5AOOa1HEdHkcIVwJfWVg899rD-zIG39o0=', 'gAAAAABorcRLdygoArygD8FE41Ch7QDTkcskosDCm_pZrk0qD5e0RslDNIkWYy-Whzd2NUmXlw0INaKFqzC8bJnzr5RQq58KuDdTMJuXRq_K2zUGXijpi-M=', 'gAAAAABorc4Er_cypR2cMmLFGcTFcY3n3VU2TRHpC0a2XjrvXMfmLRrjUo7949Rg27X6OWqmqHYrlRPGj8q9sgm8hjzgO3YZJpQIByqK0OM5Q-acZBArhxc=', 'gAAAAABorc4EHy6OnYzurQak27iLhyUwQKrp8RgX_1BH-oMz740ruyaPLE5hY28eeLI33KOhy4AiTqjtrnYmenOP4X-O3H6xGg==', 'gAAAAABorcD0wzWX4kHx7Hshrlj5xd4Vg-I6ugUl_4ouAh3MXeXPgMhqtfmX28DNVqxJOfe_gHIN3EY1pAIHwbxF44rsEwVeUg==', 'gAAAAABorcRLCIEwUH3OjI7Q3AW4HBDhAvrky92t3BdoJwfD4kJWpgEkLuvIxvmaoFZRMWXYjWzah4DpgsRDClsZ1NETLW9YIA==', 'gAAAAABorc4EL-dNQgE2PmMJX4skQOSy5jBl1-wu3UeZUrhcjNblw9cGv-w5UgUpGUWCN7BAV-N2llsnj5EudyHVurxEhM0Qtw==', 'gAAAAABorc4EeavukRzlYC0tlzkscly3PFTd_Km40Kv5KMv0sk1RB_HlNLTHpXzsthj-jSON7hExtI3g2Njt9xncJDMd_Bj7qA==', 'gAAAAABorcD0K48rkLPwz0Je-YPJuIS7AbHjwh1cn1-hU25UAX1-o-knpd2ziBUrwxiCpsOyI2eBDOU4brp9JhScM5JMdHHQCw==', 'gAAAAABorcRLkTnb5cWzl9Ha75HqUmPQNtsfF7lEnQBuUdRg1fYAqt0Zwqhe04g13JidjTpxGB-vmu4RaT2DysMMfUkQjCR67Q==', 'gAAAAABorc4EBt-jj6_XDP8ACZG3GgeHCkyb_iohUQnUMpAZnRLtPBdWRZihINsr5CXXCsq3gryOHWTIRe6-mhDI7y5GMSw5cA==', 'gAAAAABorc4EL1iDhI2muIjYp8qjckqrbybtAr4iDUJ0RX3pS4GtDHwext0HLARaxSfGcpn2UNU36uuPr7s8_63hylsXs1rrsQ==', 'gAAAAABorcD0bzMnpoHIBknFJ8kB_XhJstuJPtW_UkluuzP1zhRbSiZqXncB5WUzL-aJImgozMrdTLPGQTH9Wy7NvzI1A9573A==', 'gAAAAABorcRLiZUp7uTBr14Dfwi0cu4bf0SRl0aplK8hy1EA7myMEtyTJaDFqREpuuxT_2duIjzdMyOXVVXOhrBKEYQj9txUCw==', 'gAAAAABorc4E8qZ6QZNOmlI2x1X2CaYYpkanXejeIFPfk9gwilp3uaSK5ag6HQN0vfwKoa-kvtuVCYE7S9jG38WRK7-Ar4MCFQ==', 'gAAAAABorc4EEFgfaxH31_pYbxpk5Otdk1riiM9B8AfZQ8K1BKFSnDp_m3k-pSwCQASzhvgkTZIeLo5bCJ5KbCtxplzJyhMwlQ==', 'gAAAAABorcD0F-WMMAIxCPGusAMphKBJxxb7vHFE3i8yshFRcuCD6zcOUuD0B_kST-QJwHatVuImapCHD3JXSOCJroNB2j7_aA==', 'gAAAAABorcRL5CX5BJ8hT3uhn9jpCnzGSSJ65Y5TeZZ62leA_Kltgyd5EPM303f-MVwqiBJgliEatsHadnFeCppCOAyJ1__yig==', 'gAAAAABorc4EQpjECbWJnSQKE3iK7Lnxm0TYZob4sHTebw4upv26-l99P1iYq6MsbkwaowgsTCSFfT3DWcpUU_rlmMwOGNFPtw==', 'gAAAAABorc4EzfLrRJNDOtpeBIW5cNu2QDAx75Jicw4cLXf4-6FEIlRT9hTkeB7jBHpntYG3N0gQK3IOLQV2NQRTH2rakPOVbQ==', 'gAAAAABorcD0Q2lnukkl6L2AdNIlmBSDxCtRzMVEPLlbVsEDGtC7hXmmE_iZy-9zrznShLTcHOKOzY1coyI36LXoKrAA1dyp5w==', 'gAAAAABorcRLuOFWJ5pInO1p-1Qjjx1ZghD44BDyJrK8j34hKF_swEEZuQF4njepIiHiLhACHgSSKxic-eTMV8LNfk5QRfEEPQ==', 'gAAAAABorc4E8zPxbeHO3dzXU9smEjnK01xMS47aqIHJKihydvtmQkN68bVe8Huq1zMQG9fMw0gO0cu7ryxavzrjj3owtRNkyw==', 'gAAAAABorc4Efy5UUNelzlB8OzFjppl1Hs4n9yTsahFpKFoBgQTB70GShEqgcif1PXySEwpQ-KWmPg7zwCJkPOHahFJ-Lfql4g==', 'gAAAAABorcD0kCIuHF-vccuDw4cCodu9Bxz4WrxZH55MjDjCb6gIZfQmAhiBhXBZgJG2Vz8lJOkofr4acAWXjvSgIx7RVtvn3g==', 'gAAAAABorcRLox-MYcngCCwKctNStkG60wapGhfNdP1eo7fyMdgjqf0B0sQ_6hdqbs2L79flwpeY6GXNdyAM-2PJebSWKf9rbA==', 'gAAAAABorc4Emufngq9vWaH3YZj3MRAvDMEFyBvUun97ENnV0fdHZvBZ0KLB_SmGLNfePaak-WZPuB9Ir4gafEcrsiOaeRLngg==', 'gAAAAABorc4EJcNi4ZiZvyXYx3TngnNkTHqnXrmfrzHAFFv6XbSqi0nyB9ObNy74i-gQ7eq_x1zdg6v2jgw-r-Ioo17JVaJ1mQ==', 'gAAAAABorcD0nnYaIboELuThDNft-ocFBf5mS-AHzmAcyRNAyPutIsj7fwKYjDkRDtz_Qfqd_FL9JFM_6lH6jafjqzJarFVf1g==', 'gAAAAABorcRL52cd45cvpBB7DrQQTNWkro2KjD9-RA_V_9KgqT7Uba4InoK-qAE5EX4iQIRWip2FVoViDGzOdGJMdy7IRwbwVg==', 'gAAAAABorc4ErnL-kWZUkX6GT44vo4L_gdi7Cb72tLOM8bF6apVVtlaa0URYz_w6hBq_uc7fXUa9uLztDKlYZX9oDYk2v0XsOA==', 'gAAAAABorc4E2swf25Z_yz8Leeu2d66DrvNFMXM2Ooj3mjJ6yZB9e92WWpX90XTbfNaAXSoMnc39f3qSpC5Y_Xxbe4YwSp5L1w==', 'gAAAAABorcD0Oq9ei7v8qL_e4hy4BBW7l9_rTDIm6wDDmz4_1rKAjYCExEPaOO3Ut3oe2Bh-zqK1Ho1zb_zYG1gkQOjeVt4Ubg==', 'gAAAAABorcRLtQSOsM-2KrgMY12FzxSeYefcL-HvEti63YhJfyH12ZY9iaBsa-MXyZiFNAwWTTebPlvrVUGnyr05n-P5xEd8PQ==', 'gAAAAABorc4EZJrIIHK11bD8ynQMQPy7J7gqt6SeUcPjGQZJRvm7Wx6Rz54Z_pTwxEzoCpXwuXHEeH_LHGIg0Q00b0z_NZ9OaQ==', 'gAAAAABorc4Eya_S0JYqvCnGwqaF8IYRBdK32oAVgEf6KNU7jDYokm5pjKYvnAr-wM0hAkmfxpyEXwhlS_D1KgeT5-wusbN1kQ==', 'gAAAAABorcD0kKWMYdZO2EXxlrv0v1p6pJjuAtxVjyDLrzxas6ljAE-CliV-LTXlcnOFAyzpH4Iw-cPLZRo7wK8h-QEoSkCfmw==', 'gAAAAABorcRLkaoN_bUex5UI1VOPUR7ddLF0_-2LHwSYXEAz9NTzzy_TtrTZCz5JhaMwFYAjcdEVouv2PXfYz8UhUzvtQaq4ZQ==', 'gAAAAABorc4E1OeisCPcW2opjWKc0SJ8Gyhec6IZx47D-c3HdxzoASBw4pj-4rGzCEF2j5Iurc87JV1DMuk-uUGddibfmwW9QQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', NULL, NULL, 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'XruZFpWKQ12K-y0-ntlFUg\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-12 09:29:11', 6),
(4, '2025-08-26T14:19:30.416826+00:00', '2025-08-26T14:29:59.317197+00:00', NULL, NULL, 'Cleaned', '1', '1', '1', '', 'False', NULL, NULL, NULL, NULL, NULL, NULL, 'Generic', 'Syntra', 'mx', 'B2C', 'gAAAAABorcRLNkBae5ApjBiTu5zoPo7yaRkPHpMjXG2S9RM4alZHAlu5Ky235Z1QS5LAYPtqIsA2bsNGKVFSUiQc6EUrfpqkUGwY50d9rh26s1igG5gGx9E=', 'gAAAAABorcJyfm4EO4wtP4RHs8OqkCiv1SKpSNuiqrn1o1KS0ee9_mmuEr_Z_0Ido0kvwinzD8-xuHB9RFGGfSafDVmgmSC7EOJ2YxcsGbf0hDkMvMCznnE=', 'gAAAAABorcRLigF511QR9Dc0FArHyeZvyzOaM4waBml1Cs7phmXVL1dyw3m-_ERoit4XefZtOcGMr_Xq4A-1BNo4fCyQH4kWANR5iB1U4M9FyUHiaNX35xY=', NULL, 'gAAAAABorcRLoP3yGIy3tG_NuQ1JAlh7KNVqpCL0bC9ktqfpsp1N-BUP5zey2_tUGUB6bX85Zc1Ydyka4u5Pi-0Nm2Bnf3_odg==', 'gAAAAABorcJyxxJjnCxh9qUuy3_waKZLd2DC6agFuN9Bnsb8veWZJ4Y3-py-Sao740aPBJOiRMozd41ahYpFKGj8IeaEfdLJsQ==', 'gAAAAABorcRLhnWIwKb1Qer0DWAJhZVyEenJ1nYZyrtd6i2Pogzhc_Yy5dyrMvnA2NY0uiDt4_gLbNnaV5nKNBijML_Qqo596w==', NULL, 'gAAAAABorcRLMJufb11OrF7Goliy-gFEtUqk3_LZNz0GWv66BDFvhlKxijWpVE1eoBfOIdnkerunmy5ImtKtK-IWhNBwjgbQkg==', 'gAAAAABorcJyAk4vNuSpNO7RAJJRxAv8gc4LhWmX3yLdyfK-x8uB5gp0hIt5T0vs5DeDw3EoXZTyQMVPv4fA4-2UM8aGj2uRuA==', 'gAAAAABorcRLNlFKhEudFylsJnGtw7XHCcEawyWwbst7EPTtMosps3mPjzIkR18ABK9RRcfZmpRPXGEdofA5spAsDoFDYpm1Tg==', NULL, 'gAAAAABorcRLXKUIp5jz0VZEf8vlLyej0nvVAHzNkSs8XOqlq0rFiS7G-yODOu1xC3wqtZlCPu5Bwy8XnD-dzMVNAYHqPBtyow==', 'gAAAAABorcJyTRFdhz-joeZccVoEjDf7VcU6mNvvjCdZuDSYN3UD_1aYs2-GBUCanpIrQbOFoig3XlNqvy0lHeteckFRN13dKQ==', 'gAAAAABorcRLpM5qIXbxtS3Si5qpVb8lUxBf9aXPGlSLCJPPYtC1Y5usqSyBIZP_VOJ5GqUI5sdApXtNj9hxBOCt1YreGRnBYA==', NULL, 'gAAAAABorcRLApYElWJLR3jSHjv_4SM4sWHw-S925xZi472xx4B6A_Bek926LKpoeKG07WwBzGhFv5560sOxon4ypLXplR445A==', 'gAAAAABorcJyLqtShe5XMWeFN36VIJYY4AUdsVXXWYrb0mJNEQiy-n5iIQ9OQdV6U8Xx6lVhtSjbYhH3iwSP_QRcd2tPBp2CcA==', 'gAAAAABorcRLHKqxX12eIkqOT4zx59S6R5RgnK5JbAAd2UUWFmJxh_FXYficnXo6IA1Hzm4Ohg2KOMlii763PYG8sddCaxwMvg==', NULL, 'gAAAAABorcRL1S8GvoJqdBFLX9JyWSp0aUNh_xPfpPXzFSmdzTitWv1-E4efcBw1w2eVhT1Rw9rB9dFZa3eA8VduzYMfOFwbjg==', 'gAAAAABorcJyiBAT7XwN3v7NOa9mx4p5xRcQ6Dt0l13ma6Ed_mT74pgT_Nzirs-qf1ZJpvL3y8cEqrrlkOhcJ6VBO3mWgzZMZQ==', 'gAAAAABorcRLlse5Ed1Hd9KvEKOUFwUuR0WAzZzvhQrnGl8ACvC32aI-9_1l10EsvarDkDjNR579YxTXRXAB-Yj_M29T-hmgXg==', NULL, NULL, NULL, NULL, NULL, 'gAAAAABorcRLsoe3dii_Mk2KrdIpps7ZEL6dFcf0fmXhFnUZR79CB-YuREzCPSKupQFow5r1sPbQJH0Ru2hrqhMsyqzHSzMrBQ==', 'gAAAAABorcJymp2DLvxDKdTDL0rh_3TyJxQMJKPVYmViBKbVXrVz1qO2wPb1FtnwafTmOcFV5vhuYlA7uNkIg2CHYDjLybQbiw==', 'gAAAAABorcRLRgmP72XzmsS1s9VWOJi66FgOe1VGfvxTR3WyTuVBYCVub_FcNh9LalKHCZXAbn3s70Y3WCfHVCbHhJamWNBpYg==', NULL, 'gAAAAABorcRLmFj5VxR5nmhup_57fO7bw4Nux7dg3PPgt4m-zSgOVNSg7o8xMZSzn_EiKUx5iIwik11M4ElXna738kTIGt61jw==', 'gAAAAABorcJy7prF-oUf078pDgvt0FCmlqoGhzQ8KoEsmxRGLc11wZm4YYBjiFZD4hKV41K2Fwix2OtPgZeQ_omMBSVhF2yXHg==', 'gAAAAABorcRLmeTmMqnVQ58CsOK1zCLAPXXa7xW73stHJtd0RGAoSqy7BHr8SqYDVMyJV_O1ncADhBxHWawa0i5Qo0o9wSf_VQ==', NULL, 'gAAAAABorcRLFmVrtXsdmAdEPi0zaZLHTpfZABBKcrMyGsQbeRrZRBSuXFWoEznidGpo3l1HMmVO8U_JdTvNySth5y9Jm0Xerg==', 'gAAAAABorcJygHU-wDfQZR_h5y6QXFE-VvFgDUKXrMUYxDspXOO438iw6nbmIq_TO5l1h0--8Z25SslMw9UvIajpxQRH1P4pLw==', 'gAAAAABorcRLzUBtAXCXxS-rrBOxVjJMOhHh7VlWuC2i9Mt96PO87T_6WFJv_rwWwEfYa3d4Xg2A4jHEyDtyGt_DDN264XxF5A==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'2RqnBW5KQZ-G-sz4R9_wHw\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-26 13:09:53', 6),
(5, '2025-08-26T14:20:02.816998+00:00', '2025-08-26T14:30:26.542119+00:00', '2025-08-26T15:05:11.993866+00:00', '2025-08-26T15:10:27.327631+00:00', 'Standardized', '1', '1', '1', '', 'False', 'False', 'False', 'False', 'False', 'False', 'False', 'Generic', 'Syntra', 'mx', 'B2C', 'gAAAAABorc4EK8CnOlyGzd5KWSk4CeexQmTqLGhvmW_-lqntd4mxCjl5nXgmNNhJNPnhYaT0V0DxPkDcichezWrufHUyHeeJb7fdYKLtKvnKIhf-g3QemNI=', 'gAAAAABorcKSzSwKX2v-b10XmuuuAoY1L8QoiqT0LGBxX5vpVFkvOcMqhK6Pd2KDtjU3IVavongJk07rdhZ5SE-gPn_bf3Kv-dVAKhLoX4_hrYm6GTKYM-c=', 'gAAAAABorcRLLyCXs5glejvYqAZ2bJ5iPG8KjrkODj4PL-MJQLA803FQDzmckWKgg4kuu795LBle8doMWcDIXyC4myXvJp2uu1sPYIhhP6ILurgAIkdjAuM=', 'gAAAAABorc4EwHcF4tjzKeVR7YFQ_ikhLSS8CKyiE4Nj23hclCdg-hWmb1o9xoCXg_9v09RElkC80PEBXD1GdwoTNRbg1NbcXSNgO9ORj-T3t8CtmDkwDvQ=', 'gAAAAABorc4EWPqHQJfQ-oqQOmL_qJq7vhGFaccVsqyWlFL-fv2df-Jdj3-SuUdH7JDAULWKCdYYHcE6pamRzZ1dCL_-ApvyyQ==', 'gAAAAABorcKSABkoLunpsO7nmFXUSI4-v6aZMvwUYYhgwfOiELlbasVV-CgVYhN-QYwFT8Q_y17zRVUK67_A0UIGKnve-Ek9mA==', 'gAAAAABorcRLejG0Qf4IVQNo8tzQwlfSdpsPOtAXI6TXuxhkKel3jnlJ3eNmTA3X6vKGpeFlseDdBWP_m0tgUONrDbDAndcqqQ==', 'gAAAAABorc4ExOpoGmdJ2Kd6vODMHP7__DbCbcP_4DuesxfTFrDErDovHg5qPCrXeAbD45cNulcn_WCJThal8ht68adCtjW-nw==', 'gAAAAABorc4Eg3E7jzSjk3QHJCStl50q8wc-pgyB13iaUJvJPzThTqoUy9PmeyEh6EEr6a-ZCO1ZfAfpLlJUi9mpXjG4rU9eRg==', 'gAAAAABorcKS5Mybp1X_oG1TMOIEs9kAscaANFECBSoZ9CnqzmAUplq4Sl3bDJfXVPGXiDNGETtXYtDn6a703xl3KVjrUuRsJw==', 'gAAAAABorcRL-nHcE1koY-6YB4IA8w9FoaRq4DIBZzOkzWmDLDHKXAqxv4zpfWzphjjGpgHv9W2Gymw2dCrqIjQY4mdpUBsy7A==', 'gAAAAABorc4E0qapJS6zrDQwuE1BmHWRlEDP9VtD4Cfuqs62Cj4O6NchK_WcwJajJO9_FatDIznJ3TuycIOkop5fZvXQBfeXrg==', 'gAAAAABorc4Et3yACtl3u7Kkqh1Su6ES6_D0bM_3up9-Yun1U4FKmz0MNWaW_w_qF0ieDbRK-b_Fw1ftfW3-J8XN8zQv45yb-g==', 'gAAAAABorcKSmGTWg8KQ3nFV4ECSPgDEMwpt_z2y0Et2ns-c_CXHYY4fyOMEXoWxlQJ-z65FYa971MiVYvtX-QFgAdy3zlu7ig==', 'gAAAAABorcRLBWnEnWHnmWVInKUH6bLMSflwlpBO1QH0wFYGEN12BEXV9WQjLiP_Y0WOskqWL05Z07lithibm-t7ApWXWEwEFQ==', 'gAAAAABorc4ESZ1T9fpkGlgGSKkUDS7izTPR_bg3o0v3CbvlvIiGMvNLJby66j6vOf12mhf3cBftXT5v-J9roYaokQgfjiqApA==', 'gAAAAABorc4ERZL9RlroyZKMyUzxTdSweEvFuDq3I3vUyaXL4sYMhpEusD1zES-hbxRhF4vZHUGAjLKWqLYL9DkoVPepRY5CJQ==', 'gAAAAABorcKSAxhBawandT8GbICDjZsgqW8oixSiVZCLDsOubBzEidJRHwES6S9uMhWcq-N8FRZB5RKNwwD3jwEpw1qneIXORA==', 'gAAAAABorcRLLi8eZvDsO16_Mk_m4k0NwR6x9Ie6v0-4Gb8uRWP5cWstXGf-0oJnv-XuvSPAEWih1xpYBXpM3RYLvP1CBKE05Q==', 'gAAAAABorc4EvTCDTjm4UJviIX9eoUhSm77BDbKs4bl5uxX0KhVAbQ8XAT4gelyPkMB8frEiUWQSOKDIs0FXPn-aERyma2FkSw==', 'gAAAAABorc4ECtaSjqVVAPXtMXiUxHFSrcyPOZK96i74b0cgGGbElT2v7Tp4LW_uQCjSWJGFbjBhTPgL7v2OhfPWVocDa2Br_g==', 'gAAAAABorcKSrUnmUlDZXzejyd1xn_jC8pZF7KCCEc-oT4ucBE6UGEslDXSHMhe3SwUO_32LPSSOaX6Yfx8W2EbG4dT5VdMuGw==', 'gAAAAABorcRL6DH-at6PkfrHk-u8ovLuQx5rvlOflTuFQQzGvWSgHGqVY47PTdtERwnHXfFuW1lOhoQ5_owRddDn9kBqHNWtzw==', 'gAAAAABorc4ECxBTX8Zo6TVfMU3R23RBMu0JHbWMESV4shkD9qM6b3PwwKJ1P4A2qmjJTaiDqlZqO3K3AEtEqOi9uXTg_7Qv0Q==', NULL, NULL, NULL, NULL, 'gAAAAABorc4ERVvGasnZ3a8fuRKQat4WLYpwuzD1RVknyjJcfBc3n3Yczn16_rnijTSSvghCBfb_t57Z2Komma7wn9iQKxqiee6yGpoanlRgXC668wr14Dgs21jKSH9Hj_5em2ywx1bel-rwX17yR3oOcVlnARZVI0QRic-EwNQnw_Fs6lpqU7jzPgIbikUkE7Q8wlDXoVvS8jT-vTE1ekChYC8L6Mbczw==', 'gAAAAABorcKSwtPzb9YAldkkL34uMEz7ij9HwUpsWOSa7H0atONgdKQXINwRMT7DBW0jQ_eCzmRh-6emw1FJGeVEry5KgLeg3A==', NULL, 'gAAAAABorc4EXSaL7INprh0LI_VB9aF2t93Yh2WZ9Q3F9rCwWgKxCzqBCkYSuqxX9kcr8lNrbaHxh6oBn9N0KRy4QsJExL5UGK8PSJEZOW5fGFcGGD7EMyTWzgt8GLgosJCNllfsxsFHafjnpJgfN8c3VDmN3ighIFby2uWHrwoCnKcQRXxDlePrDS6E0AI-SIK04-zB6s6PNEmbtjx7oF5R2eRVn_ZkPQ==', 'gAAAAABorc4EyKNYh1cBkxWB7-mDkjrCV8r3fJ-6MfHPq958yTru4kAXBd4ONZ3cNvVCnfOJqsYej0XohufmA_ihyCdul0kZkQ==', 'gAAAAABorcKS91ZoRdJIzSSzdYOGiYVU9YllyoB1aHf0ir-U30I6cZA05DZeuFB8ksHJtNh7cbJT_gAWGD7rDnLJHw1QlLnnOw==', NULL, 'gAAAAABorc4EHp95mT__8zsB80PzEb9oc6Aku8u-tKNsNcmopwY7rd5XcOEVKot2Yb0_Kr03odRZPBhgbBBLutRAI2YSWQhgIw==', 'gAAAAABorc4ES8juQVaMyZO7OMmVaS7zzgd7kRkJiAqxA3K059eV667RsTI-9x8nQCNHF0a7-mMDbIRmBgzZPPEUPcvS6YfU3w==', 'gAAAAABorcKSxnmdKtlDTpaHlIyQIPVaDq-64ENC8ijLuy3ba_YUyulTpFhjE7vt0zBuTbWRBHIkLpemaP9VBAN3j5tynbsQ0Q==', 'gAAAAABorcRL6SCMYXZU2e5ZrancxpUjkOw5uUiPYG-2yuY5hlJkd9hafUforpUmpPRwgugFJgSI-WYUgsjyvrkQ6k6xwNI47g==', 'gAAAAABorc4E7V-LkacOnoUdui41NKsYBk3YGez3WmE_l6uIMiubnKufwjeZfPwOqn5CCgUWF-LtH1pbGojyIk_LFcTSK-RijQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'2RqnBW5KQZ-G-sz4R9_wHw\', \'headers\': {\'Server...}, \'body\': None}', '2025-08-26 13:09:53', 6),
(36, '2025-11-25T22:36:41.264733+00:00', '2025-11-21T13:31:04.859088+00:00', '2025-11-18T06:35:22.100076+00:00', '2025-11-01T19:54:57.910802+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6948fb5ccf8c11f0a1bf06963366f12b6948fb7ecf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6948fba8cf8c11f0a1bf06963366f12b6948fbb6cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6948fbcacf8c11f0a1bf06963366f12b6948fbdbcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6948fbf5cf8c11f0a1bf06963366f12b6948fc02cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6948fc1ccf8c11f0a1bf06963366f12b6948fc29cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6948fc3ecf8c11f0a1bf06963366f12b6948fc4dcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6948fc5fcf8c11f0a1bf06963366f12b6948fc6ccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6948fc7fcf8c11f0a1bf06963366f12b6948fc8ccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'6948fc9dcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-26 01:38:52', 0),
(37, '2025-11-04T20:46:10.303658+00:00', '2025-11-18T00:16:55.265219+00:00', '2025-11-02T10:22:55.019945+00:00', '2025-11-27T07:22:10.970711+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694907a2cf8c11f0a1bf06963366f12b694907b2cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694907c4cf8c11f0a1bf06963366f12b694907cdcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694907d9cf8c11f0a1bf06963366f12b694907e1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694907eecf8c11f0a1bf06963366f12b694907f6cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490805cf8c11f0a1bf06963366f12b6949080dcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490818cf8c11f0a1bf06963366f12b69490820cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949082bcf8c11f0a1bf06963366f12b69490833cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949083ecf8c11f0a1bf06963366f12b69490848cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'69490853cf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-04 21:32:56', 0);
INSERT INTO `Contacts` (`ID_Contact`, `Timestamp_Ingestion`, `Timestamp_Cleaned`, `Timestamp_Quality-Checked`, `Timestamp_Standardized`, `Status_Preparation`, `Privacy_General`, `Privacy_Marketing`, `Privacy_Profiling`, `Privacy_Indirect_Marketing`, `Check_Blanks`, `Check_Negative-Quality`, `Check_Negative-Email`, `Check_Negative-Phone`, `Check_Duplicates-within-List`, `Check_Duplicates-in-System`, `Check_Duplicates-in-Customer-DB`, `Info_Vertical`, `Info_Channel`, `Info_Country`, `Info_B2C-B2B`, `email`, `email_original`, `email_cleaned`, `email_standardized`, `firstname`, `firstname_original`, `firstname_cleaned`, `firstname_standardized`, `lastname`, `lastname_original`, `lastname_cleaned`, `lastname_standardized`, `phone`, `phone_original`, `phone_cleaned`, `phone_standardized`, `city`, `city_original`, `city_cleaned`, `city_standardized`, `address`, `address_original`, `address_cleaned`, `address_standardized`, `date-of-birth`, `date-of-birth_original`, `date-of-birth_cleaned`, `date-of-birth_standardized`, `zip-code`, `zip-code_original`, `zip-code_cleaned`, `zip-code_standardized`, `civic-number`, `civic-number_original`, `civic-number_cleaned`, `civic-number_standardized`, `gender`, `gender_original`, `gender_cleaned`, `gender_standardized`, `job_title`, `job_title_original`, `job_title_cleaned`, `job_title_standardized`, `company_name`, `company_name_original`, `company_name_cleaned`, `company_name_standardized`, `company_vat`, `company_vat_original`, `company_vat_cleaned`, `company_vat_standardized`, `industry`, `industry_original`, `industry_cleaned`, `industry_standardized`, `favorite_color`, `favorite_color_original`, `favorite_color_cleaned`, `favorite_color_standardized`, `lottery_number`, `lottery_number_original`, `lottery_number_cleaned`, `lottery_number_standardized`, `mapping`, `Click_Prefill_Timestamp`, `Check_Blacklist`, `meta_ad_id`, `meta_timestamp`, `meta_campaign_id`, `meta_spent`, `Timestamp_Confluence-Airtable-Check`, `field1`, `field1_original`, `field1_cleaned`, `field1_standardized`, `field2`, `field2_original`, `field2_cleaned`, `field2_standardized`, `field3`, `field3_original`, `field3_cleaned`, `field3_standardized`, `field4`, `field4_original`, `field4_cleaned`, `field4_standardized`, `field5`, `field5_original`, `field5_cleaned`, `field5_standardized`, `field6`, `field6_original`, `field6_cleaned`, `field6_standardized`, `field7`, `field7_original`, `field7_cleaned`, `field7_standardized`, `field8`, `field8_original`, `field8_cleaned`, `field8_standardized`, `field9`, `field9_original`, `field9_cleaned`, `field9_standardized`, `field10`, `field10_original`, `field10_cleaned`, `field10_standardized`, `field11`, `field11_original`, `field11_cleaned`, `field11_standardized`, `field12`, `field12_original`, `field12_cleaned`, `field12_standardized`, `field13`, `field13_original`, `field13_cleaned`, `field13_standardized`, `field14`, `field14_original`, `field14_cleaned`, `field14_standardized`, `field15`, `field15_original`, `field15_cleaned`, `field15_standardized`, `field16`, `field16_original`, `field16_cleaned`, `field16_standardized`, `field17`, `field17_original`, `field17_cleaned`, `field17_standardized`, `field18`, `field18_original`, `field18_cleaned`, `field18_standardized`, `field19`, `field19_original`, `field19_cleaned`, `field19_standardized`, `field20`, `field20_original`, `field20_cleaned`, `field20_standardized`, `Email Response`, `registration_time`, `ID_List`) VALUES
(38, '2025-11-01T07:32:59.865096+00:00', '2025-11-20T14:59:05.677391+00:00', '2025-11-08T05:36:25.025638+00:00', '2025-11-10T13:43:21.528257+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490bbecf8c11f0a1bf06963366f12b69490bcdcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490bd9cf8c11f0a1bf06963366f12b69490be1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490bebcf8c11f0a1bf06963366f12b69490bf3cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490bfecf8c11f0a1bf06963366f12b69490c05cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490c0fcf8c11f0a1bf06963366f12b69490c16cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490c20cf8c11f0a1bf06963366f12b69490c27cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490c31cf8c11f0a1bf06963366f12b69490c39cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490c42cf8c11f0a1bf06963366f12b69490c4acf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'69490c53cf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-05 21:32:08', 0),
(39, '2025-11-30T19:14:47.599866+00:00', '2025-11-01T05:03:58.662889+00:00', '2025-11-20T06:45:27.228880+00:00', '2025-11-05T03:04:01.104225+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490f39cf8c11f0a1bf06963366f12b69490f46cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490f52cf8c11f0a1bf06963366f12b69490f5acf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490f64cf8c11f0a1bf06963366f12b69490f6ccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490f76cf8c11f0a1bf06963366f12b69490f7dcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490f87cf8c11f0a1bf06963366f12b69490f8ecf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69490f98cf8c11f0a1bf06963366f12b69490f9fcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490fa9cf8c11f0a1bf06963366f12b69490fb1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69490fbacf8c11f0a1bf06963366f12b69490fc2cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'69490fcbcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-30 09:32:26', 0),
(40, '2025-11-23T05:06:09.342182+00:00', '2025-11-10T14:44:03.418313+00:00', '2025-11-16T07:28:59.445275+00:00', '2025-11-20T20:52:32.168725+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491651cf8c11f0a1bf06963366f12b69491661cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6949166fcf8c11f0a1bf06963366f12b69491677cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491681cf8c11f0a1bf06963366f12b69491689cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491693cf8c11f0a1bf06963366f12b6949169bcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694916a5cf8c11f0a1bf06963366f12b694916accf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694916b7cf8c11f0a1bf06963366f12b694916bfcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694916cacf8c11f0a1bf06963366f12b694916d2cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694916dbcf8c11f0a1bf06963366f12b694916e3cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'694916edcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-25 20:23:51', 0),
(41, '2025-11-08T16:45:43.700956+00:00', '2025-11-07T01:25:41.888651+00:00', '2025-11-09T16:37:05.962353+00:00', '2025-11-16T17:57:59.237910+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491984cf8c11f0a1bf06963366f12b69491992cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6949199ecf8c11f0a1bf06963366f12b694919a6cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694919b0cf8c11f0a1bf06963366f12b694919b8cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694919c2cf8c11f0a1bf06963366f12b694919cacf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694919d3cf8c11f0a1bf06963366f12b694919dbcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694919e4cf8c11f0a1bf06963366f12b694919eccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694919f5cf8c11f0a1bf06963366f12b694919fccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491a06cf8c11f0a1bf06963366f12b69491a0dcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'69491a17cf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-17 04:03:37', 0),
(42, '2025-11-23T05:22:07.606143+00:00', '2025-11-15T12:45:22.173732+00:00', '2025-11-05T05:26:53.072785+00:00', '2025-11-15T03:53:26.933558+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491c69cf8c11f0a1bf06963366f12b69491c74cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491c80cf8c11f0a1bf06963366f12b69491c87cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491c91cf8c11f0a1bf06963366f12b69491c99cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491ca3cf8c11f0a1bf06963366f12b69491caacf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491cb4cf8c11f0a1bf06963366f12b69491cbbcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491cc4cf8c11f0a1bf06963366f12b69491ccccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491cd5cf8c11f0a1bf06963366f12b69491cddcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491ce6cf8c11f0a1bf06963366f12b69491cedcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'69491cf7cf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-12 04:14:49', 0),
(43, '2025-11-21T15:37:26.272380+00:00', '2025-11-19T07:56:40.431746+00:00', '2025-11-29T12:52:25.647470+00:00', '2025-11-10T16:34:26.956395+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69491fadcf8c11f0a1bf06963366f12b69491fbacf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491fc6cf8c11f0a1bf06963366f12b69491fcdcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491fd8cf8c11f0a1bf06963366f12b69491fdfcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491fe9cf8c11f0a1bf06963366f12b69491ff1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69491ffacf8c11f0a1bf06963366f12b69492002cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA6949200bcf8c11f0a1bf06963366f12b69492012cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949201ccf8c11f0a1bf06963366f12b69492023cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949202ccf8c11f0a1bf06963366f12b69492034cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'6949203dcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-29 21:32:21', 0),
(44, '2025-11-27T00:18:33.132867+00:00', '2025-11-11T10:13:57.090689+00:00', '2025-11-29T13:21:14.583750+00:00', '2025-11-15T15:28:59.580227+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694922a8cf8c11f0a1bf06963366f12b694922b5cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694922c1cf8c11f0a1bf06963366f12b694922c8cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694922d3cf8c11f0a1bf06963366f12b694922dacf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694922e4cf8c11f0a1bf06963366f12b694922eccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694922f5cf8c11f0a1bf06963366f12b694922fccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69492305cf8c11f0a1bf06963366f12b6949233fcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA69492349cf8c11f0a1bf06963366f12b69492351cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949235bcf8c11f0a1bf06963366f12b69492362cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'6949236bcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-14 10:53:13', 0),
(45, '2025-11-01T03:42:45.346790+00:00', '2025-11-14T05:19:49.972119+00:00', '2025-11-23T19:54:25.522097+00:00', '2025-11-24T09:29:45.299788+00:00', NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA6949264acf8c11f0a1bf06963366f12b69492656cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69492662cf8c11f0a1bf06963366f12b6949266acf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69492674cf8c11f0a1bf06963366f12b6949267ccf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69492686cf8c11f0a1bf06963366f12b6949268ecf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA69492698cf8c11f0a1bf06963366f12b6949269fcf8c11f0a1bf06963366f12b', NULL, NULL, NULL, 'gAAAAA694926a9cf8c11f0a1bf06963366f12b694926b1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694926bacf8c11f0a1bf06963366f12b694926c1cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAA694926cacf8c11f0a1bf06963366f12b694926d2cf8c11f0a1bf06963366f12b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\'status_code\': 202, \'x_message_id\': \'694926dbcf8c11f0a1bf06963366f12b\', \'headers\': {\'Server...\'}, \'body\': None}', '2025-11-25 06:47:18', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `Contacts-Meta`
--

CREATE TABLE `Contacts-Meta` (
  `ID` int NOT NULL,
  `form_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ad_id` text,
  `page_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `full_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `firstname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `lastname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `zip-code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `post_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `province` text,
  `job_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `country` text,
  `service` text,
  `model` text,
  `trade_in_model` text,
  `company_name` text,
  `tell_your_case` text,
  `date-of-birth` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` text,
  `vat_number` varchar(25) DEFAULT NULL,
  `document_number` varchar(15) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `missing_fields` text,
  `export_timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Transactions`
--

CREATE TABLE `Transactions` (
  `ID_Offer` int NOT NULL,
  `Coupled-Contacts` json NOT NULL,
  `Recycled-Contacts` json NOT NULL,
  `Timestamp_Coupled` text NOT NULL,
  `landing_pages` json NOT NULL,
  `Business-Driver` text NOT NULL,
  `Channel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Transactions`
--

INSERT INTO `Transactions` (`ID_Offer`, `Coupled-Contacts`, `Recycled-Contacts`, `Timestamp_Coupled`, `landing_pages`, `Business-Driver`, `Channel`) VALUES
(95650, '[{\"email\": \"gAAAAABorc4EEkhWV09DSEPOJ3Ob7DnKH8_xFlz73399BXEY8O5q_j8xG01EVM0KuHH6rKX9U6GFO4H_eg9hjlTLpFV2UxXUN7fPrAm8Q4Iq95US3ouQvvE=\", \"ID_List\": 6, \"ID_Contact\": 3}]', '[]', '2025-08-26T15:31:52.426687+00:00', '[\"https://assicuratiora.it/\"]', 'Lean ADV', 'Syntra');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
