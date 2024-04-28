-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2024 at 08:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifetech`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `Apptmnt_ID` int(20) NOT NULL,
  `Scheduled_On` date NOT NULL DEFAULT current_timestamp(),
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `Time` time NOT NULL DEFAULT current_timestamp(),
  `Doc_ID` int(20) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add administrators', 7, 'add_administrators'),
(26, 'Can change administrators', 7, 'change_administrators'),
(27, 'Can delete administrators', 7, 'delete_administrators'),
(28, 'Can view administrators', 7, 'view_administrators');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_ID` int(11) NOT NULL,
  `Dept_Head` varchar(20) NOT NULL,
  `Dept_Name` varchar(15) NOT NULL,
  `Emp_Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `Diag_No` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Details` text NOT NULL,
  `Remark` text NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Pat_ID` varchar(20) NOT NULL,
  `Doc_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'myapp', 'administrators'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-04 09:35:36.061910'),
(2, 'auth', '0001_initial', '2024-03-04 09:35:36.503413'),
(3, 'admin', '0001_initial', '2024-03-04 09:35:36.613764'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-04 09:35:36.629394'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-04 09:35:36.629394'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-04 09:35:36.699063'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-04 09:35:36.758071'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-04 09:35:36.787239'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-04 09:35:36.787239'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-04 09:35:36.841663'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-04 09:35:36.841663'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-04 09:35:36.841663'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-04 09:35:36.858380'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-04 09:35:36.866513'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-04 09:35:36.866513'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-04 09:35:36.882229'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-04 09:35:36.882229'),
(18, 'sessions', '0001_initial', '2024-03-04 09:35:36.929132'),
(19, 'myapp', '0001_initial', '2024-04-12 06:35:35.126649');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doc_ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Mobile Number` int(20) NOT NULL,
  `Department` text NOT NULL,
  `Insti_ID` int(20) NOT NULL,
  `Status` text NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `Contact_ID` int(11) NOT NULL,
  `Contact_Name` varchar(20) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Relation` varchar(20) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health institution`
--

CREATE TABLE `health institution` (
  `Insti_ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Type` text NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `Policy_Number` varchar(20) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Ins_Code` varchar(20) NOT NULL,
  `End_Date` varchar(10) DEFAULT NULL,
  `Provider` varchar(20) DEFAULT NULL,
  `Plan` varchar(20) DEFAULT NULL,
  `Coverage` varchar(20) DEFAULT NULL,
  `Maternity` tinyint(1) DEFAULT NULL,
  `Dental` tinyint(1) DEFAULT NULL,
  `Optical` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_screening`
--

CREATE TABLE `lab_screening` (
  `Lab_ID` int(11) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Technician_ID` int(11) NOT NULL,
  `Doc_ID` int(11) NOT NULL,
  `Test_Cost` decimal(10,2) DEFAULT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `Record_ID` int(11) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Allergies` varchar(50) DEFAULT NULL,
  `Pre_Conditions` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine payments`
--

