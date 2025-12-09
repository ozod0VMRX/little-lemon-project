-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: global_superstore
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calendar_dates`
--

DROP TABLE IF EXISTS `calendar_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_dates` (
  `date_id` date NOT NULL,
  `year` int DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `month_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int DEFAULT NULL,
  `day_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_dates`
--

LOCK TABLES `calendar_dates` WRITE;
/*!40000 ALTER TABLE `calendar_dates` DISABLE KEYS */;
INSERT INTO `calendar_dates` VALUES ('2020-11-05',2020,4,11,'November',5,'Thursday',0),('2020-11-08',2020,4,11,'November',8,'Sunday',1),('2021-02-15',2021,1,2,'February',15,'Monday',0),('2021-02-17',2021,1,2,'February',17,'Wednesday',0),('2021-02-18',2021,1,2,'February',18,'Thursday',0),('2021-12-10',2021,4,12,'December',10,'Friday',0),('2021-12-12',2021,4,12,'December',12,'Sunday',1),('2022-06-20',2022,2,6,'June',20,'Monday',0),('2022-06-22',2022,2,6,'June',22,'Wednesday',0),('2022-08-30',2022,3,8,'August',30,'Tuesday',0),('2022-09-02',2022,3,9,'September',2,'Friday',0);
/*!40000 ALTER TABLE `calendar_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Furniture'),(2,'Office Supplies'),(3,'Technology');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('CUST-001','John Doe','Consumer',1),('CUST-002','Acme Corp','Corporate',4),('CUST-003','Jane Smith','Home Office',2),('CUST-004','Store ABC','Consumer',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_customer`
--

DROP TABLE IF EXISTS `dim_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_customer` (
  `cust_key` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `segment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cust_key`),
  UNIQUE KEY `uk_cust` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_customer`
--

LOCK TABLES `dim_customer` WRITE;
/*!40000 ALTER TABLE `dim_customer` DISABLE KEYS */;
INSERT INTO `dim_customer` VALUES (1,'CUST-001','John Doe','Consumer','California','Los Angeles'),(2,'CUST-002','Acme Corp','Corporate','New York','New York'),(3,'CUST-003','Jane Smith','Home Office','California','San Francisco'),(4,'CUST-004','Store ABC','Consumer','Texas','Houston');
/*!40000 ALTER TABLE `dim_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_date` (
  `date_key` date NOT NULL,
  `year` int DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `month_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int DEFAULT NULL,
  `day_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_date`
--

LOCK TABLES `dim_date` WRITE;
/*!40000 ALTER TABLE `dim_date` DISABLE KEYS */;
INSERT INTO `dim_date` VALUES ('2020-11-05',2020,4,11,'November',5,'Thursday',0),('2020-11-08',2020,4,11,'November',8,'Sunday',1),('2021-02-15',2021,1,2,'February',15,'Monday',0),('2021-02-17',2021,1,2,'February',17,'Wednesday',0),('2021-02-18',2021,1,2,'February',18,'Thursday',0),('2021-12-10',2021,4,12,'December',10,'Friday',0),('2021-12-12',2021,4,12,'December',12,'Sunday',1),('2022-06-20',2022,2,6,'June',20,'Monday',0),('2022-06-22',2022,2,6,'June',22,'Wednesday',0),('2022-08-30',2022,3,8,'August',30,'Tuesday',0),('2022-09-02',2022,3,9,'September',2,'Friday',0);
/*!40000 ALTER TABLE `dim_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_location`
--

DROP TABLE IF EXISTS `dim_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_location` (
  `loc_key` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`loc_key`),
  UNIQUE KEY `uk_loc` (`country`,`state`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_location`
--

LOCK TABLES `dim_location` WRITE;
/*!40000 ALTER TABLE `dim_location` DISABLE KEYS */;
INSERT INTO `dim_location` VALUES (1,'USA','West','California','Los Angeles'),(2,'USA','West','California','San Francisco'),(3,'USA','West','Oregon','Portland'),(4,'USA','East','New York','New York'),(5,'USA','South','Texas','Houston'),(6,'USA','Midwest','Illinois','Chicago');
/*!40000 ALTER TABLE `dim_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_product`
--

DROP TABLE IF EXISTS `dim_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_product` (
  `prod_key` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prod_key`),
  UNIQUE KEY `uk_prod` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_product`
--

LOCK TABLES `dim_product` WRITE;
/*!40000 ALTER TABLE `dim_product` DISABLE KEYS */;
INSERT INTO `dim_product` VALUES (1,'P-100','Executive Chair','Furniture','Chairs'),(2,'P-101','Wooden Table','Furniture','Tables'),(3,'P-200','A4 Paper Pack','Office Supplies','Paper'),(4,'P-300','iPhone Case','Technology','Accessories'),(5,'P-400','Android Phone','Technology','Phones');
/*!40000 ALTER TABLE `dim_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_sales`
--

DROP TABLE IF EXISTS `fact_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_sales` (
  `fact_id` int NOT NULL AUTO_INCREMENT,
  `date_key` date DEFAULT NULL,
  `prod_key` int DEFAULT NULL,
  `cust_key` int DEFAULT NULL,
  `loc_key` int DEFAULT NULL,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sales` decimal(12,2) DEFAULT NULL,
  `profit` decimal(12,2) DEFAULT NULL,
  `shipping_cost` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`fact_id`),
  KEY `order_id` (`order_id`),
  KEY `date_key` (`date_key`),
  KEY `prod_key` (`prod_key`),
  KEY `cust_key` (`cust_key`),
  KEY `loc_key` (`loc_key`),
  CONSTRAINT `fact_sales_ibfk_1` FOREIGN KEY (`date_key`) REFERENCES `dim_date` (`date_key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fact_sales_ibfk_2` FOREIGN KEY (`prod_key`) REFERENCES `dim_product` (`prod_key`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fact_sales_ibfk_3` FOREIGN KEY (`cust_key`) REFERENCES `dim_customer` (`cust_key`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fact_sales_ibfk_4` FOREIGN KEY (`loc_key`) REFERENCES `dim_location` (`loc_key`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_sales`
--

LOCK TABLES `fact_sales` WRITE;
/*!40000 ALTER TABLE `fact_sales` DISABLE KEYS */;
INSERT INTO `fact_sales` VALUES (1,'2021-02-15',1,1,2,'O-1000',2,800.00,200.00,25.00),(2,'2021-02-15',1,1,1,'O-1000',2,800.00,200.00,25.00),(3,'2021-02-15',3,1,2,'O-1000',5,45.00,10.00,5.00),(4,'2021-02-15',3,1,1,'O-1000',5,45.00,10.00,5.00),(5,'2022-06-20',4,2,4,'O-1001',10,250.00,60.00,40.00),(6,'2020-11-05',2,3,2,'O-1002',1,450.00,120.00,30.00),(7,'2020-11-05',2,3,1,'O-1002',1,450.00,120.00,30.00),(8,'2022-08-30',5,4,5,'O-1003',3,1800.00,400.00,60.00),(9,'2021-12-10',3,1,2,'O-1004',20,180.00,30.00,12.00),(10,'2021-12-10',3,1,1,'O-1004',20,180.00,30.00,12.00);
/*!40000 ALTER TABLE `fact_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USA',
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `uk_location` (`country`,`state`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'USA','West','California','Los Angeles','90001'),(2,'USA','West','California','San Francisco','94105'),(3,'USA','West','Oregon','Portland','97201'),(4,'USA','East','New York','New York','10001'),(5,'USA','South','Texas','Houston','77001'),(6,'USA','Midwest','Illinois','Chicago','60601');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `discount` decimal(5,2) DEFAULT '0.00',
  `sales` decimal(12,2) NOT NULL DEFAULT '0.00',
  `profit` decimal(12,2) DEFAULT '0.00',
  `shipping_cost` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`order_detail_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,'O-1000','P-100',2,0.00,800.00,200.00,25.00),(2,'O-1000','P-200',5,0.10,45.00,10.00,5.00),(3,'O-1001','P-300',10,0.05,250.00,60.00,40.00),(4,'O-1002','P-101',1,0.00,450.00,120.00,30.00),(5,'O-1003','P-400',3,0.00,1800.00,400.00,60.00),(6,'O-1004','P-200',20,0.00,180.00,30.00,12.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `ship_date` date DEFAULT NULL,
  `ship_mode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `location_id` (`location_id`),
  KEY `order_date` (`order_date`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O-1000','2021-02-15','2021-02-17','Second Class','CUST-001',1),('O-1001','2022-06-20','2022-06-22','Standard Class','CUST-002',4),('O-1002','2020-11-05','2020-11-08','First Class','CUST-003',2),('O-1003','2022-08-30','2022-09-02','Standard Class','CUST-004',5),('O-1004','2021-12-10','2021-12-12','Second Class','CUST-001',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('P-100','Executive Chair',1,1),('P-101','Wooden Table',1,2),('P-200','A4 Paper Pack',2,3),('P-300','iPhone Case',3,6),('P-400','Android Phone',3,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `shipment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,'O-1000','UPS','2021-02-17','Delivered'),(2,'O-1001','FedEx','2022-06-22','Delivered'),(3,'O-1002','USPS','2020-11-08','Delivered'),(4,'O-1003','UPS','2022-09-02','Delivered');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `uk_subcat_cat` (`subcategory_name`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (6,'Accessories',3),(4,'Binders',2),(1,'Chairs',1),(3,'Paper',2),(5,'Phones',3),(2,'Tables',1);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_sales_by_state`
--

DROP TABLE IF EXISTS `v_sales_by_state`;
/*!50001 DROP VIEW IF EXISTS `v_sales_by_state`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_sales_by_state` AS SELECT 
 1 AS `country`,
 1 AS `region`,
 1 AS `state`,
 1 AS `total_sales`,
 1 AS `total_profit`,
 1 AS `total_quantity`,
 1 AS `total_shipping`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_sales_by_state`
--

/*!50001 DROP VIEW IF EXISTS `v_sales_by_state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sales_by_state` AS select `l`.`country` AS `country`,`l`.`region` AS `region`,`l`.`state` AS `state`,sum(`od`.`sales`) AS `total_sales`,sum(`od`.`profit`) AS `total_profit`,sum(`od`.`quantity`) AS `total_quantity`,sum(`od`.`shipping_cost`) AS `total_shipping` from ((`order_details` `od` join `orders` `o` on((`od`.`order_id` = `o`.`order_id`))) join `locations` `l` on((`o`.`location_id` = `l`.`location_id`))) group by `l`.`country`,`l`.`region`,`l`.`state` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 13:57:58
