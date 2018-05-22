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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mariadb_soplon` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mariadb_soplon`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id_categorias` INT(11) NOT NULL AUTO_INCREMENT,
  `glosa_categoria` VARCHAR(255) NOT NULL,
  `alias_categoria` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categorias`),
  UNIQUE KEY `id_categorias` (`id_categorias`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

INSERT  INTO `categorias`(`id_categorias`,`glosa_categoria`,`alias_categoria`) VALUES 
(1,'Manga','manga'),
(2,'Deportes','deporte|sports'),
(3,'Conciertos','concierto|musica|concerts'),
(4,'Cine','cine|teatro|theatre'),
(5,'Intelectuales','libros|seminars|events'),
(6,'anime','anime');

/*Table structure for table `metodos_envio` */

DROP TABLE IF EXISTS `metodos_envio`;

CREATE TABLE `metodos_envio` (
  `id_metodos_envio` INT(11) NOT NULL AUTO_INCREMENT,
  `glosa_metodo_envio` VARCHAR(255) DEFAULT NULL,
  `id_usuarios` INT(11) NOT NULL,
  PRIMARY KEY (`id_metodos_envio`),
  UNIQUE KEY `id_metodos_envio` (`id_metodos_envio`),
  KEY `FKMetodos_En279065` (`id_usuarios`),
  CONSTRAINT `FKMetodos_En279065` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `metodos_envio` */

INSERT  INTO `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`) VALUES 
(1,'email',1),
(2,'push celular',1);

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
  `imagen` BLOB DEFAULT NULL,
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
(1,'https://readms.net','https://readms.net/manga/one_piece','readms.net','MangaStream','2018-05-22 01:35:19','2018-03-30 18:09:22',NULL,1),
(2,'https://readms.net/rss','http://readms.net/r/akagami/96/5067/1','Akagami no Shirayukihime 96','-no title-','2018-05-03 01:14:57','2018-05-12 15:27:26',NULL,1),
(3,'https://jaiminisbox.com','https://jaiminisbox.com/reader/series/one-piece-2','jaiminisbox.com','Jaiminisbox','2018-05-22 01:35:20','2018-05-10 16:53:48',NULL,1),
(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2310147-Gran-Arena-Monticello-Kool-And-The-Gang-Fiesta-Radio-Activa.html','KOOL AND THE GANG - FIESTA RADIO ACTIVA / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 29 de Septiembre / 21:00 hrs.','2018-05-03 01:14:57','2018-05-16 15:27:26',NULL,2);

/*Table structure for table `subscripciones` */

DROP TABLE IF EXISTS `subscripciones`;

CREATE TABLE `subscripciones` (
  `id_subscripciones` INT(11) NOT NULL,
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
  `activo` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `celular` (`celular`),
  UNIQUE KEY `id_usuarios` (`id_usuarios`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

INSERT  INTO `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`) VALUES 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1),
(2,'Esteban','Lozano','Q','estebanlozano26@gmail.com',963757900,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
