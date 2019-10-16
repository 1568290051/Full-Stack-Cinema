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

 Date: 16/10/2019 09:30:48
*/

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
INSERT INTO `type_sort` VALUES (1, '动作片', 1, 'Action movie');
INSERT INTO `type_sort` VALUES (2, '喜剧片', 1, 'Comedy');
INSERT INTO `type_sort` VALUES (3, '爱情片', 1, 'love');
INSERT INTO `type_sort` VALUES (4, '科幻片', 1, 'scienceFiction');
INSERT INTO `type_sort` VALUES (5, '恐怖片', 1, 'Horror');
INSERT INTO `type_sort` VALUES (6, '剧情片', 1, 'plot');
INSERT INTO `type_sort` VALUES (7, ' 战争片', 1, 'Warfare');
INSERT INTO `type_sort` VALUES (8, '纪录片', 1, 'Record');
INSERT INTO `type_sort` VALUES (9, '国产剧', 2, 'domesticSeries');
INSERT INTO `type_sort` VALUES (10, '港台剧', 2, 'htSeries');
INSERT INTO `type_sort` VALUES (11, '日韩剧', 2, 'jkSeries');
INSERT INTO `type_sort` VALUES (12, '欧美剧', 2, 'eaSeries');
INSERT INTO `type_sort` VALUES (13, '内地综艺', 3, 'inlandVariety');
INSERT INTO `type_sort` VALUES (14, '港台综艺', 3, 'hkVariety');
INSERT INTO `type_sort` VALUES (15, '日韩综艺', 3, 'jkVariety');
INSERT INTO `type_sort` VALUES (16, '欧美综艺', 3, 'eaVariety');
INSERT INTO `type_sort` VALUES (17, '国产动画', 4, 'DomesticAnimation');
INSERT INTO `type_sort` VALUES (18, '日韩动画', 4, 'jkAnimation');
INSERT INTO `type_sort` VALUES (19, '欧美动画', 4, 'eaAnimation');
INSERT INTO `type_sort` VALUES (20, '港台动画', 4, 'hkAnimation');
INSERT INTO `type_sort` VALUES (21, '海外动画', 4, 'overseasAnimation');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '2019-08-14 02:44:39', '马丁·马特:生生死死我的天', 25, 13, 2, 1, 'https://baidu.com-ok-baidu.com/share/fdac69c3eee7bd0427535354eae235a4', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\15711447630.jpg', '马丁·马特', 'Jean-François Blais', '迎在线观看由马丁·马特 等主演的喜剧片《马丁·马特：生生死死我的天》，第一时间为你提供《马丁·马特：生生死死我的天》，如果你喜欢《马丁·马特：生生死死我的天》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:社群媒體災難、丟臉的體育課、脾氣乖戾的青少年：什麼都難不倒這位諧星……除了一把釘槍', '社群媒體災難、丟臉的體育課、脾氣乖戾的青少年：什麼都難不倒這位諧星……除了一把釘槍', 1, 1);
INSERT INTO `video` VALUES (2, '2019-09-18 02:44:45', '雪盲2009', 15, 16, 1, 1, 'https://56.com-ok-bilibili.com/share/f2a5e3992379aff98f056365b14be2e4', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\雪盲.jpg', '凯特·贝金赛尔 / 盖布瑞·马赫特 / 汤姆·斯凯里特 / 哥伦布·绍特', '多米尼克·塞纳', '欢迎在线观看由凯特·贝金赛尔 盖布瑞·马赫特 汤姆·斯凯里特 哥伦布·绍特 艾历克斯·奥洛林 等主演的动作片《雪盲2009》，第一时间为你提供《雪盲2009》，如果你喜欢《雪盲2009》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:肃杀之夜，一架军用飞机坠毁南极大陆，机组人员全部身亡。 　　美国位于南极洲的阿蒙森·海斯科特科学研究基地，此时迎来一年一度的圣诞假期。已在此工作两年的美丽女警凯莉·斯泰德克（凯特·贝金赛尔 Kate Beckinsale 饰）正准备回国度假，但就在这一关头，研究站接到发现尸体的报告，凯莉只得和一队人马前往调查。他们在一座峭壁前发现一具死状凄惨的尸体，经过勘察，凯莉得知死者是一名来自英国科考队的地质学家，而他死亡的背后似乎另有隐情。是时，强烈的风暴即将来袭，凯莉不得不中止行程，马不停蹄调查这起案件，希望在风暴来袭前查到凶手。在这一过程中，隐藏已久的秘密也渐渐浮出水面……', '肃杀之夜，一架军用飞机坠毁南极大陆，机组人员全部身亡。 　　美国位于南极洲的阿蒙森·海斯科特科学研究基地，此时迎来一年一度的圣诞假期。已在此工作两年的美丽女警凯莉·斯泰德克（凯特·贝金赛尔 Kate Beckinsale 饰）正准备回国度假，但就在这一关头，研究站接到发现尸体的报告，凯莉只得和一队人马前往调查。他们在一座峭壁前发现一具死状凄惨的尸体，经过勘察，凯莉得知死者是一名来自英国科考队的地质学家，而他死亡的背后似乎另有隐情。是时，强烈的风暴即将来袭，凯莉不得不中止行程，马不停蹄调查这起案件，希望在风暴来袭前查到凶手。在这一过程中，隐藏已久的秘密也渐渐浮出水面……', 1, 1);
INSERT INTO `video` VALUES (3, '2019-06-13 02:44:52', '早熟2005', 11, 3, 3, 1, 'https://56.com-ok-bilibili.com/share/09c84615d91b2650a3f77605c634b2d9', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\早熟2005.jpg', '房祖名 薛凯琪 曾志伟 毛舜筠 黄秋生 ', '尔冬升 ', '欢迎在线观看由房祖名 薛凯琪 曾志伟 毛舜筠 黄秋生 等主演的爱情片《早熟2005》，第一时间为你提供《早熟2005》，如果你喜欢《早熟2005》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:　出生于草根家庭的家富（房祖名饰）父亲（曾志伟饰）是小巴司机，母亲（毛舜筠饰）是一个酒楼接待员。虽然出身寒微，却享受了家庭温暖。他跟同学去了一所女子名校，无意间看到了若男（薛凯琪饰），更假扮名校学生到该女校联谊。若男的父亲（黄秋生饰）是一个律师，母亲（余安安饰）是公益积极分子。一直对若男管教严厉，也很少留在女儿身边。当若男遇到了好动的家富后，便很快被他吸引了。在若男18生日当晚，他们两人到郊外露营，偷吃了禁果。', '出生于草根家庭的家富（房祖名饰）父亲（曾志伟饰）是小巴司机，母亲（毛舜筠饰）是一个酒楼接待员。虽然出身寒微，却享受了家庭温暖。他跟同学去了一所女子名校，无意间看到了若男（薛凯琪饰），更假扮名校学生到该女校联谊。若男的父亲（黄秋生饰）是一个律师，母亲（余安安饰）是公益积极分子。一直对若男管教严厉，也很少留在女儿身边。当若男遇到了好动的家富后，便很快被他吸引了。在若男18生日当晚，他们两人到郊外露营，偷吃了禁果。', 2, 1);
INSERT INTO `video` VALUES (4, '2019-04-26 02:44:57', '太空一号', 18, 4, 4, 1, 'https://iqiyi.com-qqcdn.com/share/30d4e6422cd65c7913bc9ce62e078b79', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\太空一号.jpg', '盖·皮尔斯 玛姬·格蕾斯 彼得·斯特曼 约瑟夫·吉尔根 文森特·里根 连尼·詹姆斯 博扬·佩雷斯 ', '詹姆斯·马瑟 斯蒂芬·圣·莱杰 ', '欢迎在线观看由盖·皮尔斯 玛姬·格蕾斯 彼得·斯特曼 约瑟夫·吉尔根 文森特·里根 连尼·詹姆斯 博扬·佩雷斯 等主演的科幻片《太空一号》，第一时间为你提供《太空一号》，如果你喜欢《太空一号》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:未来世界，美国开发出名为“太空一号”的空间站，实则是一座戒备森严的最高警戒监狱，这里现关押着约500名罪大恶极的囚徒，他们无一例外被冷冻起来，处于昏睡之中。某日，现任美国总统的女儿艾米丽·沃纳克（玛姬·格蕾斯 Maggie Grace 饰）为考察人权问题登上太空一号，谁知在对犯人采访时意外发生，一阵混乱过后，所有的罪犯都从沉睡中苏醒，太空一号瞬间被占领，艾米丽以及工作人员沦为人质。与此同时，特工斯诺（盖·皮尔斯 Guy Pearce 饰）遭到陷害，即将遣送太空一号。可是为了营救总统的女儿，他短暂获得了自由，由此进入太空一号寻找目标人质以及掌握着他被陷害重要证据的搭档梅斯。 以少敌多的对决在外太空就此展开……', '未来世界，美国开发出名为“太空一号”的空间站，实则是一座戒备森严的最高警戒监狱，这里现关押着约500名罪大恶极的囚徒，他们无一例外被冷冻起来，处于昏睡之中。某日，现任美国总统的女儿艾米丽·沃纳克（玛姬·格蕾斯 Maggie Grace 饰）为考察人权问题登上太空一号，谁知在对犯人采访时意外发生，一阵混乱过后，所有的罪犯都从沉睡中苏醒，太空一号瞬间被占领，艾米丽以及工作人员沦为人质。与此同时，特工斯诺（盖·皮尔斯 Guy Pearce 饰）遭到陷害，即将遣送太空一号。可是为了营救总统的女儿，他短暂获得了自由，由此进入太空一号寻找目标人质以及掌握着他被陷害重要证据的搭档梅斯。 以少敌多的对决在外太空就此展开……', 1, 1);
INSERT INTO `video` VALUES (5, '2019-09-13 02:45:03', '玛丽号', 25, 3, 5, 1, 'https://baidu.com-ok-baidu.com/share/dd4e40cf0437db90471f25c3ee4ae9ac', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\玛丽号.jpg', '加里·奥德曼 艾米莉·莫迪默 斯戴芬妮·斯考特 欧文·泰格 曼努埃尔·加西亚-鲁尔福 克洛伊·佩兰 ', '迈克尔·戈伊 ', '欢迎在线观看由加里·奥德曼 艾米莉·莫迪默 斯戴芬妮·斯考特 欧文·泰格 曼努埃尔·加西亚-鲁尔福 克洛伊·佩兰 克莱尔·拜恩 等主演的恐怖片《玛丽号》，第一时间为你提供《玛丽号》，如果你喜欢《玛丽号》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:欧文·蒂格(《小丑回魂》《至亲血统》)加盟加里·奥德曼主演的超自然惊悚类型新片《玛丽》，Michael Goi(《美国恐怖故事》《塞勒姆》)执导，《鲨滩》编剧安东尼·贾斯温斯基操刀剧本。剧情讲述一个为生活努力奋斗的家庭在拍卖会上购得一艘老船，满怀希望准备开展租船业务，却在与世隔绝的外海发现了这艘船的惊悚秘密。奥德曼饰演一家之主兼船的掌舵者，蒂格饰船长的二把手，是一位弗罗里达州的冲浪好手。该片本月底阿拉巴马开拍。', '欧文·蒂格(《小丑回魂》《至亲血统》)加盟加里·奥德曼主演的超自然惊悚类型新片《玛丽》，Michael Goi(《美国恐怖故事》《塞勒姆》)执导，《鲨滩》编剧安东尼·贾斯温斯基操刀剧本。剧情讲述一个为生活努力奋斗的家庭在拍卖会上购得一艘老船，满怀希望准备开展租船业务，却在与世隔绝的外海发现了这艘船的惊悚秘密。奥德曼饰演一家之主兼船的掌舵者，蒂格饰船长的二把手，是一位弗罗里达州的冲浪好手。该片本月底阿拉巴马开拍。', 1, 1);
INSERT INTO `video` VALUES (6, '2019-06-01 02:45:09', '荒岛甜心', 25, 4, 6, 1, 'https://bilibili.com-h-bilibili.com/20191015/10073_af3af7fe/index.m3u8', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\荒岛甜心.jpg', '科雷西·克莱门斯 艾莫里·科恩 汉娜·曼根·劳伦斯 Andrew Crawford ', 'J·D·迪拉德 ', '欢迎在线观看由科雷西·克莱门斯 艾莫里·科恩 汉娜·曼根·劳伦斯 Andrew Crawford 等主演的剧情片《荒岛甜心》，第一时间为你提供《荒岛甜心》，如果你喜欢《荒岛甜心》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:珍（Kiersey Clemons）冲上岸，来到一个荒凉的岛上，已经度过了痛苦的折磨。她孤零零地四处寻找避难所。她只找到一处被遗弃已久的露营地的零星残骸，疲惫不堪地走完了可怕的旅途，倒下了，希望得到安宁的休息。但是夜晚是这里最危险的时候。这时生物来了。当它滑出水面时，它必须进食。', '珍（Kiersey Clemons）冲上岸，来到一个荒凉的岛上，已经度过了痛苦的折磨。她孤零零地四处寻找避难所。她只找到一处被遗弃已久的露营地的零星残骸，疲惫不堪地走完了可怕的旅途，倒下了，希望得到安宁的休息。但是夜晚是这里最危险的时候。这时生物来了。当它滑出水面时，它必须进食。', 1, 1);
INSERT INTO `video` VALUES (7, '2019-06-12 02:45:14', '无畏2019', 25, 4, 7, 1, 'https://bilibili.com-h-bilibili.com/20191015/10072_f91c7acb/index.m3u8', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\无畏2019.jpg', '贾德·尼尔森 德鲁·加勒特 Aidan Bristow C·托马斯·豪威尔 詹姆斯·奥斯汀·科尔 ', '迈克·菲利普斯 ', '欢迎在线观看由贾德·尼尔森 德鲁·加勒特 Aidan Bristow C·托马斯·豪威尔 詹姆斯·奥斯汀·科尔 等主演的战争片《无畏2019》，第一时间为你提供《无畏2019》，如果你喜欢《无畏2019》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:By June 1942, the Japanese Navy has swept across the Pacific. In an effort to change the course of the war, a United States carrier group is positioned off the coast of Midway, tasked with springing a trap on the enemy. During this pivotal battle, the two-man crew of a U.S. Navy dive bomber is forced to ditch in the sea. Set adrift, the men look qiwan.cc towards their comrades for rescue; namely, the ragtag crew of a PBY Catalina, who are sent to search for survivors. Amid the vast openness of the Pacific, with days passing and the chance of rescue fading, the men are forced to face their own mortality.', 'By June 1942, the Japanese Navy has swept across the Pacific. In an effort to change the course of the war, a United States carrier group is positioned off the coast of Midway, tasked with springing a trap on the enemy. During this pivotal battle, the two-man crew of a U.S. Navy dive bomber is forced to ditch in the sea. Set adrift, the men look qiwan.cc towards their comrades for rescue; namely, the ragtag crew of a PBY Catalina, who are sent to search for survivors. Amid the vast openness of the Pacific, with days passing and the chance of rescue fading, the men are forced to face their own mortality.', 1, 1);
INSERT INTO `video` VALUES (8, '2019-06-21 02:45:20', '监狱幸存者指南', 24, 4, 8, 1, 'https://tudou.com-l-tudou.com/20181209/14881_8f8c93b1/index.m3u8', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\监狱幸存者指南.jpg', '苏珊·萨兰登,帕特丽夏·阿奎特,丹尼·特雷霍,杰西·威廉姆斯', '马修·库克', '欢迎在线观看由苏珊·萨兰登 帕特丽夏·阿奎特 丹尼·特雷霍 杰西·威廉姆斯 等主演的纪录片《监狱幸存者指南》，第一时间为你提供《监狱幸存者指南》，如果你喜欢《监狱幸存者指南》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:NetFlix原创纪录片，本纪录片从布鲁斯与瑞吉的故事拍摄，他们是监狱的受刑人，在狱中为他们未曾承认犯下的谋杀罪名，度过了数年。观众将从他们的视角，窥视美国的监狱体系，导演对此并提出质疑。', 'NetFlix原创纪录片，本纪录片从布鲁斯与瑞吉的故事拍摄，他们是监狱的受刑人，在狱中为他们未曾承认犯下的谋杀罪名，度过了数年。观众将从他们的视角，窥视美国的监狱体系，导演对此并提出质疑', 1, 1);
INSERT INTO `video` VALUES (9, '2019-05-23 02:45:32', '激荡', 25, 1, 9, 2, 'https://youku.com-ok-tudou.com/share/ed46558a56a4a26b96a68738a0d28273', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\激荡.jpg', '任重,郭晓东,李念,车晓,侯勇,陶泽如,张逗逗,李亭哲,李诚儒', '余丁', '欢迎在线观看由任重 郭晓东 李念 车晓 侯勇 陶泽如 张逗逗 李亭哲 李诚儒 等主演的国产剧《激荡D》，第一时间为你提供《激荡D》，如果你喜欢《激荡D》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', '#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', 2, 1);
INSERT INTO `video` VALUES (10, '2019-10-16 02:45:39', '激荡', 25, 1, 9, 2, 'https://youku.com-ok-tudou.com/share/ed46558a56a4a26b96a68738a0d28273', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\激荡.jpg', '任重,郭晓东,李念,车晓,侯勇,陶泽如,张逗逗,李亭哲,李诚儒', '余丁', '欢迎在线观看由任重 郭晓东 李念 车晓 侯勇 陶泽如 张逗逗 李亭哲 李诚儒 等主演的国产剧《激荡D》，第一时间为你提供《激荡D》，如果你喜欢《激荡D》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', '#电视剧激荡# 波涛汹涌，江河汇聚成海；万物生长，时代势不可挡。电视剧《激荡》余丁执导，集结任重，郭晓东，李念，车晓，侯勇，陶泽如，张逗逗，李亭哲，李诚儒等一众实力派演员，演绎属于上海弄堂里小人物的热血奋斗史。', 2, 2);
INSERT INTO `video` VALUES (11, '2019-06-27 02:45:43', '解决师', 25, 1, 10, 2, 'https://youku.com-ok-163.com/share/ef8446f35513a8d6aa2308357a268a7e', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\解决师.jpg', '王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿...', '刘家豪 徐遇安 陈志江 ', '欢迎在线观看由王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿 庄思敏 杨柳青 李绮雯 李忠希 李启杰 陈伟洪 何伟业 陈俊坚 黄得生 杜燕歌 彭皓锋 王俊棠 杨证桦 戴耀明 董敬文 李兴华 陈国峰 李日升 赵璧渝 范文雅 胡琳 黄嘉乐 麦玲玲 李成昌 陈志健 张彦博 詹秉熙 周丽欣 黄雪儿 利颖怡 莫家淦 谭坤伦 王致迪 郑恕峰 卫志豪 朱乐洺 丁子朗 焦浩轩 关梓阳 郭思 菊梓乔 郭千瑜 刘芷希 夏雨 等主演的港台剧《解决师粤语》，第一时间为你提供《解决师粤语》，如果你喜欢《解决师粤语》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 1);
INSERT INTO `video` VALUES (12, '2019-06-28 02:45:49', '解决师', 25, 1, 10, 2, 'https://youku.com-ok-163.com/share/d198bd736a97e7cecfdf8f4f2027ef80', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\解决师.jpg', '王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿...', '刘家豪 徐遇安 陈志江 ', '欢迎在线观看由王浩信 唐诗咏 陈敏之 张颕康 张曦雯 李天翔 冯盈盈 张文慈 李国麟 苗可秀 罗乐林 文雪儿 庄思敏 杨柳青 李绮雯 李忠希 李启杰 陈伟洪 何伟业 陈俊坚 黄得生 杜燕歌 彭皓锋 王俊棠 杨证桦 戴耀明 董敬文 李兴华 陈国峰 李日升 赵璧渝 范文雅 胡琳 黄嘉乐 麦玲玲 李成昌 陈志健 张彦博 詹秉熙 周丽欣 黄雪儿 利颖怡 莫家淦 谭坤伦 王致迪 郑恕峰 卫志豪 朱乐洺 丁子朗 焦浩轩 关梓阳 郭思 菊梓乔 郭千瑜 刘芷希 夏雨 等主演的港台剧《解决师粤语》，第一时间为你提供《解决师粤语》，如果你喜欢《解决师粤语》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 2);
INSERT INTO `video` VALUES (13, '2019-05-01 02:46:00', '太阳的季节', 25, 5, 11, 2, 'https://iqiyi.com-t-iqiyi.com/share/4a533591763dfa743a13affab1a85793', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\太阳的季节.jpg', '吴昶锡,尹素怡,崔成宰,河诗恩', '金元勇', '欢迎在线观看由吴昶锡 尹素怡 崔成宰 河诗恩 等主演的日韩剧《太阳的季节》，第一时间为你提供《太阳的季节》，如果你喜欢《太阳的季节》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', '该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', 4, 1);
INSERT INTO `video` VALUES (14, '2019-05-05 02:46:07', '太阳的季节', 25, 5, 11, 2, 'https://iqiyi.com-t-iqiyi.com/share/9edda0fd4d983bf975935cfd492fd50b', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\太阳的季节.jpg', '吴昶锡,尹素怡,崔成宰,河诗恩', '金元勇', '欢迎在线观看由吴昶锡 尹素怡 崔成宰 河诗恩 等主演的日韩剧《太阳的季节》，第一时间为你提供《太阳的季节》，如果你喜欢《太阳的季节》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', '该剧讲述了一个围绕财阀家族展开的复仇和爱情故事。', 4, 2);
INSERT INTO `video` VALUES (15, '2019-07-24 02:46:15', '康纳一家第二季', 25, 4, 12, 2, 'https://youku.com-ok-pptv.com/share/edf0320adc8658b25ca26be5351b6c4a', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\康纳一家第二季.jpg', '约翰·古德曼,劳里·梅特卡夫,莎拉·吉尔伯特', '盖尔·曼库索', '欢迎在线观看由约翰·古德曼 劳里·梅特卡夫 莎拉·吉尔伯特 等主演的欧美剧《康纳一家第二季》，第一时间为你提供《康纳一家第二季》，如果你喜欢《康纳一家第二季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:The Conners has been renewed! Karey Burke, president, ABC Entertainment, announced that the ABC Television Network has ordered a second season of the freshman hit comedy.', 'The Conners has been renewed! Karey Burke, president, ABC Entertainment, announced that the ABC Television Network has ordered a second season of the freshman hit comedy.', 1, 1);
INSERT INTO `video` VALUES (16, '2019-07-25 02:46:22', '鲁豫有约2019', 25, 1, 13, 3, 'https://pptv.com-h-pptv.com/share/1f5bb9b79cb995f65aa9f6d649c5f49f', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\鲁豫有约2019.jpg', '陈鲁豫', '暂无', '欢迎在线观看由陈鲁豫 等主演的内地综《鲁豫有约2019》，第一时间为你提供《鲁豫有约2019》，如果你喜欢《鲁豫有约2019》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:节目寻访拥有特殊经历的人物，一起见证历史、思索人生，直指生命与心灵的秘密，创造一种新颖的谈话记录', '节目寻访拥有特殊经历的人物，一起见证历史、思索人生，直指生命与心灵的秘密，创造一种新颖的谈话记录。', 2, 20190401);
INSERT INTO `video` VALUES (17, '2019-03-27 02:46:28', '拜托了女神', 25, 3, 14, 3, 'https://youku.com-youku.net/share/4bbba5edefd947d07aa2d7a800b7d15b', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\拜托了女神.jpg', '   ', '     ', '欢迎在线观看由等主演的港台综《拜托了女神》，第一时间为你提供《拜托了女神》，如果你喜欢《拜托了女神》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:', '    ', 2, 20181125);
INSERT INTO `video` VALUES (18, '2019-10-08 02:46:35', '家师父一体', 25, 5, 15, 3, 'https://bilibili.com-h-bilibili.com/share/35ec253885cf090f80881b44180afb00', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\家师父一体.jpg', '李昇基,李相仑,陆星材,梁世亨', '李世英', '欢迎在线观看由李昇基 李相仑 陆星材 梁世亨 等主演的日韩综《家师父一体》，第一时间为你提供《家师父一体》，如果你喜欢《家师父一体》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:《家师父一体》是韩国SBS电视台制作的一档寓教于乐类综艺节目，讲述的是充满疑问的青年们去寻找有着自己独特生活方式的怪才师父与他们开始一段同苦同乐的生活，并从中领悟、学习到很多的一个综艺节目。在节目中，李昇基、李尚允、陆星材、梁世炯 四人去寻找在一个“房间”里的“师父”并以他的生活方式来生活，度过横冲直撞的一天。', '《家师父一体》是韩国SBS电视台制作的一档寓教于乐类综艺节目，讲述的是充满疑问的青年们去寻找有着自己独特生活方式的怪才师父与他们开始一段同苦同乐的生活，并从中领悟、学习到很多的一个综艺节目。在节目中，李昇基、李尚允、陆星材、梁世炯 四人去寻找在一个“房间”里的“师父”并以他的生活方式来生活，度过横冲直撞的一天。', 4, 20190602);
INSERT INTO `video` VALUES (19, '2019-05-15 02:46:38', '嘻哈星节奏第一季', 25, 4, 16, 3, 'https://youku.com-ok-pptv.com/share/17a3120e4e5fbdc3cb5b5f946809b06a', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\嘻哈星节奏.jpg', '卡迪·B,T.I.,钱斯勒,Matthew Carter', '   ', '欢迎在线观看由卡迪·B T.I. 钱斯勒 Matthew Carter 等主演的欧美综《嘻哈星节奏第一季》，第一时间为你提供《嘻哈星节奏第一季》，如果你喜欢《嘻哈星节奏第一季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:寻找下一个嘻哈说唱巨星，Netflix的新嘻哈选秀综艺《Rhythm + Flow》。豪华阵容Cardi B、Chance the Rapper、T.I.任评委，称是全美“第一档正式的嘻哈真人竞赛节目”。10月9日开播，此后每周三周播。 制作人有John Legend、Jesse Collins、Jeff Gaspin和三名评委等人。选拔参赛者的城市包括评委们的家乡亚特兰大、芝加哥和纽约，每个城市都有一个著名的当地rapper加入评委阵容。', '寻找下一个嘻哈说唱巨星，Netflix的新嘻哈选秀综艺《Rhythm + Flow》。豪华阵容Cardi B、Chance the Rapper、T.I.任评委，称是全美“第一档正式的嘻哈真人竞赛节目”。10月9日开播，此后每周三周播。 制作人有John Legend、Jesse Collins、Jeff Gaspin和三名评委等人。选拔参赛者的城市包括评委们的家乡亚特兰大、芝加哥和纽约，每个城市都有一个著名的当地rapper加入评委阵容。', 1, 1);
INSERT INTO `video` VALUES (20, '2019-06-01 02:46:44', '那年那兔那些事儿第五季', 25, 1, 17, 4, 'https://qq.com-ok-qq.com/share/d9395b105f23926e3c4f09453e018893', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\那年那兔那些事儿第五季.jpg', '小连杀,叮当', '王强', '欢迎在线观看由小连杀 叮当 等主演的国产动《那年那兔那些事儿第五季》，第一时间为你提供《那年那兔那些事儿第五季》，如果你喜欢《那年那兔那些事儿第五季》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:讲述了勤劳的兔子们为了建立一个吃得饱穿得暖不被人看不起的种花家，辛勤奋斗的故事。', '讲述了勤劳的兔子们为了建立一个吃得饱穿得暖不被人看不起的国家，辛勤奋斗的故事。', 2, 1);
INSERT INTO `video` VALUES (21, '2019-06-15 02:46:48', '神田川JET GIRLS', 25, 6, 18, 4, 'https://qq.com-ok-qq.com/share/f7da8deec4b7a7e1e9421420b2dfa049', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\神田川JET GIRLS.jpg', '篠原侑 小原莉子 田所梓 洲崎绫 大久保瑠美 大空直美 Lynn 菲鲁兹·蓝 安济知佳 前田佳织里 ', '金子拓 ', '欢迎在线观看由篠原侑 小原莉子 田所梓 洲崎绫 大久保瑠美 大空直美 Lynn 菲鲁兹·蓝 安济知佳 前田佳织里 朝井彩加 内田彩 等主演的日韩动《神田川JET GIRLS》，第一时间为你提供《神田川JET GIRLS》，如果你喜欢《神田川JET GIRLS》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:操作赛艇的“推进手”与使用水枪攻击对手的“射手”两人一组乘坐摩托赛艇，横越水面的运动“喷射竞速”成为主流的世界。母亲是传说中的推进手，自己也梦想成为喷射竞速选手的波黄凛，离开故乡所在的岛，来到了东京浅草。她在那里遇到了冰山美少女苍井美沙，两人成为了搭档。她们在与对手们展开竞争的同时，也逐渐加深着彼此的牵绊。', '操作赛艇的“推进手”与使用水枪攻击对手的“射手”两人一组乘坐摩托赛艇，横越水面的运动“喷射竞速”成为主流的世界。母亲是传说中的推进手，自己也梦想成为喷射竞速选手的波黄凛，离开故乡所在的岛，来到了东京浅草。她在那里遇到了冰山美少女苍井美沙，两人成为了搭档。她们在与对手们展开竞争的同时，也逐渐加深着彼此的牵绊。', 5, 1);
INSERT INTO `video` VALUES (22, '2018-06-27 02:46:55', '愤怒的小鸟2', 25, 4, 19, 4, 'https://baidu.com-ok-baidu.com/20191015/15356_b4ad66d8/index.m3u8', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\愤怒的小鸟2.jpg', '杰森·苏戴奇斯 比尔·哈德尔 乔什·加德 丹尼·麦克布莱德 ', '图鲁普·范·奥尔曼 约翰·赖斯 ', '欢迎在线观看由杰森·苏戴奇斯 比尔·哈德尔 乔什·加德 丹尼·麦克布莱德 等主演的欧美动《愤怒的小鸟2》，第一时间为你提供《愤怒的小鸟2》，如果你喜欢《愤怒的小鸟2》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:小鸟胖红（杰森·苏戴奇斯 配音）和绿猪莱纳德（比尔·哈德尔）两位宿敌，不得不联手，带领各自小岛的居民，共同对抗第三座小岛紫鹰的入侵。', '小鸟胖红（杰森·苏戴奇斯 配音）和绿猪莱纳德（比尔·哈德尔）两位宿敌，不得不联手，带领各自小岛的居民，共同对抗第三座小岛紫鹰的入侵。', 1, 1);
INSERT INTO `video` VALUES (23, '2019-07-24 02:47:02', '霹雳靖玄录下阕', 25, 3, 20, 4, 'https://qq.com-ok-qq.com/share/59e29dc7066b5a6fcf68b48e6dd67347', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\霹雳靖玄录下阕.jpg', '占云巾 琴狐 疏楼龙宿 剑子仙迹 道锋天扇子 剑谪仙 侠仙若士 江南春信 左无咎 刀僧还情 西窗月 天涯沦落人 皇鳞 海宇之主 风月主人 风云儿 元守默 等', '    ', '欢迎在线观看由占云巾 琴狐 疏楼龙宿 剑子仙迹 道锋天扇子 剑谪仙 侠仙若士 江南春信 左无咎 刀僧还情 西窗月 天涯沦落人 皇鳞 海宇之主 风月主人 风云儿 元守默 等主演的港台动《霹雳靖玄录下阕》，第一时间为你提供《霹雳靖玄录下阕》，如果你喜欢《霹雳靖玄录下阕》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:乱世皇麟异域灾，焚夜悲歌天祭开。 侠影纷纷靖玄祸，恒山终见谪仙来。 细数人世至悲，最无奈挚友相残，鹿巾、琴狐半生交情，同窗岁月，嬉笑平常；共事多年，力保太平，更曾于白水滩，携手对抗未知的强敌皇鳞，而今为一场误解、为解不开的心结，却把正义之剑，挥向彼此；而在背后运筹帷幄的代行者鳇影，更在决战之地外围，布下天罗地网，只待两败俱伤之际，坐收渔翁之利。 同样无奈，疏楼龙宿与剑子仙迹，白首莫逆，因一场阴谋，因解不开的嗜血之症，杀伐以对，陷入暴乱的剑子仙迹，与为救至友，不得不化身暴乱的疏楼龙宿，既许人间同游，亦愿尘世同狂，而左右剑子仙迹生死之机，掌握在神秘剑阵是否能及时完成，幽玄虚渊意图完成幽空大阵，大举侵吞墟丘天窍。 墟丘之顶，天扇子力排众议，一心力保风云儿生机，凌虚七仙各持己见，气氛一时剑拔弩张，天窍秘境在最后关头，做出抉择，接纳垂死的风云儿。人间一日月，天窍不知年，神秘莫测的天窍秘境，风云儿筑基重修，而天扇子更在天窍深处归墟，再次精进，与时竞走两人，期许尽早出关，在南域正道势危之时，力挽狂澜。 皇祸再起，逆世双鳞重磅袭卷南域，焚夜天祭，风月主人召唤火陨灭世，昔日劫难再次降临，轩昂五玑各自伤亡，儒道顶峰身无余力，传说中的恒山·剑谪仙，如今身在何处？他能再现江湖，扛起苍生这面大旗吗？欲知一连串精彩结果，请勿错过黄文择布袋戏，霹雳靖玄录下阕：皇祸篇。', '乱世皇麟异域灾，焚夜悲歌天祭开。 侠影纷纷靖玄祸，恒山终见谪仙来。 细数人世至悲，最无奈挚友相残，鹿巾、琴狐半生交情，同窗岁月，嬉笑平常；共事多年，力保太平，更曾于白水滩，携手对抗未知的强敌皇鳞，而今为一场误解、为解不开的心结，却把正义之剑，挥向彼此；而在背后运筹帷幄的代行者鳇影，更在决战之地外围，布下天罗地网，只待两败俱伤之际，坐收渔翁之利。 同样无奈，疏楼龙宿与剑子仙迹，白首莫逆，因一场阴谋，因解不开的嗜血之症，杀伐以对，陷入暴乱的剑子仙迹，与为救至友，不得不化身暴乱的疏楼龙宿，既许人间同游，亦愿尘世同狂，而左右剑子仙迹生死之机，掌握在神秘剑阵是否能及时完成，幽玄虚渊意图完成幽空大阵，大举侵吞墟丘天窍。 墟丘之顶，天扇子力排众议，一心力保风云儿生机，凌虚七仙各持己见，气氛一时剑拔弩张，天窍秘境在最后关头，做出抉择，接纳垂死的风云儿。人间一日月，天窍不知年，神秘莫测的天窍秘境，风云儿筑基重修，而天扇子更在天窍深处归墟，再次精进，与时竞走两人，期许尽早出关，在南域正道势危之时，力挽狂澜。 皇祸再起，逆世双鳞重磅袭卷南域，焚夜天祭，风月主人召唤火陨灭世，昔日劫难再次降临，轩昂五玑各自伤亡，儒道顶峰身无余力，传说中的恒山·剑谪仙，如今身在何处？他能再现江湖，扛起苍生这面大旗吗？欲知一连串精彩结果，请勿错过黄文择布袋戏，霹雳靖玄录下阕：皇祸篇。', 2, 1);
INSERT INTO `video` VALUES (24, '2019-08-02 02:47:07', '声怒', 25, 4, 21, 4, 'https://baidu.com-ok-baidu.com/share/dff4ba680e945e400d3d800a9fa29f3e', 'G:\\1   第二学期项目\\憨批影院\\img\\cover_img\\声怒.jpg', 'Takashi Okazaki', '水崎淳平 森本晃司 迈克尔·艾里亚斯 松本胜 Henry Thurlow 冈崎能士 ', '欢迎在线观看由Takashi Okazaki 等主演的海外动《声怒》，第一时间为你提供《声怒》，如果你喜欢《声怒》请把它分享给的朋友，有您们的支持我们会做的更好。祝你观片愉快！剧情简介:咆哮的吉他声。原始复仇推动的野蛮战争。斯德吉尔·辛普森倾力推出这部震撼人心的作品。', '咆哮的吉他声。原始复仇推动的野蛮战争。斯德吉尔·辛普森倾力推出这部震撼人心的作品。', 1, 1);

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
INSERT INTO `video_sort` VALUES (1, '电影', 'movie');
INSERT INTO `video_sort` VALUES (2, '连续剧', 'sitcom');
INSERT INTO `video_sort` VALUES (3, '综艺', 'Variety');
INSERT INTO `video_sort` VALUES (4, '动漫', 'Comic');

SET FOREIGN_KEY_CHECKS = 1;
