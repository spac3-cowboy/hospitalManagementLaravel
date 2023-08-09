-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 01, 2022 at 12:06 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountants`
--

CREATE TABLE `accountants` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `user_id` bigint(20) UNSIGNED NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `type` tinyint(4) NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci,
                            `status` tinyint(1) NOT NULL DEFAULT '0',
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `owner_id` int(11) DEFAULT NULL,
                             `owner_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `user_id` int(11) NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advanced_payments`
--

CREATE TABLE `advanced_payments` (
                                     `id` int(10) UNSIGNED NOT NULL,
                                     `patient_id` bigint(20) UNSIGNED NOT NULL,
                                     `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `amount` double NOT NULL,
                                     `date` date NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ambulances`
--

CREATE TABLE `ambulances` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `vehicle_number` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `vehicle_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `year_made` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `driver_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `driver_license` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `driver_contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `note` text COLLATE utf8mb4_unicode_ci,
                              `is_available` tinyint(1) NOT NULL DEFAULT '1',
                              `vehicle_type` int(11) NOT NULL DEFAULT '1',
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_calls`
--

CREATE TABLE `ambulance_calls` (
                                   `id` int(10) UNSIGNED NOT NULL,
                                   `patient_id` int(10) UNSIGNED NOT NULL,
                                   `ambulance_id` int(10) UNSIGNED NOT NULL,
                                   `driver_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `date` date NOT NULL,
                                   `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `patient_id` int(10) UNSIGNED NOT NULL,
                                `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                `department_id` bigint(20) UNSIGNED NOT NULL,
                                `opd_date` datetime NOT NULL,
                                `problem` text COLLATE utf8mb4_unicode_ci,
                                `is_completed` tinyint(1) NOT NULL DEFAULT '0',
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
                        `id` int(10) UNSIGNED NOT NULL,
                        `bed_type` int(10) UNSIGNED NOT NULL,
                        `bed_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `description` text COLLATE utf8mb4_unicode_ci,
                        `charge` int(11) NOT NULL,
                        `is_available` tinyint(1) NOT NULL DEFAULT '1',
                        `created_at` timestamp NULL DEFAULT NULL,
                        `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed_assigns`
--

CREATE TABLE `bed_assigns` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `bed_id` int(10) UNSIGNED NOT NULL,
                               `ipd_patient_department_id` int(10) UNSIGNED DEFAULT NULL,
                               `patient_id` int(10) UNSIGNED NOT NULL,
                               `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `assign_date` datetime NOT NULL,
                               `discharge_date` datetime DEFAULT NULL,
                               `description` text COLLATE utf8mb4_unicode_ci,
                               `status` tinyint(1) NOT NULL DEFAULT '0',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed_types`
--

CREATE TABLE `bed_types` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `title` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `description` text COLLATE utf8mb4_unicode_ci,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
                         `id` int(10) UNSIGNED NOT NULL,
                         `bill_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `patient_id` int(10) UNSIGNED NOT NULL,
                         `bill_date` datetime NOT NULL,
                         `amount` decimal(16,2) DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `patient_admission_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `bill_id` int(10) UNSIGNED NOT NULL,
                              `qty` int(10) UNSIGNED NOT NULL,
                              `price` double(8,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `birth_reports`
--

CREATE TABLE `birth_reports` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `patient_id` int(10) UNSIGNED NOT NULL,
                                 `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                 `date` datetime NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_banks`
--

CREATE TABLE `blood_banks` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `remained_bags` bigint(20) NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_donations`
--

