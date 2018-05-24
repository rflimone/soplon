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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`soplon` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `soplon`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id_categorias` INT(11) NOT NULL AUTO_INCREMENT,
  `glosa_categoria` VARCHAR(255) NOT NULL COMMENT 'nombre de categoria que aperece en el sitio',
  `alias_categoria` VARCHAR(45) DEFAULT NULL COMMENT 'alias de busqueda regex',
  `resenia` VARCHAR(45) DEFAULT NULL COMMENT 'pequeña reseña para la categoria',
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

INSERT  INTO `categorias`(`id_categorias`,`glosa_categoria`,`alias_categoria`,`resenia`) VALUES 
(1,'Manga','manga',NULL),
(2,'Deportes','deporte|sports',NULL),
(3,'Conciertos','concierto|musica|concerts',NULL),
(4,'Cine','cine|teatro|theatre',NULL),
(5,'Intelectuales','libros|seminars|events',NULL),
(6,'Anime','anime',NULL),
(7,'Familia','family|familia',NULL);

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
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `metodos_envio` */

INSERT  INTO `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`,`id_subscripciones`) VALUES 
(1,'email',1,1),
(2,'push celular',1,1);

/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

CREATE TABLE `paginas` (
  `id_paginas` INT(11) NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) DEFAULT NULL,
  `url_ultimo` VARCHAR(255) DEFAULT NULL,
  `titulo_pagina` VARCHAR(255) DEFAULT NULL,
  `glosa_pagina` VARCHAR(255) DEFAULT NULL,
  `date_last` DATETIME DEFAULT NULL,
  `date_new` DATETIME DEFAULT NULL,
  `imagen` BLOB,
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
(2,'https://mangahis.com/feed','https://mangahis.com/manga/onepunchman/91','Onepunch-Man #91','Rover','2018-03-18 01:14:57','2018-04-29 15:27:26',NULL,1),
(3,'https://jaiminisbox.com','https://jaiminisbox.com/reader/series/one-piece-2','jaiminisbox.com','Jaiminisbox','2018-05-22 01:35:20','2018-05-10 16:53:48',NULL,1),
(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/sports/2304146-Gran-Arena-Monticello-Noche-Boxeo-Miguel-Aguja-Gonzalez.html','NOCHE DE BOXEO - TITULO LATINOAMERICANO - MIGUEL AGUJA GONZALEZ/ GRAN ARENA MONTICELLO','Gran Arena Monticello, Domingo 01 de Julio / 20:30 hrs.','2018-05-22 01:35:20','2018-05-03 13:50:57',NULL,2);

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
(3,1,3,1),
(2,1,2,2),
(4,2,4,3);

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id_tags` INT(11) NOT NULL AUTO_INCREMENT,
  `glosa_tag` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE KEY `id_tags` (`id_tags`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

INSERT  INTO `tags`(`id_tags`,`glosa_tag`) VALUES 
(1,'one_piece'),
(2,'haikyuu'),
(3,'colo-colo'),
(4,'one-piece');

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
(4,3);

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
  `password` INT(11) NOT NULL,  
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `celular` (`celular`),
  UNIQUE KEY `id_usuarios` (`id_usuarios`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

INSERT  INTO `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`,`password`) VALUES 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1,123),
(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1,1234);

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
