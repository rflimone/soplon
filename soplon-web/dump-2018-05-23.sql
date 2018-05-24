-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: mariadb_soplon
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_categoria` varchar(255) NOT NULL,
  `resenia` varchar(45) DEFAULT NULL COMMENT 'pequeña reseña para la categoria',
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Mangas',NULL),(2,'Deportes',NULL),(3,'Conciertos',NULL),(4,'Cine',NULL),(5,'Libros',NULL),(6,'Animé',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_envio`
--

DROP TABLE IF EXISTS `metodos_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodos_envio` (
  `id_metodos_envio` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_metodo_envio` varchar(255) DEFAULT NULL,
  `id_usuarios` int(11) NOT NULL,
  PRIMARY KEY (`id_metodos_envio`),
  UNIQUE KEY `id_metodos_envio` (`id_metodos_envio`),
  KEY `FKMetodos_En279065` (`id_usuarios`),
  CONSTRAINT `FKMetodos_En279065` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_envio`
--

LOCK TABLES `metodos_envio` WRITE;
/*!40000 ALTER TABLE `metodos_envio` DISABLE KEYS */;
INSERT INTO `metodos_envio` VALUES (1,'email',1),(2,'push celular',1);
/*!40000 ALTER TABLE `metodos_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paginas`
--

DROP TABLE IF EXISTS `paginas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paginas` (
  `id_paginas` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `url_ultimo` varchar(255) DEFAULT NULL,
  `titulo_pagina` varchar(255) DEFAULT NULL,
  `glosa_pagina` varchar(255) DEFAULT NULL,
  `date_last` datetime DEFAULT NULL,
  `date_new` datetime DEFAULT NULL,
  `imagen` blob,
  `id_categorias` int(11) NOT NULL,
  PRIMARY KEY (`id_paginas`),
  UNIQUE KEY `id_paginas` (`id_paginas`),
  KEY `date_last` (`date_last`),
  KEY `date_new` (`date_new`),
  KEY `id_categorias` (`id_categorias`),
  CONSTRAINT `FKPaginas407486` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paginas`
--

LOCK TABLES `paginas` WRITE;
/*!40000 ALTER TABLE `paginas` DISABLE KEYS */;
INSERT INTO `paginas` VALUES (1,'https://readms.net','https://readms.net/manga/one_piece','readms.net','MangaStream','2018-05-22 01:35:19','2018-03-30 18:09:22',NULL,1),(2,'https://readms.net/rss','http://readms.net/r/akagami/96/5067/1','Akagami no Shirayukihime 96','-no title-','2018-05-03 01:14:57','2018-05-12 15:27:26',NULL,1),(3,'https://jaiminisbox.com','https://jaiminisbox.com/reader/series/one-piece-2','jaiminisbox.com','Jaiminisbox','2018-05-22 01:35:20','2018-05-10 16:53:48',NULL,1),(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2310147-Gran-Arena-Monticello-Kool-And-The-Gang-Fiesta-Radio-Activa.html','KOOL AND THE GANG - FIESTA RADIO ACTIVA / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 29 de Septiembre / 21:00 hrs.','2018-05-03 01:14:57','2018-05-16 15:27:26',NULL,2);
/*!40000 ALTER TABLE `paginas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscripciones`
--

DROP TABLE IF EXISTS `subscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscripciones` (
  `id_subscripciones` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `id_paginas` int(11) NOT NULL,
  `id_tags` int(11) NOT NULL,
  PRIMARY KEY (`id_subscripciones`,`id_usuarios`,`id_paginas`),
  UNIQUE KEY `id_subscripciones` (`id_subscripciones`),
  KEY `id_usuarios` (`id_usuarios`),
  KEY `id_paginas` (`id_paginas`),
  KEY `id_tags` (`id_tags`),
  CONSTRAINT `FKSubscripci189109` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`),
  CONSTRAINT `FKSubscripci465054` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  CONSTRAINT `FKSubscripci650517` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscripciones`
--

LOCK TABLES `subscripciones` WRITE;
/*!40000 ALTER TABLE `subscripciones` DISABLE KEYS */;
INSERT INTO `subscripciones` VALUES (1,1,1,1),(3,1,3,1),(2,1,2,2),(4,2,4,3);
/*!40000 ALTER TABLE `subscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id_tags` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE KEY `id_tags` (`id_tags`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'one_piece'),(2,'haikyuu'),(3,'colo-colo'),(4,'one-piece');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_paginas`
--

DROP TABLE IF EXISTS `tags_paginas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_paginas` (
  `id_tags` int(11) NOT NULL,
  `id_paginas` int(11) NOT NULL,
  PRIMARY KEY (`id_tags`,`id_paginas`),
  KEY `id_tags` (`id_tags`),
  KEY `id_paginas` (`id_paginas`),
  CONSTRAINT `FKTags_Pagin247397` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`),
  CONSTRAINT `FKTags_Pagin884566` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_paginas`
--

LOCK TABLES `tags_paginas` WRITE;
/*!40000 ALTER TABLE `tags_paginas` DISABLE KEYS */;
INSERT INTO `tags_paginas` VALUES (1,1),(1,3),(2,2),(3,4),(4,3);
/*!40000 ALTER TABLE `tags_paginas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `celular` int(10) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `celular` (`celular`),
  UNIQUE KEY `id_usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1),(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_access`
--

DROP TABLE IF EXISTS `ws_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_access`
--

LOCK TABLES `ws_access` WRITE;
/*!40000 ALTER TABLE `ws_access` DISABLE KEYS */;
INSERT INTO `ws_access` VALUES (4,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','api/pages',NULL,NULL);
/*!40000 ALTER TABLE `ws_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_keys`
--

DROP TABLE IF EXISTS `ws_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_keys`
--

LOCK TABLES `ws_keys` WRITE;
/*!40000 ALTER TABLE `ws_keys` DISABLE KEYS */;
INSERT INTO `ws_keys` VALUES (2,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug',0,0,0,NULL,'2018-05-23 02:51:03');
/*!40000 ALTER TABLE `ws_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_limits`
--

DROP TABLE IF EXISTS `ws_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_limits`
--

LOCK TABLES `ws_limits` WRITE;
/*!40000 ALTER TABLE `ws_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_logs`
--

DROP TABLE IF EXISTS `ws_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` tinyint(1) NOT NULL,
  `response_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_logs`
--

LOCK TABLES `ws_logs` WRITE;
/*!40000 ALTER TABLE `ws_logs` DISABLE KEYS */;
INSERT INTO `ws_logs` VALUES (414,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043869,0.406602,1,0),(415,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043900,0.162532,1,0),(416,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043936,0.497651,1,0),(417,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043954,0.221903,1,400),(418,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043980,0.231596,1,400),(419,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527044003,0.288896,1,400),(420,'api/pages/pages/category/mangas/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:6:\"mangas\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527044009,0.176626,1,200);
/*!40000 ALTER TABLE `ws_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_users_api`
--

DROP TABLE IF EXISTS `ws_users_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_users_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_users_api`
--

LOCK TABLES `ws_users_api` WRITE;
/*!40000 ALTER TABLE `ws_users_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_users_api` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23  0:48:58
