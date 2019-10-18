/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : cinema

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 18/10/2019 17:30:39
*/

-- 创建数据库
CREATE DATABASE priject;
-- 进入数据库
USE priject;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for region_sort
-- ----------------------------
DROP TABLE IF EXISTS `region_sort`;
CREATE TABLE `region_sort`  (
  `region_sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区分类id',
  `region_sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY (`region_sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region_sort
-- ----------------------------
INSERT INTO `region_sort` VALUES (1, '大陆');
INSERT INTO `region_sort` VALUES (2, '香港');
INSERT INTO `region_sort` VALUES (3, '台湾');
INSERT INTO `region_sort` VALUES (4, '美国');
INSERT INTO `region_sort` VALUES (5, '韩国');
INSERT INTO `region_sort` VALUES (6, '日本');
INSERT INTO `region_sort` VALUES (7, '泰国');
INSERT INTO `region_sort` VALUES (8, '新加坡');
INSERT INTO `region_sort` VALUES (9, '马来西亚');
INSERT INTO `region_sort` VALUES (10, '印度');
INSERT INTO `region_sort` VALUES (11, '英国');
INSERT INTO `region_sort` VALUES (12, '法国');
INSERT INTO `region_sort` VALUES (13, '加拿大');
INSERT INTO `region_sort` VALUES (14, '西班牙');
INSERT INTO `region_sort` VALUES (15, '俄罗斯');
INSERT INTO `region_sort` VALUES (16, '未知');

-- ----------------------------
-- Table structure for time_sort
-- ----------------------------
DROP TABLE IF EXISTS `time_sort`;
CREATE TABLE `time_sort`  (
  `time_sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '时间分类id',
  `time_sort_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间分类名称',
  PRIMARY KEY (`time_sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_sort
-- ----------------------------
INSERT INTO `time_sort` VALUES (1, '1995');
INSERT INTO `time_sort` VALUES (2, '1996');
INSERT INTO `time_sort` VALUES (3, '1997');
INSERT INTO `time_sort` VALUES (4, '1998');
INSERT INTO `time_sort` VALUES (5, '1999');
INSERT INTO `time_sort` VALUES (6, '2000');
INSERT INTO `time_sort` VALUES (7, '2001');
INSERT INTO `time_sort` VALUES (8, '2002');
INSERT INTO `time_sort` VALUES (9, '2003');
INSERT INTO `time_sort` VALUES (10, '2004');
INSERT INTO `time_sort` VALUES (11, '2005');
INSERT INTO `time_sort` VALUES (12, '2006');
INSERT INTO `time_sort` VALUES (13, '2007');
INSERT INTO `time_sort` VALUES (14, '2008');
INSERT INTO `time_sort` VALUES (15, '2009');
INSERT INTO `time_sort` VALUES (16, '2010');
INSERT INTO `time_sort` VALUES (17, '2011');
INSERT INTO `time_sort` VALUES (18, '2012');
INSERT INTO `time_sort` VALUES (19, '2013');
INSERT INTO `time_sort` VALUES (20, '2014');
INSERT INTO `time_sort` VALUES (21, '2015');
INSERT INTO `time_sort` VALUES (22, '2016');
INSERT INTO `time_sort` VALUES (23, '2017');
INSERT INTO `time_sort` VALUES (24, '2018');
INSERT INTO `time_sort` VALUES (25, '2019');
INSERT INTO `time_sort` VALUES (26, '其它');

-- ----------------------------
-- Table structure for type_sort
-- ----------------------------
DROP TABLE IF EXISTS `type_sort`;
CREATE TABLE `type_sort`  (
  `type_sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频二级分类id',
  `type_sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频二级分类名称',
  `video_sort_id` int(11) NULL DEFAULT NULL COMMENT '视频分类id',
  `type_sort_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击用路径',
  PRIMARY KEY (`type_sort_id`) USING BTREE,
  INDEX `fk_video_sort_id`(`video_sort_id`) USING BTREE,
  CONSTRAINT `fk_video_sort_id` FOREIGN KEY (`video_sort_id`) REFERENCES `video_sort` (`video_sort_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_sort
-- ----------------------------
INSERT INTO `type_sort` VALUES (1, '动作片', 1, 'ActionMovie');
INSERT INTO `type_sort` VALUES (2, '喜剧片', 1, 'Comedy');
INSERT INTO `type_sort` VALUES (3, '爱情片', 1, 'Love');
INSERT INTO `type_sort` VALUES (4, '科幻片', 1, 'ScienceFiction');
INSERT INTO `type_sort` VALUES (5, '恐怖片', 1, 'Horror');
INSERT INTO `type_sort` VALUES (6, '剧情片', 1, 'Plot');
INSERT INTO `type_sort` VALUES (7, ' 战争片', 1, 'Warfare');
INSERT INTO `type_sort` VALUES (8, '纪录片', 1, 'Record');
INSERT INTO `type_sort` VALUES (9, '国产剧', 2, 'DomesticSeries');
INSERT INTO `type_sort` VALUES (10, '港台剧', 2, 'HtSeries');
INSERT INTO `type_sort` VALUES (11, '日韩剧', 2, 'JkSeries');
INSERT INTO `type_sort` VALUES (12, '欧美剧', 2, 'EaSeries');
INSERT INTO `type_sort` VALUES (13, '内地综艺', 3, 'InlandVariety');
INSERT INTO `type_sort` VALUES (14, '港台综艺', 3, 'HkVariety');
INSERT INTO `type_sort` VALUES (15, '日韩综艺', 3, 'JkVariety');
INSERT INTO `type_sort` VALUES (16, '欧美综艺', 3, 'EaVariety');
INSERT INTO `type_sort` VALUES (17, '国产动画', 4, 'DomesticAnimation');
INSERT INTO `type_sort` VALUES (18, '日韩动画', 4, 'JkAnimation');
INSERT INTO `type_sort` VALUES (19, '欧美动画', 4, 'EaAnimation');
INSERT INTO `type_sort` VALUES (20, '港台动画', 4, 'HkAnimation');
INSERT INTO `type_sort` VALUES (21, '海外动画', 4, 'OverseasAnimation');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '910036368', '123456', '', '15682900581');
INSERT INTO `users` VALUES (2, '15682900581', '654321', '', '0');
INSERT INTO `users` VALUES (3, '111111', '123456', '', '0');
INSERT INTO `users` VALUES (4, '小幸运', 'aa123456', '123@123', '12345678910');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `video_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id  ',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '视频上传时间',
  `video_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名称',
  `timeSort_id` int(11) NOT NULL COMMENT '时间分类id',
  `regionSort_id` int(11) NOT NULL COMMENT '地区分类id',
  `typeSort_id` int(11) NOT NULL COMMENT '类型分类id',
  `videoSort_id` int(11) NOT NULL COMMENT '视频分类id',
  `video_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频保存路径',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面保存路径',
  `to_star` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主演',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导演',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '介绍',
  `plot` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '剧情',
  `language_id` int(11) NULL DEFAULT NULL COMMENT '语言id',
  `episode` int(11) NOT NULL DEFAULT 1 COMMENT '集数',
  `Playback_volume` int(255) NULL DEFAULT NULL COMMENT '视频播放量',
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 608 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '2019-08-14 02:44:39', '马丁·马特:生生死死我的天', 25, 13, 2, 1, 'https://baidu.com-ok-baidu.com/share/fdac69c3eee7bd0427535354eae235a4', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15711447630.jpg', '马丁·马特', 'Jean-François Blais', '迎在线观看由马丁·马特 等主演的喜剧片《马丁·马特：生生死死我的天》，第一时间为你提供《马丁·马特：生生死死我的天》，如果你喜欢《马丁·马特：生生死死我的天》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:社群媒體災難、丟臉的體育課、脾氣乖戾的青少年：什麼都難不倒這位諧星……除了一把釘槍', '社群媒體災難、丟臉的體育課、脾氣乖戾的青少年：什麼都難不倒這位諧星……除了一把釘槍', 1, 1, 5);
INSERT INTO `video` VALUES (2, '2019-09-18 02:44:45', '雪盲2009', 15, 16, 1, 1, 'https://56.com-ok-bilibili.com/share/f2a5e3992379aff98f056365b14be2e4', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910151571111478.jpg', '凯特·贝金赛尔 / 盖布瑞·马赫特 / 汤姆·斯凯里特 / 哥伦布·绍特', '多米尼克·塞纳', '欢迎在线观看由凯特·贝金赛尔 盖布瑞·马赫特 汤姆·斯凯里特 哥伦布·绍特 艾历克斯·奥洛林 等主演的动作片《雪盲2009》，第一时间为你提供《雪盲2009》，如果你喜欢《雪盲2009》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:肃杀之夜，一架军用飞机坠毁南极大陆，机组人员全部身亡。 　　美国位于南极洲的阿蒙森·海斯科特科学研究基地，此时迎来一年一度的圣诞假期。已在此工作两年的美丽女警凯莉·斯泰德克（凯特·贝金赛尔 Kate Beckinsale 饰）正准备回国度假，但就在这一关头，研究站接到发现尸体的报告，凯莉只得和一队人马前往调查。他们在一座峭壁前发现一具死状凄惨的尸体，经过勘察，凯莉得知死者是一名来自英国科考队的地质学家，而他死亡的背后似乎另有隐情。是时，强烈的风暴即将来袭，凯莉不得不中止行程，马不停蹄调查这起案件，希望在风暴来袭前查到凶手。在这一过程中，隐藏已久的秘密也渐渐浮出水面……', '肃杀之夜，一架军用飞机坠毁南极大陆，机组人员全部身亡。 　　美国位于南极洲的阿蒙森·海斯科特科学研究基地，此时迎来一年一度的圣诞假期。已在此工作两年的美丽女警凯莉·斯泰德克（凯特·贝金赛尔 Kate Beckinsale 饰）正准备回国度假，但就在这一关头，研究站接到发现尸体的报告，凯莉只得和一队人马前往调查。他们在一座峭壁前发现一具死状凄惨的尸体，经过勘察，凯莉得知死者是一名来自英国科考队的地质学家，而他死亡的背后似乎另有隐情。是时，强烈的风暴即将来袭，凯莉不得不中止行程，马不停蹄调查这起案件，希望在风暴来袭前查到凶手。在这一过程中，隐藏已久的秘密也渐渐浮出水面……', 1, 1, 9);
INSERT INTO `video` VALUES (3, '2019-06-13 02:44:52', '早熟2005', 11, 3, 3, 1, 'https://56.com-ok-bilibili.com/share/09c84615d91b2650a3f77605c634b2d9', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910151571119385.jpg', '房祖名 薛凯琪 曾志伟 毛舜筠 黄秋生 ', '尔冬升 ', '欢迎在线观看由房祖名 薛凯琪 曾志伟 毛舜筠 黄秋生 等主演的爱情片《早熟2005》，第一时间为你提供《早熟2005》，如果你喜欢《早熟2005》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:　出生于草根家庭的家富（房祖名饰）父亲（曾志伟饰）是小巴司机，母亲（毛舜筠饰）是一个酒楼接待员。虽然出身寒微，却享受了家庭温暖。他跟同学去了一所女子名校，无意间看到了若男（薛凯琪饰），更假扮名校学生到该女校联谊。若男的父亲（黄秋生饰）是一个律师，母亲（余安安饰）是公益积极分子。一直对若男管教严厉，也很少留在女儿身边。当若男遇到了好动的家富后，便很快被他吸引了。在若男18生日当晚，他们两人到郊外露营，偷吃了禁果。', '出生于草根家庭的家富（房祖名饰）父亲（曾志伟饰）是小巴司机，母亲（毛舜筠饰）是一个酒楼接待员。虽然出身寒微，却享受了家庭温暖。他跟同学去了一所女子名校，无意间看到了若男（薛凯琪饰），更假扮名校学生到该女校联谊。若男的父亲（黄秋生饰）是一个律师，母亲（余安安饰）是公益积极分子。一直对若男管教严厉，也很少留在女儿身边。当若男遇到了好动的家富后，便很快被他吸引了。在若男18生日当晚，他们两人到郊外露营，偷吃了禁果。', 2, 1, 45);
INSERT INTO `video` VALUES (4, '2019-04-26 02:44:57', '太空一号', 18, 4, 4, 1, 'https://iqiyi.com-qqcdn.com/share/30d4e6422cd65c7913bc9ce62e078b79', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15708695022.jpg', '盖·皮尔斯 玛姬·格蕾斯 彼得·斯特曼 约瑟夫·吉尔根 文森特·里根 连尼·詹姆斯 博扬·佩雷斯 ', '詹姆斯·马瑟 斯蒂芬·圣·莱杰 ', '欢迎在线观看由盖·皮尔斯 玛姬·格蕾斯 彼得·斯特曼 约瑟夫·吉尔根 文森特·里根 连尼·詹姆斯 博扬·佩雷斯 等主演的科幻片《太空一号》，第一时间为你提供《太空一号》，如果你喜欢《太空一号》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:未来世界，美国开发出名为“太空一号”的空间站，实则是一座戒备森严的最高警戒监狱，这里现关押着约500名罪大恶极的囚徒，他们无一例外被冷冻起来，处于昏睡之中。某日，现任美国总统的女儿艾米丽·沃纳克（玛姬·格蕾斯 Maggie Grace 饰）为考察人权问题登上太空一号，谁知在对犯人采访时意外发生，一阵混乱过后，所有的罪犯都从沉睡中苏醒，太空一号瞬间被占领，艾米丽以及工作人员沦为人质。与此同时，特工斯诺（盖·皮尔斯 Guy Pearce 饰）遭到陷害，即将遣送太空一号。可是为了营救总统的女儿，他短暂获得了自由，由此进入太空一号寻找目标人质以及掌握着他被陷害重要证据的搭档梅斯。 以少敌多的对决在外太空就此展开……', '未来世界，美国开发出名为“太空一号”的空间站，实则是一座戒备森严的最高警戒监狱，这里现关押着约500名罪大恶极的囚徒，他们无一例外被冷冻起来，处于昏睡之中。某日，现任美国总统的女儿艾米丽·沃纳克（玛姬·格蕾斯 Maggie Grace 饰）为考察人权问题登上太空一号，谁知在对犯人采访时意外发生，一阵混乱过后，所有的罪犯都从沉睡中苏醒，太空一号瞬间被占领，艾米丽以及工作人员沦为人质。与此同时，特工斯诺（盖·皮尔斯 Guy Pearce 饰）遭到陷害，即将遣送太空一号。可是为了营救总统的女儿，他短暂获得了自由，由此进入太空一号寻找目标人质以及掌握着他被陷害重要证据的搭档梅斯。 以少敌多的对决在外太空就此展开……', 1, 1, 25);
INSERT INTO `video` VALUES (5, '2019-09-13 02:45:03', '玛丽号', 25, 3, 5, 1, 'https://baidu.com-ok-baidu.com/share/dd4e40cf0437db90471f25c3ee4ae9ac', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15711268110.jpg', '加里·奥德曼 艾米莉·莫迪默 斯戴芬妮·斯考特 欧文·泰格 曼努埃尔·加西亚-鲁尔福 克洛伊·佩兰 ', '迈克尔·戈伊 ', '欢迎在线观看由加里·奥德曼 艾米莉·莫迪默 斯戴芬妮·斯考特 欧文·泰格 曼努埃尔·加西亚-鲁尔福 克洛伊·佩兰 克莱尔·拜恩 等主演的恐怖片《玛丽号》，第一时间为你提供《玛丽号》，如果你喜欢《玛丽号》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:欧文·蒂格(《小丑回魂》《至亲血统》)加盟加里·奥德曼主演的超自然惊悚类型新片《玛丽》，Michael Goi(《美国恐怖故事》《塞勒姆》)执导，《鲨滩》编剧安东尼·贾斯温斯基操刀剧本。剧情讲述一个为生活努力奋斗的家庭在拍卖会上购得一艘老船，满怀希望准备开展租船业务，却在与世隔绝的外海发现了这艘船的惊悚秘密。奥德曼饰演一家之主兼船的掌舵者，蒂格饰船长的二把手，是一位弗罗里达州的冲浪好手。该片本月底阿拉巴马开拍。', '欧文·蒂格(《小丑回魂》《至亲血统》)加盟加里·奥德曼主演的超自然惊悚类型新片《玛丽》，Michael Goi(《美国恐怖故事》《塞勒姆》)执导，《鲨滩》编剧安东尼·贾斯温斯基操刀剧本。剧情讲述一个为生活努力奋斗的家庭在拍卖会上购得一艘老船，满怀希望准备开展租船业务，却在与世隔绝的外海发现了这艘船的惊悚秘密。奥德曼饰演一家之主兼船的掌舵者，蒂格饰船长的二把手，是一位弗罗里达州的冲浪好手。该片本月底阿拉巴马开拍。', 1, 1, 25);
INSERT INTO `video` VALUES (6, '2019-06-01 02:45:09', '荒岛甜心', 25, 4, 6, 1, 'https://bilibili.com-h-bilibili.com/20191015/10073_af3af7fe/index.m3u8', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910151571135096.jpg', '科雷西·克莱门斯 艾莫里·科恩 汉娜·曼根·劳伦斯 Andrew Crawford ', 'J·D·迪拉德 ', '欢迎在线观看由科雷西·克莱门斯 艾莫里·科恩 汉娜·曼根·劳伦斯 Andrew Crawford 等主演的剧情片《荒岛甜心》，第一时间为你提供《荒岛甜心》，如果你喜欢《荒岛甜心》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:珍（Kiersey Clemons）冲上岸，来到一个荒凉的岛上，已经度过了痛苦的折磨。她孤零零地四处寻找避难所。她只找到一处被遗弃已久的露营地的零星残骸，疲惫不堪地走完了可怕的旅途，倒下了，希望得到安宁的休息。但是夜晚是这里最危险的时候。这时生物来了。当它滑出水面时，它必须进食。', '珍（Kiersey Clemons）冲上岸，来到一个荒凉的岛上，已经度过了痛苦的折磨。她孤零零地四处寻找避难所。她只找到一处被遗弃已久的露营地的零星残骸，疲惫不堪地走完了可怕的旅途，倒下了，希望得到安宁的休息。但是夜晚是这里最危险的时候。这时生物来了。当它滑出水面时，它必须进食。', 1, 1, 11);
INSERT INTO `video` VALUES (7, '2019-06-12 02:45:14', '无畏2019', 25, 4, 7, 1, 'https://bilibili.com-h-bilibili.com/20191015/10072_f91c7acb/index.m3u8', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/201910151571131087.jpg', '贾德·尼尔森 德鲁·加勒特 Aidan Bristow C·托马斯·豪威尔 詹姆斯·奥斯汀·科尔 ', '迈克·菲利普斯 ', '欢迎在线观看由贾德·尼尔森 德鲁·加勒特 Aidan Bristow C·托马斯·豪威尔 詹姆斯·奥斯汀·科尔 等主演的战争片《无畏2019》，第一时间为你提供《无畏2019》，如果你喜欢《无畏2019》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:By June 1942, the Japanese Navy has swept across the Pacific. In an effort to change the course of the war, a United States carrier group is positioned off the coast of Midway, tasked with springing a trap on the enemy. During this pivotal battle, the two-man crew of a U.S. Navy dive bomber is forced to ditch in the sea. Set adrift, the men look qiwan.cc towards their comrades for rescue; namely, the ragtag crew of a PBY Catalina, who are sent to search for survivors. Amid the vast openness of the Pacific, with days passing and the chance of rescue fading, the men are forced to face their own mortality.', 'By June 1942, the Japanese Navy has swept across the Pacific. In an effort to change the course of the war, a United States carrier group is positioned off the coast of Midway, tasked with springing a trap on the enemy. During this pivotal battle, the two-man crew of a U.S. Navy dive bomber is forced to ditch in the sea. Set adrift, the men look qiwan.cc towards their comrades for rescue; namely, the ragtag crew of a PBY Catalina, who are sent to search for survivors. Amid the vast openness of the Pacific, with days passing and the chance of rescue fading, the men are forced to face their own mortality.', 1, 1, 22);
INSERT INTO `video` VALUES (8, '2019-06-21 02:45:20', '监狱幸存者指南', 24, 4, 8, 1, 'https://tudou.com-l-tudou.com/20181209/14881_8f8c93b1/index.m3u8', 'https://rpg.pic-imges.com/pic/upload/vod/2018-12/15443673590.jpg', '苏珊·萨兰登,帕特丽夏·阿奎特,丹尼·特雷霍,杰西·威廉姆斯', '马修·库克', '欢迎在线观看由苏珊·萨兰登 帕特丽夏·阿奎特 丹尼·特雷霍 杰西·威廉姆斯 等主演的纪录片《监狱幸存者指南》，第一时间为你提供《监狱幸存者指南》，如果你喜欢《监狱幸存者指南》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:NetFlix原创纪录片，本纪录片从布鲁斯与瑞吉的故事拍摄，他们是监狱的受刑人，在狱中为他们未曾承认犯下的谋杀罪名，度过了数年。观众将从他们的视角，窥视美国的监狱体系，导演对此并提出质疑。', 'NetFlix原创纪录片，本纪录片从布鲁斯与瑞吉的故事拍摄，他们是监狱的受刑人，在狱中为他们未曾承认犯下的谋杀罪名，度过了数年。观众将从他们的视角，窥视美国的监狱体系，导演对此并提出质疑', 1, 1, 55);
INSERT INTO `video` VALUES (9, '2019-05-23 02:45:32', '激荡', 25, 1, 9, 2, 'https://youku.com-ok-tudou.com/share/ed46558a56a4a26b96a68738a0d28273', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15691687081.jpg', '任重,郭晓东,李念,车晓,侯勇,陶泽如,张逗逗,李亭哲,李诚儒', '余丁', '欢迎在线观看由任重 郭晓东 李念 车晓 侯勇 陶泽如 张逗逗 李亭哲 李诚儒 等主演的国产剧《激荡D》，第一时间为你提供《激荡D》，如果你喜欢《激荡D》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', '#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', 2, 1, 11);
INSERT INTO `video` VALUES (10, '2019-10-16 02:45:39', '激荡', 25, 1, 9, 2, 'https://youku.com-ok-tudou.com/share/ed46558a56a4a26b96a68738a0d28273', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15691687081.jpg', '任重,郭晓东,李念,车晓,侯勇,陶泽如,张逗逗,李亭哲,李诚儒', '余丁', '欢迎在线观看由任重 郭晓东 李念 车晓 侯勇 陶泽如 张逗逗 李亭哲 李诚儒 等主演的国产剧《激荡D》，第一时间为你提供《激荡D》，如果你喜欢《激荡D》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', '#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', 2, 2, 88);
INSERT INTO `video` VALUES (11, '2019-06-27 02:45:43', '解决师', 25, 1, 10, 2, 'https://youku.com-ok-163.com/share/ef8446f35513a8d6aa2308357a268a7e', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15711369650.jpg', '王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿...', '刘家豪 徐遇安 陈志江 ', '欢迎在线观看由王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿 庄思敏 杨柳青 李绮雯 李忠希 李启杰 陈伟洪 何伟业 陈俊坚 黄得生 杜燕歌 彭皓锋 王俊棠 杨证桦 戴耀明 董敬文 李兴华 陈国峰 李日升 赵璧渝 范文雅 胡琳 黄嘉乐 麦玲玲 李成昌 陈志健 张彦博 詹秉熙 周丽欣 黄雪儿 利颖怡 莫家淦 谭坤伦 王致迪 郑恕峰 卫志豪 朱乐洺 丁子朗 焦浩轩 关梓阳 郭思 菊梓乔 郭千瑜 刘芷希 夏雨 等主演的港台剧《解决师粤语》，第一时间为你提供《解决师粤语》，如果你喜欢《解决师粤语》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 1, 22);
INSERT INTO `video` VALUES (12, '2019-06-28 02:45:49', '解决师', 25, 1, 10, 2, 'https://youku.com-ok-163.com/share/d198bd736a97e7cecfdf8f4f2027ef80', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15711369650.jpg', '王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿...', '刘家豪 徐遇安 陈志江 ', '欢迎在线观看由王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿 庄思敏 杨柳青 李绮雯 李忠希 李启杰 陈伟洪 何伟业 陈俊坚 黄得生 杜燕歌 彭皓锋 王俊棠 杨证桦 戴耀明 董敬文 李兴华 陈国峰 李日升 赵璧渝 范文雅 胡琳 黄嘉乐 麦玲玲 李成昌 陈志健 张彦博 詹秉熙 周丽欣 黄雪儿 利颖怡 莫家淦 谭坤伦 王致迪 郑恕峰 卫志豪 朱乐洺 丁子朗 焦浩轩 关梓阳 郭思 菊梓乔 郭千瑜 刘芷希 夏雨 等主演的港台剧《解决师粤语》，第一时间为你提供《解决师粤语》，如果你喜欢《解决师粤语》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 2, 26);
INSERT INTO `video` VALUES (13, '2019-05-01 02:46:00', '太阳的季节', 25, 5, 11, 2, 'https://iqiyi.com-t-iqiyi.com/share/4a533591763dfa743a13affab1a85793', 'https://rpg.pic-imges.com/pic/upload/vod/2019-06/201906041559610838.jpg#err', '吴昶锡,尹素怡,崔成宰,河诗恩', '金元勇', '欢迎在线观看由吴昶锡 尹素怡 崔成宰 河诗恩 等主演的日韩剧《太阳的季节》，第一时间为你提供《太阳的季节》，如果你喜欢《太阳的季节》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', '该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', 4, 1, 5);
INSERT INTO `video` VALUES (14, '2019-05-05 02:46:07', '太阳的季节', 25, 5, 11, 2, 'https://iqiyi.com-t-iqiyi.com/share/9edda0fd4d983bf975935cfd492fd50b', 'https://rpg.pic-imges.com/pic/upload/vod/2019-06/201906041559610838.jpg#err', '吴昶锡,尹素怡,崔成宰,河诗恩', '金元勇', '欢迎在线观看由吴昶锡 尹素怡 崔成宰 河诗恩 等主演的日韩剧《太阳的季节》，第一时间为你提供《太阳的季节》，如果你喜欢《太阳的季节》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', '该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', 4, 2, 11);
INSERT INTO `video` VALUES (15, '2019-07-24 02:46:15', '康纳一家第二季', 25, 4, 12, 2, 'https://youku.com-ok-pptv.com/share/edf0320adc8658b25ca26be5351b6c4a', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15711577680.jpg', '约翰·古德曼,劳里·梅特卡夫,莎拉·吉尔伯特', '盖尔·曼库索', '欢迎在线观看由约翰·古德曼 劳里·梅特卡夫 莎拉·吉尔伯特 等主演的欧美剧《康纳一家第二季》，第一时间为你提供《康纳一家第二季》，如果你喜欢《康纳一家第二季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:The Conners has been renewed! Karey Burke, president, ABC Entertainment, announced that the ABC Television Network has ordered a second season of the freshman hit comedy.', 'The Conners has been renewed! Karey Burke, president, ABC Entertainment, announced that the ABC Television Network has ordered a second season of the freshman hit comedy.', 1, 1, 15);
INSERT INTO `video` VALUES (16, '2019-07-25 02:46:22', '鲁豫有约2019', 25, 1, 13, 3, 'https://pptv.com-h-pptv.com/share/1f5bb9b79cb995f65aa9f6d649c5f49f', 'https://rpg.pic-imges.com/pic/upload/vod/2019-04/201904041554367614.jpg', '陈鲁豫', '暂无', '欢迎在线观看由陈鲁豫 等主演的内地综《鲁豫有约2019》，第一时间为你提供《鲁豫有约2019》，如果你喜欢《鲁豫有约2019》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:节目寻访拥有特殊经历的人物，一起见证历史、思索人生，直指生命与心灵的秘密，创造一种新颖的谈话记录', '节目寻访拥有特殊经历的人物，一起见证历史、思索人生，直指生命与心灵的秘密，创造一种新颖的谈话记录。', 2, 20190401, 48);
INSERT INTO `video` VALUES (17, '2019-03-27 02:46:28', '拜托了女神', 25, 3, 14, 3, 'https://youku.com-youku.net/share/4bbba5edefd947d07aa2d7a800b7d15b', 'https://rpg.pic-imges.com/pic/upload/vod/2018-11/201811261543210574.jpg', '   ', '     ', '欢迎在线观看由等主演的港台综《拜托了女神》，第一时间为你提供《拜托了女神》，如果你喜欢《拜托了女神》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 20181125, 11);
INSERT INTO `video` VALUES (18, '2019-10-08 02:46:35', '家师父一体', 25, 5, 15, 3, 'https://bilibili.com-h-bilibili.com/share/35ec253885cf090f80881b44180afb00', 'https://rpg.pic-imges.com/pic/upload/vod/2019-06/15609511990.jpg', '李昇基,李相仑,陆星材,梁世亨', '李世英', '欢迎在线观看由李昇基 李相仑 陆星材 梁世亨 等主演的日韩综《家师父一体》，第一时间为你提供《家师父一体》，如果你喜欢《家师父一体》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:《家师父一体》是韩国SBS电视台制作的一档寓教于乐类综艺节目，讲述的是充满疑问的青年们去寻找有着自己独特生活方式的怪才师父与他们开始一段同苦同乐的生活，并从中领悟、学习到很多的一个综艺节目。在节目中，李昇基、李尚允、陆星材、梁世炯 四人去寻找在一个“房间”里的“师父”并以他的生活方式来生活，度过横冲直撞的一天。', '《家师父一体》是韩国SBS电视台制作的一档寓教于乐类综艺节目，讲述的是充满疑问的青年们去寻找有着自己独特生活方式的怪才师父与他们开始一段同苦同乐的生活，并从中领悟、学习到很多的一个综艺节目。在节目中，李昇基、李尚允、陆星材、梁世炯 四人去寻找在一个“房间”里的“师父”并以他的生活方式来生活，度过横冲直撞的一天。', 4, 20190602, 52);
INSERT INTO `video` VALUES (19, '2019-05-15 02:46:38', '嘻哈星节奏第一季', 25, 4, 16, 3, 'https://youku.com-ok-pptv.com/share/17a3120e4e5fbdc3cb5b5f946809b06a', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15706239870.jpg', '卡迪·B,T.I.,钱斯勒,Matthew Carter', '   ', '欢迎在线观看由卡迪·B T.I. 钱斯勒 Matthew Carter 等主演的欧美综《嘻哈星节奏第一季》，第一时间为你提供《嘻哈星节奏第一季》，如果你喜欢《嘻哈星节奏第一季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:寻找下一个嘻哈说唱巨星，Netflix的新嘻哈选秀综艺《Rhythm + Flow》。豪华阵容Cardi B、Chance the Rapper、T.I.任评委，称是全美“第一档正式的嘻哈真人竞赛节目”。10月9日开播，此后每周三周播。 制作人有John Legend、Jesse Collins、Jeff Gaspin和三名评委等人。选拔参赛者的城市包括评委们的家乡亚特兰大、芝加哥和纽约，每个城市都有一个著名的当地rapper加入评委阵容。', '寻找下一个嘻哈说唱巨星，Netflix的新嘻哈选秀综艺《Rhythm + Flow》。豪华阵容Cardi B、Chance the Rapper、T.I.任评委，称是全美“第一档正式的嘻哈真人竞赛节目”。10月9日开播，此后每周三周播。 制作人有John Legend、Jesse Collins、Jeff Gaspin和三名评委等人。选拔参赛者的城市包括评委们的家乡亚特兰大、芝加哥和纽约，每个城市都有一个著名的当地rapper加入评委阵容。', 1, 1, 63);
INSERT INTO `video` VALUES (20, '2019-06-01 02:46:44', '那年那兔那些事儿第五季', 25, 1, 17, 4, 'https://qq.com-ok-qq.com/share/d9395b105f23926e3c4f09453e018893', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15699417720.jpg', '小连杀,叮当', '王强', '欢迎在线观看由小连杀 叮当 等主演的国产动《那年那兔那些事儿第五季》，第一时间为你提供《那年那兔那些事儿第五季》，如果你喜欢《那年那兔那些事儿第五季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:讲述了勤劳的兔子们为了建立一个吃得饱穿得暖不被人看不起的种花家，辛勤奋斗的故事。', '讲述了勤劳的兔子们为了建立一个吃得饱穿得暖不被人看不起的国家，辛勤奋斗的故事。', 2, 1, 123);
INSERT INTO `video` VALUES (21, '2019-06-15 02:46:48', '神田川JET GIRLS', 25, 6, 18, 4, 'https://qq.com-ok-qq.com/share/f7da8deec4b7a7e1e9421420b2dfa049', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15705514351.jpg', '篠原侑 小原莉子 田所梓 洲崎绫 大久保瑠美 大空直美 Lynn 菲鲁兹·蓝 安济知佳 前田佳织里 ', '金子拓 ', '欢迎在线观看由篠原侑 小原莉子 田所梓 洲崎绫 大久保瑠美 大空直美 Lynn 菲鲁兹·蓝 安济知佳 前田佳织里 朝井彩加 内田彩 等主演的日韩动《神田川JET GIRLS》，第一时间为你提供《神田川JET GIRLS》，如果你喜欢《神田川JET GIRLS》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:操作赛艇的“推进手”与使用水枪攻击对手的“射手”两人一组乘坐摩托赛艇，横越水面的运动“喷射竞速”成为主流的世界。母亲是传说中的推进手，自己也梦想成为喷射竞速选手的波黄凛，离开故乡所在的岛，来到了东京浅草。她在那里遇到了冰山美少女苍井美沙，两人成为了搭档。她们在与对手们展开竞争的同时，也逐渐加深着彼此的牵绊。', '操作赛艇的“推进手”与使用水枪攻击对手的“射手”两人一组乘坐摩托赛艇，横越水面的运动“喷射竞速”成为主流的世界。母亲是传说中的推进手，自己也梦想成为喷射竞速选手的波黄凛，离开故乡所在的岛，来到了东京浅草。她在那里遇到了冰山美少女苍井美沙，两人成为了搭档。她们在与对手们展开竞争的同时，也逐渐加深着彼此的牵绊。', 5, 1, 568);
INSERT INTO `video` VALUES (22, '2018-06-27 02:46:55', '愤怒的小鸟2', 25, 4, 19, 4, 'https://baidu.com-ok-baidu.com/share/bda989b1330ba4f420924a5be0ebcb61', 'https://rpg.pic-imges.com/pic/upload/vod/2019-08/201908111565499816.jpg', '杰森·苏戴奇斯 比尔·哈德尔 乔什·加德 丹尼·麦克布莱德 ', '图鲁普·范·奥尔曼 约翰·赖斯 ', '欢迎在线观看由杰森·苏戴奇斯 比尔·哈德尔 乔什·加德 丹尼·麦克布莱德 等主演的欧美动《愤怒的小鸟2》，第一时间为你提供《愤怒的小鸟2》，如果你喜欢《愤怒的小鸟2》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:小鸟胖红（杰森·苏戴奇斯 配音）和绿猪莱纳德（比尔·哈德尔）两位宿敌，不得不联手，带领各自小岛的居民，共同对抗第三座小岛紫鹰的入侵。', '小鸟胖红（杰森·苏戴奇斯 配音）和绿猪莱纳德（比尔·哈德尔）两位宿敌，不得不联手，带领各自小岛的居民，共同对抗第三座小岛紫鹰的入侵。', 1, 1, 25);
INSERT INTO `video` VALUES (23, '2019-07-24 02:47:02', '霹雳靖玄录下阕', 25, 3, 20, 4, 'https://qq.com-ok-qq.com/share/59e29dc7066b5a6fcf68b48e6dd67347', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15695937910.jpg', '占云巾 琴狐 疏楼龙宿 剑子仙迹 道锋天扇子 剑谪仙 侠仙若士 江南春信 左无咎 刀僧还情 西窗月 天涯沦落人 皇鳞 海宇之主 风月主人 风云儿 元守默 等', '    ', '欢迎在线观看由占云巾 琴狐 疏楼龙宿 剑子仙迹 道锋天扇子 剑谪仙 侠仙若士 江南春信 左无咎 刀僧还情 西窗月 天涯沦落人 皇鳞 海宇之主 风月主人 风云儿 元守默 等主演的港台动《霹雳靖玄录下阕》，第一时间为你提供《霹雳靖玄录下阕》，如果你喜欢《霹雳靖玄录下阕》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:乱世皇麟异域灾，焚夜悲歌天祭开。 侠影纷纷靖玄祸，恒山终见谪仙来。 细数人世至悲，最无奈挚友相残，鹿巾、琴狐半生交情，同窗岁月，嬉笑平常；共事多年，力保太平，更曾于白水滩，携手对抗未知的强敌皇鳞，而今为一场误解、为解不开的心结，却把正义之剑，挥向彼此；而在背后运筹帷幄的代行者鳇影，更在决战之地外围，布下天罗地网，只待两败俱伤之际，坐收渔翁之利。 同样无奈，疏楼龙宿与剑子仙迹，白首莫逆，因一场阴谋，因解不开的嗜血之症，杀伐以对，陷入暴乱的剑子仙迹，与为救至友，不得不化身暴乱的疏楼龙宿，既许人间同游，亦愿尘世同狂，而左右剑子仙迹生死之机，掌握在神秘剑阵是否能及时完成，幽玄虚渊意图完成幽空大阵，大举侵吞墟丘天窍。 墟丘之顶，天扇子力排众议，一心力保风云儿生机，凌虚七仙各持己见，气氛一时剑拔弩张，天窍秘境在最后关头，做出抉择，接纳垂死的风云儿。人间一日月，天窍不知年，神秘莫测的天窍秘境，风云儿筑基重修，而天扇子更在天窍深处归墟，再次精进，与时竞走两人，期许尽早出关，在南域正道势危之时，力挽狂澜。 皇祸再起，逆世双鳞重磅袭卷南域，焚夜天祭，风月主人召唤火陨灭世，昔日劫难再次降临，轩昂五玑各自伤亡，儒道顶峰身无余力，传说中的恒山·剑谪仙，如今身在何处？他能再现江湖，扛起苍生这面大旗吗？欲知一连串精彩结果，请勿错过黄文择布袋戏，霹雳靖玄录下阕：皇祸篇。', '乱世皇麟异域灾，焚夜悲歌天祭开。 侠影纷纷靖玄祸，恒山终见谪仙来。 细数人世至悲，最无奈挚友相残，鹿巾、琴狐半生交情，同窗岁月，嬉笑平常；共事多年，力保太平，更曾于白水滩，携手对抗未知的强敌皇鳞，而今为一场误解、为解不开的心结，却把正义之剑，挥向彼此；而在背后运筹帷幄的代行者鳇影，更在决战之地外围，布下天罗地网，只待两败俱伤之际，坐收渔翁之利。 同样无奈，疏楼龙宿与剑子仙迹，白首莫逆，因一场阴谋，因解不开的嗜血之症，杀伐以对，陷入暴乱的剑子仙迹，与为救至友，不得不化身暴乱的疏楼龙宿，既许人间同游，亦愿尘世同狂，而左右剑子仙迹生死之机，掌握在神秘剑阵是否能及时完成，幽玄虚渊意图完成幽空大阵，大举侵吞墟丘天窍。 墟丘之顶，天扇子力排众议，一心力保风云儿生机，凌虚七仙各持己见，气氛一时剑拔弩张，天窍秘境在最后关头，做出抉择，接纳垂死的风云儿。人间一日月，天窍不知年，神秘莫测的天窍秘境，风云儿筑基重修，而天扇子更在天窍深处归墟，再次精进，与时竞走两人，期许尽早出关，在南域正道势危之时，力挽狂澜。 皇祸再起，逆世双鳞重磅袭卷南域，焚夜天祭，风月主人召唤火陨灭世，昔日劫难再次降临，轩昂五玑各自伤亡，儒道顶峰身无余力，传说中的恒山·剑谪仙，如今身在何处？他能再现江湖，扛起苍生这面大旗吗？欲知一连串精彩结果，请勿错过黄文择布袋戏，霹雳靖玄录下阕：皇祸篇。', 2, 1, 47);
INSERT INTO `video` VALUES (24, '2019-08-02 02:47:07', '声怒', 25, 4, 21, 4, 'https://baidu.com-ok-baidu.com/share/dff4ba680e945e400d3d800a9fa29f3e', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15696070483.jpg', 'Takashi Okazaki', '水崎淳平 森本晃司 迈克尔·艾里亚斯 松本胜 Henry Thurlow 冈崎能士 ', '欢迎在线观看由Takashi Okazaki 等主演的海外动《声怒》，第一时间为你提供《声怒》，如果你喜欢《声怒》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:咆哮的吉他声。原始复仇推动的野蛮战争。斯德吉尔·辛普森倾力推出这部震撼人心的作品。', '咆哮的吉他声。原始复仇推动的野蛮战争。斯德吉尔·辛普森倾力推出这部震撼人心的作品。', 1, 1, 258);
INSERT INTO `video` VALUES (600, '2019-10-08 16:30:31', '奇幻实验室', 25, 1, 9, 2, 'https://iqiyi.com-ok-iqiyi.com/share/da56910e9cfdd3202aca15bcd589f301', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/1571375596.jpg', '比拉力,陈一河,吕娜,泡芙,林可,阿炯,叶鑫辉', '张培,卢浩', '欢迎在线观看由比拉力 陈一河 吕娜 泡芙 林可 阿炯 叶鑫辉 等主演的国产剧《奇幻实验室》，第一时间为你提供《奇幻实验室》，如果你喜欢《奇幻实验室》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:万千世界，无数的人们像是数以万计的细胞一样，运行在这个诺大的星球体内。而每个人的烦恼也像是毒瘤一样慢慢开始出现，慢慢萌生。为了防止这些烦恼毒瘤的侵害，奇幻实验室推出了很多优秀的科学技术，以及小发明来帮助人们解决当下遇到的各种困惑，从而让每个人都能看到自己缺点的根本，而让这个世界变得更好。 作品为国内无人触及的软科幻类影视作品，每一集都有一些供人反思的社会问题，每一集都有一些奇幻类型的创意亮点。利用软科幻来映射和带出一些社会问题，反应人性，供大家思考与反思。也算是我们影视工作者，为和谐美好的社会献出的一丝绵薄之力。', '万千世界，无数的人们像是数以万计的细胞一样，运行在这个诺大的星球体内。而每个人的烦恼也像是毒瘤一样慢慢开始出现，慢慢萌生。为了防止这些烦恼毒瘤的侵害，奇幻实验室推出了很多优秀的科学技术，以及小发明来帮助人们解决当下遇到的各种困惑，从而让每个人都能看到自己缺点的根本，而让这个世界变得更好。 作品为国内无人触及的软科幻类影视作品，每一集都有一些供人反思的社会问题，每一集都有一些奇幻类型的创意亮点。利用软科幻来映射和带出一些社会问题，反应人性，供大家思考与反思。也算是我们影视工作者，为和谐美好的社会献出的一丝绵薄之力。', 2, 1, 256);
INSERT INTO `video` VALUES (601, '2019-09-11 16:33:16', '蜀汉酒楼', 25, 1, 9, 2, 'https://iqiyi.com-ok-iqiyi.com/share/327e125136fd2d7d012efe5acf1a1301', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/1571374509.jpg', '许君聪 /代文雯 /傅迦 /王嘉宁', '王鑫', '欢迎在线观看由许君聪 代文雯 傅迦 王嘉宁 等主演的国产剧《蜀汉酒楼》，第一时间为你提供《蜀汉酒楼》，如果你喜欢《蜀汉酒楼》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:诸葛有才泛舟湖上吟诗一首，忽然发现岸边有一白衣女子长发飘飘，欲在一棵桃花树下自寻短见，紧急之下射箭相救。待诸葛有才靠岸之后，白衣女子已离去，只留下蜀汉酒楼钥匙牌。第二天，诸葛先生出山的消息传遍大街小巷，老幼妇孺争相挤到河岸边看热闹，其中诸葛的粉丝应援十分疯狂。率先获得情报的曹魏酒楼曹掌柜和东方酒楼的孙掌柜分别在路途上摆阵恭迎诸葛。诸葛有才不为所动直奔蜀汉酒楼寻白衣女子，白衣女子实为刘大耳，刘大耳继续哄骗将诸葛有才留在了蜀汉酒楼。', '诸葛有才泛舟湖上吟诗一首，忽然发现岸边有一白衣女子长发飘飘，欲在一棵桃花树下自寻短见，紧急之下射箭相救。待诸葛有才靠岸之后，白衣女子已离去，只留下蜀汉酒楼钥匙牌。第二天，诸葛先生出山的消息传遍大街小巷，老幼妇孺争相挤到河岸边看热闹，其中诸葛的粉丝应援十分疯狂。率先获得情报的曹魏酒楼曹掌柜和东方酒楼的孙掌柜分别在路途上摆阵恭迎诸葛。诸葛有才不为所动直奔蜀汉酒楼寻白衣女子，白衣女子实为刘大耳，刘大耳继续哄骗将诸葛有才留在了蜀汉酒楼。', 2, 1, 152);
INSERT INTO `video` VALUES (602, '2019-09-19 16:36:31', '激情的岁月', 25, 1, 9, 2, 'https://youku.com-ok-163.com/share/277281aada22045c03945dcb2ca6f2ec', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15692569960.jpg#err', '李光洁,高露', '白涛', '欢迎在线观看由李光洁 高露 等主演的国产剧《激情的岁月》，第一时间为你提供《激情的岁月》，如果你喜欢《激情的岁月》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:1955年，面对日益严峻的国际形势，我国在美苏两国的留学生和科学家们怀抱着报国理想纷纷回国，其中包括美国康奈尔大学教授，著名物理学家钟培林。王怀民和何吟薇夫妇、黄凯华等理论物理学博士作为留学生中的学术领军人物，也从苏联回国，投入国家科技建设中来。特务们在北京前门火车站设伏，计划炸死回国的科学家们，被来京疗养的军人陶志纲及时发现，保护了大批留学生们，意外却导致何吟薇难产死亡，留下孩子托付给帮她接生的护士杨佳蓉 王怀民不舍妻子离世，他决定加倍努力，带着妻子的理想参与祖国建设。孩子振理也就由杨佳蓉照顾。 1958年，二机部九所成立。钟培林、王怀民、黄凯华还有哈工大的年轻教授、炸药学家、空气动力学家彭雄飞等科学家们来到九所陶志纲也被调入九所，给科学家们做保障工作。科学家们知道自己将参与硏发新中国第一枚原子弹，情绪高涨。钟培林的女儿钟心也回国加入了九所，彭雄飞对钟心心生爱慕，但钟心却对不冷不热的王怀民青眼有加。只有陶志纲这个大老粗对钟心这个“资产阶级小姐”处处看不顺眼。 苏联派来专家团队为九所提供帮助，但关于原子弹的相关资料却吝于透漏，甚至连答应好的模型也无法兑现。眼看着硏发的进展缓慢，王怀民为首的科学家们悄悄成立了自主研发小组。苏联专家将原子弹试爆地点选定在敦煌，在那里只能试爆极小当量的原子弹，根本无法满足中国的需求。面对苏联专家对中国核武器事业的有意压制，中苏科学家之间的关系恶化。 1959年6月。苏联单方面撕毁与中国的原子弹合作协议，专家团撤走并烧毁了所有无法带走的资料。情况的突变让九所的一些同志们开始动摇，但不久就传来国家决定自主研发原子弹的消息，这让科学家们深受鼓舞。自力更生之路是艰难的，第一个难题就是确定理论设计方案。王怀民主张的“内爆式”方案新颖却充满未知，黄凯华主张的“枪法式”方案有其他国家的成功先例在前获得了包括彭雄飞在内的更多科学家的支持。钟培林便让两个小组同时展开研究，公平竞争。结果彭雄飞在关键时刻“反水”，转而支持王怀民的方案，使王怀民的方案被最终敲定。虽然自已的方案没有被采用，但黄凯华仍然坦然接受，而与书店美女店员江水宁的邂逅，也让他陷入对美好爱情的向往。爆轰实验成功后，九所同志们开始整体向青海221基地搬迁。 正是三年自然灾害最严酷的时刻，科学家们克服重重困难坚持研究，期间有人离去，也有同志牺牲。杨佳蓉早已加入这一神圣的队伍，为了研究基地水质问题，给科学家们提供可以饮用的水源而病倒。王怀民悉心照料，两人互生情愫。 研究工作的困难在高层引发了争论，有人建议停止研发核武器把资源留下来建设国计民生，中央派方明将军带调查团抵达221厂进行可行性调查。基地的所有科学家们全部被调动起来，大家从各个方面努力，向将军证明可以把原子弹搞出来。可是这些自发的证明大都适得其反，再加上调查团中一向看王怀民们不顺眼的丁向军从中作梗，情况更是变得乱七八糟。但同志们的努力都被将军看在眼里，终于，原子弹的研发可以继续下去。杨佳蓉因有一个在台湾的叔叔而被调查，为不牵连爱人有意疏远了王怀民，这令王怀民感到费解。而钟心与陶志纲这对欢喜冤家，却发展出了不一样的情意。', '1955年，面对日益严峻的国际形势，我国在美苏两国的留学生和科学家们怀抱着报国理想纷纷回国，其中包括美国康奈尔大学教授，著名物理学家钟培林。王怀民和何吟薇夫妇、黄凯华等理论物理学博士作为留学生中的学术领军人物，也从苏联回国，投入国家科技建设中来。特务们在北京前门火车站设伏，计划炸死回国的科学家们，被来京疗养的军人陶志纲及时发现，保护了大批留学生们，意外却导致何吟薇难产死亡，留下孩子托付给帮她接生的护士杨佳蓉 王怀民不舍妻子离世，他决定加倍努力，带着妻子的理想参与祖国建设。孩子振理也就由杨佳蓉照顾。 1958年，二机部九所成立。钟培林、王怀民、黄凯华还有哈工大的年轻教授、炸药学家、空气动力学家彭雄飞等科学家们来到九所陶志纲也被调入九所，给科学家们做保障工作。科学家们知道自己将参与硏发新中国第一枚原子弹，情绪高涨。钟培林的女儿钟心也回国加入了九所，彭雄飞对钟心心生爱慕，但钟心却对不冷不热的王怀民青眼有加。只有陶志纲这个大老粗对钟心这个“资产阶级小姐”处处看不顺眼。 苏联派来专家团队为九所提供帮助，但关于原子弹的相关资料却吝于透漏，甚至连答应好的模型也无法兑现。眼看着硏发的进展缓慢，王怀民为首的科学家们悄悄成立了自主研发小组。苏联专家将原子弹试爆地点选定在敦煌，在那里只能试爆极小当量的原子弹，根本无法满足中国的需求。面对苏联专家对中国核武器事业的有意压制，中苏科学家之间的关系恶化。 1959年6月。苏联单方面撕毁与中国的原子弹合作协议，专家团撤走并烧毁了所有无法带走的资料。情况的突变让九所的一些同志们开始动摇，但不久就传来国家决定自主研发原子弹的消息，这让科学家们深受鼓舞。自力更生之路是艰难的，第一个难题就是确定理论设计方案。王怀民主张的“内爆式”方案新颖却充满未知，黄凯华主张的“枪法式”方案有其他国家的成功先例在前获得了包括彭雄飞在内的更多科学家的支持。钟培林便让两个小组同时展开研究，公平竞争。结果彭雄飞在关键时刻“反水”，转而支持王怀民的方案，使王怀民的方案被最终敲定。虽然自已的方案没有被采用，但黄凯华仍然坦然接受，而与书店美女店员江水宁的邂逅，也让他陷入对美好爱情的向往。爆轰实验成功后，九所同志们开始整体向青海221基地搬迁。 正是三年自然灾害最严酷的时刻，科学家们克服重重困难坚持研究，期间有人离去，也有同志牺牲。杨佳蓉早已加入这一神圣的队伍，为了研究基地水质问题，给科学家们提供可以饮用的水源而病倒。王怀民悉心照料，两人互生情愫。 研究工作的困难在高层引发了争论，有人建议停止研发核武器把资源留下来建设国计民生，中央派方明将军带调查团抵达221厂进行可行性调查。基地的所有科学家们全部被调动起来，大家从各个方面努力，向将军证明可以把原子弹搞出来。可是这些自发的证明大都适得其反，再加上调查团中一向看王怀民们不顺眼的丁向军从中作梗，情况更是变得乱七八糟。但同志们的努力都被将军看在眼里，终于，原子弹的研发可以继续下去。杨佳蓉因有一个在台湾的叔叔而被调查，为不牵连爱人有意疏远了王怀民，这令王怀民感到费解。而钟心与陶志纲这对欢喜冤家，却发展出了不一样的情意。', 2, 1, 125);
INSERT INTO `video` VALUES (603, '2019-07-11 16:43:05', '光荣时代', 25, 1, 9, 2, 'https://youku.com-ok-163.com/share/1b36ea1c9b7a1c3ad668b8bb5df7963f', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15709698340.jpg#err#err#err#err', '张译,黄志忠,潘之琳,薛佳凝,张隽溢,王骁,黄品沅,李添诺,高亮,谭晓', '刘海波', '欢迎在线观看由张译 黄志忠 潘之琳 薛佳凝 张隽溢 王骁 黄品沅 李添诺 高亮 谭晓凡 易照博 张秋歌 曹凯 门东毅 董向荣 王一剑 等主演的国产剧《光荣时代》，第一时间为你提供《光荣时代》，如果你喜欢《光荣时代》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:辽沈战役前夕，隐藏在北平警察局里的地下党员郑朝阳因叛徒出卖不得已紧急撤退。同时带走了国民党精心准备的地下潜伏名单。 郑朝阳来到西柏坡参加了接管城市的学习班，而他历尽艰险带回的名册则给北平地区潜伏的国民党特务毁灭性的打击。 国民党不得已启动了全部由“冷棋”特工组成的特别行动小组，代号桃园。而 “桃园”的负责人，是郑朝阳的哥哥，北平青年促进会总干事，著名医生郑朝山。 北平和平解放，郑朝阳重返北京城。他面对的不仅仅是残存的潜伏特务和数万国民党散兵游勇，还有神秘的“桃园”行动组，和代号凤凰的哥哥郑朝山。 兄弟两人各自代表自己的阶级开始了针锋相对的对抗。两人明里是好兄弟，暗中使出浑身解数，对抗不断升级。 最终，桃园行动组彻底覆灭。 北京城发生了翻天覆地的变化。每个人都像是浴火重生一样，眼中充满的希望。', '辽沈战役前夕，隐藏在北平警察局里的地下党员郑朝阳因叛徒出卖不得已紧急撤退。同时带走了国民党精心准备的地下潜伏名单。 郑朝阳来到西柏坡参加了接管城市的学习班，而他历尽艰险带回的名册则给北平地区潜伏的国民党特务毁灭性的打击。 国民党不得已启动了全部由“冷棋”特工组成的特别行动小组，代号桃园。而 “桃园”的负责人，是郑朝阳的哥哥，北平青年促进会总干事，著名医生郑朝山。 北平和平解放，郑朝阳重返北京城。他面对的不仅仅是残存的潜伏特务和数万国民党散兵游勇，还有神秘的“桃园”行动组，和代号凤凰的哥哥郑朝山。 兄弟两人各自代表自己的阶级开始了针锋相对的对抗。两人明里是好兄弟，暗中使出浑身解数，对抗不断升级。 最终，桃园行动组彻底覆灭。 北京城发生了翻天覆地的变化。每个人都像是浴火重生一样，眼中充满的希望。', 2, 1, 100);
INSERT INTO `video` VALUES (604, '2019-09-20 16:46:42', '一马三司令', 25, 1, 9, 2, 'https://youku.com-ok-163.com/share/df4fe8a8bcd5c95cdb640aa9793bb32b', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/15712327000.jpg#err#err#err', '张明建,苏丽,李君峰,丁柳元,吴其江,王嘉,李幼斌,刘之冰,陶玉玲', '张玉中', '欢迎在线观看由张明建 苏丽 李君峰 丁柳元 吴其江 王嘉 李幼斌 刘之冰 陶玉玲 等主演的国产剧《一马三司令》，第一时间为你提供《一马三司令》，如果你喜欢《一马三司令》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧以文学艺术手法再现了清河地区抗日武装起义的峥嵘战史，描写了性格坚毅的长山中学校长马耀南在日本入侵中国的民族危亡时刻，毅然投笔从戎，与侠肝义胆的二弟马晓云和内敛忠厚的三弟马天民自发组织当地师生和有志百姓成立抗日武装，在中国共产党的领导和帮助下，在一次次与日本侵略者英勇无畏的战斗中，队伍一步步发展壮大，从一支“大褂子军”逐步成长为我党清河地区纪律严明、作战英勇的抗日中坚力量——八路军山东纵队第三支队。马氏三兄弟也在战争的磨砺中成长为优秀的将领，被当地老百姓亲切地称为“一马三司令”。在与日寇艰苦卓绝的长期斗争中，马氏三兄弟在抗战胜利前全部壮烈牺牲，以身殉国，他们的名字和英雄事迹将永远铭刻在人民的心中。', '该剧以文学艺术手法再现了清河地区抗日武装起义的峥嵘战史，描写了性格坚毅的长山中学校长马耀南在日本入侵中国的民族危亡时刻，毅然投笔从戎，与侠肝义胆的二弟马晓云和内敛忠厚的三弟马天民自发组织当地师生和有志百姓成立抗日武装，在中国共产党的领导和帮助下，在一次次与日本侵略者英勇无畏的战斗中，队伍一步步发展壮大，从一支“大褂子军”逐步成长为我党清河地区纪律严明、作战英勇的抗日中坚力量——八路军山东纵队第三支队。马氏三兄弟也在战争的磨砺中成长为优秀的将领，被当地老百姓亲切地称为“一马三司令”。在与日寇艰苦卓绝的长期斗争中，马氏三兄弟在抗战胜利前全部壮烈牺牲，以身殉国，他们的名字和英雄事迹将永远铭刻在人民的心中。', 2, 1, 53);
INSERT INTO `video` VALUES (605, '2019-08-16 17:02:02', '20之后', 25, 3, 9, 2, 'https://baidu.com-l-baidu.com/share/3da972c3ec85b6f3cc5306acf034fd23', 'https://rpg.pic-imges.com/pic/upload/vod/2018-12/15443674330.jpg#err#err', '谢怡芬,蓝钧天,郑靓歆,江沂宸', '王小棣', '欢迎在线观看由谢怡芬 蓝钧天 郑靓歆 江沂宸 等主演的国产剧《20之后》，第一时间为你提供《20之后》，如果你喜欢《20之后》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:四位同为二十岁出头的好朋友:想活出自我勇敢的邱冠征，男孩子气息的帅妹蓝子静、甜姐儿张品妤，还有木讷的徐立雄，他们各自离开自己家里，住在一起生活着，不管是在工作上、或感情上的人生探索，他们彼此碰撞，有时相互鼓励、有时会有争吵...年轻可能会憋憋扭扭、也可能有无限的发展性，在成长的道路上，每个人的形状都不一样，这四个好朋友遇上了李彦仪这样年纪相当的女孩，也认识了像魏涵任这样成熟的女人，在生命中的未可知变化，就这样在二十岁之后展开了...', '四位同为二十岁出头的好朋友:想活出自我勇敢的邱冠征，男孩子气息的帅妹蓝子静、甜姐儿张品妤，还有木讷的徐立雄，他们各自离开自己家里，住在一起生活着，不管是在工作上、或感情上的人生探索，他们彼此碰撞，有时相互鼓励、有时会有争吵...年轻可能会憋憋扭扭、也可能有无限的发展性，在成长的道路上，每个人的形状都不一样，这四个好朋友遇上了李彦仪这样年纪相当的女孩，也认识了像魏涵任这样成熟的女人，在生命中的未可知变化，就这样在二十岁之后展开了...', 2, 1, 123);
INSERT INTO `video` VALUES (606, '2019-08-22 17:19:34', '\r\n在远方', 25, 1, 9, 2, 'https://youku.com-ok-163.com/share/4e6cd95227cb0c280e99a195be5f6615', 'https://rpg.pic-imges.com/pic/upload/vod/2019-09/15691554730.jpg#err#err#err', '刘烨,马伊琍,梅婷,保剑锋,曾黎,程煜,郑奇', '陈昆晖', '欢迎在线观看由刘烨 马伊琍 梅婷 保剑锋 曾黎 程煜 郑奇 等主演的国产剧《在远方》，第一时间为你提供《在远方》，如果你喜欢《在远方》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:1999年，高中毕业的姚远接替父母的班做起长途运输，走南闯北发现了快运契机。当时被邮政执法堵截损失惨重，便利用网络结识邮政快递路总的千金路晓欧，以套取信息，两人在接触中渐生情愫。 但姚远看到二人身份差距悬殊，选择放手初恋，独自远走创业之路，在香港创建了远方快递。此时，路晓欧跟随母亲来到香港学习，两人再次相遇。路晓欧帮远方快递度过难关。正当两人经过诸多风雨合作默契，逐渐将远方快递引向辉煌时，一次经营危机造成了远方快递欠债累累。姚远不忍路晓欧受到牵连，故意将她气走。路晓欧离开后，姚远想方设法独自还清债务。2014年恰逢国家正式全面放开快递政策，姚远主营的传统私人快递业务遭到新兴电商的大力冲击，但姚远审时度势，迅速推行“远方”无人智能快递，化险为夷，取得成功。面对海归商人刘云天的竞争，姚远不按规则出牌，频出奇招，再次打赢漂亮的翻身战。 在新的时代机遇下，姚远抓住商机，促成快递与电商携手合作上下游业务，打通产业链。面对资本和同行两个阵营的压力，面对昔日女神的相爱相杀，四十不惑的姚远选择勇敢面对。他用自己在商场上摸爬滚打出来的经验，结合政府的利好，打出了一组资本与平台、平台与市场创新融合的组合拳，在众人的瞠目结舌中，再次撑起创业大旗，也再次点燃了路晓欧的心。', '1999年，高中毕业的姚远接替父母的班做起长途运输，走南闯北发现了快运契机。当时被邮政执法堵截损失惨重，便利用网络结识邮政快递路总的千金路晓欧，以套取信息，两人在接触中渐生情愫。 但姚远看到二人身份差距悬殊，选择放手初恋，独自远走创业之路，在香港创建了远方快递。此时，路晓欧跟随母亲来到香港学习，两人再次相遇。路晓欧帮远方快递度过难关。正当两人经过诸多风雨合作默契，逐渐将远方快递引向辉煌时，一次经营危机造成了远方快递欠债累累。姚远不忍路晓欧受到牵连，故意将她气走。路晓欧离开后，姚远想方设法独自还清债务。2014年恰逢国家正式全面放开快递政策，姚远主营的传统私人快递业务遭到新兴电商的大力冲击，但姚远审时度势，迅速推行“远方”无人智能快递，化险为夷，取得成功。面对海归商人刘云天的竞争，姚远不按规则出牌，频出奇招，再次打赢漂亮的翻身战。 在新的时代机遇下，姚远抓住商机，促成快递与电商携手合作上下游业务，打通产业链。面对资本和同行两个阵营的压力，面对昔日女神的相爱相杀，四十不惑的姚远选择勇敢面对。他用自己在商场上摸爬滚打出来的经验，结合政府的利好，打出了一组资本与平台、平台与市场创新融合的组合拳，在众人的瞠目结舌中，再次撑起创业大旗，也再次点燃了路晓欧的心。', 2, 1, 156);
INSERT INTO `video` VALUES (607, '2019-10-16 17:22:58', '没有秘密的你', 25, 1, 9, 2, 'https://youku.com-ok-163.com/share/6492d38d732122c58b44e3fdc3e9e9f3', 'https://rpg.pic-imges.com/pic/upload/vod/2019-10/1571315259.jpg', '戚薇,金瀚,王阳明,黄梦莹,黄征,黄一琳,张瑞,吴亚衡', '于中中', '欢迎在线观看由戚薇 金瀚 王阳明 黄梦莹 黄征 黄一琳 张瑞 吴亚衡 等主演的国产剧《没有秘密的你》，第一时间为你提供《没有秘密的你》，如果你喜欢《没有秘密的你》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧讲述了因一场车祸而产生交集的林星然与江夏，十年后再次重逢，拥有“读心术”的高能少年和“废柴女律师”上演一场爱和守护的动人故事。', '该剧讲述了因一场车祸而产生交集的林星然与江夏，十年后再次重逢，拥有“读心术”的高能少年和“废柴女律师”上演一场爱和守护的动人故事。', 2, 1, 125);

-- ----------------------------
-- Table structure for video_language
-- ----------------------------
DROP TABLE IF EXISTS `video_language`;
CREATE TABLE `video_language`  (
  `language_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '语言id',
  `language_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言名称',
  PRIMARY KEY (`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_language
-- ----------------------------
INSERT INTO `video_language` VALUES (1, '英语');
INSERT INTO `video_language` VALUES (2, '国语');
INSERT INTO `video_language` VALUES (3, '粤语');
INSERT INTO `video_language` VALUES (4, '韩语');
INSERT INTO `video_language` VALUES (5, '日语');

-- ----------------------------
-- Table structure for video_sort
-- ----------------------------
DROP TABLE IF EXISTS `video_sort`;
CREATE TABLE `video_sort`  (
  `video_sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频分类id',
  `video_sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频分类名称',
  `video_sort_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用作点击的分类路径',
  PRIMARY KEY (`video_sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_sort
-- ----------------------------
INSERT INTO `video_sort` VALUES (1, '电影', 'Movie');
INSERT INTO `video_sort` VALUES (2, '连续剧', 'Sitcom');
INSERT INTO `video_sort` VALUES (3, '综艺', 'Variety');
INSERT INTO `video_sort` VALUES (4, '动漫', 'Comic');

SET FOREIGN_KEY_CHECKS = 1;
