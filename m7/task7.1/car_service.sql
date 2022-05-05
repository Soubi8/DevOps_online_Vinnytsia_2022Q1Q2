-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: car_service
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients_info`
--

DROP TABLE IF EXISTS `clients_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_info` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `car` varchar(30) NOT NULL,
  `release_year` int NOT NULL,
  `vin` varchar(17) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_info`
--

LOCK TABLES `clients_info` WRITE;
/*!40000 ALTER TABLE `clients_info` DISABLE KEYS */;
INSERT INTO `clients_info` VALUES (1001,'Andrii','Daewoo Lanos',2015,'2GNFLGEK5D6416554','688233443'),(1002,'Maksym','Audi A4',2011,'KNDJC733745285895','972310098'),(1003,'Olena','Fiat 500',2013,'2B3KA43G07H836713','987371223'),(1004,'Vasyl','Opel Astra',2012,'WBAEA5C55ACV92970','931288323'),(1005,'Volodymyr','BMW X1',2014,'3N1AB7AP7EY247485','985644771'),(1006,'Svitlana','Hyundai i10',2013,'JS2GB41W0Y5183116','977544317'),(1007,'Alina','Audi Q3',2018,'3A8FY58898T170603','938709162');
/*!40000 ALTER TABLE `clients_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `seq_num` int NOT NULL,
  `item_description` varchar(60) NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `part_number` int NOT NULL,
  `price` int NOT NULL,
  `order_num` int NOT NULL,
  PRIMARY KEY (`part_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Oil Filter','brand',1232,300,22003),(2,'Oil Filter','brand',5433,300,22007),(3,'Oil 5w20 5L','brand',8749,700,22006),(4,'Oil 5w30 5L','brand',8750,700,22007),(5,'Oil 5w40 5L','brand',8751,750,22003),(6,'Door Handle Mazda 3 OEM','brand',12012,650,22010),(7,'Brake Pads','brand',12345,900,22004),(8,'Front Shock (Pair)','brand',62531,2400,22008),(9,'AC Gas R410A','brand',65432,600,22009),(10,'Oil Filter','brand',65782,250,22006),(11,'Coolant 5L Concentrate G12+','brand',72230,1000,22001),(12,'Rear Shock (Pair)','brand',87123,2500,22005);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_orders` (
  `order_num` int NOT NULL,
  `customer_id` int NOT NULL,
  `job_description` varchar(60) NOT NULL,
  `price` int NOT NULL,
  `employee` varchar(15) NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_orders`
--

LOCK TABLES `work_orders` WRITE;
/*!40000 ALTER TABLE `work_orders` DISABLE KEYS */;
INSERT INTO `work_orders` VALUES (22001,1002,'Coolant replacement',1000,'Andrii',2000),(22002,1004,'Wheel allignment',500,'Oleksandr ',500),(22003,1005,'Oil change',600,'Andrii',1650),(22004,1001,'Replacement of front brake pads',800,'Oleksandr ',1700),(22005,1003,'Rear shocks replacement',1500,'Oleksandr ',4000),(22006,1006,'Oil change',600,'Andrii',1550),(22007,1002,'Oil change',600,'Andrii',1600),(22008,1007,'Front shocks replacement',1500,'Oleksandr ',3900),(22009,1004,'A/C refill',1000,'Oleksandr ',1600),(22010,1001,'Door handle replacement',400,'Oleksandr ',1050);
/*!40000 ALTER TABLE `work_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 19:30:14
