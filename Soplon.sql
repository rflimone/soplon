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
  `id_categorias` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_categoria` varchar(255) NOT NULL COMMENT 'nombre de categoria que aperece en el sitio',
  `alias_categoria` varchar(45) DEFAULT NULL COMMENT 'alias de busqueda regex',
  `resenia` varchar(45) DEFAULT NULL COMMENT 'pequeña reseña para la categoria',
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id_categorias`,`glosa_categoria`,`alias_categoria`,`resenia`) values 
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
  `id_metodos_envio` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_metodo_envio` varchar(255) DEFAULT NULL,
  `id_usuarios` int(11) NOT NULL,
  PRIMARY KEY (`id_metodos_envio`),
  UNIQUE KEY `id_metodos_envio` (`id_metodos_envio`),
  KEY `FKMetodos_En279065` (`id_usuarios`),
  CONSTRAINT `FKMetodos_En279065` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `metodos_envio` */

insert  into `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`) values 
(1,'email',1),
(2,'push celular',1);

/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

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

/*Data for the table `paginas` */

insert  into `paginas`(`id_paginas`,`url`,`url_ultimo`,`titulo_pagina`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) values 
(1,'https://readms.net/rss','https://readms.net/r/one_piece/904/5058/1','The Commanders of the Revolutionary Army Appear 904','martes, 22 de mayo de 2018 13:48','2018-05-22 01:35:19','2018-04-22 13:48:22',NULL,1),
(2,'https://mangahis.com/feed','https://mangahis.com/manga/onepunchman/91','Onepunch-Man #91','Rover','2018-03-18 01:14:57','2018-04-29 15:27:26',NULL,1),
(3,'https://jaiminisbox.com','https://jaiminisbox.com/reader/series/one-piece-2','jaiminisbox.com','Jaiminisbox','2018-05-22 01:35:20','2018-05-10 16:53:48',NULL,1),
(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/sports/2304146-Gran-Arena-Monticello-Noche-Boxeo-Miguel-Aguja-Gonzalez.html','NOCHE DE BOXEO - TITULO LATINOAMERICANO - MIGUEL AGUJA GONZALEZ/ GRAN ARENA MONTICELLO','Gran Arena Monticello, Domingo 01 de Julio / 20:30 hrs.','2018-05-22 01:35:20','2018-05-03 13:50:57',NULL,2);

/*Table structure for table `subscripciones` */

DROP TABLE IF EXISTS `subscripciones`;

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

/*Data for the table `subscripciones` */

insert  into `subscripciones`(`id_subscripciones`,`id_usuarios`,`id_paginas`,`id_tags`) values 
(1,1,1,1),
(3,1,3,1),
(2,1,2,2),
(4,2,4,3);

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id_tags` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE KEY `id_tags` (`id_tags`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

insert  into `tags`(`id_tags`,`glosa_tag`) values 
(1,'one_piece'),
(2,'haikyuu'),
(3,'colo-colo'),
(4,'one-piece');

/*Table structure for table `tags_paginas` */

DROP TABLE IF EXISTS `tags_paginas`;

CREATE TABLE `tags_paginas` (
  `id_tags` int(11) NOT NULL,
  `id_paginas` int(11) NOT NULL,
  PRIMARY KEY (`id_tags`,`id_paginas`),
  KEY `id_tags` (`id_tags`),
  KEY `id_paginas` (`id_paginas`),
  CONSTRAINT `FKTags_Pagin247397` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id_tags`),
  CONSTRAINT `FKTags_Pagin884566` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tags_paginas` */

insert  into `tags_paginas`(`id_tags`,`id_paginas`) values 
(1,1),
(1,3),
(2,2),
(3,4),
(4,3);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

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

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`) values 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1),
(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1);

/*Table structure for table `ws_access` */

DROP TABLE IF EXISTS `ws_access`;

CREATE TABLE `ws_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ws_access` */

insert  into `ws_access`(`id`,`key`,`controller`,`date_created`,`date_modified`) values 
(4,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug','api/pages',NULL,NULL);

/*Table structure for table `ws_keys` */

DROP TABLE IF EXISTS `ws_keys`;

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

/*Data for the table `ws_keys` */

insert  into `ws_keys`(`id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values 
(2,'YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug',0,0,0,NULL,'2018-05-22 22:51:03');

/*Table structure for table `ws_limits` */

DROP TABLE IF EXISTS `ws_limits`;

CREATE TABLE `ws_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `ws_limits` */

/*Table structure for table `ws_logs` */

DROP TABLE IF EXISTS `ws_logs`;

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

/*Data for the table `ws_logs` */

insert  into `ws_logs`(`id`,`uri`,`method`,`params`,`api_key`,`ip_address`,`time`,`rtime`,`authorized`,`response_code`) values 
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ws_users_api` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
