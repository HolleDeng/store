/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2016-08-11 20:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buycar`
-- ----------------------------
DROP TABLE IF EXISTS `buycar`;
CREATE TABLE `buycar` (
  `userid` varchar(30) NOT NULL,
  `number` varchar(30) NOT NULL,
  `count` int(4) NOT NULL,
  KEY `userid` (`userid`),
  KEY `number` (`number`),
  CONSTRAINT `buycar_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `buycar_ibfk_2` FOREIGN KEY (`number`) REFERENCES `goods` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buycar
-- ----------------------------
INSERT INTO `buycar` VALUES ('1', '1', '12');
INSERT INTO `buycar` VALUES ('d', '2', '1');
INSERT INTO `buycar` VALUES ('d', '6', '1');
INSERT INTO `buycar` VALUES ('deng', '6', '2');
INSERT INTO `buycar` VALUES ('deng', '3', '1');
INSERT INTO `buycar` VALUES ('wang', '8', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `userid` varchar(30) NOT NULL,
  `number` varchar(30) NOT NULL,
  `evaluate` varchar(500) NOT NULL,
  KEY `userid` (`userid`),
  KEY `number` (`number`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`number`) REFERENCES `goods` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1');
INSERT INTO `comment` VALUES ('wang', '5', '好');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `number` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` double(7,2) NOT NULL,
  `amount` int(5) NOT NULL,
  `publishDate` date NOT NULL,
  `savePath` varchar(200) NOT NULL,
  `introduction` varchar(500) NOT NULL,
  `sellAmount` int(5) NOT NULL,
  `userid` varchar(30) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `userid` (`userid`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'dog', '1232.00', '1', '2016-08-01', 'image\\1.jpg', 'dog sdf sd fsd ', '1', '1');
INSERT INTO `goods` VALUES ('2', 'kge', '122.00', '31', '2016-08-02', 'image\\2.jpg', 'wesf  sd wwe', '13', '1');
INSERT INTO `goods` VALUES ('3', 'wewg', '232.00', '122', '2016-08-01', 'image\\3.jpg', 'it si zeg', '235', '1');
INSERT INTO `goods` VALUES ('4', 'wgf', '234.00', '12', '2015-07-29', 'upload/ca0a817a-e37f-41d3-9aad-51377abb4052.jpg', 'oksw d ', '23', 'wang');
INSERT INTO `goods` VALUES ('5', 'sdf', '211.00', '122', '2016-08-01', 'image\\10.jpg', '123', '123', 'wang');
INSERT INTO `goods` VALUES ('6', '23s ', '123.00', '120', '2016-08-15', 'image\\6.jpg', 'sdsfs', '126', '1');
INSERT INTO `goods` VALUES ('7', '234', '111.00', '233', '2016-08-01', 'image\\12.jpg', 'hhh', '123', '1');
INSERT INTO `goods` VALUES ('8', 'sdf', '111.00', '233', '2016-08-01', 'image\\2.jpg', 'sss', '1124', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `rePassword` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `lastdate` varchar(30) DEFAULT NULL,
  `loginNum` int(4) DEFAULT NULL,
  `security` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'deng', 'deng', 'deng', 'admin', null, null, null);
INSERT INTO `user` VALUES ('d', 'd', 'd', 'd', '普通消费用户', null, '0', null);
INSERT INTO `user` VALUES ('deng', 'deng', 'deng', 'deng', '普通消费用户', '2016-08-11 20:23:56', '3', null);
INSERT INTO `user` VALUES ('wang', 'wang', 'wang', 'wang', '开店用户', '2016-08-11 20:01:01', '3', null);
