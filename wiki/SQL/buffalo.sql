/*
Navicat MySQL Data Transfer

Source Server         : 139.224.37.184
Source Server Version : 50641
Source Host           : 139.224.37.184:3306
Source Database       : buffalo

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2018-09-22 14:30:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for JOB_EXECUTION_LOG
-- ----------------------------
DROP TABLE IF EXISTS `JOB_EXECUTION_LOG`;
CREATE TABLE `JOB_EXECUTION_LOG` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) NOT NULL,
  `failure_cause` varchar(4000) DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `complete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of JOB_EXECUTION_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for JOB_STATUS_TRACE_LOG
-- ----------------------------
DROP TABLE IF EXISTS `JOB_STATUS_TRACE_LOG`;
CREATE TABLE `JOB_STATUS_TRACE_LOG` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `original_task_id` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `slave_id` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `execution_type` varchar(20) NOT NULL,
  `sharding_item` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of JOB_STATUS_TRACE_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '山东农信', null, '2018-01-22 19:00:23', '2018-01-23 12:40:46', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '沙县国际', null, '2018-01-22 19:00:38', '2018-01-23 12:42:04', '0', '0');
INSERT INTO `sys_dept` VALUES ('3', '潍坊农信', null, '2018-01-22 19:00:44', '2018-01-23 12:40:56', '0', '1');
INSERT INTO `sys_dept` VALUES ('4', '高新农信', null, '2018-01-22 19:00:52', '2018-01-23 12:41:11', '0', '3');
INSERT INTO `sys_dept` VALUES ('5', '院校农信', null, '2018-01-22 19:00:57', '2018-01-23 12:41:22', '0', '4');
INSERT INTO `sys_dept` VALUES ('6', '潍坊学院农信', '115', '2018-01-22 19:01:06', '2018-03-07 16:22:04', '0', '5');
INSERT INTO `sys_dept` VALUES ('7', '山东沙县', null, '2018-01-22 19:01:57', '2018-01-23 12:42:15', '0', '2');
INSERT INTO `sys_dept` VALUES ('8', '潍坊沙县', null, '2018-01-22 19:02:03', '2018-01-23 12:42:23', '0', '7');
INSERT INTO `sys_dept` VALUES ('9', '高新沙县', null, '2018-01-22 19:02:14', '2018-03-07 16:28:14', '0', '8');

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `idx1` (`ancestor`),
  KEY `idx2` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
INSERT INTO `sys_dept_relation` VALUES ('1', '1');
INSERT INTO `sys_dept_relation` VALUES ('1', '3');
INSERT INTO `sys_dept_relation` VALUES ('1', '4');
INSERT INTO `sys_dept_relation` VALUES ('1', '5');
INSERT INTO `sys_dept_relation` VALUES ('1', '6');
INSERT INTO `sys_dept_relation` VALUES ('2', '2');
INSERT INTO `sys_dept_relation` VALUES ('2', '7');
INSERT INTO `sys_dept_relation` VALUES ('2', '8');
INSERT INTO `sys_dept_relation` VALUES ('2', '9');
INSERT INTO `sys_dept_relation` VALUES ('3', '3');
INSERT INTO `sys_dept_relation` VALUES ('3', '4');
INSERT INTO `sys_dept_relation` VALUES ('3', '5');
INSERT INTO `sys_dept_relation` VALUES ('3', '6');
INSERT INTO `sys_dept_relation` VALUES ('4', '4');
INSERT INTO `sys_dept_relation` VALUES ('4', '5');
INSERT INTO `sys_dept_relation` VALUES ('4', '6');
INSERT INTO `sys_dept_relation` VALUES ('5', '5');
INSERT INTO `sys_dept_relation` VALUES ('5', '6');
INSERT INTO `sys_dept_relation` VALUES ('6', '6');
INSERT INTO `sys_dept_relation` VALUES ('7', '7');
INSERT INTO `sys_dept_relation` VALUES ('7', '8');
INSERT INTO `sys_dept_relation` VALUES ('7', '9');
INSERT INTO `sys_dept_relation` VALUES ('8', '8');
INSERT INTO `sys_dept_relation` VALUES ('8', '9');
INSERT INTO `sys_dept_relation` VALUES ('9', '9');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('2', '9', '异常', 'log_type', '日志异常', '1', '2017-12-28 13:06:39', '2018-01-06 10:54:41', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '0', '正常', 'log_type', '正常', '1', '2018-05-11 23:52:57', '2018-05-11 23:52:57', '123', '0');

-- ----------------------------
-- Table structure for sys_log_0
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_0`;
CREATE TABLE `sys_log_0` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of sys_log_0
-- ----------------------------
INSERT INTO `sys_log_0` VALUES ('1041705798102138882', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-17 23:09:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/79361537196990308', 'GET', '', '377', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041705828393402370', '0', '', 'pig-auth', 'anonymousUser', '2018-09-17 23:09:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B79361537196990308%5D&code=%5B6cn3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '648', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041705829265817602', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:09:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '183', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041705830704463874', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:09:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '265', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041705849675300866', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:10:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '196', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041705858340732930', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:10:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '94', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041706143503073282', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:11:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '121', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041706744957878274', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:13:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '118', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707319908876290', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/8', 'GET', '', '93', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707327634784258', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/9', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707333209014274', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:57', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/10', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707338208624642', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/12', 'GET', '', '96', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707348518223874', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:01', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/15', 'GET', '', '117', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707353886932994', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/1', 'GET', '', '89', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707363756130306', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/21', 'GET', '', '110', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707373331726338', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/24', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707380495597570', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:09', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/110', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707388053733378', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:10', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/112', 'GET', '', '98', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707393158201346', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/114', 'GET', '', '94', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707417896206338', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '111', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707418487603202', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '78', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707430374260738', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '79', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707442143477762', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '116', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707454294376450', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '102', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707491745316866', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:35', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/log/logPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '183', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707594153443330', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/dictPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '119', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707615787663362', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '104', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707622255280130', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/6', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707626273423362', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/5', 'GET', '', '88', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707628127305730', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:08', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/4', 'GET', '', '82', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707943455080450', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '130', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707977940647938', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '141', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041707986144706562', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '77', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708068541808642', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/type/log_type', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708330132160514', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:19:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '139', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708380946153474', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-17 23:20:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/59441537197606557', 'GET', '', '109', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708402861391874', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-17 23:20:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/63011537197611779', 'GET', '', '98', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708488374861826', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708540270985218', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:45', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '104', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041708553860530178', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:48', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '131', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865679290101762', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-18 09:45:11', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/code/65151537235107820', 'GET', '', '1317', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865691956899842', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-18 09:45:12', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/code/88771537235103459', 'GET', '', '7201', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865729802104834', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:45:21', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/user/info', 'GET', '', '1405', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865735065956354', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:45:22', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/menu/userMenu', 'GET', '', '1004', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865762572201986', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:45:29', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/menu/userMenu', 'GET', '', '449', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041865997461614594', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:46:25', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '1131', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041866066579550210', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:46:41', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/role/1', 'GET', '', '481', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041866406515306498', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:48:03', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '595', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041866596676661250', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:48:48', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/menu/allTree', 'GET', '', '2296', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041866943537213442', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:50:11', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '4723', '0', null);
INSERT INTO `sys_log_0` VALUES ('1041887711092404226', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-18 11:12:42', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/code/48271537240361537', 'GET', '', '603', '0', null);
INSERT INTO `sys_log_0` VALUES ('1042354323239034882', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:06:51', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/77401537351606830', 'GET', '', '3757', '0', null);
INSERT INTO `sys_log_0` VALUES ('1042354578978332674', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:07:52', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/91181537351671941', 'GET', '', '320', '0', null);
INSERT INTO `sys_log_0` VALUES ('1042354587488575490', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:07:54', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/33331537351673992', 'GET', '', '305', '0', null);
INSERT INTO `sys_log_0` VALUES ('1042354776559411202', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:08:39', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '/admin/code/84001537351718710', 'GET', '', '409', '0', null);
INSERT INTO `sys_log_0` VALUES ('1042992257857691650', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:21:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/97861537503706300', 'GET', '', '248', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1042992258411339778', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:21:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/97861537503706300', 'GET', '', '257', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1042992305731477506', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:22:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/91041537503718164', 'GET', '', '8', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1042992306054438914', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:22:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/91041537503718164', 'GET', '', '13', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043000809447972866', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:55:48', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/16301537505745602', 'GET', '', '13', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043000821208801282', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:55:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/45451537505748415', 'GET', '', '12', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043000821603065858', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:55:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/45451537505748415', 'GET', '', '15', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043001188822728706', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:57:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/20111537505835916', 'GET', '', '10', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043003966139842562', '0', '', 'pig-upms-service', 'admin', '2018-09-21 13:08:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '76', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043003967444271106', '0', '', 'pig-upms-service', 'admin', '2018-09-21 13:08:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '183', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043015785810108418', '0', '', 'buflo-auth', 'admin', '2018-09-21 13:55:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBwaWciLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbInNlcnZlciJdLCJleHAiOjE1Mzc1NDk2OTgsInVzZXJJZCI6MSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJqdGkiOiJiYTE2NDRiNi0zMGJlLTQxYTEtYjUyNi1lYzg3MmRlNDdhNzkiLCJjbGllbnRfaWQiOiJwaWcifQ.1360LWENRiVU5e2ll4QyRsk__W32GeQV1g46OKfh3vI%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBwaWciLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbInNlcnZlciJdLCJhdGkiOiJiYTE2NDRiNi0zMGJlLTQxYTEtYjUyNi1lYzg3MmRlNDdhNzkiLCJleHAiOjE1NDAwOTg0OTgsInVzZXJJZCI6MSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJqdGkiOiI2YmY1MGFkMi01NjNlLTQ5MWMtOGFjOS1hNzZmNDk4ZGYyODQiLCJjbGllbnRfaWQiOiJwaWcifQ.2EQaLO347Jrfx5xwv4-96v5KBgGNE4TywcdCJjX5goU%5D', '269', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043139631678627842', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:07:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/16311537538843195', 'GET', '', '141', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043139695767592962', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:07:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B16311537538843195%5D&code=%5Bdy66%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '10092', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043139696061194242', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:07:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B16311537538843195%5D&code=%5Bdy66%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '10095', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043139696266715138', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:07:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/80941537538858720', 'GET', '', '101', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043139769872556034', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:07:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B80941537538858720%5D&code=%5Baa4n%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '96', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043139770518478850', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:07:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/59321537538876389', 'GET', '', '127', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043139985728217090', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:08:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55861537538927720', 'GET', '', '112', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140008713003010', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:08:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/31851537538933215', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140370488500226', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:10:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B31851537538933215%5D&code=%5Bbm6c%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '67', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140535500808194', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:11:01', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/96141537539058793', 'GET', '', '109', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140537224667138', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:11:01', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/44931537539059217', 'GET', '', '93', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140561446772738', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:11:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B44931537539059217%5D&code=%5Bay2n%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '455', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043140562008809474', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:11:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/19391537539065119', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043142397255884802', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:18:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/98981537539465452', 'GET', '', '36392', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043143550081310722', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:23:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/82021537539541301', 'GET', '', '53183', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043143571623256066', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:23:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B98981537539465452%5D&code=%5Bn6gg%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '271472', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043143649251434498', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:23:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B82021537539541301%5D&code=%5Bxy7e%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '6025', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043143649775722498', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:23:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/95141537539801294', 'GET', '', '93', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043144633528827906', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:27:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/34981537540020843', 'GET', '', '15088', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043144980909473794', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:28:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/63101537540118659', 'GET', '', '92', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043145026958737410', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:28:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B63101537540118659%5D&code=%5Bb784%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '43', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043145027474636802', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:28:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/43651537540129759', 'GET', '', '94', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043145807652941826', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:31:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/97891537540315310', 'GET', '', '254', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043145808068177922', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:31:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/97891537540315310', 'GET', '', '310', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043145911340331010', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:32:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/19001537540340528', 'GET', '', '47', '0', 'Filter threw Exception');
INSERT INTO `sys_log_0` VALUES ('1043146075652190210', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:33:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/60831537540379360', 'GET', '', '388', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043146112343961602', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:33:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B60831537540379360%5D&code=%5Bb5c7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '350', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043150574890471426', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:50:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/99901537541452339', 'GET', '', '115', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043150710890778626', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:51:27', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/71081537541484293', 'GET', '', '601', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043150748966670338', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:51:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/31421537541493842', 'GET', '', '133', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043151249061924866', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:53:35', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/27031537541613092', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043151581422768130', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:54:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/72121537541692350', 'GET', '', '91', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043151866941624322', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:56:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/60211537541760392', 'GET', '', '119', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043151950219530242', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:56:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55221537541780272', 'GET', '', '98', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152589792169986', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:58:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B87791537541919255%5D&code=%5Bnfbg%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '7297', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152592707211266', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:58:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '299', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152691990581250', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/8', 'GET', '', '84', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152697241849858', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/9', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152712307789826', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/11', 'GET', '', '122', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043152976599273474', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:00:27', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '169', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153265062531074', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '150', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153286331846658', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/7', 'GET', '', '140', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153287086821378', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '126', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153350836047874', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/1', 'GET', '', '112', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153678620905474', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:03:15', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '132', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153690834718722', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:03:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '95', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153860511092738', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:03:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '119', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153869214273538', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/dictPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043153881709105154', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/type/log_type', 'GET', '', '179', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154076761018370', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/', 'POST', '', '149', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154098948886530', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154136605347842', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:05:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '88', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154171313213442', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:05:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '94', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154239575511042', '0', '', 'buflo-auth', 'admin', '2018-09-21 23:05:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzU4NTEyOSwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjZkZDNlY2Q0LTUyZmMtNDRlYi1iMzRhLTJmY2YxNzQ2ZGU1YyIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.Vp1r4q6xjop74WdK_WFz_vjo-gAFQrFAKLXpLqYgaaY%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6IjZkZDNlY2Q0LTUyZmMtNDRlYi1iMzRhLTJmY2YxNzQ2ZGU1YyIsImV4cCI6MTU0MDEzMzkyOSwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjhlOGVmODY4LTI4OTUtNGU0Yi04NmQ1LWU1NDhjMDhjYjdjYSIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.eU-mc-OxMQlTEDcEo6pSsG_EGePFRzonYoZH7unpG4Y%5D', '124', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154240158519298', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 23:05:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/67401537542326239', 'GET', '', '117', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154298882969602', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 23:05:42', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B67401537542326239%5D&code=%5B8mf4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bdemo%5D', '134', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154299482755074', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 23:05:43', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/19381537542340376', 'GET', '', '125', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154369565380610', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 23:05:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B19381537542340376%5D&code=%5B6y2b%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '278', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154426226233346', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:13', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '126', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154472267108354', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/dev', 'GET', '', '136', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154472850116610', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154527359291394', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154578953424898', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '74', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154600751222786', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '157', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154610712694786', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:57', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/15', 'GET', '', '86', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154624251908098', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '141', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154655642079234', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:08', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/dev', 'GET', '', '108', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154656153784322', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:08', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '86', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154674201874434', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleMenuUpd', 'PUT', 'menuIds=%5B1%2C2%5D&roleId=%5B15%5D', '227', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154701716508674', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '175', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154921959411714', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:08:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '72', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154956705026050', '0', '', 'buflo-auth', 'admin', '2018-09-21 23:08:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzU4NTU1NywidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjM5MmYyMjJmLWFiODUtNGY1MC05YTc5LWJhMWU4MzkwZDFmOSIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.x6DltpR4imYWdN50zpSMe9WiFG1NexUIAT64IuM_6EI%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6IjM5MmYyMjJmLWFiODUtNGY1MC05YTc5LWJhMWU4MzkwZDFmOSIsImV4cCI6MTU0MDEzNDM1NywidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjM3NThmMzM0LTJlZTAtNGU5YS1hZTMzLTBjNTVlMDA4NThiZSIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.P8LGNgcYhB7Ppdkgjtelv5eSX0jtrHkIk3njh2sQ1SQ%5D', '93', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043154957254479874', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 23:08:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/23041537542497224', 'GET', '', '95', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155008471126018', '0', '', 'buflo-upms-service', 'buflo', '2018-09-21 23:08:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '146', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155009142214658', '0', '', 'buflo-upms-service', 'buflo', '2018-09-21 23:08:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '99', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155068411924482', '0', '', 'buflo-upms-service', 'buflo', '2018-09-21 23:08:46', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '147', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155090301997058', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 23:08:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/43461537542528901', 'GET', '', '139', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155118856818690', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 23:08:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B43461537542528901%5D&code=%5Bg2wx%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '278', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155119645347842', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:08:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '174', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155120572289026', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:08:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '136', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155192529768450', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155198892527618', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/2', 'GET', '', '99', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155231901700098', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/15', 'GET', '', '93', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155255159115778', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/', 'PUT', '', '200', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155255796649986', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '118', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043155281901998082', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '71', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043171632452423682', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 00:14:35', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '116', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043349696159346690', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 12:02:10', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/25371537588925578', 'GET', '', '804', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043349840359518210', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 12:02:44', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '176', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043349841932382210', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 12:02:44', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '246', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043349860093718530', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 12:02:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '189', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043366005748199426', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 13:06:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/71311537592815083', 'GET', '', '118', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043366024094085122', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 13:07:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '152', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043366025192992770', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 13:07:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '141', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043378071506710530', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 13:54:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/36221537595691778', 'GET', '', '123', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382230146543618', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:11:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '123', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382461684707330', '0', '', 'buflo-auth', 'admin', '2018-09-22 14:12:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzYzMjE2MCwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjgwZTYwM2RlLTllNmUtNGQ4Yi1hYjc2LWNhODAwZTNiZDJlMyIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.HX9xAHrvp26qq_72L8_ZVluiSVQgXChj_4CGBlIFLrM%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6IjgwZTYwM2RlLTllNmUtNGQ4Yi1hYjc2LWNhODAwZTNiZDJlMyIsImV4cCI6MTU0MDE4MDk2MCwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjAzMTZiYTcxLTNlZTctNDc4Ni1hODAyLWI3NDliMGQ2NjQ4MiIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.b_5uJ8debxjMurYUNBFzqCghU2auU4Xxbf0pGzwj6f0%5D', '123', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382462351601666', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:12:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/79131537596738635', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382871493373954', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:13:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/27001537596836178', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382953093558274', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:14:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/13051537596855642', 'GET', '', '107', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043382975218511874', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:14:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/89771537596860914', 'GET', '', '110', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043383024514166786', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:14:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '123', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043383025470468098', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:14:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '125', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043385952339685378', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '122', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043385962590564354', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '104', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386198801182722', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '130', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386217151262722', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '81', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386223736320002', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/1', 'GET', '', '100', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386226772996098', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/2', 'GET', '', '139', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386235581034498', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/22', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386256011489282', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/24', 'GET', '', '87', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386262877564930', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/3', 'GET', '', '140', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386266245591042', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:29', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/31', 'GET', '', '82', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386271706574850', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/32', 'GET', '', '83', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386275271733250', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/33', 'GET', '', '89', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386279482814466', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/34', 'GET', '', '117', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386286038511618', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/4', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386289691750402', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:34', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/41', 'GET', '', '91', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386298290073602', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/45', 'GET', '', '118', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386301091868674', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/44', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386305680437250', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:38', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/43', 'GET', '', '96', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386353294176258', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/5', 'GET', '', '162', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386356452487170', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/51', 'GET', '', '106', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386362169323522', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/52', 'GET', '', '158', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386374051786754', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/62', 'GET', '', '100', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386388450832386', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/9', 'GET', '', '184', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386447426940930', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '172', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386448119001090', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '84', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386457732345858', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/10', 'GET', '', '82', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386474119491586', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '185', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386475079987202', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '122', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386478640951298', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/11', 'GET', '', '120', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386492402462722', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/12', 'GET', '', '150', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386512564482050', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:27', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '187', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386513373982722', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:27', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '79', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386524287561730', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '150', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386528901296130', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/15', 'GET', '', '84', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386537541562370', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '213', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386641732268034', '0', '', 'buflo-auth', 'admin', '2018-09-22 14:28:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzY0MDA3MiwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6ImZmNjczZDM1LTc3YjktNDk5Zi04ZGE0LTgyNzc0OThmNmYxYiIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.4p-NG8cjrJpKm3mPFNUNlRQflLu-LxlAF9evLDKTniI%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6ImZmNjczZDM1LTc3YjktNDk5Zi04ZGE0LTgyNzc0OThmNmYxYiIsImV4cCI6MTU0MDE4ODg3MiwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjZjMDllZjdmLTNiYjgtNGJiMC1iMTAyLTQ2N2YxYzYyN2I4NiIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.b0cAHSzM8K6HMr43Mvp8TSr4qdyur5C78ILr_vK561A%5D', '105', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386642373996546', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:28:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/11291537597735236', 'GET', '', '114', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386661219004418', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-22 14:29:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B11291537597735236%5D&code=%5Bwge3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '388', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386728474669058', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '122', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386766454091778', '0', '', 'buflo-auth', 'admin', '2018-09-22 14:29:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzY0MDkzOSwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6IjQ5MWZkM2E2LTA3NWYtNDk4MC1iNzJlLWE3M2QxOGQ2Mjg2MiIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.UyD6v8Reqaz2twtklbRY1GpsB3NwsDB8oiRF3b2ezNI%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6IjQ5MWZkM2E2LTA3NWYtNDk4MC1iNzJlLWE3M2QxOGQ2Mjg2MiIsImV4cCI6MTU0MDE4OTczOSwidXNlcklkIjoxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIiwiUk9MRV9VU0VSIl0sImp0aSI6ImU0N2ZkN2ViLTFlOTAtNDMxNy1iNDJiLWNiOTU5YjY0NzM1MCIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.F5Lx3aQ3dVgLSFCElohpixSMsxxtjU4YFUdFKjYy8Oo%5D', '81', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386767074848770', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 14:29:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/43521537597764965', 'GET', '', '116', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386785353625602', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-22 14:29:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B43521537597764965%5D&code=%5Bwfg3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '259', '0', null);
INSERT INTO `sys_log_0` VALUES ('1043386786045685762', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '155', '0', null);

-- ----------------------------
-- Table structure for sys_log_1
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_1`;
CREATE TABLE `sys_log_1` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of sys_log_1
-- ----------------------------
INSERT INTO `sys_log_1` VALUES ('1041705862153355265', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:10:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '108', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041706151321255937', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:11:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707313621614593', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707335171948545', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:15:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/11', 'GET', '', '89', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707358592942081', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/2', 'GET', '', '88', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707369590407169', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/22', 'GET', '', '87', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707383653908481', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:09', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/111', 'GET', '', '89', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707404528959489', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '143', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707429841584129', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/1', 'GET', '', '91', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707491397189633', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:16:35', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/type/log_type', 'GET', '', '127', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707631419834369', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:17:08', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/3', 'GET', '', '111', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707923729268737', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '117', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041707985628807169', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/1', 'GET', '', '90', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708000451477505', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '145', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708021284585473', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '143', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708059079458817', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '141', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708062267129857', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '99', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708066679537665', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '100', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708068319510529', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:18:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/log/logPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '118', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708380342173697', '0', '', 'pig-auth', 'admin', '2018-09-17 23:20:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBwaWciLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbInNlcnZlciJdLCJleHAiOjE1MzcyNDAxOTcsInVzZXJJZCI6MSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJqdGkiOiI5MDk5MjM3Zi1jZmY3LTQzODMtYWJlOC1hZTMyY2U5NzI4ZTUiLCJjbGllbnRfaWQiOiJwaWcifQ.rcaU1Q5YGeLt4HFXgiMJlMN5QppHueDxfX1OeVfzEyA%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBwaWciLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbInNlcnZlciJdLCJhdGkiOiI5MDk5MjM3Zi1jZmY3LTQzODMtYWJlOC1hZTMyY2U5NzI4ZTUiLCJleHAiOjE1Mzk3ODg5OTcsInVzZXJJZCI6MSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJqdGkiOiIxMzJlNWY2OC04MDkyLTQ0NWItODdkZC0yNzkzNTJiY2JkNmIiLCJjbGllbnRfaWQiOiJwaWcifQ.N7pq5PyuIs1XnTjNbJBNhKM0afbgKt4iOuR8R1yRZZA%5D', '128', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708477947822081', '0', '', 'pig-auth', 'anonymousUser', '2018-09-17 23:20:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B59441537197606557%5D&code=%5Bgbmb%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '440', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708478589550593', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '133', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708479503908865', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708494821507073', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:34', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '134', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041708542925979649', '0', '', 'pig-upms-service', 'admin', '2018-09-17 23:20:46', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '101', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041865687045369857', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-18 09:45:11', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/code/11821537235109018', 'GET', '', '589', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041865723368042497', '0', '', 'pig-auth', 'anonymousUser', '2018-09-18 09:45:20', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B11821537235109018%5D&code=%5Bnfy2%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '5195', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866019108417537', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:46:30', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/menu/roleTree/ROLE_ADMIN', 'GET', '', '1116', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866028239417345', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:46:32', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/menu/allTree', 'GET', '', '1959', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866178873651201', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:47:08', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '519', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866572559413249', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:48:42', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '3841', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866604733919233', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:48:50', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/log/logPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '872', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866605706997761', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:48:50', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/dict/type/log_type', 'GET', '', '667', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041866893763407873', '0', '', 'pig-upms-service', 'admin', '2018-09-18 09:50:00', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/log/logPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D&type=%5B9%5D', '2066', '0', null);
INSERT INTO `sys_log_1` VALUES ('1041867007319994369', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-18 09:50:26', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0', '/admin/code/13231537235425637', 'GET', '', '437', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042354454759825409', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:07:22', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/73151537351642087', 'GET', '', '505', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042354540520759297', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:07:43', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/74721537351661484', 'GET', '', '1574', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042354617721118721', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:08:01', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/65361537351680517', 'GET', '', '970', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042354897170817025', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:09:08', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '/admin/code/77111537351746989', 'GET', '', '1048', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042354923997585409', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-19 18:09:14', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '/admin/code/60021537351754112', 'GET', '', '347', '0', null);
INSERT INTO `sys_log_1` VALUES ('1042993016301101057', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:24:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55951537503887572', 'GET', '', '11', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1042993016607285249', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:24:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55951537503887572', 'GET', '', '17', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1042993127248830465', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:25:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/24821537503914011', 'GET', '', '26', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1042993127550820353', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:25:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/24821537503914011', 'GET', '', '29', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1042993255389011969', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:25:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/78131537503944575', 'GET', '', '7', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1042993255628087297', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:25:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/78131537503944575', 'GET', '', '12', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043000058382344193', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:52:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55481537505565948', 'GET', '', '306', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043000058793385985', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:52:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/55481537505565948', 'GET', '', '329', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043000809741574145', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:55:48', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/16301537505745602', 'GET', '', '21', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043001020236914689', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:56:38', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/17071537505795449', 'GET', '', '289', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043001020501155841', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:56:38', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/17071537505795449', 'GET', '', '299', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043001189288296449', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 12:57:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/20111537505835916', 'GET', '', '17', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043001347489054721', '0', '', 'pig-upms-service', 'anonymousUser', '2018-09-21 12:57:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/71721537505873285', 'GET', '', '614', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043003965724606465', '0', '', 'pig-auth', 'anonymousUser', '2018-09-21 13:08:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B71721537505873285%5D&code=%5Bp4ye%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '1132', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043015788116975617', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 13:55:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/15991537509316112', 'GET', '', '679', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043015797310889985', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 13:55:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/31341537509318887', 'GET', '', '109', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043015828927553537', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 13:55:29', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/46951537509326421', 'GET', '', '109', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043040713112428545', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 15:34:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/smsCode/18017744799', 'GET', '', '292', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043042909119979521', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 15:43:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/64931537515782798', 'GET', '', '142', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043139801006874625', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:08:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B59321537538876389%5D&code=%5B66xw%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '58', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043139801422110721', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:08:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/11031537538883803', 'GET', '', '95', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043140008205492225', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:08:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B55861537538927720%5D&code=%5Banaf%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '72', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043140371063119873', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:10:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/73951537539019586', 'GET', '', '117', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043141330732457985', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:14:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B19391537539065119%5D&code=%5Ba8mg%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '4337', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043141331579707393', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:14:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/94791537539248533', 'GET', '', '170', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043141375263383553', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:14:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B94791537539248533%5D&code=%5Bnf5e%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '41', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043141375867363329', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:14:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/95711537539259116', 'GET', '', '150', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043142397671120897', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:18:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B95711537539259116%5D&code=%5Ba5y6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '67332', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043143550387494913', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:23:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/82021537539541301', 'GET', '', '59014', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144464150249473', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:26:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B95141537539801294%5D&code=%5Banmf%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '2242', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144470479454209', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:26:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/77571537539995424', 'GET', '', '1626', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144692978892801', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:27:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B34981537540020843%5D&code=%5Bfxan%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '3223', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144693553512449', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:27:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/98531537540050133', 'GET', '', '102', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144944104456193', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:28:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B98531537540050133%5D&code=%5B2384%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bbuflo%5D', '43', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043144944695853057', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:28:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/47391537540110002', 'GET', '', '100', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043145911604572161', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:32:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/19001537540340528', 'GET', '', '101', '0', 'Filter threw Exception');
INSERT INTO `sys_log_1` VALUES ('1043146112893415425', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:33:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/97621537540388516', 'GET', '', '120', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043146915901210625', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:36:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/33011537540579103', 'GET', '', '679', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043146955138924545', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:36:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B33011537540579103%5D&code=%5Bex8e%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '454', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043146955730321409', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:36:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/32151537540589497', 'GET', '', '118', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043150517357203457', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:50:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/80981537541438125', 'GET', '', '320', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043150748312358913', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:51:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B71081537541484293%5D&code=%5Bne3x%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '397', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151120691056641', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:53:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/42921537541582450', 'GET', '', '139', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151173170188289', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:53:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/66251537541594999', 'GET', '', '109', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151209404780545', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:53:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/22541537541603654', 'GET', '', '91', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151434387247105', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:54:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/24561537541657260', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151504012693505', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:54:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B24561537541657260%5D&code=%5B4ppc%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '69', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151504650227713', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:54:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/89501537541674021', 'GET', '', '118', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151572098830337', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:54:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/80081537541690129', 'GET', '', '92', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043151949695242241', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 22:56:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B60211537541760392%5D&code=%5Bbxnn%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '497', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152533303283713', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-21 22:58:42', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/87791537541919255', 'GET', '', '130', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152590912049153', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:58:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '234', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152622872645633', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '199', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152681429323777', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152706783891457', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/10', 'GET', '', '95', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152714551742465', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 22:59:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/12', 'GET', '', '91', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043152952758849537', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:00:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '171', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153163191275521', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '159', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153312403640321', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '129', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153313091506177', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '126', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153330225238017', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/1', 'GET', '', '110', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153331005378561', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '124', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153351419056129', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:01:57', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '82', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153417651310593', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:02:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '107', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153564242235393', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:02:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '118', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153580574855169', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:02:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '144', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153657477419009', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:03:10', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/route/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '156', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153881411309569', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/log/logPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '181', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043153920246370305', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '123', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154049896501249', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:43', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154077339832321', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '91', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154098403627009', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:04:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/dev', 'GET', '', '143', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154136030728193', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:05:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/demo', 'GET', '', '157', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154170751176705', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:05:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/ROLE_ADMIN', 'GET', '', '119', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154370156777473', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:05:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '120', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154370915946497', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154501887283201', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleMenuUpd', 'PUT', 'menuIds=%5B1%2C2%5D&roleId=%5B15%5D', '260', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154502478680065', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154503002968065', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/dev', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154515132895233', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:34', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '163', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154527984242689', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '113', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154578412359681', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154615242543105', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:06:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '127', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154623467573249', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/', 'PUT', '', '191', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154674734551041', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '92', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154675531468801', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/roleTree/dev', 'GET', '', '132', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154721165496321', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '110', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154721798836225', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:07:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043154921527398401', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:08:11', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '129', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155007800037377', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-21 23:08:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B23041537542497224%5D&code=%5B8ym2%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bbuflo%5D', '284', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155041044090881', '0', '', 'buflo-upms-service', 'buflo', '2018-09-21 23:08:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '109', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155061742981121', '0', '', 'buflo-upms-service', 'buflo', '2018-09-21 23:08:44', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '152', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155089597353985', '0', '', 'buflo-auth', 'buflo', '2018-09-21 23:08:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/authentication/removeToken', 'POST', 'accesstoken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImJ1ZmxvIiwic2NvcGUiOlsic2VydmVyIl0sImV4cCI6MTUzNzU4NTcwOSwidXNlcklkIjo0LCJhdXRob3JpdGllcyI6WyJkZW1vIiwiUk9MRV9VU0VSIl0sImp0aSI6ImVlZmUyYjc2LThlNjMtNDMxOS04NWU4LWI5YjliM2E4OTQzMiIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.G64bPvnnf1qV73CKB2z77AY92N2JpzmsjWGII2xUFEk%5D&refreshToken=%5BeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsaWNlbnNlIjoibWFkZSBieSBidWZsbyIsInVzZXJfbmFtZSI6ImJ1ZmxvIiwic2NvcGUiOlsic2VydmVyIl0sImF0aSI6ImVlZmUyYjc2LThlNjMtNDMxOS04NWU4LWI5YjliM2E4OTQzMiIsImV4cCI6MTU0MDEzNDUwOSwidXNlcklkIjo0LCJhdXRob3JpdGllcyI6WyJkZW1vIiwiUk9MRV9VU0VSIl0sImp0aSI6IjRiMGE0ZjUzLWZiNTMtNGQ1My04MDNlLTEzNzY3Mzc0OGFjNSIsImNsaWVudF9pZCI6ImJ1ZmxvIn0.2RLAf1RmO-QOF1mQu4X95z5TWYBG9kLpPJwe4-hHSLM%5D', '79', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155140063219713', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '135', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155157385695233', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '177', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155223181742081', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/rolePage', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '120', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155238683889665', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:27', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dept/tree', 'GET', '', '129', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155266525679617', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '144', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043155281449013249', '0', '', 'buflo-upms-service', 'admin', '2018-09-21 23:09:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/1', 'GET', '', '143', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043171623719882753', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 00:14:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/dict/dictPage', 'GET', 'orderByField=%5Bcreate_time%5D&limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '118', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043171639830204417', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 00:14:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '164', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043171649103810561', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 00:14:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/4', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043171649594544129', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 00:14:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/role/roleList/1', 'GET', '', '72', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043349839533240321', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-22 12:02:44', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B25371537588925578%5D&code=%5Bpdep%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '724', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043361583450222593', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 12:49:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '206', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043361708604059649', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 12:49:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '148', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043363646670303233', '0', '', 'buflo-upms-service', 'anonymousUser', '2018-09-22 12:57:36', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/code/37241537592252621', 'GET', '', '135', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043366023343304705', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-22 13:07:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B71311537592815083%5D&code=%5Bygcp%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '305', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043382246273642497', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:11:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '153', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043383023868243969', '0', '', 'buflo-auth', 'anonymousUser', '2018-09-22 14:14:35', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/auth/oauth/token', 'POST', 'password=%5BlBTqrKS0kZixOFXeZ0HRng%3D%3D%5D&randomStr=%5B89771537596860914%5D&code=%5Bp8g4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '385', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043385922459463681', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:07', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '210', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043385951656013825', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/7', 'DELETE', '', '191', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043385974737268737', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386126327803905', '9', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/upload', 'POST', '', '1123', '0', '{\"msg\":\"无法获取服务端连接资源：can\'t create connection to/127.0.0.1:22122\",\"code\":1,\"data\":null}');
INSERT INTO `sys_log_1` VALUES ('1043386142740115457', '9', '', 'buflo-upms-service', 'admin', '2018-09-22 14:26:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/upload', 'POST', '', '121', '0', '{\"msg\":\"Unable to borrow buffer from pool\",\"code\":1,\"data\":null}');
INSERT INTO `sys_log_1` VALUES ('1043386188118290433', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:10', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386212852101121', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/userPage', 'GET', 'limit=%5B20%5D&page=%5B1%5D&isAsc=%5Bfalse%5D', '131', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386232292700161', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/21', 'GET', '', '98', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386247228616705', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:24', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/23', 'GET', '', '100', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386308993937409', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/42', 'GET', '', '97', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386311221112833', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/41', 'GET', '', '111', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386368439808001', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/6', 'GET', '', '121', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386371262574593', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/61', 'GET', '', '105', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386376815833089', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/63', 'GET', '', '152', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386381807054849', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:27:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/8', 'GET', '', '206', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386486941478913', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '219', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386487595790337', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '103', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386501525073921', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/', 'PUT', '', '225', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386502179385345', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '96', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386505606131713', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/13', 'GET', '', '145', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386516951724033', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/14', 'GET', '', '143', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386524954456065', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '82', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386538271371265', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '76', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386551982551041', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:28:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/allTree', 'GET', '', '110', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386661915258881', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/user/info', 'GET', '', '141', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386662900920321', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:03', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '156', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386701232664577', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '150', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386727648391169', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/pig', 'DELETE', '', '186', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386742567530497', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '162', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386786846797825', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/menu/userMenu', 'GET', '', '115', '0', null);
INSERT INTO `sys_log_1` VALUES ('1043386810003550209', '0', '', 'buflo-upms-service', 'admin', '2018-09-22 14:29:38', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', '/admin/client/page', 'GET', 'limit=%5B20%5D&page=%5B1%5D', '131', '0', null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `url` varchar(128) DEFAULT NULL COMMENT '请求链接',
  `method` varchar(32) DEFAULT NULL COMMENT '请求方法',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '0--正常 1--删除',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '/admin', null, null, '-1', 'icon-xitongguanli', 'Layout', '1', '0', '2017-11-07 20:56:00', '2018-05-14 21:53:22', '0');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', null, 'user', '', null, '1', 'icon-yonghuguanli', 'views/admin/user/index', '2', '0', '2017-11-02 22:24:37', '2018-05-14 22:11:35', '0');
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', null, 'menu', '', null, '1', 'icon-caidanguanli', 'views/admin/menu/index', '3', '0', '2017-11-08 09:57:27', '2018-05-14 22:11:21', '0');
INSERT INTO `sys_menu` VALUES ('4', '角色管理', null, 'role', null, null, '1', 'icon-jiaoseguanli', 'views/admin/role/index', '4', '0', '2017-11-08 10:13:37', '2018-05-14 22:11:19', '0');
INSERT INTO `sys_menu` VALUES ('5', '日志管理', null, 'log', null, null, '1', 'icon-rizhiguanli', 'views/admin/log/index', '5', '0', '2017-11-20 14:06:22', '2018-05-14 22:11:18', '0');
INSERT INTO `sys_menu` VALUES ('6', '字典管理', null, 'dict', null, null, '1', 'icon-zygl', 'views/admin/dict/index', '6', '0', '2017-11-29 11:30:52', '2018-05-14 22:12:48', '0');
INSERT INTO `sys_menu` VALUES ('7', '部门管理', null, 'dept', null, null, '1', 'icon-iconbmgl', 'views/admin/dept/index', '7', '0', '2018-01-20 13:17:19', '2018-05-14 22:11:16', '0');
INSERT INTO `sys_menu` VALUES ('8', '系统监控', null, '', null, null, '-1', 'icon-iconbmgl', null, '8', '0', '2018-01-22 12:30:41', '2018-05-14 20:41:16', '0');
INSERT INTO `sys_menu` VALUES ('9', '服务监控', null, '', null, null, '8', 'icon-jiankong', null, '9', '0', '2018-01-23 10:53:33', '2018-04-21 03:51:56', '0');
INSERT INTO `sys_menu` VALUES ('10', 'zipkin监控', null, '', null, null, '8', 'icon-jiankong', null, '11', '0', '2018-01-23 10:55:18', '2018-04-22 07:02:34', '0');
INSERT INTO `sys_menu` VALUES ('11', 'pinpoint监控', null, '', null, null, '8', 'icon-xiazaihuancun', null, '10', '0', '2018-01-25 11:08:52', '2018-04-22 07:02:38', '0');
INSERT INTO `sys_menu` VALUES ('12', '缓存状态', null, '', null, null, '8', 'icon-ecs-status', null, '12', '0', '2018-01-23 10:56:11', '2018-04-21 03:51:47', '0');
INSERT INTO `sys_menu` VALUES ('13', 'ELK状态', null, '', null, null, '8', 'icon-ecs-status', null, '13', '0', '2018-01-23 10:55:47', '2018-04-21 03:51:40', '0');
INSERT INTO `sys_menu` VALUES ('14', '接口文档', null, '', null, null, '8', 'icon-wendangdocument72', null, '14', '0', '2018-01-23 10:56:43', '2018-04-21 03:50:47', '0');
INSERT INTO `sys_menu` VALUES ('15', '任务监控', null, '', null, null, '8', 'icon-jiankong', null, '15', '0', '2018-01-23 10:55:18', '2018-04-21 03:51:34', '0');
INSERT INTO `sys_menu` VALUES ('21', '用户查看', '', null, '/admin/user/**', 'GET', '2', null, null, null, '1', '2017-11-07 20:58:05', '2018-02-04 14:28:49', '0');
INSERT INTO `sys_menu` VALUES ('22', '用户新增', 'sys_user_add', null, '/admin/user/*', 'POST', '2', null, null, null, '1', '2017-11-08 09:52:09', '2017-12-04 16:31:10', '0');
INSERT INTO `sys_menu` VALUES ('23', '用户修改', 'sys_user_upd', null, '/admin/user/**', 'PUT', '2', null, null, null, '1', '2017-11-08 09:52:48', '2018-01-17 17:40:01', '0');
INSERT INTO `sys_menu` VALUES ('24', '用户删除', 'sys_user_del', null, '/admin/user/*', 'DELETE', '2', null, null, null, '1', '2017-11-08 09:54:01', '2017-12-04 16:31:18', '0');
INSERT INTO `sys_menu` VALUES ('31', '菜单查看', null, null, '/admin/menu/**', 'GET', '3', null, null, null, '1', '2017-11-08 09:57:56', '2017-11-14 17:29:17', '0');
INSERT INTO `sys_menu` VALUES ('32', '菜单新增', 'sys_menu_add', null, '/admin/menu/*', 'POST', '3', null, null, null, '1', '2017-11-08 10:15:53', '2018-01-20 14:37:50', '0');
INSERT INTO `sys_menu` VALUES ('33', '菜单修改', 'sys_menu_edit', null, '/admin/menu/*', 'PUT', '3', null, null, null, '1', '2017-11-08 10:16:23', '2018-01-20 14:37:56', '0');
INSERT INTO `sys_menu` VALUES ('34', '菜单删除', 'sys_menu_del', null, '/admin/menu/*', 'DELETE', '3', null, null, null, '1', '2017-11-08 10:16:43', '2018-01-20 14:38:03', '0');
INSERT INTO `sys_menu` VALUES ('41', '角色查看', null, null, '/admin/role/**', 'GET', '4', null, null, null, '1', '2017-11-08 10:14:01', '2018-02-04 13:55:06', '0');
INSERT INTO `sys_menu` VALUES ('42', '角色新增', 'sys_role_add', null, '/admin/role/*', 'POST', '4', null, null, null, '1', '2017-11-08 10:14:18', '2018-04-20 07:21:38', '0');
INSERT INTO `sys_menu` VALUES ('43', '角色修改', 'sys_role_edit', null, '/admin/role/*', 'PUT', '4', null, null, null, '1', '2017-11-08 10:14:41', '2018-04-20 07:21:50', '0');
INSERT INTO `sys_menu` VALUES ('44', '角色删除', 'sys_role_del', null, '/admin/role/*', 'DELETE', '4', null, null, null, '1', '2017-11-08 10:14:59', '2018-04-20 07:22:00', '0');
INSERT INTO `sys_menu` VALUES ('45', '分配权限', 'sys_role_perm', null, '/admin/role/*', 'PUT', '4', null, null, null, '1', '2018-04-20 07:22:55', '2018-04-20 07:24:40', '0');
INSERT INTO `sys_menu` VALUES ('51', '日志查看', null, null, '/admin/log/**', 'GET', '5', null, null, null, '1', '2017-11-20 14:07:25', '2018-02-04 14:28:53', '0');
INSERT INTO `sys_menu` VALUES ('52', '日志删除', 'sys_log_del', null, '/admin/log/*', 'DELETE', '5', null, null, null, '1', '2017-11-20 20:37:37', '2017-11-28 17:36:52', '0');
INSERT INTO `sys_menu` VALUES ('61', '字典查看', null, null, '/admin/dict/**', 'GET', '6', null, null, null, '1', '2017-11-19 22:04:24', '2017-11-29 11:31:24', '0');
INSERT INTO `sys_menu` VALUES ('62', '字典删除', 'sys_dict_del', null, '/admin/dict/**', 'DELETE', '6', null, null, null, '1', '2017-11-29 11:30:11', '2018-01-07 15:40:51', '0');
INSERT INTO `sys_menu` VALUES ('63', '字典新增', 'sys_dict_add', null, '/admin/dict/**', 'POST', '6', null, null, null, '1', '2018-05-11 22:34:55', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '字典修改', 'sys_dict_upd', null, '/admin/dict/**', 'PUT', '6', null, null, null, '1', '2018-05-11 22:36:03', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '部门查看', '', null, '/admin/dept/**', 'GET', '7', null, '', null, '1', '2018-01-20 13:17:19', '2018-01-20 14:55:24', '0');
INSERT INTO `sys_menu` VALUES ('72', '部门新增', 'sys_dept_add', null, '/admin/dept/**', 'POST', '7', null, null, null, '1', '2018-01-20 14:56:16', '2018-01-20 21:17:57', '0');
INSERT INTO `sys_menu` VALUES ('73', '部门修改', 'sys_dept_edit', null, '/admin/dept/**', 'PUT', '7', null, null, null, '1', '2018-01-20 14:56:59', '2018-01-20 21:17:59', '0');
INSERT INTO `sys_menu` VALUES ('74', '部门删除', 'sys_dept_del', null, '/admin/dept/**', 'DELETE', '7', null, null, null, '1', '2018-01-20 14:57:28', '2018-01-20 21:18:05', '0');
INSERT INTO `sys_menu` VALUES ('100', '客户端管理', '', 'client', '', '', '1', 'icon-bangzhushouji', 'views/admin/client/index', '9', '0', '2018-01-20 13:17:19', '2018-05-15 21:28:10', '0');
INSERT INTO `sys_menu` VALUES ('101', '客户端新增', 'sys_client_add', null, '/admin/client/**', 'POST', '100', '1', null, null, '1', '2018-05-15 21:35:18', '2018-05-16 10:35:26', '0');
INSERT INTO `sys_menu` VALUES ('102', '客户端修改', 'sys_client_upd', null, '/admin/client/**', 'PUT', '100', null, null, null, '1', '2018-05-15 21:37:06', '2018-05-15 21:52:30', '0');
INSERT INTO `sys_menu` VALUES ('103', '客户端删除', 'sys_client_del', null, '/admin/client/**', 'DELETE', '100', null, null, null, '1', '2018-05-15 21:39:16', '2018-05-15 21:52:34', '0');
INSERT INTO `sys_menu` VALUES ('104', '客户端查看', null, null, '/admin/client/**', 'GET', '100', null, null, null, '1', '2018-05-15 21:39:57', '2018-05-15 21:52:40', '0');
INSERT INTO `sys_menu` VALUES ('110', '路由管理', null, 'route', null, null, '1', 'icon-luyou', 'views/admin/route/index', '8', '0', '2018-05-15 21:44:51', '2018-05-16 06:58:20', '0');
INSERT INTO `sys_menu` VALUES ('111', '路由查看', null, null, '/admin/route/**', 'GET', '110', null, null, null, '1', '2018-05-15 21:45:59', '2018-05-16 07:23:04', '0');
INSERT INTO `sys_menu` VALUES ('112', '路由新增', 'sys_route_add', null, '/admin/route/**', 'POST', '110', null, null, null, '1', '2018-05-15 21:52:22', '2018-05-15 21:53:46', '0');
INSERT INTO `sys_menu` VALUES ('113', '路由修改', 'sys_route_upd', null, '/admin/route/**', 'PUT', '110', null, null, null, '1', '2018-05-15 21:55:38', null, '0');
INSERT INTO `sys_menu` VALUES ('114', '路由删除', 'sys_route_del', null, '/admin/route/**', 'DELETE', '110', null, null, null, '1', '2018-05-15 21:56:45', null, '0');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(40) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('app', null, 'app', 'server', 'password,refresh_token', null, null, null, null, null, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('buflo', null, 'buflo', 'server', 'password,refresh_token,authorization_code', null, null, null, null, null, 'true');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_idx1_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'ROLE_ADMIN', '超级管理员', '2017-10-29 15:45:51', '2018-04-22 11:40:29', '0');
INSERT INTO `sys_role` VALUES ('14', 'demo', 'demo', 'demo用户', '2018-04-20 07:14:32', '2018-04-21 23:35:22', '0');
INSERT INTO `sys_role` VALUES ('15', 'buflo', 'dev', '开发人员', '2018-09-21 23:04:49', null, '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('11', '1', '1');
INSERT INTO `sys_role_dept` VALUES ('14', '14', '1');
INSERT INTO `sys_role_dept` VALUES ('17', '15', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('14', '1');
INSERT INTO `sys_role_menu` VALUES ('14', '2');
INSERT INTO `sys_role_menu` VALUES ('14', '3');
INSERT INTO `sys_role_menu` VALUES ('14', '4');
INSERT INTO `sys_role_menu` VALUES ('14', '5');
INSERT INTO `sys_role_menu` VALUES ('14', '6');
INSERT INTO `sys_role_menu` VALUES ('14', '7');
INSERT INTO `sys_role_menu` VALUES ('14', '8');
INSERT INTO `sys_role_menu` VALUES ('14', '9');
INSERT INTO `sys_role_menu` VALUES ('14', '10');
INSERT INTO `sys_role_menu` VALUES ('14', '11');
INSERT INTO `sys_role_menu` VALUES ('14', '12');
INSERT INTO `sys_role_menu` VALUES ('14', '13');
INSERT INTO `sys_role_menu` VALUES ('14', '14');
INSERT INTO `sys_role_menu` VALUES ('14', '15');
INSERT INTO `sys_role_menu` VALUES ('14', '21');
INSERT INTO `sys_role_menu` VALUES ('14', '31');
INSERT INTO `sys_role_menu` VALUES ('14', '41');
INSERT INTO `sys_role_menu` VALUES ('14', '51');
INSERT INTO `sys_role_menu` VALUES ('14', '61');
INSERT INTO `sys_role_menu` VALUES ('14', '71');
INSERT INTO `sys_role_menu` VALUES ('15', '1');
INSERT INTO `sys_role_menu` VALUES ('15', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '简介',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_idx1_username` (`username`),
  UNIQUE KEY `user_idx2_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$vg5QNHhCknAqevx9vM2s5esllJEzF/pa8VZXtFYHhhOhUcCw/GWyS', null, '17034642111', null, '1', '2018-04-20 07:15:18', '2018-05-11 17:12:00', '0');
INSERT INTO `sys_user` VALUES ('4', 'buflo', '$2a$10$vg5QNHhCknAqevx9vM2s5esllJEzF/pa8VZXtFYHhhOhUcCw/GWyS', null, '17034642118', null, '1', '2018-04-22 11:39:07', '2018-09-21 09:48:46', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('4', '14');

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'router Id',
  `path` varchar(255) NOT NULL COMMENT '路由路径',
  `service_id` varchar(255) NOT NULL COMMENT '服务名称',
  `url` varchar(255) DEFAULT NULL COMMENT 'url代理',
  `strip_prefix` char(1) DEFAULT '1' COMMENT '转发去掉前缀',
  `retryable` char(1) DEFAULT '1' COMMENT '是否重试',
  `enabled` char(1) DEFAULT '1' COMMENT '是否启用',
  `sensitiveHeaders_list` varchar(255) DEFAULT NULL COMMENT '敏感请求头',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='动态路由配置表';

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES ('1', 'test', 'test', 'tsest', '1', '1', '1', '0', '2018-05-16 07:28:43', '2018-05-16 07:35:08', '1');
INSERT INTO `sys_zuul_route` VALUES ('2', 'sdfg', 'we', 'jjj', '1', '1', '1', 'jj', '2018-05-16 07:35:43', '2018-05-17 13:56:14', '1');
INSERT INTO `sys_zuul_route` VALUES ('3', '/demo/**', 'buflo-demo-service', '', '1', '1', '1', '', '2018-05-17 14:09:06', '2018-09-20 22:45:43', '0');
INSERT INTO `sys_zuul_route` VALUES ('4', '/admin/**', 'buflo-upms-service', '', '1', '1', '1', '', '2018-05-21 11:40:38', '2018-09-21 13:13:58', '0');
INSERT INTO `sys_zuul_route` VALUES ('5', '/auth/**', 'buflo-auth', '', '1', '1', '1', '', '2018-05-21 11:41:08', '2018-09-21 13:14:01', '0');

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) COMMENT 'Ignore insert on duplicate',
  UNIQUE KEY `trace_id_high_4` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) COMMENT 'Ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`span_id`) COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name` (`endpoint_service_name`) COMMENT 'for getTraces and getServiceNames',
  KEY `a_type` (`a_type`) COMMENT 'for getTraces',
  KEY `a_key` (`a_key`) COMMENT 'for getTraces',
  KEY `trace_id` (`trace_id`,`span_id`,`a_key`) COMMENT 'for dependencies job',
  KEY `trace_id_high_5` (`trace_id_high`,`trace_id`,`span_id`) COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_6` (`trace_id_high`,`trace_id`) COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name_2` (`endpoint_service_name`) COMMENT 'for getTraces and getServiceNames',
  KEY `a_type_2` (`a_type`) COMMENT 'for getTraces',
  KEY `a_key_2` (`a_key`) COMMENT 'for getTraces',
  KEY `trace_id_2` (`trace_id`,`span_id`,`a_key`) COMMENT 'for dependencies job'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_annotations
-- ----------------------------

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies` (
  `day` date NOT NULL,
  `parent` varchar(255) NOT NULL,
  `child` varchar(255) NOT NULL,
  `call_count` bigint(20) DEFAULT NULL,
  UNIQUE KEY `day` (`day`,`parent`,`child`),
  UNIQUE KEY `day_2` (`day`,`parent`,`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_dependencies
-- ----------------------------

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `debug` bit(1) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`id`) COMMENT 'ignore insert on duplicate',
  UNIQUE KEY `trace_id_high_4` (`trace_id_high`,`trace_id`,`id`) COMMENT 'ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`id`) COMMENT 'for joining with zipkin_annotations',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) COMMENT 'for getTracesByIds',
  KEY `name` (`name`) COMMENT 'for getTraces and getSpanNames',
  KEY `start_ts` (`start_ts`) COMMENT 'for getTraces ordering and range',
  KEY `trace_id_high_5` (`trace_id_high`,`trace_id`,`id`) COMMENT 'for joining with zipkin_annotations',
  KEY `trace_id_high_6` (`trace_id_high`,`trace_id`) COMMENT 'for getTracesByIds',
  KEY `name_2` (`name`) COMMENT 'for getTraces and getSpanNames',
  KEY `start_ts_2` (`start_ts`) COMMENT 'for getTraces ordering and range'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_spans
-- ----------------------------
