/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql_10.173.232.143
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ordersystem

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-03-30 14:54:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `comment` text,
  `reply` text,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment` (`userId`),
  KEY `FK_comment_order` (`orderId`),
  CONSTRAINT `FK_comment` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_comment_order` FOREIGN KEY (`orderId`) REFERENCES `saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '2016-03-22 13:02:45', '140', '110', '3', '味道还是可以的，其余的就是。。。无言了。。。', '欢迎下次光临', '1');
INSERT INTO `comment` VALUES ('3', '2016-03-30 13:41:47', '141', '110', '3', '好滴阿', '无', '1');
INSERT INTO `comment` VALUES ('4', '2016-03-22 13:51:33', '142', '110', '3', '分量足，而且看起来比较卫生，希望商家推出更多优惠', '欢迎下次光临', '1');
INSERT INTO `comment` VALUES ('5', '2016-03-23 10:50:04', '143', '110', '0', null, null, '0');
INSERT INTO `comment` VALUES ('6', '2016-03-30 09:20:28', '144', '110', '3', '好吃吧', null, '1');
INSERT INTO `comment` VALUES ('7', '2016-03-30 09:20:06', '145', '110', '4', '阿', null, '1');
INSERT INTO `comment` VALUES ('8', '2016-03-30 14:25:34', '146', '110', '0', null, null, '0');
INSERT INTO `comment` VALUES ('20', null, '149', '110', '0', null, null, '0');
INSERT INTO `comment` VALUES ('21', '2016-03-30 13:18:35', '151', '110', '3', '好吃', null, '1');
INSERT INTO `comment` VALUES ('22', null, '150', '110', '0', null, null, '0');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `foodTypeId` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_food` (`foodTypeId`),
  CONSTRAINT `FK_food` FOREIGN KEY (`foodTypeId`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '特色猪扒饭', 'resources/upload/pic11.png', '12', '好吃不解释', '2');
INSERT INTO `food` VALUES ('2', '黄焖鸡米饭', 'resources/upload/pic21.jpg', '10', '特色招牌菜', '2');
INSERT INTO `food` VALUES ('3', '原味手抓饼', 'resources/upload/shouzhuabing.png', '6', '原滋原味', '1');
INSERT INTO `food` VALUES ('4', '手抓饼（加火腿）', 'resources/upload/shouzhuabing21.png', '8', '加料', '1');
INSERT INTO `food` VALUES ('5', '章鱼小丸子', 'resources/upload/zhangyu.png', '5', '丸子', '3');
INSERT INTO `food` VALUES ('6', '榴莲酥', 'resources/upload/liulian.png', '8', '一份6个', '3');
INSERT INTO `food` VALUES ('7', '云吞河粉', 'resources/upload/yuntun.png', '10', '好吃', '4');
INSERT INTO `food` VALUES ('8', '牛筋丸汤粉', 'resources/upload/niurouwan.png', '12', '牛筋丸汤粉', '4');
INSERT INTO `food` VALUES ('9', '西瓜汁', 'resources/upload/xiguazhi.png', '8', '特色饮品', '5');
INSERT INTO `food` VALUES ('10', '鲜榨橙汁', 'resources/upload/chengzhi.png', '8', '特色饮品', '5');
INSERT INTO `food` VALUES ('11', '水果千层饼', 'resources/upload/qianchen.png', '13', '好吃不解释', '6');
INSERT INTO `food` VALUES ('12', '澳门葡挞', 'resources/upload/puta.png', '2.5', '下午茶系列', '6');
INSERT INTO `food` VALUES ('13', '港式热奶茶', 'resources/upload/hotmilk.png', '7', '热饮', '7');
INSERT INTO `food` VALUES ('14', '卡布奇诺咖啡', 'resources/upload/coffee.png', '12', '咖啡', '8');

