-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 14, 2022 at 05:46 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yield_prediction`
--
CREATE DATABASE IF NOT EXISTS `yield_prediction` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yield_prediction`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add crop_yield_data', 7, 'add_crop_yield_data'),
(20, 'Can change crop_yield_data', 7, 'change_crop_yield_data'),
(21, 'Can delete crop_yield_data', 7, 'delete_crop_yield_data'),
(22, 'Can add user_reg', 8, 'add_user_reg'),
(23, 'Can change user_reg', 8, 'change_user_reg'),
(24, 'Can delete user_reg', 8, 'delete_user_reg'),
(25, 'Can add yield_fertilizer', 9, 'add_yield_fertilizer'),
(26, 'Can change yield_fertilizer', 9, 'change_yield_fertilizer'),
(27, 'Can delete yield_fertilizer', 9, 'delete_yield_fertilizer'),
(28, 'Can add admin_reg', 8, 'add_admin_reg'),
(29, 'Can change admin_reg', 8, 'change_admin_reg'),
(30, 'Can delete admin_reg', 8, 'delete_admin_reg'),
(31, 'Can add user_registration', 10, 'add_user_registration'),
(32, 'Can change user_registration', 10, 'change_user_registration'),
(33, 'Can delete user_registration', 10, 'delete_user_registration'),
(34, 'Can add dist_soil', 11, 'add_dist_soil'),
(35, 'Can change dist_soil', 11, 'change_dist_soil'),
(36, 'Can delete dist_soil', 11, 'delete_dist_soil'),
(37, 'Can view log entry', 1, 'view_logentry'),
(38, 'Can view permission', 2, 'view_permission'),
(39, 'Can view group', 3, 'view_group'),
(40, 'Can view user', 4, 'view_user'),
(41, 'Can view content type', 5, 'view_contenttype'),
(42, 'Can view session', 6, 'view_session'),
(43, 'Can view crop_yield_data', 7, 'view_crop_yield_data'),
(44, 'Can view yield_fertilizer', 9, 'view_yield_fertilizer'),
(45, 'Can view admin_reg', 8, 'view_admin_reg'),
(46, 'Can view dist_soil', 11, 'view_dist_soil'),
(47, 'Can view user_registration', 10, 'view_user_registration'),
(48, 'Can add soil_list', 12, 'add_soil_list'),
(49, 'Can change soil_list', 12, 'change_soil_list'),
(50, 'Can delete soil_list', 12, 'delete_soil_list'),
(51, 'Can view soil_list', 12, 'view_soil_list'),
(52, 'Can add farmer_query_agri', 13, 'add_farmer_query_agri'),
(53, 'Can change farmer_query_agri', 13, 'change_farmer_query_agri'),
(54, 'Can delete farmer_query_agri', 13, 'delete_farmer_query_agri'),
(55, 'Can view farmer_query_agri', 13, 'view_farmer_query_agri');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_admin_reg`
--

CREATE TABLE IF NOT EXISTS `crop_yield_admin_reg` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `conpwd` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `crop_yield_admin_reg`
--

INSERT INTO `crop_yield_admin_reg` (`reg_id`, `fname`, `lname`, `email`, `pwd`, `conpwd`, `mobile`) VALUES
(1, 'Ramya', 'G', 'gr@gmail.com', '123456', '123456', '9600559862'),
(2, 'Bala', 'Subramani', 'bs@gmail.com', '123456', '123456', '9629249789'),
(3, 'Raja', 'Ram', 'rr@gmail.com', '123456', '123456', '9632145698');

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_crop_yield_data`
--

