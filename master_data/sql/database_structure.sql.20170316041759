-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table spc_mstep.tbl_mstep_customers
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
CREATE TABLE IF NOT EXISTS `tbl_mstep_master_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) DEFAULT '0',
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `login_pass` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `area_id` int(11) unsigned NOT NULL,
  `address` longtext NOT NULL,
  `authority` enum('normal','sub_master','master') NOT NULL DEFAULT 'normal',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理ユーザ(Megastep側)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_memo
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
CREATE TABLE IF NOT EXISTS `tbl_mstep_schedule_logs` (
  `id` int(11) unsigned NOT NULL,
  `edit_time_expired_ms` bigint(20) NOT NULL DEFAULT '0',
  `start_user_id` int(11) unsigned NOT NULL,
  `edit_user_id` int(11) NOT NULL,
  `edit_time` datetime NOT NULL,
  `bin_key` blob NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `remote_addr` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_schedule_trucks
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
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid_customerid` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='現場情報';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_site_remark_titles
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
CREATE TABLE IF NOT EXISTS `tbl_mstep_site_workers` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_details/id',
  `schedule_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_site_schedules/id',
  `worker_id` int(11) unsigned NOT NULL COMMENT 'tbl_mstep_workers/id',
  `man_hour` double NOT NULL DEFAULT '1',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Price of worker',
  `allowance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '手当',
  `report` longtext NOT NULL,
  `assign_flg` int(1) NOT NULL DEFAULT '1' COMMENT '0:report/1:assigned',
  `del_flg` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid_delflg` (`site_id`,`del_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタッフ情報(現場で働く人の情報)';

-- Data exporting was unselected.


-- Dumping structure for table spc_mstep.tbl_mstep_trucks
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
CREATE TABLE IF NOT EXISTS `tbl_mstep_workers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `sex` enum('man','woman') NOT NULL DEFAULT 'man',
  `tel` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT 'tbl_mstep_area_informations/id',
  `group_id` int(1) NOT NULL,
  `rest_count_flg` tinyint(1) NOT NULL DEFAULT '1',
  `address` longtext NOT NULL,
  `price` decimal(10,0) unsigned NOT NULL,
  `del_flg` tinyint(1) NOT NULL,
  `del_date` datetime NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='スタッフ情報(働く人)';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
