CREATE database if NOT EXISTS `xxl_job` default character set utf8 collate utf8_general_ci;
use `xxl_job`;

-- MySQL dump 10.13  Distrib 5.5.57, for Win64 (AMD64)
--
-- Host: localhost    Database: iyydb_job_dev
-- ------------------------------------------------------
-- Server version	5.5.57

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xxl_job_qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_blob_triggers`;
CREATE TABLE `xxl_job_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_calendars`;
CREATE TABLE `xxl_job_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_cron_triggers`;
CREATE TABLE `xxl_job_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_cron_triggers
-- ----------------------------
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('quartzScheduler', '3', '1', '1 1 1 * * ? *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('quartzScheduler', '4', '1', '1 1 1 * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for xxl_job_qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_fired_triggers`;
CREATE TABLE `xxl_job_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_job_details`;
CREATE TABLE `xxl_job_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_job_details
-- ----------------------------
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('quartzScheduler', '3', '1', null, 'com.open.capacity.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('quartzScheduler', '4', '1', null, 'com.open.capacity.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for xxl_job_qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_locks`;
CREATE TABLE `xxl_job_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_locks
-- ----------------------------
INSERT INTO `xxl_job_qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `xxl_job_qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for xxl_job_qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_paused_trigger_grps`;
CREATE TABLE `xxl_job_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_scheduler_state`;
CREATE TABLE `xxl_job_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_scheduler_state
-- ----------------------------
INSERT INTO `xxl_job_qrtz_scheduler_state` VALUES ('quartzScheduler', 'USERCHI-E29PEDA1525876570951', '1525876886761', '5000');

-- ----------------------------
-- Table structure for xxl_job_qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_simple_triggers`;
CREATE TABLE `xxl_job_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_simprop_triggers`;
CREATE TABLE `xxl_job_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `xxl_job_qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_triggers`;
CREATE TABLE `xxl_job_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `xxl_job_qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `xxl_job_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_triggers
-- ----------------------------
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('quartzScheduler', '3', '1', '3', '1', null, '1525885261000', '-1', '5', 'PAUSED', 'CRON', '1525876730000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('quartzScheduler', '4', '1', '4', '1', null, '1525885261000', '-1', '5', 'PAUSED', 'CRON', '1525876778000', '0', null, '2', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_group`;
CREATE TABLE `xxl_job_qrtz_trigger_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_group
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_group` VALUES ('1', 'open-xxl-job-demo', '示例执行器', '1', '0', '192.168.32.1:9999');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_info`;
CREATE TABLE `xxl_job_qrtz_trigger_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_fail_strategy` varchar(50) DEFAULT NULL COMMENT '失败处理策略',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` text COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_info
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('3', '1', '1 1 1 * * ? *', '无参Demo测试', '2018-05-09 22:38:50', '2018-05-09 22:38:50', 'Merlin', '', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 'FAIL_ALARM', 'BEAN', '', 'GLUE代码初始化', '2018-05-09 22:38:50', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('4', '1', '1 1 1 * * ? *', '有参Demo测试', '2018-05-09 22:39:38', '2018-05-09 22:39:38', 'Merlin', '', 'FIRST', 'demoJobHandler', 'Hello,Word', 'SERIAL_EXECUTION', 'FAIL_ALARM', 'BEAN', '', 'GLUE代码初始化', '2018-05-09 22:39:38', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_log`;
CREATE TABLE `xxl_job_qrtz_trigger_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` varchar(255) NOT NULL DEFAULT '0' COMMENT '调度-结果',
  `trigger_msg` varchar(2048) DEFAULT NULL COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` varchar(255) NOT NULL DEFAULT '0' COMMENT '执行-状态',
  `handle_msg` varchar(2048) DEFAULT NULL COMMENT '执行-日志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_log
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_log` VALUES ('5', '1', '4', 'BEAN', null, 'demoJobHandler', 'Hello,Word', '2018-05-09 22:40:09', '500', '调度机器：192.168.32.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br>----------------------<br>调度失败：执行器地址为空', null, '0', null);
INSERT INTO `xxl_job_qrtz_trigger_log` VALUES ('6', '1', '4', 'BEAN', '192.168.32.1:9999', 'demoJobHandler', 'Hello,Word', '2018-05-09 22:40:38', '200', '调度机器：192.168.32.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.32.1:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.32.1:9999<br>code：200<br>msg：null', '2018-05-09 22:40:48', '200', '');
INSERT INTO `xxl_job_qrtz_trigger_log` VALUES ('7', '1', '3', 'BEAN', '192.168.32.1:9999', 'demoJobHandler', '', '2018-05-09 22:40:51', '200', '调度机器：192.168.32.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.32.1:9999]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>失败处理策略：失败告警<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.32.1:9999<br>code：200<br>msg：null', '2018-05-09 22:41:01', '200', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_logglue`;
CREATE TABLE `xxl_job_qrtz_trigger_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` text COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_registry`;
CREATE TABLE `xxl_job_qrtz_trigger_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(255) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_registry
-- ----------------------------
