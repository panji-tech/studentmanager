/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57-Docker
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : studentmanager

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 27/11/2023 22:58:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES (1, 'admin', '123456', 1);

-- ----------------------------
-- Table structure for s_attendance
-- ----------------------------
DROP TABLE IF EXISTS `s_attendance`;
CREATE TABLE `s_attendance`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `course_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attendance_course_foreign_key`(`course_id`) USING BTREE,
  INDEX `attendace_student_foreign_key`(`student_id`) USING BTREE,
  CONSTRAINT `attendace_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `attendance_course_foreign_key` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_attendance
-- ----------------------------
INSERT INTO `s_attendance` VALUES (13, 1, 2, '上午', '2018-09-04');
INSERT INTO `s_attendance` VALUES (14, 1, 4, '上午', '2018-09-04');
INSERT INTO `s_attendance` VALUES (15, 2, 2, '上午', '2019-07-02');
INSERT INTO `s_attendance` VALUES (16, 3, 11, '上午', '2023-11-27');

-- ----------------------------
-- Table structure for s_clazz
-- ----------------------------
DROP TABLE IF EXISTS `s_clazz`;
CREATE TABLE `s_clazz`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_clazz
-- ----------------------------
INSERT INTO `s_clazz` VALUES (1, '软件一班', '软件工程专业。');
INSERT INTO `s_clazz` VALUES (4, '数学一班', '大学数学专业');
INSERT INTO `s_clazz` VALUES (5, '计算机科学与技术一班', '计算机专业');

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(5) NOT NULL,
  `course_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selected_num` int(5) NOT NULL DEFAULT 0,
  `max_num` int(5) NOT NULL DEFAULT 50,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_teacher_foreign`(`teacher_id`) USING BTREE,
  CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES (1, '大学英语', 9, '周三上午8点', 49, 50, '英语。');
INSERT INTO `s_course` VALUES (2, '大学数学', 10, '周三上午10点', 4, 50, '数学。');
INSERT INTO `s_course` VALUES (3, '计算机基础', 11, '周三上午', 4, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (4, '计算机网络', 19, '周一上午', 1, 20, '计算机网络基础');

-- ----------------------------
-- Table structure for s_leave
-- ----------------------------
DROP TABLE IF EXISTS `s_leave`;
CREATE TABLE `s_leave`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `leave_student_foreign_key`(`student_id`) USING BTREE,
  CONSTRAINT `leave_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_leave
-- ----------------------------
INSERT INTO `s_leave` VALUES (14, 11, '今天有点舒服,想再请一天假舒服舒服', 1, '大胆');

-- ----------------------------
-- Table structure for s_score
-- ----------------------------
DROP TABLE IF EXISTS `s_score`;
CREATE TABLE `s_score`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  `score` double(5, 2) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id`) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id`) USING BTREE,
  CONSTRAINT `s_score_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_score_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_score
-- ----------------------------
INSERT INTO `s_score` VALUES (67, 4, 2, 78.00, '中等');
INSERT INTO `s_score` VALUES (68, 9, 1, 50.00, '不及格');
INSERT INTO `s_score` VALUES (69, 11, 3, 61.00, '及格万岁');

-- ----------------------------
-- Table structure for s_selected_course
-- ----------------------------
DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `course_id` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id`) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id`) USING BTREE,
  CONSTRAINT `selected_course_course_fk` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `selected_course_student_fk` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course` VALUES (18, 2, 1);
INSERT INTO `s_selected_course` VALUES (19, 2, 2);
INSERT INTO `s_selected_course` VALUES (20, 2, 3);
INSERT INTO `s_selected_course` VALUES (21, 4, 3);
INSERT INTO `s_selected_course` VALUES (22, 4, 2);
INSERT INTO `s_selected_course` VALUES (24, 9, 1);
INSERT INTO `s_selected_course` VALUES (25, 11, 4);
INSERT INTO `s_selected_course` VALUES (26, 11, 3);

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  CONSTRAINT `student_clazz_id_foreign` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES (2, 'S51528202992845', '张三纷', '123456', 1, '女', '13545454548', '1332365656', NULL);
INSERT INTO `s_student` VALUES (4, 'S51528379586807', '王麻子', '111111', 5, '男', '13356565656', '123456', NULL);
INSERT INTO `s_student` VALUES (9, 'S41528633634989', '马冬梅', '1', 5, '男', '13333332133', '131313132323', 'bb12326f-ef6c-4d3d-a2ae-f9eb30a15ad4.jpg');
INSERT INTO `s_student` VALUES (10, 'S11701008858079', 'ITSource', 'itsource', 1, '男', '18638166573', '123456789', '422b3196-80b6-496f-afad-44b197e52913.jpg');
INSERT INTO `s_student` VALUES (11, 'S51701095172910', 'student', '123456', 5, '男', '18638176359', '18638176359', 'baa50223-af26-4ab7-8f39-e6a9e113161b.jpg');
INSERT INTO `s_student` VALUES (12, 'S51701096430793', 'itsource', 'itsource', 5, '男', '18098765432', '18098765432', 'c9016fe6-fdc5-4725-ab57-4c990859bce2.jpg');

-- ----------------------------
-- Table structure for s_teacher
-- ----------------------------
DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int(5) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id`) USING BTREE,
  CONSTRAINT `s_teacher_ibfk_1` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_teacher
-- ----------------------------
INSERT INTO `s_teacher` VALUES (9, 'T11528608730648', '张三', '111', 4, '男', '13918655656', '1193284480', NULL);
INSERT INTO `s_teacher` VALUES (10, 'T11528609224588', '李四老师', '111', 4, '男', '13656565656', '123456', NULL);
INSERT INTO `s_teacher` VALUES (11, 'T51528617262403', '李老师', '123456', 5, '男', '18989898989', '1456655565', NULL);
INSERT INTO `s_teacher` VALUES (18, 'T11561727746515', '夏青松', '123456', 1, '女', '15174857845', '1745854125', '5d447b8b-ec54-4a8e-919a-453aa7b6d33b.jpg');
INSERT INTO `s_teacher` VALUES (19, 'T11701095239335', 'teacher', '123456', 1, '男', '18972653762', '18972653762', 'd3ecd0e5-49b9-4a59-8f03-8b46f79c7d3d.jpg');

SET FOREIGN_KEY_CHECKS = 1;
