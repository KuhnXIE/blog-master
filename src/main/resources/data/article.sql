/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : study-blog

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 28/11/2022 21:03:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int NULL DEFAULT NULL COMMENT '文章分类',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章类型 1原创 2转载 3翻译',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密 3评论可见',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除。默认0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 3, 'redis高可用', 'redis 的 hash 结构', 1, NULL, 0, 1, 0, '2022-11-28 12:35:05', NULL);
INSERT INTO `article` VALUES (2, 1, 3, 'redis高可用', 'redis 的 hash 结构', 1, NULL, 0, 1, 0, '2022-11-28 12:35:05', NULL);
INSERT INTO `article` VALUES (3, 3, 3, '3213', '41242', 1, '', 0, 1, 0, '2022-11-28 18:16:50', NULL);
INSERT INTO `article` VALUES (4, 3, 4, '测试数据', '随便写写', 1, '', 0, 1, 0, '2022-11-28 20:12:36', NULL);
INSERT INTO `article` VALUES (5, 3, 12, '起个什么名呢', '# 第一次学习JS\n感觉非常滴棒', 1, '', 0, 1, 0, '2022-11-28 20:14:33', NULL);
INSERT INTO `article` VALUES (6, 3, 13, '随便写写', '23141', 1, '', 0, 1, 0, '2022-11-28 20:15:02', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除。默认0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (3, 'redis', 0, '2022-11-28 09:33:45', '2022-11-28 11:19:50');
INSERT INTO `category` VALUES (4, 'springboot', 0, '2022-11-28 09:33:18', NULL);
INSERT INTO `category` VALUES (9, 'mysql', 0, '2022-11-28 11:44:26', NULL);
INSERT INTO `category` VALUES (10, 'spring cloud', 0, '2022-11-28 18:22:54', NULL);
INSERT INTO `category` VALUES (11, 'java', 0, '2022-11-28 18:23:05', NULL);
INSERT INTO `category` VALUES (12, 'js', 0, '2022-11-28 18:23:10', NULL);
INSERT INTO `category` VALUES (13, 'html', 0, '2022-11-28 18:23:22', NULL);
INSERT INTO `category` VALUES (14, 'k8s', 0, '2022-11-28 19:07:52', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `topic_id` int NULL DEFAULT NULL COMMENT '评论主题id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int NULL DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除。默认0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id`) USING BTREE,
  INDEX `fk_comment_parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除。默认0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int NULL DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除。默认0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1823977035@qq.com', '蟹老板', 'admin', '123456', NULL, 'https://tupian.qqw21.com/article/UploadPic/2019-3/20193242231891366.jpeg', '00后帅小伙', 0, 0, '2022-11-24 15:31:06', '2022-11-25 11:15:14');
INSERT INTO `user` VALUES (2, '1823977036@qq.com', '海绵宝宝', '123456', '123456', NULL, 'https://tupian.qqw21.com/article/UploadPic/2019-3/20193242231891366.jpeg', '00后帅小伙', 0, 0, '2022-11-24 15:31:06', '2022-11-28 13:07:40');
INSERT INTO `user` VALUES (3, '1823077035@qq.com', '大坤坤', '66666', '123456', NULL, 'https://inews.gtimg.com/newsapp_bt/0/15454399225/1000', '00后帅小伙', 0, 0, '2022-11-28 13:05:59', NULL);

SET FOREIGN_KEY_CHECKS = 1;
