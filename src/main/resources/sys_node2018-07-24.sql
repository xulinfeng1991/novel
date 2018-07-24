/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.15-log : Database - xujiahong_novel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xujiahong_novel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `xujiahong_novel`;

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资料ID',
  `dataName` varchar(32) NOT NULL COMMENT '资料名称',
  `tableName` varchar(32) NOT NULL COMMENT '表名（英文）',
  `columnNames` varchar(512) NOT NULL COMMENT '英文逗号分隔的中文名称（顺序不可更改）',
  `columnSeq` varchar(512) NOT NULL COMMENT '英文逗号分隔的中文名称（可更改可省略）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `data` */

insert  into `data`(`id`,`dataName`,`tableName`,`columnNames`,`columnSeq`) values (1,'修为等级','data_level','级别类比,等级,级别,新天赋设定,描述,社会地位,寿元,概率','级别类比,等级,级别,新天赋设定,描述,社会地位,寿元,概率'),(2,'符文系统A','data_sign_a','解锁顺序,名称,属性,类别,效果简介','解锁顺序,名称,属性,类别,效果简介'),(3,'符文系统B','data_sign_b','符文,金,木,水,火,土,风,雷,光,暗,精华','符文,金,木,水,火,土,风,雷,光,暗,精华');

/*Table structure for table `hero` */

DROP TABLE IF EXISTS `hero`;

CREATE TABLE `hero` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '英雄资料',
  `name` varchar(32) DEFAULT NULL COMMENT '英雄名称',
  `nickName` varchar(32) DEFAULT NULL COMMENT '英雄昵称',
  `magicAttribute` varchar(32) DEFAULT NULL COMMENT '魔法属性',
  `home` varchar(32) DEFAULT NULL COMMENT '国家',
  `org` varchar(32) DEFAULT NULL COMMENT '派系&组织',
  `weapon` varchar(32) DEFAULT NULL COMMENT '武器',
  `appearScene` varchar(32) DEFAULT NULL COMMENT '出场分卷和章节',
  `levelDesc` varchar(128) DEFAULT NULL COMMENT '等级变化描述',
  `story` text COMMENT '小说中的设定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickName` (`nickName`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

/*Data for the table `hero` */

