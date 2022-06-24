/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2022-06-24 08:02:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `articletitle` varchar(100) NOT NULL,
  `articledate` date NOT NULL,
  `readAmount` int NOT NULL,
  `articlecontent` text NOT NULL,
  `summary` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortId` int NOT NULL,
  PRIMARY KEY (`articleId`),
  KEY `author` (`authorId`),
  CONSTRAINT `author` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('21', '7', '1', '2022-01-24', '0', '<p>2</p>', '123', '1');
INSERT INTO `article` VALUES ('22', '2', 'ddws', '2021-05-02', '2', '<p>sdlkjfboadwfnnpaw</p>', '	 jsdbfadjfai ', '2');
INSERT INTO `article` VALUES ('23', '2', '更好人的繁体的', '2022-01-26', '3', '<p>分公司师范大学成功</p>', '	  非常高 ', '1');

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `authorId` int NOT NULL AUTO_INCREMENT,
  `authorName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorresume` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorhobby` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorheadportrait` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`authorId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('2', 'cqy123', 'qee', 'df', 'dsds', null, '123456');
INSERT INTO `author` VALUES ('6', '123', 'dkncoaifn', 'djfhoawuf', 'sdjainvcidwao', null, '123456');
INSERT INTO `author` VALUES ('7', '123', '1234', '1', '2', null, '123');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `articleId` int NOT NULL,
  `commentcontent` varchar(20) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `authorid` (`authorId`),
  CONSTRAINT `authorid` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('9', '2', '7', 'sjfbcsu');
