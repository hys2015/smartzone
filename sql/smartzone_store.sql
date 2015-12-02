# Host: localhost  (Version: 5.6.20)
# Date: 2015-11-27 18:02:08
# Generator: MySQL-Front 5.3  (Build 4.249)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "recaddr"
#

DROP TABLE IF EXISTS `recaddr`;
CREATE TABLE `recaddr` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `lastusetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `visible` bit(1) DEFAULT b'1',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='收货地址';

#
# Data for table "recaddr"
#

INSERT INTO `recaddr` VALUES (1,'admin1','addr2','12366667888','2015-11-26 21:32:44','小明',b'1'),(2,'admin1','addr2','12366667888','2015-11-20 20:20:30','小红',b'0'),(3,'admin1','二号楼一单元三楼','13077771111','2015-11-25 21:14:10','吴达炯',b'1');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(20) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL COMMENT '留言应该放在item中，此处不用了',
  `state` smallint(6) DEFAULT '0' COMMENT '未付款，已付款，已成交',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `paytime` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `rid` int(11) DEFAULT NULL,
  `price` double DEFAULT '0',
  `visible` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`oid`),
  KEY `FK_orders_username_idx` (`username`),
  KEY `FK_orders_rid` (`rid`),
  CONSTRAINT `FK_orders_rid` FOREIGN KEY (`rid`) REFERENCES `recaddr` (`rid`),
  CONSTRAINT `FK_orders_username` FOREIGN KEY (`username`) REFERENCES `smartzone`.`users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11123 DEFAULT CHARSET=utf8;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (2,'2015-11-26 16:13:42','admin1',NULL,0,'2015-11-26 16:13:42',NULL,1,18,b'1'),(11119,'2015-11-26 16:03:16','admin1',NULL,0,'2015-11-26 16:06:40',NULL,1,40.3,b'1'),(11120,'2015-11-26 16:19:28','admin1',NULL,1,'2015-11-26 16:19:28',NULL,1,9,b'1'),(11121,'2015-11-26 21:19:20','admin1',NULL,0,'2015-11-26 21:19:20',NULL,1,9,b'1'),(11122,'2015-11-26 21:32:44','admin1',NULL,0,'2015-11-26 21:32:44',NULL,1,9,b'1');

#
# Structure for table "shop_imgs"
#

DROP TABLE IF EXISTS `shop_imgs`;
CREATE TABLE `shop_imgs` (
  `siid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `img_url` varchar(1000) DEFAULT NULL,
  `idx` int(11) DEFAULT '0',
  `brief` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`siid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "shop_imgs"
#

INSERT INTO `shop_imgs` VALUES (8,NULL,'/SmartZone/img/store/40420151126224955.jpg',NULL,'蓝天白云'),(9,5,'/SmartZone/img/store/96120151126225224.jpg',0,'小店新开张');

#
# Structure for table "shop_tag"
#

DROP TABLE IF EXISTS `shop_tag`;
CREATE TABLE `shop_tag` (
  `tid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "shop_tag"
#

INSERT INTO `shop_tag` VALUES (1,5),(2,5),(3,5),(4,5);

#
# Structure for table "shops"
#

DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家',
  `sname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `wechat` varchar(45) DEFAULT NULL,
  `wechat2d` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `represent` varchar(200) DEFAULT NULL COMMENT '店内简介',
  `checked` bit(1) DEFAULT b'0' COMMENT '是否通过审核',
  `visible` bit(1) DEFAULT b'0',
  PRIMARY KEY (`sid`),
  KEY `FK_shops_username_idx` (`username`),
  CONSTRAINT `FK_shop_username` FOREIGN KEY (`username`) REFERENCES `smartzone`.`users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商家实体';

#
# Data for table "shops"
#

INSERT INTO `shops` VALUES (4,'shop6','admin1','addr','11133332222','wechat',NULL,'','',NULL,b'0'),(5,'店铺1000号','admin1','地址1234','13011112222','weixin001',NULL,'453399765','阿拉啦啦啦啦啦',NULL,b'1'),(6,'shop4','admin1','addr','11133332222','wechatsmartzone',NULL,'','小小的世界大大的梦想',NULL,b'0');

#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `cname` varchar(45) DEFAULT NULL COMMENT '种类名',
  PRIMARY KEY (`cid`),
  KEY `FK_category_sid_idx` (`sid`),
  CONSTRAINT `FK_category_sid` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,5,'食品'),(2,5,'饮料'),(4,5,'零食');

#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(45) DEFAULT NULL,
  `detail` text,
  `price` double(10,2) DEFAULT NULL,
  `nowprice` double(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `visible` bit(1) DEFAULT b'0',
  `onshelftime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `FK_goods_sid_idx` (`cid`),
  CONSTRAINT `FK_goods_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (1,'哇哈哈','<p>详细信息</p>',40.00,20.00,20,1,b'1','2015-11-29 18:18:18'),(2,'可口可乐一箱','<p>可口可乐一箱</p>',89.00,40.30,10,2,b'1','2015-11-29 18:18:20'),(3,'好吃点饼干','<p>相信信息</p>',10.00,9.00,100,1,b'0','2015-11-29 18:18:30'),(13,'旺旺小小酥','<p>1000000</p>',3.30,2.20,11,1,b'1','2015-11-29 18:18:50'),(21,'益达','<p>嘿，你的益达！</p><p>是你的益达！</p>',10.00,10.00,30,2,b'1','2015-11-27 16:07:05');

#
# Structure for table "item"
#

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `FK_item_oid` (`oid`),
  KEY `FK_item_gid` (`gid`),
  CONSTRAINT `FK_item_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `FK_item_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "item"
#

INSERT INTO `item` VALUES (1,2,1,11119),(2,3,2,2),(3,3,1,11120),(4,3,1,11121),(5,3,1,11122);

#
# Structure for table "order_items"
#

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `oid` int(11) NOT NULL DEFAULT '0',
  `iid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`,`iid`),
  KEY `FK_orderitem_iid` (`iid`),
  CONSTRAINT `FK_orderitem_iid` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  CONSTRAINT `FK_orderitem_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order_items"
#


#
# Structure for table "comments"
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `FK_comments_username_idx` (`username`),
  KEY `FK_comments_gid_idx` (`gid`),
  CONSTRAINT `FK_comments_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comments_username` FOREIGN KEY (`username`) REFERENCES `smartzone`.`users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "comments"
#

INSERT INTO `comments` VALUES (1,'<p>abce</p>','admin1',3,'2015-11-26 21:44:53'),(2,'<p>abce</p>','admin1',3,'2015-11-26 21:47:00');

#
# Structure for table "good_imgs"
#

DROP TABLE IF EXISTS `good_imgs`;
CREATE TABLE `good_imgs` (
  `giid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `idx` int(11) DEFAULT '0',
  PRIMARY KEY (`giid`),
  KEY `FK_goodimg_gid` (`gid`),
  CONSTRAINT `FK_goodimg_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "good_imgs"
#

INSERT INTO `good_imgs` VALUES (12,1,'/SmartZone/img/store/5/4220151127133409.jpg',0),(13,2,'/SmartZone/img/store/5/25320151127160208.jpg',0),(14,13,'/SmartZone/img/store/5/52920151127160244.jpg',0),(15,21,'/SmartZone/img/store/5/84720151127160626.jpg',0);

#
# Structure for table "tags"
#

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "tags"
#

INSERT INTO `tags` VALUES (1,'饭店'),(2,'电影院'),(3,'小商店'),(4,'abcd');