insert  into `hero`(`id`,`name`,`nickName`,`magicAttribute`,`home`,`org`,`weapon`,`appearScene`,`levelDesc`,`story`) values (1,'辛德拉','暗黑元首','暗','艾欧尼亚','暗影岛','','暗影岛','666','暗影岛元首'),(2,'肖娜.薇恩','暗夜猎手','暗','德玛西亚','德玛西亚','夜视镜，猎魔弩','诺克萨斯之战','','原本和奎因同为斥候队伍小军官，被主角提拔，奎因掌管整个侦查队伍。VN掌管暗部的强弩射声营'),(3,'亚托克斯','暗裔剑魔','暗','符文之地','暗影岛','大宝剑','九华篇','','传授主角剑法'),(4,'阿卡丽','暗影之拳',NULL,'艾欧尼亚','均衡教派',NULL,'艾欧尼亚篇',NULL,NULL),(5,'','傲之追猎者','','符文之地','','','？？？','','小说设定直接和螳螂是朋友，对话引出之前的恩怨，他们在永猎双子的狼灵狩猎下成为了朋友'),(6,'克列','暴怒骑士','','诺克萨斯','','','？？？','','诺克萨斯轻骑兵队长'),(7,'金克丝','暴走萝莉','','祖安','','','皮城祖安篇','',''),(8,'','爆破鬼才',NULL,'祖安',NULL,NULL,'皮城祖安篇',NULL,NULL),(9,'','北地之怒（凛冬之怒）',NULL,'弗雷尔卓德',NULL,NULL,'弗雷尔卓德',NULL,NULL),(10,'','冰晶凤凰',NULL,'弗雷尔卓德',NULL,NULL,'弗雷尔卓德',NULL,NULL),(11,'','冰霜女巫',NULL,'弗雷尔卓德',NULL,NULL,'弗雷尔卓德',NULL,NULL),(12,'','不祥之刃',NULL,'诺克萨斯',NULL,NULL,'战争学院',NULL,NULL),(13,'','潮汐海灵',NULL,'符文之地',NULL,NULL,'比尔吉沃特',NULL,NULL),(14,'','惩戒之箭',NULL,'艾欧尼亚',NULL,NULL,'？？？',NULL,NULL),(15,'','翠神',NULL,'符文之地',NULL,NULL,'？？？库莽古',NULL,NULL),(16,'','大发明家',NULL,'皮尔特沃夫',NULL,NULL,'皮城祖安篇',NULL,NULL),(17,'','刀锋舞者（刀锋意志）',NULL,'',NULL,NULL,'？？？',NULL,NULL),(18,'','刀锋之影',NULL,'',NULL,NULL,'？？？',NULL,NULL),(19,'','德邦总管',NULL,'',NULL,NULL,'德玛西亚',NULL,NULL),(20,'','德玛西亚皇子',NULL,'',NULL,NULL,'德玛西亚',NULL,NULL),(21,'','德玛西亚之力',NULL,'',NULL,NULL,'德玛西亚',NULL,NULL),(22,'','德玛西亚之翼',NULL,'',NULL,NULL,'诺克萨斯之战',NULL,NULL),(23,'莫甘娜','堕落天使','暗','','暗影岛','','暗影岛','','暗影岛幕后沟通皎月女神的天使'),(24,'','恶魔小丑','','？？？','暗影岛','','战争学院','','刺客，职业杀手，雇佣兵'),(25,'','发条魔灵','','','','','皮城祖安篇','','祖安'),(26,'','法外狂徒',NULL,'',NULL,NULL,'？？？',NULL,NULL),(27,'','放逐之刃',NULL,'',NULL,NULL,'战争学院',NULL,NULL),(28,'','风暴之怒',NULL,'','神',NULL,'',NULL,NULL),(29,'布隆','弗雷尔卓德之心',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'','符文法师（流浪法师）',NULL,'','神',NULL,'',NULL,NULL),(31,'','复仇焰魂',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'','复仇之矛',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'','光辉女郎',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'','诡术妖姬',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'','海兽祭司',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'','海洋之灾',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'','寒冰射手',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'','河流之王',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'','黑暗之女',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'','幻翎',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'','唤潮鲛姬',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'','荒漠屠夫',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'','魂锁典狱长',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'','机械公敌',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'','机械先驱',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'','疾风剑豪',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'','皎月女神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'','荆棘之兴',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'','九尾妖狐',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'','酒桶',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'','巨魔之王',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'','卡牌大师',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'','狂暴之心',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'','狂野女猎手',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'','狂战士',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'','雷霆咆哮',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'','炼金术士',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'','龙血武姬',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'','麦林炮手',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'','蛮族之王',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'','盲僧',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'','迷失之牙',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'','魔蛇之拥',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'','末日使者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'','牧魂人',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'','暮光星灵',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'','暮光之眼',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'','逆羽',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'','牛头人酋长',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'','扭曲树精',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'','诺克萨斯统领（策士统领）',NULL,'诺克萨斯',NULL,NULL,NULL,NULL,NULL),(72,'','诺克萨斯之手',NULL,'诺克萨斯',NULL,NULL,NULL,NULL,NULL),(73,'','披甲龙龟',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'','皮城女警',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'','皮城执法官',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'','齐天大圣',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'','琴瑟仙女',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'','青钢影',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'','荣耀行刑官',NULL,'诺克萨斯',NULL,NULL,NULL,NULL,NULL),(80,'','熔岩巨兽',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'','沙漠皇帝','','','','','','','封德玛为海军司令'),(82,'','沙漠死神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'','山隐之焰',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'','殇之木乃伊',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'','赏金猎人（厄运小姐）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'','深海泰坦',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'','深渊巨口',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,'','审判天使',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'','生化魔人',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,'','圣锤之毅（钢铁大使）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'','圣枪游侠',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'','时光守护者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'','时间刺客',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'','兽灵行者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'','曙光女神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'','水晶先锋',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'','死亡颂唱者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'','探险家',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'','天启者','','','','','','','卡尔玛战死，主角是新一代的转世天启者，长存之殿，杀戮从来都是简单的，但代价却是失去真正的启迪。'),(100,'','铁铠冥魂（金属大师）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'','痛苦之拥（寡妇制造者）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,'','瓦洛兰之盾（宝石骑士）',NULL,'巨神峰',NULL,NULL,NULL,NULL,NULL),(103,'','亡灵战神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'','未来守护者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,'','瘟疫之源',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,'','无极剑圣',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,'','无双剑姬',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,'','无畏战车（首领之傲）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,'','武器大师',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,'','戏命师',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,'','仙灵女巫',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,'','邪恶小法师','','','','','','','班德尔城的“邪恶”大BOSS，从虚空之地来到主世界，孤独，把班德尔城的人全部魔化，变成了身材矮小的约德尔人。并用扭曲空间封锁约德尔之地。'),(113,'','星界游神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,'','猩红收割者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,'','虚空遁地兽',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,'','虚空掠夺者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,'','虚空恐惧',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'','虚空先知','','','','','','','虚空之地先知，和召唤师达成协议，带领族人前往主世界，逃离虚空之地，终极之战的时候，带领虚空一族的神级高手参战'),(119,'','虚空行者',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'','虚空之女',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'','虚空之眼',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,'','雪人骑士',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'','迅捷斥候',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'','岩雀',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,'','英勇投弹手（汤姆上校）',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,'','影流之镰',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,'','影流之主',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,'','永恒梦魇',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,'','永猎双子',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'','远古巫灵',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,'','战争女神',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,'','战争之王',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,'','战争之影',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'','蒸汽机器人',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'','正义巨像',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'','蜘蛛女皇',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,'','众星之子',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,'','铸星龙王',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,'','祖安狂人',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,'','祖安怒兽（狼人）',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `outline` */

DROP TABLE IF EXISTS `outline`;

CREATE TABLE `outline` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '大纲表',
  `parentId` int(11) NOT NULL COMMENT '父级ID',
  `title` varchar(64) NOT NULL COMMENT '标题（分卷、章节）',
  `plot` varchar(512) DEFAULT NULL COMMENT '情节简述',
  `bossLevel` varchar(128) DEFAULT NULL COMMENT 'BOSS等级设定',
  `mainPeople` varchar(128) DEFAULT NULL COMMENT '主要人物',
  `story` text COMMENT '故事详情',
  `material` text COMMENT '写作材料',
  `sequence` double DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `outline` */

insert  into `outline`(`id`,`parentId`,`title`,`plot`,`bossLevel`,`mainPeople`,`story`,`material`,`sequence`) values (1,-1,'九华篇','','九华城主（铂金），暗裔剑魔','凌风','','',NULL),(2,-1,'德玛西亚篇',NULL,NULL,NULL,NULL,NULL,NULL),(3,-1,'弗雷尔卓德',NULL,NULL,NULL,NULL,NULL,NULL),(4,-1,'祖安皮城篇',NULL,NULL,NULL,NULL,NULL,NULL),(5,-1,'诺克萨斯篇',NULL,NULL,NULL,NULL,NULL,NULL),(6,-1,'战争学院篇',NULL,NULL,NULL,NULL,NULL,NULL),(7,-1,'暗影岛篇',NULL,NULL,NULL,NULL,NULL,NULL),(8,-1,'艾欧尼亚篇',NULL,NULL,NULL,NULL,NULL,NULL),(9,-1,'比尔吉沃特',NULL,NULL,NULL,NULL,NULL,NULL),(10,-1,'班德尔城篇',NULL,NULL,NULL,NULL,NULL,NULL),(11,-1,'库莽古森林',NULL,NULL,NULL,NULL,NULL,NULL),(12,-1,'艾卡西亚篇',NULL,NULL,NULL,NULL,NULL,NULL),(13,-1,'未分类',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
