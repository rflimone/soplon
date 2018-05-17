/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.2.14-MariaDB : Database - mariadb_soplon
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mariadb_soplon` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mariadb_soplon`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL AUTO_INCREMENT,
  `glosa_categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`),
  UNIQUE KEY `glosa_categoria` (`glosa_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id_categorias`,`glosa_categoria`) values 
(6,'Animé'),
(4,'Cine'),
(3,'Conciertos'),
(2,'Deportes'),
(5,'Libros'),
(1,'Mangas');

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
  `dominio` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_ultimo` varchar(255) DEFAULT NULL,
  `glosa_pagina` varchar(255) DEFAULT NULL,
  `date_last` datetime DEFAULT NULL,
  `date_new` datetime DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `id_categorias` int(11) NOT NULL,
  PRIMARY KEY (`id_paginas`),
  UNIQUE KEY `id_paginas` (`id_paginas`),
  KEY `date_last` (`date_last`),
  KEY `date_new` (`date_new`),
  KEY `id_categorias` (`id_categorias`),
  CONSTRAINT `FKPaginas407486` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `paginas` */

insert  into `paginas`(`id_paginas`,`dominio`,`url`,`url_ultimo`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) values 
(1,'readms.net','https://readms.net/','actualizado','MangaStream','2018-03-30 18:09:22','2018-03-30 18:09:22',NULL,1),
(2,'readms.net','https://readms.net/','actualizado','MangaStream','2018-03-30 18:09:22','2018-03-30 18:09:22',NULL,1),
(3,'jaiminisbox.com','https://jaiminisbox.com','actualizado','Jaiminisbox','2018-05-03 16:53:39','2018-05-10 16:53:48',NULL,1),
(4,'ticketpro.cl','http://www.ticketpro.cl/sports/','actualizado','Ticketpro','2018-05-04 17:00:13','2018-05-11 17:00:26',NULL,2);

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
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `celular` (`celular`),
  UNIQUE KEY `id_usuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`) values 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1),
(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