-- ----------------------------
-- Table structure for foodtype
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodTypeName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foodtype
-- ----------------------------
INSERT INTO `foodtype` VALUES ('1', '台湾手抓饼系', '台湾手抓饼系');
INSERT INTO `foodtype` VALUES ('2', '美味炒饭、扒饭', '美味炒饭、扒饭');
INSERT INTO `foodtype` VALUES ('3', '风味小吃系列', '风味小吃系列');
INSERT INTO `foodtype` VALUES ('4', '正宗潮汕汤粉', '正宗潮汕汤粉');
INSERT INTO `foodtype` VALUES ('5', '鲜榨果汁', '鲜榨果汁');
INSERT INTO `foodtype` VALUES ('6', '甜点', '甜点');
INSERT INTO `foodtype` VALUES ('7', '养生热饮', '养生热饮');
INSERT INTO `foodtype` VALUES ('8', '咖啡系列', '咖啡系列');
INSERT INTO `foodtype` VALUES ('9', '招牌果茶', '招牌果茶');
INSERT INTO `foodtype` VALUES ('10', '夏日冰品', '夏日冰品');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toUserName` varchar(50) NOT NULL,
  `fromUserName` varchar(30) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  `msgType` varchar(30) DEFAULT NULL,
  `event` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `precision` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('170', 'gh_05e651e91ccc', 'ojrcJuNbcjZS9xPJEngSEslN3RJc', '1459316531', 'event', 'LOCATION', '23.178537', '113.334846', '40.000000');

-- ----------------------------
-- Table structure for oauth
-- ----------------------------
DROP TABLE IF EXISTS `oauth`;
CREATE TABLE `oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_in` varchar(50) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `scope` varchar(30) DEFAULT NULL,
  `unionid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth
-- ----------------------------
INSERT INTO `oauth` VALUES ('5', 'OezXcEiiBSKSxW0eoylIePIZhYI2kzOEPhvJCKhUWLbmbLmgda72Q4SCdw4XmQYn14cPaf2T4PYJ99TV6zjpyTtiA8Bf2nF4QX45Hz1hY_LpvQIhmY_HjdEWI-7P6w8POQ7AqFjWVRrexGaYQBMF0w', '7200', 'OezXcEiiBSKSxW0eoylIePIZhYI2kzOEPhvJCKhUWLbmbLmgda72Q4SCdw4XmQYn_FpNL_wNjxQewRhmI1M0UlueQnJphqUDutDtdr3Sp9mbLjVINgq_ZlHatyKLB3GbPOFRrBTEyBEXYvVDIBlyYA', 'ojrcJuNbcjZS9xPJEngSEslN3RJc', 'snsapi_userinfo', null);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentNo` varchar(60) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `amount` double(11,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment` (`orderId`),
  CONSTRAINT `FK_payment` FOREIGN KEY (`orderId`) REFERENCES `saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('335', 'P-201603220001', '2016-03-22 12:58:54', '微信钱包', '139', '26');
INSERT INTO `payment` VALUES ('336', 'P-201603220002', '2016-03-22 13:02:45', '微信钱包', '140', '74');
INSERT INTO `payment` VALUES ('337', 'P-201603220003', '2016-03-22 13:10:03', '微信钱包', '141', '22');
INSERT INTO `payment` VALUES ('338', 'P-201603220004', '2016-03-22 13:51:33', '微信钱包', '142', '18');
INSERT INTO `payment` VALUES ('339', 'P-201603230005', '2016-03-23 10:50:04', '微信钱包', '143', '14');
INSERT INTO `payment` VALUES ('340', 'P-201603230006', '2016-03-23 10:53:16', '微信钱包', '144', '13');
INSERT INTO `payment` VALUES ('341', 'P-201603230007', '2016-03-23 10:58:04', '微信钱包', '145', '8');
INSERT INTO `payment` VALUES ('342', 'P-201603280008', '2016-03-28 18:46:51', '微信钱包', '146', '26');
INSERT INTO `payment` VALUES ('343', 'P-201603280009', '2016-03-28 19:16:07', '微信钱包', '147', '16');
INSERT INTO `payment` VALUES ('344', 'P-201603280010', '2016-03-28 19:18:09', '微信钱包', '148', '62');
INSERT INTO `payment` VALUES ('345', 'P-201603280011', '2016-03-28 19:18:26', '微信钱包', '148', '62');
INSERT INTO `payment` VALUES ('346', 'P-201603280012', '2016-03-28 20:16:51', '微信钱包', '142', '18');
INSERT INTO `payment` VALUES ('347', 'P-201603300013', '2016-03-30 10:13:54', '微信钱包', '149', '8');
INSERT INTO `payment` VALUES ('348', 'P-201603300014', '2016-03-30 13:15:42', '微信钱包', '151', '2');
INSERT INTO `payment` VALUES ('349', 'P-201603300015', '2016-03-30 13:18:19', '微信钱包', '150', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  `userId` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统管理员', '1');
INSERT INTO `role` VALUES ('2', '微信平台客户', '2');

-- ----------------------------
-- Table structure for saleorder
-- ----------------------------
DROP TABLE IF EXISTS `saleorder`;
CREATE TABLE `saleorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(60) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `arriveTime` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` double(11,0) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `storeId` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `require` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order` (`userId`),
  KEY `FK_order_store` (`storeId`),
  CONSTRAINT `FK_order` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_order_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saleorder
