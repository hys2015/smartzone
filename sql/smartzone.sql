# Host: localhost  (Version: 5.6.20)
# Date: 2015-12-04 17:48:21
# Generator: MySQL-Front 5.3  (Build 4.249)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "companys"
#

DROP TABLE IF EXISTS `companys`;
CREATE TABLE `companys` (
  `cno` int(5) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT NULL,
  `caddr` varchar(50) DEFAULT NULL,
  `cphone` varchar(50) DEFAULT NULL,
  `cemail` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "companys"
#

INSERT INTO `companys` VALUES (1,'company1','caddr1','12345678901','eamail@xxx.com'),(2,'company2','caddr1','12345678902','eamail@xxx.com'),(3,'company3','caddr1','12345678903','eamail@xxx.com'),(4,'company4','caddr1','12345678904','eamail@xxx.com');

#
# Structure for table "communities"
#

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `communityno` int(5) NOT NULL AUTO_INCREMENT,
  `communityname` varchar(50) DEFAULT NULL,
  `communityaddr` varchar(50) DEFAULT NULL,
  `cno` int(5) DEFAULT NULL,
  PRIMARY KEY (`communityno`),
  KEY `fk_cno` (`cno`),
  CONSTRAINT `fk_cno` FOREIGN KEY (`cno`) REFERENCES `companys` (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "communities"
#

INSERT INTO `communities` VALUES (1,'1号小区','addr1',1),(2,'2号小区','addr1',2),(3,'3号小区','addr1',3);

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminName` varchar(20) NOT NULL DEFAULT '',
  `AdminPwd` char(32) NOT NULL DEFAULT '',
  `communityno` int(5) DEFAULT NULL,
  PRIMARY KEY (`AdminName`),
  KEY `fk_communityno` (`communityno`),
  CONSTRAINT `fk_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES ('admin1','1234',1),('admin2','1234',2),('admin3','1234',3),('admin4','12345',1);

#
# Structure for table "bbs_board"
#

DROP TABLE IF EXISTS `bbs_board`;
CREATE TABLE `bbs_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_name` char(20) NOT NULL,
  `communityno` int(5) DEFAULT NULL,
  `post_count` int(11) DEFAULT '0',
  `represent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  KEY `communityno` (`communityno`),
  CONSTRAINT `bbs_board_ibfk_1` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='bbs';

#
# Data for table "bbs_board"
#

INSERT INTO `bbs_board` VALUES (1,'二手交易',1,11,'不用的东西都可以放在这里进行交易'),(2,'拼车出行',1,2,'拼车出行！'),(3,'谈天说地',1,1,'来和邻居聊聊吧！'),(5,'新版块',1,1,'新版块描述'),(6,'我来了',1,NULL,'呵呵');

#
# Structure for table "feedbacks"
#

DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks` (
  `fno` int(11) NOT NULL AUTO_INCREMENT,
  `ftitle` varchar(50) DEFAULT NULL,
  `fauthor` varchar(20) DEFAULT NULL,
  `ftime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fcontent` varchar(1000) DEFAULT NULL,
  `communityno` int(5) DEFAULT NULL,
  PRIMARY KEY (`fno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "feedbacks"
#

INSERT INTO `feedbacks` VALUES (1,'1号楼玻璃碎了，请予以解决','user1','2015-10-23 21:20:21','<p>如题</p>',1),(2,'出问题了！','user1','2015-10-25 13:30:03','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151110/1447132322350046922.jpg\" title=\"1447132322350046922.jpg\" alt=\"1.jpg\" width=\"228\" height=\"173\" style=\"width: 228px; height: 173px;\"/>房子冒烟了</p>',1),(3,'又来一遍的测试','user1','2015-10-23 23:49:02','<p>我是测试别读了</p>',1),(4,'2号小区留言测试','user2','2015-10-23 23:53:26','<p>测试测试</p>',2),(7,'删除测试','user1','2015-10-24 10:04:09','<p>删除删除</p>',1),(12,'级联删除 编辑测试','user1','2015-10-25 12:34:32','<p>测试测试</p>',1),(13,'feedback通知测试','user1','2015-10-26 10:47:05','<p>测试</p>',1),(14,'留言','user1','2015-10-26 23:01:20','<p>新留言</p>',1),(16,'112','','2015-11-27 20:23:02','<p>111</p>',NULL),(17,'121','','2015-11-27 20:23:24','<p>122</p>',NULL);

#
# Structure for table "notice_series"
#

DROP TABLE IF EXISTS `notice_series`;
CREATE TABLE `notice_series` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_name` varchar(20) NOT NULL,
  `communityno` int(5) DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `s_name` (`series_name`),
  KEY `FK_series_communityno` (`communityno`),
  CONSTRAINT `FK_series_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "notice_series"
#

INSERT INTO `notice_series` VALUES (1,'小区新闻1',1),(2,'活动天地',1),(3,'通知公告',1),(4,'失物招领',1),(9,'新版块',1);

#
# Structure for table "notices"
#

DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `tid` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `valiable` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 true 0 false',
  `priority` int(1) unsigned NOT NULL DEFAULT '5',
  `communityno` int(5) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `readcount` int(5) NOT NULL DEFAULT '0',
  `series_id` int(11) DEFAULT NULL,
  `idx` int(5) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fk_notices_communityno` (`communityno`),
  KEY `FK_notice_series_id` (`series_id`),
  CONSTRAINT `FK_notice_series_id` FOREIGN KEY (`series_id`) REFERENCES `notice_series` (`series_id`),
  CONSTRAINT `fk_notices_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "notices"
#

INSERT INTO `notices` VALUES (2,'新公告','admin1','<p>abcdert</p>',1,5,1,'2015-10-21 22:30:38','2015-11-08 10:38:09',0,1,1),(3,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:24','2015-11-30 11:05:50',0,2,0),(4,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:37','2015-11-06 17:08:01',0,3,0),(5,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:43','2015-11-06 17:08:01',1,4,0),(6,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:54','2015-11-08 10:38:09',1,1,2),(7,'公告测试','admin1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151105/1446690076740093086.jpg\" title=\"1446690076740093086.jpg\" alt=\"78020151030004845.jpg\" width=\"361\" height=\"75\" style=\"width: 361px; height: 75px;\"/>公告测试</p>',1,5,1,'2015-10-24 10:06:06','2015-11-30 11:05:52',4,2,1),(8,'图片公告123','admin1','<p>我是图片如下</p><p></p><p>图片测试已修改</p>',1,5,1,'2015-10-24 10:07:11','2015-11-06 17:08:58',10,3,1),(9,'ueditor  测试','admin1','<p>测试ceshi</p>',1,5,1,'2015-10-26 14:18:52','2015-11-06 17:09:02',7,4,1),(10,'新的权限控制','admin1','<p>权限编辑一下<br/></p>',1,5,1,'2015-10-26 22:37:48','2015-11-08 10:38:09',26,1,3),(11,'新公告','admin1','<p>公告<br/></p>',1,5,1,'2015-11-05 16:34:18','2015-11-30 11:05:53',2,2,2),(12,'活动天地1234','admin1','<p>活动天地</p>',0,5,1,'2015-11-08 10:32:17','2015-11-08 10:38:09',2,1,0),(17,'活动ssss1111','admin1','<p>活动啊啊啊啊<br/></p>',1,5,1,'2015-11-08 12:01:03','2015-11-08 12:01:55',4,1,4),(18,'钥匙一串','admin1','<p>要是</p>',1,5,1,'2015-11-08 13:13:15','2015-11-30 11:05:53',2,2,3),(20,'测试','admin1','<p>网上说<br/></p>',1,5,1,'2015-11-27 20:01:36','2015-11-27 20:01:36',0,2,4),(21,'11','admin1','<p>11</p>',1,5,1,'2015-11-27 20:04:12','2015-12-01 11:49:26',1,4,2),(22,'11','admin1','<p>11</p>',1,5,1,'2015-11-27 20:04:30','2015-11-27 20:04:30',0,1,5),(23,'11','admin1','<p>11</p>',1,10,1,'2015-11-27 20:04:40','2015-11-30 11:05:57',0,2,5),(24,'新闻1-1','admin1','<p>ssss</p>',1,5,1,'2015-11-30 15:33:34','2015-11-30 15:33:34',1,1,6);

#
# Structure for table "repairs"
#

DROP TABLE IF EXISTS `repairs`;
CREATE TABLE `repairs` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rtitle` varchar(50) NOT NULL DEFAULT 'rtitle',
  `rtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `raddr` varchar(20) DEFAULT NULL,
  `rphone` varchar(15) DEFAULT NULL,
  `rcontent` varchar(1000) DEFAULT NULL,
  `ruser` varchar(25) DEFAULT NULL,
  `rstate` int(2) DEFAULT '1' COMMENT '1提交2审核3派出4完成',
  `communityno` int(5) DEFAULT NULL,
  `rlastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rlastupdator_id` varchar(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`rno`),
  KEY `fk_repairs_communityno` (`communityno`),
  KEY `fk_repairs_adminname` (`rlastupdator_id`),
  CONSTRAINT `fk_repairs_adminname` FOREIGN KEY (`rlastupdator_id`) REFERENCES `admin` (`AdminName`),
  CONSTRAINT `fk_repairs_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='报修项目表';

#
# Data for table "repairs"
#

INSERT INTO `repairs` VALUES (3,'简述2015年10月21日19:47:35','2015-10-21 00:00:00','addr123','12333334566','<p>我家水表坏了，快来修一下</p>','user1',2,1,'2015-10-21 19:48:15','admin1'),(4,'报修单编辑测试 已修改','2015-10-25 10:10:10','7号楼7楼701','13011113234','<p>测试</p><p><br/></p><p>已修改</p>','user1',1,1,'2015-10-26 10:35:38',NULL),(7,'Notification测试','2015-10-26 10:48:37','6号楼101','13312341234','<p>测试<br/></p>','user1',1,1,'2015-10-26 10:48:37',NULL),(8,'新报修','2015-10-26 23:00:15','地址1234','13312341234','<p>7788</p>','user1',1,1,'2015-10-26 23:00:15',NULL),(9,'通知测试','2015-10-26 23:07:11','addr1','12312341234','<p>通知测试</p>','user1',1,1,'2015-10-26 23:07:11',NULL);

#
# Structure for table "replies"
#

DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies` (
  `reno` int(11) NOT NULL AUTO_INCREMENT,
  `reauthor` varchar(50) DEFAULT NULL,
  `retime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recontent` varchar(1000) DEFAULT NULL,
  `fno` int(11) DEFAULT '0',
  `idx` int(5) DEFAULT '0',
  PRIMARY KEY (`reno`),
  KEY `fk_replies_fno` (`fno`),
  CONSTRAINT `fk_replies_fno` FOREIGN KEY (`fno`) REFERENCES `feedbacks` (`fno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "replies"
#

INSERT INTO `replies` VALUES (1,'user1','2015-10-23 21:23:17','<p>1单元5楼南边的窗户</p>',1,0),(2,'admin1','2015-10-23 21:24:57','<p>好的，我们正在派人修理</p>',1,1),(3,'admin1','2015-10-23 23:49:45','<p>请您不要开玩笑好吗</p>',2,0),(12,'user1','2015-10-25 13:57:19','<p>我是测试已修</p>',2,1),(14,'admin1','2015-11-18 21:23:28','<p>哈哈哈哈</p>',13,0);

#
# Structure for table "root"
#

DROP TABLE IF EXISTS `root`;
CREATE TABLE `root` (
  `id` varchar(11) NOT NULL DEFAULT '',
  `pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超级管理员';

#
# Data for table "root"
#

INSERT INTO `root` VALUES ('root','root');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `userpwd` varchar(20) DEFAULT NULL,
  `useraddr` varchar(50) DEFAULT NULL,
  `userphone` varchar(15) DEFAULT NULL,
  `communityno` int(5) DEFAULT NULL,
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_user_communityno` (`communityno`),
  CONSTRAINT `fk_user_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "users"
#

INSERT INTO `users` VALUES ('admin1','1234','sea','6666666',1,b'1','/SmartZone/upload/img/1.jpg'),('user1','1234','addr1 modsss','12312312311',1,b'0','/SmartZone/upload/img/22720151202180426.jpg'),('user2','12345','addr1','12312312311',1,b'0','/SmartZone/upload/img/78820151102164642.jpg'),('user3','12345','addr1','12312312311',3,b'0','/SmartZone/upload/img/1.jpg');

#
# Structure for table "condofee"
#

DROP TABLE IF EXISTS `condofee`;
CREATE TABLE `condofee` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `fee` double DEFAULT '0',
  PRIMARY KEY (`username`),
  CONSTRAINT `FK_condofee_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "condofee"
#

INSERT INTO `condofee` VALUES ('admin1',100),('user1',10),('user2',1444);

#
# Structure for table "condobill"
#

DROP TABLE IF EXISTS `condobill`;
CREATE TABLE `condobill` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `begintime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ispayed` bit(1) DEFAULT b'0',
  `price` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`bid`),
  KEY `FK_condobill_username` (`username`),
  CONSTRAINT `FK_condobill_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "condobill"
#

INSERT INTO `condobill` VALUES (1,'admin1','2015-10-29','2016-04-29','2015-11-15 10:06:12',b'1',1000.00),(2,'admin1','2015-11-15','2016-03-15','2015-11-15 11:13:07',b'0',300.00),(3,'admin1','2015-10-31','2016-01-31','2015-11-27 20:14:44',b'0',10.00);

#
# Structure for table "carports"
#

DROP TABLE IF EXISTS `carports`;
CREATE TABLE `carports` (
  `carport_id` int(11) NOT NULL AUTO_INCREMENT,
  `fee` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `communityno` int(5) DEFAULT NULL,
  PRIMARY KEY (`carport_id`),
  KEY `FK_carport_username` (`username`),
  KEY `FK_carport_commno` (`communityno`),
  CONSTRAINT `FK_carport_commno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`),
  CONSTRAINT `FK_carport_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "carports"
#

INSERT INTO `carports` VALUES (1,55,'user1',1),(2,50,'admin1',1),(3,16,NULL,1),(4,30,'admin1',1),(5,66666,NULL,1),(6,100,NULL,1),(7,NULL,NULL,1),(8,NULL,NULL,1),(9,NULL,NULL,1),(10,NULL,NULL,1),(11,99,'admin1',1),(12,60,NULL,1),(13,48,NULL,1),(14,2,NULL,1),(15,2,NULL,1);

#
# Structure for table "carbill"
#

DROP TABLE IF EXISTS `carbill`;
CREATE TABLE `carbill` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `carport_id` int(10) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ispayed` bit(1) DEFAULT b'0',
  `begintime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `communityno` int(5) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `FK_carbill_username` (`username`),
  KEY `FK_carbill_carportId` (`carport_id`),
  KEY `FK_carbill_communityno` (`communityno`),
  CONSTRAINT `FK_carbill_carportId` FOREIGN KEY (`carport_id`) REFERENCES `carports` (`carport_id`),
  CONSTRAINT `FK_carbill_communityno` FOREIGN KEY (`communityno`) REFERENCES `communities` (`communityno`),
  CONSTRAINT `FK_carbill_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "carbill"
#

INSERT INTO `carbill` VALUES (1,1,'admin1','2015-11-09 21:11:33',b'0','2015-10-07','2015-11-07',600,1),(2,2,'admin1','2015-11-10 11:05:42',b'0','2015-11-10','2016-01-10',100,1),(3,11,'admin1','2015-11-11 17:05:06',b'1','2015-11-11','2015-12-11',99,1),(4,1,'user1','2015-11-15 13:20:07',b'1','2015-11-05','2016-09-05',550,1),(5,2,'admin1','2015-11-27 20:10:00',b'0','2015-10-29','2015-12-29',100,1),(6,2,'admin1','2015-11-27 20:10:18',b'0','2015-10-29','2015-12-29',100,1),(7,2,'admin1','2015-11-27 20:10:35',b'0','2015-10-29','2015-12-29',100,1),(8,2,'admin1','2015-11-27 20:10:54',b'0','2015-10-29','2015-12-29',100,1),(9,2,'admin1','2015-11-27 20:11:20',b'0','2015-09-30','2015-11-30',100,1),(10,2,'admin1','2015-11-27 20:11:32',b'0','2015-09-30','2015-11-30',100,1);

#
# Structure for table "bbs_post"
#

DROP TABLE IF EXISTS `bbs_post`;
CREATE TABLE `bbs_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `post_title` char(20) NOT NULL,
  `post_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `post_replytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_readtimes` int(11) NOT NULL,
  `post_content` varchar(1000) DEFAULT NULL,
  `post_replytimes` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `FK_Relationship_4` (`user_id`),
  KEY `FK_Relationship_5` (`board_id`),
  CONSTRAINT `FK_post_boardid` FOREIGN KEY (`board_id`) REFERENCES `bbs_board` (`board_id`),
  CONSTRAINT `FK_post_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='bbs';

#
# Data for table "bbs_post"
#

INSERT INTO `bbs_post` VALUES (4,'user1',1,'post1','2015-11-02 16:38:28','2015-11-08 19:15:26','2015-11-05 10:03:42',43,'<p>我是ss测啊</p>',10),(12,'user1',1,'标题短，内容长','2015-11-03 16:56:36','2015-11-08 22:13:42','2015-11-03 16:56:36',3,'<p>内容偿还仓促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常</p>',1),(13,'user1',1,'内容带图片','2015-11-03 17:03:06','2015-11-27 20:29:19','2015-11-27 20:04:38',26,'<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151103/1446541362747070417.jpg\" title=\"1446541362747070417.jpg\" alt=\"3.jpg\" width=\"272\" height=\"185\" style=\"width: 272px; height: 185px;\"/>dabd</p>',5),(15,'user1',1,'删除','2015-11-04 23:06:28','2015-11-27 20:01:24','2015-11-04 23:06:27',3,'<p>shanchu</p>',1),(16,'admin1',1,'新帖子','2015-11-05 10:02:48','2015-11-08 15:26:38','2015-11-05 10:02:48',1,'<p>新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子</p>',1),(17,'admin1',1,'新帖子','2015-11-05 10:03:04','2015-11-05 10:03:04','2015-11-05 10:03:04',0,'<p>翻页了该</p>',1),(18,'admin1',1,'分页','2015-11-05 10:03:19','2015-11-27 20:04:52','2015-11-05 12:37:55',9,'<p>分页</p>',1),(19,'admin1',5,'新标题','2015-11-08 19:15:03','2015-11-27 19:55:18','2015-11-08 19:15:03',13,'<p>标题！<br/></p>',1),(21,'admin1',2,'I\'m coming','2015-11-27 19:59:09','2015-11-27 20:00:04','2015-11-27 19:59:46',4,'<p>What are you looking for?</p>',2),(22,'admin1',3,'13说到底','2015-11-27 20:01:16','2015-11-27 20:01:15','2015-11-27 20:01:15',0,'<p>大神</p>',1),(23,'admin1',1,'213','2015-11-27 20:05:06','2015-11-27 20:29:28','2015-11-27 20:27:33',4,'<p>大声道</p>',2),(27,'admin1',1,'22121','2015-11-27 20:27:57','2015-11-27 20:29:10','2015-11-27 20:27:56',1,NULL,1),(35,'admin1',1,'标题','2015-11-30 16:03:59','2015-11-30 16:03:59','2015-11-30 16:03:59',0,'<p>标题测试<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0015.gif\"/></p>',1),(36,'admin1',1,'新帖子测试','2015-11-30 16:21:45','2015-12-01 12:08:04','2015-11-30 16:29:55',12,'<p>测试</p>',2),(37,'admin1',2,'我试试能删除','2015-12-01 12:08:24','2015-12-01 12:08:24','2015-12-01 12:08:24',2,'<p>不鞥</p>',1);

#
# Structure for table "bbs_reply"
#

DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `reply_content` varchar(200) DEFAULT NULL,
  `reply_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idx` int(11) DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `FK_reply_postid` (`post_id`),
  KEY `FK_reply_userid` (`user_id`),
  CONSTRAINT `FK_bbsreply_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_reply_postid` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`post_id`),
  CONSTRAINT `FK_reply_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`),
  CONSTRAINT `bbs_reply_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

#
# Data for table "bbs_reply"
#

INSERT INTO `bbs_reply` VALUES (7,4,'user1','<p>我是测试啊</p>','2015-11-02 16:38:27',0),(8,4,'user1','<p>回复一下</p>','2015-11-02 16:44:07',1),(9,4,'user1','<p>板凳!</p>','2015-11-02 16:44:17',2),(10,4,'user2','<p>地板</p>','2015-11-02 16:48:29',3),(11,4,'user2','<p>&nbsp;长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试</p>','2015-11-02 17:10:33',4),(12,4,'user2','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151102/1446455447174071030.jpg\" title=\"1446455447174071030.jpg\" alt=\"3.jpg\" width=\"828\" height=\"364\" style=\"width: 828px; height: 364px;\"/></p>','2015-11-02 17:11:05',5),(24,4,'user1','<p>回复置顶测试</p>','2015-11-03 15:58:49',6),(25,4,'user1','<p>回复数量测试</p>','2015-11-03 16:02:28',7),(26,4,'user1','<p>trigger测试</p>','2015-11-03 16:27:40',8),(27,12,'user1','<p>内容偿还仓促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常</p>','2015-11-03 16:56:36',0),(28,13,'user1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151110/1447154272561016782.jpg\" title=\"1447154272561016782.jpg\" alt=\"3.jpg\" width=\"271\" height=\"130\" style=\"width: 271px; height: 130px;\"/>dabd</p>','2015-11-10 19:18:18',0),(30,15,'user1','<p>shanchu</p>','2015-11-04 23:06:27',0),(31,16,'admin1','<p>新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子</p>','2015-11-05 10:02:48',0),(32,17,'admin1','<p>翻页了该</p>','2015-11-05 10:03:04',0),(33,18,'admin1','<p>分页</p>','2015-11-05 10:03:18',0),(34,4,'admin1','<p>顶顶顶</p>','2015-11-05 10:03:42',9),(39,19,'admin1','<p>标题！<br/></p>','2015-11-08 19:15:03',0),(40,13,'user1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151110/1447154365842049300.jpg\" title=\"1447154365842049300.jpg\" alt=\"78020151030004845.jpg\"/></p>','2015-11-10 19:19:34',1),(42,13,'admin1','<p>124温热水的特</p>','2015-11-27 19:57:50',2),(43,21,'admin1','<p>What are you looking for?</p>','2015-11-27 19:59:09',0),(44,21,'admin1','<p>asd吃顿饭按顺序</p>','2015-11-27 20:00:04',1),(45,22,'admin1','<p>大神</p>','2015-11-27 20:01:15',0),(46,13,'admin1','<p><img src=\"http://10.100.221.3:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>','2015-11-27 20:04:22',3),(47,13,'admin1','<p><img src=\"http://10.100.221.3:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0003.gif\"/></p>','2015-11-27 20:04:37',4),(48,23,'admin1','<p>大声道</p>','2015-11-27 20:05:05',0),(53,23,'admin1','<p>22</p>','2015-11-27 20:27:32',1),(54,27,'admin1',NULL,'2015-11-27 20:27:56',0),(61,NULL,'admin1','','2015-11-30 16:12:23',NULL),(62,35,'admin1','<p>标题测试<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0015.gif\"/></p>','2015-11-30 16:03:59',0),(63,36,'admin1','<p>测试</p>','2015-11-30 16:21:44',0),(65,36,'admin1','<p>good</p>','2015-11-30 16:29:54',1),(66,37,'admin1','<p>不鞥</p>','2015-12-01 12:08:24',0);

#
# Structure for table "bbs_bm"
#

DROP TABLE IF EXISTS `bbs_bm`;
CREATE TABLE `bbs_bm` (
  `BM_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`BM_id`),
  KEY `FK_Relationship_2` (`board_id`),
  KEY `FK_bm_userid` (`user_id`),
  CONSTRAINT `FK_bm_boardid` FOREIGN KEY (`board_id`) REFERENCES `bbs_board` (`board_id`),
  CONSTRAINT `FK_bm_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bbs';

#
# Data for table "bbs_bm"
#


#
# Trigger "board_post_counter"
#

DROP TRIGGER IF EXISTS `board_post_counter`;
CREATE DEFINER='root'@'localhost' TRIGGER `board_post_counter` AFTER INSERT ON `bbs_post`
  FOR EACH ROW update bbs_board SET post_count =
(select count(*) from bbs_post b group by b.board_id
 having  b.board_id=new.board_id)
 where board_id = new.board_id;

#
# Trigger "board_post_decounter"
#

DROP TRIGGER IF EXISTS `board_post_decounter`;
CREATE DEFINER='root'@'localhost' TRIGGER `board_post_decounter` AFTER DELETE ON `bbs_post`
  FOR EACH ROW update bbs_board SET post_count =
(select count(*) from bbs_post b group by b.board_id
 having  b.board_id=old.board_id)
 where board_id = old.board_id;

#
# Trigger "post_reply_count"
#

DROP TRIGGER IF EXISTS `post_reply_count`;
CREATE DEFINER='root'@'localhost' TRIGGER `post_reply_count` AFTER INSERT ON `bbs_reply`
  FOR EACH ROW update bbs_post set post_replytimes =
(select count(*) from bbs_reply group by post_id having bbs_reply.post_id = new.post_id)
where post_id = new.post_id;

#
# Trigger "post_reply_decount"
#

DROP TRIGGER IF EXISTS `post_reply_decount`;
CREATE DEFINER='root'@'localhost' TRIGGER `post_reply_decount` AFTER DELETE ON `bbs_reply`
  FOR EACH ROW begin
update bbs_post set post_replytimes = post_replytimes - 1
where post_id = old.post_id;
delete from bbs_post where post_replytimes is null;
end;

#
# Trigger "post_reply_updator"
#

DROP TRIGGER IF EXISTS `post_reply_updator`;
CREATE DEFINER='root'@'localhost' TRIGGER `post_reply_updator` BEFORE UPDATE ON `bbs_post`
  FOR EACH ROW SET new.post_replytimes=
(select count(*) from bbs_reply b group by b.post_id having b.post_id=new.post_id);