CREATE TABLE `medicine payments` (
  `MedPay_ID` int(20) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Pharm_ID` int(20) NOT NULL,
  `Med_ID` int(20) NOT NULL,
  `Doc_ID` int(20) NOT NULL,
  `Date and Time` datetime NOT NULL DEFAULT current_timestamp(),
  `Amount` float DEFAULT NULL,
  `Quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `Med_ID` int(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` int(100) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Nurse_ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Mobile Number` int(20) NOT NULL,
  `Email` text NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Status` text NOT NULL,
  `Department` text NOT NULL,
  `Insti_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID_Number` varchar(20) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Mobile Number` int(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Age` int(100) NOT NULL,
  `Gender` text NOT NULL,
  `Insti_ID` int(20) NOT NULL,
  `Description` text NOT NULL,
  `Status` text NOT NULL,
  `Admission_Date` date NOT NULL,
  `Discharge_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Receipt Number` int(20) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Doc_ID` int(20) NOT NULL,
  `Date and Time` datetime NOT NULL DEFAULT current_timestamp(),
  `Amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `Pharm_ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Mobile Number` int(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` int(20) NOT NULL,
  `Insti_ID` int(20) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `Prescription_ID` int(11) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Med_ID` int(11) NOT NULL,
  `Date_` date DEFAULT NULL,
  `Dosage` int(11) DEFAULT NULL,
  `Doc_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `ID` int(20) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Mobile Number` int(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_ID` int(11) NOT NULL,
  `Room_Type` varchar(50) NOT NULL,
  `Pat_ID` varchar(20) NOT NULL,
  `Room_Cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Apptmnt_ID`),
  ADD UNIQUE KEY `Doc_ID` (`Doc_ID`),
  ADD UNIQUE KEY `Pat_ID` (`Pat_ID`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_ID`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`Diag_No`),
  ADD UNIQUE KEY `Pat_ID` (`Pat_ID`),
  ADD UNIQUE KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doc_ID`),
  ADD UNIQUE KEY `Insti_ID` (`Insti_ID`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`Contact_ID`),
  ADD KEY `Pat_ID` (`Pat_ID`);

--
-- Indexes for table `health institution`
--
ALTER TABLE `health institution`
  ADD PRIMARY KEY (`Insti_ID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`Policy_Number`),
  ADD KEY `Pat_ID` (`Pat_ID`);

--
-- Indexes for table `lab_screening`
--
ALTER TABLE `lab_screening`
  ADD PRIMARY KEY (`Lab_ID`),
  ADD KEY `Pat_ID` (`Pat_ID`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`Record_ID`),
  ADD KEY `Pat_ID` (`Pat_ID`);

--
-- Indexes for table `medicine payments`
--
ALTER TABLE `medicine payments`
  ADD PRIMARY KEY (`MedPay_ID`),
  ADD UNIQUE KEY `Pat_ID` (`Pat_ID`),
  ADD UNIQUE KEY `Pharm_ID` (`Pharm_ID`),
  ADD UNIQUE KEY `Med_ID` (`Med_ID`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`Med_ID`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Nurse_ID`),
  ADD UNIQUE KEY `Insti_ID` (`Insti_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID_Number`),
  ADD UNIQUE KEY `InstiID` (`Insti_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Receipt Number`),
  ADD KEY `Doc_ID` (`Doc_ID`),
  ADD KEY `Pat_ID` (`Pat_ID`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`Pharm_ID`),
  ADD UNIQUE KEY `Insti_ID` (`Insti_ID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`Prescription_ID`),
  ADD KEY `Prescription_ibfk_1` (`Pat_ID`),
  ADD KEY `Prescription_ibfk_2` (`Doc_ID`),
  ADD KEY `Prescription_ibfk_3` (`Med_ID`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `Room_ibfk_1` (`Pat_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `Appointments_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor` (`Doc_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Appointments_ibfk_2` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `Diagnosis_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`Insti_ID`) REFERENCES `health institution` (`Insti_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `Emergency_Contact_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `health institution`
--
ALTER TABLE `health institution`
  ADD CONSTRAINT `health institution_ibfk_1` FOREIGN KEY (`Insti_ID`) REFERENCES `patient` (`Insti_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `Insurance_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab_screening`
--
ALTER TABLE `lab_screening`
  ADD CONSTRAINT `Lab_Screening_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Lab_Screening_ibfk_2` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor` (`Doc_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `Medical_History_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`);

--
-- Constraints for table `medicine payments`
--
ALTER TABLE `medicine payments`
  ADD CONSTRAINT `Medicine Payments_ibfk_1` FOREIGN KEY (`Med_ID`) REFERENCES `medicines` (`Med_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Medicine Payments_ibfk_2` FOREIGN KEY (`Pharm_ID`) REFERENCES `pharmacist` (`Pharm_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Medicine Payments_ibfk_3` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Medicine Payments_ibfk_4` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor` (`Doc_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `Nurse_ibfk_1` FOREIGN KEY (`Insti_ID`) REFERENCES `health institution` (`Insti_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor` (`Doc_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Payments_ibfk_2` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `Prescription_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prescription_ibfk_2` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor` (`Doc_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Prescription_ibfk_3` FOREIGN KEY (`Med_ID`) REFERENCES `medicines` (`Med_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Pat_ID`) REFERENCES `patient` (`ID_Number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
