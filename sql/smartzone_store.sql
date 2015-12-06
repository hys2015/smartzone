# Host: localhost  (Version: 5.6.20)
# Date: 2015-12-06 22:35:40
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='收货地址';

#
# Data for table "recaddr"
#

INSERT INTO `recaddr` VALUES (1,'admin1','addr2','12366667888','2015-12-05 15:37:28','小明',b'1'),(2,'admin1','addr2','12366667888','2015-11-20 20:20:30','小红',b'0'),(3,'admin1','二号楼一单元三楼','13077771111','2015-12-05 18:48:00','吴达炯',b'1');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(20) DEFAULT NULL,
  `state` smallint(6) DEFAULT '0' COMMENT '未付款，已付款，已成交',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `paytime` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `rid` int(11) DEFAULT NULL,
  `price` double DEFAULT '0',
  `visible` bit(1) NOT NULL DEFAULT b'1',
  `trx_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_orders_username_idx` (`username`),
  KEY `FK_orders_rid` (`rid`),
  CONSTRAINT `FK_orders_rid` FOREIGN KEY (`rid`) REFERENCES `recaddr` (`rid`),
  CONSTRAINT `FK_orders_username` FOREIGN KEY (`username`) REFERENCES `smartzone`.`users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11127 DEFAULT CHARSET=utf8;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (2,'2015-11-26 16:13:42','admin1',0,'2015-11-26 16:13:42',NULL,1,18,b'0',NULL),(11119,'2015-11-26 16:03:16','admin1',0,'2015-11-26 16:06:40',NULL,1,40.3,b'0',NULL),(11120,'2015-11-26 16:19:28','admin1',1,'2015-12-05 16:55:30','2015-11-30 20:20:20',1,9,b'1',NULL),(11121,'2015-11-26 21:19:20','admin1',0,'2015-11-26 21:19:20',NULL,1,9,b'0',NULL),(11122,'2015-11-26 21:32:44','admin1',0,'2015-11-26 21:32:44',NULL,1,9,b'0',NULL),(11123,'2015-11-27 19:08:56','admin1',0,'2015-11-27 19:08:56',NULL,1,6.2,b'1',NULL),(11124,'2015-11-27 20:31:08','admin1',0,'2015-11-27 20:31:08',NULL,1,600,b'0',NULL),(11125,'2015-12-05 15:37:28','admin1',1,'2015-12-05 15:37:28','2015-12-05 19:47:48',1,2.2,b'1','915226219674202I'),(11126,'2015-12-05 18:48:00','admin1',0,'2015-12-05 18:48:00',NULL,3,52.5,b'1',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "shop_imgs"
#

INSERT INTO `shop_imgs` VALUES (8,NULL,'/SmartZone/img/store/40420151126224955.jpg',NULL,'蓝天白云'),(10,NULL,'/SmartZone/img/store/52920151202165906.jpg',NULL,'金太阳'),(11,4,'/SmartZone/img/store/59820151202170019.jpg',0,'金太阳'),(12,5,'/SmartZone/img/store/2920151202170745.jpg',0,'万福超市');

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

INSERT INTO `shop_tag` VALUES (1,5),(2,4),(2,6);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商家实体';

#
# Data for table "shops"
#

INSERT INTO `shops` VALUES (4,'金太阳超市','admin1','小区北门路南200米','11133332222','wechat',NULL,'','金太阳',NULL,b'1'),(5,'万福超市','admin1','小区北门东50米','13011112222','weixin001',NULL,'12345678','阿拉啦啦啦啦啦',NULL,b'1'),(6,'shop4','admin1','addr','11133332222','wechatsmartzone',NULL,'','小小的世界大大的梦想',NULL,b'0'),(7,'22222222','admin1','22222','222222','222',NULL,'22','',NULL,b'0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,5,'食品'),(2,5,'饮料'),(4,5,'零食'),(5,4,'饮料'),(6,6,'维修');

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
  `soldcount` int(11) DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `FK_goods_sid_idx` (`cid`),
  CONSTRAINT `FK_goods_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (1,'哇哈哈','<p>详细信息</p>',40.00,20.00,20,1,b'1','2015-11-29 18:18:18',0),(2,'可口可乐一箱','<p>可口可乐一箱</p>',89.00,40.30,10,2,b'1','2015-11-29 18:18:20',0),(3,'好吃点饼干','<p>相信信息</p>',10.00,9.00,100,1,b'0','2015-11-29 18:18:30',0),(13,'旺旺小小酥','<p>1000000</p>',3.30,2.20,7,1,b'1','2015-11-29 18:18:50',3),(21,'益达','<p>嘿，你的益达！</p><p>是你的益达！</p>',10.00,10.00,30,2,b'1','2015-11-27 16:07:05',0),(22,'可口可乐一罐','<p>可口可乐!</p>',3.00,2.70,30,5,b'1','2015-12-02 17:59:35',0),(23,'光明牛奶 250ml*6 一箱','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151204/1449216923073015196.jpg\" title=\"1449216923073015196.jpg\" alt=\"mslaxq1.jpg\"/></p>',35.50,33.50,30,2,b'1','2015-12-04 16:15:46',0);

