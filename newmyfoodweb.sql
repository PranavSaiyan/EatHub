-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: myfoodweb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Pranav Gupta','saiyan','ifucku','pranavsupersaiyan10@','9906902048');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avtars`
--

DROP TABLE IF EXISTS `avtars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avtars` (
  `name` varchar(20) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avtars`
--

LOCK TABLES `avtars` WRITE;
/*!40000 ALTER TABLE `avtars` DISABLE KEYS */;
INSERT INTO `avtars` VALUES ('default','images/tomato.gif'),('tomato','images/newavtar/tomato.gif'),('stawberry','images/tumblr_oa0rgmPES01vx777ao1_500.gif'),('apple','images/animated-apple-image-0017.gif'),('pear','images/Cute-Animated-Gif-Pear.gif'),('carrot','images/carrot.gif'),('brinjal','images/brinjal.gif'),('banana','images/newavtar/banana.jpg'),('burger','images/burger.gif'),('cheese','images/newavtar/cheese.gif'),('pizza','images/newavtar/pizza.gif'),('coconut','images/newavtar/coconut.gif'),('egg','images/newavtar/egg.gif'),('garlic','images/newavtar/garlic.gif'),('grapes','images/newavtar/grapes.gif'),('nachos','images/newavtar/nachos.gif'),('onion','images/newavtar/onion.gif'),('pepper','images/newavtar/pepper.gif'),('pineapple','images/newavtar/pineapple.gif'),('pomegranate','images/newavtar/pomegranate.gif'),('potato','images/newavtar/potato.gif');
/*!40000 ALTER TABLE `avtars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `Item` varchar(50) DEFAULT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('null','null','null','null','Full',0,'null'),('Pranav Gupta','pranavsupersaiyan10@gmail.com','9906902048','CHICKEN MOMO STEAM','Half',30,'MOMOS'),('Pranav Gupta','pranavsupersaiyan10@gmail.com','9906902048','CHICKEN MOMO STEAM','Half',30,'MOMOS');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `Category` varchar(100) DEFAULT NULL,
  `Item` varchar(100) NOT NULL,
  `HalfPrice` int(11) DEFAULT NULL,
  `FullPrice` int(11) DEFAULT NULL,
  `Image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('CHICKEN','BUTTER CHICKEN',190,380,'Krish_028-Butter-Chicken-web.jpg'),('VEG','BUTTER PANEER',80,180,'restaurant-style-paneer-butter-masala-recipe.1024x1024-4.jpg'),('CHICKEN','CHICKEN CHILLY',160,300,'maxresdefault (1).jpg'),('CHOWMEIN','CHICKEN CHOWMEIN',50,80,'image.jpg'),('CHOWMEIN','CHICKEN CHOWMEIN DOUBLE CHKN',70,110,'maxresdefault.jpg'),('CHICKEN','CHICKEN CURRY',180,360,'chicken-curry_625x350_61430904532.jpg'),('RICE','CHICKEN FRIED RICE',50,80,'DSC_0091_thumb.jpg'),('RICE','CHICKEN FRIED RICE CHOPPED',60,100,'DSC04968-001.JPG'),('RICE','CHICKEN FRIED RICE DOUBLE CHKN',70,100,'FRIED-RICE_13057.jpg'),('SOUP','CHICKEN HOT & SOUR',0,50,'000029176_chicken-hot--n--sour-soup.jpg'),('MOMOS','CHICKEN MOMO CHILLY',70,120,'maxresdefault.jpg'),('MOMOS','CHICKEN MOMO STEAM',30,60,'Fried-Chicken-Momos-Recipe.jpg'),('SOUP','CHICKEN MONCHO',0,60,'54f4a5bf1042a_-_chicken-noodle-soup-recipe.jpg'),('CHICKEN','CHICKEN MUNCHURIAN',160,300,'chicken-manchurian-starter.jpg'),('CHICKEN','CHICKEN PAKORA',150,300,'chicken pakoda-620.jpg'),('PASTA','CHICKEN PASTA',0,90,'maxresdefault.jpg'),('ROLLS','CHICKEN ROLL',0,50,'deafa6cce686e462303bc273b73824c4.jpg'),('SOUP','CHICKEN SOUP',0,50,'maxresdefault.jpg'),('TIKKA','CHICKEN TIKKA',0,140,'57202320120172302040.jpg'),('VEG','CHILLY PANEER',60,130,'IMG_4144.JPG'),('CHOWMEIN','EGG CHOWMEIN',40,70,'egg_chow_mein.png'),('RICE','EGG FRIED RICE',40,70,'egg-fried-rice-8.jpg'),('ROLLS','EGG ROLL',0,80,'ed12.jpg'),('CHICKEN','GRILLED CHICKEN',150,300,'20120522-grilled-chicken-memorial-day-recipes-18.jpg'),('CHICKEN','LEMON CHICKEN',170,320,'landscape-1455309017-delish-chicken-piccata-2.jpg'),('CHICKEN','MASALA CHICKEN',180,340,'maxresdefault.jpg'),('RICE','MUTTON FRIED RICE',60,100,'mutton-fried-rice.jpg'),('RICE','MUTTON FRIED RICE DOUBLE MUTTON',80,140,'Nasgor Kambing2.jpg'),('MOMOS','MUTTON MOMO CHILLY',70,130,'Mutton-momo.jpg'),('MOMOS','MUTTON MOMO FRIED',45,80,'s458543484541812744_p8_i1_w640.jpeg'),('MOMOS','MUTTON MOMO STEAM',35,70,'buiscuits-and-momo-100-001.jpg'),('PASTA','MUTTON PASTA',0,110,'55147_KRL_K2260V0_OR1_H_640x428.jpg'),('TIKKA','MUTTON TIKKA',0,140,'ct one.jpg'),('VEG','PANEER TIKKA FRY',0,100,'Achari_Paneer_Tikka_Recipe_Party_Food.JPG'),('VEG','TAMATO PANEER',0,120,'1-27.jpg'),('CHICKEN','TAWA CHICKEN',180,340,'DSC_1075.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Price` varchar(10) NOT NULL,
  `Accept` int(11) NOT NULL,
  `Cooked` int(11) NOT NULL,
  `Delivered` int(11) NOT NULL,
  `Decline` int(11) NOT NULL,
  `Date` varchar(40) NOT NULL,
  `Time` varchar(40) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `pay` int(2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (6,'Pranav Gupta','MUTTON TIKKA(Full) |MUTTON PASTA(Full) |','295.0',1,1,1,0,'07/11/2017','16:39:02','pranavsupersaiyan10@gmail.com','PGXqE1UgFJv8',1),(5,'Abhishek Kumar','CHICKEN FRIED RICE(Full) |CHICKEN FRIED RICE CHOPPED(Half) |','165.2',1,1,1,0,'03/11/2017','10:13:17','abhi.kumar736@gmail.com','87pPi1q5XyCj',0),(4,'Pranav Gupta','CHICKEN TIKKA(Full) |MUTTON TIKKA(Full) |','330.4',1,1,1,0,'03/11/2017','09:38:10','pranavsupersaiyan10@gmail.com','I4nVFDabojdZ',1),(7,'Pranav Gupta','CHICKEN TIKKA(Full) |','165.2',1,1,0,0,'20/11/2017','22:52:38','pranavsupersaiyan10@gmail.com','uF67Cr4giLof',0),(8,'Pranav Gupta','mutton curry','20',1,1,0,1,'11/27/2017','1:47','pranavsupersaiyan10@gmail.com','yg675g87y67',2),(9,'Pranav Gupta','CHICKEN MOMO CHILLY(Full) |CHICKEN MOMO CHILLY(Half) |CHICKEN MOMO STEAM(Full) |','295.0',1,0,0,0,'24/11/2017','10:26:54','pranavsupersaiyan10@gmail.com','KFvmW1WVlmpQ',0);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopstatus`
--

DROP TABLE IF EXISTS `shopstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopstatus` (
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopstatus`
--

LOCK TABLES `shopstatus` WRITE;
/*!40000 ALTER TABLE `shopstatus` DISABLE KEYS */;
INSERT INTO `shopstatus` VALUES ('NO');
/*!40000 ALTER TABLE `shopstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untitled`
--

DROP TABLE IF EXISTS `untitled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `untitled` (
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `About` varchar(200) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Interest` varchar(100) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Avtar` varchar(20) NOT NULL,
  `OTP` varchar(10) NOT NULL,
  `Success` int(2) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untitled`
--

LOCK TABLES `untitled` WRITE;
/*!40000 ALTER TABLE `untitled` DISABLE KEYS */;
INSERT INTO `untitled` VALUES ('pranavsupersaiyan10@gmail.com','Pranav','Gupta','ifucku247','Em a developer','Male','Spanish French ','1997-11-27','9906902048','JammuandKashmir','banana','AYF8ON8Y',1),('kalaapoorva@gmail.com','Apoorva','jain','Apoo12345@_','I m very cute','Female','Spanish French French ','2017-11-08','09872518207','Rajasthan','default','H8C2CFFN',1);
/*!40000 ALTER TABLE `untitled` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-06 13:04:42
