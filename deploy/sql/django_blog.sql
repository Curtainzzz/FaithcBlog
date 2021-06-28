-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: django_app
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_app_bloguser`
--

DROP TABLE IF EXISTS `account_app_bloguser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_app_bloguser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_app_bloguser`
--

LOCK TABLES `account_app_bloguser` WRITE;
/*!40000 ALTER TABLE `account_app_bloguser` DISABLE KEYS */;
INSERT INTO `account_app_bloguser` VALUES (1,'pbkdf2_sha256$260000$xzEjCLBkis7qEBgYmoGuOQ$kN7wG+ME1F1si5Jqg0tBpwnlErjvIabesQZ1HolM1x4=',NULL,0,'lzc1','','','895698141@qq.com',0,0,'2021-06-27 15:03:17.720787','','2021-06-27 15:03:17.720808','2021-06-27 15:03:17.720851','Register'),(2,'pbkdf2_sha256$260000$Ynsea7XqBgW0XdnEpx3o9M$94Go/ldQ0P2pXTjUPZrqmxXzfQEZmXYXeR3OvV3vu4k=','2021-06-28 01:54:56.839254',0,'lzc2','','','895698141@qq.com',0,1,'2021-06-28 01:46:04.777056','','2021-06-28 01:46:04.777068','2021-06-28 01:46:04.777072','Register'),(3,'pbkdf2_sha256$260000$hGKIFqEIiSBd8YA2lGaleB$+zsVBcOcqy6O/Q5HPd51MDHiMoknkm+Q7k5nZ0EtIyo=','2021-06-28 02:02:15.270376',1,'lzc','','','895698141@qq.com',1,1,'2021-06-28 02:01:49.350016','','2021-06-28 02:01:49.350027','2021-06-28 02:01:49.350031','');
/*!40000 ALTER TABLE `account_app_bloguser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_app_bloguser_groups`
--

DROP TABLE IF EXISTS `account_app_bloguser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_app_bloguser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_app_bloguser_groups_bloguser_id_group_id_e9b9d7f1_uniq` (`bloguser_id`,`group_id`),
  KEY `account_app_bloguser_groups_group_id_038e14ee_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_app_bloguser_bloguser_id_470a3697_fk_account_a` FOREIGN KEY (`bloguser_id`) REFERENCES `account_app_bloguser` (`id`),
  CONSTRAINT `account_app_bloguser_groups_group_id_038e14ee_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_app_bloguser_groups`
--

LOCK TABLES `account_app_bloguser_groups` WRITE;
/*!40000 ALTER TABLE `account_app_bloguser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_app_bloguser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_app_bloguser_user_permissions`
--

DROP TABLE IF EXISTS `account_app_bloguser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_app_bloguser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloguser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_app_bloguser_use_bloguser_id_permission_i_b075d3eb_uniq` (`bloguser_id`,`permission_id`),
  KEY `account_app_bloguser_permission_id_224575fc_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_app_bloguser_bloguser_id_c1c12eb7_fk_account_a` FOREIGN KEY (`bloguser_id`) REFERENCES `account_app_bloguser` (`id`),
  CONSTRAINT `account_app_bloguser_permission_id_224575fc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_app_bloguser_user_permissions`
--

LOCK TABLES `account_app_bloguser_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_app_bloguser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_app_bloguser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add tag',8,'add_tag'),(30,'Can change tag',8,'change_tag'),(31,'Can delete tag',8,'delete_tag'),(32,'Can view tag',8,'view_tag'),(33,'Can add article',9,'add_article'),(34,'Can change article',9,'change_article'),(35,'Can delete article',9,'delete_article'),(36,'Can view article',9,'view_article'),(37,'Can add user',10,'add_bloguser'),(38,'Can change user',10,'change_bloguser'),(39,'Can delete user',10,'delete_bloguser'),(40,'Can view user',10,'view_bloguser'),(41,'Can add 评论',11,'add_comment'),(42,'Can change 评论',11,'change_comment'),(43,'Can delete 评论',11,'delete_comment'),(44,'Can view 评论',11,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_article`
--