CREATE TABLE IF NOT EXISTS `crop_yield_crop_yield_data` (
  `crop_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  `crop_year` varchar(20) NOT NULL,
  `season` varchar(300) NOT NULL,
  `crop` varchar(300) NOT NULL,
  `area` varchar(300) NOT NULL,
  `soil_type` varchar(300) NOT NULL,
  `temperature` varchar(300) NOT NULL,
  `production` int(11) NOT NULL,
  `fertilizer_f` varchar(300) NOT NULL,
  `nitrogen_n` varchar(30) NOT NULL,
  `phosphorous_ph` varchar(30) NOT NULL,
  `potassium_p` varchar(30) NOT NULL,
  `humid` varchar(30) NOT NULL,
  `moist` varchar(30) NOT NULL,
  PRIMARY KEY (`crop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `crop_yield_crop_yield_data`
--

INSERT INTO `crop_yield_crop_yield_data` (`crop_id`, `state`, `district`, `crop_year`, `season`, `crop`, `area`, `soil_type`, `temperature`, `production`, `fertilizer_f`, `nitrogen_n`, `phosphorous_ph`, `potassium_p`, `humid`, `moist`) VALUES
(1, 'Tamil Nadu', 'AHMEDNAGAR', '2026', 'Winter', 'Bajra', '200', 'Jowar', '13', 100000, 'DAP', '1', '1', '1', '5', '6'),
(2, 'Tamil Nadu', 'AURANGABAD', '2015', 'Winter', 'Wheat', '500', 'Alluvium', '22', 5000, 'Urea', '1', '1', '1', '5', '6'),
(3, 'Tamil Nadu', 'COIMBATORE', '2015', 'Winter', 'Rice', '1000', 'Deep Red Soil', '23', 1000005, 'Urea', '2', '5', '3', '5', '6'),
(4, 'Tamil Nadu', 'COIMBATORE', '2005', 'Winter', 'Wheat', '2500', 'Deep Red Soil', '18', 100000, '10 / 26 / 2026', '8', '8', '9', '5', '6'),
(5, 'Tamil Nadu', 'CUDDALORE', '2010', 'Summer', 'Bitter Gourd', '1000', 'Alluvium', '24', 7, 'DAP', '7', '5', '4', '5', '6'),
(6, 'Tamil Nadu', 'KANNIYAKUMARI', '1976', 'Summer', 'Ragi', '500', 'Non Calcareous Red', '25', 7000, '14 - 35 - 14', '7', '22', '13', '5', '6'),
(7, 'Tamil Nadu', 'CUDDALORE', '2005', 'Summer', 'Garlic', '2500', 'Red Sandy Soil', '25', 1025000, '17 - 17 - 17', '5', '15', '23', '5', '6'),
(8, 'Tamil Nadu', 'DINDIGUL', '2021', 'Winter', 'Beet Root', '1250', 'Red Loamy', '25', 10000, '20 - 20', '2', '2', '5', '5', '6'),
(9, 'Tamil Nadu', 'COIMBATORE', '1996', 'Autumn', 'Bottle Gourd', '1500', 'Clay Loam', '27', 325012, 'DAP', '5', '9', '7', '5', '6'),
(10, 'Tamil Nadu', 'ARIYALUR', '2016', 'Summer', 'Rice', 'Kovilambakkam', 'Alluvium', '3', 57000, 'DAP', '5', '4', '11', '5', '6'),
(11, 'Tamil Nadu', 'MADURAI', '2021', 'Summer', 'Mango', 'Rajapuram', 'Deep Red Loam', '24', 10000, '28 - 28', '14', '5', '8', '5', '6'),
(12, 'Maharashtra', 'Ahmednagar', '2000', 'Summer', 'Coconut', 'Abcd', 'Clay Loam', '6', 25000, 'DAP', '7', '3', '5', '5', '6'),
(13, 'Maharashtra', 'Ahmednagar', '2015', 'Summer', 'Apple', 'dfgsd', 'Alluvium', '26', 1000, 'Urea', '9', '1', '5', '2', '5'),
(14, 'Maharashtra', 'Aurangabad', '1998', 'Summer', 'Ash Gourd', 'sdf', 'Alluvium', '5', 100000, 'Urea', '3', '2', '1', '2', '1'),
(15, 'Maharashtra', 'Amravati', '2015', 'Summer', 'Rice', 'adsf', 'Deep Red Loam', '25', 1000000, 'DAP', '5', '3', '2', '1', '2'),
(16, 'Maharashtra', 'Ahmednagar', '2021', 'Summer', 'Rice', 'asda', 'Alluvium', '5', 5000000, 'Urea', '2', '1', '3', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_dist_soil`
--

CREATE TABLE IF NOT EXISTS `crop_yield_dist_soil` (
  `dist_id` int(11) NOT NULL AUTO_INCREMENT,
  `dist_name` varchar(300) NOT NULL,
  `type_soil` varchar(300) NOT NULL,
  PRIMARY KEY (`dist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `crop_yield_dist_soil`
--

INSERT INTO `crop_yield_dist_soil` (`dist_id`, `dist_name`, `type_soil`) VALUES
(1, 'ARIYALUR', 'Deep Red Soil'),
(2, 'COIMBATORE', 'Calcareous Black'),
(3, 'CUDDALORE', 'Clay Loam'),
(4, 'DHARMAPURI', 'Red Sandy Loam'),
(5, 'DINDIGUL', 'Non Calcareous Red'),
(6, 'ERODE', 'Black'),
(7, 'KANCHIPURAM', 'Calcareous Black'),
(8, 'KANNIYAKUMARI', 'Coastal Alluvium'),
(9, 'KARUR', 'Alluvium'),
(10, 'KRISHNAGIRI', 'Red Loamy '),
(11, 'MADURAI', 'Deep Red Loam'),
(12, 'NAGAPATTINAM', 'Non Calcareous Brown'),
(13, 'NAMAKKAL', 'Red Sandy Soil'),
(14, 'PERAMBALUR', 'Deep Red Soil'),
(15, 'PUDUKKOTTAI', 'Lateritic'),
(16, 'RAMANATHAPURAM', 'Red Loamy'),
(17, 'SALEM', 'Saline Coastal Alluvium'),
(18, 'SIVAGANGA', 'Clay Loam'),
(19, 'THANJAVUR', 'Red Sandy Loam'),
(20, 'THE NILGIRIS', 'Non Calcareous Red'),
(21, 'THENI', 'Black'),
(22, 'THIRUVALLUR', 'Calcareous Black'),
(23, 'THIRUVARUR', 'Coastal Alluvium'),
(24, 'TIRUCHIRAPPALLI', 'Alluvium'),
(25, 'TIRUNELVELI', 'Red Loamy '),
(26, 'TIRUPPUR', 'Deep Red Loam'),
(27, 'TIRUVANNAMALAI', 'Non Calcareous Brown'),
(28, 'TUTICORIN', 'Red Sandy Soil'),
(29, 'VELLORE', 'Deep Red Soil'),
(30, 'VILLUPURAM', 'Red Sandy Loam'),
(31, 'VIRUDHUNAGAR', 'Coastal Alluvium'),
(33, 'Chennai', 'Deep Red Soil\n'),
(34, 'Chennai', 'Alluvium\r\n'),
(35, 'Ahmednagar', 'Clay Loam'),
(36, 'Akola', 'Deep Red Loam'),
(37, 'Amravati', 'Calcareous Black'),
(38, 'Aurangabad', 'Red Loamy '),
(39, 'Beed', 'Black'),
(40, 'Bhandara', 'Coastal Alluvium'),
(41, 'Buldhana', 'Red Sandy Soil'),
(42, 'Chandrapur', 'Deep Red Loam'),
(43, 'Dhule', 'Calcareous Black'),
(44, 'Gadchiroli', 'Non Calcareous Red'),
(45, 'asdf', 'Alluvium\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_farmer_query_agri`
--

CREATE TABLE IF NOT EXISTS `crop_yield_farmer_query_agri` (
  `farmer_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`farmer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_soil_list`
--

CREATE TABLE IF NOT EXISTS `crop_yield_soil_list` (
  `soil_id` int(11) NOT NULL AUTO_INCREMENT,
  `soil_type` varchar(300) NOT NULL,
  PRIMARY KEY (`soil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `crop_yield_soil_list`
--

INSERT INTO `crop_yield_soil_list` (`soil_id`, `soil_type`) VALUES
(1, 'Alluvium\n'),
(2, 'Black'),
(3, 'Calcareous Black'),
(4, 'Clay Loam'),
(5, 'Coastal Alluvium'),
(6, 'Deep Red Loam'),
(7, 'Deep Red Soil'),
(8, 'Lateritic'),
(9, 'Non Calcareous Brown'),
(10, 'Non Calcareous Red'),
(11, 'Red Loamy '),
(12, 'Red Sandy Loam'),
(13, 'Red Sandy Soil'),
(14, 'Saline Coastal Alluvium'),
(15, 'Red Soil'),
(16, 'Red Soil');

-- --------------------------------------------------------

--
-- Table structure for table `crop_yield_yield_fertilizer`
--

CREATE TABLE IF NOT EXISTS `crop_yield_yield_fertilizer` (
  `yield_id` int(11) NOT NULL AUTO_INCREMENT,
  `soil_type` varchar(300) NOT NULL,
  `temp` varchar(30) NOT NULL,
  `humid` varchar(30) NOT NULL,
  `moisture` varchar(30) NOT NULL,
  `potassium` varchar(30) NOT NULL,
  `phosphorous` varchar(30) NOT NULL,
  `nitrogen` varchar(30) NOT NULL,
  `fertilizer` varchar(300) NOT NULL,
  `district` varchar(300) NOT NULL,
  PRIMARY KEY (`yield_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `crop_yield_yield_fertilizer`
--

INSERT INTO `crop_yield_yield_fertilizer` (`yield_id`, `soil_type`, `temp`, `humid`, `moisture`, `potassium`, `phosphorous`, `nitrogen`, `fertilizer`, `district`) VALUES
(1, 'Calcareous Black', '30', '25', '35', '2', '1', '2', 'Urea', 'COIMBATORE'),
(2, 'Deep Red Soil', '23', '21', '5', '3', '5', '2', 'Urea', 'ARIYALUR'),
(3, 'Red Loamy', '26', '52', '38', '37', '0', '0', 'Urea', 'ARIYALUR'),
(4, 'Saline Coastal Alluvium', '29', '52', '45', '12', '0', '36', 'DAP', 'COIMBATORE'),
(5, 'Clay Loam', '34', '65', '62', '7', '9', '30', '14-35-14', 'CUDDALORE'),
(6, 'Red Sandy Loam', '32', '62', '34', '22', '0', '20', '28-28', 'DHARMAPURI'),
(7, 'Non Calcareous Red', '28', '54', '46', '35', '0', '0', 'Urea', 'DINDIGUL'),
(8, 'Black', '26', '52', '35', '12', '10', '13', '17-17-17', 'ERODE'),
(9, 'Calcareous Black', '25', '50', '64', '9', '0', '10', '20-20', 'KANCHIPURAM'),
(10, 'Coastal Alluvium', '33', '64', '50', '41', '0', '0', 'Urea', 'KANNIYAKUMARI'),
(11, 'Alluvium', '30', '60', '42', '21', '0', '18', '28-28', 'KARUR'),
(12, 'Red Loamy ', '29', '58', '33', '9', '7', '30', '14-35-14', 'KRISHNAGIRI'),
(13, 'Deep Red Loam', '27', '54', '28', '13', '0', '40', 'DAP', 'MADURAI'),
(14, 'Non Calcareous Brown', '31', '62', '48', '14', '15', '12', '17-17-17', 'NAGAPATTINAM'),
(15, 'Red Sandy Soil', '25', '50', '65', '36', '0', '0', 'DAP', 'NAMAKKAL'),
(16, 'Deep Red Soil', '32', '62', '41', '24', '0', '22', '28-28', 'PERAMBALUR'),
(17, 'Lateritic', '26', '52', '31', '14', '0', '41', 'DAP', 'PUDUKKOTTAI'),
(18, 'Red Loamy', '31', '62', '49', '10', '13', '14', '17-17-17', 'RAMANATHAPURAM'),
(19, 'Saline Coastal Alluvium', '33', '64', '34', '38', '0', '0', 'Urea', 'SALEM'),
(20, 'Clay Loam', '25', '50', '39', '21', '0', '19', '28-28', 'SIVAGANGA'),
(21, 'Red Sandy Loam', '28', '54', '65', '39', '0', '0', 'Urea', 'THANJAVUR'),
(22, 'Non Calcareous Red', '29', '58', '52', '13', '0', '36', 'DAP', 'THE NILGIRIS'),
(23, 'Black', '30', '60', '44', '10', '0', '9', '20-20', 'THENI'),
(24, 'Calcareous Black', '34', '65', '53', '12', '14', '12', '17-17-17', 'THIRUVALLUR'),
(25, 'Coastal Alluvium', '35', '68', '33', '11', '0', '37', 'DAP', 'THIRUVARUR'),
(26, 'Alluvium', '28', '54', '37', '36', '0', '0', 'Urea', 'TIRUCHIRAPPALLI'),
(27, 'Red Loamy ', '33', '64', '39', '13', '0', '10', '20-20', 'TIRUNELVELI'),
(28, 'Deep Red Loam', '26', '52', '44', '23', '0', '20', '28-28', 'TIRUPPUR'),
(29, 'Non Calcareous Brown', '30', '60', '63', '9', '9', '29', '14-35-14', 'TIRUVANNAMALAI'),
(30, 'Red Sandy Soil', '32', '62', '30', '38', '0', '0', 'Urea', 'TUTICORIN'),
(31, 'Deep Red Soil', '37', '70', '32', '12', '0', '39', 'DAP', 'VELLORE'),
(32, 'Red Sandy Loam', '26', '52', '36', '14', '0', '13', '20-20', 'VILLUPURAM'),
(33, 'Coastal Alluvium', '29', '58', '40', '24', '0', '23', '28-28', 'VIRUDHUNAGAR');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'crop_yield', 'admin_reg'),
(7, 'crop_yield', 'crop_yield_data'),
(11, 'crop_yield', 'dist_soil'),
(13, 'crop_yield', 'farmer_query_agri'),
(12, 'crop_yield', 'soil_list'),
(9, 'crop_yield', 'yield_fertilizer'),
(10, 'farmer', 'user_registration'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-28 12:40:16.880500'),
(2, 'auth', '0001_initial', '2022-01-28 12:40:33.532931'),
(3, 'admin', '0001_initial', '2022-01-28 12:40:36.374919'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-28 12:40:36.567299'),
(5, 'contenttypes', '0002_remove_content_type_name', '2022-01-28 12:40:38.422511'),
(6, 'auth', '0002_alter_permission_name_max_length', '2022-01-28 12:40:39.481155'),
(7, 'auth', '0003_alter_user_email_max_length', '2022-01-28 12:40:40.360088'),
(8, 'auth', '0004_alter_user_username_opts', '2022-01-28 12:40:40.441409'),
(9, 'auth', '0005_alter_user_last_login_null', '2022-01-28 12:40:41.165250'),
(10, 'auth', '0006_require_contenttypes_0002', '2022-01-28 12:40:41.190616'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2022-01-28 12:40:41.277471'),
(12, 'auth', '0008_alter_user_username_max_length', '2022-01-28 12:40:42.056919'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2022-01-28 12:40:43.989388'),
(14, 'crop_yield', '0001_initial', '2022-01-28 12:40:44.742010'),
(15, 'sessions', '0001_initial', '2022-01-28 12:40:45.922838'),
(16, 'crop_yield', '0002_user_reg', '2022-01-29 08:03:06.143341'),
(17, 'crop_yield', '0003_yield_fertilizer', '2022-02-01 07:55:58.913717'),
(18, 'crop_yield', '0004_auto_20220203_2032', '2022-02-03 15:03:19.856401'),
(19, 'crop_yield', '0005_auto_20220204_1244', '2022-02-04 07:14:50.522611'),
(20, 'farmer', '0001_initial', '2022-02-04 13:17:11.571725'),
(21, 'crop_yield', '0006_yield_fertilizer_district', '2022-02-05 11:28:55.756135'),
(22, 'crop_yield', '0007_dist_soil', '2022-02-08 13:51:57.744681'),
(23, 'crop_yield', '0008_auto_20220210_1605', '2022-02-10 10:38:21.330861'),
(24, 'crop_yield', '0009_auto_20220210_1606', '2022-02-10 10:38:21.397867'),
(25, 'crop_yield', '0010_auto_20220210_1607', '2022-02-10 10:38:21.438687'),
(26, 'crop_yield', '0011_auto_20220210_1911', '2022-02-10 13:41:30.700359'),
(27, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-30 13:09:21.823557'),
(28, 'auth', '0010_alter_group_name_max_length', '2022-04-30 13:09:22.863474'),
(29, 'auth', '0011_update_proxy_permissions', '2022-04-30 13:09:22.894717'),
(30, 'auth', '0012_alter_user_first_name_max_length', '2022-04-30 13:09:23.596816'),
(31, 'crop_yield', '0012_soil_list', '2022-05-05 08:22:52.836538'),
(32, 'crop_yield', '0013_auto_20220514_2017', '2022-05-14 14:47:34.093100');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3gkp189y0r6vmexkte5gfak89plyf2z3', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-02-22 14:14:17.069230'),
('3o2ebx5mivsod50ukt8txsf72x1gtvgn', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-02-21 13:55:59.641102'),
('4ekkshbi42au2uqecj4wuos63i8zias9', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nprKW:g9l6jRSCi-w40vsCVZibELd0_2aiW8un9S2Fv4YNLXk', '2022-05-28 12:57:08.889482'),
('4luly6lm7wbsguq221gozzzkhscbbcy0', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nmZz4:1FcVxvHlLRIVytMbKVYll4PaEgl7xx-OEZ_qRE1ORGI', '2022-05-19 11:49:26.436494'),
('4p5hag1oycjkvg23o6fb4s4v0qvoq2nw', 'e30:1npvmo:2trXzzdLptFcDZesTg7CwkRh1kw_m4a_LD_pn4-LGk8', '2022-05-28 17:42:38.233309'),
('5g00t169i0ms1xzjls7ozy10qy0ezhyg', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-02-19 12:29:21.373156'),
('6uzif2khmo2alv49xagtif3ud6o6xuic', 'Y2U2NGM4YTIwZTJlZjFjOThlZjk2ODJlMmNlYzlhYmM4ODhlNmI5Nzp7InJlZ19pZCI6MSwiZW1haWwiOiJnckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjAwNTU5ODYyIn0=', '2022-02-19 05:05:02.747445'),
('937z7h3et9futoxsearvbux9yjbhae4z', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nprfE:uNZv0Ma86yzpFK9c5X13ZrFM_jUgPHj6HUTptI9XaWg', '2022-05-28 13:18:32.545821'),
('az48ou3z60pjb65jefqda4j98nw8lpmk', 'Y2U2NGM4YTIwZTJlZjFjOThlZjk2ODJlMmNlYzlhYmM4ODhlNmI5Nzp7InJlZ19pZCI6MSwiZW1haWwiOiJnckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjAwNTU5ODYyIn0=', '2022-02-18 05:25:15.518982'),
('b7g3b6m74hw5x8mvnpz1v59elf8ceyet', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-02-26 06:08:06.537134'),
('ct50hm7n3i5qtz0ayg5ops6njbxppdau', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiYmFsYXJAZ21haWwuY29tIiwibW9iaWxlIjoiOTYyMTQ1Njk4NSJ9:1npsi2:j8s5bV0NB7zrVnLOinchuzZwSe-EQKmNg1tGrBK-x2M', '2022-05-28 14:25:30.941829'),
('cuyxwhsdk0shasi93f52k5ryiqctbmwl', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-02-21 13:41:42.127968'),
('d50mx1inhjnteoi6opojvvw7qnixqbmx', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-03-07 12:03:10.132690'),
('i7kon6qkc1laamsjtbkuabgn6cs42ypx', 'NDUxNmQwNzk2ODllMDQyNDY1NDQyYmFiNDljZWJlZGI0NDdlNzJiYjp7fQ==', '2022-03-07 11:31:49.033532'),
('j6m4fsro3j41czos6y6h2707mb6vtkwp', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiYmFsYXJAZ21haWwuY29tIiwibW9iaWxlIjoiOTYyMTQ1Njk4NSJ9:1noUGz:P7JaJ6WvElmqgwT7ko52leDoz9ZkFyqNip6u2c73Zd8', '2022-05-24 18:07:49.947774'),
('jiimmjczwwrzt9htevsqr6hcigwpilml', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-03-09 13:21:25.565682'),
('khcr0f7al4zpa4rhxy5mfeeieqtarb25', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nkmkv:QlwEtIGsW90BFeCuvjmxfRkuKzjLzwV3V7q1QT1nWkc', '2022-05-14 13:03:25.403245'),
('ktqvlq4tg4qjw6do3tdvxi1ldrdoa1wr', 'eyJyZWdfaWQiOjIsImVtYWlsIjoicmt1bWFyQGdtYWlsLmNvbSIsIm1vYmlsZSI6IjEyMzQ1Njc4OTAifQ:1nacgX:ujGYiFYhb5AuIcdQUBYbo6RkfgclbOiroWC5JVpYXwg', '2022-04-16 12:16:53.673884'),
('lh7gw9s4vxap2bzuftx65kccwejedd6x', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nmVdE:WladiLpWwHMN_KfntF-_jbwsePp4zojDj3TB6P-RQmk', '2022-05-19 07:10:36.774223'),
('m4mwvx42gqid99d8wne0rzv22qdvwbot', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-03-09 13:07:05.687016'),
('o5xmzcc6dq2ev034yt3gb0zkviekx2hl', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiYmFsYXJAZ21haWwuY29tIiwibW9iaWxlIjoiOTYyMTQ1Njk4NSJ9:1nodAl:hzzUOLO2kHgN4bSd0qpsBDZ2paNWVBuUBEZSu6KN7tA', '2022-05-25 03:37:59.125669'),
('onqpfu4mbjfghesar9wxwhkjfjuqr4qb', 'Y2U2NGM4YTIwZTJlZjFjOThlZjk2ODJlMmNlYzlhYmM4ODhlNmI5Nzp7InJlZ19pZCI6MSwiZW1haWwiOiJnckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjAwNTU5ODYyIn0=', '2022-02-16 13:01:55.164480'),
('t4xjf17j2auujajk3ecl5547tkagx3d7', 'OThhMWY5YzFmMjYyMjMzOTE5N2NiMWY1NDk5MmU2N2ViMWFkYzM1Nzp7InJlZ19pZCI6MiwiZW1haWwiOiJya3VtYXJAZ21haWwuY29tIiwibW9iaWxlIjoiMTIzNDU2Nzg5MCJ9', '2022-03-25 12:57:37.634214'),
('xm5jfaabw5c6osisu3ts12px2jgh5ny5', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nmVWu:mOZWGAOAirdL4JHClef_u1vsoUucCvvlHm53HB5o3o0', '2022-05-19 07:04:04.930014'),
('yho49xliz0ovufd3bvnus3tz7whzct6v', 'NDUxNmQwNzk2ODllMDQyNDY1NDQyYmFiNDljZWJlZGI0NDdlNzJiYjp7fQ==', '2022-03-02 06:10:15.123720'),
('z6ocy28u37z28iw3j0veff2j0iikf5n9', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-03-01 12:56:28.371125'),
('z7my3p68bvbcibtvo8gn8udddkj4qars', 'eyJyZWdfaWQiOjEsImVtYWlsIjoiZ3JAZ21haWwuY29tIiwibW9iaWxlIjoiOTYwMDU1OTg2MiJ9:1nlmkv:gTpG9xL8GP7prw_1S-5cgoLoN-UMKWP6dLsK2YIQ_8w', '2022-05-17 07:15:33.696398'),
('zz09seof3hut9mnai6jfzk9in65yro3k', 'NjBhNDY5MmY1YjA0ZTQyZTE2NDIwODQzODA5N2M2NTM2NmNmZWYzYzp7InJlZ19pZCI6MSwiZW1haWwiOiJiYWxhckBnbWFpbC5jb20iLCJtb2JpbGUiOiI5NjIxNDU2OTg1In0=', '2022-03-01 13:28:28.751231');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_user_registration`
--

CREATE TABLE IF NOT EXISTS `farmer_user_registration` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `conpwd` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `farmer_user_registration`
--

INSERT INTO `farmer_user_registration` (`reg_id`, `fname`, `lname`, `email`, `pwd`, `conpwd`, `mobile`) VALUES
(1, 'Balasubramani', 'R', 'balar@gmail.com', '123456', '123456', '9621456985'),
(2, 'Kumar', 'R', 'rkumar@gmail.com', '123456', '123456', '1234567890'),
(3, 'Raja', 'Rajan', 'rr@gmail.com', '123456', '123456', '9609561600'),
(4, 'Kumara', 'Vel', 'kv@gmail.com', '123456', '123456', '0000000000'),
(5, 'Arul', 'V', 'av@gmail.com', '123456', '123456', '3215469871');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
