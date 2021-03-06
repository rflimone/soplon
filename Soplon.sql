/*
	SQLyog Ultimate v12.4.3 (64 bit)
	MySQL - 5.7.21 : Database - mariadb_soplon
	*********************************************************************
	*/

	/*!40101 SET NAMES utf8 */;

	/*!40101 SET SQL_MODE=''*/;

	/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
	/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
	/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
	/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
	CREATE DATABASE /*!32312 IF NOT EXISTS*/`mariadb_soplon` /*!40100 DEFAULT CHARACTER SET latin1 */;

	USE `mariadb_soplon`;

	/*Table structure for table `categorias` */

	DROP TABLE IF EXISTS `categorias`;

	CREATE TABLE `categorias` (
	  `id_categorias` INT(11) NOT NULL AUTO_INCREMENT,
	  `glosa_categoria` VARCHAR(255) NOT NULL COMMENT 'nombre de categoria que aperece en el sitio',
	  `alias_categoria` VARCHAR(45) DEFAULT NULL COMMENT 'alias de busqueda regex',
	  `resenia` VARCHAR(100) DEFAULT NULL COMMENT 'pequena resena para la categoria',
	  PRIMARY KEY (`id_categorias`),
	  UNIQUE KEY `id_categorias` (`id_categorias`)
	) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

	/*Data for the table `categorias` */

	INSERT  INTO `categorias`(`id_categorias`,`glosa_categoria`,`alias_categoria`,`resenia`) VALUES 
	(1,'Manga','manga','Recibe las últimas actualizaciones de mangas, en tiempo real!'),
	(2,'Deportes','deporte|sports','Encuentra entradas a deportes, en el momento que comience su venta!'),
	(3,'Conciertos','concierto|musica|concerts','Entérate de los últimos eventos musicales, conciertos o eventos!'),
	(4,'Teatro','cine|teatro|theatre','Prepárate y asiste a las funciones destacadas!'),
	(5,'Cultura','libros|seminars|events','Acude a lo último en eventos, libros y seminarios!'),
	(6,'Anime','anime|crunchyroll','Mira los animé que todos están mirando, sin importar de donde!'),
	(7,'Familia','family|familia','Obtén entradas para eventos familiares!');

	/*Table structure for table `metodos_envio` */

	DROP TABLE IF EXISTS `metodos_envio`;

	CREATE TABLE `metodos_envio` (
	  `id_metodos_envio` INT(11) NOT NULL AUTO_INCREMENT,
	  `glosa_metodo_envio` VARCHAR(255) DEFAULT NULL,
	  `id_usuarios` INT(11) NOT NULL,
	  `id_subscripciones` INT(11) NOT NULL,
	  PRIMARY KEY (`id_metodos_envio`),
	  UNIQUE KEY `id_metodos_envio` (`id_metodos_envio`),
	  KEY `FKMetodos_En279065` (`id_usuarios`),
	  CONSTRAINT `FKMetodos_En279065` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
	) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

	/*Data for the table `metodos_envio` */

	INSERT  INTO `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`,`id_subscripciones`) VALUES 
	(1,'email',1,1),
	(2,'sms',1,2),
	(3,'push',1,3),
	(4,'email',1,4),
	(5,'email',3,5),
	(6,'email',3,6),
	(7,'sms',4,7),
	(8,'email',4,8);

	/*Table structure for table `paginas` */

	DROP TABLE IF EXISTS `paginas`;

	CREATE TABLE `paginas` (
	  `id_paginas` INT(11) NOT NULL AUTO_INCREMENT,
	  `url` VARCHAR(255) DEFAULT NULL,
	  `url_ultimo` VARCHAR(255) DEFAULT NULL,
	  `titulo_pagina` VARCHAR(255) DEFAULT NULL,
	  `glosa_pagina` VARCHAR(10000) DEFAULT NULL,
	  `date_last` DATETIME DEFAULT NULL,
	  `date_new` DATETIME DEFAULT NULL,
	  `imagen` VARCHAR(10000) DEFAULT NULL,
	  `id_categorias` INT(11) NOT NULL,
	  PRIMARY KEY (`id_paginas`),
	  UNIQUE KEY `id_paginas` (`id_paginas`),
	  KEY `date_last` (`date_last`),
	  KEY `date_new` (`date_new`),
	  KEY `id_categorias` (`id_categorias`),
	  CONSTRAINT `FKPaginas407486` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`)
	) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

	/*Data for the table `paginas` */

	INSERT  INTO `paginas`(`id_paginas`,`url`,`url_ultimo`,`titulo_pagina`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) VALUES 
	(1,'https://readms.net/rss','https://readms.net/r/one_piece/904/5058/1','The Commanders of the Revolutionary Army Appear 904','martes, 22 de mayo de 2018 13:48','2018-05-22 01:35:19','2018-04-22 13:48:22',NULL,1),
	(2,'https://mangahis.com/feed','https://mangahis.com/manga/onepunchman/91','Onepunch-Man #91','Rover','2018-03-18 01:14:57','2018-04-29 13:33:37',NULL,1),
	(3,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/one-piece-2/en/0/914/','One Piece Chapter 914: Okobore, The Town of Leftovers','','2018-08-17 05:09:47','2018-08-17 05:09:47','<img src="https://i2.wp.com/jaiminisbox.com/reader/content/comics/one-piece-2_58650da78040f/thumb_3drv79et.jpg" />',1),
	(4,'https://www.ticketpro.cl/rss/','https://www.ticketpro.cl/sports/1405618-Union-Espanola-vs-Universidad-Catolica-Campeonato-Scotiabank-2018.html','UNIÓN ESPAÑOLA VS UNIVERSIDAD CATOLICA / CAMPEONATO SCOTIABANK 2018','Estadio Santa Laura - Universidad Sek , Sábado 01 de Septiembre, 17:30 hrs.','2018-08-22 17:10:00','2018-08-22 17:10:00',NULL,2),
	(5,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/cells-at-work/episode-5-cedar-pollen-allergies-774887','Cells at Work! - Episode 5 - Cedar Pollen Allergies','','2018-07-28 12:30:00','2018-08-04 12:30:00','<img src="https://img1.ak.crunchyroll.com/i/spire2-tmb/4a3fd4563c255cc9c4237c04a0dad17d1533371306_thumb.jpg"  /><br />The body has been invaded by a mass of cedar pollen! Rushing to the scene so that he can eliminate the cedar pollen, White Blood Cell (Neutrophil) runs into Memory Cell. Memory Cell is a Lymphocyte who retains the immune system’s memories. Seeing what’s actually going on, Memory Cell is strangely flustered. “What the heck? This is just like the legend...” What “legend” is Memory Cell talking about?',6);

	/*Table structure for table `subscripciones` */

	DROP TABLE IF EXISTS `subscripciones`;

	CREATE TABLE `subscripciones` (
	  `id_subscripciones` INT(11) NOT NULL AUTO_INCREMENT,
	  `id_usuarios` INT(11) NOT NULL,
	  `id_paginas` INT(11) NOT NULL,
	  `id_tags` INT(11) NOT NULL,
	  PRIMARY KEY (`id_subscripciones`,`id_usuarios`,`id_paginas`),
	  UNIQUE KEY `id_subscripciones` (`id_subscripciones`),
	  KEY `id_usuarios` (`id_usuarios`),
	  KEY `id_paginas` (`id_paginas`),
	  KEY `id_tags` (`id_tags`),
	  CONSTRAINT `FKSubscripci189109` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`),
	  CONSTRAINT `FKSubscripci465054` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
	  CONSTRAINT `FKSubscripci650517` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`)
	) ENGINE=INNODB DEFAULT CHARSET=utf8;

	/*Data for the table `subscripciones` */

	INSERT  INTO `subscripciones`(`id_subscripciones`,`id_usuarios`,`id_paginas`,`id_tags`) VALUES 
	(1,1,1,1),
	(2,1,2,2),
	(3,1,3,1),
	(4,3,1,1),
	(5,3,3,1),
	(6,4,1,1),
	(7,4,2,2);

	/*Table structure for table `tags` */

	DROP TABLE IF EXISTS `tags`;

	CREATE TABLE `tags` (
	  `id_tags` INT(11) NOT NULL AUTO_INCREMENT,
	  `glosa_tag` VARCHAR(255) DEFAULT NULL,
	  PRIMARY KEY (`id_tags`),
	  UNIQUE KEY `id_tags` (`id_tags`)
	) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

	/*Data for the table `tags` */

	INSERT  INTO `tags`(`id_tags`,`glosa_tag`) VALUES 
	(1,'One_Piece'),
	(2,'One-Punch_Man'),
	(3,'Union-Espanola'),
	(4,'cells-at-work');

	/*Table structure for table `tags_paginas` */

	DROP TABLE IF EXISTS `tags_paginas`;

	CREATE TABLE `tags_paginas` (
	  `id_tags` INT(11) NOT NULL,
	  `id_paginas` INT(11) NOT NULL,
	  PRIMARY KEY (`id_tags`,`id_paginas`),
	  KEY `id_tags` (`id_tags`),
	  KEY `id_paginas` (`id_paginas`),
	  CONSTRAINT `FKTags_Pagin247397` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`),
	  CONSTRAINT `FKTags_Pagin884566` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`)
	) ENGINE=INNODB DEFAULT CHARSET=utf8;

	/*Data for the table `tags_paginas` */

	INSERT  INTO `tags_paginas`(`id_tags`,`id_paginas`) VALUES 
	(1,1),
	(1,3),
	(2,2),
	(3,4),
	(4,5);

	/*Table structure for table `usuarios` */

	DROP TABLE IF EXISTS `usuarios`;

	CREATE TABLE `usuarios` (
	  `id_usuarios` INT(11) NOT NULL AUTO_INCREMENT,
	  `nombres` VARCHAR(255) DEFAULT NULL,
	  `apellido_paterno` VARCHAR(255) DEFAULT NULL,
	  `apellido_materno` VARCHAR(255) DEFAULT NULL,
	  `email` VARCHAR(255) NOT NULL,
	  `celular` INT(10) NOT NULL,
	  `activo` TINYINT(4) NOT NULL DEFAULT '1',
	  `password` VARCHAR(255) NOT NULL,  
	  PRIMARY KEY (`id_usuarios`),
	  UNIQUE KEY `email` (`email`),
	  UNIQUE KEY `celular` (`celular`),
	  UNIQUE KEY `id_usuarios` (`id_usuarios`)
	) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

	/*Data for the table `usuarios` */

	INSERT  INTO `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`,`password`) VALUES 
	(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1,'e2523a6b18b82a0a28ee18940276444a'),
	(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1,'e2523a6b18b82a0a28ee18940276444a'),
	(3,'Javiera','Pérez','Hernández','jdperez@uc.cl',997726725,1,'e2523a6b18b82a0a28ee18940276444a'),
	(4,'Jonathan','Bravo','Gajardo','jonna.bravo@gmail.com',958586900,1,'e2523a6b18b82a0a28ee18940276444a');

	/*Table structure for table `ws_access` */

	DROP TABLE IF EXISTS `ws_access`;

	CREATE TABLE `ws_access` (
	  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	  `key` VARCHAR(40) NOT NULL DEFAULT '',
	  `controller` VARCHAR(50) NOT NULL DEFAULT '',
	  `date_created` TIMESTAMP NULL DEFAULT NULL,
	  `date_modified` TIMESTAMP NULL DEFAULT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

	/*Data for the table `ws_access` */

	INSERT  INTO `ws_access`(`id`,`key`,`controller`,`date_created`,`date_modified`) VALUES 
	(4,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','api/pages',NULL,NULL);

	/*Table structure for table `ws_keys` */

	DROP TABLE IF EXISTS `ws_keys`;

	CREATE TABLE `ws_keys` (
	  `id` INT(11) NOT NULL AUTO_INCREMENT,
	  `key` VARCHAR(40) NOT NULL,
	  `level` INT(2) NOT NULL,
	  `ignore_limits` TINYINT(1) NOT NULL DEFAULT '0',
	  `is_private_key` TINYINT(1) NOT NULL DEFAULT '0',
	  `ip_addresses` TEXT,
	  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  PRIMARY KEY (`id`)
	) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

	/*Data for the table `ws_keys` */

	INSERT  INTO `ws_keys`(`id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) VALUES 
	(2,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug',0,0,0,NULL,'2018-05-22 22:51:03');

	/*Table structure for table `ws_limits` */

	DROP TABLE IF EXISTS `ws_limits`;

	CREATE TABLE `ws_limits` (
	  `id` INT(11) NOT NULL AUTO_INCREMENT,
	  `uri` VARCHAR(255) NOT NULL,
	  `count` INT(10) NOT NULL,
	  `hour_started` INT(11) NOT NULL,
	  `api_key` VARCHAR(40) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=MYISAM DEFAULT CHARSET=utf8;

	/*Data for the table `ws_limits` */

	/*Table structure for table `ws_logs` */

	DROP TABLE IF EXISTS `ws_logs`;

	CREATE TABLE `ws_logs` (
	  `id` INT(11) NOT NULL AUTO_INCREMENT,
	  `uri` VARCHAR(255) NOT NULL,
	  `method` VARCHAR(6) NOT NULL,
	  `params` TEXT,
	  `api_key` VARCHAR(40) NOT NULL,
	  `ip_address` VARCHAR(45) NOT NULL,
	  `time` INT(11) NOT NULL,
	  `rtime` FLOAT DEFAULT NULL,
	  `authorized` TINYINT(1) NOT NULL,
	  `response_code` INT(11) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=INNODB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

	/*Data for the table `ws_logs` */

	INSERT  INTO `ws_logs`(`id`,`uri`,`method`,`params`,`api_key`,`ip_address`,`time`,`rtime`,`authorized`,`response_code`) VALUES 
	(414,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043869,0.406602,1,0),
	(415,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043900,0.162532,1,0),
	(416,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043936,0.497651,1,0),
	(417,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043954,0.221903,1,400),
	(418,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527043980,0.231596,1,400),
	(419,'api/pages/pages/category/manga/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:5:\"manga\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527044003,0.288896,1,400),
	(420,'api/pages/pages/category/mangas/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','get','a:2:{s:8:\"category\";s:6:\"mangas\";s:3:\"key\";s:40:\"YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug\";}','YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','::1',1527044009,0.176626,1,200);

	/*Table structure for table `ws_users_api` */

	DROP TABLE IF EXISTS `ws_users_api`;

	CREATE TABLE `ws_users_api` (
	  `id` INT(11) NOT NULL AUTO_INCREMENT,
	  `username` VARCHAR(100) NOT NULL,
	  `password` VARCHAR(100) NOT NULL,
	  `register_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  PRIMARY KEY (`id`)
	) ENGINE=INNODB DEFAULT CHARSET=latin1;

	/*Data for the table `ws_users_api` */

	/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
	/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
	/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sso_sessions
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

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
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication_id` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(256) DEFAULT NULL,
  `client_id` VARCHAR(256) DEFAULT NULL,
  `authentication` BLOB,
  `refresh_token` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals` (
  `userId` VARCHAR(256) DEFAULT NULL,
  `clientId` VARCHAR(256) DEFAULT NULL,
  `scope` VARCHAR(256) DEFAULT NULL,
  `status` VARCHAR(10) DEFAULT NULL,
  `expiresAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` VARCHAR(255) NOT NULL,
  `resource_ids` VARCHAR(256) DEFAULT NULL,
  `client_secret` VARCHAR(256) DEFAULT NULL,
  `scope` VARCHAR(256) DEFAULT NULL,
  `authorized_grant_types` VARCHAR(256) DEFAULT NULL,
  `web_server_redirect_uri` VARCHAR(256) DEFAULT NULL,
  `authorities` VARCHAR(256) DEFAULT NULL,
  `access_token_validity` INT(11) DEFAULT NULL,
  `refresh_token_validity` INT(11) DEFAULT NULL,
  `additional_information` VARCHAR(4096) DEFAULT NULL,
  `autoapprove` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

/*Data for the table `oauth_client_details` */

INSERT  INTO `oauth_client_details`(`client_id`,`resource_ids`,`client_secret`,`scope`,`authorized_grant_types`,`web_server_redirect_uri`,`authorities`,`access_token_validity`,`refresh_token_validity`,`additional_information`,`autoapprove`) VALUES 
('web',NULL,'{noop}Soplon123','read,write','password,refresh_token',NULL,NULL,5000,5000,NULL,'YES');

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication_id` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(256) DEFAULT NULL,
  `client_id` VARCHAR(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `code` VARCHAR(256) DEFAULT NULL,
  `authentication` BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` VARCHAR(256) DEFAULT NULL,
  `token` BLOB,
  `authentication` BLOB
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

