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
-- Database: `dbbvt3npg0g3ey`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Blacklists`
--

CREATE TABLE `Blacklists` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Blacklists`
--

INSERT INTO `Blacklists` (`email`, `phone`, `timestamp`) VALUES
('andrea.rossi@example.com', '393331162233', '2026-01-29 16:14:08'),
('carlo.rossi@example.com', '393331142233', '2026-01-29 16:13:23'),
('francesca.neri@example.com', '393495550001', '2026-01-29 11:09:05'),
('francesco.neri@example.com', '393445550001', '2026-01-29 16:13:24'),
('giulia.bianchi@example.com', '393471234567', '2026-01-29 11:09:04'),
('guido.bianchi@example.com', '393473234567', '2026-01-29 16:13:23'),
('lorenza.verdi@example.com', '393202876543', '2026-01-29 16:13:24'),
('luca.verdi@example.com', '393209876543', '2026-01-29 11:09:04'),
('mario.rossi@example.com', '393331112233', '2026-01-29 11:09:04'),
('test@example.com', '+3900000', '2025-08-14 15:45:56');

-- --------------------------------------------------------

--
-- Struttura della tabella `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Coupling`
--

CREATE TABLE `Coupling` (
  `ID_Coupling` int NOT NULL,
  `ID_Offer` int DEFAULT NULL,
  `ID_Contact_Coupling` int DEFAULT NULL,
  `ID_Contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_List` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Status_Preparation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Timestamp_Ingestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Quality-Checked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Coupled` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Timestamp_Formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Uploading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Upload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp_Failed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Issue_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Issue_Screenshot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Vertical` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_B2C-B2B` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Info_Channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Offer_Landing-Page` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contact_Device` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `firstname_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lastname_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `phone_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date-of-birth_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `zip-code_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `civic-number_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender_original` int NOT NULL,
  `gender_cleaned` int NOT NULL,
  `gender_standardized` int NOT NULL,
  `gender_formatted` int NOT NULL,
  `gender_reviewed` int NOT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_title_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_name_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company_vat_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `luckynumber_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favorite_color_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_cleaned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_standardized` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_formatted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lottery_number_reviewed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field1_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field2_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field3_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field4_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field5_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field6_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field7_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field8_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field9_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field10_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field11_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field12_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field13_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field14_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field15_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field16_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field17_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field18_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field19_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_cleaned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_standardized` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field20_reviewed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `available_fields` json NOT NULL,
  `mapping` json NOT NULL,
  `Check_Blanks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Blacklist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Check_Negative-Quality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-success` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-valid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-disposable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-smtp_score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-overall_score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-first_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-generic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-common` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-dns_valid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-honeypot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-deliverability` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-frequent_complainer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-spam_trap_score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-catch_all` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-timed_out` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-suspect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-recent_abuse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-fraud_score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-suggested_domain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-leaked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-domain_age-human` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-domain_age-timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-domain_age-iso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-first_seen-human` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-first_seen-timestamp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-first_seen-iso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-sanitized_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Email-request_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-success` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-formatted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-local_format` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-fraud_score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-recent_abuse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-VOIP` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-prepaid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-risky` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-active` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-carrier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-line_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-zip_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-region` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-dialing_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-active_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-leaked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-request_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-timezone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-do_not_call` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-sms_domain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-associated_email_addresses-status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-associated_email_addresses-emails` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-user_activity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-mnc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-mcc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Check_Negative-Phone-sms_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Coupling`
--

INSERT INTO `Coupling` (`ID_Coupling`, `ID_Offer`, `ID_Contact_Coupling`, `ID_Contact`, `ID_List`, `Status_Preparation`, `Timestamp_Ingestion`, `Timestamp_Cleaned`, `Timestamp_Quality-Checked`, `Timestamp_Standardized`, `Timestamp_Coupled`, `Timestamp_Formatted`, `Timestamp_Reviewed`, `Timestamp_Uploading`, `Timestamp_Form`, `Timestamp_Upload`, `Timestamp_Failed`, `Issue_Description`, `Issue_Screenshot`, `Info_Vertical`, `Info_Country`, `Info_B2C-B2B`, `Info_Channel`, `Offer_Landing-Page`, `Contact_Device`, `email`, `email_original`, `email_cleaned`, `email_standardized`, `email_formatted`, `email_reviewed`, `firstname`, `firstname_original`, `firstname_cleaned`, `firstname_standardized`, `firstname_formatted`, `firstname_reviewed`, `lastname`, `lastname_original`, `lastname_cleaned`, `lastname_standardized`, `lastname_formatted`, `lastname_reviewed`, `phone`, `phone_original`, `phone_cleaned`, `phone_standardized`, `phone_formatted`, `phone_reviewed`, `city`, `city_original`, `city_cleaned`, `city_standardized`, `city_formatted`, `city_reviewed`, `address`, `address_original`, `address_cleaned`, `address_standardized`, `address_formatted`, `address_reviewed`, `date-of-birth`, `date-of-birth_original`, `date-of-birth_cleaned`, `date-of-birth_standardized`, `date-of-birth_formatted`, `date-of-birth_reviewed`, `zip-code`, `zip-code_original`, `zip-code_cleaned`, `zip-code_standardized`, `zip-code_formatted`, `zip-code_reviewed`, `civic-number`, `civic-number_original`, `civic-number_cleaned`, `civic-number_standardized`, `civic-number_formatted`, `civic-number_reviewed`, `gender`, `gender_original`, `gender_cleaned`, `gender_standardized`, `gender_formatted`, `gender_reviewed`, `job_title`, `job_title_original`, `job_title_cleaned`, `job_title_standardized`, `job_title_formatted`, `job_title_reviewed`, `company_name`, `company_name_original`, `company_name_cleaned`, `company_name_standardized`, `company_name_formatted`, `company_name_reviewed`, `company_vat`, `company_vat_original`, `company_vat_cleaned`, `company_vat_standardized`, `company_vat_formatted`, `company_vat_reviewed`, `industry`, `industry_original`, `industry_cleaned`, `industry_standardized`, `industry_formatted`, `industry_reviewed`, `luckynumber`, `luckynumber_original`, `luckynumber_cleaned`, `luckynumber_standardized`, `luckynumber_formatted`, `luckynumber_reviewed`, `favorite_color`, `favorite_color_original`, `favorite_color_cleaned`, `favorite_color_standardized`, `favorite_color_formatted`, `favorite_color_reviewed`, `lottery_number`, `lottery_number_original`, `lottery_number_cleaned`, `lottery_number_standardized`, `lottery_number_formatted`, `lottery_number_reviewed`, `field1`, `field1_original`, `field1_cleaned`, `field1_standardized`, `field1_formatted`, `field1_reviewed`, `field2`, `field2_original`, `field2_cleaned`, `field2_standardized`, `field2_formatted`, `field2_reviewed`, `field3`, `field3_original`, `field3_cleaned`, `field3_standardized`, `field3_formatted`, `field3_reviewed`, `field4`, `field4_original`, `field4_cleaned`, `field4_standardized`, `field4_formatted`, `field4_reviewed`, `field5`, `field5_original`, `field5_cleaned`, `field5_standardized`, `field5_formatted`, `field5_reviewed`, `field6`, `field6_original`, `field6_cleaned`, `field6_standardized`, `field6_formatted`, `field6_reviewed`, `field7`, `field7_original`, `field7_cleaned`, `field7_standardized`, `field7_formatted`, `field7_reviewed`, `field8`, `field8_original`, `field8_cleaned`, `field8_standardized`, `field8_formatted`, `field8_reviewed`, `field9`, `field9_original`, `field9_cleaned`, `field9_standardized`, `field9_formatted`, `field9_reviewed`, `field10`, `field10_original`, `field10_cleaned`, `field10_standardized`, `field10_formatted`, `field10_reviewed`, `field11`, `field11_original`, `field11_cleaned`, `field11_standardized`, `field11_formatted`, `field11_reviewed`, `field12`, `field12_original`, `field12_cleaned`, `field12_standardized`, `field12_formatted`, `field12_reviewed`, `field13`, `field13_original`, `field13_cleaned`, `field13_standardized`, `field13_formatted`, `field13_reviewed`, `field14`, `field14_original`, `field14_cleaned`, `field14_standardized`, `field14_formatted`, `field14_reviewed`, `field15`, `field15_original`, `field15_cleaned`, `field15_standardized`, `field15_formatted`, `field15_reviewed`, `field16`, `field16_original`, `field16_cleaned`, `field16_standardized`, `field16_formatted`, `field16_reviewed`, `field17`, `field17_original`, `field17_cleaned`, `field17_standardized`, `field17_formatted`, `field17_reviewed`, `field18`, `field18_original`, `field18_cleaned`, `field18_standardized`, `field18_formatted`, `field18_reviewed`, `field19`, `field19_original`, `field19_cleaned`, `field19_standardized`, `field19_formatted`, `field19_reviewed`, `field20`, `field20_original`, `field20_cleaned`, `field20_standardized`, `field20_formatted`, `field20_reviewed`, `available_fields`, `mapping`, `Check_Blanks`, `Check_Blacklist`, `Check_Negative-Quality`, `Check_Negative-Email`, `Check_Negative-Email-message`, `Check_Negative-Email-success`, `Check_Negative-Email-valid`, `Check_Negative-Email-disposable`, `Check_Negative-Email-smtp_score`, `Check_Negative-Email-overall_score`, `Check_Negative-Email-first_name`, `Check_Negative-Email-generic`, `Check_Negative-Email-common`, `Check_Negative-Email-dns_valid`, `Check_Negative-Email-honeypot`, `Check_Negative-Email-deliverability`, `Check_Negative-Email-frequent_complainer`, `Check_Negative-Email-spam_trap_score`, `Check_Negative-Email-catch_all`, `Check_Negative-Email-timed_out`, `Check_Negative-Email-suspect`, `Check_Negative-Email-recent_abuse`, `Check_Negative-Email-fraud_score`, `Check_Negative-Email-suggested_domain`, `Check_Negative-Email-leaked`, `Check_Negative-Email-domain_age-human`, `Check_Negative-Email-domain_age-timestamp`, `Check_Negative-Email-domain_age-iso`, `Check_Negative-Email-first_seen-human`, `Check_Negative-Email-first_seen-timestamp`, `Check_Negative-Email-first_seen-iso`, `Check_Negative-Email-sanitized_email`, `Check_Negative-Email-request_id`, `Check_Negative-Phone-message`, `Check_Negative-Phone-success`, `Check_Negative-Phone-formatted`, `Check_Negative-Phone-local_format`, `Check_Negative-Phone`, `Check_Negative-Phone-fraud_score`, `Check_Negative-Phone-recent_abuse`, `Check_Negative-Phone-VOIP`, `Check_Negative-Phone-prepaid`, `Check_Negative-Phone-risky`, `Check_Negative-Phone-active`, `Check_Negative-Phone-carrier`, `Check_Negative-Phone-line_type`, `Check_Negative-Phone-country`, `Check_Negative-Phone-city`, `Check_Negative-Phone-zip_code`, `Check_Negative-Phone-region`, `Check_Negative-Phone-dialing_code`, `Check_Negative-Phone-active_status`, `Check_Negative-Phone-leaked`, `Check_Negative-Phone-request_id`, `Check_Negative-Phone-name`, `Check_Negative-Phone-timezone`, `Check_Negative-Phone-do_not_call`, `Check_Negative-Phone-sms_domain`, `Check_Negative-Phone-associated_email_addresses-status`, `Check_Negative-Phone-associated_email_addresses-emails`, `Check_Negative-Phone-user_activity`, `Check_Negative-Phone-mnc`, `Check_Negative-Phone-mcc`, `Check_Negative-Phone-sms_email`) VALUES
(2, 95650, 2, '2', '6', 'Formatted', '2025-08-14T12:08:09.623312+00:00', '2025-08-14T13:23:39.411819+00:00', '2025-08-18T07:09:34.934230+00:00', '2025-08-18T13:09:09.373323+00:00', '2025-08-22T09:50:13.220737+00:00', '2025-08-22T09:52:17.818848+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Generic', 'it', 'B2C', 'Syntra', 'https://assicuratiora.it/', NULL, 'gAAAAABooySY8MgUY3qGci5MoHH1VuHjhv3IQ4mD2dp3yuPGdF9MuOVtiOujq2EBh5hY2fRdXyTh42YFTjBhxe4NyltrlaRMXid1XcgGvmsuEeVJ84Jvy2k=', 'gAAAAABondGp1o4aRbvIHGo0WrK1PiNzcMzX8UnKjHsNJSZwvFZP1V7CtSCKoQQSthbkQiaLbCknL_ZExgcaN84DtCiLbVJjwvlLAaiYiSkfQ5nR4n46qTQ=', 'gAAAAABoneMzbpIfsF9YK0WWQxH0TTnV3OqZwxWW6VFuSsmi0136fPTQ3Q0NRihWxOdrlwNsaosjyVMHBsjl48Zyz4hUzu7nVbRcHqFsF5bjsxajT2burwg=', 'gAAAAABooySYj8yMu3i0VFKo1RAgDrFYmwf7Gaqm2yN63PpM_wpLHMzmpxyMIIltJ4G_IVr4ZpPohjDjmBr51UE4Y6obUn7t-p-oznIec5Hm3glnoRnj1s0=', 'gAAAAABooySY8MgUY3qGci5MoHH1VuHjhv3IQ4mD2dp3yuPGdF9MuOVtiOujq2EBh5hY2fRdXyTh42YFTjBhxe4NyltrlaRMXid1XcgGvmsuEeVJ84Jvy2k=', NULL, 'gAAAAABooySYnO7-E8GCUL51gOFHFonHPFuBHVOIwPWJg1FkydAfuQxf_Lv1BCGjZKu63M5VKrNTAUGmjezWBwO9hVoLTJbsBA==', 'gAAAAABondGpDAC1AVovl1r-LpqVM7WPAA8zAx4u4Nhx-nk9Fc9Bsrjd6DxHvUFftbl5Q9xBmptAY1IEWw-9ehujAlnnz4jV7A==', 'gAAAAABoneMznABSuari3o9kP3eyEQyigGKApum06IkWhhq0wThxYXFZWRM-7Ir-PUtEUqnnLavu2qjlk37a5whCmcmnP-mD4Q==', 'gAAAAABooySY8pYvt5ypBC8qfzd54CLbYlmkilA8WV0t15QIZP6y9Sblbde-BXgJYkmfm5xb5XdnLR9L_rjFGR4NPD9_afLRsA==', 'gAAAAABooySYnO7-E8GCUL51gOFHFonHPFuBHVOIwPWJg1FkydAfuQxf_Lv1BCGjZKu63M5VKrNTAUGmjezWBwO9hVoLTJbsBA==', NULL, 'gAAAAABooySYPecyupENGEDhNwRLsCzPAYyNm90iZE4yeBwjrfR7UIfQ5SrSnva9zRlWKV5WMQX_oSR6cB8dsDvz9ZnjDibm8A==', 'gAAAAABondGpOo9VqZHvQSKsL7riLwSvLfC2_rc3L6SQ-bSBMSniM050Es5uZDdaOxY7YmWtZ_1HLcd34xgladr8rIihOWtGTQ==', 'gAAAAABoneMze4jPur9bRFkD3ImfPEgrDhq4A4kXx04PaTuef5FkSKIKb2yIfh1JhIQP8JW_cM7QZbMLiPj-uk1ahKHrnt8xew==', 'gAAAAABooySYvXwysefeK30s-2SMHg4_AwvOrlgF2LiMnfDVz8-VYN1DjnieX6wYBFMwUKuM8zcyln0r_byfZ_LzvwfwQrMDqw==', 'gAAAAABooySYPecyupENGEDhNwRLsCzPAYyNm90iZE4yeBwjrfR7UIfQ5SrSnva9zRlWKV5WMQX_oSR6cB8dsDvz9ZnjDibm8A==', NULL, 'gAAAAABooySYWwY5y71BWLd1LGbpLmK9cgmcvL1Lw-XxjWkHqpOZRsgBzckHmKi3QrGWjTgSm_bGH0gM2cAA0m7wsl0hU_CMCQ==', 'gAAAAABondGpGQMJf76lSy0m833zGmUtG6evWPA38yaduc8y81hNJxrL_Y0Nm-J_EsEtPyCP0WvW1ozmssOdrdBwL7xXw4afHw==', 'gAAAAABoneMzhzgh_g-G4kLDLWfJ1Dj01Cq03G9D4lCKVq2F_TVV8OqfL4r0v0Otkl9czKZtknDAgoNvGes-NZKGejT37J2tOw==', 'gAAAAABooySYgiyX-gi9Q2rz_68jh6KbkUVa5UntIxgIKnHp8QPoezbEESFcF2ABf-c9QzhsbYwheh6XeW1Ul08RS9EEIbaobQ==', 'gAAAAABooySYWwY5y71BWLd1LGbpLmK9cgmcvL1Lw-XxjWkHqpOZRsgBzckHmKi3QrGWjTgSm_bGH0gM2cAA0m7wsl0hU_CMCQ==', NULL, 'gAAAAABooySYsq4Hmpih-6iBe2wZ11Kr89cZ48SuPI00FHmW6hrWpz3kt2M8_ovJb-MaK8gVpGswTYQsao5hPIWOQUfOLfuUiw==', 'gAAAAABondGpQqIdgqPx7CyhmRrQko_yKgWHdoRNiYgBbqtteiME6ULY2qpkuz_X3unkdhJ4j2Qo2PCUtss4dkj99DWSahPgGA==', 'gAAAAABoneMzlYldU4NgHMudKLDFGooPU2U_k7-3jAIBt6uPxKLm1qBCV2pSUrU8Lbgny3CWbHhAiaXOHa7cS41Kzh1XWavlqA==', 'gAAAAABooySYuFiTjUjyh1pl9F_dJezlSP2IrqFwtG0aD57oPwx17w0x5DBFyO4oGRaiN6O_PYO1Is8gtZV3Q1Bm6nAHMVcJXA==', NULL, NULL, 'gAAAAABooySYi768GJnpfPFIWB-ZoSSPWqt6YxNBW9iaNTihWZ0d9tRG0bXc7Dax4kjV3ZiORpWR6z8Fec1PIaBv7gZXAQZfVw==', 'gAAAAABondGp8Iw3qoTHxMpMo14dgDb6crX-_hsTrJPemWIZra5IUfpIjYXrPYTFvjA2s3Tf1c06f861H_Z49zU7D0MJZq7mDA==', 'gAAAAABoneMz2BwaGSsUsEAGQVLmH-idJWxcFjFjLZW7RCU_zx1Q5ck5cqD7xfgfSumHLf2Lc5BI13Mmtykgu2SU7ONsFMLqFA==', 'gAAAAABooySYCzz5E-GxjfWQjGyCt7pv9tGjKavzIAvqElRabBvZ5cgOSsvIHkfy6WYpNG_HTzNllhBrI4IjU913pC5fTwNzRQ==', NULL, NULL, 'gAAAAABooySY7GzJQF_rwplKmLScwnKfYiEnbECAymSndL9nt8MBsepqJKCJ02eHGJYnniwByqCOdoM6Et3MBbUry72Jn_8i29vmpgZJzRPga0GEB4LudKA=', 'gAAAAABondGpRdffTUgSUM2gllpn4yS_GVlqvfDfINUfAqo076awobUGn8zfUX-Yv56N7MUUGZm_gsKGLDnAIZS5m07JeLA3hWKRyAhCKlPBwTTjA4j2LJk=', 'gAAAAABoneMz4u3lAWaZs6OACckf6_gLWWbA9cRapaR9KVP6pgbfqlf2mBJkTM0vKt2hL15R84KucmE65OEr6DygI_hGi78UmpU6SqzDss38vj4Avywf0eI=', 'gAAAAABooySYlC5X5O2MrFHlt7Iqxxt2zd55XgGUo6GuHMynFGioE9ESzN-jIKXOXwjYywFhAViI5F3p14f6HKQsnSHO9dTbDarNlHSXZOL25mUqBYsDqio=', NULL, NULL, 'gAAAAABooySYHYS5XyHITxh4X6XcS16ODIwAMTt3bxMOsYXkE9tWZx9RTfF2q1FqpUbRvaJthRniS0PEx7qfB2Ol05FuCBPWtQ==', 'gAAAAABondGpyP-Zf6ypWhq0Hw1jXofeVzGbKnf2sZEmiP0S22bSdbgR3lJAShWJylC7sgZo7Qu9qNv4BOF2kpQue7Z8sNm3sg==', 'gAAAAABoneMz_SoyI258zKsVu0GwK65WPKJfCwjMKIEh4o0bkb_roHwlPqcWlX2I_SSBUP6U24h7PuWiu3Ygcx_G4V4UXS6iGQ==', 'gAAAAABooySYtTOrw_2Q63o_zvEk_1hnboi_Z-VpyT0ciZu2fSDxnJhmSfvcdFA6JGBjYBxlFyLjxuWs0FUJvRVcsz7fBCNHOQ==', 'gAAAAABooySYHYS5XyHITxh4X6XcS16ODIwAMTt3bxMOsYXkE9tWZx9RTfF2q1FqpUbRvaJthRniS0PEx7qfB2Ol05FuCBPWtQ==', NULL, 'gAAAAABooySYl1vfCnoYkXVIVkqyh7TyRLr2qCeocOa6beZlRO4VCjeqvqgboGjGXvaB1OBejeJMmhDTrgKewD_IwQijMLobaQ==', 'gAAAAABondGpO_-KacLg900Pn6I5Xf-eE4LHTlqH-6rFIm355QE6yS32Ah7f2-9kqrKJ6cnsFHM03KvkX8P34b4Am02Bixhltw==', 'gAAAAABoneMzn6n9MsXhVOd9tpvE8-QvUm-XSAY7UmlT25nG017RRYoApMzqIsnoom5BCSWPVi5XzWmseox1ptTA8SOkNcpC_g==', 'gAAAAABooySYCeonXxHTB3tSVO8LKX59zjpF4JnsKahJzyRfbh-dI-ylISKgAuDH18nH0jRhnDR1AAJsa_8qzRFxbuy8G_k0MA==', NULL, NULL, 'gAAAAABooySYiCd47DcPyXWiHTQJDkRo5UFjDbkJLj3lLdZUt8hiYWm_rcZe4Vt-mNdUCxpkNIOkYkKIS27benPy23vxKLB10g==', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', 'gAAAAABondGpbf5FVFLOlxBUjkxobDkIl-JQQ_62mubNHb2X4PhSdo8knCo9SvCS-dqsxKEosvp66eJUr_JYMOt3d793T-vgxQ==', NULL, NULL, NULL, NULL, 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', 'gAAAAABooywomZdBa3l59S1h6g92_OKevRDsS3siyKgBaqHOPTZ3h9fgMa7y-vKpoX8YgdfQuXOCCfsdPx44g2d-k7OnTxjSOw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', '{}', 'False', 'False', 'False', 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 95650, 3, '3', '6', 'Formatted', '2025-08-26T14:13:08.926052+00:00', '2025-08-26T14:29:47.656523+00:00', '2025-08-26T14:57:27.272110+00:00', '2025-08-26T15:10:27.204186+00:00', '2025-08-26T15:31:43.335227+00:00', '2025-08-26T15:52:34.473331+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Generic', 'it', 'B2C', 'Syntra', 'https://assicuratiora.it/', NULL, 'gAAAAABorc4EEkhWV09DSEPOJ3Ob7DnKH8_xFlz73399BXEY8O5q_j8xG01EVM0KuHH6rKX9U6GFO4H_eg9hjlTLpFV2UxXUN7fPrAm8Q4Iq95US3ouQvvE=', 'gAAAAABorcD0ckyE5CCjSIIYl1sZh9bNLZfjVK9lixP2SOOw6-fHkyfTm58wsHW86b-Olrq5BYDXN2k-H4SAeJ5AOOa1HEdHkcIVwJfWVg899rD-zIG39o0=', 'gAAAAABorcRLdygoArygD8FE41Ch7QDTkcskosDCm_pZrk0qD5e0RslDNIkWYy-Whzd2NUmXlw0INaKFqzC8bJnzr5RQq58KuDdTMJuXRq_K2zUGXijpi-M=', 'gAAAAABorc4Er_cypR2cMmLFGcTFcY3n3VU2TRHpC0a2XjrvXMfmLRrjUo7949Rg27X6OWqmqHYrlRPGj8q9sgm8hjzgO3YZJpQIByqK0OM5Q-acZBArhxc=', 'gAAAAABorc4EEkhWV09DSEPOJ3Ob7DnKH8_xFlz73399BXEY8O5q_j8xG01EVM0KuHH6rKX9U6GFO4H_eg9hjlTLpFV2UxXUN7fPrAm8Q4Iq95US3ouQvvE=', NULL, 'gAAAAABorc4EHy6OnYzurQak27iLhyUwQKrp8RgX_1BH-oMz740ruyaPLE5hY28eeLI33KOhy4AiTqjtrnYmenOP4X-O3H6xGg==', 'gAAAAABorcD0wzWX4kHx7Hshrlj5xd4Vg-I6ugUl_4ouAh3MXeXPgMhqtfmX28DNVqxJOfe_gHIN3EY1pAIHwbxF44rsEwVeUg==', 'gAAAAABorcRLCIEwUH3OjI7Q3AW4HBDhAvrky92t3BdoJwfD4kJWpgEkLuvIxvmaoFZRMWXYjWzah4DpgsRDClsZ1NETLW9YIA==', 'gAAAAABorc4EL-dNQgE2PmMJX4skQOSy5jBl1-wu3UeZUrhcjNblw9cGv-w5UgUpGUWCN7BAV-N2llsnj5EudyHVurxEhM0Qtw==', 'gAAAAABorc4EHy6OnYzurQak27iLhyUwQKrp8RgX_1BH-oMz740ruyaPLE5hY28eeLI33KOhy4AiTqjtrnYmenOP4X-O3H6xGg==', NULL, 'gAAAAABorc4EeavukRzlYC0tlzkscly3PFTd_Km40Kv5KMv0sk1RB_HlNLTHpXzsthj-jSON7hExtI3g2Njt9xncJDMd_Bj7qA==', 'gAAAAABorcD0K48rkLPwz0Je-YPJuIS7AbHjwh1cn1-hU25UAX1-o-knpd2ziBUrwxiCpsOyI2eBDOU4brp9JhScM5JMdHHQCw==', 'gAAAAABorcRLkTnb5cWzl9Ha75HqUmPQNtsfF7lEnQBuUdRg1fYAqt0Zwqhe04g13JidjTpxGB-vmu4RaT2DysMMfUkQjCR67Q==', 'gAAAAABorc4EBt-jj6_XDP8ACZG3GgeHCkyb_iohUQnUMpAZnRLtPBdWRZihINsr5CXXCsq3gryOHWTIRe6-mhDI7y5GMSw5cA==', 'gAAAAABorc4EeavukRzlYC0tlzkscly3PFTd_Km40Kv5KMv0sk1RB_HlNLTHpXzsthj-jSON7hExtI3g2Njt9xncJDMd_Bj7qA==', NULL, 'gAAAAABorc4EL1iDhI2muIjYp8qjckqrbybtAr4iDUJ0RX3pS4GtDHwext0HLARaxSfGcpn2UNU36uuPr7s8_63hylsXs1rrsQ==', 'gAAAAABorcD0bzMnpoHIBknFJ8kB_XhJstuJPtW_UkluuzP1zhRbSiZqXncB5WUzL-aJImgozMrdTLPGQTH9Wy7NvzI1A9573A==', 'gAAAAABorcRLiZUp7uTBr14Dfwi0cu4bf0SRl0aplK8hy1EA7myMEtyTJaDFqREpuuxT_2duIjzdMyOXVVXOhrBKEYQj9txUCw==', 'gAAAAABorc4E8qZ6QZNOmlI2x1X2CaYYpkanXejeIFPfk9gwilp3uaSK5ag6HQN0vfwKoa-kvtuVCYE7S9jG38WRK7-Ar4MCFQ==', 'gAAAAABorc4EL1iDhI2muIjYp8qjckqrbybtAr4iDUJ0RX3pS4GtDHwext0HLARaxSfGcpn2UNU36uuPr7s8_63hylsXs1rrsQ==', NULL, 'gAAAAABorc4EEFgfaxH31_pYbxpk5Otdk1riiM9B8AfZQ8K1BKFSnDp_m3k-pSwCQASzhvgkTZIeLo5bCJ5KbCtxplzJyhMwlQ==', 'gAAAAABorcD0F-WMMAIxCPGusAMphKBJxxb7vHFE3i8yshFRcuCD6zcOUuD0B_kST-QJwHatVuImapCHD3JXSOCJroNB2j7_aA==', 'gAAAAABorcRL5CX5BJ8hT3uhn9jpCnzGSSJ65Y5TeZZ62leA_Kltgyd5EPM303f-MVwqiBJgliEatsHadnFeCppCOAyJ1__yig==', 'gAAAAABorc4EQpjECbWJnSQKE3iK7Lnxm0TYZob4sHTebw4upv26-l99P1iYq6MsbkwaowgsTCSFfT3DWcpUU_rlmMwOGNFPtw==', NULL, NULL, 'gAAAAABorc4EzfLrRJNDOtpeBIW5cNu2QDAx75Jicw4cLXf4-6FEIlRT9hTkeB7jBHpntYG3N0gQK3IOLQV2NQRTH2rakPOVbQ==', 'gAAAAABorcD0Q2lnukkl6L2AdNIlmBSDxCtRzMVEPLlbVsEDGtC7hXmmE_iZy-9zrznShLTcHOKOzY1coyI36LXoKrAA1dyp5w==', 'gAAAAABorcRLuOFWJ5pInO1p-1Qjjx1ZghD44BDyJrK8j34hKF_swEEZuQF4njepIiHiLhACHgSSKxic-eTMV8LNfk5QRfEEPQ==', 'gAAAAABorc4E8zPxbeHO3dzXU9smEjnK01xMS47aqIHJKihydvtmQkN68bVe8Huq1zMQG9fMw0gO0cu7ryxavzrjj3owtRNkyw==', NULL, NULL, 'gAAAAABorc4Efy5UUNelzlB8OzFjppl1Hs4n9yTsahFpKFoBgQTB70GShEqgcif1PXySEwpQ-KWmPg7zwCJkPOHahFJ-Lfql4g==', 'gAAAAABorcD0kCIuHF-vccuDw4cCodu9Bxz4WrxZH55MjDjCb6gIZfQmAhiBhXBZgJG2Vz8lJOkofr4acAWXjvSgIx7RVtvn3g==', 'gAAAAABorcRLox-MYcngCCwKctNStkG60wapGhfNdP1eo7fyMdgjqf0B0sQ_6hdqbs2L79flwpeY6GXNdyAM-2PJebSWKf9rbA==', 'gAAAAABorc4Emufngq9vWaH3YZj3MRAvDMEFyBvUun97ENnV0fdHZvBZ0KLB_SmGLNfePaak-WZPuB9Ir4gafEcrsiOaeRLngg==', NULL, NULL, 'gAAAAABorc4EJcNi4ZiZvyXYx3TngnNkTHqnXrmfrzHAFFv6XbSqi0nyB9ObNy74i-gQ7eq_x1zdg6v2jgw-r-Ioo17JVaJ1mQ==', 'gAAAAABorcD0nnYaIboELuThDNft-ocFBf5mS-AHzmAcyRNAyPutIsj7fwKYjDkRDtz_Qfqd_FL9JFM_6lH6jafjqzJarFVf1g==', 'gAAAAABorcRL52cd45cvpBB7DrQQTNWkro2KjD9-RA_V_9KgqT7Uba4InoK-qAE5EX4iQIRWip2FVoViDGzOdGJMdy7IRwbwVg==', 'gAAAAABorc4ErnL-kWZUkX6GT44vo4L_gdi7Cb72tLOM8bF6apVVtlaa0URYz_w6hBq_uc7fXUa9uLztDKlYZX9oDYk2v0XsOA==', 'gAAAAABorc4EJcNi4ZiZvyXYx3TngnNkTHqnXrmfrzHAFFv6XbSqi0nyB9ObNy74i-gQ7eq_x1zdg6v2jgw-r-Ioo17JVaJ1mQ==', NULL, 'gAAAAABorc4E2swf25Z_yz8Leeu2d66DrvNFMXM2Ooj3mjJ6yZB9e92WWpX90XTbfNaAXSoMnc39f3qSpC5Y_Xxbe4YwSp5L1w==', 'gAAAAABorcD0Oq9ei7v8qL_e4hy4BBW7l9_rTDIm6wDDmz4_1rKAjYCExEPaOO3Ut3oe2Bh-zqK1Ho1zb_zYG1gkQOjeVt4Ubg==', 'gAAAAABorcRLtQSOsM-2KrgMY12FzxSeYefcL-HvEti63YhJfyH12ZY9iaBsa-MXyZiFNAwWTTebPlvrVUGnyr05n-P5xEd8PQ==', 'gAAAAABorc4EZJrIIHK11bD8ynQMQPy7J7gqt6SeUcPjGQZJRvm7Wx6Rz54Z_pTwxEzoCpXwuXHEeH_LHGIg0Q00b0z_NZ9OaQ==', NULL, NULL, 'gAAAAABorc4Eya_S0JYqvCnGwqaF8IYRBdK32oAVgEf6KNU7jDYokm5pjKYvnAr-wM0hAkmfxpyEXwhlS_D1KgeT5-wusbN1kQ==', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', 'gAAAAABorcD0Kbz2tlk4SL2sV0k9J8ew8tA9I_YrFxgrMkBDzSQgkuLoXnxyFPvzynt3TM8QNzbjxTi_pVLvCOWN07OH_Mz4-A==', NULL, NULL, NULL, NULL, 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', 'gAAAAABorcD0Rxwn1KOBGIAhHuska_ULOYn1Jh3hvg8pKWJ_LazjMzI_D55NiAPlqzHpSkXH0THkArK1IufsgS9J_xaJ18Cu_Q==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', '{}', 'False', 'False', 'False', 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_26_100418_add_two_factor_columns_to_users_table', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Recycle_Backup`
--

CREATE TABLE `Recycle_Backup` (
  `Recycle Timestamp` timestamp NOT NULL,
  `ID_Coupling` int NOT NULL,
  `ID_Offer` int NOT NULL,
  `ID_Contact_Coupling` int DEFAULT NULL,
  `ID_Contact` varchar(20) DEFAULT NULL,
  `ID_List` varchar(10) DEFAULT NULL,
  `Offer_Landing-Page` text,
  `Contact_Already-on-Customer-DB` text,
  `Timestamp_Ingestion` text,
  `Timestamp_Cleaned` text,
  `Timestamp_Quality-Checked` text,
  `Timestamp_Standardized` text,
  `Timestamp_Coupled` text,
  `Timestamp_Formatted` text,
  `Timestamp_Reviewed` text,
  `Timestamp_Uploading` text,
  `Timestamp_Form` text,
  `Timestamp_Upload` text,
  `Timestamp_Failed` text,
  `Issue_Description` text,
  `Issue_Screenshot` text,
  `Status_Preparation` text,
  `Contact_Device` text,
  `email` text,
  `firstname` text,
  `lastname` text,
  `phone` text,
  `city` text,
  `country` text,
  `password` text,
  `plate` text,
  `address` text,
  `date-of-birth` date DEFAULT NULL,
  `zip-code` text,
  `civic-number` text,
  `province-abbreviation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Recycle_Backup`
--

INSERT INTO `Recycle_Backup` (`Recycle Timestamp`, `ID_Coupling`, `ID_Offer`, `ID_Contact_Coupling`, `ID_Contact`, `ID_List`, `Offer_Landing-Page`, `Contact_Already-on-Customer-DB`, `Timestamp_Ingestion`, `Timestamp_Cleaned`, `Timestamp_Quality-Checked`, `Timestamp_Standardized`, `Timestamp_Coupled`, `Timestamp_Formatted`, `Timestamp_Reviewed`, `Timestamp_Uploading`, `Timestamp_Form`, `Timestamp_Upload`, `Timestamp_Failed`, `Issue_Description`, `Issue_Screenshot`, `Status_Preparation`, `Contact_Device`, `email`, `firstname`, `lastname`, `phone`, `city`, `country`, `password`, `plate`, `address`, `date-of-birth`, `zip-code`, `civic-number`, `province-abbreviation`) VALUES
('2025-08-22 08:02:54', 1, 95650, 2, '2', '6', 'https://assicuratiora.it/', NULL, '2025-08-14T12:08:09.623312+00:00', '2025-08-14T13:23:39.411819+00:00', '2025-08-18T07:09:34.934230+00:00', '2025-08-18T13:09:09.373323+00:00', '2025-08-19T15:44:48.153556+00:00', '2025-08-20T08:49:00.601916+00:00', '2025-08-21T15:17:05.248635+00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'Reviewed', 'desktop', 'gAAAAABopzdb9O1PqHZegTRM-JkMsTk5rkSdVRCym65AZDjyH9GJ2tTNCoS9mirKZiBjA-U6G_qTphsqdnlcaMg26uUMaaAZ9O6sDmMUt7U_QAv8CVFpD0E=', 'gAAAAABopzdblzo-K_eyAm2XBo7OY7oW5M5WGh5GP37zRTdXX1F-Mwv04IeY6Ef-jcwKwllQBuxgF-rJsIv9sn1VE_AVtEJ9rA==', 'gAAAAABopzdbj64Qz3pB9gyCVUzTiMqB6j5zb4tbQAisHOQp8ZNoLUpBnJdYXTFom61eDmzHWmLu3h4LUpzsSRaaTZFlU3yAMA==', 'gAAAAABopzdbLjNIkWUF005qQjAk4FXqjkbwqUZFYhxCdtXO2_UmAJSwH9Zm8Ron2Z9T7-0J9DHiRCdrVdo7TscM83MEyAcjbg==', 'gAAAAABooySYsq4Hmpih-6iBe2wZ11Kr89cZ48SuPI00FHmW6hrWpz3kt2M8_ovJb-MaK8gVpGswTYQsao5hPIWOQUfOLfuUiw==', 'it', NULL, NULL, 'gAAAAABooySYi768GJnpfPFIWB-ZoSSPWqt6YxNBW9iaNTihWZ0d9tRG0bXc7Dax4kjV3ZiORpWR6z8Fec1PIaBv7gZXAQZfVw==', '0000-00-00', 'gAAAAABopzdbgOsiRUEvGkM5PQhw04DklaPrD3kjJrTixoCuZxIvryoUYYUFH3f6-m9nXdkx6Y9oIdnuqAtO6N4z94z2QhbP7Q==', 'gAAAAABooySYl1vfCnoYkXVIVkqyh7TyRLr2qCeocOa6beZlRO4VCjeqvqgboGjGXvaB1OBejeJMmhDTrgKewD_IwQijMLobaQ==', NULL),
('2025-08-22 10:04:55', 1, 95650, 2, '2', '6', 'https://assicuratiora.it/', NULL, '2025-08-14T12:08:09.623312+00:00', '2025-08-14T13:23:39.411819+00:00', '2025-08-18T07:09:34.934230+00:00', '2025-08-18T13:09:09.373323+00:00', '2025-08-19T15:44:48.153556+00:00', '2025-08-20T08:49:00.601916+00:00', '2025-08-21T15:17:05.248635+00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'Reviewed', 'desktop', 'gAAAAABopzdb9O1PqHZegTRM-JkMsTk5rkSdVRCym65AZDjyH9GJ2tTNCoS9mirKZiBjA-U6G_qTphsqdnlcaMg26uUMaaAZ9O6sDmMUt7U_QAv8CVFpD0E=', 'gAAAAABopzdblzo-K_eyAm2XBo7OY7oW5M5WGh5GP37zRTdXX1F-Mwv04IeY6Ef-jcwKwllQBuxgF-rJsIv9sn1VE_AVtEJ9rA==', 'gAAAAABopzdbj64Qz3pB9gyCVUzTiMqB6j5zb4tbQAisHOQp8ZNoLUpBnJdYXTFom61eDmzHWmLu3h4LUpzsSRaaTZFlU3yAMA==', 'gAAAAABopzdbLjNIkWUF005qQjAk4FXqjkbwqUZFYhxCdtXO2_UmAJSwH9Zm8Ron2Z9T7-0J9DHiRCdrVdo7TscM83MEyAcjbg==', 'gAAAAABooySYsq4Hmpih-6iBe2wZ11Kr89cZ48SuPI00FHmW6hrWpz3kt2M8_ovJb-MaK8gVpGswTYQsao5hPIWOQUfOLfuUiw==', 'it', NULL, NULL, 'gAAAAABooySYi768GJnpfPFIWB-ZoSSPWqt6YxNBW9iaNTihWZ0d9tRG0bXc7Dax4kjV3ZiORpWR6z8Fec1PIaBv7gZXAQZfVw==', '0000-00-00', 'gAAAAABopzdbgOsiRUEvGkM5PQhw04DklaPrD3kjJrTixoCuZxIvryoUYYUFH3f6-m9nXdkx6Y9oIdnuqAtO6N4z94z2QhbP7Q==', 'gAAAAABooySYl1vfCnoYkXVIVkqyh7TyRLr2qCeocOa6beZlRO4VCjeqvqgboGjGXvaB1OBejeJMmhDTrgKewD_IwQijMLobaQ==', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5HKSr3UNGtCjpGAVuAzX5yvNzLy5L0PS5R6HyaUN', NULL, '104.248.4.156', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGx2bzNOQXQwaDlmcFhKWmMyWjhCazFiejlMTWp3ak8xUDBHeGk1TSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762172339),
('6MS28arhnvMYBuzFjwJQXfb0BiFJJToLXJnZkYHx', NULL, '34.48.12.73', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieExvZHhNc0lWYnZRc1RPcWM1YzBIMGpoT1hQZGFEM216bjZ0UTRtOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762266678),
('9NLNjjI470TYwz8D7qPrIvWzQXMwvGqokqreEhaL', NULL, '136.118.82.43', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEpMQ09jYmJMUldGVXFRSEplV3lEVmpCUzlLZno0aUdPc3FoczBSbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762190487),
('cnfGqFSOMC0nIR2Ynwo5QZanx4AptWF0srtoVOxb', NULL, '87.13.130.47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0g2NFh4M0tncFh1dHFvZVdQWVV4bDkxS2JycVVRQ2hrTnpZZkU3VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vY29uZmx1ZW5jZS5yZXZkZXYuaXQvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762169262),
('ebMbG4q0IYH58qLseMko0tCLevhTTpjStB7BaADy', NULL, '136.118.82.43', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2Ntcnk2aXVBdmJJbllaQ0ZKczlIaGd4bGtqRmxNRFZTTk9xUXVPWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762190486),
('i2xvQlOQwHFcCl445HqOClrXXlouczMDKoxva2re', NULL, '34.87.122.57', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-J111F)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkU0UzZqSWFkSnNHTTl1Z2FiclF3UFA0YU9VWlhvNlFHUURXNkdEZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762208065),
('jYCYhgopzIuR2RHYadUYMMLTSWJN8331DpNKghKK', NULL, '104.248.203.111', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0N2ejE4Ymd6Tzdwb3daU1JBYllISnEwRkxJRUF2YUk5a1h5a2FKdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762196835),
('KLKQMPUPo6CIWpBPvPS1EHzScbm7r04dWV62DA5s', NULL, '34.87.122.57', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-J111F)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVBrR2xvbTlVYWwyQXBFaWFuM2JFNTRFbmJpdHhIUERrUUh3c25iaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762208065),
('miplzIB8wUwCnHScPeeI81plPKGvdlJR5fQOrjEJ', NULL, '34.48.12.73', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTdtNmUyR1BsNG8wbGd0U1NhQkpPUmtFelZDVDRHbERBQnhpRVZweCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762266679),
('MqBCov8tu6mszhX6A2ufQaR4RNlbhGN8ITsNT3aH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1ZtbjVvQmdCbWtkOXUydThuSDdiTm93a0xmTElNUDdpb0M5VjZMUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnRlc3QvaGVscCI7czo1OiJyb3V0ZSI7czoxNDoiZGFzaGJvYXJkLmhlbHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762500313),
('o9y68gNJP4rtjf6Bg3myrdYnXqt1J5yxATX0tMzM', NULL, '138.68.175.164', 'Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0JqTk9wSlMxN2x6b2F0dG90YzlTWFpidWJNTHpDVjFmazZLQ0RXciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vY29uZmx1ZW5jZS5yZXZkZXYuaXQvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762368260),
('PzWobebW7vCCK1FaxtXaXhy0w4FZN4l3zxsStAuD', NULL, '34.87.9.33', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-J111F)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTVIckhtRldiNDVUNk5xSDRrNGxPZnJaSzlQbWRYV3BjRFlQYTFreSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762233894),
('RSvHwk2fUN9YEOQmKUoJNA0EyDbl2MM0DmGLG5QA', NULL, '104.248.203.111', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0lwamI4cFNOdGNpOFRzNmVIV2lsclVtVFVYYmlnTVpRVVhVcUo2aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vY29uZmx1ZW5jZS5yZXZkZXYuaXQvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762196836),
('tukZ8Uy98Wtw1aJuoEtZVTEzYbiQsZeddu8P1qiI', NULL, '34.87.9.33', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-J111F)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEYwUDdjVUtXcEJtRnlTM2NMNGhCbkhJbnNucGJzQ1FqQ0Q1SjlTQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762233894),
('wc0HF2KW8KHKX5USvPuWZk0UOtZkiH243a2gPaT5', NULL, '104.248.4.156', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0JhQnFDcDZORTJEN1dnQXNLR2lpOXMzdU5uNzc3Qnptd1lxVW9LZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vY29uZmx1ZW5jZS5yZXZkZXYuaXQvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762172342),
('Xf03P14u2Drklb2yUUIJVJJ24N15fy7LARqphVCf', NULL, '138.68.175.164', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW1iQlBkQ1FWb25qSkZteTlycGpDY3RGZkJpYVR4SFB2ZVVvbzFRbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762368259),
('zCwiVJsSR32wslvzOBu3cDpyJUbXJDMIRyJ3XBSA', NULL, '149.88.26.14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkwwaUo4NURqODZoZGZFZFdXdk9MMkZ3WmlTSjVRSzhBN3Y1QWRrVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9jb25mbHVlbmNlLnJldmRldi5pdCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762266238);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-11-03 10:37:30', '$2y$12$15YwLjnsznNOt..jsZ1a0OoLKDYxeQ9Cm0fYZnfNuzlrEZFiI4rVK', NULL, NULL, NULL, NULL, '2025-11-03 10:37:30', '2025-11-03 10:37:30');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Blacklists`
--
ALTER TABLE `Blacklists`
  ADD UNIQUE KEY `uq_blacklists_email_phone` (`email`,`phone`);

--
-- Indici per le tabelle `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indici per le tabelle `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indici per le tabelle `Coupling`
--
ALTER TABLE `Coupling`
  ADD PRIMARY KEY (`ID_Coupling`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indici per le tabelle `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indici per le tabelle `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `Recycle_Backup`
--
ALTER TABLE `Recycle_Backup`
  ADD PRIMARY KEY (`Recycle Timestamp`,`ID_Coupling`);

--
-- Indici per le tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Coupling`
--
ALTER TABLE `Coupling`
  MODIFY `ID_Coupling` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
