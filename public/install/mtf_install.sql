/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : mtf_test

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 20/02/2019 21:05:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mf_atta
-- ----------------------------
DROP TABLE IF EXISTS `mf_atta`;
CREATE TABLE `mf_atta`  (
  `aid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sign` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件标识确保与Topic附加标识一致',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fileName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `downs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `isimages` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `mf_auth_rule`;
CREATE TABLE `mf_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mf_auth_rule
-- ----------------------------
INSERT INTO `mf_auth_rule` VALUES (1, 'admin', '超级管理', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (2, 'view', '查看帖子', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (3, 'banUser', '封禁用户', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (4, 'move', '移动帖子', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (5, 'down', '下载附件', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (6, 'delete', '删除帖子', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (7, 'comment', '允许回复', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (8, 'create', '允许发帖', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (9, 'top', '置顶帖子', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (10, 'essence', '设置精华', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (11, 'update', '编辑帖子', 1, 1, '');
INSERT INTO `mf_auth_rule` VALUES (12, 'message', '发送信息', 1, 1, '');

-- ----------------------------
-- Table structure for mf_comment
-- ----------------------------
DROP TABLE IF EXISTS `mf_comment`;
CREATE TABLE `mf_comment`  (
  `cid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `likes` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `downs` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reply_id` int(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复id',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mf_forum
-- ----------------------------
DROP TABLE IF EXISTS `mf_forum`;
CREATE TABLE `mf_forum`  (
  `fid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cgroup` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '允许发帖用户组',
  `topics` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `notice` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序顺序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `icon` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seoDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mf_forum
-- ----------------------------
INSERT INTO `mf_forum` VALUES (1, '官方发布板块', '1', 7, '官方信息发布板块', '默认板块公告', 0, 0, '', '官方信息发布板块', '官方');
INSERT INTO `mf_forum` VALUES (2, '水漫金山', '0', 6, '这里可以进行一些日常交流与讨论。', '这里可以进行一些日常交流与讨论。', 0, 0, '', '', '');

-- ----------------------------
-- Table structure for mf_group
-- ----------------------------
DROP TABLE IF EXISTS `mf_group`;
CREATE TABLE `mf_group`  (
  `gid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `rules` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mf_group
-- ----------------------------
INSERT INTO `mf_group` VALUES (1, '管理员', 1, '1,2,3,4,5,6,7,8,9,10,11,12');
INSERT INTO `mf_group` VALUES (2, '注册会员', 1, '2,8,11');

-- ----------------------------
-- Table structure for mf_links
-- ----------------------------
DROP TABLE IF EXISTS `mf_links`;
CREATE TABLE `mf_links`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `sold` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `picurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mf_links
-- ----------------------------
INSERT INTO `mf_links` VALUES (1, 0, '作者博客', 'https://blog.mltree.top', 'https://cn.gravatar.com/avatar/dce77d27fc8bd42ef671230baf5795a8?s=64&d=mm&r=g');
INSERT INTO `mf_links` VALUES (2, 1, '十载北林Pan', 'https://pan.kingsr.cc', 'https://pan.kingsr.cc/static/img/logo_s.png');

-- ----------------------------
-- Table structure for mf_message
-- ----------------------------
DROP TABLE IF EXISTS `mf_message`;
CREATE TABLE `mf_message`  (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL COMMENT '发送者uid',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `toUid` int(11) UNSIGNED NOT NULL COMMENT '目标uid',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `status` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已阅0未阅1已阅',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mf_options
-- ----------------------------
DROP TABLE IF EXISTS `mf_options`;
CREATE TABLE `mf_options`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `option_name`(`name`(10)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mf_options
-- ----------------------------
INSERT INTO `mf_options` VALUES (1, 'defaulegroup', '2', 'reg');
INSERT INTO `mf_options` VALUES (2, 'fromName', 'MlTree Forum', 'email');
INSERT INTO `mf_options` VALUES (3, 'fromAdress', '', 'email');
INSERT INTO `mf_options` VALUES (4, 'smtpHost', 'smtp.qiye.aliyun.com', 'email');
INSERT INTO `mf_options` VALUES (5, 'smtpPort', '25', 'email');
INSERT INTO `mf_options` VALUES (6, 'replyTo', '', 'email');
INSERT INTO `mf_options` VALUES (7, 'smtpUser', '', 'email');
INSERT INTO `mf_options` VALUES (8, 'smtpPass', '', 'email');
INSERT INTO `mf_options` VALUES (9, 'encriptionType', 'no', 'email');
INSERT INTO `mf_options` VALUES (10, 'siteTitle', 'MlTree Forum 官方站 - 开源轻论坛', 'base');
INSERT INTO `mf_options` VALUES (11, 'siteDes', '本站是 MlTree Forum 论坛社区产品的官方交流站点。MlTree Forum是一款由Thinkphp构建、Material Design风格的轻论坛。', 'base');
INSERT INTO `mf_options` VALUES (12, 'siteKeywords', 'MlTree Forum PHP 开源 轻论坛 轻社区 Material Design Thinkphp', 'base');
INSERT INTO `mf_options` VALUES (13, 'forumNum', '25', 'forum');
INSERT INTO `mf_options` VALUES (14, 'siteFooterJs', '', 'base');
INSERT INTO `mf_options` VALUES (15, 'commentNum', '10', 'forum');
INSERT INTO `mf_options` VALUES (16, 'regStatus', '1', 'reg');
INSERT INTO `mf_options` VALUES (17, 'emailActive', '1', 'reg');
INSERT INTO `mf_options` VALUES (18, 'active_mail_content', '<!DOCTYPE html>\r\n<html>\r\n\r\n  <head>\r\n    <meta charset=\"utf-8\" />\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <title>MlTreeForum邮件模板</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <meta name=\"keywords\" content=\"MlTreeForum PHP 开源 轻论坛 轻社区 Material Design Thinkphp\" />\r\n    <meta name=\"description\" content=\"本站是 MlTree Forum 论坛社区产品的官方交流站点。MlTree Forum是一款由Thinkphp构建、Material Design风格的轻论坛。\" />\r\n    <meta name=\"author\" content=\"北林\">\r\n    <link rel=\"stylesheet\" href=\"https://cdn.bootcss.com/mdui/0.4.0/css/mdui.min.css\">\r\n    <script src=\"https://cdn.bootcss.com/mdui/0.4.0/js/mdui.min.js\"></script>\r\n  </head>\r\n\r\n  <body class=\"mdui-theme-primary-pink mdui-theme-accent-pink mdui-center\">\r\n    <div class=\"mdui-col-xs-12 mdui-col-sm-9 mdui-center mdui-text-center\">\r\n      <div class=\"mdui-card\">\r\n\r\n        <!-- 卡片的媒体内容，可以包含图片、视频等媒体内容，以及标题、副标题 -->\r\n        <div class=\"mdui-card-media\">\r\n          <img src=\"https://piccdn.freejishu.com/images/2016/04/04/z5gpqMql.jpg\" height=\"300px\" />\r\n        </div>\r\n\r\n        <!-- 卡片的标题和副标题 -->\r\n        <div class=\"mdui-card-primary\">\r\n          <div class=\"mdui-card-primary-title\">激活你的{siteTitle}账户</div>\r\n          <div class=\"mdui-card-primary-subtitle\">Welcome</div>\r\n        </div>\r\n\r\n        <!-- 卡片的内容 -->\r\n        <div class=\"mdui-card-content\">\r\n          <p> 亲爱的用户{userName}：\r\n            <br/> 您正在注册{siteTitle}会员。</p>\r\n          <p>\r\n            点击下方的链接进行激活:\r\n            <br>\r\n            <br>\r\n            <a href=\"{url}\">{url}</a>\r\n          </p>\r\n          <p>\r\n            如果无法点击，请复制到浏览器地址栏后访问。\r\n          </p>\r\n        </div>\r\n\r\n      </div>\r\n    </div>\r\n\r\n  </body>\r\n\r\n</html>', 'mailTemplate');
INSERT INTO `mf_options` VALUES (19, 'reset_mail_content', '<!DOCTYPE html>\r\n<html>\r\n\r\n  <head>\r\n    <meta charset=\"utf-8\" />\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <title>MlTreeForum邮件模板</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <meta name=\"keywords\" content=\"MlTreeForum PHP 开源 轻论坛 轻社区 Material Design Thinkphp\" />\r\n    <meta name=\"description\" content=\"本站是 MlTree Forum 论坛社区产品的官方交流站点。MlTree Forum是一款由Thinkphp构建、Material Design风格的轻论坛。\" />\r\n    <meta name=\"author\" content=\"北林\">\r\n    <link rel=\"stylesheet\" href=\"https://cdn.bootcss.com/mdui/0.4.0/css/mdui.min.css\">\r\n    <script src=\"https://cdn.bootcss.com/mdui/0.4.0/js/mdui.min.js\"></script>\r\n  </head>\r\n\r\n  <body class=\"mdui-theme-primary-pink mdui-theme-accent-pink mdui-center\">\r\n    <div class=\"mdui-col-xs-12 mdui-col-sm-7 dui-center mdui-text-center\">\r\n      <div class=\"mdui-card\">\r\n\r\n        <!-- 卡片的媒体内容，可以包含图片、视频等媒体内容，以及标题、副标题 -->\r\n        <div class=\"mdui-card-media\">\r\n          <img src=\"https://piccdn.freejishu.com/images/2016/04/04/z5gpqMql.jpg\" height=\"300px\" />\r\n        </div>\r\n\r\n        <!-- 卡片的标题和副标题 -->\r\n        <div class=\"mdui-card-primary\">\r\n          <div class=\"mdui-card-primary-title\">找回{siteTitle}账户</div>\r\n          <div class=\"mdui-card-primary-subtitle\">Welcome</div>\r\n        </div>\r\n\r\n        <!-- 卡片的内容 -->\r\n        <div class=\"mdui-card-content\">\r\n          亲爱的{userName}：\r\n          <br/> 您申请了找回账户，\r\n          <br/>您的验证码为 <code>{code}</code>\r\n        </div>\r\n\r\n      </div>\r\n    </div>\r\n\r\n  </body>\r\n\r\n</html>', 'mailTemplate');
INSERT INTO `mf_options` VALUES (20, 'siteStatus', '1', 'base');
INSERT INTO `mf_options` VALUES (21, 'reg_mail_title', '{siteTitle} 激活邮件', 'mailTemplate');
INSERT INTO `mf_options` VALUES (22, 'notice', '欢迎来到MlTree Forum', 'base');
INSERT INTO `mf_options` VALUES (23, 'full', '1', 'base');
INSERT INTO `mf_options` VALUES (24, 'editor', '1', 'forum');
INSERT INTO `mf_options` VALUES (25, 'closeContent', '站点正在进行闭站维护…… <br/>预计一小时后完成。', 'base');
INSERT INTO `mf_options` VALUES (26, 'siteIcp', '', 'base');
INSERT INTO `mf_options` VALUES (27, 'golink', '1', 'base');
INSERT INTO `mf_options` VALUES (28, 'allowQQreg', '1', 'reg');
INSERT INTO `mf_options` VALUES (29, 'uploadType', 'base', 'upload');
INSERT INTO `mf_options` VALUES (30, 'UpyunServiceName', '', 'upload');
INSERT INTO `mf_options` VALUES (31, 'UpyunUser', '', 'upload');
INSERT INTO `mf_options` VALUES (32, 'UpyunPwd', '', 'upload');
INSERT INTO `mf_options` VALUES (33, 'saveFileLocal', '', 'upload');
INSERT INTO `mf_options` VALUES (34, 'template', 'default/', 'base');
INSERT INTO `mf_options` VALUES (35, 'siteUrl', 'http://127.0.0.1', 'base');

-- ----------------------------
-- Table structure for mf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `mf_plugin`;
CREATE TABLE `mf_plugin`  (
  `pid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(1) UNSIGNED ZEROFILL NOT NULL,
  `init` int(1) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mf_plugin_options
-- ----------------------------
DROP TABLE IF EXISTS `mf_plugin_options`;
CREATE TABLE `mf_plugin_options`  (
  `poid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`poid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mf_topic
-- ----------------------------
DROP TABLE IF EXISTS `mf_topic`;
CREATE TABLE `mf_topic`  (
  `tid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `sign` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件标识',
  `user_ip` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subject` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `views` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `comment` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `closed` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否关闭',
  `tops` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `essence` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '精华',
  `likes` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '点赞人数',
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `fid`(`fid`, `tid`) USING BTREE,
  INDEX `uid`(`uid`, `user_ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mf_user
-- ----------------------------
DROP TABLE IF EXISTS `mf_user`;
CREATE TABLE `mf_user`  (
  `uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户组编号',
  `email` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `username` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\\static\\images\\user_defaule.png' COMMENT '头像URL',
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `topics` int(11) NOT NULL DEFAULT 0 COMMENT '发帖数',
  `essence` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '精华数',
  `comments` int(11) NOT NULL DEFAULT 0 COMMENT '回帖数',
  `credits` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `create_ip` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '创建时IP',
  `create_date` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `login_ip` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '登录时IP',
  `login_date` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `logins` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `code` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qqconnectId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ互联UserOpenId',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `gid`(`gid`, `username`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO `{database}`.`mf_user` VALUES ('1', '1', '{email}', '{username}', '{password}', '', NULL, '', '', '0', '0', '0', '0', '0', '0', '', '', '0', 1, NULL, NULL);
SELECT * FROM mf_user WHERE uid = 1