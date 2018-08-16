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
  `resenia` varchar(45) DEFAULT NULL COMMENT 'pequena resena para la categoria',
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id_categorias`,`glosa_categoria`,`alias_categoria`,`resenia`) values 
(1,'Manga','manga',NULL),
(2,'Deportes','deporte|sports',NULL),
(3,'Conciertos','concierto|musica|concerts',NULL),
(4,'Teatro','cine|teatro|theatre',NULL),
(5,'Intelectuales','libros|seminars|events',NULL),
(6,'Anime','anime|crunchyroll',NULL),
(7,'Familia','family|familia',NULL);

/*Table structure for table `metodos_envio` */

DROP TABLE IF EXISTS `metodos_envio`;

CREATE TABLE `metodos_envio` (
  `id_metodos_envio` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_metodo_envio` varchar(255) DEFAULT NULL,
  `id_usuarios` int(11) NOT NULL,
  `id_subscripciones` int(11) NOT NULL,
  PRIMARY KEY (`id_metodos_envio`),
  UNIQUE KEY `id_metodos_envio` (`id_metodos_envio`),
  KEY `FKMetodos_En279065` (`id_usuarios`),
  CONSTRAINT `FKMetodos_En279065` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `metodos_envio` */

insert  into `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`,`id_subscripciones`) values 
(1,'email',1,1),
(2,'sms',1,2),
(3,'push',1,3),
(4,'email',1,4),
(5,'email',3,5),
(6,'email',3,6),
(7,'sms',4,7),
(8,'email',4,8);

/*Table structure for table `oauth_access_token` */

DROP TABLE IF EXISTS `oauth_access_token`;

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_access_token` */

/*Table structure for table `oauth_approvals` */

DROP TABLE IF EXISTS `oauth_approvals`;

CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_approvals` */

/*Table structure for table `oauth_client_details` */

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_client_details` */

insert  into `oauth_client_details`(`client_id`,`resource_ids`,`client_secret`,`scope`,`authorized_grant_types`,`web_server_redirect_uri`,`authorities`,`access_token_validity`,`refresh_token_validity`,`additional_information`,`autoapprove`) values 
('web',NULL,'{noop}Soplon123','read','password',NULL,NULL,10,NULL,NULL,'YES');

/*Table structure for table `oauth_client_token` */

DROP TABLE IF EXISTS `oauth_client_token`;

CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_client_token` */

/*Table structure for table `oauth_code` */

DROP TABLE IF EXISTS `oauth_code`;

CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_code` */

/*Table structure for table `oauth_refresh_token` */

DROP TABLE IF EXISTS `oauth_refresh_token`;

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oauth_refresh_token` */

/*Table structure for table `paginas` */

DROP TABLE IF EXISTS `paginas`;

CREATE TABLE `paginas` (
  `id_paginas` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `url_ultimo` varchar(255) DEFAULT NULL,
  `titulo_pagina` varchar(255) DEFAULT NULL,
  `glosa_pagina` varchar(1000) DEFAULT NULL,
  `date_last` datetime DEFAULT NULL,
  `date_new` datetime DEFAULT NULL,
  `imagen` varchar(1000) DEFAULT NULL,
  `id_categorias` int(11) NOT NULL,
  PRIMARY KEY (`id_paginas`),
  UNIQUE KEY `id_paginas` (`id_paginas`),
  KEY `date_last` (`date_last`),
  KEY `date_new` (`date_new`),
  KEY `id_categorias` (`id_categorias`),
  CONSTRAINT `FKPaginas407486` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

/*Data for the table `paginas` */

insert  into `paginas`(`id_paginas`,`url`,`url_ultimo`,`titulo_pagina`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) values 
(1,'https://readms.net/rss','http://readms.net/r/one_piece/913/5260/1','One Piece 913','Tsuru Repays a Favor','2018-04-22 13:48:22','2018-08-02 18:06:24',NULL,1),
(2,'https://mangahis.com/feed','https://mangahis.com/manga/onepunchman/93','Onepunch-Man #93','¡Vamos!','2018-04-29 13:33:37','2018-06-26 12:14:30',NULL,1),
(3,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/one-piece-2/en/0/912/8/','One Piece Chapter 912.8: One Piece x Fischer\'s One shot','','2018-08-16 21:20:28','2018-08-16 21:20:28','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/one-piece-2_58650da78040f/thumb_3drv79et.jpg\" />',1),
(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/sports/2304146-Gran-Arena-Monticello-Noche-Boxeo-Miguel-Aguja-Gonzalez.html','NOCHE DE BOXEO - TITULO LATINOAMERICANO - MIGUEL AGUJA GONZALEZ/ GRAN ARENA MONTICELLO','Gran Arena Monticello, Domingo 01 de Julio / 20:30 hrs.','2018-05-22 01:35:20','2018-05-03 13:50:57',NULL,2),
(5,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/cells-at-work/episode-5-cedar-pollen-allergies-774887','Cells at Work! - Episode 5 - Cedar Pollen Allergies','','2018-07-28 12:30:00','2018-08-04 12:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/4a3fd4563c255cc9c4237c04a0dad17d1533371306_thumb.jpg\"  /><br />The body has been invaded by a mass of cedar pollen! Rushing to the scene so that he can eliminate the cedar pollen, White Blood Cell (Neutrophil) runs into Memory Cell. Memory Cell is a Lymphocyte who retains the immune system’s memories. Seeing what’s actually going on, Memory Cell is strangely flustered. “What the heck? This is just like the legend...” What “legend” is Memory Cell talking about?',6);

/*Table structure for table `subscripciones` */

DROP TABLE IF EXISTS `subscripciones`;

CREATE TABLE `subscripciones` (
  `id_subscripciones` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `subscripciones` */

insert  into `subscripciones`(`id_subscripciones`,`id_usuarios`,`id_paginas`,`id_tags`) values 
(1,1,1,1),
(3,1,3,1),
(5,3,1,1),
(6,3,3,1),
(7,4,1,1),
(9,2,1,1),
(2,1,2,2),
(8,4,2,2),
(4,2,4,3);

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id_tags` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE KEY `id_tags` (`id_tags`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

insert  into `tags`(`id_tags`,`glosa_tag`) values 
(1,'One_Piece'),
(2,'One-Punch_Man'),
(3,'NOCHE_DE_BOXEO');

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
(3,4);

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
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `celular` (`celular`),
  UNIQUE KEY `id_usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`,`password`) values 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1,'e2523a6b18b82a0a28ee18940276444a'),
(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1,'e2523a6b18b82a0a28ee18940276444a'),
(3,'Javiera','Pérez','Hernández','jdperez@uc.cl',997726725,1,'e2523a6b18b82a0a28ee18940276444a'),
(4,'Jonathan','Bravo','Gajardo','jonna.bravo@gmail.com',958586900,1,'e2523a6b18b82a0a28ee18940276444a');

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