INSERT INTO `comment` VALUES ('10', '2', '22', 'kjsdpwe');
INSERT INTO `comment` VALUES ('11', '2', '23', '下道工序');

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diary_id` int NOT NULL AUTO_INCREMENT,
  `diary_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `diary_time` date NOT NULL,
  PRIMARY KEY (`diary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES ('1', '2016年，还剩下不到20天，加油呀少年。', '2016-11-10');
INSERT INTO `diary` VALUES ('2', '放弃该放弃的是无奈，放弃不该放弃的是无能，不放弃该放弃的是无知，不放弃不该放弃的是执著！', '2016-11-15');
INSERT INTO `diary` VALUES ('3', '不要拿小人的错误来惩罚自己，不要在这些微不足道的事情上折磨浪费自己的宝贵时间。', '2016-11-19');
INSERT INTO `diary` VALUES ('4', '没有什么，比努力更值得我去做。', '2016-11-22');
INSERT INTO `diary` VALUES ('5', '生活是一面镜子。你对它笑，它就对你笑；你对它哭，它也对你哭。', '2016-11-25');
INSERT INTO `diary` VALUES ('6', '活着一天，就是有福气，就该珍惜。当我哭泣我没有鞋子穿的时候，我发现有人却没有脚。', '2016-11-28');
INSERT INTO `diary` VALUES ('7', '命运负责洗牌，但是玩牌的是我们自己！', '2016-11-30');
INSERT INTO `diary` VALUES ('8', '天将降大任于斯人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身，行拂乱其所为也，所以动心忍性，增益其所不能。', '2016-12-01');
INSERT INTO `diary` VALUES ('9', '立志、工作、成就，是人类活动的三大要素。立志是事业的大门，工作是登堂入室的旅程。这旅程的尽头有个成功在等待着，来庆祝你的努力结果。', '2016-12-03');
INSERT INTO `diary` VALUES ('10', '加油呀少年。', '2016-12-05');
INSERT INTO `diary` VALUES ('11', '好累。但是还要坚持。一定不要辜负老师的期望。', '2016-12-06');
INSERT INTO `diary` VALUES ('12', '读书，始读，未知有疑;其次，则渐渐有疑;中则节节是疑。过了这一番，疑渐渐释，以至融会贯通，都无所疑，方始是学。', '2016-12-07');
INSERT INTO `diary` VALUES ('13', '今天收获很多。', '2016-12-08');
INSERT INTO `diary` VALUES ('14', '夫志当存高远，慕先贤，绝情欲，弃疑滞，使庶几之志，揭然有所存，恻然有所感；忍屈伸，去细碎，广咨问，除嫌吝，虽有淹留，何损于美趣，何患于不济。', '2016-12-09');
INSERT INTO `diary` VALUES ('15', '凡事都要脚踏实地去作，不驰于空想，不骛于虚声，而惟以求真的态度作踏实的工夫。以此态度求学，则真理可明，以此态度作事，则功业可就。', '2016-12-09');
INSERT INTO `diary` VALUES ('16', '假如生活欺骗了你,不要心焦,也不要烦恼.阴郁的日子里要心平气和,相信吧,那快乐的日子就来到。', '2016-12-10');
INSERT INTO `diary` VALUES ('17', '读书，始读，未知有疑;其次，则渐渐有疑;中则节节是疑。过了这一番，疑渐渐释，以至融会贯通，都无所疑，方始是学。', '2016-12-11');
INSERT INTO `diary` VALUES ('18', '谚日：“积财千万，不如薄技在身。”使之易习而可贵者，无过读书也。世人不问愚智，皆欲识人之多，见事之广，而不肯读书，是犹求饱而懒劳馔，欲暖而惰裁衣也。', '2016-12-12');
INSERT INTO `diary` VALUES ('19', '烟台的今天，小雪，好希望老天爷可以下一场大雪，陪她去看看雪。2016年只剩下15天了，加油。', '2016-12-14');
INSERT INTO `diary` VALUES ('20', '今天天气好冷，还有5天，2016年就结束了，一丝的惶恐，一丝的不安，但是不管怎么样，努力的向前的。都在努力，我有什么理由不努力。', '2016-12-20');
INSERT INTO `diary` VALUES ('21', '123', '2022-01-07');
INSERT INTO `diary` VALUES ('22', '123', '2022-01-07');

-- ----------------------------
-- Table structure for drafts
-- ----------------------------
DROP TABLE IF EXISTS `drafts`;
CREATE TABLE `drafts` (
  `draftsId` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `articletitle` varchar(100) DEFAULT NULL,
  `articledate` date DEFAULT NULL,
  `readAmount` int NOT NULL,
  `sortId` varchar(10) DEFAULT NULL,
  `summary` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `articlecontent` text NOT NULL,
  PRIMARY KEY (`draftsId`),
  KEY `authorid2` (`authorId`),
  CONSTRAINT `authorid2` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drafts
-- ----------------------------

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `authorFriendsId` int NOT NULL AUTO_INCREMENT,
  `authorId` int DEFAULT NULL,
  `FriendsId` int DEFAULT NULL,
  `authornote` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`authorFriendsId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('1', '1', '2', 'rtt');
INSERT INTO `friends` VALUES ('2', '1', '3', 'tt');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `historyId` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `arctileId` int NOT NULL,
  PRIMARY KEY (`historyId`),
  KEY `this.article` (`arctileId`),
  KEY `this.suthor` (`authorId`),
  CONSTRAINT `this.article` FOREIGN KEY (`arctileId`) REFERENCES `article` (`articleId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `this.suthor` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('9', '2', '22');
INSERT INTO `history` VALUES ('10', '2', '22');
INSERT INTO `history` VALUES ('11', '2', '23');
INSERT INTO `history` VALUES ('12', '2', '23');
INSERT INTO `history` VALUES ('13', '2', '23');

-- ----------------------------
-- Table structure for sorts
-- ----------------------------
DROP TABLE IF EXISTS `sorts`;
CREATE TABLE `sorts` (
  `sortId` int NOT NULL AUTO_INCREMENT,
  `sortname` varchar(20) NOT NULL,
  `sortdescription` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sorts
-- ----------------------------
INSERT INTO `sorts` VALUES ('1', 'python', null);
INSERT INTO `sorts` VALUES ('2', 'java', null);
INSERT INTO `sorts` VALUES ('3', 'c/c++', null);
INSERT INTO `sorts` VALUES ('4', '前端', null);
INSERT INTO `sorts` VALUES ('5', '数据库', null);
INSERT INTO `sorts` VALUES ('6', '计算机基础', null);
INSERT INTO `sorts` VALUES ('7', '移动', null);
INSERT INTO `sorts` VALUES ('8', 'AI', null);
INSERT INTO `sorts` VALUES ('9', '区块链', null);
INSERT INTO `sorts` VALUES ('10', '其他', null);

-- ----------------------------
-- Procedure structure for articlesum
-- ----------------------------
DROP PROCEDURE IF EXISTS `articlesum`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `articlesum`(IN authorId INT(20),OUT sum INT(10))
BEGIN
SELECT COUNT(authorId) AS sum FROM article WHERE article.authorId=authorId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for friendsum
-- ----------------------------
DROP PROCEDURE IF EXISTS `friendsum`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `friendsum`(IN authorId INT(20),OUT sum INT(10))
BEGIN
SELECT COUNT(FriendsId) AS sum FROM friends WHERE friends.authorId=authorId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Insertcomment
-- ----------------------------
DROP PROCEDURE IF EXISTS `Insertcomment`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Insertcomment`(authorId INT(20),articleId INT(20),commentcontent VARCHAR(20))
BEGIN
INSERT INTO comment(authorId,articleId,commentcontent) VALUES(authorId,articleId,commentcontent);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for readsum
-- ----------------------------
DROP PROCEDURE IF EXISTS `readsum`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `readsum`(IN articleId INT(20),OUT sum INT(10))
BEGIN
SELECT COUNT(articleAmount) AS sum FROM article WHERE article.articledate=articleId;
END
;;
DELIMITER ;