DROP TABLE IF EXISTS `blogapp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduce` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogapp_article_category_45bf671e_fk_blogapp_category_id` (`category`),
  CONSTRAINT `blogapp_article_category_45bf671e_fk_blogapp_category_id` FOREIGN KEY (`category`) REFERENCES `blogapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_article`
--

LOCK TABLES `blogapp_article` WRITE;
/*!40000 ALTER TABLE `blogapp_article` DISABLE KEYS */;
INSERT INTO `blogapp_article` VALUES (1,'计算机网络总结-概述','计算机网络总结-概','# 计算机性能指标\r\n速率:传送数据的速率,即数据的实时速度\r\n带宽:信道传送数据的能力,即数据的额定速度\r\n吞吐量:单位时间通过某个网络的实际数据量,即数据的平均速率\r\n时延:数据从一端到另一端的时间,分为发送时延,传播时延,处理时延,排队时延\r\n时延带宽积:为传播时延*带宽,表示网络中的数据量\r\n往返时间RTT:双向交互一次所需的时间,RTT=传播时延+排队时延+处理时延\r\n利用率:分为信道利用率和网络利用率,信道利用率是指百分之几的时间有数据通过,网络利用率是全信道利用率加权平均值,网络利用率=1-(网络空闲时延/网络当前时延)\r\n\r\n# 协议模型\r\nOSI七层模型:物理层,数据链路层,网络层,传输层,会话层,表示层,应用层(国际组织标准)\r\nTCP/IP五层模型:五层模型:物理层,数据链路层,网络层,传输层,应用层(常用于学习)\r\nTCP/IP 四层模型:网络接口层,网际互联层,传输层,应用层(根据市场实际需求)\r\n\r\n# 数据在各层传输流程\r\n比如http请求在TCP/IP五层模型中传输流程:在应用层数据添加http头(method,cookie,User-Agnet等)封装成报文,然后发送到运输层添加tcp头(源端口和目的端口,接收窗口,校验和等)封装成报文段,然后发送到网络层添加交IP头(源ip地址和目的ip地址,校验和,生存时间等)封装成数据包,然后发送到链路层添加头(源物理地址和目的物理地址等)封装成帧,最后发送到物理层封装成比特流在传输介质上传输.\r\n\r\n参考资料:《计算机网络（第7版）》 谢希仁 电子工业出版社．2017-11-15',1),(2,'计算机网络总结-物理层总结','计算机网络总结-物理层总结','# 概念\r\n数据链路层作用:传输数据帧\r\nISP:互联网服务提供商,互联网用户通常需要先连接某个ISP后才能接入互联网\r\n\r\n# 数据链路层信道类型:\r\n1.点对点信道:使用一对一的点对点通信方式,基于PPP协议\r\n2.广播信道:使用一对多的广播通信方式,基于CSMA/CD协议\r\n\r\n# 点对点协议PPP\r\nPPP(Point-to-Point Protocol)协议是在数据链路层上点对点传输数据时所使用的标准方法,是互联网用户和ISP通信时所使用的数据链路层协议.\r\n#### PPP协议主要特点\r\n1.有差错检测功能,检验通过就收下,不通过就丢弃,防止无用帧继续在网络传输浪费网络资源\r\n2.简单,无纠错、重传和流量控制功能,网络开销小速度快,所以是不可靠传输\r\n3.支持多种上层网络协议,并能同时运行\r\n4.支持多种物理层传输介质,的点对点链路\r\n5.支持网络层IP地址的协商,即具有动态分配IP地址的能力\r\n6.具有身份验证能力,通过PAP密码验证协议和CHAP挑战握手认证协议\r\n# CSMA/CD协议\r\n即载波监听多点接入/碰撞检测,是以太网中进行广播时常采用的协议,由于以太网中经常多台主机需要在一个信道中传输数据,但不同主机同时传输数据帧会发生碰撞进而破坏数据帧,而CSMA/CD就是用于处理共享信道通信时冲突的机制..\r\n#### CSMA/CD原理\r\n1.多点接入:计算机以多点接入的方式最终连到一根总线上,然后通过载波监听和碰撞检测解决信道冲突问题\r\n2.载波监听:总线上各个节点不停检测是否有数据在传输,发现信道空闲才让发送数据\r\n3.碰撞检测:当两个以上节点检测到信道空闲同时发送数据还是会造成数据帧碰撞,而当节点检测到信道冲突会立即停止发送数据,避免网络资源浪费,等待一段时间后再重新发送\r\n\r\n# MAC地址\r\nMAC地址是电脑的物理地址,用来区分不同设备,是数据链路层和物理层使用的地址.\r\n#### MAC地址和IP地址对比\r\n`1.为什么有了MAC地址还要使用IP地址:IP地址前缀是和区域相关的,路由器能根据IP前缀寻址对应的区域,快速定位到主机,而MAC地址是不和区域相关的,想要通过MAC地址寻址路由器必须存所有的设备的MAC地址,而这显然不现实\r\n2.为什么必须有MAC地址:用于设备在联网前区分不同设备,即IP地址用于区分网络上的设备,MAC地址用于区分现实中的设备\r\n\r\n参考资料:《计算机网络（第7版）》 谢希仁 电子工业出版社．2017-11-15',1),(3,'计算机网络总结-数据链路层','计算机网络总结-数据链路层','# 概念\r\n数据链路层作用:传输数据帧\r\nISP:互联网服务提供商,互联网用户通常需要先连接某个ISP后才能接入互联网\r\n\r\n# 数据链路层信道类型:\r\n1.点对点信道:使用一对一的点对点通信方式,基于PPP协议\r\n2.广播信道:使用一对多的广播通信方式,基于CSMA/CD协议\r\n\r\n# 点对点协议PPP\r\nPPP(Point-to-Point Protocol)协议是在数据链路层上点对点传输数据时所使用的标准方法,是互联网用户和ISP通信时所使用的数据链路层协议.\r\n#### PPP协议主要特点\r\n1.有差错检测功能,检验通过就收下,不通过就丢弃,防止无用帧继续在网络传输浪费网络资源\r\n2.简单,无纠错、重传和流量控制功能,网络开销小速度快,所以是不可靠传输\r\n3.支持多种上层网络协议,并能同时运行\r\n4.支持多种物理层传输介质,的点对点链路\r\n5.支持网络层IP地址的协商,即具有动态分配IP地址的能力\r\n6.具有身份验证能力,通过PAP密码验证协议和CHAP挑战握手认证协议\r\n# CSMA/CD协议\r\n即载波监听多点接入/碰撞检测,是以太网中进行广播时常采用的协议,由于以太网中经常多台主机需要在一个信道中传输数据,但不同主机同时传输数据帧会发生碰撞进而破坏数据帧,而CSMA/CD就是用于处理共享信道通信时冲突的机制..\r\n#### CSMA/CD原理\r\n1.多点接入:计算机以多点接入的方式最终连到一根总线上,然后通过载波监听和碰撞检测解决信道冲突问题\r\n2.载波监听:总线上各个节点不停检测是否有数据在传输,发现信道空闲才让发送数据\r\n3.碰撞检测:当两个以上节点检测到信道空闲同时发送数据还是会造成数据帧碰撞,而当节点检测到信道冲突会立即停止发送数据,避免网络资源浪费,等待一段时间后再重新发送\r\n\r\n# MAC地址\r\nMAC地址是电脑的物理地址,用来区分不同设备,是数据链路层和物理层使用的地址.\r\n#### MAC地址和IP地址对比\r\n`1.为什么有了MAC地址还要使用IP地址:IP地址前缀是和区域相关的,路由器能根据IP前缀寻址对应的区域,快速定位到主机,而MAC地址是不和区域相关的,想要通过MAC地址寻址路由器必须存所有的设备的MAC地址,而这显然不现实\r\n2.为什么必须有MAC地址:用于设备在联网前区分不同设备,即IP地址用于区分网络上的设备,MAC地址用于区分现实中的设备\r\n\r\n参考资料:《计算机网络（第7版）》 谢希仁 电子工业出版社．2017-11-15',1),(4,'计算机网络总结-网络层','计算机网络总结-网络层','# 概念\r\n单播:点对点传输\r\n多播:一对多传输\r\n子网掩码:同IP地址一样是一个32位地址,网络位全为1,主机位全为0,通过和IP按位与来屏蔽IP地址的主机号部分,来区分三级IP地址的网络号,子网号,主机号\r\nTTL(Time to Live):被存在IPv4报头的8bit字段,IP包生存时间值,单位是被转发次数,避免IP包在网络中无限循环收发\r\n\r\n# 网际协议IP\r\nIP(Internet Protocol)协议是用来将不同网络互连起来的协议,为主机提供一种无连接,不可靠的,尽力而为的数据包传输服务\r\n## IP协议作用\r\n1.寻址和路由:\r\n2.分隔与重组:\r\n\r\n## IP地址编址方法\r\nIP地址的编址方法经过三个历史阶段:分类的IP地址(最基本的编址方法),子网的划分(最基本的编址方法改进),超网(无分类编址方法)\r\n#### IP地址分类\r\nIP地址为4字节,由网络号和主机号组成,分为A,B,C类单播地址,D类多播地址和E类保留地址总共五类地址,且主机号全为0保留为网络地址,全为1保留为广播地址\r\nA类地址:以0开头,1字节网络号,3字节主机号,IP范围1.0.0.0~127.255.255.255,保留10.X.X.X作为局域网地址,127.X.X.X作本地进程间通信的循环测试用的地址,\r\nB类地址以10开头,:2字节网络号,2字节主机号,所以IP范围为128.0.0.0~191.255.255.255,其中172.16.0.0-172.31.255.255保留作为局域网地址\r\nC类地址:以110开头,3字节网络号,1字节主机号,所以192.0.0.0~223.255.255.255,其中192.168.X.X保留作为局域网地址\r\nD类地址::以1110开头,作为多播地址,所以IP范围为224.0.0.0~239.255.255.255\r\nE类地址:11110开头(注书上描写虽然是以1111开头,但实际E类地址只到247所以应该是以11110开头),该类地址保留为今后使用,所以IP范围为240.0.0.0~247.255.255.255\r\n由于无分类编址方法的使用,对IP地址进行分类已经成为历史\r\n#### 子网划分\r\nIP地址分类将IP分为网络号和主机号,即设计为两级结构IP地址,而子网划分是在IP地址分类的基础上将IP设为三级结构IP地址,借用原来的主机号若干位作为子网号,再设置子网掩码来标识子网号和主机号\r\n解决问题:\r\n1.IP地址空间利用率有时很低,A类地址网络可连接主机数超过1000w,B类地址网络页超过w,但有些单位申请一个A类或B类地址网络后所连接的主机数并不多,且不愿意使用C类网络,因为考虑今后发展\r\n2.网络号过多会导致路由器的路由表变得太大而导致性能变差，每个路由表中的都应该能查到到达任意网络的下一跳路由器IP,网络数越多路由表的项目数自然越多，而子网划分不需要通过增加网络号来增加网络数量\r\n3.两级IP地址不够灵活，而划分子网后，可以任意修改子网数量，任意子网的IP数\r\n#### 无分类编址	(构造超网)\r\n子网划分虽然一定程度缓解了IP地址分类的问题，但依然使路由表项目数过多，IPv4地址不够分。所以很快就研究出采用无分址方法来解决前面的问题，无分类编址正式名为无类别域间路由CIDR(Classlsess Inter-Domain Routing)通过将IP地址分为网络前缀和主机号,然后在IP地址后加一个斜线然后写上网络前缀所占位数,来更加有效地对IP地址进行归类\r\n特点:\r\n1.消除了传统的A类,B类和C类地址以及划分子网的概念,即将IP地址改为网络前缀和主机号,网络前缀可以为任意长度\r\n2.把网络前缀都相同的连续的IP地址组成一个\"CIDR地址块\",只要知道CIDR地址块中的任何一个地址就能知道该地址块的最小地址,最大地址,地址数\r\n比如:128.14.35.7/20  前20位就为网络前缀,所以该地址块范围为128.14.32.0~128.14.47.255\r\n# ICMP协议\r\nICMP(Internet Control Message Protocol)因特网控制报文协议是用来更有效地转发IP数据报和提高交付成功的机会,本身不传输数据,ICMP报文直接装在IP数据报中作为其数据部分,相当于对IP协议功能的扩展\r\n## ICMP协议作用\r\n1.数据包差错检查:四种ICMP差错报文对应四种差错检查功能,分别是告诉源主机终点不可达,时间超过,参数问题改变路由\r\n2.检查网络是否通畅:ICMP除了ICMP差错报文外还有ICMP询问报文,其中的ICMP回送请求报文会要求目的主机必须回发ICMP回送回答报文,一般用来测试目的主机是否可达和网络通畅\r\n\r\n# ARP协议\r\nARP(Address Resolution Protocol)是地址解析协议,在实际主机发送数据时是已知目的IP地址的,但不知到目的Mac地址,而ARP协议就是提供根据IP地址获取物理地址的功能.根据IP协议使用了ARP协议且ARP包中有IP信息所以可以划归为网络层,但根据封装方式,ARP包封装成帧,是运行在数据链路层的,所以也能划归为数据链路层\r\n## ARP原理：\r\n1.首先每个主机都会有个ARP高速缓存区,里面有本局域网中的IP地址和MAC地址之间的映射关系列表\r\n2.当源主机都向某个目的主机发送数据时会检查目的IP地址是否为当前局域网地址,如果不是则需要将目的IP地址解析为当前局域网路由器的MAC地址.如果是则检查ARP李彪中是否有目的主机MAC地址,存在就直接发送数据,否则就向同一子网的所有主机广播发送ARP请求分组,该请求包中含有源IP地址,源MAC地址和目的IP地址\r\n3.局域网中主机收到ARP请求分组后,会检查是否IP地址一致,不一致就忽略,一致就将源主机IP和MAC都写入当前主机ARP列表,并向源主机发送ARP响应分组,包含了自己的MAC地址\r\n4.源主机收到ARP响应分组后就将该信息写入到ARP列表中,并利用此信息发送数据.如果源主机一直没收到ARP响应包则表示ARP解析失败\r\n# NAT技术\r\nNAT(Network Address Translation)是网络地址转换技术,于1994年提出的.需要在连接到互联网的路由器上安装NAT软件,实现将内部私有网络地址翻译成网络IP地址\r\n## NAT作用\r\n1.解决IP地址不足问题\r\n2.隐藏和保护本地网络的主机\r\n\r\n## NAT实现方式\r\n1.静态转换:一对一关系,私有IP地址和公有IP地址是一对一的,固定的,由管理员手动分配,这种方式简单,但需要足够多的公有IP地址\r\n2.动态转换:多对多关系,私有IP地址在连接网络时随机分配公有IP地址,当公有IP地址少于内部主机数可使用该方式\r\n3.端口多路复用:多对一关系,多个私有IP地址共同使用一个公有IP地址,来自内部不同主机的数据会使用随机的不同端口区分,从而最大限度节约IP资源,且可隐藏网络内部所有主机,目前网络中应用最多的就是该方式\r\n\r\n参考资料:《计算机网络（第7版）》 谢希仁 电子工业出版社．2017-11-15',1);
/*!40000 ALTER TABLE `blogapp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_article_tags`
--

DROP TABLE IF EXISTS `blogapp_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogapp_article_tags_article_id_tag_id_9b61237c_uniq` (`article_id`,`tag_id`),
  KEY `blogapp_article_tags_tag_id_d47132c9_fk_blogapp_tag_id` (`tag_id`),
  CONSTRAINT `blogapp_article_tags_article_id_b9571347_fk_blogapp_article_id` FOREIGN KEY (`article_id`) REFERENCES `blogapp_article` (`id`),
  CONSTRAINT `blogapp_article_tags_tag_id_d47132c9_fk_blogapp_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blogapp_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_article_tags`
--

LOCK TABLES `blogapp_article_tags` WRITE;
/*!40000 ALTER TABLE `blogapp_article_tags` DISABLE KEYS */;
INSERT INTO `blogapp_article_tags` VALUES (1,1,1);
/*!40000 ALTER TABLE `blogapp_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_category`
--

DROP TABLE IF EXISTS `blogapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blogapp_category_slug_62f2deac` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_category`
--

LOCK TABLES `blogapp_category` WRITE;
/*!40000 ALTER TABLE `blogapp_category` DISABLE KEYS */;
INSERT INTO `blogapp_category` VALUES (1,'2021-03-28 12:02:00.000000','2021-03-28 12:02:00.000000','ji-suan-ji-wang-luo','计算机网络');
/*!40000 ALTER TABLE `blogapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_message`
--

DROP TABLE IF EXISTS `blogapp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_message`
--

LOCK TABLES `blogapp_message` WRITE;
/*!40000 ALTER TABLE `blogapp_message` DISABLE KEYS */;
INSERT INTO `blogapp_message` VALUES (1,'test','test1','test','2021-06-28 03:32:27.000000'),(2,'test','test2','testtesttesttest','2021-06-28 03:32:47.000000');
/*!40000 ALTER TABLE `blogapp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_tag`
--

DROP TABLE IF EXISTS `blogapp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogapp_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blogapp_tag_slug_1da837ff` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_tag`
--

LOCK TABLES `blogapp_tag` WRITE;
/*!40000 ALTER TABLE `blogapp_tag` DISABLE KEYS */;
INSERT INTO `blogapp_tag` VALUES (1,'2021-03-29 16:20:00.000000','2021-03-29 16:20:00.000000','git','Git');
/*!40000 ALTER TABLE `blogapp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_app_comment`
--

DROP TABLE IF EXISTS `comment_app_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_app_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `last_mod_time` datetime(6) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `article_id` int(11) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_app_comment_article_id_f3b4961e_fk_blogapp_article_id` (`article_id`),
  KEY `comment_app_comment_author_id_f0acfeb6_fk_account_a` (`author_id`),
  KEY `comment_app_comment_parent_comment_id_dc824356_fk_comment_a` (`parent_comment_id`),
  CONSTRAINT `comment_app_comment_article_id_f3b4961e_fk_blogapp_article_id` FOREIGN KEY (`article_id`) REFERENCES `blogapp_article` (`id`),
  CONSTRAINT `comment_app_comment_author_id_f0acfeb6_fk_account_a` FOREIGN KEY (`author_id`) REFERENCES `account_app_bloguser` (`id`),
  CONSTRAINT `comment_app_comment_parent_comment_id_dc824356_fk_comment_a` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment_app_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_app_comment`
--

LOCK TABLES `comment_app_comment` WRITE;
/*!40000 ALTER TABLE `comment_app_comment` DISABLE KEYS */;
INSERT INTO `comment_app_comment` VALUES (1,'2021-06-28 03:02:33.852097','2021-06-28 03:02:33.852119','test',1,1,3,NULL);
/*!40000 ALTER TABLE `comment_app_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_app_bloguser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_app_bloguser_id` FOREIGN KEY (`user_id`) REFERENCES `account_app_bloguser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-06-28 02:03:51.004942','1','Category object (1)',1,'[{\"added\": {}}]',6,3),(2,'2021-06-28 02:05:34.447017','1','Tag object (1)',1,'[{\"added\": {}}]',8,3),(3,'2021-06-28 02:16:01.067447','1','Article object (1)',1,'[{\"added\": {}}]',9,3),(4,'2021-06-28 02:28:20.024869','1','Article object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]',9,3),(5,'2021-06-28 02:32:25.942092','1','Article object (1)',2,'[]',9,3),(6,'2021-06-28 02:32:50.225889','1','Article object (1)',2,'[{\"changed\": {\"fields\": [\"\\u4ecb\\u7ecd\"]}}]',9,3),(7,'2021-06-28 02:51:13.138074','1','Article object (1)',2,'[]',9,3),(8,'2021-06-28 02:58:14.589716','1','Article object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]',9,3),(9,'2021-06-28 03:00:03.992412','1','Article object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]',9,3),(10,'2021-06-28 03:08:08.866247','2','Article object (2)',1,'[{\"added\": {}}]',9,3),(11,'2021-06-28 03:08:50.955450','3','Article object (3)',1,'[{\"added\": {}}]',9,3),(12,'2021-06-28 03:08:57.612337','3','Article object (3)',2,'[]',9,3),(13,'2021-06-28 03:09:40.181711','4','Article object (4)',1,'[{\"added\": {}}]',9,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'account_app','bloguser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'blogapp','article'),(6,'blogapp','category'),(7,'blogapp','message'),(8,'blogapp','tag'),(11,'comment_app','comment'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-27 11:56:02.083493'),(2,'contenttypes','0002_remove_content_type_name','2021-06-27 11:56:03.381402'),(3,'auth','0001_initial','2021-06-27 11:56:07.591856'),(4,'auth','0002_alter_permission_name_max_length','2021-06-27 11:56:08.393574'),(5,'auth','0003_alter_user_email_max_length','2021-06-27 11:56:08.482742'),(6,'auth','0004_alter_user_username_opts','2021-06-27 11:56:08.559674'),(7,'auth','0005_alter_user_last_login_null','2021-06-27 11:56:08.621761'),(8,'auth','0006_require_contenttypes_0002','2021-06-27 11:56:08.680010'),(9,'auth','0007_alter_validators_add_error_messages','2021-06-27 11:56:08.741390'),(10,'auth','0008_alter_user_username_max_length','2021-06-27 11:56:08.807785'),(11,'auth','0009_alter_user_last_name_max_length','2021-06-27 11:56:08.875148'),(12,'auth','0010_alter_group_name_max_length','2021-06-27 11:56:09.063036'),(13,'auth','0011_update_proxy_permissions','2021-06-27 11:56:09.137984'),(14,'auth','0012_alter_user_first_name_max_length','2021-06-27 11:56:09.228000'),(15,'account_app','0001_initial','2021-06-27 11:56:14.315644'),(16,'admin','0001_initial','2021-06-27 11:56:16.255414'),(17,'admin','0002_logentry_remove_auto_add','2021-06-27 11:56:16.351660'),(18,'admin','0003_logentry_add_action_flag_choices','2021-06-27 11:56:16.442223'),(19,'blogapp','0001_initial','2021-06-27 11:56:23.050315'),(20,'comment_app','0001_initial','2021-06-27 11:56:25.720194'),(21,'sessions','0001_initial','2021-06-27 11:56:26.614769');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0701t2ug70lxfcez9ps6p9lujkdwrd84','.eJxVjEsOwjAMBe-SNYqapk5sluw5QxU7DimgVupnhbg7VOoCtm9m3sv0aVtrvy0690M2Z-PN6XfjJA8dd5DvabxNVqZxnQe2u2IPutjrlPV5Ody_g5qW-q0lFm61AUgMARECaCme0GFsXScIbZeZWEiZolJxgTw6UQiE4nNj3h_ftzek:1lxgbH:FXbvH60QeiwPJJY78abtFHHk1HQwM-gRM8bAI0K-OP0','2021-07-12 02:02:15.336679');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28  4:20:25