-- ----------------------------
INSERT INTO `saleorder` VALUES ('70', 'D-201602200001', '2016-01-15 10:32:47', '11:00 - 11:30', '1', '72', '26', '1', '0', null);
INSERT INTO `saleorder` VALUES ('71', 'D-201602200002', '2016-01-20 22:58:02', '11:00 - 11:30', '1', '45', '29', '2', '0', null);
INSERT INTO `saleorder` VALUES ('72', 'D-201602200003', '2016-01-23 23:28:46', '11:00 - 11:30', '1', '25', '30', '3', '0', null);
INSERT INTO `saleorder` VALUES ('73', 'D-201602200004', '2016-02-20 23:35:54', '11:00 - 11:30', '1', '6', '31', '1', '0', null);
INSERT INTO `saleorder` VALUES ('74', 'D-201602200005', '2016-02-20 23:56:04', '11:00 - 11:30', '1', '15', '32', '1', '0', null);
INSERT INTO `saleorder` VALUES ('75', 'D-201602290006', '2016-02-17 20:38:46', '11:00 - 11:30', '1', '47', '33', '1', '0', null);
INSERT INTO `saleorder` VALUES ('76', 'D-201603010007', '2016-02-18 21:02:40', '11:00 - 11:30', '1', '35', '36', '3', '0', null);
INSERT INTO `saleorder` VALUES ('77', 'D-201603010008', '2016-02-24 21:18:49', '11:00 - 11:30', '1', '18', '37', '1', '0', null);
INSERT INTO `saleorder` VALUES ('78', 'D-201603010009', '2016-02-26 21:27:40', '11:00 - 11:30', '1', '8', '38', '1', '0', null);
INSERT INTO `saleorder` VALUES ('79', 'D-201603010010', '2016-02-27 21:30:57', '11:00 - 11:30', '1', '8', '39', '1', '0', null);
INSERT INTO `saleorder` VALUES ('80', 'D-201603010011', '2016-02-11 21:31:01', '11:00 - 11:30', '1', '67', '40', '2', '0', null);
INSERT INTO `saleorder` VALUES ('81', 'D-201603010012', '2016-03-01 21:31:02', '11:00 - 11:30', '1', '8', '41', '3', '1', null);
INSERT INTO `saleorder` VALUES ('82', 'D-201603010013', '2016-03-01 21:31:03', '11:00 - 11:30', '1', '18', '42', '3', '0', null);
INSERT INTO `saleorder` VALUES ('83', 'D-201603010014', '2015-07-24 21:31:47', '11:00 - 11:30', '0', '8', '43', '3', '0', null);
INSERT INTO `saleorder` VALUES ('84', 'D-201603010015', '2016-03-01 21:31:49', '11:00 - 11:30', '0', '8', '44', '3', '0', null);
INSERT INTO `saleorder` VALUES ('85', 'D-201603010016', '2016-03-01 21:31:50', '11:00 - 11:30', '1', '8', '45', '1', '0', null);
INSERT INTO `saleorder` VALUES ('86', 'D-201603010017', '2016-03-01 21:32:21', '11:00 - 11:30', '0', '8', '46', '1', '1', null);
INSERT INTO `saleorder` VALUES ('87', 'D-201603010018', '2016-03-01 21:33:29', '11:00 - 11:30', '0', '8', '47', '1', '0', null);
INSERT INTO `saleorder` VALUES ('88', 'D-201603010019', '2016-03-01 21:33:42', '11:00 - 11:30', '0', '8', '48', '1', '0', null);
INSERT INTO `saleorder` VALUES ('89', 'D-201603010020', '2016-03-01 21:33:43', '11:00 - 11:30', '0', '8', '49', '1', '2', null);
INSERT INTO `saleorder` VALUES ('139', 'D-201603220021', '2016-03-22 12:57:23', '10:00 - 10:30', '1', '26', '110', '1', '0', '多加饭');
INSERT INTO `saleorder` VALUES ('140', 'D-201603220022', '2016-03-22 13:02:37', '12:30 - 13:00', '1', '74', '110', '1', '0', '多加饭');
INSERT INTO `saleorder` VALUES ('141', 'D-201603220023', '2016-03-22 13:09:25', '10:30 - 11:00', '1', '22', '110', '1', '0', '多加饭');
INSERT INTO `saleorder` VALUES ('142', 'D-201603220024', '2016-03-22 13:51:26', '10:00 - 10:30', '1', '18', '110', '2', '0', null);
INSERT INTO `saleorder` VALUES ('143', 'D-201603230025', '2016-03-23 10:49:49', '10:00 - 10:30', '1', '14', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('144', 'D-201603230026', '2016-03-23 10:53:06', '10:00 - 10:30', '1', '13', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('145', 'D-201603230027', '2016-03-23 10:57:49', '10:00 - 10:30', '1', '8', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('146', 'D-201603280028', '2016-03-28 18:46:34', '10:00 - 10:30', '1', '26', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('147', 'D-201603280029', '2016-03-28 19:16:00', '10:00 - 10:30', '1', '16', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('148', 'D-201603280030', '2016-03-28 19:17:53', '10:30 - 11:00', '1', '62', '110', '2', '0', null);
INSERT INTO `saleorder` VALUES ('149', 'D-201603300031', '2016-03-30 10:13:40', '10:00 - 10:30', '1', '8', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('150', 'D-201603300032', '2016-03-30 13:14:28', '10:00 - 10:30', '1', '2', '110', '4', '0', null);
INSERT INTO `saleorder` VALUES ('151', 'D-201603300033', '2016-03-30 13:14:39', '10:00 - 10:30', '1', '2', '110', '4', '0', null);

-- ----------------------------
-- Table structure for saleorderitem
-- ----------------------------
DROP TABLE IF EXISTS `saleorderitem`;
CREATE TABLE `saleorderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orderitem` (`orderId`),
  KEY `FK_orderitem_food` (`foodId`),
  CONSTRAINT `FK_orderitem` FOREIGN KEY (`orderId`) REFERENCES `saleorder` (`id`),
  CONSTRAINT `FK_orderitem_food` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saleorderitem
-- ----------------------------
INSERT INTO `saleorderitem` VALUES ('69', '139', '4', '3', '8');
INSERT INTO `saleorderitem` VALUES ('70', '139', '12', '1', '2.5');
INSERT INTO `saleorderitem` VALUES ('71', '140', '4', '2', '8');
INSERT INTO `saleorderitem` VALUES ('72', '140', '3', '4', '6');
INSERT INTO `saleorderitem` VALUES ('73', '140', '2', '2', '10');
INSERT INTO `saleorderitem` VALUES ('74', '140', '1', '1', '12');
INSERT INTO `saleorderitem` VALUES ('75', '140', '12', '1', '2.5');
INSERT INTO `saleorderitem` VALUES ('76', '141', '4', '2', '8');
INSERT INTO `saleorderitem` VALUES ('77', '141', '3', '1', '6');
INSERT INTO `saleorderitem` VALUES ('78', '142', '4', '2', '8');
INSERT INTO `saleorderitem` VALUES ('79', '142', '12', '1', '2.5');
INSERT INTO `saleorderitem` VALUES ('80', '143', '4', '1', '8');
INSERT INTO `saleorderitem` VALUES ('81', '143', '3', '1', '6');
INSERT INTO `saleorderitem` VALUES ('82', '144', '11', '1', '13');
INSERT INTO `saleorderitem` VALUES ('83', '145', '4', '1', '8');
INSERT INTO `saleorderitem` VALUES ('84', '146', '6', '1', '8');
INSERT INTO `saleorderitem` VALUES ('85', '146', '10', '2', '8');
INSERT INTO `saleorderitem` VALUES ('86', '146', '12', '1', '2.5');
INSERT INTO `saleorderitem` VALUES ('92', '149', '4', '1', '8');
INSERT INTO `saleorderitem` VALUES ('93', '150', '12', '1', '2.5');
INSERT INTO `saleorderitem` VALUES ('94', '151', '12', '1', '2.5');

-- ----------------------------
-- Table structure for scope
-- ----------------------------
DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scopeName` varchar(30) DEFAULT NULL,
  `storeId` int(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scope
-- ----------------------------
INSERT INTO `scope` VALUES ('1', '华农', '1');
INSERT INTO `scope` VALUES ('2', '华工', '1');
INSERT INTO `scope` VALUES ('3', '光大银行', '2');
INSERT INTO `scope` VALUES ('4', '耀和广场', '2');
INSERT INTO `scope` VALUES ('5', '科贸中心', '2');
INSERT INTO `scope` VALUES ('6', '高科大厦', '2');
INSERT INTO `scope` VALUES ('7', '广金', '3');
INSERT INTO `scope` VALUES ('8', '广工', '3');
INSERT INTO `scope` VALUES ('9', '龙洞步行街', '3');
INSERT INTO `scope` VALUES ('10', '长福路', '4');
INSERT INTO `scope` VALUES ('11', '长湴', '4');
INSERT INTO `scope` VALUES ('12', '长兴', '4');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stock_food` (`foodId`),
  KEY `FK_stock_store` (`storeId`),
  CONSTRAINT `FK_stock_food` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`),
  CONSTRAINT `FK_stock_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `latitude` double(50,8) DEFAULT NULL,
  `longitude` double(50,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '五山店', '华农、华工、华师', '1', '23.15029398', '113.35263212');
INSERT INTO `store` VALUES ('2', '天河北店', '光大银行、耀和广场', '1', '23.14710904', '113.33484069');
INSERT INTO `store` VALUES ('3', '龙洞店', '广金、广工', '1', '23.20317307', '113.37380242');
INSERT INTO `store` VALUES ('4', '长湴店', '长兴、长湴、长福路', '1', '23.18466118', '113.35818547');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `roleId` int(20) NOT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13580432443', '广州市-天河-华南农业大学22栋401', '爱美食，爱外卖', '1', null, null);
INSERT INTO `user` VALUES ('10', 'custom', '123456', '13242215555', '广州市-天河-科韵路二街12号\r\n', '速度配送', '2', null, null);
INSERT INTO `user` VALUES ('22', 'custom2', '123456', '13580432443', '广州市-天河-华南农业大学2栋301', '没有', '2', null, null);
INSERT INTO `user` VALUES ('23', null, '123456', '13540432443', '广州市-天河-华南农业大学7栋101', '没有', '2', null, null);
INSERT INTO `user` VALUES ('24', null, 'e10adc3949ba59abbe56e057f20f883e', '13580432443', '广州市-天河-华南农业大学2栋302', '没有', '2', null, null);
INSERT INTO `user` VALUES ('26', null, '123456', '13922061261', '尚志苑', '大二学生\r\n1', '2', null, null);
INSERT INTO `user` VALUES ('28', null, null, '13580432443', '华山22栋401', 'a', '2', null, null);
INSERT INTO `user` VALUES ('29', null, null, '13580432443', '12', 'a', '2', null, null);
INSERT INTO `user` VALUES ('30', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('31', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('32', null, null, '13122331233', '2', null, '2', null, null);
INSERT INTO `user` VALUES ('33', null, null, '13122331233', 'sdfasdf', 'a', '2', null, null);
INSERT INTO `user` VALUES ('34', 'admin', '123', '13580432443', '华南农业大学', 'test', '2', null, null);
INSERT INTO `user` VALUES ('36', null, null, '13122331233', '1', 'a', '2', null, null);
INSERT INTO `user` VALUES ('37', null, null, '13580432443', '长湴西街二路23号', '没零钱', '2', null, null);
INSERT INTO `user` VALUES ('38', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('39', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('40', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('41', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('42', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('43', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('44', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('45', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('46', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('47', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('48', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('49', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('50', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('51', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('52', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('53', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('54', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('55', null, null, '13580432443', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('56', null, null, '13122331233', '1212', '中辣', '2', null, null);
INSERT INTO `user` VALUES ('57', null, null, '13122331233', '123123123', '多加饭', '2', null, null);
INSERT INTO `user` VALUES ('58', '1231', '1', '13122331233', '213123', null, '2', null, null);
INSERT INTO `user` VALUES ('60', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('61', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('62', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('63', null, null, '13122331233', null, null, '2', null, null);
INSERT INTO `user` VALUES ('64', null, null, '13122331233', 'asadsfasdfasdf', null, '2', null, null);
INSERT INTO `user` VALUES ('65', null, null, '13580432443', null, null, '2', null, null);
INSERT INTO `user` VALUES ('66', null, null, '13580432443', '123123', null, '2', null, null);
INSERT INTO `user` VALUES ('67', null, null, '13580432443', '广州华工信息软件有限公司E座4楼', '多加饭', '2', null, null);
INSERT INTO `user` VALUES ('68', null, null, '13144442222', 'test1', '没零钱', '2', null, null);
INSERT INTO `user` VALUES ('69', null, null, '13599881111', '12312', null, '2', null, null);
INSERT INTO `user` VALUES ('70', null, null, '13122331233', 'test_address', '没零钱', '2', null, null);
INSERT INTO `user` VALUES ('71', null, null, '13123123123', 'test3', null, '2', null, null);
INSERT INTO `user` VALUES ('72', null, null, '13584321234', '龙洞步行街2号', '多加饭', '2', null, null);
INSERT INTO `user` VALUES ('73', null, null, '13242114441', '121212', '不辣', '2', null, null);
INSERT INTO `user` VALUES ('74', null, null, '13580432342', '且无日期为', null, '2', null, null);
INSERT INTO `user` VALUES ('75', null, null, '13580432421', '123123', '没零钱', '2', null, null);
INSERT INTO `user` VALUES ('76', null, null, '13564645555', '季季红', '多加饭', '2', null, null);
INSERT INTO `user` VALUES ('77', null, null, '13564645555', '季季红', '多加饭', '2', null, null);
INSERT INTO `user` VALUES ('78', null, null, '13245612223', '天苑路3街二巷10号', null, '2', null, null);
INSERT INTO `user` VALUES ('79', null, null, '13421234444', 'test', null, '2', null, null);
INSERT INTO `user` VALUES ('80', null, null, '13222223333', 'ts', null, '2', null, null);
INSERT INTO `user` VALUES ('81', null, null, '13523232331', '光大银行tset12', null, '2', null, null);
INSERT INTO `user` VALUES ('82', null, null, '13580432443', '光大银行test', null, '2', null, null);
INSERT INTO `user` VALUES ('83', null, null, '13580432443', '长福路1', null, '2', null, null);
INSERT INTO `user` VALUES ('84', null, null, '13534321234', '光大银行123', null, '2', null, null);
INSERT INTO `user` VALUES ('85', null, null, '13233311144', '光大银行123', null, '2', null, null);
INSERT INTO `user` VALUES ('86', null, null, '13425516666', '光大银行23', null, '2', null, null);
INSERT INTO `user` VALUES ('89', null, null, '13580432443', '耀和广场阿阿不解释', null, '2', null, null);
INSERT INTO `user` VALUES ('110', null, null, '13822271495', '华', null, '2', 'ojrcJuNbcjZS9xPJEngSEslN3RJc', '长福路');
INSERT INTO `user` VALUES ('112', 'zhanwubin01', 'e10adc3949ba59abbe56e057f20f883e', '13243231112', 'test', 'tset2', '2', null, null);