#
# Structure for table "item"
#

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL COMMENT '留言',
  PRIMARY KEY (`iid`),
  KEY `FK_item_oid` (`oid`),
  KEY `FK_item_gid` (`gid`),
  CONSTRAINT `FK_item_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `FK_item_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "item"
#

INSERT INTO `item` VALUES (1,2,1,11119,NULL),(2,3,2,2,NULL),(3,3,1,11120,NULL),(4,3,1,11121,NULL),(5,3,1,11122,NULL),(6,13,1,11123,NULL),(7,22,2,11123,NULL),(8,1,30,11124,NULL),(9,13,1,11125,NULL),(10,21,1,11126,NULL),(11,2,1,11126,NULL),(12,13,1,11126,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "comments"
#

INSERT INTO `comments` VALUES (1,'<p>abce</p>','admin1',3,'2015-11-26 21:44:53'),(2,'<p>abce</p>','admin1',3,'2015-11-26 21:47:00'),(3,'<p>好吃又划算，送货上门速度也挺快！</p>','admin1',13,'2015-12-05 17:01:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "good_imgs"
#

INSERT INTO `good_imgs` VALUES (12,1,'/SmartZone/img/store/5/4220151127133409.jpg',0),(13,2,'/SmartZone/img/store/5/25320151127160208.jpg',0),(14,13,'/SmartZone/img/store/5/52920151127160244.jpg',0),(15,21,'/SmartZone/img/store/5/84720151127160626.jpg',0),(16,22,'/SmartZone/img/store/4/63420151127190655.jpg',0),(17,23,'/SmartZone/img/store/5/27520151204161331.jpg',0),(18,23,'/SmartZone/img/store/5/31820151204161331.jpg',1),(19,23,'/SmartZone/img/store/5/5420151204161331.jpg',2);

#
# Structure for table "bills"
#

DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(2) DEFAULT '0' COMMENT '0已支付，1已发货，2已送达',
  `price` double(5,2) DEFAULT '0.00',
  PRIMARY KEY (`bid`),
  KEY `FK_bill_iid` (`iid`),
  KEY `FK_bill_rid` (`rid`),
  KEY `FK_bill_sid` (`sid`),
  CONSTRAINT `FK_bill_iid` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  CONSTRAINT `FK_bill_rid` FOREIGN KEY (`rid`) REFERENCES `recaddr` (`rid`),
  CONSTRAINT `FK_bill_sid` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "bills"
#

INSERT INTO `bills` VALUES (2,9,5,1,'2015-12-05 19:35:53','2015-12-05 19:35:53',2,3.30),(3,9,5,1,'2015-12-05 19:46:33','2015-12-05 19:46:33',0,3.30),(4,9,5,1,'2015-12-05 19:47:48','2015-12-05 19:47:48',0,3.30);

#
# Structure for table "tags"
#

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "tags"
#

INSERT INTO `tags` VALUES (1,'超市'),(2,'小超市');

#
# Trigger "tagValibleTrigger"
#

DROP TRIGGER IF EXISTS `tagValibleTrigger`;
CREATE DEFINER='root'@'localhost' TRIGGER `tagValibleTrigger` AFTER UPDATE ON `shop_tag`
  FOR EACH ROW begin
delete from tags where tags.tid not in(
select t.tid from 
(select tags.tid tid from tags join shop_tag on tags.tid = shop_tag.tid) as t);
end;

#
# Trigger "tagValibleTriggerOnDel"
#

DROP TRIGGER IF EXISTS `tagValibleTriggerOnDel`;
CREATE DEFINER='root'@'localhost' TRIGGER `tagValibleTriggerOnDel` AFTER DELETE ON `shop_tag`
  FOR EACH ROW begin
delete from tags where tags.tid not in(
select t.tid from 
(select tags.tid tid from tags join shop_tag on tags.tid = shop_tag.tid) as t);
end;
