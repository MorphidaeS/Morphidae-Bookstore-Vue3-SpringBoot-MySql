/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80000
 Source Host           : localhost:3306
 Source Schema         : intellectual-library

 Target Server Type    : MySQL
 Target Server Version : 80000
 File Encoding         : 65001

 Date: 30/01/2024 17:38:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_carousel
-- ----------------------------
DROP TABLE IF EXISTS `mall_carousel`;
CREATE TABLE `mall_carousel`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_carousel
-- ----------------------------
INSERT INTO `mall_carousel` VALUES ('b7edc843-01d3-4312-b894-c590c7a5489d', '2023-12-24 00:48:30.458000', '2023-12-24 00:48:30.458000', 'https://ts1.cn.mm.bing.net/th/id/R-C.10ece0a7cee636f08786e1210ff95e9f?rik=PNowUX4tC8VAMA&riu=http%3a%2f%2fimg.adoutu.com%2farticle%2f1593242654610.jpg&ehk=3Iao8ngTmaNktsfckIgRlXosfuEYb9HZ%2fEcGLMjZH3Q%3d&risl=&pid=ImgRaw&r=0', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.10ece0a7cee636f08786e1210ff95e9f?rik=PNowUX4tC8VAMA&riu=http%3a%2f%2fimg.adoutu.com%2farticle%2f1593242654610.jpg&ehk=3Iao8ngTmaNktsfckIgRlXosfuEYb9HZ%2fEcGLMjZH3Q%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `mall_carousel` VALUES ('cd3cfb97-d5a1-45a8-9226-2102a66d9d0f', '2023-12-24 00:49:54.034000', '2023-12-24 00:49:54.034000', 'https://pic4.zhimg.com/v2-660a543e914926d3a6872790f306477b_r.jpg', 1, 'https://pic4.zhimg.com/v2-660a543e914926d3a6872790f306477b_r.jpg');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart`  (
  `commodity_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count_num` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  PRIMARY KEY (`commodity_id`, `user_id`) USING BTREE,
  INDEX `FKastrwj4ppn76ak7hbjly3136j`(`user_id`) USING BTREE,
  CONSTRAINT `FK39a14vlaxqlcb3pt1tt3ss5wr` FOREIGN KEY (`commodity_id`) REFERENCES `mall_commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKastrwj4ppn76ak7hbjly3136j` FOREIGN KEY (`user_id`) REFERENCES `mall_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------

-- ----------------------------
-- Table structure for mall_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_comment`;
CREATE TABLE `mall_comment`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `commodity_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_commodity_id`(`commodity_id`) USING BTREE,
  CONSTRAINT `FK1uld0uuux2jgil4ns7ki8i0ti` FOREIGN KEY (`commodity_id`) REFERENCES `mall_commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqgovtl1k1cerhhcy7y5ox56vu` FOREIGN KEY (`user_id`) REFERENCES `mall_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_comment
-- ----------------------------
INSERT INTO `mall_comment` VALUES ('4a2b83f7-a149-41ca-9fb6-5ebb96c76368', '感觉还行', '2023-12-23 13:27:46.604000', '2023-12-23 13:27:46.604000', '41201239-e7a5-4f61-bd53-d67de0850ec9', '测试用户');
INSERT INTO `mall_comment` VALUES ('639d6f44-0ab0-4db3-ad41-5da7ffc2d59b', '还不错', '2023-12-12 16:30:57.696000', '2023-12-12 16:30:57.696000', 'c43c158a-e627-4fff-84bf-d67ecaaa9a25', 'xia');
INSERT INTO `mall_comment` VALUES ('9837b3ee-b77c-4775-aae8-8561c42ad972', '.......................', '2023-12-29 15:01:57.655000', '2023-12-29 15:01:57.655000', 'f86ee368-b074-4f79-b334-7077a1ceed7c', '测试用户');

-- ----------------------------
-- Table structure for mall_commodity
-- ----------------------------
DROP TABLE IF EXISTS `mall_commodity`;
CREATE TABLE `mall_commodity`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `img_main` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_second` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(38, 2) NOT NULL,
  `recommended` bit(1) NOT NULL,
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `take_off` bit(1) NOT NULL DEFAULT b'0',
  `commodity_type_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `FK2e6wb60ok9cwnape0o4qietcw`(`commodity_type_id`) USING BTREE,
  CONSTRAINT `FK2e6wb60ok9cwnape0o4qietcw` FOREIGN KEY (`commodity_type_id`) REFERENCES `mall_commodity_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_commodity
-- ----------------------------
INSERT INTO `mall_commodity` VALUES ('02ab815f-74ee-44ce-b7d8-5e8c835ea3d5', '2023-12-22 18:49:03.573000', '2023-12-22 18:49:04.658000', 'https://www0.kfzimg.com/G07/M00/B2/FA/q4YBAFzzRFuALjsiAACTz6GmHCI505_n.jpg', 'https://www0.kfzimg.com/G07/M00/B2/FA/q4YBAFzzRFuALjsiAACTz6GmHCI505_n.jpg', 'C++语言程序设计', 56.00, b'0', 0, 65, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('07745d68-6ac0-4fa8-a4b9-46b950b4c351', '2023-12-22 18:39:55.699000', '2023-12-22 18:39:55.699000', 'https://www0.kfzimg.com/G06/M00/9E/B7/p4YBAFqv5SWAM3F7AABnk2L6Lew201_n.jpg', 'https://www0.kfzimg.com/G06/M00/9E/B7/p4YBAFqv5SWAM3F7AABnk2L6Lew201_n.jpg', '基础物理学', 55.00, b'1', 0, 66, b'0', '1ff03bf9-afc7-4cf7-8d05-a7d2323211cf');
INSERT INTO `mall_commodity` VALUES ('26952212-5d1b-4cba-a507-47ee8448aa2c', '2023-12-22 18:41:50.882000', '2023-12-22 18:44:31.898000', 'https://www0.kfzimg.com/G06/M00/CC/67/p4YBAFsj0U6APYAdAABtrQq2NEQ056_n.jpg', 'https://www0.kfzimg.com/G06/M00/CC/67/p4YBAFsj0U6APYAdAABtrQq2NEQ056_n.jpg', '数字电子技术', 111.00, b'1', 0, 222, b'0', '1ff03bf9-afc7-4cf7-8d05-a7d2323211cf');
INSERT INTO `mall_commodity` VALUES ('2fd281a4-097d-4d8b-a6e3-90831de77587', '2023-12-22 18:32:36.382000', '2023-12-22 18:34:11.778000', 'https://www0.kfzimg.com/G06/M00/9F/4C/p4YBAFqnZmuAHq1PAADUVbqUx8M649_n.jpg', 'https://www0.kfzimg.com/G06/M00/9F/4C/p4YBAFqnZmuAHq1PAADUVbqUx8M649_n.jpg', '离散数学及其应用', 333.00, b'1', 0, 333, b'0', '2f559899-7961-46bb-b989-cafd12a9e33a');
INSERT INTO `mall_commodity` VALUES ('41201239-e7a5-4f61-bd53-d67de0850ec9', '2023-12-22 18:33:34.861000', '2023-12-23 13:26:47.527000', 'https://www0.kfzimg.com/G06/M00/DB/04/p4YBAFqgyJyAPvqYAACrGU5X434099_n.jpg', 'https://www0.kfzimg.com/G06/M00/DB/04/p4YBAFqgyJyAPvqYAACrGU5X434099_n.jpg', '计算机网络', 666.00, b'1', 1, 665, b'0', 'ea920a3c-340f-44f3-a7e8-1d205a0ee71c');
INSERT INTO `mall_commodity` VALUES ('42d0b292-c13b-428a-91fa-5987a2d23f10', '2023-12-22 18:49:37.384000', '2023-12-22 18:49:38.578000', 'https://www0.kfzimg.com/G06/M00/AC/9F/p4YBAFqnnruANDfMAAAxEG27an4555_n.jpg', 'https://www0.kfzimg.com/G06/M00/AC/9F/p4YBAFqnnruANDfMAAAxEG27an4555_n.jpg', '计算机局域网', 66.00, b'0', 0, 7889, b'0', 'ea920a3c-340f-44f3-a7e8-1d205a0ee71c');
INSERT INTO `mall_commodity` VALUES ('4bbb9419-52ae-49ea-9d17-d645b1a8a5d3', '2023-12-22 18:38:56.882000', '2023-12-22 18:38:56.882000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/bfcdfdac/2abd00f17f103307_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/bfcdfdac/2abd00f17f103307_n.jpg', '高等数学', 555.00, b'0', 0, 999, b'0', '2f559899-7961-46bb-b989-cafd12a9e33a');
INSERT INTO `mall_commodity` VALUES ('4ef94ba6-1cf2-4afa-b7d4-79ac63e89a17', '2023-12-22 18:57:12.890000', '2023-12-22 18:57:13.946000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/11389294/f5775bbe89f3e74c_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/11389294/f5775bbe89f3e74c_n.jpg', 'python程序员', 55.00, b'0', 0, 66, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('52ea3b15-60cc-4e82-9ac1-7caf3e9d0956', '2024-01-30 17:37:04.210000', '2024-01-30 17:37:04.210000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/18930965/9ed38e7d02636fc9_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/18930965/9ed38e7d02636fc9_n.jpg', '生物', 1111.00, b'1', 0, 2222, b'0', '7af7aa62-ad12-43f7-bb74-636e1fa356fc');
INSERT INTO `mall_commodity` VALUES ('5dfa0538-2ba2-4a43-8a61-f6d9b2d6481b', '2023-12-19 23:17:01.856000', '2023-12-22 18:28:00.948000', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/8c22/8c22b7557f83bd0fec301684d4f1ec7c_0_1_300_300.jpg', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/8c22/8c22b7557f83bd0fec301684d4f1ec7c_0_1_300_300.jpg', '國史大綱（上下）', 111.00, b'0', 4, 107, b'1', '89c520f7-7412-4396-8229-10fa47a2b549');
INSERT INTO `mall_commodity` VALUES ('5f4bb602-1a76-474e-8ca9-da7e7d5c5c75', '2023-12-21 13:40:03.515000', '2023-12-22 18:33:45.163000', 'https://www0.kfzimg.com/G06/M00/E5/D4/p4YBAFqhFTyAPo0yAACkwXjILmg172_n.jpg', 'https://www0.kfzimg.com/G06/M00/E5/D4/p4YBAFqhFTyAPo0yAACkwXjILmg172_n.jpg', '算法导论', 30.00, b'1', 3, 999, b'0', '28255aae-857e-479c-96f6-98e31cd9629e');
INSERT INTO `mall_commodity` VALUES ('6040b46b-99ba-461c-9c19-57697a3414ad', '2023-12-22 18:47:54.100000', '2023-12-22 18:47:54.100000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/fabbdfda/651c24b8145bbc82_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/fabbdfda/651c24b8145bbc82_n.jpg', '数据库系统概论', 85.00, b'1', 0, 1111, b'0', '1ff03bf9-afc7-4cf7-8d05-a7d2323211cf');
INSERT INTO `mall_commodity` VALUES ('645f64f8-de7d-450d-8f5e-9cbdbc6acb3e', '2023-12-22 18:47:02.741000', '2023-12-22 18:47:04.504000', 'https://www0.kfzimg.com/G06/M00/32/58/p4YBAFqbMryAXSW5AAC3TD3f9Xk839_n.jpg', 'https://www0.kfzimg.com/G06/M00/32/58/p4YBAFqbMryAXSW5AAC3TD3f9Xk839_n.jpg', '多媒体技术基础', 22.00, b'0', 0, 336, b'0', '1ff03bf9-afc7-4cf7-8d05-a7d2323211cf');
INSERT INTO `mall_commodity` VALUES ('700e375a-df4b-4a7f-bfee-dc5b78ffdf5c', '2023-12-29 15:03:54.122000', '2023-12-29 15:03:54.122000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/5126996/b1fbb4577ff11b42_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/5126996/b1fbb4577ff11b42_n.jpg', '化学', 200.00, b'1', 0, 888, b'0', 'f8309023-c86c-4ef9-b95c-8b08de80ee34');
INSERT INTO `mall_commodity` VALUES ('8187bff4-a3b9-4335-9471-e0da3a855d4b', '2023-12-19 23:08:52.599000', '2023-12-22 18:27:59.252000', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/0/bab5/bab57190469566be423fe01ed0705970_0_0_0_0_water.jpg', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/0/bab5/bab57190469566be423fe01ed0705970_0_0_0_0_water.jpg', '全球通史：从史前史到21世纪（第7版修订版）(上下全二册)', 42.00, b'0', 2, 1911, b'1', 'ea920a3c-340f-44f3-a7e8-1d205a0ee71c');
INSERT INTO `mall_commodity` VALUES ('821bd3b5-399f-416d-8299-ccbe5fbe0470', '2023-12-22 18:31:21.172000', '2024-01-30 17:34:21.475000', 'https://www0.kfzimg.com/sw/kfzimg/421/544461561b1a22a0_n.jpg', 'https://www0.kfzimg.com/sw/kfzimg/421/544461561b1a22a0_n.jpg', '数据库系统原理', 233.00, b'1', 2, 231, b'0', '1e54a877-d41f-4eb7-b0bf-551cc58db3dd');
INSERT INTO `mall_commodity` VALUES ('8d2e4b12-a71f-4860-aa75-a634bca9cc69', '2023-12-22 18:42:58.904000', '2023-12-22 18:58:19.338000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/4482589/3d3a126e407874a5_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/4482589/3d3a126e407874a5_n.jpg', 'Linux操作系统', 44.00, b'0', 0, 566, b'0', 'ac876517-83ab-4bb3-aeda-423b37eca91c');
INSERT INTO `mall_commodity` VALUES ('9451332b-d31b-4032-adbc-ceaa7670675a', '2023-12-22 18:59:09.627000', '2023-12-22 18:59:10.786000', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/ecfacfbb/8649afc4cc57bf1e_n.jpg', 'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/ecfacfbb/8649afc4cc57bf1e_n.jpg', 'UNIX编程环境', 23.00, b'0', 0, 32, b'0', 'ac876517-83ab-4bb3-aeda-423b37eca91c');
INSERT INTO `mall_commodity` VALUES ('a2346200-26b6-43a7-9e44-169d6b3515ad', '2023-12-22 18:35:57.838000', '2023-12-22 19:02:15.746000', 'https://www0.kfzimg.com/G06/M00/64/17/p4YBAFqluJOAb5MMAACNzzwGn8U352_n.jpg', 'https://www0.kfzimg.com/G06/M00/64/17/p4YBAFqluJOAb5MMAACNzzwGn8U352_n.jpg', '数据结构', 666.00, b'0', 0, 123, b'0', '28255aae-857e-479c-96f6-98e31cd9629e');
INSERT INTO `mall_commodity` VALUES ('a84b6016-30ed-48b6-8cb9-7a1e9660c55d', '2023-12-19 23:06:41.215000', '2023-12-22 18:28:02.235000', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/51c6/51c6ef548daa50a75122664c673a22a4_0_1_300_300.jpg', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/51c6/51c6ef548daa50a75122664c673a22a4_0_1_300_300.jpg', '红楼梦脂评汇校本', 180.00, b'0', 2, 99998, b'1', '89c520f7-7412-4396-8229-10fa47a2b549');
INSERT INTO `mall_commodity` VALUES ('b945aa01-0cfc-46c9-937a-7e8501adbb93', '2023-12-22 18:59:51.319000', '2023-12-22 18:59:51.319000', 'https://www0.kfzimg.com/sw/kfzimg/3242/02c14456619b7a8a64_n.jpg', 'https://www0.kfzimg.com/sw/kfzimg/3242/02c14456619b7a8a64_n.jpg', '面向对象分析与设计', 55.00, b'1', 0, 666, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('bc3dc377-40b8-4be8-8d8e-179a9cbf9bca', '2023-12-22 18:35:08.775000', '2023-12-22 18:51:02.434000', 'https://www0.kfzimg.com/G06/M00/CE/98/p4YBAFsj5IuAFsXmAABlKEpwSXk989_n.jpg', 'https://www0.kfzimg.com/G06/M00/CE/98/p4YBAFsj5IuAFsXmAABlKEpwSXk989_n.jpg', 'Java程序设计', 555.00, b'0', 0, 222, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('c626b12e-c50d-4192-a084-c61a64bfe079', '2023-12-21 13:50:56.034000', '2023-12-22 18:33:51.282000', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/30a4/30a4851c1c01da477f7bfac2185f21dd_0_1_300_300.jpg', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/30a4/30a4851c1c01da477f7bfac2185f21dd_0_1_300_300.jpg', '计算机算法基础', 30.00, b'1', 5, 888, b'0', '28255aae-857e-479c-96f6-98e31cd9629e');
INSERT INTO `mall_commodity` VALUES ('cfc9113e-4ca2-4ecf-9dfd-abca78103b96', '2023-12-22 18:46:22.530000', '2023-12-22 18:46:22.530000', 'https://www0.kfzimg.com/sw/kfzimg/2947/027cffa2925b058ab7_n.jpg', 'https://www0.kfzimg.com/sw/kfzimg/2947/027cffa2925b058ab7_n.jpg', 'c语言程序设计', 22.00, b'1', 0, 123, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('da611a9d-c381-49c3-87b3-4fd4ee6d74f6', '2023-12-19 23:22:21.167000', '2023-12-22 18:28:03.684000', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/7d7b/7d7b45ef641faf77635fc367cdbd668b_0_1_300_300.jpg', 'https://booklibimg.kfzimg.com/data/book_lib_img_v2/isbn/1/7d7b/7d7b45ef641faf77635fc367cdbd668b_0_1_300_300.jpg', '共产党宣言', 32.00, b'0', 0, 1111, b'1', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('deae35b6-8ddf-42b2-910e-f269d7987422', '2023-12-22 18:45:38.714000', '2023-12-22 19:00:55.010000', 'https://www0.kfzimg.com/G06/M00/7C/3B/p4YBAFt247WAalAsAAArFxxbVpc699_n.jpg', 'https://www0.kfzimg.com/G06/M00/7C/3B/p4YBAFt247WAalAsAAArFxxbVpc699_n.jpg', '汇编语言', 11.00, b'0', 0, 123, b'0', '56d60a13-c91e-48b2-bf4c-439d72f09ec0');
INSERT INTO `mall_commodity` VALUES ('eb4de3a2-88ab-4e32-a9cf-d25a0a27ecfd', '2023-12-22 18:40:57.106000', '2023-12-22 18:40:59.368000', 'https://www0.kfzimg.com/G06/M00/58/8F/p4YBAFqcJzqAR6l8AABQef30Gkk394_n.jpg', 'https://www0.kfzimg.com/G06/M00/58/8F/p4YBAFqcJzqAR6l8AABQef30Gkk394_n.jpg', '概率论与数理统计', 44.00, b'0', 0, 22, b'0', '2f559899-7961-46bb-b989-cafd12a9e33a');
INSERT INTO `mall_commodity` VALUES ('f86ee368-b074-4f79-b334-7077a1ceed7c', '2023-12-22 18:30:28.628000', '2024-01-30 17:34:12.881000', 'https://www0.kfzimg.com/G06/M00/FA/1C/p4YBAFt_0b-ATjM8AABpS2yqqtI220_n.jpg', 'https://www0.kfzimg.com/G06/M00/FA/1C/p4YBAFt_0b-ATjM8AABpS2yqqtI220_n.jpg', '编译原理', 35.00, b'0', 11, 555, b'0', '1e54a877-d41f-4eb7-b0bf-551cc58db3dd');
INSERT INTO `mall_commodity` VALUES ('fcdedb80-a4e5-4445-8c02-bd8d9070d9d9', '2023-12-22 18:38:03.782000', '2023-12-22 18:38:03.782000', 'https://www0.kfzimg.com/G06/M00/02/99/p4YBAFqyhV-ATwwHAABTJch4B3c267_n.jpg', 'https://www0.kfzimg.com/G06/M00/02/99/p4YBAFqyhV-ATwwHAABTJch4B3c267_n.jpg', '线性代数', 456.00, b'1', 0, 321, b'0', '2f559899-7961-46bb-b989-cafd12a9e33a');

-- ----------------------------
-- Table structure for mall_commodity_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_commodity_detail`;
CREATE TABLE `mall_commodity_detail`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `commodity_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_6ugk96b3ij85y15js4yactb5t`(`commodity_id`) USING BTREE,
  CONSTRAINT `FKbo0vjgdgx4x7dprhkgkxl74oa` FOREIGN KEY (`commodity_id`) REFERENCES `mall_commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_commodity_detail
-- ----------------------------
INSERT INTO `mall_commodity_detail` VALUES ('0213190e-38eb-44fa-b069-7d3ab221c2a7', 'undefined', '2023-12-22 18:57:12.891000', '2023-12-22 18:57:12.891000', '4ef94ba6-1cf2-4afa-b7d4-79ac63e89a17');
INSERT INTO `mall_commodity_detail` VALUES ('03ee0a12-189d-472a-a9df-361a67784be8', 'undefined', '2023-12-22 18:45:38.716000', '2023-12-22 18:45:38.716000', 'deae35b6-8ddf-42b2-910e-f269d7987422');
INSERT INTO `mall_commodity_detail` VALUES ('042cc45c-3f1e-422c-855f-1ee997e3bdf8', 'undefined', '2023-12-22 18:40:57.109000', '2023-12-22 18:40:57.109000', 'eb4de3a2-88ab-4e32-a9cf-d25a0a27ecfd');
INSERT INTO `mall_commodity_detail` VALUES ('057c8f9d-61fe-453c-a921-d3e7450c155e', 'undefined', '2023-12-29 15:03:54.125000', '2023-12-29 15:03:54.125000', '700e375a-df4b-4a7f-bfee-dc5b78ffdf5c');
INSERT INTO `mall_commodity_detail` VALUES ('0606b5e8-61cd-4d5f-a4dd-317cdbbb7996', 'undefined', '2023-12-22 18:30:28.637000', '2023-12-22 18:30:28.637000', 'f86ee368-b074-4f79-b334-7077a1ceed7c');
INSERT INTO `mall_commodity_detail` VALUES ('06ebd34a-a4c3-4ba5-a133-85afe36024d7', '　　这是一部中国通史，因用大学教科书体例写成，不得不力求简要，仅举大纳，删其琐节。内容于学术思想，政治制度，社会风气，国际形势，兼有顾及，惟但求其通为一体，明其治乱盛衰之所由，闻其一贯相承之为统，以指陈吾国家民族生命精神之所寄。至其人物之详，事业之备，则待教者读者之自加参考，自为引伸。本书主旨则在发明其相互影响，及先后之演变发展，以作国人如何应付现时代之种种事变作根据之借鉴。', '2023-12-19 23:17:01.859000', '2023-12-19 23:17:01.859000', '5dfa0538-2ba2-4a43-8a61-f6d9b2d6481b');
INSERT INTO `mall_commodity_detail` VALUES ('091ddb9f-8040-4c85-9993-9c9b62403627', 'undefined', '2023-12-22 18:47:02.749000', '2023-12-22 18:47:02.749000', '645f64f8-de7d-450d-8f5e-9cbdbc6acb3e');
INSERT INTO `mall_commodity_detail` VALUES ('239f9bf0-57ce-4161-8ac3-5a899e14480f', 'undefined', '2023-12-22 18:38:56.883000', '2023-12-22 18:38:56.883000', '4bbb9419-52ae-49ea-9d17-d645b1a8a5d3');
INSERT INTO `mall_commodity_detail` VALUES ('2547e405-9164-4543-9978-51f2a313fdf5', '《C语言程序设计/高等职业教育课程改革示范教材》以C程序设计的三种基本结构为主要脉络，全书围绕这一核心，在去除掉一些细枝末节和晦涩难懂的语法基础上，重点介绍了数据类型和基本操作、数组、函数、指针、结构体和共用体、文件操作等C语言核心语法成分，同时也初步涉及了数据结构中最基本的链表和二叉树等内容。', '2023-12-22 18:46:22.538000', '2023-12-22 18:46:22.538000', 'cfc9113e-4ca2-4ecf-9dfd-abca78103b96');
INSERT INTO `mall_commodity_detail` VALUES ('4e997838-d979-485e-8ba3-caa1798e8723', '.', '2024-01-30 17:37:04.210000', '2024-01-30 17:37:04.210000', '52ea3b15-60cc-4e82-9ac1-7caf3e9d0956');
INSERT INTO `mall_commodity_detail` VALUES ('6a701c94-df1a-462b-aaca-77ade243378b', '本书是根据编者在独立学院多年的教学经验编写而成的，全书包含力学、电磁学、热学、波动学、近代物理学五大部分，共10章内容.本书有如下几个特点：内容分层次，用不同的记号标注，读者自行选择内容的难度；习题分层次，巩固练习是初级习题，总习题属于高级习题；例题与习题都具有很强的目标性，每个题目仅针对一个特定的知识点进行训练，不掺杂其他知识点；必讲内容的前提知识绝对不包含可讲可不讲的内容，利于教师调整教学大纲；多次强调微元法的思想，分析曲线积分、曲面积分等数学运算的含义，加强与数学的联系。 本书的力学部分（第1、2章）必须先学，量子力学（第10章）应该最后学，电磁学、热学、波动学、相对论等几部分内容的讲解顺序可以任意调整组合，全书讲授大约需要120学时，经过适当删减组合，也可以作为60～80课时的大学物理教材。', '2023-12-22 18:39:55.701000', '2023-12-22 18:39:55.701000', '07745d68-6ac0-4fa8-a4b9-46b950b4c351');
INSERT INTO `mall_commodity_detail` VALUES ('7032b401-5fa2-4691-b9af-678e17232e99', '《计算机科学与技术学科研究生教材：计算机算法基础》讲解细腻、分析透彻，以探索解决问题的方式深入分析了大量案例，使读者能清晰触摸到作者的思维方法，并建立起自己独立思考的学习习惯。本书可以作为计算机科学等相关专业本科生、研究生的教材，也可供从事计算机算法设计与分析工作的教师与研究人员参考。', '2023-12-21 13:50:56.035000', '2023-12-22 18:26:12.440000', 'c626b12e-c50d-4192-a084-c61a64bfe079');
INSERT INTO `mall_commodity_detail` VALUES ('808c48d1-b574-4070-b061-6637fe524847', 'undefined', '2023-12-22 18:49:03.574000', '2023-12-22 18:49:03.574000', '02ab815f-74ee-44ce-b7d8-5e8c835ea3d5');
INSERT INTO `mall_commodity_detail` VALUES ('80c0368f-a74b-43f3-9905-fb4c4b44c649', '本书较为系统地介绍了计算机科学与技术等相关专业所必需的离散数学知识，全书分为4个部分（数理逻辑、集合论、代数结构和图论），共7章。第1章介绍命题及命题逻辑；第2章介绍一阶谓词逻辑及其推理理论；第3章介绍集合的基本概念和性质；第4章介绍二元关系和函数；第5章介绍代数系统基本概念；第6章介绍几个典型的代数系统；第7章介绍图论的基础内容和一些特殊图及其性质。各章之后配有适当难度的习题及其简要参考答案，便于学生课后练习。每个部分结束后配有内容小结，便于学生自学、复习和提高。\n\n　　本书可以作为高等院校计算机科学与技术、软件工程、通信工程等相关专业的教材，也可以作为考研学生及计算机工作者的参考书。', '2023-12-22 18:32:36.382000', '2023-12-22 18:32:36.382000', '2fd281a4-097d-4d8b-a6e3-90831de77587');
INSERT INTO `mall_commodity_detail` VALUES ('8ef56aa7-381f-4695-958b-fc62301ccfa8', '内容简介:\n　　《全球通史 从史前史到21世纪（第7版  修订版  上册）》分八个部分，四十四个章节，主要讲述了世界历史的进化，世界文明的发展及其对现代社会的影响。作者着眼于全球，侧重于那些有影响的、促进历史发展的历史事件，其中包括原始社会、欧亚大陆的古代文明、欧亚大陆的原始文明、欧亚以外的世界、地区分割后的世界、西方世界的崛起、西方人统治的世界、西方的衰落与成功等八个主要的部分。重点突出，主题鲜明，着重有三个主要的问题，即（1）欧洲扩张的根源；（2）欧洲扩张前的儒家文化、穆斯林和其它非欧洲的世界；（3）欧洲扩张的各个历史时期：伊比利亚时期，荷兰、法国、英国时期，沙俄时期。本书为上册。\n作者简介:\n　　斯塔夫里阿诺斯，美国加州大学的历史学教授，享誉世界的历史学家，曾获得过古根海姆奖、福特杰出教师奖和洛克菲勒基金奖等一系列学术荣誉。虽然他以《全球通史》闻名全世界，但实际上他著述颇丰，还有大量其他作品为学术界所称道。除《全球通史》外，斯塔夫里阿诺斯的其他作品还包括《1453年以来的巴尔干各国》、《奥斯曼帝国：它是欧洲的病人吗？》、《全球分裂：第三世界的历史进程》和《源自我们过去的生命线：新世界史》等。\n　　斯塔夫里阿诺斯教授已于2004年3月23日在美国加州拉荷亚去世，本书不但是斯氏《全球通史》的全新版本，也成了其最后版本。', '2023-12-19 23:08:52.600000', '2023-12-19 23:08:52.600000', '8187bff4-a3b9-4335-9471-e0da3a855d4b');
INSERT INTO `mall_commodity_detail` VALUES ('8f5e43ec-4180-4379-ac76-7d3190f92d07', '本书是\"十二五\"普通高等教育本科重量规划教材《数据库系统概论（第5版）》（王珊、萨师煊编著，高等教育出版社出版，以下简称《概论》）配套的习题解析和实验指导。本书分为两部分，部分为基本知识点与习题解析，包含《概论》一书各章基本知识点的讲解、习题解析与补充习题及解答；第二部分为实验指导，介绍数据库课程实验环境建设及实验数据准备的技术和方法，并给出《概论》各章相关实验的指导与实验报告示例。附录包含数据库领域图灵奖获得者的介绍、数据库基准测试TPC-C和TPC-H介绍。通过对本书习题和实验的综合练习，读者可以加深对数据库系统基本概念的理解，对基本知识的掌握、对基本技术的运用，以及对数据库系统的实际应用能力。', '2023-12-22 18:47:54.101000', '2023-12-22 18:47:54.101000', '6040b46b-99ba-461c-9c19-57697a3414ad');
INSERT INTO `mall_commodity_detail` VALUES ('96134895-2797-440d-a289-d53bd6a28671', '《计算机科学与技术学科研究生教材：计算机算法基础》讲解细腻、分析透彻，以探索解决问题的方式深入分析了大量案例，使读者能清晰触摸到作者的思维方法，并建立起自己独立思考的学习习惯。本书可以作为计算机科学等相关专业本科生、研究生的教材，也可供从事计算机算法设计与分析工作的教师与研究人员参考。', '2023-12-21 13:40:03.524000', '2023-12-22 18:25:34.423000', '5f4bb602-1a76-474e-8ca9-da7e7d5c5c75');
INSERT INTO `mall_commodity_detail` VALUES ('997fac30-ae41-4a60-bd90-ebc57c737c6d', 'undefined', '2023-12-22 18:42:58.905000', '2023-12-22 18:42:58.905000', '8d2e4b12-a71f-4860-aa75-a634bca9cc69');
INSERT INTO `mall_commodity_detail` VALUES ('998b3ba1-a7f9-4046-99b2-8baf7f4fb8b9', 'undefined', '2023-12-22 18:35:08.784000', '2023-12-22 18:35:08.784000', 'bc3dc377-40b8-4be8-8d8e-179a9cbf9bca');
INSERT INTO `mall_commodity_detail` VALUES ('9c83c98b-2996-4e09-8669-dea4c099257b', '高等学校电子信息类规划教材。\n\n　　本书为1989年出版的、获第二届全国优秀教材奖的《计算机网络》的第4版，在内容和结构方面都做了很大的修改。\n\n　　全书为10章，比较全面系统地介绍了计算机网络的发展和原理体系结构、物理层、数据链路层、局域网、广域网、网络互连、运输层、应用层、计算机网络的安全和因特网的演进等内容。各章均附有练习题。此外，附录F给出了部分习题的答案和提示。随书配套的光盘中，收录了作者教学中经常遇到的150多个问题，并予以解答；还收录了在2003年1月前发表的全部RFC文档，供读者参阅。', '2023-12-22 18:33:34.861000', '2023-12-22 18:33:34.861000', '41201239-e7a5-4f61-bd53-d67de0850ec9');
INSERT INTO `mall_commodity_detail` VALUES ('a5440fc6-3173-4512-a3aa-71a2a837037e', '《数字电子技术》采用项目导入，任务驱动，以及教、学、做一体化的教学模式编写。突出“以学生学为主导，教师教为辅导”的职业教育课程改革指导思想，使学生做到“学以致用”。重点培养学生的实践能力，使学生真正掌握逻辑电路的设计、绘图与仿真，将课堂理论教学与实验室的实践教学紧密结合，通过具体的任务实施过程使学生掌握Multisim仿真软件的实际应用技能。\n\n　　《数字电子技术》由8个项目构成，涵盖了数字电子技术所有的知识点和Muhisim仿真软件应用的注意事项。主要涉及基本门电路、组合逻辑电路、触发器、时序逻辑电路、555定时器的仿真及应用。\n\n　　《数字电子技术》可作为电气自动化类、电子信息类和机电一体化类及相关专业的教材，也可供相关工程技术人员参考使用。', '2023-12-22 18:41:50.885000', '2023-12-22 18:41:50.885000', '26952212-5d1b-4cba-a507-47ee8448aa2c');
INSERT INTO `mall_commodity_detail` VALUES ('a7550751-20e0-41b7-a690-942657c7f9ee', '《马列主义经典作家文库著作单行本：共产党宣言》是马克思、恩格斯为共产主义同盟撰写的纲领。在这个纲领性文献中，马克思、恩格斯科学地评价了资产阶级的历史作用，揭示了资本主义的内在矛盾，论述了无产阶级作为资产阶级的掘墓人的伟大历史使命，揭示了资本主义必然灭亡和共产主义必然胜利的历史规律。', '2023-12-19 23:22:21.168000', '2023-12-19 23:22:21.168000', 'da611a9d-c381-49c3-87b3-4fd4ee6d74f6');
INSERT INTO `mall_commodity_detail` VALUES ('b2dce7c2-115f-49b3-bc15-c94bd3525bda', '作者: 曹雪芹 著 , 吴铭恩 汇校 , 脂砚斋 评\n出版社: 北方联合出版传媒集团 万卷出版公司\n出版时间: 2013-10\nISBN: 9787547028056\n定价: 180.00\n装帧: 平装\n开本: 其他\n纸张: 其他\n分类: 小说\n842人买过\n内容简介:\n《红楼梦脂评汇校本》，系以甲戌本、庚辰本等早期脂本为底本，汇集了己卯本、戚序本、蒙府本等其他脂批本的部分脂批，并参考、吸收若干新校点本及脂批辑本的校点成果整理而成。对前人意见有分歧的，略参己意而取舍，力求既不人云亦云，也不标新立异，整理成为一个方便阅读和检索的脂评红楼梦简明读本。\n本书具有以下特点：\n一、方便阅读。《红楼梦》一书是出版界的宠儿，目前优秀的校注本虽有好几种，但它们都不收脂评。比较好的一种带脂评的整理本是黄霖校本，已经绝版十余年。本书略同于黄校本（不同点是没有单一采用庚辰本作底本），既对现存脂\n作者简介:\n吴铭恩，广东潮州人。从事经济工作。业余从事《红楼梦》及文史研究，创办红楼梦主题网站“抚琴居”，上海《红楼梦研究辑刊》编委。\n《红楼梦脂评汇校本》曾以电子版的形式在网络广泛流传，产生一定影响。现在其基础上重加修订，正式出版。', '2023-12-19 23:06:41.216000', '2023-12-19 23:06:41.216000', 'a84b6016-30ed-48b6-8cb9-7a1e9660c55d');
INSERT INTO `mall_commodity_detail` VALUES ('b360c14d-9829-474e-badb-fd2df215b80f', '线性代数》是在作者主持的国家精品课程“线性代数（非数学专业）”的建设过程中形成的教材，是作者主持的国家级教学成果奖二等奖项目“数学建模思想融入基础课教学”的重要成果之一。\n\n《线性代数》不是“奉天承运皇帝诏日”从天而降的抽象定义和推理，而是一部由创造发明的系列故事组成的连续剧。每个故事从颇具悬念的问题开始，在解决问题的过程中将所要学习的知识一步一步“发明”出来。随着剧情的发展，知识的引入如“随风潜入夜”，知识的应用如“润物细无声”，都成为自然而然的了。\n\n《线性代数》适合作为大学本科非数学类专业线性代数、工科高等代数课程的教材，也可作为需要或关心线性代数和矩阵论知识的科技工作者、工程技术人员、大专院校师生及其他读者的参考书。', '2023-12-22 18:38:03.782000', '2023-12-22 18:38:03.782000', 'fcdedb80-a4e5-4445-8c02-bd8d9070d9d9');
INSERT INTO `mall_commodity_detail` VALUES ('b6e28344-6a59-476e-b804-4ac0fe51ed3e', '数据库系统原理》在内容上构建了以“数据库原理+SQL senrer数据库+ADO.ENT数据库访问技术+Visual Basic 6.0语言”为架构的数据库课程内容体系，具有理论与应用结合的鲜明特色，教学参考及应用价值高。\n\n　　《数据库系统原理》适合进行计算机基础教学及应用型人才培养等院校选作教材。', '2023-12-22 18:31:21.173000', '2023-12-22 18:31:21.173000', '821bd3b5-399f-416d-8299-ccbe5fbe0470');
INSERT INTO `mall_commodity_detail` VALUES ('b74d6766-bb4b-484b-b30a-681279739f17', 'undefined', '2023-12-22 18:59:09.628000', '2023-12-22 18:59:09.628000', '9451332b-d31b-4032-adbc-ceaa7670675a');
INSERT INTO `mall_commodity_detail` VALUES ('dc3c4c3a-ac27-4609-acfe-d85f79869fa7', 'undefined', '2023-12-22 18:49:37.392000', '2023-12-22 18:49:37.392000', '42d0b292-c13b-428a-91fa-5987a2d23f10');
INSERT INTO `mall_commodity_detail` VALUES ('e40f3f51-95e3-49c6-b87e-52a2d661c14e', 'undefined', '2023-12-22 18:35:57.839000', '2023-12-22 18:35:57.839000', 'a2346200-26b6-43a7-9e44-169d6b3515ad');
INSERT INTO `mall_commodity_detail` VALUES ('ea87e0c6-f254-4fd5-a28c-a5df4f153df5', '本书系统讲解了面向对象方法的基本概念，统一建模语言的概念、结构和建模方法，对象约束语言（OCL）基础知识和使用方法，还详细介绍了业务建模方面的基础知识，包括业务、业务规则、业务模型及其构成要素的概念以及业务建模的方法。 本书详细介绍了各种标准UML模型的概念、构成元素、使用规则和建模方法，这些标准模型包括：用例模型、类图模型、顺序图、通信图、状态图、活动图、构件图和部署图等。同时，还概要介绍了UML 2.0中新增加的一些模型及其建模方法，如复合结构图、交互概览图和时序图等模型。 本书还介绍了设计模式的基础知识和基本理论，概要介绍了每种设计模式的定义、结构、适用情形和主要特点。 *后，本书还提供了若干带有全部实现的软件设计案例，能够更加直观、有效地帮助读者理解面向对象方法中的各种抽象概念、设计原则、建模方法和建模过程。 本书适合作为高等院校软件工程及相关专业的本科生或研究生教材，也可以作为从事软件开发工作和学习面向对象方法的读者的参考资料。', '2023-12-22 18:59:51.320000', '2023-12-22 18:59:51.320000', 'b945aa01-0cfc-46c9-937a-7e8501adbb93');

-- ----------------------------
-- Table structure for mall_commodity_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_commodity_type`;
CREATE TABLE `mall_commodity_type`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_commodity_type
-- ----------------------------
INSERT INTO `mall_commodity_type` VALUES ('1e54a877-d41f-4eb7-b0bf-551cc58db3dd', '2023-12-19 23:16:12.956000', '2023-12-21 12:39:12.056000', '计算机系基础');
INSERT INTO `mall_commodity_type` VALUES ('1ff03bf9-afc7-4cf7-8d05-a7d2323211cf', '2023-12-21 12:42:25.218000', '2023-12-21 12:42:25.218000', '其他');
INSERT INTO `mall_commodity_type` VALUES ('28255aae-857e-479c-96f6-98e31cd9629e', '2023-12-21 12:40:09.051000', '2023-12-21 12:40:09.051000', '算法');
INSERT INTO `mall_commodity_type` VALUES ('2f559899-7961-46bb-b989-cafd12a9e33a', '2023-12-21 12:41:44.090000', '2023-12-21 12:41:44.090000', '数学系列');
INSERT INTO `mall_commodity_type` VALUES ('56d60a13-c91e-48b2-bf4c-439d72f09ec0', '2023-12-19 23:04:56.647000', '2023-12-22 18:50:08.990000', '编程语言');
INSERT INTO `mall_commodity_type` VALUES ('7af7aa62-ad12-43f7-bb74-636e1fa356fc', '2024-01-30 17:35:54.089000', '2024-01-30 17:35:54.089000', '生物类');
INSERT INTO `mall_commodity_type` VALUES ('89c520f7-7412-4396-8229-10fa47a2b549', '2023-12-19 23:04:51.719000', '2023-12-22 18:56:23.155000', 'CS系列书单');
INSERT INTO `mall_commodity_type` VALUES ('ac876517-83ab-4bb3-aeda-423b37eca91c', '2023-12-22 18:57:50.128000', '2023-12-22 18:57:50.128000', '操作系统');
INSERT INTO `mall_commodity_type` VALUES ('ea920a3c-340f-44f3-a7e8-1d205a0ee71c', '2023-12-19 23:05:01.833000', '2023-12-21 12:40:03.956000', '计算机网络');
INSERT INTO `mall_commodity_type` VALUES ('f8309023-c86c-4ef9-b95c-8b08de80ee34', '2023-12-29 15:01:17.611000', '2023-12-29 15:01:17.611000', '化学系');

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count_num` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `sum_price` decimal(38, 2) NOT NULL,
  `commodity_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbircvuuj8bpyl62r547ug3qxh`(`commodity_id`) USING BTREE,
  INDEX `FKbvyqh5ym8v8mlbap3lslnyksc`(`user_id`) USING BTREE,
  CONSTRAINT `FKbircvuuj8bpyl62r547ug3qxh` FOREIGN KEY (`commodity_id`) REFERENCES `mall_commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbvyqh5ym8v8mlbap3lslnyksc` FOREIGN KEY (`user_id`) REFERENCES `mall_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('0b6c6fce-a0e8-41e7-bb49-e0b4a5fed682', 2, '2024-01-30 17:34:21.474000', '2024-01-30 17:35:22.547000', 3, 466.00, '821bd3b5-399f-416d-8299-ccbe5fbe0470', '测试用户');
INSERT INTO `mall_order` VALUES ('21c0c5a9-1694-4dc5-865e-3f7e0825519b', 2, '2023-12-19 23:15:27.096000', '2023-12-22 18:28:18.600000', 6, 84.00, '8187bff4-a3b9-4335-9471-e0da3a855d4b', 'xia');
INSERT INTO `mall_order` VALUES ('2f111928-47c4-4c04-a25b-ae9ac93f668b', 1, '2023-12-19 23:19:15.141000', '2023-12-22 18:28:17.406000', 6, 111.00, '5dfa0538-2ba2-4a43-8a61-f6d9b2d6481b', 'xia');
INSERT INTO `mall_order` VALUES ('3e6fc855-cb08-4440-bb83-f34c6a777fd6', 5, '2023-12-22 10:29:33.419000', '2023-12-22 18:28:13.790000', 6, 150.00, 'c626b12e-c50d-4192-a084-c61a64bfe079', '测试用户');
INSERT INTO `mall_order` VALUES ('4e1841b0-1ccd-44c3-881d-17f17e0f9313', 10, '2023-12-29 15:00:00.949000', '2024-01-30 17:15:46.478000', 0, 350.00, 'f86ee368-b074-4f79-b334-7077a1ceed7c', '测试用户');
INSERT INTO `mall_order` VALUES ('588324b0-3f80-4db6-b384-c7f7bd15adf5', 3, '2023-12-21 21:31:15.981000', '2023-12-22 18:28:12.727000', 6, 90.00, '5f4bb602-1a76-474e-8ca9-da7e7d5c5c75', '测试用户');
INSERT INTO `mall_order` VALUES ('7159fc79-c84b-4c9a-b0a8-8b005e314e66', 1, '2023-12-23 13:26:47.509000', '2024-01-30 17:15:47.910000', 0, 666.00, '41201239-e7a5-4f61-bd53-d67de0850ec9', '测试用户');
INSERT INTO `mall_order` VALUES ('b510674d-76b2-4d8e-ac16-8f5e62ad5f67', 1, '2023-12-19 23:07:18.151000', '2023-12-22 18:28:10.539000', 6, 180.00, 'a84b6016-30ed-48b6-8cb9-7a1e9660c55d', 'xia');
INSERT INTO `mall_order` VALUES ('c8adabd4-cc82-4c60-b95e-d0c9c6abf675', 1, '2023-12-19 23:20:56.968000', '2023-12-22 18:28:15.782000', 6, 180.00, 'a84b6016-30ed-48b6-8cb9-7a1e9660c55d', 'xia');
INSERT INTO `mall_order` VALUES ('d9ac087e-27aa-4923-970c-6d8933507fc9', 1, '2024-01-30 17:34:12.879000', '2024-01-30 17:35:27.094000', 3, 35.00, 'f86ee368-b074-4f79-b334-7077a1ceed7c', '测试用户');
INSERT INTO `mall_order` VALUES ('eec26a11-7239-4e59-b87c-e6f7092f9b51', 3, '2023-12-19 23:20:32.934000', '2023-12-22 18:28:14.853000', 6, 333.00, '5dfa0538-2ba2-4a43-8a61-f6d9b2d6481b', 'xia');

-- ----------------------------
-- Table structure for mall_role
-- ----------------------------
DROP TABLE IF EXISTS `mall_role`;
CREATE TABLE `mall_role`  (
  `id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_1y8ppkpr1tc3u94nnvkmfkqlw`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_role
-- ----------------------------
INSERT INTO `mall_role` VALUES ('1', '2023-12-09 20:56:38.377000', '2023-12-09 20:56:38.377000', '管理员');
INSERT INTO `mall_role` VALUES ('2', '2023-12-09 20:56:38.387000', '2023-12-09 20:56:38.387000', '用户');

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  UNIQUE INDEX `UK_s11gq7uba5rg3x76mc0pgy733`(`email`) USING BTREE,
  INDEX `FKf2jb154hnvqln2le4ql4w3lfk`(`role_id`) USING BTREE,
  CONSTRAINT `FKf2jb154hnvqln2le4ql4w3lfk` FOREIGN KEY (`role_id`) REFERENCES `mall_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES ('admin', '123456', 'admin@admin.co', '2023-02-13 11:31:24.451000', '2023-02-13 11:31:24.451000', 'admin', '17588755691', '1');
INSERT INTO `mall_user` VALUES ('xia', NULL, 'xia@qq.com', '2023-12-12 02:04:08.000000', '2023-12-12 02:04:11.000000', '123456', '17588755691', '2');
INSERT INTO `mall_user` VALUES ('测试用户', 'M78星云', 'ceshi@qq.com', '2023-12-21 13:20:39.761000', '2024-01-30 17:18:03.965000', '123456', '123456789', '2');

SET FOREIGN_KEY_CHECKS = 1;
