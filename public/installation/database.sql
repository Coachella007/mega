-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2023 at 03:55 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `credhyip`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Finance',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form_submissions`
--

CREATE TABLE `contact_form_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `converted_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '62b9d28e4d687',
  `payment_screenshot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `shortcodes_subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `status`, `shortcodes_subject`, `shortcodes_body`, `created_at`, `updated_at`) VALUES
(1, 'verification_mail', 'Verify Your Email', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Bellow is your verification link {{$verification_link}} , It expires in 15 minutes</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$verification_link}}', NULL, '2022-07-09 11:16:59'),
(2, 'welcome_mail', 'Welcome to {{$website_name}}', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Welcome to {{$website_name}}! Your registration was successful, please login to your account</p>', 'enabled', '{{$website_name}}', '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$website_name}}', NULL, '2022-07-09 11:17:17'),
(3, 'password_reset_mail', 'Forgot Password', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Bellow is your password reset link {{$reset_link}} , It expires in 15 minutes</p><p>Contact an admin if you do not recognize this activity</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$reset_link}}', NULL, '2022-07-09 11:16:34'),
(4, 'temp_password_mail', 'Temporary Password', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Bellow is your temporary password <strong>{{$temp_password}}</strong></p><p>Login into your account with this password and change your password to somehting you can remember</p><p>Contact an admin if you do not recognize this activity</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$temp_password}}', NULL, '2022-07-09 11:16:47'),
(5, 'password_changed_mail', 'Your Password Has Been Changed', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your password was recently changed, contact an admin if you do not recognize this activity.</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}', NULL, '2022-07-09 11:17:55'),
(6, 'new_id_upload_user', 'Identity Verification Documents Submitted', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your identity verification documents has been submitted, please wait while an admin review your documents. You will be notified by email as soon as they are reviewed</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}', NULL, '2022-07-09 11:13:58'),
(7, 'new_id_upload_admin', 'Identity Verification Documents Submitted', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>{{$user}} has submitted new identity documents, login to review them</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$user}}', NULL, '2022-07-09 11:13:40'),
(8, 'new_referral_mail', 'You Have A New Referral', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>You have a new referral Name: {{$name}}&nbsp;<br>Email: {{$email}}&nbsp;<br>Account ID: {{$account_id}}&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$name}}                  \r\n                            {{$email}}                  \r\n                            {{$account_id}}', NULL, '2022-07-09 11:15:03'),
(9, 'new_transaction_mail', 'Transaction Notification', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>A new transaction has occurred on your account. Please find the details below Amount: {{$amount}}&nbsp;<br>Type: {{$type}}&nbsp;<br>Method: {{$method}}&nbsp;<br>Balance: {{$balance}}&nbsp;<br>Transaction ID: {{$txn_id}}&nbsp;<br>Remark: {{$remark}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'disabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$type}}                  \r\n                            {{$method}}                  \r\n                            {{$balance}}                  \r\n                            {{$txn_id}}                  \r\n                            {{$remark}}                  \r\n                            {{$date}}', NULL, '2022-09-07 23:42:52'),
(10, 'id_processed_mail', 'KYC Document {{$status}}', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your verification request has been processed, please find the detail below.&nbsp;</p><p><strong>Status:</strong> {{$status}}&nbsp;<br><strong>Comment:</strong> {{$comment}}&nbsp;<br><strong>Date:</strong> {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', '{{$status}}', '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$status}}                  \r\n                            {{$comment}}                  \r\n                            {{$date}}', NULL, '2022-07-09 11:43:17'),
(11, 'new_deposit_mail', 'Deposit Request Successful', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your deposit request was successful, you will be notified by email once an admin reviews the payment. Find the deposit details below; Amount: {{$amount}}&nbsp;<br>Method: {{$method}}&nbsp;<br>Payment Method Amount: {{$converted_amount}}&nbsp;<br>Charge: {{$charge}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$method}}                  \r\n                            {{$converted_amount}}                  \r\n                            {{$charge}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}', NULL, '2022-07-09 11:12:03'),
(12, 'new_deposit_mail_admin', 'New Deposit Notification', '<h2>Hello Admin,</h2><p>{{$first_name}} {{$last_name}} has made new deposit, login to approve the deposit Amount: {{$amount}}&nbsp;<br>Method: {{$method}}&nbsp;<br>Payment Method Amount: {{$converted_amount}}&nbsp;<br>Charge: {{$charge}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$method}}                  \r\n                            {{$converted_amount}}                  \r\n                            {{$charge}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}', NULL, '2022-07-09 11:12:36'),
(13, 'deposit_rejected_mail', 'Deposit Rejected', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your deposit request has been reviewed and rejected by an admin. Find the deposit details below; Amount: {{$amount}}&nbsp;<br>Method: {{$method}}&nbsp;<br>Payment Method Amount: {{$converted_amount}}&nbsp;<br>Charge: {{$charge}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>Addtional Info: {{$additional_info}}&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$method}}                  \r\n                            {{$converted_amount}}                  \r\n                            {{$charge}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}                  \r\n                            {{$additional_info}}', NULL, '2022-07-09 11:09:39'),
(14, 'deposit_approved_mail', 'Deposit Request Approved', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your deposit request has been reviewed and approved by an admin. Find the deposit details below;&nbsp;</p><p><strong>Amount:</strong> {{$amount}}&nbsp;<br><strong>Method</strong>: {{$method}}&nbsp;<br><strong>Payment Method Amount:</strong> {{$converted_amount}}&nbsp;<br><strong>Charge:</strong> {{$charge}}&nbsp;<br><strong>Status:</strong> {{$status}}&nbsp;<br><strong>Date: </strong>{{$date}}&nbsp;<br><strong>Addtional Info:</strong> {{$additional_info}}&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$method}}                  \r\n                            {{$converted_amount}}                  \r\n                            {{$charge}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}                  \r\n                            {{$additional_info}}', NULL, '2022-08-19 22:31:01'),
(15, 'otp_mail', 'One Time Passcode (OTP)', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Bellow is your One Time Passcode (OTP) <strong>{{$otp}}</strong> , It expires in 15 minutes</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$otp}}', NULL, '2022-07-09 11:16:14'),
(16, 'new_loan_request_mail', 'New Loan Request Submitted', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your loan request was successful, you will be notified by email once an admin reviews an admin reviews your request. Find the details below; Amount: {{$amount}}&nbsp;<br>Interest: {{$interest}}<br>Repayment Date: {{$repayment_date}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$interest}}                  \r\n                            {{$repayment_date}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}', '2022-07-06 19:47:38', '2022-07-09 11:14:15'),
(17, 'new_loan_request_mail_admin', 'New Loan Request Submitted', '<h2>Dear Admin,</h2><p>{{$first_name}} {{$last_name}} has made a new loan request. Find the details below; Amount: {{$amount}}&nbsp;<br>Interest: {{$interest}}<br>Repayment Date: {{$repayment_date}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$interest}}                  \r\n                            {{$repayment_date}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}', '2022-07-06 19:47:38', '2022-07-09 11:14:49'),
(18, 'loan_processed_mail', 'Loan Request Processed', '<h2>Dear {{$first_name}} {{$last_name}},</h2><p>Your loan request has been processed. Find the details below; Amount: {{$amount}}&nbsp;<br>Interest: {{$interest}}<br>Repayment Date: {{$repayment_date}}&nbsp;<br>Status: {{$status}}&nbsp;<br>Date: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$first_name}}                  \r\n                            {{$last_name}}                  \r\n                            {{$amount}}                  \r\n                            {{$interest}}                  \r\n                            {{$repayment_date}}                  \r\n                            {{$status}}                  \r\n                            {{$date}}', '2022-07-07 20:20:30', '2022-07-09 11:11:34'),
(19, 'new_withdrawal_mail', 'Withdrawal Request Successful', '<h2>Dear {{$first_name}} {{$last_name}},</h2>\r\n\r\n<p>Your withdrawal request was successful, you will be notified by email once an admin reviews the request. Find the deposit details below; \r\n\r\nAmount: {{$amount}}&nbsp;<br>\r\nFee: {{$fee}}&nbsp;<br>\r\nTotal: {{$total}}&nbsp;<br>\r\nWallet: {{$wallet}}&nbsp;<br>\r\n{{$wallet_info}}&nbsp;<br>\r\nTXN ID: {{$txn_id}}&nbsp;<br>\r\nStatus: {{$status}}&nbsp;<br>\r\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$amount}}\n{{$fee}}\n{{$total}}\n{{$wallet}}\n{{$wallet_info}}\n{{$txn_id}}\n{{$status}}\n{{$date}}', '2022-07-22 12:15:15', '2022-07-22 12:15:15'),
(20, 'new_withdrawal_mail_admin', 'New Withdrawal Notification', '<h2>Dear Admin,</h2>\r\n\r\n<p>{{$first_name}} {{$last_name}} has placed a withdrawal request. Login to approve or decline the request. Find the deposit details below; \r\n\r\nAmount: {{$amount}}&nbsp;<br>\r\nFee: {{$fee}}&nbsp;<br>\r\nTotal: {{$total}}&nbsp;<br>\r\nWallet: {{$wallet}}&nbsp;<br>\r\n{{$wallet_info}}&nbsp;<br>\r\nTXN ID: {{$txn_id}}&nbsp;<br>\r\nStatus: {{$status}}&nbsp;<br>\r\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$amount}}\r\n{{$fee}}\r\n{{$total}}\r\n{{$wallet}}\r\n{{$wallet_info}}\r\n{{$txn_id}}\r\n{{$status}}\r\n{{$date}}', '2022-07-22 12:50:35', '2022-07-22 12:50:35'),
(21, 'withdrawal_processed_mail', 'Withdrawal Processed', '<h2>Dear {{$first_name}} {{$last_name}},</h2>\r\n\r\n<p>Your withdrawal request has been processed. Find the deposit details below; \r\n\r\nAmount: {{$amount}}&nbsp;<br>\r\nFee: {{$fee}}&nbsp;<br>\r\nTotal: {{$total}}&nbsp;<br>\r\nWallet: {{$wallet}}&nbsp;<br>\r\n{{$wallet_info}}&nbsp;<br>\r\nTXN ID: {{$txn_id}}&nbsp;<br>\r\nStatus: {{$status}}&nbsp;<br>\r\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', NULL, '{{$amount}}\r\n{{$fee}}\r\n{{$total}}\r\n{{$wallet}}\r\n{{$wallet_info}}\r\n{{$txn_id}}\r\n{{$status}}\r\n{{$date}}', '2022-07-23 02:15:46', '2022-07-23 02:15:46'),
(24, 'new_ticket_mail', 'Support Ticket [{{$ticket_id}}] Received', '<h2>Dear {{$first_name}} {{$last_name}},</h2>\n\n<p>Your Support Ticket has been received. Find the ticket details below; \n\nTicket ID: {{$ticket_id}}&nbsp;<br>\nSubject: {{$subject}}&nbsp;<br>\nMessage: <br>\n{{$message}}\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', '{{$ticket_id}}', '{{$first_name}}\r\n{{$last_name}}\r\n{{$ticket_id}}\r\n{{$subject}}\r\n{{$message}}\r\n{{$date}}', '2022-07-25 10:07:31', '2022-07-25 10:07:31'),
(25, 'new_ticket_mail_admin', 'New Support Ticket [{{$ticket_id}}] Submitted', '<h2>Dear Admin,</h2>\n\n<p>{{$first_name}} {{$last_name}} has submitted a new support ticket. Find the ticket details below; \n\nTicket ID: {{$ticket_id}}&nbsp;<br>\nSubject: {{$subject}}&nbsp;<br>\nMessage: <br>\n{{$message}}\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', '{{$ticket_id}}', '{{$first_name}}\n{{$last_name}}\n{{$ticket_id}}\n{{$subject}}\n{{$message}}\n{{$date}}', '2022-07-25 10:07:32', '2022-07-25 10:07:32'),
(28, 'new_ticket_reply_mail', 'Support Ticket [{{$ticket_id}}] Updated', '<h2>Dear {{$first_name}} {{$last_name}},</h2>\r\n\r\n<p>Your Support Ticket has been updated. Find the ticket details below; \r\n\r\nTicket ID: {{$ticket_id}}&nbsp;<br>\r\nSubject: {{$subject}}&nbsp;<br>\r\nMessage: <br>\r\n{{$message}}\r\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', '{{$ticket_id}}', '{{$first_name}}\r\n{{$last_name}}\r\n{{$ticket_id}}\r\n{{$subject}}\r\n{{$message}}\r\n{{$date}}', '2022-07-25 21:59:06', '2022-07-25 21:59:06'),
(29, 'new_ticket_reply_mail_admin', 'Support Ticket [{{$ticket_id}}] Updated', '<h2>Dear Admin,</h2>\r\n\r\n<p>{{$first_name}} {{$last_name}} has updated Ticket  {{$ticket_id}}. Find the ticket details below; \r\n\r\nTicket ID: {{$ticket_id}}&nbsp;<br>\r\nSubject: {{$subject}}&nbsp;<br>\r\nMessage: <br>\r\n{{$message}}\r\nDate: {{$date}}&nbsp;<br>&nbsp;</p>', 'enabled', '{{$ticket_id}}', '{{$first_name}}\r\n{{$last_name}}\r\n{{$ticket_id}}\r\n{{$subject}}\r\n{{$message}}\r\n{{$date}}', '2022-07-25 21:59:06', '2022-07-25 21:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_profit_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_profit_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profit_per_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_intervals` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_intervals_given` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_profit_earned` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_plans`
--

CREATE TABLE `investment_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
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
-- Table structure for table `manual_deposit_methods`
--

CREATE TABLE `manual_deposit_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '5',
  `charge_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gbp',
  `wallet_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `network_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_instruction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_deposit_methods`
--

INSERT INTO `manual_deposit_methods` (`id`, `name`, `class`, `type`, `status`, `min_amount`, `max_amount`, `charge`, `charge_type`, `currency`, `wallet_address`, `network_type`, `payment_instruction`, `bank_name`, `account_name`, `account_no`, `sort_code`, `bank_code`, `logo`, `created_at`, `updated_at`) VALUES
(7, 'Paystack', 'gateway', 'paystack', 'active', '100', '100000', '2.1', 'percent', 'ngn', NULL, NULL, '<p>You will be redirected to paystack to complete your deposit</p>', NULL, NULL, NULL, NULL, NULL, 'paystack.png', '2022-06-27 14:42:23', '2022-10-30 11:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `content`, `pages`, `created_at`, `updated_at`) VALUES
(1, 'hero', '{\"section_heading\":\"Bitcoin Investment is the future\",\"section_text\":\"<p>Credhyip is the industry leading crypto investment company. Investing in crypto shouldnt be hard, we have best algorithin for profitable trading. Invest with a reliable company today! We are reliable Not sure when to start? Start now!<\\/p>\",\"section_button_text\":\"Sign up\",\"section_button_url\":\"https:\\/\\/credhyip.local\\/register\",\"section_bg_img\":\"hero-bg-1669111854.png\"}', '[\"home\"]', '2022-08-31 22:36:23', '2022-09-16 19:03:03'),
(2, 'about', '{\"section_heading\":\"About <span>Us<\\/span>\",\"section_text\":\"<p>CredHYIP is an established international financial brokage company. We specialise in profitable cryptocurrency trading, mining, investment and foresting trading. We have a team of competent traders.<\\/p><p>We are determined to providing conducive investment to our esteemed investors, minimising losses, and offerring safe investmets. With our edge cutting technology, we are able to automate trading, investments and returns. With Credhyip, there is guaranteed return on investment.<\\/p>\",\"section_button_text\":\"Learn More\",\"section_button_url\":\"\\/about\",\"section_bg_img\":\"about-bg-1669112114.png\"}', '[\"about\",\"contact\",\"home\",\"plans\"]', '2022-08-31 22:36:23', '2022-09-17 19:30:46'),
(3, 'plans', '{\"section_heading\":\"Investment <span>Plans<\\/span>\",\"section_text\":\"<p>To start earning, you should pick an investment plan. We have plans for all pocket sizes<\\/p>\"}', '[\"home\",\"plans\"]', '2022-08-31 22:36:23', '2022-09-17 19:32:11'),
(4, 'why', '{\"section_heading\":\"Why Choose <span>CredHYIP<\\/span>?\",\"section_text\":\"<p>We are committed to proving conducive ivesting ground for all our users. Invest today<\\/p>\",\"whys\":[{\"icon\":\"M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z\",\"title\":\"Realiable\",\"text\":\"We are a reliable trading company\"},{\"icon\":\"M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z\",\"title\":\"Legal Company\",\"text\":\"We are a legal trading company\"},{\"icon\":\"M13 10V3L4 14h7v7l9-11h-7z\",\"title\":\"Quick Withdrawal\",\"text\":\"All payout are processed and paid out within 24 hours\"},{\"icon\":\"M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z\",\"title\":\"Trusted\",\"text\":\"We are trusted over 2 million investor worldwide\"},{\"icon\":\"M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z\",\"title\":\"Referral Commission\",\"text\":\"Earn 5% referral commission when you refer your family and friends\"},{\"icon\":\"M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m0 0L11 14h4a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2v4l.586-.586z\",\"title\":\"24\\/7 Support\",\"text\":\"We are available 24\\/7 to attend to your support request through various channels\"}]}', '[\"about\",\"home\"]', '2022-08-31 22:36:23', '2022-09-17 19:29:00'),
(5, 'how', '{\"section_heading\":\"How To <span>Invest<\\/span> With CredHYIP\",\"section_text\":\"<p>Investing with CredHYIP is very easy. Follow the steps below to start investing<\\/p>\",\"steps\":{\"register\":{\"icon\":\"M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z\",\"text\":\"Sign up for an account by going to the signup page and fill in your details\"},\"fund_wallet\":{\"icon\":\"M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z\",\"text\":\"Fund your trading wallet by depositing money to your account\"},\"invest\":{\"icon\":\"M13 7h8m0 0v8m0-8l-8 8-4-4-6 6\",\"text\":\"Choose from our various investment plans and start earning\"},\"withdraw\":{\"icon\":\"M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9\",\"text\":\"Withdraw money through your preferred method\"}}}', '[\"about\",\"home\",\"plans\"]', '2022-08-31 22:36:24', '2022-09-17 16:09:50'),
(6, 'calculator', '{\"section_heading\":\"Profit  <span>Calculator<\\/span>\",\"section_text\":\"<p>Find out how much you will be making from your investment using our profit calculator below<\\/p>\"}', '[\"contact\",\"home\",\"plans\"]', '2022-08-31 22:36:24', '2022-09-17 19:27:47'),
(7, 'faq', '{\"section_heading\":\"Frequently <span>Asked<\\/span> Questions\",\"section_text\":\"<p>Below are frequently asked questions from our users<\\/p>\"}', '[\"about\",\"contact\",\"home\",\"plans\"]', '2022-08-31 22:36:24', '2022-11-17 20:22:00'),
(8, 'deposit_withdraw', '{\"section_heading\":\"Latest Deposits and Withdrawals\",\"section_text\":\"<p>Below are recent deposits and withdrawals from members<\\/p>\"}', '[\"home\",\"plans\"]', '2022-08-31 22:36:24', '2022-09-17 21:48:03'),
(9, 'deposit_methods', '{\"section_heading\":\"Payment Methods\",\"section_text\":\"<p>We accept the following deposit methods<\\/p>\"}', '[\"home\",\"plans\"]', '2022-08-31 22:36:24', '2022-09-17 23:06:41'),
(10, 'newsletter', '{\"section_heading\":\"Join Our Newsletter\",\"section_text\":\"<p>join our newsletter to receive update from us<\\/p>\"}', '[\"blog\",\"blog_detail\",\"plans\",\"about\",\"contact\",\"home\"]', '2022-08-31 22:36:24', '2022-09-16 18:36:02'),
(11, 'loan_plans', '{\"section_heading\":\"Loan <span>Plans<\\/span>\",\"section_text\":\"<p>We have loans to assist you get started in your investing journey<\\/p>\"}', '[\"home\",\"plans\"]', '2022-08-31 23:20:17', '2022-09-17 19:33:38'),
(12, 'testimonials', '{\"section_heading\":\"Testimonials\",\"section_text\":\"<p>Bellow is what our esteamed investors are saying<\\/p>\"}', '[\"about\",\"home\",\"plans\"]', '2022-09-01 01:17:35', '2022-09-17 21:59:42'),
(13, 'teams', '{\"section_heading\":\"Our <span>Team<\\/span>\",\"section_text\":\"<p>Our team is made of expert traders, with several years of experience in trading and financial management<\\/p>\"}', '[\"about\",\"home\",\"plans\"]', '2022-09-01 01:17:35', '2022-09-17 19:25:37'),
(14, 'blog', '{\"section_heading\":\"Latest Financial Updates\",\"section_text\":\"<p>Read latest financial news update from our blog<\\/p>\"}', '[\"about\",\"blog\",\"blog_detail\",\"contact\",\"home\",\"plans\"]', '2022-09-01 01:17:35', '2022-09-17 22:39:04'),
(15, 'stats', '{\"section_heading\":\"Our stats speaks volume\",\"section_text\":\"<p>We are proud to serve you since inception<\\/p>\",\"counters\":[{\"icon\":\"M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z\",\"title\":\"Users\",\"count\":\"1234\"},{\"icon\":\"M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4\",\"title\":\"Deposits\",\"count\":\"687300\"},{\"icon\":\"M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12\",\"title\":\"Withdrawals\",\"count\":\"47833783\"}]}', '[\"home\",\"plans\",\"about\"]', '2022-09-05 13:33:26', '2022-09-16 18:35:48'),
(16, 'breadcrumb', '{\"section_bg_img\":\"breadcrumb.jpg\"}', '[\"blog\",\"blog_detail\",\"plans\",\"about\",\"contact\"]', '2022-09-05 15:11:15', '2022-09-16 18:50:11'),
(17, 'contact', '{\"section_heading\":\"Get In Touch\",\"section_text\":\"<p>Fill the form below to make inquirires. You can also contact us via livechat, email, support ticket or using the contact details below.<\\/p>\"}', '[\"blog_detail\",\"contact\",\"home\",\"plans\"]', '2022-09-05 15:39:33', '2022-09-17 23:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `star_rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance_after_transaction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_bal` double(50,10) NOT NULL,
  `email_verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referred_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g2fa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disabled',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `profile_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verify_tokens`
--

CREATE TABLE `verify_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhook_payments`
--

CREATE TABLE `webhook_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_settings`
--

CREATE TABLE `website_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_settings`
--

INSERT INTO `website_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'website_name', 'CredCrypto', NULL, '2022-10-13 06:14:10'),
(3, 'google_captcha', 'disabled', NULL, '2022-09-10 13:09:43'),
(4, 'email_verification', 'disabled', NULL, '2022-08-20 12:29:18'),
(5, 'register_bonus', '10', NULL, NULL),
(6, 'general_currency', 'USD', NULL, '2022-11-06 10:53:52'),
(7, 'id_verification', 'disabled', NULL, '2022-08-20 12:29:18'),
(8, 'website_email', 'support@credcrypto.net', NULL, '2022-10-13 06:14:11'),
(9, 'website_phone_no', '567890345677', NULL, '2022-08-21 09:31:41'),
(10, 'website_contact_address', 'No 20. Kings Way, Lagos', NULL, NULL),
(11, 'cron', '1668009482', NULL, '2022-11-09 14:58:02'),
(14, 'decimal_places', '2', NULL, NULL),
(15, 'ref_bonus', '10', '2022-06-26 17:54:19', '2022-06-26 17:54:19'),
(16, 'paypal_sand_box_client_id', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2022-06-27 09:54:11', '2022-06-27 09:54:11'),
(17, 'paypal_sand_box_client_secret', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2022-06-27 09:54:11', '2022-06-27 09:54:11'),
(18, 'paypal_live_client_id', 'XXXXXy', '2022-06-27 09:54:11', '2022-07-19 13:44:05'),
(19, 'paypal_live_client_secret', 'XXXXXXy', '2022-06-27 09:52:39', '2022-07-19 13:44:06'),
(20, 'paypal_mode', 'sandbox', '2022-06-27 09:54:11', '2022-06-27 09:54:11'),
(23, 'paypal_sand_box_app_id', 'App-xxxxxxxxxxxxxx', '2022-06-27 09:59:30', '2022-06-27 09:59:30'),
(24, 'paypal_live_app_id', 'XXXXy', '2022-06-27 09:59:30', '2022-07-19 13:44:06'),
(25, 'balance_transfer', 'disabled', NULL, NULL),
(26, 'transfer_auto_approve', 'enabled', NULL, '2022-07-19 20:57:40'),
(27, 'min_transfer', '5', NULL, NULL),
(28, 'max_transfer', '5000', NULL, NULL),
(29, 'transfer_fee_type', 'percent', NULL, NULL),
(30, 'transfer_fee', '1.5', NULL, '2022-08-21 14:24:14'),
(31, 'theme', 'cryptic', NULL, '2022-10-18 02:08:59'),
(32, 'transfer_otp', 'disabled', NULL, '2022-08-20 12:29:19'),
(33, 'withdrawal_otp', 'disabled', NULL, '2022-08-20 12:29:19'),
(34, 'multiple_loans', 'disabled', '2022-07-06 14:19:02', '2022-07-19 22:07:36'),
(35, 'loan_otp', 'disabled', '2022-07-06 14:19:03', '2022-08-20 12:29:19'),
(36, 'loan', 'disabled', '2022-07-09 07:26:37', '2022-07-09 07:26:37'),
(37, 'login_otp_user', 'disabled', '2022-07-19 22:27:08', '2022-08-20 12:25:23'),
(38, 'login_otp_admin', 'disabled', '2022-07-19 22:27:08', '2022-07-19 22:27:08'),
(39, 'livechat', 'enabled', '2022-07-20 04:52:01', '2022-08-21 20:21:07'),
(41, 'auto_blog', 'enabled', '2022-07-21 12:18:47', '2022-07-21 12:18:47'),
(42, 'withdrawal_fee', '2.55', '2022-07-21 21:53:46', '2022-08-21 15:01:47'),
(43, 'withdrawal_fee_type', 'percent', '2022-07-21 21:53:46', '2022-07-21 21:53:46'),
(44, 'min_withdrawal', '50', '2022-07-22 09:53:56', '2022-07-22 09:53:56'),
(45, 'max_withdrawal', '500', '2022-07-22 09:53:56', '2022-07-22 09:53:56'),
(46, 'auto_delete_expired_investments', 'disabled', '2022-07-29 13:45:19', '2022-07-29 13:45:19'),
(49, 'whatsapp', '{\"status\":\"enabled\",\"no\":\"2348052931576\",\"message\":\"Welcome to CredCrypto!\\r\\n\\r\\nHow may I help you today?\"}', '2022-08-22 11:53:59', '2022-11-06 02:18:37'),
(50, 'meta', '{\"logo\":\"logo.png\",\"logo_rec\":\"logo-rec.png\",\"favicon\":\"favicon.png\",\"keywords\":\"Bitcoin Investment, crypto investment management, investment, crypto investment\",\"description\":\"Credhyip Pro is a crypto investment and trading company majoring in trading, investing and mining crypto currencys\",\"robots\":\"all\",\"banner\":\"banner-1667305767.png\"}', '2022-06-26 17:54:19', '2022-11-01 11:29:27'),
(51, 'trader_mode', 'disabled', '2022-10-18 02:51:27', '2022-10-18 02:51:27'),
(52, 'email_queue', 'disabled', '2023-03-09 15:54:30', '2023-03-09 15:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_wallets`
--

CREATE TABLE `withdrawal_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form_submissions`
--
ALTER TABLE `contact_form_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investments_user_id_foreign` (`user_id`);

--
-- Indexes for table `investment_plans`
--
ALTER TABLE `investment_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `manual_deposit_methods`
--
ALTER TABLE `manual_deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_account_id_unique` (`account_id`);

--
-- Indexes for table `verify_tokens`
--
ALTER TABLE `verify_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `webhook_payments`
--
ALTER TABLE `webhook_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdrawal_wallets`
--
ALTER TABLE `withdrawal_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_wallets_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_form_submissions`
--
ALTER TABLE `contact_form_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investment_plans`
--
ALTER TABLE `investment_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_deposit_methods`
--
ALTER TABLE `manual_deposit_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verify_tokens`
--
ALTER TABLE `verify_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhook_payments`
--
ALTER TABLE `webhook_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_wallets`
--
ALTER TABLE `withdrawal_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verify_tokens`
--
ALTER TABLE `verify_tokens`
  ADD CONSTRAINT `verify_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawal_wallets`
--
ALTER TABLE `withdrawal_wallets`
  ADD CONSTRAINT `withdrawal_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
