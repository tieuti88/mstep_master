-- --------------------------------------------------------
-- Host:                         192.168.1.100
-- Server version:               5.6.35 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for spc_mstep_master
DROP DATABASE IF EXISTS `spc_mstep_master`;
CREATE DATABASE IF NOT EXISTS `spc_mstep_master` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `spc_mstep_master`;


-- Dumping structure for table spc_mstep_master.clients
DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_host` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_user` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_port` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `del_flg` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.client_profile
DROP TABLE IF EXISTS `client_profile`;
CREATE TABLE IF NOT EXISTS `client_profile` (
  `id` int(11) unsigned NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `client_tel` varchar(15) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `client_address` varchar(200) DEFAULT NULL,
  `client_fax` varchar(15) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_jobtitle` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_tel` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_area_informations
DROP TABLE IF EXISTS `tbl_mstep_area_informations`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_area_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pref_id` int(11) NOT NULL,
  `pref` varchar(50) NOT NULL,
  `pref_en` varchar(50) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address1_en` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_client_requests
DROP TABLE IF EXISTS `tbl_mstep_client_requests`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_client_requests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) DEFAULT NULL,
  `client_address` varchar(100) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `client_tel` varchar(15) DEFAULT NULL,
  `sub_domain` varchar(10) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_jobtitle` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_tel` varchar(15) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `status` enum('requested','returned','rejected','created') DEFAULT 'requested',
  `client_id` int(11) DEFAULT '0',
  `requester` int(11) DEFAULT '0',
  `creator` int(11) DEFAULT '0',
  `del_flg` int(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_colors
DROP TABLE IF EXISTS `tbl_mstep_colors`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_master_users
DROP TABLE IF EXISTS `tbl_mstep_master_users`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_master_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `login_id` varchar(10) NOT NULL,
  `login_pass` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pref_id` int(11) unsigned NOT NULL,
  `authority` enum('master','spc','mstep') NOT NULL DEFAULT 'spc',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理ユーザ(Megastep側)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_weather_images
DROP TABLE IF EXISTS `tbl_mstep_weather_images`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_weather_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_weather_informations
DROP TABLE IF EXISTS `tbl_mstep_weather_informations`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_weather_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep_master.tbl_mstep_weather_weekly_reports
DROP TABLE IF EXISTS `tbl_mstep_weather_weekly_reports`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_weather_weekly_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pref_id` int(11) unsigned NOT NULL,
  `locality` varchar(10) NOT NULL,
  `rss_url` varchar(50) NOT NULL,
  `prefectural_capital_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
