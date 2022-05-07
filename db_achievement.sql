/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : db_achievement

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 23/04/2022 20:44:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begintime` date NULL DEFAULT NULL,
  `endtime` date NULL DEFAULT NULL,
  `ccount` int(11) NOT NULL DEFAULT 0,
  `gid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`classid`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE,
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES (112, '班级1', NULL, NULL, 1, 33, 0);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccredit` decimal(9, 2) NOT NULL,
  `cperiod` decimal(9, 2) NOT NULL,
  `cstate` int(11) NOT NULL DEFAULT 0,
  `cselcount` int(11) NOT NULL DEFAULT 0,
  `cmaxcount` int(11) NOT NULL DEFAULT 0,
  `studytype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `ctid`(`ctid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`ctid`) REFERENCES `course_type` (`ctid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (35, '软件', 1.00, 12.00, 0, 0, 20, '必修', 1, 13, 0);
INSERT INTO `course` VALUES (36, 'test1', 1.00, 25.00, 0, 0, 25, '选修', 2, 13, 0);
INSERT INTO `course` VALUES (37, '考试测试1', 1.00, 10.00, 0, 0, 20, '必修', 1, 13, 0);

-- ----------------------------
-- Table structure for course_type
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type`  (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `ctname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ctid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES (1, '专业基础课');
INSERT INTO `course_type` VALUES (2, '公共课');
INSERT INTO `course_type` VALUES (3, '任选课');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dcount` int(11) NOT NULL DEFAULT 0,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (7, '软件学院', 1, 0);

-- ----------------------------
-- Table structure for dropout
-- ----------------------------
DROP TABLE IF EXISTS `dropout`;
CREATE TABLE `dropout`  (
  `drid` int(11) NOT NULL AUTO_INCREMENT,
  `drreason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`drid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  CONSTRAINT `dropout_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for evaluate_list
-- ----------------------------
DROP TABLE IF EXISTS `evaluate_list`;
CREATE TABLE `evaluate_list`  (
  `elid` int(11) NOT NULL AUTO_INCREMENT,
  `elcontent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`elid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluate_list
-- ----------------------------
INSERT INTO `evaluate_list` VALUES (1, '讲师是否能坚持进行随堂测试，及时激励和督促学生的学习');
INSERT INTO `evaluate_list` VALUES (2, '讲师是否能提前五分钟入班并准时上课？');
INSERT INTO `evaluate_list` VALUES (3, '讲师的授课内容是否条理清晰、表达准确、操作熟练、逻辑性强？');
INSERT INTO `evaluate_list` VALUES (4, '课堂气氛是否活跃，你对所学知识是否感兴趣并能积极参与？');
INSERT INTO `evaluate_list` VALUES (5, '在做练习或项目时讲师是否保持在班内巡视，随时监督学生进度并及时发现和解决问题？');
INSERT INTO `evaluate_list` VALUES (6, '讲师是否能在课程结束时及时总结，便于我对知识点的理解和掌握？');
INSERT INTO `evaluate_list` VALUES (7, '讲师是否能对作业或练习中的问题进行集中讲解或单个点评？');
INSERT INTO `evaluate_list` VALUES (8, '讲师是否能够严格要求学生并积极耐心的解答学生疑问？');
INSERT INTO `evaluate_list` VALUES (9, '讲师是否能够诚实讲授知识，从不诱导我为其授课结果虚高打分？');
INSERT INTO `evaluate_list` VALUES (10, '讲师是否能对学生认真负责，责任心强？');

-- ----------------------------
-- Table structure for evaluate_record
-- ----------------------------
DROP TABLE IF EXISTS `evaluate_record`;
CREATE TABLE `evaluate_record`  (
  `erid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tchid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `erexam` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`erid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gcount` int(5) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000,
  `mid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (33, '2022', 00001, 13, 0);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcount` int(11) NOT NULL DEFAULT 0,
  `did` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (13, '软件工程', 1, 7, 0);

-- ----------------------------
-- Table structure for newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `newsinfo`;
CREATE TABLE `newsinfo`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ncontent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nauthor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ntime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `nimg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'http://projects.whn946.cn/images/niceschool/default.jpg',
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for politics_type
-- ----------------------------
DROP TABLE IF EXISTS `politics_type`;
CREATE TABLE `politics_type`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of politics_type
-- ----------------------------
INSERT INTO `politics_type` VALUES (1, '中共党员');
INSERT INTO `politics_type` VALUES (2, '中共预备党员');
INSERT INTO `politics_type` VALUES (3, '共青团员');
INSERT INTO `politics_type` VALUES (4, '民革党员');
INSERT INTO `politics_type` VALUES (5, '民盟盟员');
INSERT INTO `politics_type` VALUES (6, '民建会员');
INSERT INTO `politics_type` VALUES (7, '民进会员');
INSERT INTO `politics_type` VALUES (8, '农工党党员');
INSERT INTO `politics_type` VALUES (9, '致公党会员');
INSERT INTO `politics_type` VALUES (10, '九三学社社员');
INSERT INTO `politics_type` VALUES (11, '台盟盟员');
INSERT INTO `politics_type` VALUES (12, '无党派人士');
INSERT INTO `politics_type` VALUES (13, '群众');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schid` int(11) NOT NULL AUTO_INCREMENT,
  `timeinterval` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `schname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `winter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`schid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, '早上', '起床', '6:00', '6:30');
INSERT INTO `schedule` VALUES (2, '早上', '早操', '6:10-7:00', '6:40-7:00');
INSERT INTO `schedule` VALUES (3, '早上', '早饭', '7:10', '7:10');
INSERT INTO `schedule` VALUES (4, '上午', '预备', '8:00', '8:00');
INSERT INTO `schedule` VALUES (5, '上午', '第一节', '8:10-8:55', '8:10-8:55');
INSERT INTO `schedule` VALUES (6, '上午', '第二节', '9:05-9:50', '9:05-9:50');
INSERT INTO `schedule` VALUES (7, '上午', '课间操', '9:50-10:10', '9:50-10:10');
INSERT INTO `schedule` VALUES (8, '上午', '第三节', '10:10-10:55', '10:10-10:55');
INSERT INTO `schedule` VALUES (9, '上午', '第四节', '11:05-11:50', '11:05-11:50');
INSERT INTO `schedule` VALUES (10, '中午', '午饭', '12:00', '12:00');
INSERT INTO `schedule` VALUES (11, '下午', '预备', '14:30', '14:00');
INSERT INTO `schedule` VALUES (12, '下午', '第五节', '14:40-15:25', '14:10-14:55');
INSERT INTO `schedule` VALUES (13, '下午', '第六节', '15:35-16:20', '15:05-15:50');
INSERT INTO `schedule` VALUES (14, '下午', '课外活动', '16:30-18:00', '16:00-17:30');

-- ----------------------------
-- Table structure for stu_course
-- ----------------------------
DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course`  (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`scid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `stu_course_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 484 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_course
-- ----------------------------
INSERT INTO `stu_course` VALUES (483, 20220001, 35, 0);

-- ----------------------------
-- Table structure for stu_exam
-- ----------------------------
DROP TABLE IF EXISTS `stu_exam`;
CREATE TABLE `stu_exam`  (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `normalexam` decimal(9, 2) NULL DEFAULT NULL,
  `testexam` decimal(9, 2) NULL DEFAULT NULL,
  `sumexam` decimal(9, 2) NULL DEFAULT NULL,
  `stime` int(11) NOT NULL,
  `studynature` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`seid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `scid`(`scid`) USING BTREE,
  CONSTRAINT `stu_exam_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_exam_ibfk_2` FOREIGN KEY (`scid`) REFERENCES `stu_course` (`scid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_exam
-- ----------------------------
INSERT INTO `stu_exam` VALUES (44, 20220001, 483, 95.00, 99.00, 97.00, 1, 1, 0);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sgender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sbirthday` date NOT NULL,
  `pid` int(11) NOT NULL,
  `snation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scardid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date NULL DEFAULT NULL,
  `stustate` int(11) NOT NULL DEFAULT 0,
  `classid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  `mim` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '111111',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `classid`(`classid`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20220002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (20220000, '20220000', '年份过渡数据', '年份过渡数据', '2022-04-19', 1, '年份过渡数据', '年份过渡数据', '年份过渡数据', '年份过渡数据', '2022-04-19', '2022-04-19', 1, 112, 1, '111111');
INSERT INTO `student` VALUES (20220001, '20220001', 'stu1', '女', '1992-12-22', 1, '汉族', '342401199212222222', '15111111111', 'stu1', '2022-09-01', NULL, 0, 112, 0, '111111');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0127fd90587d43c2846f0b6aa563f35c', '教师考试安排', '832e289e4a4d49a68eea3441979ff703', 2, '832e289e4a4d49a68eea3441979ff703,0127fd90587d43c2846f0b6aa563f35c,', 4, '/tchcoursemanage/tchcoursemanage', NULL, NULL, '', 1, '', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-07 11:18:28', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-07 11:18:28', NULL, 0);
INSERT INTO `sys_menu` VALUES ('0516eff241b7418a9ead2111187f9d75', '退学信息', '346bee7d3f7741b58e01ee062c3aba73', 2, '346bee7d3f7741b58e01ee062c3aba73,0516eff241b7418a9ead2111187f9d75,', 4, '/dropoutPage', NULL, NULL, '', 1, '', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-20 16:45:52', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-20 16:45:52', NULL, 0);
INSERT INTO `sys_menu` VALUES ('0ad281e996484506b0064e647bfb1e1c', '成绩查询', '32e652d6788d471196683ca53b948c63', 2, '32e652d6788d471196683ca53b948c63,0ad281e996484506b0064e647bfb1e1c,', 1, '/selectGrade', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:15:53', '0684935cb2ae4cd5994155a32603d195', '2019-11-06 19:16:56', NULL, 0);
INSERT INTO `sys_menu` VALUES ('118126c2a71141858ec667c104d7cd3d', '发布新闻', 'bb86050a4b4b498b977f93cccd5b2bec', 2, 'bb86050a4b4b498b977f93cccd5b2bec,118126c2a71141858ec667c104d7cd3d,', 1, '/news/addnews', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 01:22:30', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 01:22:30', NULL, 0);
INSERT INTO `sys_menu` VALUES ('16da2b1c1fa14182816f05850515bdce', '课表查询', '42ff87aec13c409da75b6c7b5ee333ec', 2, '42ff87aec13c409da75b6c7b5ee333ec,16da2b1c1fa14182816f05850515bdce,', 1, '', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:17:02', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-20 17:17:13', NULL, 1);
INSERT INTO `sys_menu` VALUES ('19c96fa92510436196066c4d529ddd65', '考试安排', '42ff87aec13c409da75b6c7b5ee333ec', 2, '42ff87aec13c409da75b6c7b5ee333ec,19c96fa92510436196066c4d529ddd65,', 3, '/selCou', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 08:20:03', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:27:03', NULL, 0);
INSERT INTO `sys_menu` VALUES ('1b84b70acfbd4b12ac3bad1fee892330', '选课管理', NULL, 1, '1b84b70acfbd4b12ac3bad1fee892330,', 13, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 08:22:51', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 23:46:19', NULL, 1);
INSERT INTO `sys_menu` VALUES ('32e652d6788d471196683ca53b948c63', '成绩管理', NULL, 1, '32e652d6788d471196683ca53b948c63,', 4, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:15:10', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:30:17', NULL, 0);
INSERT INTO `sys_menu` VALUES ('346bee7d3f7741b58e01ee062c3aba73', '学生管理', NULL, 1, '346bee7d3f7741b58e01ee062c3aba73,', 7, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:23:25', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:32:03', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '用户管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,', 9, '/admin/system/user/list', NULL, '', '#47e69c', 1, 'sys:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:31:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:59:20', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '角色管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,', 10, '/admin/system/role/list', NULL, '', '#c23ab9', 1, 'sys:role:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:32:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:58:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '权限管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,', 20, '/admin/system/menu/list', NULL, '', '#d4573b', 1, 'sys:menu:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:33:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:28', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3d2bbd52a26344e59c2b25d615614d44', '班级管理', 'd04edab30f5b4df4af28254e375c2ff6', 2, 'd04edab30f5b4df4af28254e375c2ff6,3d2bbd52a26344e59c2b25d615614d44,', 4, '/schoolmanage/classmanage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:28:18', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:28:19', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb', '新增用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb', '编辑用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb', '删除用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES ('42ff87aec13c409da75b6c7b5ee333ec', '考试管理', NULL, 1, '42ff87aec13c409da75b6c7b5ee333ec,', 5, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:16:44', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:26:21', NULL, 0);
INSERT INTO `sys_menu` VALUES ('45076bf2dbb5443db49c062994d0fb4b', '专业管理', 'd04edab30f5b4df4af28254e375c2ff6', 2, 'd04edab30f5b4df4af28254e375c2ff6,45076bf2dbb5443db49c062994d0fb4b,', 2, '/schoolmanage/majormanage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:27:19', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:27:19', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4d457c31f4fc4e0595c5c6448fe7630a', '新闻管理', 'bb86050a4b4b498b977f93cccd5b2bec', 2, 'bb86050a4b4b498b977f93cccd5b2bec,4d457c31f4fc4e0595c5c6448fe7630a,', 3, '/news/newscontrol', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:18:13', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:18:13', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4e833c1bd3e8485ab12d4d19269de739', '系部管理', 'd04edab30f5b4df4af28254e375c2ff6', 2, 'd04edab30f5b4df4af28254e375c2ff6,4e833c1bd3e8485ab12d4d19269de739,', 1, '/schoolmanage/dpmmanage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:26:32', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:26:33', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4f1451598a344744b0d225790f52aa19', '退课', '4f8ead47ab25421f85f27af3db60a84e', 2, '4f8ead47ab25421f85f27af3db60a84e,4f1451598a344744b0d225790f52aa19,', 2, '/seledCourse', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 14:12:55', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 14:12:55', NULL, 0);
INSERT INTO `sys_menu` VALUES ('4f8ead47ab25421f85f27af3db60a84e', '网上选课', NULL, 1, '4f8ead47ab25421f85f27af3db60a84e,', 11, '/', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-06 19:16:04', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 23:46:31', NULL, 1);
INSERT INTO `sys_menu` VALUES ('5178554598814a239475716ed4fef474', '查询学生', '832e289e4a4d49a68eea3441979ff703', 2, '832e289e4a4d49a68eea3441979ff703,5178554598814a239475716ed4fef474,', 5, '/selAllStudent', NULL, NULL, '', 1, '', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-22 13:43:20', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 23:45:55', NULL, 1);
INSERT INTO `sys_menu` VALUES ('54b74a2152674cbdbdf63c32daf840c5', '网上教评', NULL, 1, '54b74a2152674cbdbdf63c32daf840c5,', 6, '/appraise/seltch', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:18:47', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:31:12', NULL, 0);
INSERT INTO `sys_menu` VALUES ('5940b85334e54463a557f9d7b57f883f', '教师信息修改', '832e289e4a4d49a68eea3441979ff703', 2, '832e289e4a4d49a68eea3441979ff703,5940b85334e54463a557f9d7b57f883f,', 2, '', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:34:24', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-11 09:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES ('69b1c803b1a14a8989cf79c4465c0c7e', '录入教师', '832e289e4a4d49a68eea3441979ff703', 2, '832e289e4a4d49a68eea3441979ff703,69b1c803b1a14a8989cf79c4465c0c7e,', 3, '/addTeacherPage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:34:37', '0684935cb2ae4cd5994155a32603d195', '2019-11-06 20:01:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('72cfb92b47584cf499624dba63cc553a', '教师成绩查询', '32e652d6788d471196683ca53b948c63', 2, '32e652d6788d471196683ca53b948c63,72cfb92b47584cf499624dba63cc553a,', 4, '/tchExam', NULL, '', '', 1, '', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-14 17:35:29', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-14 17:35:29', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7a3b765260f5422c8d0a22e8d5ea8d05', '教师信息查询', '832e289e4a4d49a68eea3441979ff703', 2, '832e289e4a4d49a68eea3441979ff703,7a3b765260f5422c8d0a22e8d5ea8d05,', 1, '/selectTeacher', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:33:54', '0684935cb2ae4cd5994155a32603d195', '2019-11-06 19:25:38', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7ab4c00ce86f4ef8808a16a25625919d', '学生选课管理', '1b84b70acfbd4b12ac3bad1fee892330', 2, '1b84b70acfbd4b12ac3bad1fee892330,7ab4c00ce86f4ef8808a16a25625919d,', 1, '/selCourses', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 08:27:04', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-07 13:01:45', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '系统管理', NULL, 1, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,', 1, '', NULL, '', NULL, 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:29:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 03:09:26', NULL, 0);
INSERT INTO `sys_menu` VALUES ('832e289e4a4d49a68eea3441979ff703', '教师管理', NULL, 1, '832e289e4a4d49a68eea3441979ff703,', 8, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:23:46', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:32:13', NULL, 0);
INSERT INTO `sys_menu` VALUES ('894cc49337bf49cb83b91f859e471349', '新闻查询', 'bb86050a4b4b498b977f93cccd5b2bec', 2, 'bb86050a4b4b498b977f93cccd5b2bec,894cc49337bf49cb83b91f859e471349,', 2, '', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:11:00', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:29:06', NULL, 1);
INSERT INTO `sys_menu` VALUES ('8c4743e9a38446e7b13f7e0b6b97a28e', '年级管理', 'd04edab30f5b4df4af28254e375c2ff6', 2, 'd04edab30f5b4df4af28254e375c2ff6,8c4743e9a38446e7b13f7e0b6b97a28e,', 3, '/schoolmanage/grademanage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:27:52', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:27:52', NULL, 0);
INSERT INTO `sys_menu` VALUES ('93979ed945b94fee9a53dbdc184a8eee', '教评问题管理', 'c457ebb1ad6f47afa69ccc32d6b73b1a', 2, 'c457ebb1ad6f47afa69ccc32d6b73b1a,93979ed945b94fee9a53dbdc184a8eee,', 1, '/appraise/evlistcontrol', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 13:58:29', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 13:58:29', NULL, 0);
INSERT INTO `sys_menu` VALUES ('95273203460543e8942174ec460a6f12', '正选', '4f8ead47ab25421f85f27af3db60a84e', 2, '4f8ead47ab25421f85f27af3db60a84e,95273203460543e8942174ec460a6f12,', 1, '/course/sel', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 14:11:26', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 23:46:25', NULL, 1);
INSERT INTO `sys_menu` VALUES ('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb', '新增权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:menu:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:38', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9703ccf2-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:menu:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:25', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9707cf58-9adb-11e8-aebe-1368d4ec24eb', '删除权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:menu:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:51:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:53:42', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ad13ddd195e147b7a7e8c3bd20f05cea', '录入学生', '346bee7d3f7741b58e01ee062c3aba73', 2, '346bee7d3f7741b58e01ee062c3aba73,ad13ddd195e147b7a7e8c3bd20f05cea,', 3, '/addStudentPage', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:33:38', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:20:28', NULL, 0);
INSERT INTO `sys_menu` VALUES ('b85b2b42c1cd4281b6e3884cc1a53327', '成绩录入', '32e652d6788d471196683ca53b948c63', 2, '32e652d6788d471196683ca53b948c63,b85b2b42c1cd4281b6e3884cc1a53327,', 2, '/selstudentExam', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:16:14', '0684935cb2ae4cd5994155a32603d195', '2019-11-17 19:18:42', NULL, 0);
INSERT INTO `sys_menu` VALUES ('bb86050a4b4b498b977f93cccd5b2bec', '校园新闻', NULL, 1, 'bb86050a4b4b498b977f93cccd5b2bec,', 2, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-03 20:15:53', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:29:54', NULL, 0);
INSERT INTO `sys_menu` VALUES ('c0ae0cc7e86c45b7a7d6c276a4400a80', '选课管理', NULL, 1, 'c0ae0cc7e86c45b7a7d6c276a4400a80,', 12, '', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 08:22:09', '0684935cb2ae4cd5994155a32603d195', '2019-11-07 08:22:18', NULL, 1);
INSERT INTO `sys_menu` VALUES ('c457ebb1ad6f47afa69ccc32d6b73b1a', '教评管理', NULL, 1, 'c457ebb1ad6f47afa69ccc32d6b73b1a,', 10, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 13:58:00', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:33:59', NULL, 0);
INSERT INTO `sys_menu` VALUES ('c6d5768068f1401bad9f24a5a5b33a92', '学生成绩', '346bee7d3f7741b58e01ee062c3aba73', 2, '346bee7d3f7741b58e01ee062c3aba73,c6d5768068f1401bad9f24a5a5b33a92,', 2, '/tchSelExam', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:33:25', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-11 09:27:53', NULL, 0);
INSERT INTO `sys_menu` VALUES ('d024c4836bc941208ae2f2ad00bf630e', '调换课程', '42ff87aec13c409da75b6c7b5ee333ec', 2, '42ff87aec13c409da75b6c7b5ee333ec,d024c4836bc941208ae2f2ad00bf630e,', 2, '', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:17:24', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-20 17:17:19', NULL, 1);
INSERT INTO `sys_menu` VALUES ('d04edab30f5b4df4af28254e375c2ff6', '校建管理', NULL, 1, 'd04edab30f5b4df4af28254e375c2ff6,', 9, '', NULL, '', '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 09:24:09', '0684935cb2ae4cd5994155a32603d195', '2019-11-05 15:33:34', NULL, 0);
INSERT INTO `sys_menu` VALUES ('dadca40757374e38a46c9901876febb9', '学生成绩查询', '32e652d6788d471196683ca53b948c63', 2, '32e652d6788d471196683ca53b948c63,dadca40757374e38a46c9901876febb9,', 3, '/selStuAllExam', NULL, '', '', 1, '', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-14 10:23:04', '054a2cd6369c48d8a52d62e0084d4527', '2019-11-14 10:23:04', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ed63866b30cf46bfb6797a1d31ae930c', '锁定用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,', 21, '', NULL, NULL, '', 0, 'sys:user:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', NULL, 0);
INSERT INTO `sys_menu` VALUES ('fd3b5d6130dc496fadbb33cca4737863', '学生信息查询', '346bee7d3f7741b58e01ee062c3aba73', 2, '346bee7d3f7741b58e01ee062c3aba73,fd3b5d6130dc496fadbb33cca4737863,', 1, '/selectStudent', NULL, NULL, '', 1, '', '0684935cb2ae4cd5994155a32603d195', '2019-11-04 15:33:08', '0684935cb2ae4cd5994155a32603d195', '2019-11-06 19:20:41', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff619e04-9adb-11e8-aebe-1368d4ec24eb', '新增角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:role:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff9477c9-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:role:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff9ad846-9adb-11e8-aebe-1368d4ec24eb', '删除角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:role:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1893c63a307b44709c643d60324ed3de', '教师', '2019-11-27 23:18:13', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', '教师', 0);
INSERT INTO `sys_role` VALUES ('4212d47f61944d3e9f797598102ea67b', '学生', '2019-11-27 23:17:37', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', '学生', 0);
INSERT INTO `sys_role` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '管理员', '2019-11-27 23:09:05', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:48:57', '054a2cd6369c48d8a52d62e0084d4527', '管理员', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1893c63a307b44709c643d60324ed3de', '32e652d6788d471196683ca53b948c63');
INSERT INTO `sys_role_menu` VALUES ('1893c63a307b44709c643d60324ed3de', '346bee7d3f7741b58e01ee062c3aba73');
INSERT INTO `sys_role_menu` VALUES ('1893c63a307b44709c643d60324ed3de', 'b85b2b42c1cd4281b6e3884cc1a53327');
INSERT INTO `sys_role_menu` VALUES ('1893c63a307b44709c643d60324ed3de', 'c6d5768068f1401bad9f24a5a5b33a92');
INSERT INTO `sys_role_menu` VALUES ('4212d47f61944d3e9f797598102ea67b', '0ad281e996484506b0064e647bfb1e1c');
INSERT INTO `sys_role_menu` VALUES ('4212d47f61944d3e9f797598102ea67b', '32e652d6788d471196683ca53b948c63');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '0127fd90587d43c2846f0b6aa563f35c');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '0516eff241b7418a9ead2111187f9d75');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '118126c2a71141858ec667c104d7cd3d');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '19c96fa92510436196066c4d529ddd65');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '32e652d6788d471196683ca53b948c63');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '346bee7d3f7741b58e01ee062c3aba73');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3d2bbd52a26344e59c2b25d615614d44');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '42ff87aec13c409da75b6c7b5ee333ec');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '45076bf2dbb5443db49c062994d0fb4b');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '4d457c31f4fc4e0595c5c6448fe7630a');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '4e833c1bd3e8485ab12d4d19269de739');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '5178554598814a239475716ed4fef474');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '69b1c803b1a14a8989cf79c4465c0c7e');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '7a3b765260f5422c8d0a22e8d5ea8d05');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '832e289e4a4d49a68eea3441979ff703');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '8c4743e9a38446e7b13f7e0b6b97a28e');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '96fd6a5a-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '9703ccf2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', '9707cf58-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'ad13ddd195e147b7a7e8c3bd20f05cea');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'bb86050a4b4b498b977f93cccd5b2bec');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'c6d5768068f1401bad9f24a5a5b33a92');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'd04edab30f5b4df4af28254e375c2ff6');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'dadca40757374e38a46c9901876febb9');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'fd3b5d6130dc496fadbb33cca4737863');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'ff9477c9-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('6619c0ed9452430e9ea23a6542d884a2', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('054a2cd6369c48d8a52d62e0084d4527', 'admin', '管理员', NULL, 'ab44fda09e0872c39d6feb181a79b3840ba541b6', 'b5d007f4b2f7542e', '10101010101', 'gly@gly.com', 0, '2019-11-06 17:42:56', '0684935cb2ae4cd5994155a32603d195', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', NULL, 0, 1);
INSERT INTO `sys_user` VALUES ('97e236a37c1b4f91a625c2476735d575', '2022001', 'te2', NULL, 'dba0c907ca43aaff505f19695e87fece8cbedae1', 'ef598e4d2a1949eb', '15269785411', NULL, 1, '2022-04-19 20:36:01', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', NULL, 0, 1);
INSERT INTO `sys_user` VALUES ('aba40879cddb40f4b9531b994daaabca', '2022002', 'te3', NULL, '433ade9335337e6b289dfa71e8dbc5d2903ed822', 'ab567520337de553', '15265487595', NULL, 0, '2022-04-19 22:43:02', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', NULL, 0, 1);
INSERT INTO `sys_user` VALUES ('b0d9a006c002440fb864bd6e57c1e8a4', '20220001', 'stu1', NULL, 'dba0c907ca43aaff505f19695e87fece8cbedae1', '060a261dc6e9b2af', '', NULL, 0, '2022-04-19 20:45:51', '054a2cd6369c48d8a52d62e0084d4527', '2022-04-19 21:49:53', '054a2cd6369c48d8a52d62e0084d4527', NULL, 0, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('054a2cd6369c48d8a52d62e0084d4527', '6619c0ed9452430e9ea23a6542d884a2');
INSERT INTO `sys_user_role` VALUES ('537ed4c18d2b4756ae2541b1cd5ea88e', '1893c63a307b44709c643d60324ed3de');
INSERT INTO `sys_user_role` VALUES ('8fc87225e20a4822b181bdc6b935b94d', '4212d47f61944d3e9f797598102ea67b');
INSERT INTO `sys_user_role` VALUES ('97e236a37c1b4f91a625c2476735d575', '1893c63a307b44709c643d60324ed3de');
INSERT INTO `sys_user_role` VALUES ('aba40879cddb40f4b9531b994daaabca', '1893c63a307b44709c643d60324ed3de');
INSERT INTO `sys_user_role` VALUES ('b0d9a006c002440fb864bd6e57c1e8a4', '4212d47f61944d3e9f797598102ea67b');

-- ----------------------------
-- Table structure for tch_class
-- ----------------------------
DROP TABLE IF EXISTS `tch_class`;
CREATE TABLE `tch_class`  (
  `tcsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `tcid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tcsid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `classid`(`classid`) USING BTREE,
  INDEX `tch_class_ibfk_3`(`tcid`) USING BTREE,
  CONSTRAINT `tch_class_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_class_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_class_ibfk_3` FOREIGN KEY (`tcid`) REFERENCES `tch_course` (`tcid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tch_class
-- ----------------------------
INSERT INTO `tch_class` VALUES (39, 2022002, 112, 49, 0);

-- ----------------------------
-- Table structure for tch_course
-- ----------------------------
DROP TABLE IF EXISTS `tch_course`;
CREATE TABLE `tch_course`  (
  `tcid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `schid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tcid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `wid`(`wid`) USING BTREE,
  INDEX `schid`(`schid`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE,
  CONSTRAINT `tch_course_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_3` FOREIGN KEY (`wid`) REFERENCES `weeks` (`wid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_4` FOREIGN KEY (`schid`) REFERENCES `schedule` (`schid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tch_course_ibfk_5` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tch_course
-- ----------------------------
INSERT INTO `tch_course` VALUES (49, 2022002, 35, 1, 1, 33, 0);

-- ----------------------------
-- Table structure for tch_exam
-- ----------------------------
DROP TABLE IF EXISTS `tch_exam`;
CREATE TABLE `tch_exam`  (
  `teid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `exam` decimal(9, 2) NULL DEFAULT NULL,
  `pcount` int(11) NULL DEFAULT NULL,
  `tetime` date NOT NULL,
  `semester` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`teid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `tch_exam_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tchid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tgender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tbirthday` date NOT NULL,
  `pid` int(11) NOT NULL,
  `tnation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tcardid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date NULL DEFAULT NULL,
  `tchstate` int(11) NOT NULL DEFAULT 0,
  `is_del` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2022003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2022000, '2022000', '年份过渡数据', '年份过渡数据', '2022-04-19', 1, '年份过渡数据', '年份过渡数据', '年份过渡数据', '年份过渡数据', '2022-04-19', '2022-04-19', 1, 1);
INSERT INTO `teacher` VALUES (2022001, '2022001', 'te2', '男', '1987-12-23', 1, '汉族', '342401199212222222', '15269785411', 'te2', '2022-04-19', '2022-04-19', 1, 1);
INSERT INTO `teacher` VALUES (2022002, '2022002', 'te3', '女', '1923-10-22', 1, '汉族', '342401192222222222', '15265487595', 'te3', '2022-04-19', NULL, 0, 0);

-- ----------------------------
-- Table structure for weeks
-- ----------------------------
DROP TABLE IF EXISTS `weeks`;
CREATE TABLE `weeks`  (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `walias` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`wid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weeks
-- ----------------------------
INSERT INTO `weeks` VALUES (1, '星期一', '周一');
INSERT INTO `weeks` VALUES (2, '星期二', '周二');
INSERT INTO `weeks` VALUES (3, '星期三', '周三');
INSERT INTO `weeks` VALUES (4, '星期四', '周四');
INSERT INTO `weeks` VALUES (5, '星期五', '周五');
INSERT INTO `weeks` VALUES (6, '星期六', '周六');
INSERT INTO `weeks` VALUES (7, '星期日', '周日');

SET FOREIGN_KEY_CHECKS = 1;