CREATE TABLE `blood_donations` (
                                   `id` int(10) UNSIGNED NOT NULL,
                                   `blood_donor_id` int(10) UNSIGNED NOT NULL,
                                   `bags` int(11) NOT NULL DEFAULT '1',
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_donors`
--

CREATE TABLE `blood_donors` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `age` int(11) NOT NULL,
                                `gender` int(11) NOT NULL,
                                `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `last_donate_date` datetime NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_issues`
--

CREATE TABLE `blood_issues` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `issue_date` datetime NOT NULL,
                                `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                `donor_id` int(10) UNSIGNED NOT NULL,
                                `patient_id` int(10) UNSIGNED NOT NULL,
                                `amount` bigint(20) DEFAULT NULL,
                                `remarks` text COLLATE utf8mb4_unicode_ci,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
                          `id` int(10) UNSIGNED NOT NULL,
                          `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_logs`
--

CREATE TABLE `call_logs` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `date` date DEFAULT NULL,
                             `follow_up_date` date DEFAULT NULL,
                             `note` text COLLATE utf8mb4_unicode_ci,
                             `call_type` int(11) NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_handlers`
--

CREATE TABLE `case_handlers` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `user_id` bigint(20) UNSIGNED NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `is_active` tinyint(1) NOT NULL DEFAULT '0',
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
                           `id` int(10) UNSIGNED NOT NULL,
                           `charge_type` int(11) NOT NULL,
                           `charge_category_id` int(10) UNSIGNED NOT NULL,
                           `code` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `standard_charge` bigint(20) NOT NULL,
                           `description` text COLLATE utf8mb4_unicode_ci,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_categories`
--

CREATE TABLE `charge_categories` (
                                     `id` int(10) UNSIGNED NOT NULL,
                                     `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `description` text COLLATE utf8mb4_unicode_ci,
                                     `charge_type` int(11) NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_settings`
--

CREATE TABLE `currency_settings` (
                                     `id` bigint(20) UNSIGNED NOT NULL,
                                     `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `currency_icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_settings`
--

INSERT INTO `currency_settings` (`id`, `currency_name`, `currency_icon`, `currency_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'United states dollar', '$', 'USD', '2022-12-01 06:36:25', '2022-12-01 06:36:25', NULL),
(2, 'Indian rupee', '₹', 'INR', '2022-12-01 06:36:25', '2022-12-01 06:36:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `death_reports`
--

CREATE TABLE `death_reports` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `patient_id` int(10) UNSIGNED NOT NULL,
                                 `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                 `date` datetime NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `is_active` tinyint(1) NOT NULL DEFAULT '0',
                               `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_categories`
--

CREATE TABLE `diagnosis_categories` (
                                        `id` bigint(20) UNSIGNED NOT NULL,
                                        `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `description` text COLLATE utf8mb4_unicode_ci,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `user_id` bigint(20) UNSIGNED NOT NULL,
                           `doctor_department_id` bigint(20) UNSIGNED NOT NULL,
                           `specialist` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_departments`
--

CREATE TABLE `doctor_departments` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `title` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `description` text COLLATE utf8mb4_unicode_ci,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_opd_charges`
--

CREATE TABLE `doctor_opd_charges` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                      `standard_charge` double NOT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `document_type_id` int(11) NOT NULL,
                             `patient_id` int(11) NOT NULL,
                             `uploaded_by` bigint(20) UNSIGNED NOT NULL,
                             `notes` text COLLATE utf8mb4_unicode_ci,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
                                  `id` int(10) UNSIGNED NOT NULL,
                                  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_payrolls`
--

CREATE TABLE `employee_payrolls` (
                                     `id` int(10) UNSIGNED NOT NULL,
                                     `sr_no` bigint(20) NOT NULL,
                                     `payroll_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `type` int(11) NOT NULL,
                                     `owner_id` int(11) NOT NULL,
                                     `owner_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `year` int(11) NOT NULL,
                                     `net_salary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `status` int(11) NOT NULL,
                                     `basic_salary` double NOT NULL,
                                     `allowance` double NOT NULL,
                                     `deductions` double NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `type` tinyint(4) DEFAULT NULL,
                             `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
                             `viewed_by` bigint(20) UNSIGNED DEFAULT NULL,
                             `status` tinyint(1) NOT NULL DEFAULT '0',
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `expense_head` int(11) NOT NULL,
                            `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `date` datetime NOT NULL,
                            `amount` double NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_services`
--

CREATE TABLE `front_services` (
                                  `id` bigint(20) UNSIGNED NOT NULL,
                                  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_settings`
--

CREATE TABLE `front_settings` (
                                  `id` bigint(20) UNSIGNED NOT NULL,
                                  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_schedules`
--

CREATE TABLE `hospital_schedules` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `day_of_week` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `income_head` int(11) NOT NULL,
                           `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `date` datetime NOT NULL,
                           `amount` double NOT NULL,
                           `description` text COLLATE utf8mb4_unicode_ci,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `service_tax` double NOT NULL,
                              `discount` double DEFAULT NULL,
                              `remark` text COLLATE utf8mb4_unicode_ci,
                              `insurance_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `insurance_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `hospital_rate` double NOT NULL,
                              `total` double NOT NULL,
                              `status` tinyint(1) NOT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_diseases`
--

CREATE TABLE `insurance_diseases` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `insurance_id` int(10) UNSIGNED NOT NULL,
                                      `disease_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `disease_charge` double NOT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investigation_reports`
--

CREATE TABLE `investigation_reports` (
                                         `id` int(10) UNSIGNED NOT NULL,
                                         `patient_id` int(10) UNSIGNED NOT NULL,
                                         `date` datetime NOT NULL,
                                         `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `description` text COLLATE utf8mb4_unicode_ci,
                                         `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                         `status` int(11) NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `patient_id` int(10) UNSIGNED NOT NULL,
                            `invoice_date` date NOT NULL,
                            `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `account_id` int(10) UNSIGNED NOT NULL,
                                 `invoice_id` int(10) UNSIGNED NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `quantity` int(11) NOT NULL,
                                 `price` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_bills`
--

CREATE TABLE `ipd_bills` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                             `total_charges` int(11) NOT NULL,
                             `total_payments` int(11) NOT NULL,
                             `gross_total` int(11) NOT NULL,
                             `discount_in_percentage` int(11) NOT NULL,
                             `tax_in_percentage` int(11) NOT NULL,
                             `other_charges` int(11) NOT NULL,
                             `net_payable_amount` int(11) NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_charges`
--

CREATE TABLE `ipd_charges` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                               `date` date NOT NULL,
                               `charge_type_id` int(11) NOT NULL,
                               `charge_category_id` int(10) UNSIGNED NOT NULL,
                               `charge_id` int(10) UNSIGNED NOT NULL,
                               `standard_charge` int(11) DEFAULT NULL,
                               `applied_charge` int(11) NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_consultant_registers`
--

CREATE TABLE `ipd_consultant_registers` (
                                            `id` int(10) UNSIGNED NOT NULL,
                                            `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                            `applied_date` datetime NOT NULL,
                                            `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                            `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `instruction_date` date NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_diagnoses`
--

CREATE TABLE `ipd_diagnoses` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                 `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `report_date` datetime NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_patient_departments`
--

CREATE TABLE `ipd_patient_departments` (
                                           `id` int(10) UNSIGNED NOT NULL,
                                           `patient_id` int(10) UNSIGNED NOT NULL,
                                           `ipd_number` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `bp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `symptoms` text COLLATE utf8mb4_unicode_ci,
                                           `notes` text COLLATE utf8mb4_unicode_ci,
                                           `admission_date` datetime NOT NULL,
                                           `case_id` int(10) UNSIGNED NOT NULL,
                                           `is_old_patient` tinyint(1) DEFAULT '0',
                                           `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
                                           `bed_type_id` int(10) UNSIGNED DEFAULT NULL,
                                           `bed_id` int(10) UNSIGNED NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           `bill_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_payments`
--

CREATE TABLE `ipd_payments` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                `amount` int(11) NOT NULL,
                                `date` date NOT NULL,
                                `payment_mode` tinyint(4) NOT NULL,
                                `notes` text COLLATE utf8mb4_unicode_ci,
                                `transaction_id` int(11) DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescriptions`
--

CREATE TABLE `ipd_prescriptions` (
                                     `id` int(10) UNSIGNED NOT NULL,
                                     `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                     `header_note` text COLLATE utf8mb4_unicode_ci,
                                     `footer_note` text COLLATE utf8mb4_unicode_ci,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_items`
--

CREATE TABLE `ipd_prescription_items` (
                                          `id` int(10) UNSIGNED NOT NULL,
                                          `ipd_prescription_id` int(10) UNSIGNED NOT NULL,
                                          `category_id` int(10) UNSIGNED NOT NULL,
                                          `medicine_id` int(10) UNSIGNED NOT NULL,
                                          `dosage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_timelines`
--

CREATE TABLE `ipd_timelines` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                 `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `date` date NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `visible_to_person` tinyint(1) NOT NULL DEFAULT '1',
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issued_items`
--

CREATE TABLE `issued_items` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `department_id` bigint(20) UNSIGNED NOT NULL,
                                `user_id` bigint(20) UNSIGNED NOT NULL,
                                `issued_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `issued_date` date NOT NULL,
                                `return_date` date DEFAULT NULL,
                                `item_category_id` int(10) UNSIGNED NOT NULL,
                                `item_id` int(10) UNSIGNED NOT NULL,
                                `quantity` int(11) NOT NULL,
                                `description` text COLLATE utf8mb4_unicode_ci,
                                `status` tinyint(1) DEFAULT '0',
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
                         `id` int(10) UNSIGNED NOT NULL,
                         `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `item_category_id` int(10) UNSIGNED NOT NULL,
                         `unit` bigint(20) NOT NULL,
                         `description` text COLLATE utf8mb4_unicode_ci,
                         `available_quantity` int(11) NOT NULL DEFAULT '0',
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
                                   `id` int(10) UNSIGNED NOT NULL,
                                   `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_stocks`
--

CREATE TABLE `item_stocks` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `item_category_id` int(10) UNSIGNED NOT NULL,
                               `item_id` int(10) UNSIGNED NOT NULL,
                               `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `store_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `quantity` int(11) NOT NULL,
                               `purchase_price` double NOT NULL,
                               `description` text COLLATE utf8mb4_unicode_ci,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_technicians`
--

CREATE TABLE `lab_technicians` (
                                   `id` bigint(20) UNSIGNED NOT NULL,
                                   `user_id` bigint(20) UNSIGNED NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_consultations`
--

CREATE TABLE `live_consultations` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                      `patient_id` int(10) UNSIGNED NOT NULL,
                                      `consultation_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `consultation_date` datetime NOT NULL,
                                      `host_video` tinyint(1) NOT NULL,
                                      `participant_video` tinyint(1) NOT NULL,
                                      `consultation_duration_minutes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `type_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `status` int(11) NOT NULL,
                                      `description` text COLLATE utf8mb4_unicode_ci,
                                      `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `meta` text COLLATE utf8mb4_unicode_ci,
                                      `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_meetings`
--

CREATE TABLE `live_meetings` (
                                 `id` bigint(20) UNSIGNED NOT NULL,
                                 `consultation_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `consultation_date` datetime NOT NULL,
                                 `consultation_duration_minutes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `host_video` tinyint(1) NOT NULL,
                                 `participant_video` tinyint(1) NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `meta` text COLLATE utf8mb4_unicode_ci,
                                 `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `status` int(11) NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_meetings_candidates`
--

CREATE TABLE `live_meetings_candidates` (
                                            `id` bigint(20) UNSIGNED NOT NULL,
                                            `user_id` bigint(20) UNSIGNED NOT NULL,
                                            `live_meeting_id` bigint(20) UNSIGNED NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
                         `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `user_id` bigint(20) UNSIGNED NOT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `model_type` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `model_id` bigint(20) UNSIGNED NOT NULL,
                         `collection_name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `file_name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `mime_type` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `disk` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `size` bigint(20) UNSIGNED NOT NULL,
                         `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
                         `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
                         `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
                         `order_column` int(10) UNSIGNED DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `conversions_disk` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `generated_conversions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `category_id` int(10) UNSIGNED DEFAULT NULL,
                             `brand_id` int(10) UNSIGNED DEFAULT NULL,
                             `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `selling_price` double NOT NULL,
                             `buying_price` double NOT NULL,
                             `salt_composition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `description` text COLLATE utf8mb4_unicode_ci,
                             `side_effects` text COLLATE utf8mb4_unicode_ci,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2020_02_06_031618_create_categories_table', 1),
(9, '2020_02_12_053840_create_doctor_departments_table', 1),
(10, '2020_02_12_053932_create_departments_table', 1),
(11, '2020_02_13_042835_create_brands_table', 1),
(12, '2020_02_13_053840_create_doctors_table', 1),
(13, '2020_02_13_054103_create_patients_table', 1),
(14, '2020_02_13_094724_create_bills_table', 1),
(15, '2020_02_13_095024_create_medicines_table', 1),
(16, '2020_02_13_095125_create_bill_items_table', 1),
(17, '2020_02_13_111857_create_nurses_table', 1),
(18, '2020_02_13_125601_create_addresses_table', 1),
(19, '2020_02_13_141104_create_media_table', 1),
(20, '2020_02_14_051650_create_lab_technicians_table', 1),
(21, '2020_02_14_055353_create_appointments_table', 1),
(22, '2020_02_14_091441_create_receptionists_table', 1),
(23, '2020_02_14_093246_create_pharmacists_table', 1),
(24, '2020_02_17_053450_create_accountants_table', 1),
(25, '2020_02_17_080856_create_bed_types_table', 1),
(26, '2020_02_17_092326_create_blood_banks_table', 1),
(27, '2020_02_17_105627_create_beds_table', 1),
(28, '2020_02_17_110620_create_blood_donors_table', 1),
(29, '2020_02_17_135716_create_permission_tables', 1),
(30, '2020_02_18_042327_create_notice_boards_table', 1),
(31, '2020_02_18_042442_create_document_types_table', 1),
(32, '2020_02_18_060222_create_patient_cases_table', 1),
(33, '2020_02_18_060223_create_operation_reports_table', 1),
(34, '2020_02_18_064953_create_bed_assigns_table', 1),
(35, '2020_02_18_092202_create_documents_table', 1),
(36, '2020_02_18_094758_create_birth_reports_table', 1),
(37, '2020_02_18_111020_create_death_reports_table', 1),
(38, '2020_02_19_080336_create_employee_payrolls_table', 1),
(39, '2020_02_19_134502_create_settings_table', 1),
(40, '2020_02_21_090236_create_investigation_reports_table', 1),
(41, '2020_02_21_095439_create_accounts_table', 1),
(42, '2020_02_22_070658_create_payments_table', 1),
(43, '2020_02_22_090112_create_insurances_table', 1),
(44, '2020_02_22_091537_create_insurance_disease_table', 1),
(45, '2020_02_24_055136_create_invoices_table', 1),
(46, '2020_02_24_055518_create_schedules_table', 1),
(47, '2020_02_24_055702_create_invoice_items_table', 1),
(48, '2020_02_25_105042_create_services_table', 1),
(49, '2020_02_25_131030_create_packages_table', 1),
(50, '2020_02_25_131108_create_package_services_table', 1),
(51, '2020_02_27_120948_create_patient_admissions_table', 1),
(52, '2020_02_28_031410_create_case_handlers_table', 1),
(53, '2020_03_02_043813_create_advanced_payments_table', 1),
(54, '2020_03_02_065845_add_patient_admission_id_to_bills', 1),
(55, '2020_03_03_062243_add_patient_id_to_bills', 1),
(56, '2020_03_03_113334_create_schedule_day_table', 1),
(57, '2020_03_26_052336_create_ambulances_table', 1),
(58, '2020_03_26_081157_create_mails_table', 1),
(59, '2020_03_27_061641_create_enquiries_table', 1),
(60, '2020_03_27_063148_create_ambulance_calls_table', 1),
(61, '2020_03_31_122219_create_prescriptions_table', 1),
(62, '2020_04_11_052629_create_charge_categories_table', 1),
(63, '2020_04_11_053929_create_pathology_categories_table', 1),
(64, '2020_04_11_070859_create_radiology_categories_table', 1),
(65, '2020_04_11_090903_create_charges_table', 1),
(66, '2020_04_13_050643_create_radiology_tests_table', 1),
(67, '2020_04_14_093339_create_pathology_tests_table', 1),
(68, '2020_04_24_111205_create_doctor_opd_charge_table', 1),
(69, '2020_04_28_094118_create_expenses_table', 1),
(70, '2020_05_01_055137_create_incomes_table', 1),
(71, '2020_05_11_083050_add_notes_documents_table', 1),
(72, '2020_05_12_075825_create_sms_table', 1),
(73, '2020_06_22_071531_add_index_to_accounts_table', 1),
(74, '2020_06_22_071943_add_index_to_doctor_opd_charges_table', 1),
(75, '2020_06_22_072921_add_index_to_bed_assigns_table', 1),
(76, '2020_06_22_073042_add_index_to_medicines_table', 1),
(77, '2020_06_22_073457_add_index_to_employee_payrolls_table', 1),
(78, '2020_06_22_074937_add_index_to_notice_boards_table', 1),
(79, '2020_06_22_075222_add_index_to_blood_donors_table', 1),
(80, '2020_06_22_075359_add_index_to_packages_table', 1),
(81, '2020_06_22_075506_add_index_to_bed_types_table', 1),
(82, '2020_06_22_075725_add_index_to_services_table', 1),
(83, '2020_06_22_080944_add_index_to_invoices_table', 1),
(84, '2020_06_22_081601_add_index_to_payments_table', 1),
(85, '2020_06_22_081802_add_index_to_advanced_payments_table', 1),
(86, '2020_06_22_081909_add_index_to_bills_table', 1),
(87, '2020_06_22_082548_add_index_to_beds_table', 1),
(88, '2020_06_22_082942_add_index_to_blood_banks_table', 1),
(89, '2020_06_22_083511_add_index_to_users_table', 1),
(90, '2020_06_22_084750_add_index_to_patient_cases_table', 1),
(91, '2020_06_22_084912_add_index_to_patient_admissions_table', 1),
(92, '2020_06_22_085036_add_index_to_document_types_table', 1),
(93, '2020_06_22_085128_add_index_to_insurances_table', 1),
(94, '2020_06_22_085317_add_index_to_ambulances_table', 1),
(95, '2020_06_22_090509_add_index_to_ambulance_calls_table', 1),
(96, '2020_06_22_091253_add_index_to_doctor_departments_table', 1),
(97, '2020_06_22_091455_add_index_to_appointments_table', 1),
(98, '2020_06_22_091617_add_index_to_birth_reports_table', 1),
(99, '2020_06_22_091632_add_index_to_death_reports_table', 1),
(100, '2020_06_22_091651_add_index_to_investigation_reports_table', 1),
(101, '2020_06_22_091828_add_index_to_operation_reports_table', 1),
(102, '2020_06_22_092018_add_index_to_categories_table', 1),
(103, '2020_06_22_092149_add_index_to_brands_table', 1),
(104, '2020_06_22_092324_add_index_to_pathology_tests_table', 1),
(105, '2020_06_22_092338_add_index_to_pathology_categories_table', 1),
(106, '2020_06_22_092347_add_index_to_radiology_tests_table', 1),
(107, '2020_06_22_092357_add_index_to_radiology_categories_table', 1),
(108, '2020_06_22_092651_add_index_to_expenses_table', 1),
(109, '2020_06_22_092702_add_index_to_incomes_table', 1),
(110, '2020_06_22_092855_add_index_to_charges_table', 1),
(111, '2020_06_22_092905_add_index_to_charge_categories_table', 1),
(112, '2020_06_22_093234_add_index_to_enquiries_table', 1),
(113, '2020_06_24_044648_create_diagnosis_categories_table', 1),
(114, '2020_06_25_080242_create_patient_diagnosis_tests_table', 1),
(115, '2020_06_26_054352_create_patient_diagnosis_properties_table', 1),
(116, '2020_07_15_044653_remove_serial_visibility_from_schedules_table', 1),
(117, '2020_07_15_121336_change_ambulances_table_column', 1),
(118, '2020_07_22_052934_change_bed_assigns_table_column', 1),
(119, '2020_07_29_095430_change_invoice_items_table_column', 1),
(120, '2020_08_26_081235_create_item_categories_table', 1),
(121, '2020_08_26_101134_create_items_table', 1),
(122, '2020_08_26_125032_create_item_stocks_table', 1),
(123, '2020_08_27_141547_create_issued_items_table', 1),
(124, '2020_09_08_064222_create_ipd_patient_departments_table', 1),
(125, '2020_09_08_114627_create_ipd_diagnoses_table', 1),
(126, '2020_09_09_065624_create_ipd_consultant_registers_table', 1),
(127, '2020_09_09_135505_create_ipd_charges_table', 1),
(128, '2020_09_10_112306_create_ipd_prescriptions_table', 1),
(129, '2020_09_10_114203_create_ipd_prescription_items_table', 1),
(130, '2020_09_11_045308_create_modules_table', 1),
(131, '2020_09_12_050715_create_ipd_payments_table', 1),
(132, '2020_09_12_071821_create_ipd_timelines_table', 1),
(133, '2020_09_12_103003_create_ipd_bills_table', 1),
(134, '2020_09_14_083759_create_opd_patient_departments_table', 1),
(135, '2020_09_14_144731_add_ipd_patient_department_id_to_bed_assigns_table', 1),
(136, '2020_09_15_064044_create_transactions_table', 1),
(137, '2020_09_16_103204_create_opd_diagnoses_table', 1),
(138, '2020_09_16_114031_create_opd_timelines_table', 1),
(139, '2020_09_23_045100_change_patient_diagnosis_properties_table', 1),
(140, '2020_09_24_053229_add_ipd_bill_column_in_ipd_patient_departments_table', 1),
(141, '2020_10_09_085838_create_call_logs_table', 1),
(142, '2020_10_12_125133_create_visitors_table', 1),
(143, '2020_10_14_044134_create_postals_table', 1),
(144, '2020_10_30_043500_add_route_in_modules_table', 1),
(145, '2020_10_31_062448_add_complete_in_appointments_table', 1),
(146, '2020_11_02_050736_create_testimonials_table', 1),
(147, '2020_11_07_121633_add_region_code_in_sms_table', 1),
(148, '2020_11_19_093810_create_blood_donations_table', 1),
(149, '2020_11_20_113830_create_blood_issues_table', 1),
(150, '2020_11_24_131253_create_notifications_table', 1),
(151, '2020_12_28_131351_create_live_consultations_table', 1),
(152, '2020_12_31_062506_create_live_meetings_table', 1),
(153, '2020_12_31_091242_create_live_meetings_candidates_table', 1),
(154, '2021_01_05_100425_create_user_zoom_credential_table', 1),
(155, '2021_01_06_105407_add_metting_id_to_live_meetings_table', 1),
(156, '2021_02_23_065200_create_vaccinations_table', 1),
(157, '2021_02_23_065252_create_vaccinated_patients_table', 1),
(158, '2021_04_05_085646_create_front_settings_table', 1),
(159, '2021_05_10_000000_add_uuid_to_failed_jobs_table', 1),
(160, '2021_05_29_103036_add_conversions_disk_column_in_media_table', 1),
(161, '2021_06_07_104022_change_patient_foreign_key_type_in_appointments_table', 1),
(162, '2021_06_08_073918_change_department_foreign_key_in_appointments_table', 1),
(163, '2021_06_21_082754_update_amount_datatype_in_bills_table', 1),
(164, '2021_06_21_082845_update_amount_datatype_in_bill_items_table', 1),
(165, '2021_11_11_061443_create_front_services_table', 1),
(166, '2021_11_12_100750_create_hospital_schedules_table', 1),
(167, '2021_11_12_105805_add_social_details_in_users_table', 1),
(168, '2022_02_18_101938_add_darkmode_to_users_table', 1),
(169, '2022_04_09_064645_change_doctor_foreign_in_operation_reports_table', 1),
(170, '2022_05_16_104947_add_default_length_in_table', 1),
(171, '2022_07_29_200345_add_prescription_fields', 1),
(172, '2022_08_01_204917_create_prescriptions_medicines_table', 1),
(173, '2022_08_26_225704_change_charges_standard_charge_column', 1),
(174, '2022_08_30_011825_change_item_unit_column', 1),
(175, '2022_09_06_202047_change_amount_at_blood_issue', 1),
(176, '2022_09_07_184901_change_dose_number_column', 1),
(177, '2022_09_08_065652_add_country_code_field_in_settings', 1),
(178, '2022_09_08_201840_defalut_new_module_seeder', 1),
(179, '2022_09_26_214705_create_admins_table', 1),
(180, '2022_09_30_205212_create_currency_settings_table', 1),
(181, '2022_10_06_165905_create_admin_module_seeder_migration', 1),
(182, '2022_10_07_204913_create_default_currency_seeder_migration', 1),
(183, '2022_10_11_183203_create_change_field_type_employee_payroll', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
                                         `permission_id` bigint(20) UNSIGNED NOT NULL,
                                         `model_type` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
                                   `role_id` bigint(20) UNSIGNED NOT NULL,
                                   `model_type` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `is_active` tinyint(1) NOT NULL DEFAULT '1',
                           `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `is_active`, `route`, `created_at`, `updated_at`) VALUES
(1, 'Employee Bills', 1, 'employee.bills.index', '2022-12-01 06:36:25', '2022-12-01 06:36:25'),
(2, 'Employee Bills Show', 1, 'employee.bills.show', '2022-12-01 06:36:25', '2022-12-01 06:36:25'),
(3, 'Employee Noticeboard', 1, 'employee.noticeboard', '2022-12-01 06:36:25', '2022-12-01 06:36:25'),
(4, 'Employee Patient Diagnosis Test Pdf', 1, 'employee.patient.diagnosis.test.pdf', '2022-12-01 06:36:25', '2022-12-01 06:36:25'),
(5, 'Admin', 1, 'admins.index', '2022-12-01 06:36:25', '2022-12-01 06:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `type` int(11) NOT NULL,
                                 `notification_for` int(11) NOT NULL,
                                 `user_id` bigint(20) UNSIGNED NOT NULL,
                                 `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `text` text COLLATE utf8mb4_unicode_ci,
                                 `meta` text COLLATE utf8mb4_unicode_ci,
                                 `read_at` timestamp NULL DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
                          `id` int(10) UNSIGNED NOT NULL,
                          `user_id` bigint(20) UNSIGNED NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opd_diagnoses`
--

CREATE TABLE `opd_diagnoses` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                 `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `report_date` datetime NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opd_patient_departments`
--

CREATE TABLE `opd_patient_departments` (
                                           `id` int(10) UNSIGNED NOT NULL,
                                           `patient_id` int(10) UNSIGNED NOT NULL,
                                           `opd_number` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `bp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `symptoms` text COLLATE utf8mb4_unicode_ci,
                                           `notes` text COLLATE utf8mb4_unicode_ci,
                                           `appointment_date` datetime NOT NULL,
                                           `case_id` int(10) UNSIGNED DEFAULT NULL,
                                           `is_old_patient` tinyint(1) DEFAULT '0',
                                           `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
                                           `standard_charge` double NOT NULL,
                                           `payment_mode` tinyint(4) NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opd_timelines`
--

CREATE TABLE `opd_timelines` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
                                 `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `date` date NOT NULL,
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `visible_to_person` tinyint(1) NOT NULL DEFAULT '1',
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_reports`
--

CREATE TABLE `operation_reports` (
                                     `id` int(10) UNSIGNED NOT NULL,
                                     `patient_id` int(10) UNSIGNED NOT NULL,
                                     `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                     `date` datetime NOT NULL,
                                     `description` text COLLATE utf8mb4_unicode_ci,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci,
                            `discount` double NOT NULL,
                            `total_amount` double NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_services`
--

CREATE TABLE `package_services` (
                                    `id` bigint(20) UNSIGNED NOT NULL,
                                    `package_id` int(10) UNSIGNED NOT NULL,
                                    `service_id` int(10) UNSIGNED NOT NULL,
                                    `quantity` double NOT NULL,
                                    `rate` double NOT NULL,
                                    `amount` double NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
                                   `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_categories`
--

CREATE TABLE `pathology_categories` (
                                        `id` int(10) UNSIGNED NOT NULL,
                                        `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_tests`
--

CREATE TABLE `pathology_tests` (
                                   `id` int(10) UNSIGNED NOT NULL,
                                   `test_name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `test_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `category_id` int(10) UNSIGNED NOT NULL,
                                   `unit` int(11) DEFAULT NULL,
                                   `subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `report_days` int(11) DEFAULT NULL,
                                   `charge_category_id` int(10) UNSIGNED NOT NULL,
                                   `standard_charge` int(11) NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `user_id` bigint(20) UNSIGNED NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_admissions`
--

CREATE TABLE `patient_admissions` (
                                      `id` int(10) UNSIGNED NOT NULL,
                                      `patient_admission_id` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `patient_id` int(10) UNSIGNED NOT NULL,
                                      `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                      `admission_date` datetime NOT NULL,
                                      `discharge_date` datetime DEFAULT NULL,
                                      `package_id` int(10) UNSIGNED DEFAULT NULL,
                                      `insurance_id` int(10) UNSIGNED DEFAULT NULL,
                                      `bed_id` int(10) UNSIGNED DEFAULT NULL,
                                      `policy_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `agent_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `guardian_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `guardian_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `status` tinyint(1) DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_cases`
--

CREATE TABLE `patient_cases` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `case_id` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `patient_id` int(10) UNSIGNED NOT NULL,
                                 `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                 `date` datetime NOT NULL,
                                 `fee` double NOT NULL,
                                 `status` tinyint(1) NOT NULL DEFAULT '0',
                                 `description` text COLLATE utf8mb4_unicode_ci,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_diagnosis_properties`
--

CREATE TABLE `patient_diagnosis_properties` (
                                                `id` int(10) UNSIGNED NOT NULL,
                                                `patient_diagnosis_id` bigint(20) UNSIGNED NOT NULL,
                                                `property_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                `property_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_diagnosis_tests`
--

CREATE TABLE `patient_diagnosis_tests` (
                                           `id` bigint(20) UNSIGNED NOT NULL,
                                           `patient_id` int(10) UNSIGNED NOT NULL,
                                           `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                           `category_id` bigint(20) UNSIGNED NOT NULL,
                                           `report_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `payment_date` date NOT NULL,
                            `account_id` int(10) UNSIGNED NOT NULL,
                            `pay_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `amount` double NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
                                          `id` bigint(20) UNSIGNED NOT NULL,
                                          `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `tokenable_id` bigint(20) UNSIGNED NOT NULL,
                                          `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `abilities` text COLLATE utf8mb4_unicode_ci,
                                          `last_used_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacists`
--

CREATE TABLE `pharmacists` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `user_id` bigint(20) UNSIGNED NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postals`
--

CREATE TABLE `postals` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `from_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `to_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `date` date DEFAULT NULL,
                           `address` text COLLATE utf8mb4_unicode_ci,
                           `type` int(11) DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `patient_id` int(10) UNSIGNED NOT NULL,
                                 `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
                                 `food_allergies` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `tendency_bleed` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `heart_disease` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `high_blood_pressure` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `diabetic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `surgery` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `accident` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `others` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `medical_history` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `current_medication` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `female_pregnancy` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `breast_feeding` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `health_insurance` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `low_income` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `reference` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `status` tinyint(1) DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 `plus_rate` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `temperature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `problem_description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `test` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `advice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `next_visit_qty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `next_visit_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions_medicines`
--

CREATE TABLE `prescriptions_medicines` (
                                           `id` bigint(20) UNSIGNED NOT NULL,
                                           `prescription_id` int(10) UNSIGNED NOT NULL,
                                           `medicine` int(10) UNSIGNED NOT NULL,
                                           `dosage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_categories`
--

CREATE TABLE `radiology_categories` (
                                        `id` int(10) UNSIGNED NOT NULL,
                                        `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_tests`
--

CREATE TABLE `radiology_tests` (
                                   `id` int(10) UNSIGNED NOT NULL,
                                   `test_name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `test_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `category_id` int(10) UNSIGNED NOT NULL,
                                   `subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `report_days` int(11) DEFAULT NULL,
                                   `charge_category_id` int(10) UNSIGNED NOT NULL,
                                   `standard_charge` int(11) NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receptionists`
--

CREATE TABLE `receptionists` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `user_id` bigint(20) UNSIGNED NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
                                        `permission_id` bigint(20) UNSIGNED NOT NULL,
                                        `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `doctor_id` bigint(20) UNSIGNED NOT NULL,
                             `per_patient_time` time NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_days`
--

CREATE TABLE `schedule_days` (
                                 `id` bigint(20) UNSIGNED NOT NULL,
                                 `doctor_id` bigint(20) UNSIGNED NOT NULL,
                                 `schedule_id` int(10) UNSIGNED NOT NULL,
                                 `available_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `available_from` time NOT NULL,
                                 `available_to` time NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `description` text COLLATE utf8mb4_unicode_ci,
                            `quantity` int(11) NOT NULL,
                            `rate` int(11) NOT NULL,
                            `status` int(11) NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'country_code', '+91', '2022-12-01 06:36:25', '2022-12-01 06:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
                       `id` bigint(20) UNSIGNED NOT NULL,
                       `send_to` bigint(20) UNSIGNED DEFAULT NULL,
                       `region_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                       `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                       `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
                       `send_by` bigint(20) UNSIGNED NOT NULL,
                       `created_at` timestamp NULL DEFAULT NULL,
                       `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
                                 `id` bigint(20) UNSIGNED NOT NULL,
                                 `user_id` bigint(20) UNSIGNED NOT NULL,
                                 `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `quantity` int(11) DEFAULT NULL,
                                 `trial_ends_at` timestamp NULL DEFAULT NULL,
                                 `ends_at` timestamp NULL DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
                                      `id` bigint(20) UNSIGNED NOT NULL,
                                      `subscription_id` bigint(20) UNSIGNED NOT NULL,
                                      `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `quantity` int(11) DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `stripe_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `amount` int(11) NOT NULL,
                                `user_id` int(11) NOT NULL,
                                `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `meta` text COLLATE utf8mb4_unicode_ci,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `department_id` bigint(20) UNSIGNED DEFAULT NULL,
                         `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `gender` int(11) NOT NULL,
                         `qualification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `blood_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `dob` date DEFAULT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `owner_id` int(11) DEFAULT NULL,
                         `owner_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `status` tinyint(1) NOT NULL,
                         `language` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
                         `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `facebook_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `twitter_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `instagram_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `linkedIn_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `stripe_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `card_brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `trial_ends_at` timestamp NULL DEFAULT NULL,
                         `thememode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_zoom_credential`
--

CREATE TABLE `user_zoom_credential` (
                                        `id` bigint(20) UNSIGNED NOT NULL,
                                        `user_id` bigint(20) UNSIGNED NOT NULL,
                                        `zoom_api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `zoom_api_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccinated_patients`
--

CREATE TABLE `vaccinated_patients` (
                                       `id` int(10) UNSIGNED NOT NULL,
                                       `patient_id` int(10) UNSIGNED NOT NULL,
                                       `vaccination_id` int(10) UNSIGNED NOT NULL,
                                       `vaccination_serial_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `dose_number` bigint(20) NOT NULL,
                                       `dose_given_date` datetime NOT NULL,
                                       `description` text COLLATE utf8mb4_unicode_ci,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccinations`
--

CREATE TABLE `vaccinations` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `manufactured_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `purpose` int(11) NOT NULL,
                            `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `id_card` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `no_of_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `date` date DEFAULT NULL,
                            `in_time` time DEFAULT NULL,
                            `out_time` time DEFAULT NULL,
                            `note` text COLLATE utf8mb4_unicode_ci,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountants`
--
ALTER TABLE `accountants`
    ADD PRIMARY KEY (`id`),
  ADD KEY `accountants_user_id_foreign` (`user_id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
    ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_name_index` (`name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advanced_payments`
--
ALTER TABLE `advanced_payments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `advanced_payments_patient_id_foreign` (`patient_id`),
  ADD KEY `advanced_payments_amount_index` (`amount`);

--
-- Indexes for table `ambulances`
--
ALTER TABLE `ambulances`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ambulances_vehicle_number_index` (`vehicle_number`);

--
-- Indexes for table `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ambulance_calls_patient_id_foreign` (`patient_id`),
  ADD KEY `ambulance_calls_ambulance_id_foreign` (`ambulance_id`),
  ADD KEY `ambulance_calls_date_index` (`date`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_opd_date_index` (`opd_date`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_department_id_foreign` (`department_id`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
    ADD PRIMARY KEY (`id`),
  ADD KEY `beds_bed_type_foreign` (`bed_type`),
  ADD KEY `beds_is_available_index` (`is_available`);

--
-- Indexes for table `bed_assigns`
--
ALTER TABLE `bed_assigns`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bed_assigns_bed_id_foreign` (`bed_id`),
  ADD KEY `bed_assigns_patient_id_foreign` (`patient_id`),
  ADD KEY `bed_assigns_created_at_assign_date_index` (`created_at`,`assign_date`),
  ADD KEY `bed_assigns_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `bed_types`
--
ALTER TABLE `bed_types`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bed_types_title_index` (`title`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bills_patient_id_foreign` (`patient_id`),
  ADD KEY `bills_bill_date_index` (`bill_date`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_bill_id_foreign` (`bill_id`);

--
-- Indexes for table `birth_reports`
--
ALTER TABLE `birth_reports`
    ADD PRIMARY KEY (`id`),
  ADD KEY `birth_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `birth_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `birth_reports_date_index` (`date`);

--
-- Indexes for table `blood_banks`
--
ALTER TABLE `blood_banks`
    ADD PRIMARY KEY (`id`),
  ADD KEY `blood_banks_remained_bags_index` (`remained_bags`);

--
-- Indexes for table `blood_donations`
--
ALTER TABLE `blood_donations`
    ADD PRIMARY KEY (`id`),
  ADD KEY `blood_donations_blood_donor_id_foreign` (`blood_donor_id`);

--
-- Indexes for table `blood_donors`
--
ALTER TABLE `blood_donors`
    ADD PRIMARY KEY (`id`),
  ADD KEY `blood_donors_created_at_last_donate_date_index` (`created_at`,`last_donate_date`);

--
-- Indexes for table `blood_issues`
--
ALTER TABLE `blood_issues`
    ADD PRIMARY KEY (`id`),
  ADD KEY `blood_issues_doctor_id_foreign` (`doctor_id`),
  ADD KEY `blood_issues_donor_id_foreign` (`donor_id`),
  ADD KEY `blood_issues_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
    ADD PRIMARY KEY (`id`),
  ADD KEY `brands_name_index` (`name`);

--
-- Indexes for table `call_logs`
--
ALTER TABLE `call_logs`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_handlers`
--
ALTER TABLE `case_handlers`
    ADD PRIMARY KEY (`id`),
  ADD KEY `case_handlers_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `categories_name_index` (`name`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
    ADD PRIMARY KEY (`id`),
  ADD KEY `charges_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `charges_code_index` (`code`);

--
-- Indexes for table `charge_categories`
--
ALTER TABLE `charge_categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `charge_categories_name_index` (`name`);

--
-- Indexes for table `currency_settings`
--
ALTER TABLE `currency_settings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `death_reports`
--
ALTER TABLE `death_reports`
    ADD PRIMARY KEY (`id`),
  ADD KEY `death_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `death_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `death_reports_date_index` (`date`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnosis_categories`
--
ALTER TABLE `diagnosis_categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosis_categories_name_index` (`name`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
    ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`),
  ADD KEY `doctors_doctor_department_id_foreign` (`doctor_department_id`);

--
-- Indexes for table `doctor_departments`
--
ALTER TABLE `doctor_departments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_departments_title_index` (`title`);

--
-- Indexes for table `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
    ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_opd_charges_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doctor_opd_charges_created_at_index` (`created_at`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
    ADD PRIMARY KEY (`id`),
  ADD KEY `documents_uploaded_by_foreign` (`uploaded_by`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
    ADD PRIMARY KEY (`id`),
  ADD KEY `document_types_name_index` (`name`);

--
-- Indexes for table `employee_payrolls`
--
ALTER TABLE `employee_payrolls`
    ADD PRIMARY KEY (`id`),
  ADD KEY `employee_payrolls_id_sr_no_index` (`id`,`sr_no`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
    ADD PRIMARY KEY (`id`),
  ADD KEY `enquiries_viewed_by_foreign` (`viewed_by`),
  ADD KEY `enquiries_created_at_index` (`created_at`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_date_index` (`date`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `front_services`
--
ALTER TABLE `front_services`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_settings`
--
ALTER TABLE `front_settings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_schedules`
--
ALTER TABLE `hospital_schedules`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
    ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_date_index` (`date`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
    ADD PRIMARY KEY (`id`),
  ADD KEY `insurances_name_index` (`name`);

--
-- Indexes for table `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
    ADD PRIMARY KEY (`id`),
  ADD KEY `insurance_diseases_insurance_id_foreign` (`insurance_id`);

--
-- Indexes for table `investigation_reports`
--
ALTER TABLE `investigation_reports`
    ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `investigation_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `investigation_reports_date_index` (`date`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
    ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_patient_id_foreign` (`patient_id`),
  ADD KEY `invoices_invoice_date_index` (`invoice_date`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
    ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_account_id_foreign` (`account_id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `ipd_bills`
--
ALTER TABLE `ipd_bills`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_bills_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `ipd_charges`
--
ALTER TABLE `ipd_charges`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_charges_ipd_patient_department_id_foreign` (`ipd_patient_department_id`),
  ADD KEY `ipd_charges_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `ipd_charges_charge_id_foreign` (`charge_id`);

--
-- Indexes for table `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_consultant_registers_ipd_patient_department_id_foreign` (`ipd_patient_department_id`),
  ADD KEY `ipd_consultant_registers_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_diagnoses_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipd_patient_departments_ipd_number_unique` (`ipd_number`),
  ADD KEY `ipd_patient_departments_patient_id_foreign` (`patient_id`),
  ADD KEY `ipd_patient_departments_case_id_foreign` (`case_id`),
  ADD KEY `ipd_patient_departments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `ipd_patient_departments_bed_type_id_foreign` (`bed_type_id`),
  ADD KEY `ipd_patient_departments_bed_id_foreign` (`bed_id`);

--
-- Indexes for table `ipd_payments`
--
ALTER TABLE `ipd_payments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_payments_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_prescriptions_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_prescription_items_ipd_prescription_id_foreign` (`ipd_prescription_id`),
  ADD KEY `ipd_prescription_items_category_id_foreign` (`category_id`),
  ADD KEY `ipd_prescription_items_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_timelines_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indexes for table `issued_items`
--
ALTER TABLE `issued_items`
    ADD PRIMARY KEY (`id`),
  ADD KEY `issued_items_department_id_foreign` (`department_id`),
  ADD KEY `issued_items_user_id_foreign` (`user_id`),
  ADD KEY `issued_items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `issued_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
    ADD PRIMARY KEY (`id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_categories_name_unique` (`name`);

--
-- Indexes for table `item_stocks`
--
ALTER TABLE `item_stocks`
    ADD PRIMARY KEY (`id`),
  ADD KEY `item_stocks_item_category_id_foreign` (`item_category_id`),
  ADD KEY `item_stocks_item_id_foreign` (`item_id`);

--
-- Indexes for table `lab_technicians`
--
ALTER TABLE `lab_technicians`
    ADD PRIMARY KEY (`id`),
  ADD KEY `lab_technicians_user_id_foreign` (`user_id`);

--
-- Indexes for table `live_consultations`
--
ALTER TABLE `live_consultations`
    ADD PRIMARY KEY (`id`),
  ADD KEY `live_consultations_doctor_id_foreign` (`doctor_id`),
  ADD KEY `live_consultations_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `live_meetings`
--
ALTER TABLE `live_meetings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_meetings_candidates`
--
ALTER TABLE `live_meetings_candidates`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
    ADD PRIMARY KEY (`id`),
  ADD KEY `mails_user_id_foreign` (`user_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
    ADD PRIMARY KEY (`id`),
  ADD KEY `medicines_category_id_foreign` (`category_id`),
  ADD KEY `medicines_brand_id_foreign` (`brand_id`),
  ADD KEY `160` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
    ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD UNIQUE KEY `model_has_permissions_model_type_unique` (`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
    ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
    ADD PRIMARY KEY (`id`),
  ADD KEY `notice_boards_created_at_id_index` (`created_at`,`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
    ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `nurses_user_id_foreign` (`user_id`);

--
-- Indexes for table `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `opd_diagnoses_opd_patient_department_id_foreign` (`opd_patient_department_id`);

--
-- Indexes for table `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `opd_patient_departments_opd_number_unique` (`opd_number`),
  ADD KEY `opd_patient_departments_patient_id_foreign` (`patient_id`),
  ADD KEY `opd_patient_departments_case_id_foreign` (`case_id`),
  ADD KEY `opd_patient_departments_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `opd_timelines`
--
ALTER TABLE `opd_timelines`
    ADD PRIMARY KEY (`id`),
  ADD KEY `opd_timelines_opd_patient_department_id_foreign` (`opd_patient_department_id`);

--
-- Indexes for table `operation_reports`
--
ALTER TABLE `operation_reports`
    ADD PRIMARY KEY (`id`),
  ADD KEY `operation_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `operation_reports_date_index` (`date`),
  ADD KEY `operation_reports_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
    ADD PRIMARY KEY (`id`),
  ADD KEY `packages_created_at_name_index` (`created_at`,`name`);

--
-- Indexes for table `package_services`
--
ALTER TABLE `package_services`
    ADD PRIMARY KEY (`id`),
  ADD KEY `package_services_package_id_foreign` (`package_id`),
  ADD KEY `package_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
    ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pathology_categories`
--
ALTER TABLE `pathology_categories`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pathology_categories_name_unique` (`name`),
  ADD KEY `pathology_categories_name_index` (`name`);

--
-- Indexes for table `pathology_tests`
--
ALTER TABLE `pathology_tests`
    ADD PRIMARY KEY (`id`),
  ADD KEY `pathology_tests_category_id_foreign` (`category_id`),
  ADD KEY `pathology_tests_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `pathology_tests_test_name_index` (`test_name`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
    ADD PRIMARY KEY (`id`),
  ADD KEY `patients_user_id_foreign` (`user_id`);

--
-- Indexes for table `patient_admissions`
--
ALTER TABLE `patient_admissions`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_admissions_patient_admission_id_unique` (`patient_admission_id`),
  ADD KEY `patient_admissions_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_admissions_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_admissions_package_id_foreign` (`package_id`),
  ADD KEY `patient_admissions_insurance_id_foreign` (`insurance_id`),
  ADD KEY `patient_admissions_bed_id_foreign` (`bed_id`),
  ADD KEY `patient_admissions_admission_date_index` (`admission_date`);

--
-- Indexes for table `patient_cases`
--
ALTER TABLE `patient_cases`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_cases_case_id_unique` (`case_id`),
  ADD KEY `patient_cases_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_cases_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_cases_date_index` (`date`);

--
-- Indexes for table `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
    ADD PRIMARY KEY (`id`),
  ADD KEY `patient_diagnosis_properties_created_at_index` (`created_at`),
  ADD KEY `patient_diagnosis_properties_patient_diagnosis_id_foreign` (`patient_diagnosis_id`);

--
-- Indexes for table `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
    ADD PRIMARY KEY (`id`),
  ADD KEY `patient_diagnosis_tests_created_at_index` (`created_at`),
  ADD KEY `patient_diagnosis_tests_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_diagnosis_tests_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_diagnosis_tests_category_id_foreign` (`category_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `payments_account_id_foreign` (`account_id`),
  ADD KEY `payments_payment_date_index` (`payment_date`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pharmacists`
--
ALTER TABLE `pharmacists`
    ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacists_user_id_foreign` (`user_id`);

--
-- Indexes for table `postals`
--
ALTER TABLE `postals`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
    ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_patient_id_foreign` (`patient_id`),
  ADD KEY `prescriptions_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
    ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_medicines_prescription_id_foreign` (`prescription_id`),
  ADD KEY `prescriptions_medicines_medicine_foreign` (`medicine`);

--
-- Indexes for table `radiology_categories`
--
ALTER TABLE `radiology_categories`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `radiology_categories_name_unique` (`name`),
  ADD KEY `radiology_categories_name_index` (`name`);

--
-- Indexes for table `radiology_tests`
--
ALTER TABLE `radiology_tests`
    ADD PRIMARY KEY (`id`),
  ADD KEY `radiology_tests_category_id_foreign` (`category_id`),
  ADD KEY `radiology_tests_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `radiology_tests_test_name_index` (`test_name`);

--
-- Indexes for table `receptionists`
--
ALTER TABLE `receptionists`
    ADD PRIMARY KEY (`id`),
  ADD KEY `receptionists_user_id_foreign` (`user_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
    ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
    ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `schedule_days`
--
ALTER TABLE `schedule_days`
    ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_days_doctor_id_foreign` (`doctor_id`),
  ADD KEY `schedule_days_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
    ADD PRIMARY KEY (`id`),
  ADD KEY `services_name_index` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
    ADD PRIMARY KEY (`id`),
  ADD KEY `sms_send_to_foreign` (`send_to`),
  ADD KEY `sms_send_by_foreign` (`send_by`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
    ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `users_first_name_index` (`first_name`);

--
-- Indexes for table `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_zoom_credential_user_id_foreign` (`user_id`);

--
-- Indexes for table `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
    ADD PRIMARY KEY (`id`),
  ADD KEY `vaccinated_patients_id_index` (`id`),
  ADD KEY `vaccinated_patients_patient_id_index` (`patient_id`),
  ADD KEY `vaccinated_patients_vaccination_id_index` (`vaccination_id`);

--
-- Indexes for table `vaccinations`
--
ALTER TABLE `vaccinations`
    ADD PRIMARY KEY (`id`),
  ADD KEY `vaccinations_id_index` (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountants`
--
ALTER TABLE `accountants`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advanced_payments`
--
ALTER TABLE `advanced_payments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ambulances`
--
ALTER TABLE `ambulances`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_assigns`
--
ALTER TABLE `bed_assigns`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_types`
--
ALTER TABLE `bed_types`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `birth_reports`
--
ALTER TABLE `birth_reports`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_banks`
--
ALTER TABLE `blood_banks`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_donations`
--
ALTER TABLE `blood_donations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_donors`
--
ALTER TABLE `blood_donors`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_issues`
--
ALTER TABLE `blood_issues`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_logs`
--
ALTER TABLE `call_logs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_handlers`
--
ALTER TABLE `case_handlers`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_categories`
--
ALTER TABLE `charge_categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_settings`
--
ALTER TABLE `currency_settings`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `death_reports`
--
ALTER TABLE `death_reports`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnosis_categories`
--
ALTER TABLE `diagnosis_categories`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_departments`
--
ALTER TABLE `doctor_departments`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_payrolls`
--
ALTER TABLE `employee_payrolls`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_services`
--
ALTER TABLE `front_services`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_settings`
--
ALTER TABLE `front_settings`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_schedules`
--
ALTER TABLE `hospital_schedules`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investigation_reports`
--
ALTER TABLE `investigation_reports`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_bills`
--
ALTER TABLE `ipd_bills`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_charges`
--
ALTER TABLE `ipd_charges`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_payments`
--
ALTER TABLE `ipd_payments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issued_items`
--
ALTER TABLE `issued_items`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stocks`
--
ALTER TABLE `item_stocks`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_technicians`
--
ALTER TABLE `lab_technicians`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_consultations`
--
ALTER TABLE `live_consultations`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_meetings`
--
ALTER TABLE `live_meetings`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_meetings_candidates`
--
ALTER TABLE `live_meetings_candidates`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_timelines`
--
ALTER TABLE `opd_timelines`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_reports`
--
ALTER TABLE `operation_reports`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_services`
--
ALTER TABLE `package_services`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_categories`
--
ALTER TABLE `pathology_categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_tests`
--
ALTER TABLE `pathology_tests`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_admissions`
--
ALTER TABLE `patient_admissions`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_cases`
--
ALTER TABLE `patient_cases`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacists`
--
ALTER TABLE `pharmacists`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postals`
--
ALTER TABLE `postals`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_categories`
--
ALTER TABLE `radiology_categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_tests`
--
ALTER TABLE `radiology_tests`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receptionists`
--
ALTER TABLE `receptionists`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_days`
--
ALTER TABLE `schedule_days`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccinations`
--
ALTER TABLE `vaccinations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountants`
--
ALTER TABLE `accountants`
    ADD CONSTRAINT `accountants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advanced_payments`
--
ALTER TABLE `advanced_payments`
    ADD CONSTRAINT `advanced_payments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
    ADD CONSTRAINT `ambulance_calls_ambulance_id_foreign` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ambulance_calls_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
    ADD CONSTRAINT `appointments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `doctor_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beds`
--
ALTER TABLE `beds`
    ADD CONSTRAINT `beds_bed_type_foreign` FOREIGN KEY (`bed_type`) REFERENCES `bed_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bed_assigns`
--
ALTER TABLE `bed_assigns`
    ADD CONSTRAINT `bed_assigns_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_assigns_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_assigns_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
    ADD CONSTRAINT `bills_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
    ADD CONSTRAINT `bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `birth_reports`
--
ALTER TABLE `birth_reports`
    ADD CONSTRAINT `birth_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `birth_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blood_donations`
--
ALTER TABLE `blood_donations`
    ADD CONSTRAINT `blood_donations_blood_donor_id_foreign` FOREIGN KEY (`blood_donor_id`) REFERENCES `blood_donors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blood_issues`
--
ALTER TABLE `blood_issues`
    ADD CONSTRAINT `blood_issues_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_issues_donor_id_foreign` FOREIGN KEY (`donor_id`) REFERENCES `blood_donors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_issues_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `case_handlers`
--
ALTER TABLE `case_handlers`
    ADD CONSTRAINT `case_handlers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
    ADD CONSTRAINT `charges_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `death_reports`
--
ALTER TABLE `death_reports`
    ADD CONSTRAINT `death_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `death_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
    ADD CONSTRAINT `doctors_doctor_department_id_foreign` FOREIGN KEY (`doctor_department_id`) REFERENCES `doctor_departments` (`id`),
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
    ADD CONSTRAINT `doctor_opd_charges_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
    ADD CONSTRAINT `documents_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enquiries`
--
ALTER TABLE `enquiries`
    ADD CONSTRAINT `enquiries_viewed_by_foreign` FOREIGN KEY (`viewed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
    ADD CONSTRAINT `insurance_diseases_insurance_id_foreign` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investigation_reports`
--
ALTER TABLE `investigation_reports`
    ADD CONSTRAINT `investigation_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
    ADD CONSTRAINT `invoices_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
    ADD CONSTRAINT `invoice_items_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_bills`
--
ALTER TABLE `ipd_bills`
    ADD CONSTRAINT `ipd_bills_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_charges`
--
ALTER TABLE `ipd_charges`
    ADD CONSTRAINT `ipd_charges_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_charges_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_charges_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
    ADD CONSTRAINT `ipd_consultant_registers_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_consultant_registers_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
    ADD CONSTRAINT `ipd_diagnoses_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
    ADD CONSTRAINT `ipd_patient_departments_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_bed_type_id_foreign` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `patient_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_payments`
--
ALTER TABLE `ipd_payments`
    ADD CONSTRAINT `ipd_payments_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
    ADD CONSTRAINT `ipd_prescriptions_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
    ADD CONSTRAINT `ipd_prescription_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_prescription_items_ipd_prescription_id_foreign` FOREIGN KEY (`ipd_prescription_id`) REFERENCES `ipd_prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_prescription_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
    ADD CONSTRAINT `ipd_timelines_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issued_items`
--
ALTER TABLE `issued_items`
    ADD CONSTRAINT `issued_items_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
    ADD CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_stocks`
--
ALTER TABLE `item_stocks`
    ADD CONSTRAINT `item_stocks_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_stocks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab_technicians`
--
ALTER TABLE `lab_technicians`
    ADD CONSTRAINT `lab_technicians_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_consultations`
--
ALTER TABLE `live_consultations`
    ADD CONSTRAINT `live_consultations_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `live_consultations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mails`
--
ALTER TABLE `mails`
    ADD CONSTRAINT `mails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
    ADD CONSTRAINT `medicines_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `medicines_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
    ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
    ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
    ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
    ADD CONSTRAINT `nurses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
    ADD CONSTRAINT `opd_diagnoses_opd_patient_department_id_foreign` FOREIGN KEY (`opd_patient_department_id`) REFERENCES `opd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
    ADD CONSTRAINT `opd_patient_departments_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `patient_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opd_patient_departments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opd_patient_departments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `opd_timelines`
--
ALTER TABLE `opd_timelines`
    ADD CONSTRAINT `opd_timelines_opd_patient_department_id_foreign` FOREIGN KEY (`opd_patient_department_id`) REFERENCES `opd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `operation_reports`
--
ALTER TABLE `operation_reports`
    ADD CONSTRAINT `operation_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operation_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_services`
--
ALTER TABLE `package_services`
    ADD CONSTRAINT `package_services_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pathology_tests`
--
ALTER TABLE `pathology_tests`
    ADD CONSTRAINT `pathology_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pathology_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pathology_tests_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
    ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_admissions`
--
ALTER TABLE `patient_admissions`
    ADD CONSTRAINT `patient_admissions_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_insurance_id_foreign` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_cases`
--
ALTER TABLE `patient_cases`
    ADD CONSTRAINT `patient_cases_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_cases_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
    ADD CONSTRAINT `patient_diagnosis_properties_patient_diagnosis_id_foreign` FOREIGN KEY (`patient_diagnosis_id`) REFERENCES `patient_diagnosis_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
    ADD CONSTRAINT `patient_diagnosis_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `diagnosis_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_diagnosis_tests_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_diagnosis_tests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
    ADD CONSTRAINT `payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharmacists`
--
ALTER TABLE `pharmacists`
    ADD CONSTRAINT `pharmacists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
    ADD CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions_medicines`
--
ALTER TABLE `prescriptions_medicines`
    ADD CONSTRAINT `prescriptions_medicines_medicine_foreign` FOREIGN KEY (`medicine`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_medicines_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `radiology_tests`
--
ALTER TABLE `radiology_tests`
    ADD CONSTRAINT `radiology_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `radiology_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radiology_tests_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receptionists`
--
ALTER TABLE `receptionists`
    ADD CONSTRAINT `receptionists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
    ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
    ADD CONSTRAINT `schedules_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule_days`
--
ALTER TABLE `schedule_days`
    ADD CONSTRAINT `schedule_days_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_days_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sms`
--
ALTER TABLE `sms`
    ADD CONSTRAINT `sms_send_by_foreign` FOREIGN KEY (`send_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sms_send_to_foreign` FOREIGN KEY (`send_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
    ADD CONSTRAINT `user_zoom_credential_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
    ADD CONSTRAINT `vaccinated_patients_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vaccinated_patients_vaccination_id_foreign` FOREIGN KEY (`vaccination_id`) REFERENCES `vaccinations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
