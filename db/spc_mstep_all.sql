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

-- Dumping structure for table spc_mstep.tbl_mstep_customers
DROP TABLE IF EXISTS `tbl_mstep_customers`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT 'tbl_mstep_area_informations/id',
  `address` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `inchage_office_userid` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_master_users/id',
  `incharge_customer_userid` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_customer_inchange_users/id',
  `payment_close_date` varchar(255) NOT NULL,
  `payment_deadline_date` varchar(255) NOT NULL,
  `remarks1` longtext NOT NULL,
  `remarks2` longtext NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='現場顧客情報';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_customer_incharge_users
DROP TABLE IF EXISTS `tbl_mstep_customer_incharge_users`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_customer_incharge_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顧客担当者情報';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_group_users
DROP TABLE IF EXISTS `tbl_mstep_group_users`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_group_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL,
  `del_flg` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_group_workers
DROP TABLE IF EXISTS `tbl_mstep_group_workers`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_group_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `del_flg` tinyint(1) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_master_customers_client
DROP TABLE IF EXISTS `tbl_mstep_master_customers_client`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_master_customers_client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` longtext COLLATE utf8_unicode_ci NOT NULL,
  `del_flg` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_master_users
DROP TABLE IF EXISTS `tbl_mstep_master_users`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_master_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `login_pass` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `area_id` int(11) unsigned NOT NULL,
  `address` longtext NOT NULL,
  `authority` enum('normal','sub_master','master','senior') NOT NULL DEFAULT 'normal',
  `session_id` varchar(50) NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理ユーザ(Megastep側)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_memo
DROP TABLE IF EXISTS `tbl_mstep_memo`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_memo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `memo` longtext NOT NULL,
  `position_num` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_schedule_logs
DROP TABLE IF EXISTS `tbl_mstep_schedule_logs`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_schedule_logs` (
  `id` int(11) unsigned NOT NULL,
  `edit_time_expired_ms` bigint(20) NOT NULL DEFAULT '0' COMMENT '段取り保存後は0になります。 ※段取り実行後、その後保存で１サイクル完了したかを示す為',
  `edit_time_expired` datetime NOT NULL COMMENT '可視化の為のデータ',
  `start_user_id` int(11) unsigned NOT NULL,
  `edit_user_id` int(11) NOT NULL,
  `edit_time` datetime NOT NULL COMMENT '段取り保存を押した時間. ※保存するデータが存在しない時は更新されません。',
  `bin_key` blob NOT NULL COMMENT 'phpのtime();形式で記録されます(msではない)',
  `user_agent` varchar(255) NOT NULL,
  `remote_addr` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_schedule_trucks
DROP TABLE IF EXISTS `tbl_mstep_schedule_trucks`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_schedule_trucks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `schedule_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_schedules/id',
  `truck_id` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `del_flg` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid_scheduleid_truckid_delflg` (`site_id`,`schedule_id`,`truck_id`,`del_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_details
DROP TABLE IF EXISTS `tbl_mstep_site_details`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name_kana` varchar(100) NOT NULL,
  `customer_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_customers/id',
  `area_id` int(11) NOT NULL COMMENT 'tbl_mstep_area_informations/id',
  `address` longtext NOT NULL,
  `remarks` longtext NOT NULL,
  `power_num` double NOT NULL,
  `delivery` int(11) unsigned NOT NULL,
  `color_id` int(11) unsigned NOT NULL,
  `edit_user_id` int(11) unsigned NOT NULL,
  `around_value` int(11) unsigned NOT NULL DEFAULT '0',
  `memo` text,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid_customerid` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='現場情報';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_remark_titles
DROP TABLE IF EXISTS `tbl_mstep_site_remark_titles`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_remark_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_remark1` varchar(50) NOT NULL DEFAULT '現場詳細',
  `site_status` varchar(50) NOT NULL,
  `schedule_remark1` varchar(50) NOT NULL DEFAULT '備考1',
  `schedule_remark2` varchar(50) NOT NULL DEFAULT '備考2',
  `schedule_remark3` varchar(50) NOT NULL DEFAULT '備考3',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_schedules
DROP TABLE IF EXISTS `tbl_mstep_site_schedules`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_schedules` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_details/id',
  `start_month_prefix` int(11) NOT NULL,
  `start_day` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `position_num` int(11) unsigned NOT NULL,
  `color_id` int(11) unsigned NOT NULL DEFAULT '0',
  `power_num` int(11) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid_startmonthprefix_startday_delflg` (`site_id`,`start_month_prefix`,`start_day`,`del_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='現場日程';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_schedule_remarks
DROP TABLE IF EXISTS `tbl_mstep_site_schedule_remarks`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_schedule_remarks` (
  `schedule_id` int(11) unsigned NOT NULL,
  `remarks1` longtext NOT NULL,
  `remarks2` longtext NOT NULL,
  `remarks3` longtext NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_schedule_reports
DROP TABLE IF EXISTS `tbl_mstep_site_schedule_reports`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_schedule_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) unsigned NOT NULL,
  `schedule_id` int(11) unsigned NOT NULL,
  `report` longtext NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid_scheduleid` (`worker_id`,`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_workers
DROP TABLE IF EXISTS `tbl_mstep_site_workers`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_workers` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_details/id',
  `schedule_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_schedules/id',
  `worker_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_workers/id',
  `man_hour` double NOT NULL DEFAULT '1',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Price of worker',
  `allowance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '手当',
  `report` longtext NOT NULL,
  `leader_flg` int(1) NOT NULL DEFAULT '0',
  `assign_flg` int(1) NOT NULL DEFAULT '1' COMMENT '0:report/1:assigned',
  `initial_assign_flg` int(11) NOT NULL DEFAULT '1',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduleid_siteid_delflg_workerid` (`schedule_id`,`site_id`,`del_flg`,`worker_id`),
  KEY `siteid_delflg` (`site_id`,`del_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタッフ情報(現場で働く人の情報)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_trucks
DROP TABLE IF EXISTS `tbl_mstep_trucks`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_trucks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_workers
DROP TABLE IF EXISTS `tbl_mstep_workers`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_workers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `sex` enum('man','woman') NOT NULL DEFAULT 'man',
  `tel` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT 'tbl_mstep_area_informations/id',
  `group_id` int(11) unsigned NOT NULL,
  `rest_count_flg` tinyint(1) NOT NULL DEFAULT '1',
  `address` longtext NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `del_flg` tinyint(1) NOT NULL,
  `del_date` datetime NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタッフ情報(働く人)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_worker_prices
DROP TABLE IF EXISTS `tbl_mstep_worker_prices`;
CREATE TABLE IF NOT EXISTS `tbl_mstep_worker_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `price` int(11) NOT NULL DEFAULT '0',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History about prices of workers';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


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
