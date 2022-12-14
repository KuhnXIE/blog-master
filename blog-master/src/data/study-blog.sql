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

 Date: 14/12/2022 16:48:41
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (2, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/02/05/ChMkJ1bKyX2ID6LcABwDoQU_OKgAALIOgI50YIAHAO5094.jpg', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:30:29');
INSERT INTO `article` VALUES (3, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.541b0167a3b19698b923eed406e15e24?rik=j6zK2CFZUqfxEg&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f85874369%2f1430275270543.jpg&ehk=ZAuK0aF9HleGZcZlll%2bzI%2fXtvOlBGv5iiRHFDgrwc6Y%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:30:40');
INSERT INTO `article` VALUES (4, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.9edbc232f2cb8fc6d5d29883c3c067d6?rik=iu%2b0lSANtD5wDg&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f79937572%2f14.jpg&ehk=rNGczoO1cAubcPMzQbCrLp%2bjpxo6WJwL7PQFLBK3WuI%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:30:50');
INSERT INTO `article` VALUES (5, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.985a8b38c786cbea5886dd6d461a4e7c?rik=V0z3mSjFli8e7A&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f56187004%2f139-15041G10648.jpg&ehk=qmk%2fkhFiJqJ3FcNiasBuezwkWZSZOs9PMZGJq%2fE68TU%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:30:52');
INSERT INTO `article` VALUES (6, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (7, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (8, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (9, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (10, 1, 1, 'spring AOP', '## 随便写的', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b030f39cf1be003992d1b72cd90dd921?rik=vCqPy0lPGNtYAA&riu=http%3a%2f%2fwww.kutoo8.com%2fupload%2fimage%2f17895398%2f201305161015.jpg&ehk=C8dqQ9iYAUSocnc2jKzS5ut5JXhrEbJ3sCB4w%2fckNYM%3d&risl=&pid=ImgRaw&r=0', 0, 1, 0, '2022-12-01 10:19:18', '2022-12-05 20:27:33');
INSERT INTO `article` VALUES (11, 1, 2, '后端怎么学前端', '# 瞎几把学', 1, 'https://upload-bbs.mihoyo.com/upload/2021/08/18/190498053/07092894a6e96cc7580589f752ca54d9_5415423481664722598.jpg?x-oss-process=image/resize,s_600/quality,q_80/auto-orient,0/interlace,1/format,jpg', 0, 1, 0, '2022-12-06 14:46:17', '2022-12-06 14:51:19');
INSERT INTO `article` VALUES (12, 1, 2, '后端怎么学前端', '# 瞎几把学', 1, 'https://upload-bbs.mihoyo.com/upload/2021/02/12/6144353/e44b43b7241520e825da98a836ddc27c_2846279177665470352.jpg', 0, 1, 0, '2022-12-06 14:50:50', NULL);
INSERT INTO `article` VALUES (13, 1, 2, '后端怎么学前端', '# 瞎几把学', 1, 'https://upload-bbs.mihoyo.com/upload/2021/01/17/6397109/b117d603fe968814780ab79f9c722908_5821162137257331358.jpg?x-oss-process=image/resize,s_600/quality,q_80/auto-orient,0/interlace,1/format,jpg', 0, 1, 0, '2022-12-06 14:50:58', NULL);
INSERT INTO `article` VALUES (14, 1, 2, '后端怎么学前端', '# 瞎几把学\n\n> 段落引用\n\n==标记==\n\n++下划线++\n\n~~中划线~~\n*斜体*\n\n~~中划线~~', 1, 'https://upload-bbs.mihoyo.com/upload/2021/01/17/6397109/b117d603fe968814780ab79f9c722908_5821162137257331358.jpg?x-oss-process=image/resize,s_600/quality,q_80/auto-orient,0/interlace,1/format,jpg', 0, 1, 0, '2022-12-06 19:10:25', NULL);
INSERT INTO `article` VALUES (15, 1, 2, '21311', '233232', 1, '22', 0, 1, 0, '2022-12-14 10:13:30', NULL);
INSERT INTO `article` VALUES (16, 1, 2, '21311', '233232', 1, '22', 0, 1, 0, '2022-12-14 10:13:42', NULL);
INSERT INTO `article` VALUES (17, 1, 2, '2133', '232', 1, '2', 0, 1, 0, '2022-12-14 10:18:33', NULL);
INSERT INTO `article` VALUES (18, 1, 5, '21341', '3233', 1, '', 0, 1, 0, '2022-12-14 10:19:35', NULL);
INSERT INTO `article` VALUES (19, 1, 5, '21341', '3233', 1, '', 0, 1, 0, '2022-12-14 10:22:40', NULL);
INSERT INTO `article` VALUES (20, 1, 2, '213', '23223', 1, '23', 0, 1, 0, '2022-12-14 10:23:35', NULL);
INSERT INTO `article` VALUES (21, 1, 4, '32131', '2133', 1, '', 0, 1, 0, '2022-12-14 10:24:11', NULL);
INSERT INTO `article` VALUES (22, 1, 2, '21313', '4233', 1, '', 0, 1, 0, '2022-12-14 10:59:28', NULL);
INSERT INTO `article` VALUES (23, 1, 2, '213', '222', 1, '', 0, 1, 0, '2022-12-14 11:01:32', NULL);
INSERT INTO `article` VALUES (24, 1, 2, '32', '231', 1, '', 0, 1, 0, '2022-12-14 11:08:43', NULL);
INSERT INTO `article` VALUES (25, 1, 2, '2131', '23131', 1, '', 0, 1, 0, '2022-12-14 11:13:11', NULL);
INSERT INTO `article` VALUES (26, 1, 2, '2414', '32132', 1, '', 0, 1, 0, '2022-12-14 11:15:02', NULL);
INSERT INTO `article` VALUES (27, 1, 2, '213', '43242', 1, '', 0, 1, 0, '2022-12-14 11:16:33', NULL);
INSERT INTO `article` VALUES (28, 1, 2, '34242', '## 二级标题', 1, '', 0, 1, 0, '2022-12-14 11:25:14', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'spring', 0, '2022-11-25 19:02:21', NULL);
INSERT INTO `category` VALUES (2, '前端', 0, '2022-12-06 14:32:18', NULL);
INSERT INTO `category` VALUES (3, '后端', 0, '2022-12-06 14:32:26', NULL);
INSERT INTO `category` VALUES (4, 'Java', 0, '2022-12-06 14:32:39', NULL);
INSERT INTO `category` VALUES (5, '运维', 0, '2022-12-06 14:32:50', NULL);
INSERT INTO `category` VALUES (6, '嵌入式', 0, '2022-12-06 14:32:56', NULL);
INSERT INTO `category` VALUES (7, 'Python', 0, '2022-12-06 14:33:04', NULL);
INSERT INTO `category` VALUES (8, '开发工具', 0, '2022-12-06 14:33:13', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1823977035@qq.com', '超级管理员', 'admin', '123456', NULL, 'https://tupian.qqw21.com/article/UploadPic/2019-3/20193242231891366.jpeg', '00后帅小伙', 0, 0, '2022-11-24 15:31:06', '2022-12-01 10:02:51');
INSERT INTO `user` VALUES (2, '1823977036@qq.com', '海绵宝宝', '123456', '123456', NULL, 'https://tupian.qqw21.com/article/UploadPic/2019-3/20193242231891366.jpeg', '00后帅小伙', 0, 0, '2022-11-24 15:31:06', '2022-11-25 11:15:09');
INSERT INTO `user` VALUES (5, '666888@555', '测试用户', '111111', '123456', NULL, 'https://tupian.qqw21.com/article/UploadPic/2020-11/202011242047623188.jpg', '00后帅小伙', 0, 0, '2022-12-06 17:43:49', '2022-12-06 18:05:45');

SET FOREIGN_KEY_CHECKS = 1;
