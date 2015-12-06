# Host: localhost  (Version: 5.6.20)
# Date: 2015-12-06 22:35:27
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

INSERT INTO `companys` VALUES (1,'高山物业','郑州市XX区XX路XX号','12345678901','eamail@xxx.com'),(2,'蓝天物业','郑州市XX区XX路XX号','12345678902','eamail@xxx.com'),(3,'一棵树','郑州市XX区XX路XX号','12345678903','eamail@xxx.com'),(4,'磐石物业','郑州市XX区XX路XX号','12345678904','eamail@xxx.com');

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

INSERT INTO `communities` VALUES (1,'蓝天小区','XX市XX路XX路',1),(2,'花园福地','郑州市XX路',2),(3,'森海半岛','郑州市YY路',3);

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

INSERT INTO `bbs_board` VALUES (1,'二手交易',1,14,'不用的东西都可以放在这里进行交易'),(2,'拼车出行',1,4,'拼车出行！'),(3,'谈天说地',1,5,'来和邻居聊聊吧！'),(5,'新版块',1,NULL,'新版块描述');

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

INSERT INTO `notice_series` VALUES (1,'小区新闻',1),(2,'活动天地',1),(3,'通知公告',1),(4,'失物招领',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "notices"
#

INSERT INTO `notices` VALUES (2,'新公告','admin1','<p>abcdert</p>',1,5,1,'2015-10-21 22:30:38','2015-11-08 10:38:09',0,1,1),(3,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:24','2015-11-30 11:05:50',0,2,0),(4,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:37','2015-11-06 17:08:01',0,3,0),(5,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:43','2015-11-06 17:08:01',1,4,0),(6,'公告测试','admin1','<p>测试</p>',1,5,1,'2015-10-24 10:05:54','2015-11-08 10:38:09',1,1,2),(7,'公告测试','admin1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151105/1446690076740093086.jpg\" title=\"1446690076740093086.jpg\" alt=\"78020151030004845.jpg\" width=\"361\" height=\"75\" style=\"width: 361px; height: 75px;\"/>公告测试</p>',1,5,1,'2015-10-24 10:06:06','2015-11-30 11:05:52',4,2,1),(8,'图片公告123','admin1','<p>我是图片如下</p><p></p><p>图片测试已修改</p>',1,5,1,'2015-10-24 10:07:11','2015-11-06 17:08:58',10,3,1),(9,'ueditor  测试','admin1','<p>测试ceshi</p>',1,5,1,'2015-10-26 14:18:52','2015-11-06 17:09:02',7,4,1),(10,'新的权限控制','admin1','<p>权限编辑一下<br/></p>',1,5,1,'2015-10-26 22:37:48','2015-11-08 10:38:09',26,1,3),(11,'新公告','admin1','<p>公告<br/></p>',1,5,1,'2015-11-05 16:34:18','2015-11-30 11:05:53',2,2,2),(12,'活动天地1234','admin1','<p>活动天地</p>',0,5,1,'2015-11-08 10:32:17','2015-11-08 10:38:09',2,1,0),(17,'活动ssss1111','admin1','<p>活动啊啊啊啊<br/></p>',1,5,1,'2015-11-08 12:01:03','2015-11-08 12:01:55',4,1,4),(18,'钥匙一串','admin1','<p>要是</p>',1,5,1,'2015-11-08 13:13:15','2015-11-30 11:05:53',2,2,3),(20,'测试','admin1','<p>网上说<br/></p>',1,5,1,'2015-11-27 20:01:36','2015-11-27 20:01:36',0,2,4),(21,'11','admin1','<p>11</p>',1,5,1,'2015-11-27 20:04:12','2015-12-01 11:49:26',1,4,2),(22,'11','admin1','<p>11</p>',1,5,1,'2015-11-27 20:04:30','2015-11-27 20:04:30',0,1,5),(23,'11','admin1','<p>11</p>',1,10,1,'2015-11-27 20:04:40','2015-11-30 11:05:57',0,2,5),(24,'新闻1-1','admin1','<p>ssss</p>',1,5,1,'2015-11-30 15:33:34','2015-11-30 15:33:34',1,1,6),(25,'小区成立老年人活动中心','admin1','<p><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">尊敬的业主/住户：</span></p><p style=\"text-indent: 32px\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">大家好！</span></p><p style=\"text-indent: 32px\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">为方便广大老年人活动，小区内东北角将成立老年人活动中心，请广大老年人今后在该地区活动。</span></p><p style=\"text-indent: 32px\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">&nbsp;</span></p><p style=\"text-indent: 32px; text-align: right;\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">XX市XX物业管理有限公司</span></p><p style=\"text-align: right;\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">　　“翠湖居”住户服务中心</span></p><p style=\"text-indent: 32px; text-align: right;\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">二零XX年三月十四日</span></p><p><br/></p>',1,5,1,'2015-12-06 20:35:45','2015-12-06 20:35:45',0,1,7),(26,'小区住户王先生喜中大奖！','admin1','<p><span style=\"font-size: 16px;font-family:楷体\">尊敬的业主/住户：</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">大家好！</span></p><p><span style=\"font-size:16px;font-family:楷体\">祝贺小区内住户王先生抽中50000大奖，为庆祝，他将在景然酒家请客，请大家按个人意愿参加。</span></p><p style=\"text-align:center\"><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449405437345077555.jpg\" title=\"1449405437345077555.jpg\" alt=\"zj.jpg\"/></p>',1,5,1,'2015-12-06 20:38:08','2015-12-06 20:38:08',0,1,8),(27,'热烈庆祝本小区被评为“全省十佳小区”','admin1','<p><span style=\"font-size: 16px;font-family:楷体\">尊敬的业主/住户：</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">大家好！</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">隆重庆祝“翠湖居”被评选为“全省十佳小区”，副市长张会东亲自为我小区颁发奖章。</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family: 楷体\">&nbsp;</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family: 楷体\">XX</span><span style=\"font-size:16px;font-family: 楷体\">市XX物业管理有限公司</span></p><p><span style=\"font-size: 16px;font-family:楷体\">　　“翠湖居”住户服务中心</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">二零XX年三月十四日</span></p><p style=\"text-align:center\"><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449405660497020658.jpg\" title=\"1449405660497020658.jpg\" alt=\"zj.jpg\"/></p>',1,5,1,'2015-12-06 20:41:12','2015-12-06 20:41:12',1,1,9),(28,'请各位业主最近注意防盗！','admin1','<p><span style=\"font-size: 16px;font-family:楷体\">尊敬的业主/住户：</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">大家好！</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\">佳园小区数十住户遭小偷光顾，住户损失共达数十万，请大家注意安全，小心防盗。</span></p><p style=\"text-indent: 32px\"><span style=\"font-size:16px;font-family:楷体\"><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449405741592013848.jpg\" title=\"1449405741592013848.jpg\" alt=\"zj.jpg\"/></span></p><p style=\"text-indent: 32px; text-align: right;\"><span style=\"font-size:16px;font-family: 楷体\">XX</span><span style=\"font-size:16px;font-family: 楷体\">市XX物业管理有限公司</span></p><p style=\"text-align: right;\"><span style=\"font-size: 16px;font-family:楷体\">　　“翠湖居”住户服务中心</span></p><p style=\"text-align: right;\"><span style=\"font-size:16px;font-family:楷体\">二零XX年三月十四日</span></p><p><br/></p>',1,5,1,'2015-12-06 20:42:46','2015-12-06 20:42:47',0,3,2),(29,'“青春有约，与爱相随”青年联谊活动通知','admin1','<p>尊敬的业主/住户：</p><p>　　您好!&nbsp;</p><p>为更好地服务青年，进一步关爱广大未婚单身青年，帮助单身青年解决婚恋问题，推动我市精神文化发展与和谐环境的营造，团市委决定组织开展“青春有约，与爱相随”青年联谊活动。活动将围绕“公益交友”主题，通过趣味竞猜、互动游戏、才艺展示、送爱心、送温暖等形式多样、主题鲜明的活动帮助单身青年拓宽交友渠道，陶冶艺术情操，展示个人才华，让青年朋友们在奉献爱心的同时，增进相互间的情感交流。</p><p>这是一场特殊的交友活动，在志愿服务与联谊交友相结合的模式下，单身的青年们在奉献爱心的同时，又能结识志同道合的异性朋友。即日起至2月13日上午，单身青年男女只要致电福清团市委：85233520，就有机会参加“青春有约， 与爱相随”青年公益交友活动。单身青年通过“共青团福清市委”新浪微博、“青春玉融”微信平台也能获取相关活动信息。</p><p style=\"text-align: right;\">XX物业服务有限公司</p><p style=\"text-align: right;\">　　**物业服务中心</p><p style=\"text-align: right;\">　　二Ο**年四月二十七日</p><p><br/></p>',1,5,1,'2015-12-06 20:45:12','2015-12-06 20:45:12',0,2,6),(32,'六一儿童节活动通知','admin1','<p>关于小区庆“六一”儿童欢乐会的通知</p><p>　　六月是个画满了色彩；写满了童趣；映照着天真笑脸的美丽日子，“六一?儿童节”对于孩子们是个快乐的音符；它将燃烧孩子们对于快乐的期盼；爸爸、妈妈们无不幸福着孩子的幸福，快乐着孩子的快乐；我们拿什么去给我们的孩子，在这个属于孩子们的节日里？zz物业服务中心精心为湾里的孩子们准备了“六一”儿童欢乐会活动，它是给予孩子们的一份充满祝福的节日礼物，和孩子们一同分享吧！珍藏这段关于“六一”；关于“孩子”；关于“我们和孩子”共同成长的记忆！</p><p>　　活动地点：zz二期东门内</p><p>　　欢乐时间：2010年5月29日（周六）9：00</p><p>　　活动人群：zz12周岁以下儿童（含）及家长陪同</p><p>　　活动内容：</p><p>　　◆ 两人三腿搬运工（由指定位置出发，从50米内拿到搬运物后。放回起跑线。以1分钟为时间计算，搬运物资多的队伍获胜。）</p><p>　　报名年龄5-12岁</p><p>　　◆ 心电感应（参赛家庭由父母一方蒙上眼睛，参赛家长及孩子分别排成两列，家长从孩子的队头开始触碰孩子的小手，期间不能摸孩子任何部位，孩子不能出声及其他方式等暗示）报名年龄3-12岁</p><p>　　◆ 宝宝爬行竞技（在每位宝宝爬行重点放置礼品，家长可在终点加油并让宝宝迅速爬到终点。第一名爬到终点的宝宝可挑选礼物。每场比赛可参加四名宝宝。）此活动报名要求：仅限未学会走路的宝宝！</p><p>　　◆ 抢板凳（根据人数摆放椅子，如10人比赛则放置9把椅子在音乐声中停止时迅速抢占座位。未抢到座位即被淘汰第二轮椅子则是8把。依此类推。）报名年龄4-12岁</p><p>　　◆ 双人配合跳（由大人和孩子一起跳绳，要求配合紧密。时间1分钟，跳的次数多为获胜）报名年龄4-12岁</p><p>　　注：各比赛第一名获奖者可从裁判处领取兑奖券，凭兑奖券可在领奖处领取奖品</p><p>　　<strong>报名时间：2010年5月21日至2010年5月28日（9：00-17：00）</strong></p><p><strong>　　报名咨询：zz物业服务中心一期：59836602</strong></p><p><strong>zz物业服务中心二期：82815521</strong></p><p><br/></p>',1,5,1,'2015-12-06 20:48:00','2015-12-06 20:48:00',2,2,7),(33,'新春晚会的通知','admin1','<p>小区第二届“新春联欢夜”活动通知</p><p>　　在这辞旧迎新的日子里，在zz这个“不断壮大”的大家庭中，我们共同企盼的zz第二届“新春联欢夜”活动。将于2011年1月7日（星期五）晚上 19：00拉开序幕，此次活动由zz物业服务中心协同地产公司清河项目部、置地会、居委会共同主办，活动内容包括：节目演出、互动游戏。同时我们还给您 “搭建”了一个展示才艺的平台，让您在这个舞台上尽显自信与风采。欢迎大家报名参加。</p><p>　　一、联欢会暂定时间：20**年1月7日（星期五）晚上 19：00—21：00</p><p>　　二、活动地点：zz售楼处</p><p>　　注：为了给广大业主呈现一场精彩的演出，物业服务中心将会对报名节目进行甄选，并且由于场地有限，本次活动需提前报名。</p><p>　　报名电话： 59**2（一期）、8**21（二期）</p><p style=\"text-align: right;\">　　zz物业服务中心</p><p style=\"text-align: right;\">　　zz居委会</p><p style=\"text-align: right;\">　　20**年12月25日</p><p style=\"text-align: left;\"><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449405978757052094.jpg\" title=\"1449405978757052094.jpg\" alt=\"zj.jpg\"/></p><p><br/></p>',1,5,1,'2015-12-06 20:46:31','2015-12-06 20:49:01',2,2,8),(34,'停电通知','admin1','<p>停电通知</p><p>　　尊敬的各位业主/住户、装修单位：</p><p>　　您们好！</p><p>　　接供电公司通知，因高压线路需要检修，定于2015年12月10日(星期四)早上&nbsp; 06：00时至晚上08:00时整个小区将会停电。</p><p>　　请广大业主/住户互相告知，并做好相应的停电准备。对您的生活造成不便之处，敬请见谅！</p><p>　　若有任何疑问或咨询，欢迎致电住户服务中心： XX221XX315</p><p style=\"text-align: right;\">　　XX市XX物业管理有限公司</p><p style=\"text-align: right;\">　　XX居住户服务中心</p><p style=\"text-align: right;\">　　二○XX年十二月九日</p><p><br/></p>',1,5,1,'2015-12-06 20:50:19','2015-12-06 20:50:19',0,3,3),(35,'关于小区喷洒除虫药物的通知','admin1','<p>小区关于杀虫灭蚊喷药的通知</p><p>　　尊敬的业主/住户：</p><p>　　大家好！</p><p>　　时值春季，万物复苏，同时也是细菌高发期。小区的蚊虫鼠害也逐渐增多，影响广大业户的健康生活。为加强小区的卫生防疫工作，我司定于每周星期三15:00--17:00进行灭蚊消杀喷药工作。</p><p>　　喷药期间请广大业主/住户相互知照，做好防护工作，三楼以下的住户最好关好门窗。尽量不要在喷药后的草坪树木旁停留太长时间，并注意不要让小孩在喷药区及挂有标志牌区域玩耍，以免产生意外中毒事故！</p><p>　　给您的生活带来不便之处，敬请谅解！</p><p>　　若有任何咨询与疑问，请致电住户服务中心热线：</p><p style=\"text-align: right;\">　　XX0308、 XX0315</p><p style=\"text-align: right;\">　　XX市XX物业管理有限公司</p><p style=\"text-align: right;\">　　“翠湖居”住户服务中心</p><p style=\"text-align: right;\">二零XX年三月十四日</p><p><br/></p>',1,5,1,'2015-12-06 20:51:11','2015-12-06 20:51:11',0,3,4),(36,'关于加强小区宠物管理的公告','admin1','<p>为加强养犬管理，保障业主的健康及人身安全，维护小区环境及公共秩序，根据《xx市养犬管理规定》并结合xx小区的实际情况，现对小区养犬人提出如下事项，敬请遵守。 一、小区业主养狗应遵守《xx市养犬管理规定》，定期注射狂犬役苗，严禁无证养狗。</p><p>二、请勿在小区内遛狗或将狗牵到中庭儿童游玩区域，携犬外出时应避让老人、儿童、孕妇和残疾人，防止狗咬伤人。</p><p>三、严禁狗在小区道路、天台、楼道、绿化带等公共区域拉屎拉尿。凡是所养狗在公共区域拉屎拉尿的，狗主人应当立即清理干净。</p><p>四、狗叫影响到他人休息时，养狗人应当采取有效措施予以制止。</p><p>五、携带宠物狗外出时（建议随身携带一个垃圾袋、方便处理排泄的粪便），同时应给狗套上嘴套、束上狗链，并由成年人牵领，以防咬伤他人。 六、大型犬必须圈（栓）养，不得出户。</p><p style=\"text-align: right;\">七、小区内不得养烈性犬、无完全民事行为能力者不得养犬。 八、狗在小区内发生任何安全事故，一切责任由养狗人承担，并请全体业主自觉遵守、积极参与监督。 xx小区管理处</p><p style=\"text-align: right;\">&nbsp;2010年x月x日</p>',1,5,1,'2015-12-06 20:52:43','2015-12-06 20:52:43',0,3,5),(38,'【招领】皮包一个','admin1','<p>本旅社于4月5日上午拾得皮包一个，内有手机、手表、人民币、身份证、票据等，望失主前来认领。&nbsp;&nbsp;</p><p style=\"text-align: right;\">XX旅社</p><p style=\"text-align: right;\">电话 130XXXXXXXX</p><p style=\"text-align: right;\">20xx年4月5日&nbsp;</p><p><br/></p>',1,5,1,'2015-12-06 20:55:56','2015-12-06 20:55:56',0,4,4),(40,'【招领】儿童自行车一辆','admin1','<p><span style=\"font-size: 16px;font-family:楷体\"></span></p><p>尊敬的各位业主：</p><p>您好！</p><p>我司安管人员于2014年4月11日下午三点半左右在小区门口大门口拾到一部儿童自行车，请失主移步到天蓝居住户服务中心（即管理处）认领。</p><p style=\"text-align: right;\">XX住户服务中心</p><p style=\"text-align: right;\">X年X月X日&nbsp;</p><p><span style=\"font-size:16px;font-family:楷体\"></span><br/></p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449406436822086731.jpg\" title=\"1449406436822086731.jpg\" alt=\"zj.jpg\"/></p>',1,5,1,'2015-12-06 20:54:24','2015-12-06 20:56:23',2,4,5),(41,'【招领】近期校区内的失物公告','admin1','<p>物业中心失物招领温馨提示</p><p>　　尊敬的**业主(住户)</p><p>　　大家好!</p><p>　　近期，**热心业主及物业服务中心工作人员在小区内拾获多件遗失物品。遗失物品有：</p><p>　　1、钥匙若干</p><p>　　2、儿童自行车一辆</p><p>　　3、衣物多件</p><p>　　4、床单被罩</p><p>　　5、被褥</p><p>　　6、等各类物品。物业服务中心工作人员已对拾获物品的地点及时间等进行了详实的记录，并妥善保管。</p><p>　　请有以上遗失物品的业主(住户)到物业服务中心前台咨询，确认您遗失的物品后，请凭您的有效证件在物业服务中心前台登记领取。</p><p>　　**物业服务中心前台电话：**</p><p>　　祝您在**生活愉快!</p><p style=\"text-align: right;\">　　XX物业服务有限公司</p><p style=\"text-align: right;\">　　**物业服务中心</p><p style=\"text-align: right;\">　　二Ο**年四月二十七日</p><p><br/></p>',1,5,1,'2015-12-06 21:00:58','2015-12-06 21:00:58',0,4,6),(42,'【寻物】钱包一个','admin1','<p>本人于XX日丢失钱包一枚，褐色皮质，内有现金若干，身份证、银行卡等证件相当重要，希望大伙能够帮忙寻找，找回定当重谢！请联系手机172XXXXXXXX</p><p style=\"text-align: right;\">XX楼X先生</p><p><br/></p>',1,5,1,'2015-12-06 21:04:55','2015-12-06 21:04:55',0,4,7);

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

INSERT INTO `users` VALUES ('admin1','1234','物业公司','6666666',1,b'1','/SmartZone/upload/img/74420151206215830.jpg'),('user1','1234','5号楼1单元1号','12312312311',1,b'0','/SmartZone/upload/img/22720151202180426.jpg'),('user2','12345','1号楼2单元301','12312312311',1,b'0','/SmartZone/upload/img/78820151102164642.jpg'),('user3','12345','addr1','12312312311',3,b'0','/SmartZone/upload/img/1.jpg'),('张高境c','1234',NULL,NULL,1,b'0','/SmartZone/upload/img/1.jpg'),('方俊豪c','1234',NULL,NULL,1,b'0','/SmartZone/upload/img/1.jpg'),('王大锤cc','1234','一号楼3单元5楼西','17712341234',1,b'0','/SmartZone/upload/img/1.jpg'),('衡亦舒c','1234',NULL,NULL,1,b'0','/SmartZone/upload/img/1.jpg'),('西门吹牛','1234',NULL,NULL,1,b'0','/SmartZone/upload/img/1.jpg');

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
  `post_content` varchar(2000) DEFAULT NULL,
  `post_replytimes` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `FK_Relationship_4` (`user_id`),
  KEY `FK_Relationship_5` (`board_id`),
  CONSTRAINT `FK_post_boardid` FOREIGN KEY (`board_id`) REFERENCES `bbs_board` (`board_id`),
  CONSTRAINT `FK_post_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='bbs';

#
# Data for table "bbs_post"
#

INSERT INTO `bbs_post` VALUES (4,'user1',1,'post1','2015-11-02 16:38:28','2015-11-08 19:15:26','2015-11-05 10:03:42',43,'<p>我是ss测啊</p>',10),(12,'user1',1,'标题短，内容长','2015-11-03 16:56:36','2015-11-08 22:13:42','2015-11-03 16:56:36',3,'<p>内容偿还仓促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常</p>',1),(13,'user1',1,'内容带图片','2015-11-03 17:03:06','2015-11-27 20:29:19','2015-11-27 20:04:38',26,'<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151103/1446541362747070417.jpg\" title=\"1446541362747070417.jpg\" alt=\"3.jpg\" width=\"272\" height=\"185\" style=\"width: 272px; height: 185px;\"/>dabd</p>',5),(15,'user1',1,'删除','2015-11-04 23:06:28','2015-11-27 20:01:24','2015-11-04 23:06:27',3,'<p>shanchu</p>',1),(16,'admin1',1,'新帖子','2015-11-05 10:02:48','2015-11-08 15:26:38','2015-11-05 10:02:48',1,'<p>新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子</p>',1),(17,'admin1',1,'新帖子','2015-11-05 10:03:04','2015-11-05 10:03:04','2015-11-05 10:03:04',0,'<p>翻页了该</p>',1),(18,'admin1',1,'分页','2015-11-05 10:03:19','2015-11-27 20:04:52','2015-11-05 12:37:55',9,'<p>分页</p>',1),(21,'admin1',2,'I\'m coming','2015-11-27 19:59:09','2015-11-27 20:00:04','2015-11-27 19:59:46',4,'<p>What are you looking for?</p>',2),(22,'admin1',3,'13说到底','2015-11-27 20:01:16','2015-11-27 20:01:15','2015-11-27 20:01:15',0,'<p>大神</p>',1),(23,'admin1',1,'213','2015-11-27 20:05:06','2015-11-27 20:29:28','2015-11-27 20:27:33',4,'<p>大声道</p>',2),(27,'admin1',1,'22121','2015-11-27 20:27:57','2015-11-27 20:29:10','2015-11-27 20:27:56',1,NULL,1),(35,'admin1',1,'标题','2015-11-30 16:03:59','2015-11-30 16:03:59','2015-11-30 16:03:59',0,'<p>标题测试<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0015.gif\"/></p>',1),(36,'admin1',1,'新帖子测试','2015-11-30 16:21:45','2015-12-01 12:08:04','2015-11-30 16:29:55',12,'<p>测试</p>',2),(37,'admin1',2,'我试试能删除','2015-12-01 12:08:24','2015-12-01 12:08:24','2015-12-01 12:08:24',2,'<p>不鞥</p>',1),(40,'衡亦舒c',1,'9.8新solo HD','2015-12-06 21:14:02','2015-12-06 21:17:24','2015-12-06 21:17:24',10,'<p>在专卖店买的，9.8新solo HD ，喜欢的来，详情联系XXXXXXXXXXX。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449407640574049058.jpg\" title=\"1449407640574049058.jpg\" alt=\"zj.jpg\"/></p>',4),(41,'方俊豪c',1,'一双阿迪达斯休闲鞋','2015-12-06 21:18:17','2015-12-06 21:18:17','2015-12-06 21:18:16',2,'<p>便宜出一双闲置阿迪达斯休闲鞋，有需要的联系XXXXXXXXXXX。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449407893674057790.jpg\" title=\"1449407893674057790.jpg\" alt=\"dj.jpg\"/></p>',1),(43,'方俊豪c',1,'折叠自行车一把','2015-12-06 21:20:52','2015-12-06 21:20:53','2015-12-06 21:20:52',2,'<p>出售折叠自行车一辆，型号是喜德盛fs-205 超适合上下班或者上学 6段变速 基本适合各种城市路段 折叠起来真心不占位子，下图是实拍图，车子保养的挺好的 基本没有摩擦痕迹。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449408023597031988.jpg\" title=\"1449408023597031988.jpg\" alt=\"zj.jpg\"/></p>',1),(44,'方俊豪c',2,'XX驾校拼车求同行！','2015-12-06 21:22:19','2015-12-06 21:25:46','2015-12-06 21:25:46',16,'<p>本人明天要去考科二，XX驾校，需要5:30就出发，不知道有没有和我一起考试的？有的话一起拼车怎么样？<img src=\"http://127.0.0.2:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0017.gif\"/></p>',4),(45,'西门吹牛',2,'我明天9:20去XX，有去的我可以带过去','2015-12-06 21:26:30','2015-12-06 21:26:31','2015-12-06 21:26:30',2,'<p>如题！谁去我可以捎带上</p>',1),(46,'西门吹牛',3,'女孩对Wi-Fi过敏，悲剧发生。','2015-12-06 21:27:45','2015-12-06 21:28:23','2015-12-06 21:28:23',5,'<p>女孩多次告知校方她对Wi-Fi过敏，头痛、恶心、心悸、忧郁，但没人相信她，最终悲剧发生。</p><p>真是真的么，题主好怕怕</p>',2),(47,'张高境c',3,'明天要去XXX求问有没有什么好吃的好玩的','2015-12-06 21:29:21','2015-12-06 21:29:41','2015-12-06 21:29:41',5,'<p>求问<img src=\"http://127.0.0.1:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>',2),(48,'衡亦舒c',3,'酒酿！','2015-12-06 21:31:06','2015-12-06 21:33:43','2015-12-06 21:33:43',11,'<p>想做酒酿了！我家先生特别爱吃酒酿，外面买来的酒酿我嫌脏，只有自己动手做了。以前做过几次，都非常成功。这个周末准备再做一次！想想那个香味，现在都想吃了……<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0034.gif\"/></p>',4),(49,'西门吹牛',3,'大家一定要注意用电安全啊！','2015-12-06 21:34:27','2015-12-06 21:43:27','2015-12-06 21:43:27',8,'<p>XXXX小区架空层深夜大火，烧毁百辆电动车，整座楼被烧黑，幸无伤亡。居民们怀疑，火灾是楼下正在充电的电动车自燃或电瓶短路引起。不少读者昨日致电95060称，电动车是许多人出行的交通工具，但电动车引发的火灾，榕城已发生多起，如何防范，事关无数家庭的人身和财产安全。</p><p><br/></p><p>真的可怕</p>',3);

#
# Structure for table "bbs_reply"
#

DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `reply_content` varchar(2000) DEFAULT NULL,
  `reply_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idx` int(11) DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `FK_reply_postid` (`post_id`),
  KEY `FK_reply_userid` (`user_id`),
  CONSTRAINT `FK_bbsreply_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_reply_postid` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`post_id`),
  CONSTRAINT `FK_reply_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`),
  CONSTRAINT `bbs_reply_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

#
# Data for table "bbs_reply"
#

INSERT INTO `bbs_reply` VALUES (7,4,'user1','<p>我是测试啊</p>','2015-11-02 16:38:27',0),(8,4,'user1','<p>回复一下</p>','2015-11-02 16:44:07',1),(9,4,'user1','<p>板凳!</p>','2015-11-02 16:44:17',2),(10,4,'user2','<p>地板</p>','2015-11-02 16:48:29',3),(11,4,'user2','<p>&nbsp;长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试</p>','2015-11-02 17:10:33',4),(12,4,'user2','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151102/1446455447174071030.jpg\" title=\"1446455447174071030.jpg\" alt=\"3.jpg\" width=\"828\" height=\"364\" style=\"width: 828px; height: 364px;\"/></p>','2015-11-02 17:11:05',5),(24,4,'user1','<p>回复置顶测试</p>','2015-11-03 15:58:49',6),(25,4,'user1','<p>回复数量测试</p>','2015-11-03 16:02:28',7),(26,4,'user1','<p>trigger测试</p>','2015-11-03 16:27:40',8),(27,12,'user1','<p>内容偿还仓促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常促常常常常</p>','2015-11-03 16:56:36',0),(28,13,'user1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151110/1447154272561016782.jpg\" title=\"1447154272561016782.jpg\" alt=\"3.jpg\" width=\"271\" height=\"130\" style=\"width: 271px; height: 130px;\"/>dabd</p>','2015-11-10 19:18:18',0),(30,15,'user1','<p>shanchu</p>','2015-11-04 23:06:27',0),(31,16,'admin1','<p>新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子新帖子</p>','2015-11-05 10:02:48',0),(32,17,'admin1','<p>翻页了该</p>','2015-11-05 10:03:04',0),(33,18,'admin1','<p>分页</p>','2015-11-05 10:03:18',0),(34,4,'admin1','<p>顶顶顶</p>','2015-11-05 10:03:42',9),(40,13,'user1','<p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151110/1447154365842049300.jpg\" title=\"1447154365842049300.jpg\" alt=\"78020151030004845.jpg\"/></p>','2015-11-10 19:19:34',1),(42,13,'admin1','<p>124温热水的特</p>','2015-11-27 19:57:50',2),(43,21,'admin1','<p>What are you looking for?</p>','2015-11-27 19:59:09',0),(44,21,'admin1','<p>asd吃顿饭按顺序</p>','2015-11-27 20:00:04',1),(45,22,'admin1','<p>大神</p>','2015-11-27 20:01:15',0),(46,13,'admin1','<p><img src=\"http://10.100.221.3:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>','2015-11-27 20:04:22',3),(47,13,'admin1','<p><img src=\"http://10.100.221.3:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0003.gif\"/></p>','2015-11-27 20:04:37',4),(48,23,'admin1','<p>大声道</p>','2015-11-27 20:05:05',0),(53,23,'admin1','<p>22</p>','2015-11-27 20:27:32',1),(54,27,'admin1',NULL,'2015-11-27 20:27:56',0),(61,NULL,'admin1','','2015-11-30 16:12:23',NULL),(62,35,'admin1','<p>标题测试<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0015.gif\"/></p>','2015-11-30 16:03:59',0),(63,36,'admin1','<p>测试</p>','2015-11-30 16:21:44',0),(65,36,'admin1','<p>good</p>','2015-11-30 16:29:54',1),(66,37,'admin1','<p>不鞥</p>','2015-12-01 12:08:24',0),(67,40,'衡亦舒c','<p>在专卖店买的，9.8新solo HD ，喜欢的来，详情联系XXXXXXXXXXX。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449407640574049058.jpg\" title=\"1449407640574049058.jpg\" alt=\"zj.jpg\"/></p>','2015-12-06 21:14:01',0),(68,40,'张高境c','<p>多少钱</p>','2015-12-06 21:15:33',1),(69,40,'张高境c','<p>价格合适我就入<img src=\"http://127.0.0.1:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0057.gif\"/></p>','2015-12-06 21:16:03',2),(70,40,'方俊豪c','<p>我来混个脸熟<img src=\"http://127.0.0.2:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0058.gif\"/></p>','2015-12-06 21:17:24',3),(71,41,'方俊豪c','<p>便宜出一双闲置阿迪达斯休闲鞋，有需要的联系XXXXXXXXXXX。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449407893674057790.jpg\" title=\"1449407893674057790.jpg\" alt=\"dj.jpg\"/></p>','2015-12-06 21:18:16',0),(72,43,'方俊豪c','<p>出售折叠自行车一辆，型号是喜德盛fs-205 超适合上下班或者上学 6段变速 基本适合各种城市路段 折叠起来真心不占位子，下图是实拍图，车子保养的挺好的 基本没有摩擦痕迹。</p><p><img src=\"/SmartZone/ueditor/jsp/upload/image/20151206/1449408023597031988.jpg\" title=\"1449408023597031988.jpg\" alt=\"zj.jpg\"/></p>','2015-12-06 21:20:52',0),(73,44,'方俊豪c','<p>本人明天要去考科二，XX驾校，需要5:30就出发，不知道有没有和我一起考试的？有的话一起拼车怎么样？<img src=\"http://127.0.0.2:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0017.gif\"/></p>','2015-12-06 21:22:18',0),(74,44,'衡亦舒c','<p>并没有<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>','2015-12-06 21:22:43',1),(75,44,'张高境c','<p>我刚好也要去，可以一起啊~</p>','2015-12-06 21:23:28',2),(77,44,'西门吹牛','<p>太早啦，我明天晚点才会过去</p>','2015-12-06 21:25:46',3),(78,45,'西门吹牛','<p>如题！谁去我可以捎带上</p>','2015-12-06 21:26:30',0),(79,46,'西门吹牛','<p>女孩多次告知校方她对Wi-Fi过敏，头痛、恶心、心悸、忧郁，但没人相信她，最终悲剧发生。</p><p>真是真的么，题主好怕怕</p>','2015-12-06 21:27:45',0),(80,46,'方俊豪c','<p>真的，像LZ这样的千万不要用WIFI！</p>','2015-12-06 21:28:22',1),(81,47,'张高境c','<p>求问<img src=\"http://127.0.0.1:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>','2015-12-06 21:29:20',0),(82,47,'衡亦舒c','<p>百度一下，你就知道~</p>','2015-12-06 21:29:41',1),(83,48,'衡亦舒c','<p>想做酒酿了！我家先生特别爱吃酒酿，外面买来的酒酿我嫌脏，只有自己动手做了。以前做过几次，都非常成功。这个周末准备再做一次！想想那个香味，现在都想吃了……<img src=\"http://localhost:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0034.gif\"/></p>','2015-12-06 21:31:05',0),(84,48,'衡亦舒c','<p>想起用糯米换酒酿的日子</p>','2015-12-06 21:32:37',1),(85,48,'方俊豪c','<p>我也做过几次，前几次都做得很好吃的，就最后一次因为糯米蒸好后凉在那里忘了，到第二天早上才想起拌酒曲，结果冻坏了，做出来变成褐红色的了</p>','2015-12-06 21:33:09',2),(86,48,'西门吹牛','<p><span style=\"font-size:14px;font-family:宋体;color:#2B2B2B;background:white\">说得我都馋了。</span><img src=\"http://127.0.0.3:8080/SmartZone/ueditor/dialogs/emotion/images/jx2/j_0059.gif\"/></p>','2015-12-06 21:33:42',3),(87,49,'西门吹牛','<p>XXXX小区架空层深夜大火，烧毁百辆电动车，整座楼被烧黑，幸无伤亡。居民们怀疑，火灾是楼下正在充电的电动车自燃或电瓶短路引起。不少读者昨日致电95060称，电动车是许多人出行的交通工具，但电动车引发的火灾，榕城已发生多起，如何防范，事关无数家庭的人身和财产安全。</p><p><br/></p><p>真的可怕</p>','2015-12-06 21:34:27',0),(88,49,'张高境c','<p>幸亏不是发生在我们这里。</p>','2015-12-06 21:34:54',1),(89,49,'方俊豪c','<p>看来我们小区也要注意这方面的安全问题了。</p>','2015-12-06 21:43:26',2);

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
