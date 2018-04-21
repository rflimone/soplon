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

/*Data for the table `categorias` */

insert  into `categorias`(`id_categorias`,`glosa_categoria`) values 
(2,'Deportes'),
(1,'Mangas');

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuarios`,`nombres`,`apellido_paterno`,`apellido_materno`,`email`,`celular`,`activo`) values 
(1,'Renzo','Limone','Muñoz','rflimone@gmail.com',976448057,1);


/*Data for the table `metodos_envio` */

insert  into `metodos_envio`(`id_metodos_envio`,`glosa_metodo_envio`,`id_usuarios`) values 
(1,email,1),
(2,push,1);

/*Data for the table `tags` */

insert  into `tags`(`id_tags`,`glosa_tag`) values 
(1,'OnePiece');


/*Data for the table `paginas` */

insert  into `paginas`(`id_paginas`,`dominio`,`url`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) values 
(1,'readms.net','https://readms.net/manga/one_piece','MangaStream','2018-03-30 18:09:22','2018-03-30 18:09:22',NULL,1);


/*Data for the table `tags_paginas` */

insert  into `tags_paginas`(`id_tags`,`id_paginas`) values 
(1,1);

/*Data for the table `subscripciones` */

insert  into `subscripciones`(`id_subscripciones`,`id_usuarios`,`id_paginas`,`id_tags`) values 
(1,1,1,1);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
