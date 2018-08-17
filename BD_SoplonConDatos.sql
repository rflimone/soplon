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
(1,'push',1,1),
(2,'push',1,2),
(3,'push',1,3),
(4,'push',1,4),
(5,'push',3,5),
(6,'push',3,6),
(7,'push',4,7),
(8,'push',4,8);

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
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

/*Data for the table `paginas` */

insert  into `paginas`(`id_paginas`,`url`,`url_ultimo`,`titulo_pagina`,`glosa_pagina`,`date_last`,`date_new`,`imagen`,`id_categorias`) values 
(1,'https://readms.net/rss','http://readms.net/r/one_piece/914/5282/1','One Piece 914','Leftover Town','2018-04-22 13:48:22','2018-08-16 18:57:09',NULL,1),
(2,'https://mangahis.com/feed','https://mangahis.com/manga/onepunchman/93','Onepunch-Man #93','¡Vamos!','2018-04-29 13:33:37','2018-06-26 12:14:30',NULL,1),
(3,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/one-piece-2/en/0/914/','One Piece Chapter 914: Okobore, The Town of Leftovers','','2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i2.wp.com/jaiminisbox.com/reader/content/comics/one-piece-2_58650da78040f/thumb_3drv79et.jpg\" />',1),
(4,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/sports/2304146-Gran-Arena-Monticello-Noche-Boxeo-Miguel-Aguja-Gonzalez.html','NOCHE DE BOXEO - TITULO LATINOAMERICANO - MIGUEL AGUJA GONZALEZ/ GRAN ARENA MONTICELLO','Gran Arena Monticello, Domingo 01 de Julio / 20:30 hrs.','2018-05-22 01:35:20','2018-05-03 13:50:57',NULL,2),
(5,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/cells-at-work/episode-5-cedar-pollen-allergies-774887','Cells at Work! - Episode 5 - Cedar Pollen Allergies','','2018-07-28 12:30:00','2018-08-04 12:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/4a3fd4563c255cc9c4237c04a0dad17d1533371306_thumb.jpg\"  /><br />The body has been invaded by a mass of cedar pollen! Rushing to the scene so that he can eliminate the cedar pollen, White Blood Cell (Neutrophil) runs into Memory Cell. Memory Cell is a Lymphocyte who retains the immune system’s memories. Seeing what’s actually going on, Memory Cell is strangely flustered. “What the heck? This is just like the legend...” What “legend” is Memory Cell talking about?',6),
(6,'https://readms.net/rss','http://readms.net/r/shokugeki_no_souma/275/5287/1','Shokugeki no Souma 275','Go For the Interesting Option',NULL,'2018-08-17 13:53:00',NULL,1),
(7,'https://readms.net/rss','http://readms.net/r/haikyuu/314/5286/1','Haikyuu!! 314','The Strongest Ally 2',NULL,'2018-08-17 10:18:22',NULL,1),
(8,'https://readms.net/rss','http://readms.net/r/my_hero_academia/194/5285/1','My Hero Academia 194','Wintry Weather! U.A. High School!',NULL,'2018-08-17 09:39:48',NULL,1),
(9,'https://readms.net/rss','http://readms.net/r/dr_stone/070/5284/1','Dr. Stone 070','Paper Shield',NULL,'2018-08-17 08:04:20',NULL,1),
(10,'https://readms.net/rss','http://readms.net/r/bclover/169/5283/1','Black Clover 169','The Captain of the Black Bull vs The True Crimson Rose',NULL,'2018-08-17 08:01:41',NULL,1),
(11,'https://readms.net/rss','http://readms.net/r/fairy_tail_100_years_quest/005/5281/1','Fairy Tail 100 Years Quest 005','\"Seal\" the Holy Pentadrakes',NULL,'2018-08-15 08:25:12',NULL,1),
(12,'https://readms.net/rss','http://readms.net/r/happiness/43/5280/1','Happiness 43','Gods',NULL,'2018-08-14 18:21:51',NULL,1),
(13,'https://readms.net/rss','http://readms.net/r/dragon_ball_super/038/5279/1','Dragon Ball Super 038','The Last Resort of Universe 6',NULL,'2018-08-13 11:58:04',NULL,1),
(14,'https://readms.net/rss','http://readms.net/r/a_trail_of_blood/34/5278/1','A Trail of Blood 34','Abandon',NULL,'2018-08-13 19:07:28',NULL,1),
(15,'https://readms.net/rss','http://readms.net/r/attack_on_titan/108/5277/1','Attack on Titan 108','Sound Argument',NULL,'2018-08-11 08:55:31',NULL,1),
(16,'https://readms.net/rss','http://readms.net/r/onepunch_man/094/5276/1','One-Punch Man 094','I See',NULL,'2018-08-11 14:59:09',NULL,1),
(17,'https://readms.net/rss','http://readms.net/r/the_seven_deadly_sins/277/5274/1','The Seven Deadly Sins 277','You Cannot Free Yourself from Love',NULL,'2018-08-06 17:41:36',NULL,1),
(18,'https://readms.net/rss','http://readms.net/r/namaikizakari/086/5273/1','Namaikizakari 086','--',NULL,'2018-08-06 17:33:12',NULL,1),
(19,'https://readms.net/rss','http://readms.net/r/one_shot/Hot/5272/1','One Shot Hot','by Akira Amano',NULL,'2018-08-06 10:12:19',NULL,1),
(20,'https://readms.net/rss','http://readms.net/r/neverland/098/5271/1','The Promised Neverland 098','The sound of the beginning',NULL,'2018-08-05 17:25:13',NULL,1),
(21,'https://readms.net/rss','http://readms.net/r/rikudo/063/5270/1','Rikudo 063','Gerbera\'s Words',NULL,'2018-08-04 11:04:01',NULL,1),
(22,'https://mangahis.com/feed','https://mangahis.com/manga/one-piece/913','One Piece #913','Tsuru devuelve el favor',NULL,'2018-08-05 12:32:13',NULL,1),
(23,'https://mangahis.com/feed','https://mangahis.com/manga/boku-no-hero-academia/192','Boku no Hero Academia #192','El Hogar de Todoroki',NULL,'2018-07-31 11:26:47',NULL,1),
(24,'https://mangahis.com/feed','https://mangahis.com/manga/dragon-ball-super/37','Dragon Ball Super #37','El Despertar de la Super Saiyajin Kale',NULL,'2018-07-23 15:01:32',NULL,1),
(25,'https://mangahis.com/feed','https://mangahis.com/manga/nanatsu-no-taizai/275','Nanatsu no Taizai #275','Corazones unidos',NULL,'2018-07-20 16:53:42',NULL,1),
(26,'https://mangahis.com/feed','https://mangahis.com/manga/shingeki-no-kyojin/107','Shingeki no Kyojin #107','Visitante',NULL,'2018-07-20 16:36:59',NULL,1),
(27,'https://mangahis.com/feed','https://mangahis.com/manga/tokyo-ghoulre/179','Tokyo Ghoul:re #179','La canción de la cabra montés',NULL,'2018-07-07 12:12:06',NULL,1),
(28,'https://mangahis.com/feed','https://mangahis.com/manga/shokugeki-no-soma/268','Shokugeki no Soma #268','Los expedientes de aguas termales P.4',NULL,'2018-06-26 12:05:52',NULL,1),
(29,'https://mangahis.com/feed','https://mangahis.com/manga/black-clover/162','Black Clover #162','Rayo de ira vs amigos',NULL,'2018-06-23 11:44:12',NULL,1),
(30,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/boruto-naruto-next-generations/en/0/26/','Boruto: Naruto Next Generations Chapter 26: Gift',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i1.wp.com/jaiminisbox.com/reader/content/comics/boruto-naruto-next-generations_5a62c9b81a61b/thumb_borutocover.png\" />',1),
(31,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/my-hero-academia/en/0/192/','My Hero Academia Chapter 192: The Todoroki Family',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i2.wp.com/jaiminisbox.com/reader/content/comics/my-hero-academia_5877add67f172/thumb_bnha.jpg\" />',1),
(32,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/origin/en/0/66/','Origin Anno Radix 0066: The hunter and the hunted',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i1.wp.com/jaiminisbox.com/reader/content/comics/origin_57c9ddbc7adbf/thumb_origin7.png\" />',1),
(33,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/black_clover/en/0/169/','Black Clover Page 169: The Captain of the Black Bulls VS The Deep Crimson Rose',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i1.wp.com/jaiminisbox.com/reader/content/comics/black_clover_55f3d2ec5caf2/thumb_black-clover.png\" />',1),
(34,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/wangtangchang-the-yurutto-hunter/en/0/5/1/','Wangtangchang the Yurutto Hunter Credit 5.1: End of the World: Yurumageddon and The Return of The Prince',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i2.wp.com/jaiminisbox.com/reader/content/comics/wangtangchang-the-yurutto-hunter_5aaed60605c46/thumb_covo.jpg\" />',1),
(35,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/kaguya-wants-to-be-confessed-to-official-doujin/en/0/6/','Kaguya Wants to be Confessed to Official Doujin Chapter 6: Kaguya Wants to Wear a Bra',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/kaguya-wants-to-be-confessed-to-official-doujin_5b231f8deb3eb/thumb_01.jpg\" />',1),
(36,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/jujutsu-kaisen/en/0/20/','Jujutsu Kaisen Chapter 20: Small Fry and Reverse Retribution II',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i2.wp.com/jaiminisbox.com/reader/content/comics/jujutsu-kaisen_5abfac73cc1ab/thumb_002-003.jpg\" />',1),
(37,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/we-want-to-talk-about-kaguya/en/0/2/','We Want to Talk About Kaguya Chapter 2: I Want to Talk About the Movie Date',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/we-want-to-talk-about-kaguya_5b5e9d8df1de5/thumb_kaguyatile.jpg\" />',1),
(38,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/mononogatari/en/0/1/','Mononogatari Chapter 1: Saenome',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i1.wp.com/jaiminisbox.com/reader/content/comics/mononogatari_5b7335bfac0b2/thumb_website-tile.jpg\" />',1),
(39,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/kaguya-wants-to-be-confessed-to/en/0/117/','Kaguya Wants to be Confessed to Chapter 117: Chika Fujiwara Wants to Fight',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/kaguya-wants-to-be-confessed-to_5a6333dae5c34/thumb_kaguya_i.jpg\" />',1),
(40,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/origin/en/0/67/','Origin Anno Radix 0067: The ones from the past',NULL,'2018-08-17 23:25:25','2018-08-17 23:25:25','<img src=\"https://i2.wp.com/jaiminisbox.com/reader/content/comics/origin_57c9ddbc7adbf/thumb_origin7.png\" />',1),
(41,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/eden-s-zero/en/0/7/','Eden\'s Zero Chapter 7: Iron Tears',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/eden-s-zero_5b2ff035693d7/thumb_EZ-site-tile.jpg\" />',1),
(42,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/hot/en/0/0/','hot oneshot',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i1.wp.com/jaiminisbox.com/reader/content/comics/hot_5b6801bbc0208/thumb_hot-rdo.jpg\" />',1),
(43,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2324966-Casino-Ovalle-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / OVALLE CASINO &#38; RESORT','Ovalle Casino & Resort Viernes 17 de Agosto 21:·00 hrs.',NULL,'2018-06-20 17:08:19',NULL,5),
(44,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2349701-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito-18-Agosto.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO - 18 AGOSTO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 18 de Agosto  19:00 hrs.',NULL,'2018-08-10 16:58:35',NULL,5),
(45,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2295835-Gran-Arena-Monticello-Cafe-Tacvba-Niu-Gueis-Tour-2018.html','CAFE TACVBA - NIÚ GÜEIS TOUR 2018 / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 18 de Agosto / 21:00 hrs.',NULL,'2018-04-11 19:44:06',NULL,3),
(46,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2349751-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO/ TEATRO REGIONAL DE RANCAGUA','',NULL,'2018-08-10 17:28:12',NULL,5),
(47,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2345589-Dreams-Piero-Puerto-Varas-.html','PIERO / DREAMS PUERTO VARAS','Dreams Puerto Varas Sábado 18 de Agosto, 22:00 hrs.',NULL,'2018-07-31 14:59:04',NULL,3),
(48,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2349726-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito-19-Agosto.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO - 19 AGOSTO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Domingo 19 de Agosto  17:00 hrs.',NULL,'2018-08-10 17:19:51',NULL,5),
(49,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-sports/1993389-Cobresal-vs-Santiago-Morning-Campeonato-Loto-2018.html','COBRESAL VS SANTIAGO MORNING / CAMPEONATO LOTO 2018','Estadio El Cobre, Domingo 19 de Agosto, 15:30 hrs.',NULL,'2016-10-27 19:55:02',NULL,2),
(50,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-sports/1511793-Deportes-Iquique-vs-Colo-Colo-Campeonato-Scotiabank-2018.html','DEP. IQUIQUE VS COLO COLO / CAMPEONATO SCOTIABANK 2018',' Estadio Municipal Zorros del Desierto, Calama, Domingo 19 de Agosto, 12:00 hrs.',NULL,'2014-12-26 15:32:55',NULL,2),
(51,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2327866-TRM-Ballet-Teatro-Nacional-De-Ucrania.html','BALLET TEATRO NACIONAL DE UCRANIA  / TEATRO REGIONAL DEL MAULE','Teatro Regional del Maule, Viernes 24 de Agosto, 20:00 hrs. ','2018-06-27 20:21:56','2018-06-27 20:38:56',NULL,3),
(52,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2336752-TMCH-Hernaldo-Zuniga-Gira-Olor-De-Luna.html','HERNALDO ZUÑIGA, GIRA OLOR DE LUNA/ TEATRO MUNICIPAL DE CHILLÁN','Teatro Municipal de Chillán, Viernes 24 de Agosto/ 19:00 hrs.',NULL,'2018-07-12 20:16:02',NULL,3),
(53,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2347927-Teatro-Bohem-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / TEATRO BOHEM RANCAGUA','Teatro Bohem, Rancagua, Viernes 24 de Agosto, 22:30 hrs. ',NULL,'2018-08-09 15:34:45',NULL,5),
(54,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2337188-TRR-El-Mago-Del-Fin-Del-Mundo.html','EL MAGO DEL FIN DEL MUNDO CON JEAN PAUL OLHABERRY, Show de Magia e Ilusión / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 25 de Agosto 19:00 hrs.',NULL,'2018-07-17 17:41:10',NULL,5),
(55,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2348227-Elebar-Matias-Oviedo-Jazmin-Gomez-Valparaiso.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / ELE BAR VALPARAISO','Ele Bar Valparaíso, Sábado 25 de Agosto / 22:30 hrs.',NULL,'2018-08-09 15:52:32',NULL,3),
(56,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2252137-Gran-Arena-Monticello-Tito-Nieves-El-Pavarotti-de-la-Salsa.html','TITO NIEVES, EL PAVAROTTI DE LA SALSA / 20% DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 25 de Agosto / 21:00 hrs.',NULL,'2017-12-27 13:19:11',NULL,3),
(57,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2328166-Aula-Magna-Universidad-Federico-Santa-Maria-Valparaiso-Ballet-Teatro-Nacional-De-Ucrania.html','BALLET TEATRO NACIONAL DE UCRANIA/ VALPARAISO','Aula Magna Universidad Federico Santa María Sábado 25 de Agosto, 19:30 hrs. ',NULL,'2018-06-27 20:50:38',NULL,4),
(58,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2339742-TMT-Gira-Solista-Kirov-Ballet.html','GIRA SOLISTA KIROV BALLET, EL MARAVILLOSO ENCANTO BALLET CLÁSICO RUSO  / TEATRO MUNICIPAL DE TEMUCO','Teatro Municipal de Temuco - Sábado 25 de Agosto / 20:00 hrs.',NULL,'2018-07-25 15:19:03',NULL,4),
(59,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2340280-Dreams-Ramon-Farias-Cesante-Coyhaique.html','RAMON FARÍAS, CESANTE / DREAMS COYHAIQUE','Casino Dreams Coyhaique Sábado 25 de Agosto 21:30 hrs',NULL,'2018-07-27 20:17:25',NULL,4),
(60,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2330635-Casino-Luckia-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / CASINO LUCKIA, ARICA','Casino Luckia, Arica Sábado 25 de Agosto / 21:·00 hrs.',NULL,'2018-07-05 22:42:40',NULL,5),
(61,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2345683-Dreams-Sonora-De-Rehabilitarse-Puerto-Varas.html','SONORA DE REHABILITARSE/ DREAMS PUERTO VARAS','Dreams Puerto Varas, Sábado 25 de Agosto, 22:00 hrs.',NULL,'2018-07-31 15:19:57',NULL,3),
(62,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2346084-Teatro-Universidad-Concepcion-Ballet-Teatro-Nacional-Ucrania.html','BALLET TEATRO NACIONAL DE UCRANIA/ TEATRO UNIVERSIDAD DE CONCEPCIÓN','Teatro Universidad de Concepción, Domingo 26 de Agosto / 19:00 hrs.',NULL,'2018-08-01 20:30:16',NULL,5),
(63,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2339075-Dreams-Edo-Caroe-Orgia-De-Ornitorrincos-Valdivia.html','EDO CAROE, ORGIA DE ORNITORRINCOS / DREAMS VALDIVIA','Casino Dreams Valdivia, Domingo 26 de Agosto 20:00 horas.',NULL,'2018-07-23 19:54:46',NULL,5),
(64,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2347111-Teatro-Universidad-Concepcion-Tito-Beltran-il-Sogno.html','TITO BELTRAN &#38; IL SOGNO / TEATRO UNIVERSIDAD DE CONCEPCIÓN','Teatro Universidad de Concepción, Jueves 30 de Agosto / 20:30 hrs.',NULL,'2018-08-06 19:53:16',NULL,4),
(65,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2348907-Lihuen-Restobar-Concepcion-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / CONCEPCIÓN','Lihuen Restobar Concepción, Jueves 30 de Agosto, 22:30 hrs. ',NULL,'2018-08-09 19:51:44',NULL,5),
(66,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2338227-Espacio-Marina-Hernaldo-Zuniga-Gira-Olor-De-Luna.html','HERNALDO ZÚÑIGA-GIRA OLOR DE LUNA/ ESPACIO MARINA, CONCEPCIÓN','Espacio Marina , Viernes 31 de Agosto / 20:00 hrs.',NULL,'2018-07-19 15:53:08',NULL,3),
(67,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2339200-Casino-Ovalle-Andres-De-Leon.html','ANDRÉS DE LEÓN / OVALLE CASINO &#38; RESORT','Ovalle Casino & Resort Virnes 31 de Agosto / 22:·00 hrs.',NULL,'2018-07-24 17:14:58',NULL,5),
(68,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2346928-TRR-Denise-Rosenthal.html','DENISE ROSENTHAL / RANCAGUA','Teatro Regional de Rancagua Viernes 31 de Agosto 20:00 hrs.',NULL,'2018-08-03 16:06:22',NULL,3),
(69,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2348307-Bar-Gaz-Gaz-Valdivia-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / VALDIVIA','Bar Gaz Gaz Valdivia, Viernes 31 de Agosto, 21:30 hrs. ',NULL,'2018-08-09 17:21:05',NULL,5),
(70,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2350300-Aula-Magna-Arzobispado-Concepcion-Fiesta-De-Los-Ninos-18-30-Horas.html','FIESTA DE LOS NIÑOS- 18:30 HORAS / AULA MAGNA ARZOBISPADO DE CONCEPCIÓN','Aula Magna Arzobispado de Concepción, Sábado 01 de Septiembre / 18:30 hrs.','2018-07-20 14:21:59','2018-08-17 13:22:00',NULL,4),
(71,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2293554-Arena-Recoleta-Southamerican-Music-Festival.html','SOUTHAMERICAN MUSIC FESTIVAL 2018 / ARENA RECOLETA','Arena Recoleta, Sábado 01 de Septiembre 15:30 hrs.',NULL,'2018-04-05 19:05:54',NULL,3),
(72,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2328508-Gran-Arena-Monticello-Pablo-Milanes.html','PABLO MILANÉS, ESENCIA TOUR 2018 / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 08 de Diciembre / 21:00 hrs.','2018-05-15 22:29:58','2018-06-29 14:13:05',NULL,3),
(73,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2324886-TRR-De-Fiesta-Alison-Mandel.html','DE FIESTA, ALISON MANDEL / RANCAGUA','Teatro Regional de Rancagua, Sábado 01 de Septiembre, 21:00 hrs.',NULL,'2018-06-20 15:40:55',NULL,4),
(74,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2348607-Sanseacabo-Temuco-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / TEMUCO','Sanseacabó! Temuco, Sábado 01 De Septiembre, 21:00 hrs. ',NULL,'2018-08-09 19:29:10',NULL,5),
(75,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2345636-Dreams-Super-Nova-Puerto-Varas.html','SUPERNOVA/ DREAMS PUERTO VARAS','Dreams Puerto Varas, Sábado 01 de Septiembre, 22:00 hrs.',NULL,'2018-07-31 15:10:29',NULL,5),
(76,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2346964-Centro-Eventos-Soprting-Club-Gira-Solista-Kirov-Ballet.html','GIRA SOLISTA KIROV BALLET, EL MARAVILLOSO ENCANTO BALLET CLÁSICO RUSO/SPORTING CLUB','Centro Eventos Sporting Club Domingo 02 de Septiembre 19:00 hrs.',NULL,'2018-08-03 20:27:16',NULL,4),
(77,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2344960-Aula-Magna-Universidad-Federico-Santa-Maria-Valparaiso-Sin-Miedo.html','SIN MIEDO, NATALIA VALDEBENITO / VALPARAISO','Aula Magna Universidad Federico Santa María Domingo 02 de Septiembre, 19:30 hrs. ',NULL,'2018-07-27 22:01:04',NULL,5),
(78,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2345788-TRR-Amor-Por-Ti-Buddy-Richard-En-Vivo.html','AMOR POR TI, BUDDY RICHARD EN VIVO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 07 de Septiembre  20:30 hrs.',NULL,'2018-07-31 20:10:07',NULL,5),
(79,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2323040-Gran-Arena-Monticello-Tenis-Masu-vs-Gonzalez-La-Revancha.html','NUEVA FECHA COPA CACHANTUN BY KIA: MASSÚ VS GONZÁLEZ, LA REVANCHA/ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, NUEVA FECHA VIERNES 07 DE SEPTIEMBRE / 20:30 hrs.',NULL,'2018-06-14 14:15:11',NULL,5),
(80,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2328631-TMC-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / TEATRO MUNICIPAL DE CALAMA','Teatro Municipal de Calama, Viernes 07 de Septiembre, 21:00 hrs. ',NULL,'2018-06-29 17:27:55',NULL,5),
(81,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2327772-TRR-Biografias-Isabel-Parra-Inti-Illimani.html','BIOGRAFÍAS, ISABEL PARRA &#38; INTI ILLIMANI / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 08 de Septiembre 20:30 hrs.',NULL,'2018-06-27 15:49:47',NULL,5),
(82,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2226189-Gran-Arena-Monticello-Stefan-Kramer-Autoayuda.html','STEFAN KRAMER, ¡AUTOAYUDA!, LA NUEVA LOCURA DE KRAMER / 10% DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 08 de Septiembre / 21:00 hrs.',NULL,'2017-11-06 13:32:54',NULL,4),
(83,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2339164-Teatro-Liceo-Gregorio-Cordovez-Fiesta-De-Los-Ninos.html','FIESTA DE LOS NIÑOS/LA SERENA','Teatro Liceo Gregorio Cordovez  Sábado 08 de Septiembre 15:30 hrs.',NULL,'2018-07-24 16:30:25',NULL,5),
(84,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2339039-Casino-Antay-Fiesta-De-Los-Ninos.html','FIESTA DE LOS NIÑOS / CASINO ANTAY,COPIAPÓ','Casino Antay, Copiapó Domingo 09 de Septiembre / 15:·30 hrs.',NULL,'2018-07-23 19:29:28',NULL,5),
(85,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2350044-TRR-La-Pergola-De-Las-Flores.html','LA PÉRGOLA DE LAS FLORES / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 14 de Septiembre 20:30 hrs.',NULL,'2018-08-14 19:34:59',NULL,5),
(86,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2316659-Gran-Arena-Monticello-Franco-Simone.html','FRANCO SIMONE / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Lunes 17 de Septiembre / 21:00 hrs.',NULL,'2018-05-29 14:29:12',NULL,3),
(87,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2316809-Gran-Arena-Monticello-Pedro-Fernandez.html','PEDRO FERNANDEZ, TOUR ARRÁNQUENSE MUCHACHOS / GRAN ARENA MONTICELLO','Gran Arena Monticello, Martes 18 de Septiembre / 21:00 hrs.',NULL,'2018-05-29 15:12:18',NULL,3),
(88,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2317399-Gran-Arena-Monticello-Steve-Augeri.html','STEVE AUGERI,  FORMED LEAD VOCALIST JOURNEY/ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 21 de Septiembre / 21:30 hrs.',NULL,'2018-05-30 22:42:42',NULL,3),
(89,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2330530-Gran-Arena-Monticello-Box-Internacional-Aguja-Gonzalez-Pancora-Velasquez.html','BOX INTERNACIONAL - AGUJA GONZALEZ - PANCORA VELÁSQUEZ / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 22 de Septiembre / 20:30 hrs.',NULL,'2018-07-05 20:52:30',NULL,5),
(90,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2346717-TRR-Travesia-Gala-Ballet-28-Septiembre.html','TRAVESÍA, GALA BALLET 28 SEPTIEMBRE/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 28 de Septiembre  20:30 hrs.',NULL,'2018-08-02 21:14:29',NULL,5),
(91,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2346753-TRR-Travesia-Gala-Ballet-29-Septiembre.html','TRAVESÍA, GALA BALLET - 29 SEPTIEMBRE/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 29 de Septiembre  20:30 hrs.',NULL,'2018-08-02 21:34:48',NULL,5),
(92,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2310147-Gran-Arena-Monticello-Kool-And-The-Gang-Fiesta-Radio-Activa.html','KOOL AND THE GANG - FIESTA RADIO ACTIVA / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 29 de Septiembre / 21:00 hrs.',NULL,'2018-05-16 15:27:26',NULL,3),
(93,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2336286-TRR-Viejos-De-Mierda.html','VIEJOS DE MIERDA/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Miércoles 03 de Octubre 19:30 hrs.',NULL,'2018-07-10 16:57:47',NULL,5),
(94,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2345123-Gran-Arena-Monticello-Yuri-Y-Pandora-Juntitas-Tour.html','YURI Y PANDORA, JUNTITAS TOUR / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 05 de Octubre / 21:00 hrs.',NULL,'2018-07-30 17:11:53',NULL,3),
(95,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-party/2346109-Ex-Boulevard-Gira-Mekano-Talca.html','GIRA MEKANO / EX BOULEVARD TALCA','Ex Boulevard Talca, Sábado 06 de Octubre, 20:00 hrs.\n\n',NULL,'2018-08-01 21:11:38',NULL,2),
(96,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2329617-Gran-Arena-Monticello-Lo-Mejor-De-La-Mansion-Rosa.html','LA MANSIÓN ROSA ¡UN SHOW DE INFARTO SIN CENSURA! / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, NUEVA FECHA Viernes 12 de Octubre / 21:00 hrs.',NULL,'2018-07-04 14:36:59',NULL,4),
(97,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2346362-Gimnasio-Olimpico-UFRO-Gira-Mekano.html','GIRA MEKANO/ GIMNASIO OLÍMPICO UFRO','Gimnasio Olímpico UFRO, Viernes 12 de Octubre, 20:00 hrs. ',NULL,'2018-08-02 14:35:23',NULL,4),
(98,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2268255-Gran-Arena-Monticello-Vivaldianno-19-Oct--.html','VIVALDIANNO CITY OF MIRRORS - 19 OCT./ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLOTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 19 de Octubre / 21:30 hrs.',NULL,'2018-02-06 22:52:24',NULL,5),
(99,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2272799-Gran-Arena-Monticello-Vivaldianno-.html','VIVALDIANNO CITY OF MIRRORS / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello 19 y 20 de Octubre / 21:30 hrs.',NULL,'2018-02-21 19:12:35',NULL,5),
(100,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2346892-TMCH-Moral-Distraida.html','MORAL DISTRAIDA/ TEATRO MUNICIPAL DE CHILLÁN','Teatro Municipal de Chillán, Sábado 20 de Octubre/ 21:00 hrs.',NULL,'2018-08-03 13:31:00',NULL,3),
(101,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2268360-Gran-Arena-Monticello-Vivaldianno-20-Oct-.html','VIVALDIANNO CITY OF MIRRORS - 20 OCT. / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 20 de Octubre / 21:30 hrs.',NULL,'2018-02-06 22:59:56',NULL,5),
(102,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2322779-Casa-Piedra-Fiesta-De-la-Odontoogia-101-Aniversario.html','FIESTA DE LA ODONTOLOGÍA 101 ANIVERSARIO / CASA PIEDRA','Casa Piedra, Sábado 20 de Octubre / 20:·00 hrs.',NULL,'2018-06-13 15:44:45',NULL,5),
(103,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-party/2346178-Coliseo-Monumental-Serena-Gira-Mekano-2018.html','GIRA MEKANO / COLISEO MONUMENTAL DE LA SERENA','Coliseo Monumental de La Serena, Sábado 20 de Octubre, 20:00 hrs.',NULL,'2018-08-01 21:51:05',NULL,2),
(104,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2350350-Espacio-Marina-Andes-Fest-2018.html','ANDES FEST 2018/ ESPACIO MARINA, CONCEPCIÓN','Espacio Marina , Viernes 26 de Octubre / 17:00 hrs.',NULL,'2018-08-17 14:35:15',NULL,5),
(105,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2347701-Gran-Arena-Monticello-Francisca-Valenzuela.html','FRANCISCA VALENZUELA / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Jueves 31 de Octubre / 21:00 hrs.',NULL,'2018-08-08 20:56:45',NULL,3),
(106,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2350465-Gimnasio-Olimpico-UFRO-Andes-Fest-2018.html','ANDES FEST 2018/ GIMNASIO OLÍMPICO UFRO','Gimnasio Olímpico UFRO, Miércoles 31 de Octubre, 17:00 hrs. ',NULL,'2018-08-17 15:49:17',NULL,4),
(107,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2345824-Dreams-Celtic-Legends-15th-Anniversary-Punta-Arenas.html','CELTIC LEGENDS 15TH ANNIVERSARY / DREAMS PUNTA ARENAS','Dreams Punta Arenas, Miércoles 31 de Octubre, 20:00 hrs.',NULL,'2018-07-31 20:43:45',NULL,3),
(108,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2336914-Casino-Luckia-Viejos-De-Mierda.html','VIEJOS DE MIERDA / CASINO LUCKIA, ARICA','Casino Luckia, Arica Miércoles 31 de Octubre / 19:·30 hrs.',NULL,'2018-07-13 17:40:21',NULL,5),
(109,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2350325-Coliseo-Monumental-Serena-Andes-Fest-2018.html','ANDES FEST 2018 / COLISEO MONUMENTAL DE LA SERENA','Coliseo Monumental de La Serena, Viernes 02 de Noviembre, 18:00 hrs.',NULL,'2018-08-17 13:47:10',NULL,3),
(110,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2336543-Gran-Arena-Monticello-Luis-Jara-en-Vivo.html','LUIS JARA EN VIVO / 15% DE DESCUENTO SOCIOS MVG  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 03 de Noviembre / 21:30 hrs.',NULL,'2018-07-12 15:38:53',NULL,3),
(111,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2171940-Gran-Arena-Monticello-Myriam-Hernandez-La-Fuerza-del-Amor-Tour-2018.html','MYRIAM HERNÁNDEZ, LA FUERZA DEL AMOR TOUR 2018 / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 09 de Noviembre / 21:30 hrs.',NULL,'2017-08-02 19:28:18',NULL,3),
(112,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2327300-Gran-Arena-Monticello-Elvis-Crespo.html','ELVIS CRESPO LATIN AMERICA TOUR 2018 / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 10 de Noviembre / 21:30 hrs.',NULL,'2018-06-26 19:43:11',NULL,3),
(113,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-events/2311065-Gran-Arena-Monticello-Jorge-Alis-No-lo-Dije-lo-Pense.html','JORGE ALIS, NO LO DIJE, LO PENSÉ / 10% DE DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 16 de Noviembre / 21:30 hrs.',NULL,'2018-05-17 15:00:54',NULL,5),
(114,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2337592-Gran-Arena-Monticello-Oscar-de-Leon.html','OSCAR DE LEON / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 17 de Noviembre / 21:00 hrs.',NULL,'2018-07-18 16:44:47',NULL,3),
(115,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2347551-Dreams-Ballet-Romeo-y-Julieta-Punta-Arenas.html','BALLET ROMEO Y JULIETA / DREAMS PUNTA ARENAS','Dreams Punta Arenas, Miércoles 05 de Diciembre, 20:00 hrs.',NULL,'2018-08-07 18:58:54',NULL,4),
(116,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2083038-Dreams-Myriam-Hernandez-La-Fuerza-del-Amor-Tour-2018-Valdivia.html','MYRIAM HERNANDEZ, LA FUERZA DEL AMOR TOUR 2018 / DREAMS VALDIVIA','Dreams Valdivia, Jueves 06 de Diciembre, 21:30 hrs.',NULL,'2017-03-08 12:05:59',NULL,3),
(117,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2347646-TRR-Dios-Salve-A-La-Reina.html','DIOS SALVE A LA REINA / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Domingo 09 de Diciembre 19:00 hrs.',NULL,'2018-08-08 19:14:55',NULL,3),
(118,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-concerts/2258726-Gran-Arena-Monticello-Victor-Manuelle-Gira-25-7.html','VICTOR MANUELLE GIRA 25/7 / 20% DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 15 de Diciembre/ 21:30 hrs.',NULL,'2018-01-17 16:43:17',NULL,3),
(119,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/en/a92945-theatre/2331386-Gran-Arena-Monticello-Viejos-De-Mierda-Vadel-Vidiela-Coco-Legrand.html','VIEJOS DE MIERDA - VADEL,VIDIELA Y COCO LEGRAND / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 28 de Diciembre / 21:00 hrs.',NULL,'2018-07-09 14:52:23',NULL,4),
(120,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/yamishibai-japanese-ghost-stories/episode-7-frog-eggs-774870','Yamishibai: Japanese Ghost Stories 6 - Episode 7 - Frog Eggs',NULL,NULL,'2018-08-17 20:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/980cc54bf4a0d5f088cdbe79a3d787c71534479998_thumb.jpg\"  /><br />',6),
(121,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/bungo-stray-dogs/episode-2-a-certain-bomb-776474','Bungo Stray Dogs (Spanish Dub) - Episode 2 - A Certain Bomb',NULL,NULL,'2018-08-17 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/2e9e2ef12eae8bd524c577b0771cb5d61460065383_thumb.jpg\"  /><br />Despite joining the Armed Detective Agency, Nakajima lacks convection that he\'d be of any use. Just as he\'s about to bid the agency farewell, a bomber takes over the agency with one of the agency employees as his hostage...!',6),
(122,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/ninja-girl-samurai-master/episode-72-the-successors-774669','Ninja Girl & Samurai Master 3rd - Episode 72 - The Successors',NULL,NULL,'2018-08-17 18:05:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/5c99964cd101752b3b42133f4df8faa71534449702_thumb.jpg\"  /><br />',6),
(123,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/lord-of-vermilion-the-crimson-king/episode-6-bright-lights-suit-a-dark-heart-775147','Lord of Vermilion: The Crimson King - Episode 6 - Bright Lights Suit A Dark Heart',NULL,NULL,'2018-08-17 17:35:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/8abda29011ac737246007b2deded1fee1534519432_thumb.jpg\"  /><br />',6),
(124,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/my-sweet-tyrant/episode-20-clean-up-activities-774656','My Sweet Tyrant - Episode 20 - Clean Up Activities',NULL,NULL,'2018-08-17 15:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/8d2439ad599e0de5843a72387bc9235b1534479885_thumb.jpg\"  /><br />',6),
(125,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/chios-school-road/episode-7-convenience-store-chio-chan-chio-chan-and-the-duel-remnants-of-that-day-774825','Chio\'s School Road - Episode 7 - Convenience Store Chio-chan / Chio-chan and the Duel / Remnants of That Day',NULL,NULL,'2018-08-17 14:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/6e5065403981315750fa9bd117365cb71534480053_thumb.jpg\"  /><br />Part A: Chio-chan heads to her usual convenience store.\r\nPart B: Eihira Private Girls’ Academy is a renowned school where only the richest girls go.\r\nPart C: Chio-chan and Manana run into an old lady who’s always sitting in front of a café, all alone.',6),
(126,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/muhyo-rojis-bureau-of-supernatural-investigation/episode-3-talent-776586','Muhyo & Roji\'s Bureau of Supernatural Investigation - Episode 3 - Talent',NULL,NULL,'2018-08-17 14:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/f7717b23b65daeb83c18d0c53d2578ad1534479851_thumb.jpg\"  /><br />',6),
(127,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/working-buddies/episode-7-not-working-buddies-summer-774838','Working Buddies! 2! - Episode 7 - Not Working Buddies Summer',NULL,NULL,'2018-08-17 13:45:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/c9e13ee7bb12bffeb178c038f7fae67e1534479793_thumb.jpg\"  /><br />',6),
(128,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/harukana-receive/episode-7-were-already-friends-774765','Harukana Receive - Episode 7 - We\'re Already Friends',NULL,NULL,'2018-08-17 13:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/3dceea6f68c60c41888fdd78ba22633e1534479785_thumb.jpg\"  /><br />',6),
(129,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/angels-of-death/episode-7-who-are-you-774752','Angels of Death - Episode 7 - Who are you?',NULL,NULL,'2018-08-17 13:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/31f00d9fe912523ca3c587aae28566fe1534479917_thumb.jpg\"  /><br />After slashing open his own belly, Zack is left without the strength to stand, so Rachel sets off alone into Floor B2 in search of something to stop his bleeding.',6),
(130,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/isekai-izakaya-japanese-food-from-another-world/episode-19-the-female-merc-774510','Isekai Izakaya: Japanese Food From Another World - Episode 19 - The Female Merc',NULL,NULL,'2018-08-17 03:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/bd81c1efb99ca50262b01a4e45cde99d1534467338_thumb.jpg\"  /><br />Léontine, a female mercenary working for the eastern kingdom of Oilia, is on her way north to visit a group of nobles. She takes this opportunity to search for a man she once crossed blades with on the battlefield: the “Devil.” Where does this man find himself now? Léontine says she’s looking to pay him back, but...',6),
(131,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/isekai-izakaya-japanese-food-from-another-world/episode-20-the-secret-of-whatsontap-part-1-774511','Isekai Izakaya: Japanese Food From Another World - Episode 20 - The Secret of Whatsontap: Part 1',NULL,NULL,'2018-08-17 03:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/2753b77e80e980a180684edeb8747ff71534467320_thumb.jpg\"  /><br />City council chief Backeshof, one of the best merchants in all of Aitheria, has set his eyes on purchasing Nobu. Shinobu stubbornly refuses his offer, but he responds by informing her that whatsontap is actually an illegal alcohol. If that is true, then that means that they’ve been violating the empire’s law this entire time. Not only could Nobu get shut down for good, but Nobuyuki and Shinobu could find themselves sentenced to death!',6),
(132,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/black-clover-international-dubs/episode-4-the-magic-knights-entrance-exam-776600','Black Clover (Spanish Dub) - Episode 4 - The Magic Knights Entrance Exam',NULL,NULL,'2018-08-16 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/6cfebb94f6ae960c88c71e101a8f0d841508803254_thumb.jpg\"  /><br />Asta and Yuno head toward the colosseum in the royal capital for the Magic Knights Entrance Exam, while looking around and admiring all the things they’ve never seen before.',6),
(133,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/black-clover-international-dubs/episode-3-to-the-royal-capital-of-the-clover-kingdom-776599','Black Clover (Spanish Dub) - Episode 3 - To the Royal Capital of the Clover Kingdom!',NULL,NULL,'2018-08-16 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/dca8e525f3374bbcab5ddf6a066e25a61508198365_thumb.jpg\"  /><br />Asta and Yuno spend six months training for the upcoming Magic Knights Entrance Exam. Everyone seems to think Yuno is sure to pass, but worries that Asta is just wasting his time.',6),
(134,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/how-not-to-summon-a-demon-lord/episode-7-change-of-heart-774796','How Not to Summon a Demon Lord - Episode 7 - Change of Heart',NULL,NULL,'2018-08-16 13:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/ae7a5bf36f02fa028ee65c57cdfb71d71534406525_thumb.jpg\"  /><br />The following day after Prince Keera\'s visit, Shera suddenly bids farewell to Diablo while they\'re preparing potions. Unable to stop her from leaving, Diablo holes up in the inn, consumed with regret. Rem is unsettled to see him so negative, too.',6),
(135,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/anisong-station/episode-70-august-16th-2018-774257','Anisong Station - Episode 70 - August 16th 2018',NULL,NULL,'2018-08-16 12:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/5b4bb29324cf3bb8dcf532a96b7373151534393374_thumb.jpg\"  /><br />',6),
(136,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/boruto-naruto-next-generations/episode-69-super-cho-cho-love-upheaval-775199','BORUTO: NARUTO NEXT GENERATIONS - Episode 69 - Super Cho-Cho Love Upheaval!',NULL,NULL,'2018-08-16 11:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/5c355aa4dc6e9d2a0d1acb18e12466f21534393298_thumb.jpg\"  /><br />The ninja in the gas mask appears again during filming and kidnaps Tomaru. Despite everything that happened, Cho-Cho continues to worry about Tomaru and berates Konohamaru and Moeri for failing to stop the abductor. Meanwhile,  Ashina agrees to deliver the money as instructed in the ransom note.',6),
(137,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-26-zap-victory-is-always-mine-772197','The Slayers - Episode 26 - ZAP! Victory is Always Mine!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/9e5b66646d2612a0c345ab30166f62c01527158353_thumb.jpg\"  /><br />In order to have Lina and her friends come out, the clone Rezo attacks the town of Saylague.',6),
(138,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-25-yes-a-final-hope-the-blessed-blade-772193','The Slayers - Episode 25 - YES! A Final Hope: The Blessed Blade!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/09973b4b344533d5d8978f6bb78f80d51527158008_thumb.jpg\"  /><br />Struck by the clone Rezo\'s blow, Lina is injured. Her friends try to help Lina escape, but even the power of \"Sword Of Light\" doesn\'t work on the clone.',6),
(139,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-24-x-day-the-demon-beast-is-reborn-772189','The Slayers - Episode 24 - X-DAY! The Demon Beast Is Reborn!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/64dbbd2840c49e0fa3658963c496a4a71527157774_thumb.jpg\"  /><br />Relieved from Eris\'s control, the clone Rezo assaults Lina and her friends at his own will.',6),
(140,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-23-warning-eris-wrath-772185','The Slayers - Episode 23 - WARNING! Eris\' Wrath!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/e4048dced0a6c759f0bd87851731245d1527157550_thumb.jpg\"  /><br />Rezo\'s secret is revealed in the book found in his institute. Two fiends take the book of secrets back and in a split second, attach the control device on Gourry.',6),
(141,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-22-vice-the-one-who-was-left-behind-772181','The Slayers - Episode 22 - VICE! The One Who Was Left Behind!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/f01b54fa2c4930d1274895f793ba8e971527157075_thumb.jpg\"  /><br />Lina and her friends rush to the lowest level of Rezo\'s institute.',6),
(142,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-21-upset-gourry-vs-zangulus-772177','The Slayers - Episode 21 - UPSET! Gourry vs. Zangulus',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/aa60fd2fe395a769b9a93a90932a94ed1527156846_thumb.jpg\"  /><br />Lina, Gourry, Amelia and Shilfeel get to Rezo\'s museum. They break the seal by the \"Sword Of Light,\" and look for Rezo\'s secret in the underground chamber.',6),
(143,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-20-trouble-rahanimu-the-furious-fish-man-772173','The Slayers - Episode 20 - TROUBLE! Rahanimu, the Furious Fish Man!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/c2237315790d692158344bfdd6a55d6f1527156501_thumb.jpg\"  /><br />Reciting numerous incantations for self-defense, Lina and her friends put up with Rezo\'s fierce attack. But Rezo\'s powerful black magic destroys half of the town.',6),
(144,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-19-shock-sairaag-falls-772169','The Slayers - Episode 19 - SHOCK! Sairaag Falls!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/21f2fe22e5556be5b8727c607e8932cf1527156237_thumb.jpg\"  /><br />Lina and her friends are shocked to see Rezo coming back alive. At the same time, they suspect that Rezo could be a clone like Vilmgun, too.',6),
(145,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-18-return-the-red-priest-is-back-772163','The Slayers - Episode 18 - RETURN! The Red Priest Is Back!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/bfbf2ba46b39e4164530cbcbf0eb18c41527155894_thumb.jpg\"  /><br />Threesome finally gets to Saylague. They sneak into the town in the darkness of the night, and rest in the house of Shilfeel, a friend of Gourry.',6),
(146,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-17-question-hes-proposing-to-that-girl-772159','The Slayers - Episode 17 - QUESTION? He\'s Proposing to THAT Girl?',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/29ae10fcf86c942c5034cded5377f73c1527155628_thumb.jpg\"  /><br />Lina, Gourry and Amelia is getting closer to Saylague. In order to outrun the tenacious pursuers they try to get on a ship, but the ship is watched by the bounty hunters.',6),
(147,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-16-passion-shall-we-give-our-lives-for-the-stage-772155','The Slayers - Episode 16 - PASSION! Shall We Give Our Lives for the Stage?',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/2af7ab8cec7a7757ac798c4320ac412d1527155237_thumb.jpg\"  /><br />The journey to Saylague continues. The threesome slips into a touring company that they come across on the road.',6),
(148,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-15-oh-no-linas-wedding-rhapsody-772151','The Slayers - Episode 15 - OH NO! Lina\'s Wedding Rhapsody?',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/85203a62010a0cab8cdf5c5663925f971527154980_thumb.jpg\"  /><br />On their rushing way to Saylague, Lina and her friends meet a young man named Harris. He asks Lina to be his bride for his false marriage because he\'s been forced by a witch called Carry to marry her daughter.',6),
(149,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-14-navigation-an-invitation-to-sairaag-772147','The Slayers - Episode 14 - NAVIGATION! An Invitation to Sairaag!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/f8556fa55af767c8d521ce8356fd313a1527154632_thumb.jpg\"  /><br />Lina and her friends are still chased by the bounty hunters as usual. They try to outrun the pursuers in the mountains, but no avail.',6),
(150,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-13-money-knock-out-those-bounty-hunters-772143','The Slayers - Episode 13 - MONEY! Knock Out Those Bounty Hunters!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/148e9e2416baa427eb192a150941efa01527154311_thumb.jpg\"  /><br />Lina, Gourry and Amelia finally arrive in Sayloon and see the poster of \"the Wanted.\" To their surprise, \"the Wanted\" are Lina and Gourry.',6),
(151,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-12-lovely-amelias-magic-training-772139','The Slayers - Episode 12 - LOVELY! Amelia\'s Magic Training!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/886a679bf849f2d1cad97644d68aaa671527154094_thumb.jpg\"  /><br />Lina\'s magic, \"Dragon Slay\", works tremendously well on the bandits. Impressed, Amelia insists on learning Lina\'s sorcery.',6),
(152,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-11-knockout-the-seyruun-family-feud-772135','The Slayers - Episode 11 - KNOCKOUT! The Seyruun Family Feud!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/f24f70aa895dea36fd57ba45f3e7ed081527153816_thumb.jpg\"  /><br />After destroying Shabranigoodoo, Lina and others continue their journey.',7),
(153,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-10-jackpot-the-great-life-or-death-gamble-772133','The Slayers - Episode 10 - JACKPOT! The Great Life or Death Gamble!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/ef38d4247e813cfdddf723377238af1c1527153364_thumb.jpg\"  /><br />Lina and others challenge the Dark Lord, Shabranigoodoo. Unfortunately, he\'s is too powerful and no magic works on him.',6),
(154,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-9-impact-the-eve-of-the-great-life-or-death-gamble-772127','The Slayers - Episode 9 - IMPACT! The Eve of the Great Life or Death Gamble!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/b5be837ae83294b6a6f98c41bfa183c91527146301_thumb.jpg\"  /><br />Rezo succeeds to resurrect the Dark Lord, Shabranigoodoo. However, Rezo\'s body is taken over by the Dark Lord against his plan.',6),
(155,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-8-help-shabranigdo-is-reborn-772123','The Slayers - Episode 8 - HELP! Shabranigdo Is Reborn!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/86e199b4f9fb696fea8127e41676d3941527146040_thumb.jpg\"  /><br />While taking a rest in a village, Gourry and Zelgadis start to fight over \"the Stone of Wisdom.\" Lina calms them down, but they get more hostile to each other.',6),
(156,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-7-give-up-but-just-before-we-do-the-sure-kill-sword-appears-772119','The Slayers - Episode 7 - GIVE UP! But, Just Before We Do, The Sure Kill Sword Appears!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/38690906b30187faa669691c6767d9c01527145741_thumb.jpg\"  /><br />Under the villains\' ceaseless attack, Lina and Zelgadis have no time to rest. Meanwhile, Rezo begins to summon the demons in order to capture them.',6),
(157,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-6-focus-rezos-the-real-enemy-772115','The Slayers - Episode 6 - FOCUS! Rezo\'s the Real Enemy?!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/c9707f3bcff57ec62ac97bab5eddec6d1527145513_thumb.jpg\"  /><br />Rezo suddenly appears in front of Lina and calls Zelgadis a traitor. Lina is surprised to know the relationship between the two.',6),
(158,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-5-escape-noonsa-the-flaming-fish-man-772111','The Slayers - Episode 5 - ESCAPE! Noonsa, the Flaming Fish Man!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/58bc6c85a14ce43d06ba119e3f413e0f1527145118_thumb.jpg\"  /><br />Lina is confined into Zelgadis\' hideout. To her surprise, the one who helped her to escape is Zelgadis himself.',6),
(159,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-4-dash-run-for-it-my-magic-doesnt-work-772107','The Slayers - Episode 4 - DASH! Run for It! My Magic Doesn\'t Work?',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/3042ebac084eebd26f2fb6180ff58d9a1527144829_thumb.jpg\"  /><br />Lina and Gourry start investigating a way to stop Shabranigoodoo\'s resurrection, however they are plagued with a question. Why is Zelgadis trying to revive the Demon Lord?',6),
(160,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-3-crash-red-and-white-and-suspicious-all-over-772103','The Slayers - Episode 3 - CRASH! Red and White and Suspicious All Over!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/476751779bf22432962400a33cfbbb171527144471_thumb.jpg\"  /><br />The man Zolf brought in is called Zelgadis. He is a mixture of human, golem and demon; a creation of utter evil.',6),
(161,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-2-bad-mummy-men-arent-my-type-772099','The Slayers - Episode 2 - BAD! Mummy Men Aren\'t My Type!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/9146bec2b95720c7daa185e4b0ebdeb71527144335_thumb.jpg\"  /><br />Lina and Gourry go to a Magic shop in town to sell the treasures that Lina snatched from the bandits.',6),
(162,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-slayers/episode-1-angry-linas-furious-dragon-slave-772097','The Slayers - Episode 1 - ANGRY? Lina\'s Furious Dragon Slave!',NULL,NULL,'2018-08-16 02:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/b044cf93b3a0cc0998434737bb4273581527143893_thumb.jpg\"  /><br />Lina Inverse is sweet sixteen on her solitary journey to Atlas City. Not many people know that she is a powerful sorceress and at the same time a great swordswoman.',6),
(163,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/murder-princess/episode-6-determinations-end-776735','Murder Princess - Episode 6 - Determination\'s End',NULL,NULL,'2018-08-16 01:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/0278c66547c977d380d9e492748ab2f51534204664_thumb.jpg\"  /><br />Alita, Falis, and their cyborg comrades return to Forland Castle to stop Kaito from abusing the awesome power of Te Oria.  In the midst of a bloody battle, the bounty hunter realizes that destroying such a power is not without sacrifice.',6),
(164,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/murder-princess/episode-5-fate-776733','Murder Princess - Episode 5 - Fate',NULL,NULL,'2018-08-16 01:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/9e9cd4f7481710f3e4fd52dce3fce7cb1534203812_thumb.jpg\"  /><br />Falis is badly wounded during a daring escape. With Kaito and the royal army in hot pursuit, the unlikely band of allies strikes out for the border - until Dominikov’s fireside revelations reveal the powerful force drawing evil to Forland.',6),
(165,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/murder-princess/episode-2-coronation-776727','Murder Princess - Episode 2 - Coronation',NULL,NULL,'2018-08-16 01:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/a911471bb0ec1fb9173c227929a5358c1534201620_thumb.jpg\"  /><br />After the successful liberation of Forland castle, Alita vows to serve Falis by posing as the queen’s handmaiden. All goes according to plan until the coronation festivities are interrupted by a genetically engineered monster.',6),
(166,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-12-beyond-the-eternal-sky-748349','Strike Witches 2 - Episode 12 - Beyond the Eternal Sky',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/23fcd87bd855f9b6e3577c0415e474df1506050464_thumb.jpg\"  /><br />Major Sakamoto risks her life to save the world, but the Neuroi hive proves nearly impossible to destroy. The witches are all out of magic, but Yoshika refuses to give up the fight!',6),
(167,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-11-to-be-myself-748347','Strike Witches 2 - Episode 11 - To Be Myself',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/2f88c416a39d9e2e91fc94659a844a0a1506057338_thumb.jpg\"  /><br />As the Strike Witches prepare for their most dangerous mission yet, Major Sakamoto - the bravest warrior among their ranks - can no longer hide the fact that her magic is rapidly fading!',6),
(168,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-10-500-overs-748345','Strike Witches 2 - Episode 10 - 500 Overs',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/ae695ec53f8e728d828cabbf4902273b1506050829_thumb.jpg\"  /><br />Hartmann teams up with a famous witch on loan from another unit in order to defeat a special Neuroi that’s impervious to airborne attacks! The new girl has lethal skills - and an attitude to match!',6),
(169,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-9-the-bridge-to-tomorrow-748343','Strike Witches 2 - Episode 9 - The Bridge to Tomorrow',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/6fcb0e85104a612f32883c360c82b5d01506048392_thumb.jpg\"  /><br />When the girls of the 501st hit the beach for some special training, Lucchini discovers a treasure chest that leads to a treasure map that leads to booby traps!',6),
(170,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-8-please-give-me-wings-748341','Strike Witches 2 - Episode 8 - Please Give Me Wings',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/3c5e183f08b026fb9bb599441b555a461506052514_thumb.jpg\"  /><br />Yoshika is permanently grounded after suddenly losing the ability to fly, but a prototype Striker Unit inspired by her father’s letter may hold the key to putting her back in action!',6),
(171,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-7-its-all-creepy-crawly-748339','Strike Witches 2 - Episode 7 - It\'s All Creepy-Crawly',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/717440a984ed7e7cfeab017b6251edad1506047403_thumb.jpg\"  /><br />Bath time is interrupted by an invasive insect hopping from one set of skimpy skivvies to another. The Strike Witches are up in arms over this shocking breach of their britches, and they’ll do whatever it takes to protect their panties!',6),
(172,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-6-higher-than-the-sky-748337','Strike Witches 2 - Episode 6 - Higher than the Sky',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/e9bc5446701609d84f7ca953118983201506049630_thumb.jpg\"  /><br />A menacing new breed of Neuroi looms high above the clouds, and the Strike Witches must equip themselves with experimental rocket boosters in order to reach the unprecedented altitude required to destroy their enemy!',6),
(173,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-5-my-romagna-748335','Strike Witches 2 - Episode 5 - My Romagna',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/cc056d296f3e075fb3c08303b650141f1506045707_thumb.jpg\"  /><br />A Strike Witch shopping trip goes up in flames when Lucchini spends the squadron’s money on a sightseeing adventure and the town is attacked by Neuroi!',6),
(174,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-4-hard-fast-amazing-748333','Strike Witches 2 - Episode 4 - Hard, Fast, Amazing',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/f7471d8e95d6c12a14beed69357d5f371506045092_thumb.jpg\"  /><br />Barkhorn runs into big trouble during a test flight of the new jet striker unit, and only an extremely well-endowed comrade has the power to save her from the ultimate crash-landing!',6),
(175,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-3-that-which-we-can-do-748331','Strike Witches 2 - Episode 3 - That Which We Can Do',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/beb0d822586b44cf57ca8987361795bb1506044876_thumb.jpg\"  /><br />Yoshika, Lynne, and Perrine report to a mysterious old woman for some special training, but their broomstick lessons are soon interrupted by a deadly Neuroi attack!',6),
(176,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-2-the-legendary-witches-748329','Strike Witches 2 - Episode 2 - The Legendary Witches',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/db7173145cc8987114be3879a59369211506044409_thumb.jpg\"  /><br />When Sakamoto’s strike unit malfunctions, Yoshika is forced into a solo dogfight against a rapidly-regenerating Neuroi! The bombastic beauties of the 501st Joint Fighter Wing race to provide backup, but will they arrive in time?',6),
(177,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-1-into-the-sky-once-more-748301','Strike Witches 2 - Episode 1 - Into the Sky Once More',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/d6358db3e6079fb1807218b8dd56ce3b1506008120_thumb.jpg\"  /><br />Yoshika’s plans to become a doctor are put on hold after a mysterious letter from her father leads to a reunion with Sakamoto. Elsewhere, her former Strike Witch comrades take to the air to battle a new breed of Neuroi!',6),
(178,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-12-strike-witches-748299','Strike Witches - Episode 12 - Strike Witches',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/b2fd375cbd833a4f3f840bac882753761506006819_thumb.jpg\"  /><br />Yoshika battles the out-of-control Warlock, but it\'s too much for her to handle. At the moment she needs them most, the Strike Witches reassemble and join the fight!',6),
(179,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-11-into-the-sky-748297','Strike Witches - Episode 11 - Into the Sky…',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/417b3227da34b89f32c3bf25a5e880211506006514_thumb.jpg\"  /><br />The Strike Witches are disbanded in favor of more advanced military technology - the Warlock. But as the girls go their separate ways, something goes horribly wrong.',6),
(180,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-10-i-want-you-to-believe-748295','Strike Witches - Episode 10 - I Want You to Believe',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/edc38f3f6a9a95e4e959cc9de5aed2c51506006118_thumb.jpg\"  /><br />Yoshika is placed on house arrest for her part in Major Sakamoto’s injury, but she can’t shake the feeling that the witch-shaped Neuroi is somehow different from the others.',6),
(181,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-9-what-i-want-to-protect-748281','Strike Witches - Episode 9 - What I Want to Protect',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/94c6a5943d8705d64c8f6b2d368971dd1505994181_thumb.jpg\"  /><br />Minna and Sakamoto argue over the Major’s future with the Strike Witches. A close encounter with an unusual Neuroi lures Yoshika into a trap.',6),
(182,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-8-i-wont-forget-you-748279','Strike Witches - Episode 8 - I Won\'t Forget You',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/4ab7e4faee52566356f7cb0b767943511505993702_thumb.jpg\"  /><br />As the fleet prepares for a daring counter-offensive, Commander Minna searches for the courage to face the reminders of her tragic past.',6),
(183,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-7-nice-and-breezy-748275','Strike Witches - Episode 7 - Nice and Breezy',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/05e8b2f1ce68b4b49c9c1ab801303c5d1505993445_thumb.jpg\"  /><br />When Hartmann’s underwear vanishes, it leads to game of musical panties that’s got all the Strike Witches jumping in and out of their skivvies.',6),
(184,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-6-were-the-same-748271','Strike Witches - Episode 6 - We\'re the Same',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/a43f41436f26af221c140c64115b72171505993008_thumb.jpg\"  /><br />An unexpected encounter with the rapidly-adapting Neuroi convinces Major Sakamoto to form a night patrol led by Sanya - who happens to share a birthday with Yoshika.',6),
(185,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-5-fast-big-soft-748269','Strike Witches - Episode 5 - Fast, Big, Soft',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/c958a1bb38bb23c9a60d2a25c46efdf71505992797_thumb.jpg\"  /><br />Yoshika keeps having strange, exciting dreams about her fellow Strike Witches and a surprise enemy attack may actually make them come true.',6),
(186,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-4-thanks-748265','Strike Witches - Episode 4 - Thanks',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/ca45ad6bc61562d30b23e23a6b56bb0c1505992486_thumb.jpg\"  /><br />Lt. Barkhorn’s reckless battle tactics put her life in great danger; Yoshika and Perrine must set aside their differences and work together to save her.',6),
(187,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-3-youre-not-alone-748263','Strike Witches - Episode 3 - You\'re Not Alone',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/ebdff144087f3b758cea9b985d13fbd41505992193_thumb.jpg\"  /><br />Yoshika is introduced to the rest of the Strike Witches and begins her grueling training. When the Neuroi strike unexpectedly, she gets a chance to test her mettle.',6),
(188,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/strike-witches/episode-1-magical-girl-748259','Strike Witches - Episode 1 - Magical Girl',NULL,NULL,'2018-08-16 00:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/f01b5082cf0015e53c482ccc15a404b61505991627_thumb.jpg\"  /><br />Yoshika’s powerful healing spell catches the eye of Major Sakamoto - who attempts to recruit her for a high-flying military unit known as the Strike Witches.',6),
(189,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/trigun/episode-1-badlands-rumble-776470','Trigun: Badlands Rumble - Episode 1 - Badlands Rumble',NULL,NULL,'2018-08-15 23:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/df1819edd8f948e52f9e6e8bab4aae251533775749_thumb.jpg\"  /><br />Twenty years ago, Vash the Stampede allowed an infamous outlaw named Gasback to escape final justice. Now, on the streets of Macca City, Vash is about to learn a hard truth about consequences - and he might end up paying for the lesson with his life.',6),
(190,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/shakugan-no-shana/shakugan-no-shana-the-movie-shakugan-no-shana-the-movie-776468','Shakugan No Shana: The Movie - Shakugan no Shana: The Movie',NULL,NULL,'2018-08-15 22:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/d36c9ddf458410791d16d9d7ec55807a1533769037_thumb.jpg\"  /><br />During battle with a monster consuming human lives, Shana accidentally slices human Yuji with her fiery blade. A phenomenon keeps him alive, but Shana must stop a villain who desires the boy’s new powers from destroying the huntress and an entire city!',6),
(191,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/anime-recap/episode-24-one-punch-man-season-2-teaser-perfect-blue-in-theaters-more-anime-recap-776764','Anime Recap - Episode 24 - One-Punch Man Season 2 Teaser, Perfect Blue in Theaters, & MORE | Anime Recap',NULL,NULL,'2018-08-15 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/c39573cb7b2ea413f3168c42df3decc71534303932_thumb.jpg\"  /><br />',6),
(192,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/rezero-starting-life-in-another-world-/episode-1-the-end-of-the-beginning-and-the-beginning-of-the-end-776753','Re:ZERO -Starting Life in Another World- (Spanish Dub) - Episode 1 - The End of the Beginning and the Beginning of the End',NULL,NULL,'2018-08-15 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/43fbe17dec8d02f614290d59b2585d791534282127_thumb.jpg\"  /><br />Natsuki Subaru is summoned to a parallel world on his way home from the convenience store. He\'s entranced at first by the fantasy world suddenly stretching before his eyes, but the cute girl he believes summoned him is nowhere to be found, and soon enough he\'s utterly lost. Then a gang of punks surrounds him, but he quickly learns that he doesn\'t have any of the powers that he thought all people transported to a parellel world should have. Just when he\'s about to be beaten senseless, a girl appears...',6),
(193,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/steinsgate-0/episode-18-altair-of-translational-symmetry-translational-symmetry-775096','Steins;Gate 0 - Episode 18 - Altair of Translational Symmetry -Translational Symmetry-',NULL,NULL,'2018-08-15 17:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/5c6cef2d393f0a8aa3c02fd7d1ee734d1534353882_thumb.jpg\"  /><br />All hell breaks loose over the time machine when a villain from the future haunts the past and unveils their devious plan.',6),
(194,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/free-iwatobi-swim-club/episode-6-the-mermaid-of-the-abyss-775637','Free! -Dive to the Future- - Episode 6 - The Mermaid of the Abyss!',NULL,NULL,'2018-08-15 16:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/b441b1683b63c2edcaef8daa14c0793e1534349199_thumb.jpg\"  /><br />',6),
(195,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-77-infinite-entertainment-the-kojiki-775626','Meow Meow Japanese History - Episode 77 - Infinite Entertainment The Kojiki!',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/e658fd0012d0f89480463fa7e67e78bc1531956281_thumb.jpg\"  /><br />',6),
(196,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-76-the-wildcat-of-a-son-yagyu-jubei-775625','Meow Meow Japanese History - Episode 76 - The Wildcat of a Son, Yagyu Jubei!',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/b0154f1f23588a8787a630dd836ce6a71531956240_thumb.jpg\"  /><br />',6),
(197,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-75-a-quietly-legendary-idol-shizuka-gozen-775624','Meow Meow Japanese History - Episode 75 - A Quietly Legendary Idol, Shizuka Gozen!',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/ceafd1db76a54d73b376289cae91c4251531956226_thumb.jpg\"  /><br />',6),
(198,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-74-invincible-adorable-okita-soji-775623','Meow Meow Japanese History - Episode 74 - Invincible! Adorable! Okita Soji!',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/c96c263b351bb8184b3e4d96ebaacd791531956233_thumb.jpg\"  /><br />',6),
(199,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-73-time-to-take-the-nation-date-masamune-the-story-of-dandy-date-775622','Meow Meow Japanese History - Episode 73 - Time To Take the Nation, Date Masamune! The Story of Dandy Date',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/44b6a160ea4f08024d89d159090203491531956200_thumb.jpg\"  /><br />',6),
(200,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/meow-meow-japanese-history/episode-72-its-the-heavenly-scholar-sugawara-no-michizane-775616','Meow Meow Japanese History - Episode 72 - It\'s the Heavenly Scholar, Sugawara no Michizane!',NULL,NULL,'2018-08-15 11:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/1a99dc167ff5e9e3268ee8fe968e0d1c1531949631_thumb.jpg\"  /><br />',6),
(201,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/yu-gi-oh-vrains/episode-64-turning-point-775399','Yu-Gi-Oh! VRAINS - Episode 64 - Turning Point',NULL,NULL,'2018-08-15 10:55:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/0373740dc771710203132b59c2ec77d81534278129_thumb.jpg\"  /><br />',6),
(202,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/mr-tonegawa-middle-management-blues/episode-7-proliferation-774721','Mr. TONEGAWA Middle Management Blues - Episode 7 - Proliferation',NULL,NULL,'2018-08-14 19:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/adf834d441caec55480e0bb8727ee6061534221383_thumb.jpg\"  /><br />',6),
(203,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/lupin-the-3rd-part-5/episode-19-a-762mm-mirage-774781','LUPIN THE 3rd PART 5 - Episode 19 - A 7.62mm Mirage',NULL,NULL,'2018-08-14 18:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/95556066afd28f343d6592d4a375c1ff1533849916_thumb.jpg\"  /><br />A string of indiscriminate shootings has struck Northern Africa. They\'re actually a challenge to Lupin from the wealthy Zylberstein. Lupin heads to the valley where his foe awaits, amusing himself with a game of chess. Looking down upon him from both sides of the cliffs are two snipers... Lupin has Daisuke Jigen on his side, but one of the enemy shooters is Mirage, who knows all about Jigen. Who will win the sniping duel?',6),
(204,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/late-night-the-genius-bakabon/episode-6-anime-is-hard-775071','Late night! The Genius Bakabon - Episode 6 - Anime is Hard',NULL,NULL,'2018-08-14 18:05:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/284e81cbf3f3095afb0c63209aec10711534261084_thumb.jpg\"  /><br />',6),
(205,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/angolmois-record-of-mongol-invasion/episode-6-where-death-leads-775025','Angolmois: Record of Mongol Invasion - Episode 6 - Where Death Leads',NULL,NULL,'2018-08-14 17:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/ce36b0742d7583366b1c28aa28803c9c1534261580_thumb.jpg\"  /><br />',6),
(206,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/overlord/episode-6-invitation-to-death-775057','Overlord III - Episode 6 - Invitation to Death',NULL,NULL,'2018-08-14 14:30:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire4-tmb/4b0b4ca48d5c9ed8182918c0e66e6cb71534229862_thumb.jpg\"  /><br />The Tomb of Nazarick continues their plan for world domination and Ains visits the Baharuth Empire as Momon of Darkness. Meanwhile, Count Femel hires a large number of Workers to explore a certain tomb recently discovered in Re-Estize Kingdom.',6),
(207,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-idolmster-cinderella-girls-theater/episode-33-untitled-774923','THE IDOLM@STER CINDERELLA GIRLS Theater 3rd Season (TV) - Episode 33 - Untitled',NULL,NULL,'2018-08-14 12:55:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/c68a13d3caa85abc092593707680e03e1534246452_thumb.jpg\"  /><br />',6),
(208,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/the-idolmster-cinderella-girls-theater/episode-30-do-you-want-to-hear-me-out-774932','THE IDOLM@STER CINDERELLA GIRLS Theater 3rd Season (Web) - Episode 30 - Do You Want to Hear Me Out?',NULL,NULL,'2018-08-14 12:55:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire3-tmb/94a2ca8c6b5d74e026c00ae7d4bad5e41534222626_thumb.jpg\"  /><br />What\'s your ideal wedding like?',6),
(209,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/black-clover/episode-45-the-guy-who-doesnt-know-when-to-quit-774906','Black Clover - Episode 45 - The Guy Who Doesn\'t Know When to Quit',NULL,NULL,'2018-08-14 10:25:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire1-tmb/3d524d6ab982b6d14a4ce69feb23f4541534233926_thumb.jpg\"  /><br />Magna, Luck, and Gio, the most powerful Underwater Temple mage, risk their lives fighting Vetto. Asta and Kahono’s older brother, Kiato, also arrive at the scene.',6),
(210,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/gundam-build-divers/episode-19-nadeshiko-athlon-774545','Gundam Build Divers - Episode 19 - Nadeshiko-athlon',NULL,NULL,'2018-08-14 10:00:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/6358b9fd6cae68403511b66d6b7e2fa91534233674_thumb.jpg\"  /><br />The Nadeshiko-athlon, a women-only pre-event to the Raid Battle, is about to begin. The female Divers are excited to hear that the winner will be chosen as an \"image girl\" for the recruitment of girl Divers, and the news carries even beyond GBN to reach Nanami\'s ears.',6),
(211,'http://www.crunchyroll.com/rss/anime','http://www.crunchyroll.com/working-buddies/episode-6-amusement-park-buddies-774837','Working Buddies! 2! - Episode 6 - Amusement Park Buddies!',NULL,NULL,'2018-08-14 01:45:00','<img src=\"https://img1.ak.crunchyroll.com/i/spire2-tmb/dcedfe968d5d282e99e81262702b4c9f1534193060_thumb.jpg\"  /><br />',6),
(212,'https://jaiminisbox.com/reader/feeds/rss','https://jaiminisbox.com/reader/read/dr-stone/en/0/70/','Dr. Stone  Z=70: Paper Shield',NULL,'2018-08-17 23:25:24','2018-08-17 23:25:25','<img src=\"https://i0.wp.com/jaiminisbox.com/reader/content/comics/dr-stone_58b87fdf16814/thumb_stone1.jpg\" />',1),
(213,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2324966-Casino-Ovalle-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / OVALLE CASINO &#38; RESORT','Ovalle Casino & Resort Viernes 17 de Agosto 21:·00 hrs.',NULL,'2018-06-20 17:08:19',NULL,5),
(214,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2349701-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito-18-Agosto.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO - 18 AGOSTO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 18 de Agosto  19:00 hrs.',NULL,'2018-08-10 16:58:35',NULL,5),
(215,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2295835-Gran-Arena-Monticello-Cafe-Tacvba-Niu-Gueis-Tour-2018.html','CAFE TACVBA - NIÚ GÜEIS TOUR 2018 / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 18 de Agosto / 21:00 hrs.',NULL,'2018-04-11 19:44:06',NULL,3),
(216,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2349751-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO/ TEATRO REGIONAL DE RANCAGUA','',NULL,'2018-08-10 17:28:12',NULL,5),
(217,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2345589-Dreams-Piero-Puerto-Varas-.html','PIERO / DREAMS PUERTO VARAS','Dreams Puerto Varas Sábado 18 de Agosto, 22:00 hrs.',NULL,'2018-07-31 14:59:04',NULL,3),
(218,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2349726-TRR-Gira-Cultural-Caja-Los-Andes-Conviertete-En-El-Principito-19-Agosto.html','GIRA CULTURAL CAJA LOS ANDES CONVIÉRTETE EN EL PRINCIPITO - 19 AGOSTO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Domingo 19 de Agosto  17:00 hrs.',NULL,'2018-08-10 17:19:51',NULL,5),
(219,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2327866-TRM-Ballet-Teatro-Nacional-De-Ucrania.html','BALLET TEATRO NACIONAL DE UCRANIA / TEATRO REGIONAL DEL MAULE','Teatro Regional del Maule, Viernes 24 de Agosto, 20:00 hrs. ','2018-06-27 20:21:56','2018-06-27 20:38:56',NULL,3),
(220,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2336752-TMCH-Hernaldo-Zuniga-Gira-Olor-De-Luna.html','HERNALDO ZUÑIGA, GIRA OLOR DE LUNA/ TEATRO MUNICIPAL DE CHILLÁN','Teatro Municipal de Chillán, Viernes 24 de Agosto/ 19:00 hrs.',NULL,'2018-07-12 20:16:02',NULL,3),
(221,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2347927-Teatro-Bohem-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / TEATRO BOHEM RANCAGUA','Teatro Bohem, Rancagua, Viernes 24 de Agosto, 22:30 hrs. ',NULL,'2018-08-09 15:34:45',NULL,5),
(222,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2337188-TRR-El-Mago-Del-Fin-Del-Mundo.html','EL MAGO DEL FIN DEL MUNDO CON JEAN PAUL OLHABERRY, Show de Magia e Ilusión / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 25 de Agosto 19:00 hrs.',NULL,'2018-07-17 17:41:10',NULL,5),
(223,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2348227-Elebar-Matias-Oviedo-Jazmin-Gomez-Valparaiso.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / ELE BAR VALPARAISO','Ele Bar Valparaíso, Sábado 25 de Agosto / 22:30 hrs.',NULL,'2018-08-09 15:52:32',NULL,3),
(224,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2330635-Casino-Luckia-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / CASINO LUCKIA, ARICA','Casino Luckia, Arica Sábado 25 de Agosto / 21:·00 hrs.',NULL,'2018-07-05 22:42:40',NULL,5),
(225,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2345683-Dreams-Sonora-De-Rehabilitarse-Puerto-Varas.html','SONORA DE REHABILITARSE/ DREAMS PUERTO VARAS','Dreams Puerto Varas, Sábado 25 de Agosto, 22:00 hrs.',NULL,'2018-07-31 15:19:57',NULL,3),
(226,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2346084-Teatro-Universidad-Concepcion-Ballet-Teatro-Nacional-Ucrania.html','BALLET TEATRO NACIONAL DE UCRANIA/ TEATRO UNIVERSIDAD DE CONCEPCIÓN','Teatro Universidad de Concepción, Domingo 26 de Agosto / 19:00 hrs.',NULL,'2018-08-01 20:30:16',NULL,5),
(227,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2320498-TRR-Hernaldo-Zuniga-Gira-Olor-De-Luna.html','HERNALDO ZÚÑIGA, GIRA OLOR DE LUNA / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Domingo 26 de Agosto  19:00 hrs.',NULL,'2018-06-07 17:02:39',NULL,5),
(228,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2339075-Dreams-Edo-Caroe-Orgia-De-Ornitorrincos-Valdivia.html','EDO CAROE, ORGIA DE ORNITORRINCOS / DREAMS VALDIVIA','Casino Dreams Valdivia, Domingo 26 de Agosto 20:00 horas.',NULL,'2018-07-23 19:54:46',NULL,5),
(229,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2348907-Lihuen-Restobar-Concepcion-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / CONCEPCIÓN','Lihuen Restobar Concepción, Jueves 30 de Agosto, 22:30 hrs. ',NULL,'2018-08-09 19:51:44',NULL,5),
(230,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2338227-Espacio-Marina-Hernaldo-Zuniga-Gira-Olor-De-Luna.html','HERNALDO ZÚÑIGA-GIRA OLOR DE LUNA/ ESPACIO MARINA, CONCEPCIÓN','Espacio Marina , Viernes 31 de Agosto / 20:00 hrs.',NULL,'2018-07-19 15:53:08',NULL,3),
(231,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2339200-Casino-Ovalle-Andres-De-Leon.html','ANDRÉS DE LEÓN / OVALLE CASINO &#38; RESORT','Ovalle Casino & Resort Viernes 31 de Agosto / 22:·00 hrs.',NULL,'2018-07-24 17:14:58',NULL,5),
(232,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2346928-TRR-Denise-Rosenthal.html','DENISE ROSENTHAL / RANCAGUA','Teatro Regional de Rancagua Viernes 31 de Agosto 20:00 hrs.',NULL,'2018-08-03 16:06:22',NULL,3),
(233,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2339662-TMA-Gira-Solista-Kirov-Ballet.html','GIRA SOLISTA KIROV BALLET, EL MARAVILLOSO ENCANTO BALLET CLÁSICO RUSO/ TEATRO MUNICIPAL DE ANTOFAGASTA','Teatro Municipal de Antofagasta, Viernes 31 Agosto, 21:00 hrs.',NULL,'2018-07-25 14:35:49',NULL,5),
(234,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2348307-Bar-Gaz-Gaz-Valdivia-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / VALDIVIA','Bar Gaz Gaz Valdivia, Viernes 31 de Agosto, 21:30 hrs. ',NULL,'2018-08-09 17:21:05',NULL,5),
(235,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2293554-Arena-Recoleta-Southamerican-Music-Festival.html','SOUTHAMERICAN MUSIC FESTIVAL 2018 / ARENA RECOLETA','Arena Recoleta, Sábado 01 de Septiembre 15:30 hrs.',NULL,'2018-04-05 19:05:54',NULL,3),
(236,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2309547-Gran-Arena-Monticello-Gary-Numan.html','GARY NUMAN / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 01 de Septiembre / 21:00 hrs.',NULL,'2018-05-15 22:29:58',NULL,3),
(237,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2348607-Sanseacabo-Temuco-Matias-Oviedo-Jazmin-Gomez.html','MATÍAS OVIEDO + JAZMÍN GÓMEZ / TEMUCO','Sanseacabó! Temuco, Sábado 01 De Septiembre, 21:00 hrs. ',NULL,'2018-08-09 19:29:10',NULL,5),
(238,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2345636-Dreams-Super-Nova-Puerto-Varas.html','SUPERNOVA/ DREAMS PUERTO VARAS','Dreams Puerto Varas, Sábado 01 de Septiembre, 22:00 hrs.',NULL,'2018-07-31 15:10:29',NULL,5),
(239,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2344960-Aula-Magna-Universidad-Federico-Santa-Maria-Valparaiso-Sin-Miedo.html','SIN MIEDO, NATALIA VALDEBENITO / VALPARAISO','Aula Magna Universidad Federico Santa María Domingo 02 de Septiembre, 19:30 hrs. ',NULL,'2018-07-27 22:01:04',NULL,5),
(240,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2345788-TRR-Amor-Por-Ti-Buddy-Richard-En-Vivo.html','AMOR POR TI, BUDDY RICHARD EN VIVO/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 07 de Septiembre  20:30 hrs.',NULL,'2018-07-31 20:10:07',NULL,5),
(241,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2323040-Gran-Arena-Monticello-Tenis-Masu-vs-Gonzalez-La-Revancha.html','NUEVA FECHA COPA CACHANTUN BY KIA: MASSÚ VS GONZÁLEZ, LA REVANCHA/ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, NUEVA FECHA VIERNES 07 DE SEPTIEMBRE / 20:30 hrs.',NULL,'2018-06-14 14:15:11',NULL,5),
(242,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2328631-TMC-Socios-Felipe-Avello-Pedro-Ruminot.html','SOCIOS, FELIPE AVELLO &#38; PEDRO RUMINOT / TEATRO MUNICIPAL DE CALAMA','Teatro Municipal de Calama, Viernes 07 de Septiembre, 21:00 hrs. ',NULL,'2018-06-29 17:27:55',NULL,5),
(243,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2327772-TRR-Biografias-Isabel-Parra-Inti-Illimani.html','BIOGRAFÍAS, ISABEL PARRA &#38; INTI ILLIMANI / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 08 de Septiembre 20:30 hrs.',NULL,'2018-06-27 15:49:47',NULL,5),
(244,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2339164-Teatro-Liceo-Gregorio-Cordovez-Fiesta-De-Los-Ninos.html','FIESTA DE LOS NIÑOS/LA SERENA','Teatro Liceo Gregorio Cordovez  Sábado 08 de Septiembre 15:30 hrs.',NULL,'2018-07-24 16:30:25',NULL,5),
(245,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2339039-Casino-Antay-Fiesta-De-Los-Ninos.html','FIESTA DE LOS NIÑOS / CASINO ANTAY,COPIAPÓ','Casino Antay, Copiapó Domingo 09 de Septiembre / 15:·30 hrs.',NULL,'2018-07-23 19:29:28',NULL,5),
(246,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2350044-TRR-La-Pergola-De-Las-Flores.html','LA PÉRGOLA DE LAS FLORES / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 14 de Septiembre 20:30 hrs.',NULL,'2018-08-14 19:34:59',NULL,5),
(247,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2316659-Gran-Arena-Monticello-Franco-Simone.html','FRANCO SIMONE / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Lunes 17 de Septiembre / 21:00 hrs.',NULL,'2018-05-29 14:29:12',NULL,3),
(248,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2316809-Gran-Arena-Monticello-Pedro-Fernandez.html','PEDRO FERNANDEZ, TOUR ARRÁNQUENSE MUCHACHOS / GRAN ARENA MONTICELLO','Gran Arena Monticello, Martes 18 de Septiembre / 21:00 hrs.',NULL,'2018-05-29 15:12:18',NULL,3),
(249,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2317399-Gran-Arena-Monticello-Steve-Augeri.html','STEVE AUGERI,  FORMED LEAD VOCALIST JOURNEY/ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 21 de Septiembre / 21:30 hrs.',NULL,'2018-05-30 22:42:42',NULL,3),
(250,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2330530-Gran-Arena-Monticello-Box-Internacional-Aguja-Gonzalez-Pancora-Velasquez.html','BOX INTERNACIONAL - AGUJA GONZALEZ - PANCORA VELÁSQUEZ / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 22 de Septiembre / 20:30 hrs.',NULL,'2018-07-05 20:52:30',NULL,5),
(251,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2346717-TRR-Travesia-Gala-Ballet-28-Septiembre.html','TRAVESÍA, GALA BALLET - 28 SEPTIEMBRE/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Viernes 28 de Septiembre  20:30 hrs.',NULL,'2018-08-02 21:14:29',NULL,5),
(252,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2346753-TRR-Travesia-Gala-Ballet-29-Septiembre.html','TRAVESÍA, GALA BALLET - 29 SEPTIEMBRE/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Sábado 29 de Septiembre  20:30 hrs.',NULL,'2018-08-02 21:34:48',NULL,5),
(253,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2336286-TRR-Viejos-De-Mierda.html','VIEJOS DE MIERDA/ TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Miércoles 03 de Octubre 19:30 hrs.',NULL,'2018-07-10 16:57:47',NULL,5),
(254,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2345123-Gran-Arena-Monticello-Yuri-Y-Pandora-Juntitas-Tour.html','YURI Y PANDORA, JUNTITAS TOUR / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 05 de Octubre / 21:00 hrs.',NULL,'2018-07-30 17:11:53',NULL,3),
(255,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/seminars/2346109-Ex-Boulevard-Gira-Mekano-Talca.html','GIRA MEKANO / EX BOULEVARD TALCA','Ex Boulevard Talca, Sábado 06 de Octubre, 20:00 hrs.\n\n',NULL,'2018-08-01 21:11:38',NULL,5),
(256,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2268255-Gran-Arena-Monticello-Vivaldianno-19-Oct--.html','VIVALDIANNO CITY OF MIRRORS - 19 OCT./ 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 19 de Octubre / 21:30 hrs.',NULL,'2018-02-06 22:52:24',NULL,5),
(257,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2272799-Gran-Arena-Monticello-Vivaldianno-.html','VIVALDIANNO CITY OF MIRRORS / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello 19 y 20 de Octubre / 21:30 hrs.',NULL,'2018-02-21 19:12:35',NULL,5),
(258,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2346892-TMCH-Moral-Distraida.html','MORAL DISTRAIDA/ TEATRO MUNICIPAL DE CHILLÁN','Teatro Municipal de Chillán, Sábado 20 de Octubre/ 21:00 hrs.',NULL,'2018-08-03 13:31:00',NULL,3),
(259,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2268360-Gran-Arena-Monticello-Vivaldianno-20-Oct-.html','VIVALDIANNO CITY OF MIRRORS - 20 OCT. / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 20 de Octubre / 21:30 hrs.',NULL,'2018-02-06 22:59:56',NULL,5),
(260,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2322779-Casa-Piedra-Fiesta-De-la-Odontoogia-101-Aniversario.html','FIESTA DE LA ODONTOLOGÍA 101 ANIVERSARIO / CASA PIEDRA','Casa Piedra, Sábado 20 de Octubre / 20:·00 hrs.',NULL,'2018-06-13 15:44:45',NULL,5),
(261,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2350350-Espacio-Marina-Andes-Fest-2018.html','ANDES FEST 2018/ ESPACIO MARINA, CONCEPCIÓN','Espacio Marina , Viernes 26 de Octubre / 17:00 hrs.',NULL,'2018-08-17 14:35:15',NULL,5),
(262,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2347701-Gran-Arena-Monticello-Francisca-Valenzuela.html','FRANCISCA VALENZUELA / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Jueves 31 de Octubre / 21:00 hrs.',NULL,'2018-08-08 20:56:45',NULL,3),
(263,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2345824-Dreams-Celtic-Legends-15th-Anniversary-Punta-Arenas.html','CELTIC LEGENDS 15TH ANNIVERSARY / DREAMS PUNTA ARENAS','Dreams Punta Arenas, Miércoles 31 de Octubre, 20:00 hrs.',NULL,'2018-07-31 20:43:45',NULL,3),
(264,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2336914-Casino-Luckia-Viejos-De-Mierda.html','VIEJOS DE MIERDA / CASINO LUCKIA, ARICA','Casino Luckia, Arica Miércoles 31 de Octubre / 19:·30 hrs.',NULL,'2018-07-13 17:40:21',NULL,5),
(265,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2350325-Coliseo-Monumental-Serena-Andes-Fest-2018.html','ANDES FEST 2018 / COLISEO MONUMENTAL DE LA SERENA','Coliseo Monumental de La Serena, Viernes 02 de Noviembre, 18:00 hrs.',NULL,'2018-08-17 13:47:10',NULL,3),
(266,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2336543-Gran-Arena-Monticello-Luis-Jara-en-Vivo.html','LUIS JARA EN VIVO / 15% DE DESCUENTO SOCIOS MVG  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 03 de Noviembre / 21:30 hrs.',NULL,'2018-07-12 15:38:53',NULL,3),
(267,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2327300-Gran-Arena-Monticello-Elvis-Crespo.html','ELVIS CRESPO LATIN AMERICA TOUR 2018 / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 10 de Noviembre / 21:30 hrs.',NULL,'2018-06-26 19:43:11',NULL,3),
(268,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/cat-events/2311065-Gran-Arena-Monticello-Jorge-Alis-No-lo-Dije-lo-Pense.html','JORGE ALIS, NO LO DIJE, LO PENSÉ / 10% DE DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 16 de Noviembre / 21:30 hrs.',NULL,'2018-05-17 15:00:54',NULL,5),
(269,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2337592-Gran-Arena-Monticello-Oscar-de-Leon.html','OSCAR DE LEON / 20% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 17 de Noviembre / 21:00 hrs.',NULL,'2018-07-18 16:44:47',NULL,3),
(270,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2315781-Gran-Arena-Monticello-Joss-Stone.html','JOSS STONE - TOTAL WORLD TOUR / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Viernes 07 de Diciembre / 21:30 hrs.',NULL,'2018-05-25 16:07:14',NULL,3),
(271,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2328508-Gran-Arena-Monticello-Pablo-Milanes.html','PABLO MILANÉS, ESENCIA TOUR 2018 / 10% DE DESCUENTO SOCIOS  / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 08 de Diciembre / 21:00 hrs.',NULL,'2018-06-29 14:13:05',NULL,3),
(272,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/1961175-Dreams-Myriam-Hernandez-La-Fuerza-del-Amor-Tour-2018-Puerto-Varas.html','MYRIAM HERNANDEZ, LA FUERZA DEL AMOR TOUR 2018 / DREAMS PUERTO VARAS','Dreams Puerto Varas Sábado 08 de Diciembre, 22:00 hrs.',NULL,'2016-09-20 11:40:34',NULL,3),
(273,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2347646-TRR-Dios-Salve-A-La-Reina.html','DIOS SALVE A LA REINA / TEATRO REGIONAL RANCAGUA','Teatro Regional de Rancagua, Domingo 09 de Diciembre 19:00 hrs.',NULL,'2018-08-08 19:14:55',NULL,3),
(274,'http://www.ticketpro.cl/rss/','http://www.ticketpro.cl/musica/2258726-Gran-Arena-Monticello-Victor-Manuelle-Gira-25-7.html','VICTOR MANUELLE GIRA 25/7 / 20% DESCUENTO SOCIOS MVG / GRAN ARENA MONTICELLO','Gran Arena Monticello, Sábado 15 de Diciembre/ 21:30 hrs.',NULL,'2018-01-17 16:43:17',NULL,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

insert  into `tags`(`id_tags`,`glosa_tag`) values 
(1,'One_Piece'),
(2,'One-Punch_Man'),
(3,'NOCHE_DE_BOXEO'),
(4,'Shokugeki_no_Souma'),
(5,'Haikyuu'),
(6,'My_Hero_Academia'),
(7,'Dr._Stone'),
(8,'Black_Clover'),
(9,'Fairy_Tail'),
(10,'Happiness'),
(11,'Dragon_Ball_Super'),
(12,'A_Trail_of_Blood'),
(13,'Attack_on_Titan'),
(14,'The_Seven_Deadly_Sins'),
(15,'Namaikizakari'),
(16,'One_Shot_Hot'),
(17,'The_Promised_Neverland'),
(18,'Rikudo'),
(19,'Boku_no_Hero_Academia'),
(20,'Nanatsu_no_Taizai'),
(21,'Shingeki_no_Kyojin'),
(22,'Tokyo_Ghoul'),
(23,'Boruto'),
(24,'Dr._Stone_Z'),
(25,'Black_Clover_Page'),
(26,'Wangtangchang_the_Yurutto_Hunter_Credit'),
(27,'Kaguya_Wants_to_be_Confessed_to_Official_Doujin'),
(28,'Jujutsu_Kaisen'),
(29,'We_Want_to_Talk_About_Kaguya'),
(30,'Mononogatari'),
(31,'Kaguya_Wants_to_be_Confessed_to'),
(32,'Origin_Anno_Radix'),
(33,'Eden\'s_Zero'),
(34,'hot_oneshot'),
(35,'SOCIOS'),
(36,'GIRA_CULTURAL_CAJA_LOS_ANDES_CONVIÉRTETE_EN_EL_PRINCIPITO'),
(37,'CAFE_TACVBA_-_NIÚ_G'),
(38,'GIRA_CULTURAL_CAJA_LOS_ANDES_CONVIÉRTETE_EN_EL_PRINCIPITO'),
(39,'PIERO'),
(40,'COBRESAL_VS_SANTIAGO_MORNING'),
(41,'DEP._IQUIQUE_VS_COLO_COLO'),
(42,'BALLET_TEATRO_NACIONAL_DE_UCRANIA'),
(43,'HERNALDO_ZU'),
(44,'MATÍAS_OVIEDO'),
(45,'EL_MAGO_DEL_FIN_DEL_MUNDO_CON_JEAN_PAUL_OLHABERRY'),
(46,'MATÍAS_OVIEDO'),
(47,'TITO_NIEVES'),
(48,'GIRA_SOLISTA_KIROV_BALLET'),
(49,'RAMON_FARÍAS'),
(50,'SONORA_DE_REHABILITARSE'),
(51,'EDO_CAROE'),
(52,'TITO_BELTRAN'),
(53,'ANDRÉS_DE_LEÓN'),
(54,'DENISE_ROSENTHAL'),
(55,'FIESTA_DE_LOS_NI'),
(56,'SOUTHAMERICAN_MUSIC_FESTIVAL'),
(57,'GARY_NUMAN'),
(58,'DE_FIESTA'),
(59,'SUPERNOVA'),
(60,'GIRA_SOLISTA_KIROV_BALLET'),
(61,'SIN_MIEDO'),
(62,'AMOR_POR_TI'),
(63,'NUEVA_FECHA_COPA_CACHANTUN_BY_KIA'),
(64,'BIOGRAFÍAS'),
(65,'STEFAN_KRAMER'),
(66,'LA_PÉRGOLA_DE_LAS_FLORES'),
(67,'FRANCO_SIMONE'),
(68,'PEDRO_FERNANDEZ'),
(69,'STEVE_AUGERI'),
(70,'BOX_INTERNACIONAL_-_AGUJA_GONZALEZ_-_PANCORA_VELÁSQUEZ'),
(71,'TRAVESÍA'),
(72,'TRAVESÍA'),
(73,'KOOL_AND_THE_GANG_-_FIESTA_RADIO_ACTIVA'),
(74,'VIEJOS_DE_MIERDA'),
(75,'YURI_Y_PANDORA'),
(76,'GIRA_MEKANO'),
(77,'LA_MANSIÓN_ROSA'),
(78,'GIRA_MEKANO'),
(79,'VIVALDIANNO_CITY_OF_MIRRORS'),
(80,'VIVALDIANNO_CITY_OF_MIRRORS'),
(81,'MORAL_DISTRAIDA'),
(82,'FIESTA_DE_LA_ODONTOLOGÍA'),
(83,'ANDES_FEST'),
(84,'FRANCISCA_VALENZUELA'),
(85,'ANDES_FEST'),
(86,'CELTIC_LEGENDS'),
(87,'LUIS_JARA_EN_VIVO'),
(88,'MYRIAM_HERNÁNDEZ'),
(89,'ELVIS_CRESPO_LATIN_AMERICA_TOUR'),
(90,'JORGE_ALIS'),
(91,'OSCAR_DE_LEON'),
(92,'BALLET_ROMEO_Y_JULIETA'),
(93,'MYRIAM_HERNÁNDEZ'),
(94,'DIOS_SALVE_A_LA_REINA'),
(95,'VICTOR_MANUELLE_GIRA'),
(96,'VIEJOS_DE_MIERDA_-_VADEL'),
(97,'Yamishibai'),
(98,'Bungo_Stray_Dogs'),
(99,'Ninja_Girl'),
(100,'Lord_of_Vermilion'),
(101,'My_Sweet_Tyrant_-_Episode'),
(102,'Chio\'s_School_Road_-_Episode'),
(103,'Muhyo'),
(104,'Working_Buddies'),
(105,'Harukana_Receive_-_Episode'),
(106,'Angels_of_Death_-_Episode'),
(107,'Isekai_Izakaya'),
(108,'Isekai_Izakaya'),
(109,'How_Not_to_Summon_a_Demon_Lord_-_Episode'),
(110,'Anisong_Station_-_Episode'),
(111,'The_Slayers_-_Episode'),
(112,'The_Slayers_-_Episode'),
(113,'Murder_Princess_-_Episode'),
(114,'Murder_Princess_-_Episode'),
(115,'Strike_Witches'),
(116,'Strike_Witches'),
(117,'Strike_Witches_-_Episode'),
(118,'Strike_Witches_-_Episode'),
(119,'Trigun'),
(120,'Shakugan_No_Shana'),
(121,'Anime_Recap_-_Episode'),
(122,'Re'),
(123,'Steins'),
(124,'Free'),
(125,'Meow_Meow_Japanese_History_-_Episode'),
(126,'Meow_Meow_Japanese_History_-_Episode'),
(127,'Yu-Gi-Oh'),
(128,'Mr._TONEGAWA_Middle_Management_Blues_-_Episode'),
(129,'LUPIN_THE'),
(130,'Late_night'),
(131,'Angolmois'),
(132,'Overlord_III_-_Episode'),
(133,'THE_IDOLM'),
(134,'THE_IDOLM'),
(135,'Black_Clover_-_Episode'),
(136,'Gundam_Build_Divers_-_Episode'),
(137,'JOSS_STONE_-_TOTAL_WORLD_TOUR'),
(138,'PABLO_MILANÉS');

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
