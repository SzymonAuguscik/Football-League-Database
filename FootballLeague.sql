--created by Szymon Auguścik--
DROP TABLE stats;
DROP TABLE players;
DROP TABLE games;
DROP TABLE teams;

BEGIN;


CREATE TABLE teams (
	teamID CHAR(3) PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	city VARCHAR(20) NOT NULL
);

CREATE TABLE games (
	gameID INTEGER PRIMARY KEY,
	hosts CHAR(3) NOT NULL REFERENCES teams,
	aways CHAR(3) NOT NULL REFERENCES teams,
	result SMALLINT[] NOT NULL,
	day DATE NOT NULL  
);

CREATE TABLE players (
	teamID CHAR(3) NOT NULL REFERENCES teams,
	kitNumber SMALLINT NOT NULL,
	forename VARCHAR(20) NOT NULL,
	surname VARCHAR(20) NOT NULL,
	position VARCHAR(20) NOT NULL,
	PRIMARY KEY (teamID,kitNumber)
);

CREATE TABLE stats (
	teamID CHAR(3) NOT NULL REFERENCES teams,
	kitNumber SMALLINT NOT NULL,
	gameID INTEGER NOT NULL REFERENCES games,
	minutes SMALLINT NOT NULL,
	goals SMALLINT,
	assists SMALLINT,
	cards VARCHAR(6)[],
	cleanSheet BOOLEAN,
	goalsTime SMALLINT[],
	assistsTime SMALLINT[],
	cardsTime SMALLINT[],
	PRIMARY KEY (teamID,kitNumber,gameID),
	FOREIGN KEY (teamID,kitNumber) REFERENCES players
);

--teams--
INSERT INTO teams VALUES('FCW','FC','Warsaw');
INSERT INTO teams VALUES('PIE','Piemonte','Rome');
INSERT INTO teams VALUES('RIV','Riviera','Madrid');
INSERT INTO teams VALUES('RAI','Rain','London');
INSERT INTO teams VALUES('VOI','Voila','Paris');
INSERT INTO teams VALUES('SCH','Schwarzbier','Berlin');
INSERT INTO teams VALUES('LEP','Leprechaun','Dublin');
INSERT INTO teams VALUES('PRE','Pretzel','Wien');
INSERT INTO teams VALUES('DRA','Dragao','Lisbon');
INSERT INTO teams VALUES('FKK','FK','Kiev');
INSERT INTO teams VALUES('NIE','Niedwied','Moscow');
INSERT INTO teams VALUES('SVE','Sverige','Stockholm');
INSERT INTO teams VALUES('ACH','Achilles','Amsterdam');
INSERT INTO teams VALUES('HAD','Hades','Athens');
INSERT INTO teams VALUES('KRE','Kretik','Prague');
INSERT INTO teams VALUES('FKB','FK','Belgrad');

--games--
INSERT INTO games VALUES(1,'FKB','FCW','{2,2}','01-07-2018');
INSERT INTO games VALUES(2,'PIE','KRE','{2,6}','01-07-2018');
INSERT INTO games VALUES(3,'RIV','HAD','{0,3}','02-07-2018');
INSERT INTO games VALUES(4,'RAI','ACH','{4,2}','02-07-2018');
INSERT INTO games VALUES(5,'VOI','SVE','{1,2}','03-07-2018');
INSERT INTO games VALUES(6,'SCH','NIE','{6,0}','03-07-2018');
INSERT INTO games VALUES(7,'LEP','FKK','{3,1}','04-07-2018');
INSERT INTO games VALUES(8,'PRE','DRA','{1,3}','04-07-2018');
INSERT INTO games VALUES(9,'DRA','FKB','{1,0}','08-07-2018');
INSERT INTO games VALUES(10,'FKK','PRE','{2,6}','08-07-2018');
INSERT INTO games VALUES(11,'NIE','LEP','{6,1}','09-07-2018');
INSERT INTO games VALUES(12,'SVE','SCH','{5,3}','09-07-2018');
INSERT INTO games VALUES(13,'ACH','VOI','{0,3}','10-07-2018');
INSERT INTO games VALUES(14,'HAD','RAI','{1,0}','10-07-2018');
INSERT INTO games VALUES(15,'KRE','RIV','{2,2}','11-07-2018');
INSERT INTO games VALUES(16,'FCW','PIE','{1,1}','11-07-2018');
INSERT INTO games VALUES(17,'FKB','PIE','{0,3}','15-07-2018');
INSERT INTO games VALUES(18,'RIV','FCW','{0,1}','15-07-2018');
INSERT INTO games VALUES(19,'RAI','KRE','{1,2}','16-07-2018');
INSERT INTO games VALUES(20,'VOI','HAD','{2,0}','16-07-2018');
INSERT INTO games VALUES(21,'SCH','ACH','{3,0}','17-07-2018');
INSERT INTO games VALUES(22,'LEP','SVE','{2,2}','17-07-2018');
INSERT INTO games VALUES(23,'PRE','NIE','{0,0}','18-07-2018');
INSERT INTO games VALUES(24,'DRA','FKK','{1,1}','18-07-2018');
INSERT INTO games VALUES(25,'FKK','FKB','{2,2}','22-07-2018');
INSERT INTO games VALUES(26,'NIE','DRA','{1,3}','22-07-2018');
INSERT INTO games VALUES(27,'SVE','PRE','{1,1}','23-07-2018');
INSERT INTO games VALUES(28,'ACH','LEP','{1,3}','23-07-2018');
INSERT INTO games VALUES(29,'HAD','SCH','{2,5}','24-07-2018');
INSERT INTO games VALUES(30,'KRE','VOI','{6,1}','24-07-2018');
INSERT INTO games VALUES(31,'FCW','RAI','{4,2}','25-07-2018');
INSERT INTO games VALUES(32,'PIE','RIV','{0,2}','25-07-2018');
INSERT INTO games VALUES(33,'FKB','RIV','{1,1}','29-07-2018');
INSERT INTO games VALUES(34,'RAI','PIE','{2,1}','29-07-2018');
INSERT INTO games VALUES(35,'VOI','FCW','{5,3}','30-07-2018');
INSERT INTO games VALUES(36,'SCH','KRE','{1,1}','30-07-2018');
INSERT INTO games VALUES(37,'LEP','HAD','{3,2}','31-07-2018');
INSERT INTO games VALUES(38,'PRE','ACH','{2,1}','31-07-2018');
INSERT INTO games VALUES(39,'DRA','SVE','{2,2}','01-08-2018');
INSERT INTO games VALUES(40,'FKK','NIE','{3,1}','01-08-2018');
INSERT INTO games VALUES(41,'NIE','FKB','{2,2}','05-08-2018');
INSERT INTO games VALUES(42,'SVE','FKK','{1,1}','05-08-2018');
INSERT INTO games VALUES(43,'ACH','DRA','{3,5}','06-08-2018');
INSERT INTO games VALUES(44,'HAD','PRE','{4,0}','06-08-2018');
INSERT INTO games VALUES(45,'KRE','LEP','{2,3}','07-08-2018');
INSERT INTO games VALUES(46,'FCW','SCH','{1,4}','07-08-2018');
INSERT INTO games VALUES(47,'PIE','VOI','{0,2}','08-08-2018');
INSERT INTO games VALUES(48,'RIV','RAI','{1,1}','08-08-2018');
INSERT INTO games VALUES(49,'FKB','RAI','{1,0}','12-08-2018');
INSERT INTO games VALUES(50,'VOI','RIV','{3,2}','12-08-2018');
INSERT INTO games VALUES(51,'SCH','PIE','{3,3}','13-08-2018');
INSERT INTO games VALUES(52,'LEP','FCW','{2,2}','13-08-2018');
INSERT INTO games VALUES(53,'PRE','KRE','{1,2}','14-08-2018');
INSERT INTO games VALUES(54,'DRA','HAD','{1,3}','14-08-2018');
INSERT INTO games VALUES(55,'FKK','ACH','{1,0}','15-08-2018');
INSERT INTO games VALUES(56,'NIE','SVE','{5,3}','15-08-2018');
INSERT INTO games VALUES(57,'FKB','SVE','{1,2}','19-08-2018');
INSERT INTO games VALUES(58,'ACH','NIE','{2,1}','19-08-2018');
INSERT INTO games VALUES(59,'HAD','FKK','{1,2}','20-08-2018');
INSERT INTO games VALUES(60,'KRE','DRA','{3,2}','20-08-2018');
INSERT INTO games VALUES(61,'FCW','PRE','{0,2}','21-08-2018');
INSERT INTO games VALUES(62,'PIE','LEP','{1,6}','21-08-2018');
INSERT INTO games VALUES(63,'RIV','SCH','{2,1}','22-08-2018');
INSERT INTO games VALUES(64,'RAI','VOI','{0,1}','22-08-2018');
INSERT INTO games VALUES(65,'VOI','FKB','{0,5}','26-08-2018');
INSERT INTO games VALUES(66,'SCH','RAI','{2,2}','26-08-2018');
INSERT INTO games VALUES(67,'LEP','RIV','{1,1}','27-08-2018');
INSERT INTO games VALUES(68,'PRE','PIE','{1,0}','27-08-2018');
INSERT INTO games VALUES(69,'DRA','FCW','{4,2}','28-08-2018');
INSERT INTO games VALUES(70,'FKK','KRE','{5,1}','28-08-2018');
INSERT INTO games VALUES(71,'NIE','HAD','{1,2}','29-08-2018');
INSERT INTO games VALUES(72,'SVE','ACH','{6,3}','29-08-2018');
INSERT INTO games VALUES(73,'FKB','ACH','{0,1}','02-09-2018');
INSERT INTO games VALUES(74,'HAD','SVE','{1,4}','02-09-2018');
INSERT INTO games VALUES(75,'KRE','NIE','{5,4}','03-09-2018');
INSERT INTO games VALUES(76,'FCW','FKK','{1,4}','03-09-2018');
INSERT INTO games VALUES(77,'PIE','DRA','{1,0}','04-09-2018');
INSERT INTO games VALUES(78,'RIV','PRE','{6,1}','04-09-2018');
INSERT INTO games VALUES(79,'RAI','LEP','{0,0}','05-09-2018');
INSERT INTO games VALUES(80,'VOI','SCH','{2,4}','05-09-2018');
INSERT INTO games VALUES(81,'SCH','FKB','{3,1}','09-09-2018');
INSERT INTO games VALUES(82,'LEP','VOI','{2,0}','09-09-2018');
INSERT INTO games VALUES(83,'PRE','RAI','{3,1}','10-09-2018');
INSERT INTO games VALUES(84,'DRA','RIV','{2,3}','10-09-2018');
INSERT INTO games VALUES(85,'FKK','PIE','{0,1}','11-09-2018');
INSERT INTO games VALUES(86,'NIE','FCW','{2,2}','11-09-2018');
INSERT INTO games VALUES(87,'SVE','KRE','{1,0}','12-09-2018');
INSERT INTO games VALUES(88,'ACH','HAD','{1,3}','12-09-2018');
INSERT INTO games VALUES(89,'FKB','HAD','{3,5}','16-09-2018');
INSERT INTO games VALUES(90,'KRE','ACH','{1,2}','16-09-2018');
INSERT INTO games VALUES(91,'FCW','SVE','{1,0}','17-09-2018');
INSERT INTO games VALUES(92,'PIE','NIE','{0,6}','17-09-2018');
INSERT INTO games VALUES(93,'RIV','FKK','{1,5}','18-09-2018');
INSERT INTO games VALUES(94,'RAI','DRA','{0,0}','18-09-2018');
INSERT INTO games VALUES(95,'VOI','PRE','{2,1}','19-09-2018');
INSERT INTO games VALUES(96,'SCH','LEP','{1,3}','19-09-2018');
INSERT INTO games VALUES(97,'LEP','FKB','{1,1}','23-09-2018');
INSERT INTO games VALUES(98,'PRE','SCH','{2,2}','23-09-2018');
INSERT INTO games VALUES(99,'DRA','VOI','{3,0}','24-09-2018');
INSERT INTO games VALUES(100,'FKK','RAI','{2,1}','24-09-2018');
INSERT INTO games VALUES(101,'NIE','RIV','{0,1}','25-09-2018');
INSERT INTO games VALUES(102,'SVE','PIE','{1,4}','25-09-2018');
INSERT INTO games VALUES(103,'ACH','FCW','{2,2}','26-09-2018');
INSERT INTO games VALUES(104,'HAD','KRE','{1,4}','26-09-2018');
INSERT INTO games VALUES(105,'FKB','KRE','{1,3}','30-09-2018');
INSERT INTO games VALUES(106,'FCW','HAD','{0,4}','30-09-2018');
INSERT INTO games VALUES(107,'PIE','ACH','{0,1}','01-10-2018');
INSERT INTO games VALUES(108,'RIV','SVE','{1,2}','01-10-2018');
INSERT INTO games VALUES(109,'RAI','NIE','{2,1}','02-10-2018');
INSERT INTO games VALUES(110,'VOI','FKK','{2,4}','02-10-2018');
INSERT INTO games VALUES(111,'SCH','DRA','{0,0}','03-10-2018');
INSERT INTO games VALUES(112,'LEP','PRE','{2,0}','03-10-2018');
INSERT INTO games VALUES(113,'PRE','FKB','{2,1}','07-10-2018');
INSERT INTO games VALUES(114,'DRA','LEP','{1,0}','07-10-2018');
INSERT INTO games VALUES(115,'FKK','SCH','{0,2}','08-10-2018');
INSERT INTO games VALUES(116,'NIE','VOI','{1,6}','08-10-2018');
INSERT INTO games VALUES(117,'SVE','RAI','{0,3}','09-10-2018');
INSERT INTO games VALUES(118,'ACH','RIV','{4,1}','09-10-2018');
INSERT INTO games VALUES(119,'HAD','PIE','{1,6}','10-10-2018');
INSERT INTO games VALUES(120,'KRE','FCW','{0,0}','10-10-2018');
INSERT INTO games VALUES(121,'FCW','FKB','{2,1}','01-03-2018');
INSERT INTO games VALUES(122,'KRE','PIE','{0,2}','01-03-2018');
INSERT INTO games VALUES(123,'HAD','RIV','{0,0}','02-03-2018');
INSERT INTO games VALUES(124,'ACH','RAI','{2,2}','02-03-2018');
INSERT INTO games VALUES(125,'SVE','VOI','{3,0}','03-03-2018');
INSERT INTO games VALUES(126,'NIE','SCH','{5,1}','03-03-2018');
INSERT INTO games VALUES(127,'FKK','LEP','{1,1}','04-03-2018');
INSERT INTO games VALUES(128,'DRA','PRE','{0,1}','04-03-2018');
INSERT INTO games VALUES(129,'FKB','DRA','{1,1}','08-03-2018');
INSERT INTO games VALUES(130,'PRE','FKK','{3,0}','08-03-2018');
INSERT INTO games VALUES(131,'LEP','NIE','{0,3}','09-03-2018');
INSERT INTO games VALUES(132,'SCH','SVE','{5,0}','09-03-2018');
INSERT INTO games VALUES(133,'VOI','ACH','{1,3}','10-03-2018');
INSERT INTO games VALUES(134,'RAI','HAD','{1,1}','10-03-2018');
INSERT INTO games VALUES(135,'RIV','KRE','{6,0}','11-03-2018');
INSERT INTO games VALUES(136,'PIE','FCW','{4,4}','11-03-2018');
INSERT INTO games VALUES(137,'PIE','FKB','{1,1}','15-03-2018');
INSERT INTO games VALUES(138,'FCW','RIV','{1,2}','15-03-2018');
INSERT INTO games VALUES(139,'KRE','RAI','{3,2}','16-03-2018');
INSERT INTO games VALUES(140,'HAD','VOI','{0,2}','16-03-2018');
INSERT INTO games VALUES(141,'ACH','SCH','{1,1}','17-03-2018');
INSERT INTO games VALUES(142,'SVE','LEP','{2,1}','17-03-2018');
INSERT INTO games VALUES(143,'NIE','PRE','{3,2}','18-03-2018');
INSERT INTO games VALUES(144,'FKK','DRA','{0,2}','18-03-2018');
INSERT INTO games VALUES(145,'FKB','FKK','{2,3}','22-03-2018');
INSERT INTO games VALUES(146,'DRA','NIE','{1,2}','22-03-2018');
INSERT INTO games VALUES(147,'PRE','SVE','{2,2}','23-03-2018');
INSERT INTO games VALUES(148,'LEP','ACH','{1,5}','23-03-2018');
INSERT INTO games VALUES(149,'SCH','HAD','{1,2}','24-03-2018');
INSERT INTO games VALUES(150,'VOI','KRE','{0,3}','24-03-2018');
INSERT INTO games VALUES(151,'RAI','FCW','{3,4}','25-03-2018');
INSERT INTO games VALUES(152,'RIV','PIE','{2,3}','25-03-2018');
INSERT INTO games VALUES(153,'RIV','FKB','{3,2}','29-03-2018');
INSERT INTO games VALUES(154,'PIE','RAI','{4,4}','29-03-2018');
INSERT INTO games VALUES(155,'FCW','VOI','{0,2}','30-03-2018');
INSERT INTO games VALUES(156,'KRE','SCH','{0,3}','30-03-2018');
INSERT INTO games VALUES(157,'HAD','LEP','{0,1}','31-03-2018');
INSERT INTO games VALUES(158,'ACH','PRE','{1,4}','31-03-2018');
INSERT INTO games VALUES(159,'SVE','DRA','{0,4}','01-04-2018');
INSERT INTO games VALUES(160,'NIE','FKK','{1,4}','01-04-2018');
INSERT INTO games VALUES(161,'FKB','NIE','{1,1}','05-04-2018');
INSERT INTO games VALUES(162,'FKK','SVE','{6,5}','05-04-2018');
INSERT INTO games VALUES(163,'DRA','ACH','{2,0}','06-04-2018');
INSERT INTO games VALUES(164,'PRE','HAD','{1,2}','06-04-2018');
INSERT INTO games VALUES(165,'LEP','KRE','{4,1}','07-04-2018');
INSERT INTO games VALUES(166,'SCH','FCW','{1,1}','07-04-2018');
INSERT INTO games VALUES(167,'VOI','PIE','{1,2}','08-04-2018');
INSERT INTO games VALUES(168,'RAI','RIV','{2,1}','08-04-2018');
INSERT INTO games VALUES(169,'RAI','FKB','{1,1}','12-04-2018');
INSERT INTO games VALUES(170,'RIV','VOI','{0,4}','12-04-2018');
INSERT INTO games VALUES(171,'PIE','SCH','{0,1}','13-04-2018');
INSERT INTO games VALUES(172,'FCW','LEP','{1,4}','13-04-2018');
INSERT INTO games VALUES(173,'KRE','PRE','{0,2}','14-04-2018');
INSERT INTO games VALUES(174,'HAD','DRA','{5,1}','14-04-2018');
INSERT INTO games VALUES(175,'ACH','FKK','{2,3}','15-04-2018');
INSERT INTO games VALUES(176,'SVE','NIE','{0,2}','15-04-2018');
INSERT INTO games VALUES(177,'SVE','FKB','{4,0}','19-04-2018');
INSERT INTO games VALUES(178,'NIE','ACH','{1,5}','19-04-2018');
INSERT INTO games VALUES(179,'FKK','HAD','{1,2}','20-04-2018');
INSERT INTO games VALUES(180,'DRA','KRE','{2,2}','20-04-2018');
INSERT INTO games VALUES(181,'PRE','FCW','{0,2}','21-04-2018');
INSERT INTO games VALUES(182,'LEP','PIE','{0,2}','21-04-2018');
INSERT INTO games VALUES(183,'SCH','RIV','{2,2}','22-04-2018');
INSERT INTO games VALUES(184,'VOI','RAI','{0,1}','22-04-2018');
INSERT INTO games VALUES(185,'FKB','VOI','{1,4}','26-04-2018');
INSERT INTO games VALUES(186,'RAI','SCH','{2,2}','26-04-2018');
INSERT INTO games VALUES(187,'RIV','LEP','{0,1}','27-04-2018');
INSERT INTO games VALUES(188,'PIE','PRE','{1,2}','27-04-2018');
INSERT INTO games VALUES(189,'FCW','DRA','{2,1}','28-04-2018');
INSERT INTO games VALUES(190,'KRE','FKK','{0,1}','28-04-2018');
INSERT INTO games VALUES(191,'HAD','NIE','{1,2}','29-04-2018');
INSERT INTO games VALUES(192,'ACH','SVE','{1,0}','29-04-2018');
INSERT INTO games VALUES(193,'ACH','FKB','{1,3}','03-05-2018');
INSERT INTO games VALUES(194,'SVE','HAD','{1,2}','03-05-2018');
INSERT INTO games VALUES(195,'NIE','KRE','{2,4}','04-05-2018');
INSERT INTO games VALUES(196,'FKK','FCW','{5,4}','04-05-2018');
INSERT INTO games VALUES(197,'DRA','PIE','{4,2}','05-05-2018');
INSERT INTO games VALUES(198,'PRE','RIV','{2,2}','05-05-2018');
INSERT INTO games VALUES(199,'LEP','RAI','{1,2}','06-05-2018');
INSERT INTO games VALUES(200,'SCH','VOI','{2,5}','06-05-2018');
INSERT INTO games VALUES(201,'FKB','SCH','{5,3}','10-05-2018');
INSERT INTO games VALUES(202,'VOI','LEP','{2,1}','10-05-2018');
INSERT INTO games VALUES(203,'RAI','PRE','{4,1}','11-05-2018');
INSERT INTO games VALUES(204,'RIV','DRA','{2,2}','11-05-2018');
INSERT INTO games VALUES(205,'PIE','FKK','{3,1}','12-05-2018');
INSERT INTO games VALUES(206,'FCW','NIE','{3,6}','12-05-2018');
INSERT INTO games VALUES(207,'KRE','SVE','{0,0}','13-05-2018');
INSERT INTO games VALUES(208,'HAD','ACH','{2,1}','13-05-2018');
INSERT INTO games VALUES(209,'HAD','FKB','{1,0}','17-05-2018');
INSERT INTO games VALUES(210,'ACH','KRE','{0,3}','17-05-2018');
INSERT INTO games VALUES(211,'SVE','FCW','{3,0}','18-05-2018');
INSERT INTO games VALUES(212,'NIE','PIE','{2,2}','18-05-2018');
INSERT INTO games VALUES(213,'FKK','RIV','{3,4}','19-05-2018');
INSERT INTO games VALUES(214,'DRA','RAI','{4,3}','19-05-2018');
INSERT INTO games VALUES(215,'PRE','VOI','{0,0}','20-05-2018');
INSERT INTO games VALUES(216,'LEP','SCH','{0,3}','20-05-2018');
INSERT INTO games VALUES(217,'FKB','LEP','{2,3}','24-05-2018');
INSERT INTO games VALUES(218,'SCH','PRE','{1,0}','24-05-2018');
INSERT INTO games VALUES(219,'VOI','DRA','{0,3}','25-05-2018');
INSERT INTO games VALUES(220,'RAI','FKK','{2,0}','25-05-2018');
INSERT INTO games VALUES(221,'RIV','NIE','{0,5}','26-05-2018');
INSERT INTO games VALUES(222,'PIE','SVE','{2,1}','26-05-2018');
INSERT INTO games VALUES(223,'FCW','ACH','{3,4}','27-05-2018');
INSERT INTO games VALUES(224,'KRE','HAD','{4,2}','27-05-2018');
INSERT INTO games VALUES(225,'KRE','FKB','{0,0}','31-05-2018');
INSERT INTO games VALUES(226,'HAD','FCW','{2,0}','31-05-2018');
INSERT INTO games VALUES(227,'ACH','PIE','{0,3}','01-06-2018');
INSERT INTO games VALUES(228,'SVE','RIV','{0,0}','01-06-2018');
INSERT INTO games VALUES(229,'NIE','RAI','{6,2}','02-06-2018');
INSERT INTO games VALUES(230,'FKK','VOI','{2,1}','02-06-2018');
INSERT INTO games VALUES(231,'DRA','SCH','{2,3}','03-06-2018');
INSERT INTO games VALUES(232,'PRE','LEP','{0,4}','03-06-2018');
INSERT INTO games VALUES(233,'FKB','PRE','{3,1}','07-06-2018');
INSERT INTO games VALUES(234,'LEP','DRA','{4,0}','07-06-2018');
INSERT INTO games VALUES(235,'SCH','FKK','{1,0}','08-06-2018');
INSERT INTO games VALUES(236,'VOI','NIE','{1,3}','08-06-2018');
INSERT INTO games VALUES(237,'RAI','SVE','{0,4}','09-06-2018');
INSERT INTO games VALUES(238,'RIV','ACH','{0,2}','09-06-2018');
INSERT INTO games VALUES(239,'PIE','HAD','{1,0}','10-06-2018');
INSERT INTO games VALUES(240,'FCW','KRE','{2,1}','10-06-2018');

--players--
--FCW--
INSERT INTO players VALUES('FCW',1,'Jan','Kobyła','goalkeeper');
INSERT INTO players VALUES('FCW',12,'Aleksander','Mały','goalkeeper');
INSERT INTO players VALUES('FCW',90,'Dariusz','Mrówka','goalkeeper');
INSERT INTO players VALUES('FCW',2,'Janusz','Szafa','defender');
INSERT INTO players VALUES('FCW',3,'Marek','Olszewski','defender');
INSERT INTO players VALUES('FCW',33,'Mateusz','Mierny','defender');
INSERT INTO players VALUES('FCW',5,'Arkadiusz','Klama','defender');
INSERT INTO players VALUES('FCW',6,'Tomasz','Glanowski','defender');
INSERT INTO players VALUES('FCW',93,'Tobiasz','Tamurski','defender');
INSERT INTO players VALUES('FCW',22,'Bogdan','Borsuk','defender');
INSERT INTO players VALUES('FCW',31,'Maciej','Podwoźny','defender');
INSERT INTO players VALUES('FCW',13,'Zachary','Plasny','midfielder');
INSERT INTO players VALUES('FCW',10,'Krzysztof','Moneta','midfielder');
INSERT INTO players VALUES('FCW',14,'Cezary','Kamerski','midfielder');
INSERT INTO players VALUES('FCW',7,'Wojciech','Ogniwo','midfielder');
INSERT INTO players VALUES('FCW',17,'Olgierd','Wawrzyński','midfielder');
INSERT INTO players VALUES('FCW',23,'Robert','Miedziński','midfielder');
INSERT INTO players VALUES('FCW',95,'Tobiasz','Angielek','midfielder');
INSERT INTO players VALUES('FCW',97,'Paweł','Dzikowski','midfielder');
INSERT INTO players VALUES('FCW',15,'Dominik','Okoń','midfielder');
INSERT INTO players VALUES('FCW',9,'Błażej','Prawy','striker');
INSERT INTO players VALUES('FCW',91,'Jan','Czarny','striker');
INSERT INTO players VALUES('FCW',20,'Mateusz','Pyszalski','striker');
INSERT INTO players VALUES('FCW',28,'Robert','Lewiński','striker');
--PIE--
INSERT INTO players VALUES('PIE',12,'Matteo','di Erro','goalkeeper');
INSERT INTO players VALUES('PIE',99,'Gianluca','Marziano','goalkeeper');
INSERT INTO players VALUES('PIE',98,'Simone','Derosso','goalkeeper');
INSERT INTO players VALUES('PIE',37,'Ezio','Fiosca','goalkeeper');
INSERT INTO players VALUES('PIE',2,'Lorenzo','Gigliano','defender');
INSERT INTO players VALUES('PIE',3,'Andrea','Giacomini','defender');
INSERT INTO players VALUES('PIE',4,'Giorgio','Montella','defender');
INSERT INTO players VALUES('PIE',5,'Dominico','Taragna','defender');
INSERT INTO players VALUES('PIE',6,'Matheo','Ilpimiano','defender');
INSERT INTO players VALUES('PIE',22,'Federico','Lognana','defender');
INSERT INTO players VALUES('PIE',29,'Simone','Cathania','defender');
INSERT INTO players VALUES('PIE',44,'Theodore','Lirpo','defender');
INSERT INTO players VALUES('PIE',23,'Leonardo','da Fiesta','midfielder');
INSERT INTO players VALUES('PIE',10,'Graziano','Quebeza','midfielder');
INSERT INTO players VALUES('PIE',7,'Dominico','di Sierro','midfielder');
INSERT INTO players VALUES('PIE',93,'Luca','Martini','midfielder');
INSERT INTO players VALUES('PIE',19,'Timo','Tionelli','midfielder');
INSERT INTO players VALUES('PIE',8,'Paulo','de Pogna','midfielder');
INSERT INTO players VALUES('PIE',11,'Matteo','Morgerini','midfielder');
INSERT INTO players VALUES('PIE',15,'Federico','Bariolli','midfielder');
INSERT INTO players VALUES('PIE',24,'Mario','da Rostea','striker');
INSERT INTO players VALUES('PIE',9,'Roberto','Maccaroni','striker');
INSERT INTO players VALUES('PIE',13,'Dominico','Feorra','striker');
INSERT INTO players VALUES('PIE',41,'Leonardo','Nortoni','striker');
--RIV--
INSERT INTO players VALUES('RIV',1,'Theo','Ramirez','goalkeeper');
INSERT INTO players VALUES('RIV',12,'Fernando','Vallerta','goalkeeper');
INSERT INTO players VALUES('RIV',90,'Sergio','Juarra','goalkeeper');
INSERT INTO players VALUES('RIV',67,'Juan','de la Velta','goalkeeper');
INSERT INTO players VALUES('RIV',5,'Iker','Ontayano','defender');
INSERT INTO players VALUES('RIV',3,'Carles','Primavera','defender');
INSERT INTO players VALUES('RIV',30,'Carlos','Santano da Silva','defender');
INSERT INTO players VALUES('RIV',29,'Jorge','Hernandez','defender');
INSERT INTO players VALUES('RIV',6,'Lucas','Tercajo','defender');
INSERT INTO players VALUES('RIV',82,'Santiago','Roqueza','defender');
INSERT INTO players VALUES('RIV',22,'Gerardo','Castro','defender');
INSERT INTO players VALUES('RIV',4,'Raul','da Nesta','defender');
INSERT INTO players VALUES('RIV',33,'Julian','Jarco','defender');
INSERT INTO players VALUES('RIV',13,'Raul','da Costa','midfielder');
INSERT INTO players VALUES('RIV',73,'Carlos','Garcia da Minta','midfielder');
INSERT INTO players VALUES('RIV',10,'Jorge','Dominguez','midfielder');
INSERT INTO players VALUES('RIV',7,'Marcos','Vicenza','midfielder');
INSERT INTO players VALUES('RIV',20,'Sergio','Isqua','midfielder');
INSERT INTO players VALUES('RIV',14,'Roberto','Martello','midfielder');
INSERT INTO players VALUES('RIV',35,'Fernando','Pierra','midfielder');
INSERT INTO players VALUES('RIV',16,'Lucas','da Fellano','midfielder');
INSERT INTO players VALUES('RIV',18,'Paulo','Geuza','striker');
INSERT INTO players VALUES('RIV',9,'Alfredo','Garcia','striker');
INSERT INTO players VALUES('RIV',27,'David','Semeiro','striker');
INSERT INTO players VALUES('RIV',93,'Francesco','da Vamma','striker');
--RAI--
INSERT INTO players VALUES('RAI',1,'Arthur','Smith','goalkeeper');
INSERT INTO players VALUES('RAI',12,'David','Johns','goalkeeper');
INSERT INTO players VALUES('RAI',19,'Jimmy','Kean','goalkeeper');
INSERT INTO players VALUES('RAI',88,'Adam','Lewis','goalkeeper');
INSERT INTO players VALUES('RAI',5,'Fred','mcDonald','defender');
INSERT INTO players VALUES('RAI',3,'Harry','Kidney','defender');
INSERT INTO players VALUES('RAI',4,'Garry','Thinker','defender');
INSERT INTO players VALUES('RAI',66,'Mark','Ilcay','defender');
INSERT INTO players VALUES('RAI',6,'John','Johnson','defender');
INSERT INTO players VALUES('RAI',18,'Barry','Livingstone','defender');
INSERT INTO players VALUES('RAI',22,'Simon','Fresher','defender');
INSERT INTO players VALUES('RAI',51,'Edmund','Reilly','defender');
INSERT INTO players VALUES('RAI',15,'Samuel','Horrsey','midfielder');
INSERT INTO players VALUES('RAI',17,'Nathaniel','Liver','midfielder');
INSERT INTO players VALUES('RAI',10,'Eric','Fisher','midfielder');
INSERT INTO players VALUES('RAI',11,'Daniel','Henson','midfielder');
INSERT INTO players VALUES('RAI',21,'Jason','Chimney','midfielder');
INSERT INTO players VALUES('RAI',28,'Sam','Thomson','midfielder');
INSERT INTO players VALUES('RAI',14,'Walter','Black','midfielder');
INSERT INTO players VALUES('RAI',27,'Thomas','Jenkins','midfielder');
INSERT INTO players VALUES('RAI',20,'Arthur','mcKenzie','midfielder');
INSERT INTO players VALUES('RAI',16,'Gordon','Samson','striker');
INSERT INTO players VALUES('RAI',31,'Aaron','Heves','striker');
INSERT INTO players VALUES('RAI',99,'Adam','Grace','striker');
INSERT INTO players VALUES('RAI',9,'Patrick','Flitch','striker');
--VOI--
INSERT INTO players VALUES('VOI',1,'Samuel','de la Fel','goalkeeper');
INSERT INTO players VALUES('VOI',12,'Antonio','Crouix','goalkeeper');
INSERT INTO players VALUES('VOI',22,'Sophien','Campagne','goalkeeper');
INSERT INTO players VALUES('VOI',20,'Patrice','le Dreaux','defender');
INSERT INTO players VALUES('VOI',2,'Luis','Darmiogne','defender');
INSERT INTO players VALUES('VOI',5,'Marco','Gengone','defender');
INSERT INTO players VALUES('VOI',3,'Henry','Otaux','defender');
INSERT INTO players VALUES('VOI',4,'Dennis','Flamour','defender');
INSERT INTO players VALUES('VOI',23,'Thierry','Tourjour','defender');
INSERT INTO players VALUES('VOI',6,'Patrice','Sompagne','defender');
INSERT INTO players VALUES('VOI',24,'Patrick','Gabagnion','defender');
INSERT INTO players VALUES('VOI',19,'Alex','Avion','midfielder');
INSERT INTO players VALUES('VOI',8,'Olivier','Raminion','midfielder');
INSERT INTO players VALUES('VOI',11,'Daniel','Pascal','midfielder');
INSERT INTO players VALUES('VOI',16,'Hugon','Marcenis','midfielder');
INSERT INTO players VALUES('VOI',21,'Paul','Goufran','midfielder');
INSERT INTO players VALUES('VOI',7,'Benjamin','Signa','midfielder');
INSERT INTO players VALUES('VOI',13,'Emmanuel','Gallard','midfielder');
INSERT INTO players VALUES('VOI',14,'Dennis','Lacroux','midfielder');
INSERT INTO players VALUES('VOI',25,'Anton','le Praise','striker');
INSERT INTO players VALUES('VOI',9,'Luis','Harcard','striker');
INSERT INTO players VALUES('VOI',10,'Olivier','Gazzar','striker');
INSERT INTO players VALUES('VOI',34,'Rafael','Mardieu','striker');
--SCH--
INSERT INTO players VALUES('SCH',1,'Marcus','Weisser','goalkeeper');
INSERT INTO players VALUES('SCH',12,'Daniel','Nordhaus','goalkeeper');
INSERT INTO players VALUES('SCH',71,'Julian','Badener','goalkeeper');
INSERT INTO players VALUES('SCH',99,'Thomas','Uhrmauer','goalkeeper');
INSERT INTO players VALUES('SCH',2,'Nicolas','Bautrer','defender');
INSERT INTO players VALUES('SCH',5,'Mario','Innerman','defender');
INSERT INTO players VALUES('SCH',6,'Simon','Kaehler','defender');
INSERT INTO players VALUES('SCH',87,'Adam','Partermann','defender');
INSERT INTO players VALUES('SCH',22,'Franz','Tehler','defender');
INSERT INTO players VALUES('SCH',23,'Bernard','Wohnerbaum','defender');
INSERT INTO players VALUES('SCH',90,'Joachim','Kimmelsnach','defender');
INSERT INTO players VALUES('SCH',78,'Mario','Bremmer','defender');
INSERT INTO players VALUES('SCH',13,'Klaus','von Hausen','midfielder');
INSERT INTO players VALUES('SCH',14,'Julian','Gaeher','midfielder');
INSERT INTO players VALUES('SCH',7,'Maximilian','Gluecker','midfielder');
INSERT INTO players VALUES('SCH',11,'Ibrahim','von Neuhauser','midfielder');
INSERT INTO players VALUES('SCH',15,'Martin','Hochschue','midfielder');
INSERT INTO players VALUES('SCH',9,'Tim','Krauser','midfielder');
INSERT INTO players VALUES('SCH',17,'Klaus','Mittwocher','midfielder');
INSERT INTO players VALUES('SCH',37,'Mathias','von den Sueler','midfielder');
INSERT INTO players VALUES('SCH',10,'Marcus','Liemer','striker');
INSERT INTO players VALUES('SCH',20,'Andreas','Schmidt','striker');
INSERT INTO players VALUES('SCH',21,'Adam','Weissman','striker');
INSERT INTO players VALUES('SCH',19,'Mats','Kaltenmann','striker');
--LEP--
INSERT INTO players VALUES('LEP',1,'Arthur','mcJohnson','goalkeeper');
INSERT INTO players VALUES('LEP',12,'Thomas','mcArthur','goalkeeper');
INSERT INTO players VALUES('LEP',33,'John','Dealey','goalkeeper');
INSERT INTO players VALUES('LEP',91,'Henry','Laffy','goalkeeper');
INSERT INTO players VALUES('LEP',2,'Adam','mcDonald','defender');
INSERT INTO players VALUES('LEP',22,'Teodore','Dollay','defender');
INSERT INTO players VALUES('LEP',6,'Carol','Keighthill','defender');
INSERT INTO players VALUES('LEP',5,'Charles','mcHouren','defender');
INSERT INTO players VALUES('LEP',52,'Simon','Denkins','defender');
INSERT INTO players VALUES('LEP',27,'Patrick','mcTomson','defender');
INSERT INTO players VALUES('LEP',4,'Robert','Porter','defender');
INSERT INTO players VALUES('LEP',77,'Joffrey','Tomay','defender');
INSERT INTO players VALUES('LEP',21,'Timothy','mcHarvey','midfielder');
INSERT INTO players VALUES('LEP',23,'Harry','Smith','midfielder');
INSERT INTO players VALUES('LEP',10,'Anthony','mcManner','midfielder');
INSERT INTO players VALUES('LEP',11,'Thomas','Hammer','midfielder');
INSERT INTO players VALUES('LEP',13,'John','Hewes','midfielder');
INSERT INTO players VALUES('LEP',25,'Barry','mcDouger','midfielder');
INSERT INTO players VALUES('LEP',7,'Harry','Seamson','midfielder');
INSERT INTO players VALUES('LEP',8,'Walter','mcSmith','midfielder');
INSERT INTO players VALUES('LEP',20,'Garry','Cracker','midfielder');
INSERT INTO players VALUES('LEP',16,'Simon','mcCrawler','striker');
INSERT INTO players VALUES('LEP',9,'Thomas','Beaver','striker');
INSERT INTO players VALUES('LEP',19,'John','Waeger','striker');
INSERT INTO players VALUES('LEP',93,'Daniel','mcHauton','striker');
--PRE--
INSERT INTO players VALUES('PRE',1,'Walter','Freier','goalkeeper');
INSERT INTO players VALUES('PRE',12,'Marcel','von Weissbaum','goalkeeper');
INSERT INTO players VALUES('PRE',76,'Markus','Hoffmann','goalkeeper');
INSERT INTO players VALUES('PRE',68,'Adam','Webbermann','goalkeeper');
INSERT INTO players VALUES('PRE',3,'Fergus','Leichterman','defender');
INSERT INTO players VALUES('PRE',4,'Daniel','Inthauman','defender');
INSERT INTO players VALUES('PRE',6,'Thomas','Haegert','defender');
INSERT INTO players VALUES('PRE',36,'Mathias','Draucker','defender');
INSERT INTO players VALUES('PRE',34,'Bernard','Paulsmann','defender');
INSERT INTO players VALUES('PRE',66,'Nathan','von Geiter','defender');
INSERT INTO players VALUES('PRE',5,'Lukas','Leiner','defender');
INSERT INTO players VALUES('PRE',19,'Julian','Kyffmauer','defender');
INSERT INTO players VALUES('PRE',13,'Maximilian','Lufter','midfielder');
INSERT INTO players VALUES('PRE',15,'Uwe','Hansen','midfielder');
INSERT INTO players VALUES('PRE',16,'Thomas','Fauer','midfielder');
INSERT INTO players VALUES('PRE',7,'Jonnas','Baumauer','midfielder');
INSERT INTO players VALUES('PRE',11,'Paul','Gauckmann','midfielder');
INSERT INTO players VALUES('PRE',93,'Joachim','Schiftler','midfielder');
INSERT INTO players VALUES('PRE',14,'Dennis','Neumann','midfielder');
INSERT INTO players VALUES('PRE',21,'Mathias','Woerterlehman','midfielder');
INSERT INTO players VALUES('PRE',9,'Joachim','Flickerhaus','striker');
INSERT INTO players VALUES('PRE',18,'Robert','Meinzer','striker');
INSERT INTO players VALUES('PRE',77,'Adam','von den Kreyen','striker');
INSERT INTO players VALUES('PRE',23,'Ulrich','Mannias','striker');
--DRA--
INSERT INTO players VALUES('DRA',1,'Ricardo','Medeiros','goalkeeper');
INSERT INTO players VALUES('DRA',12,'Benjamin','Hueiros','goalkeeper');
INSERT INTO players VALUES('DRA',72,'Miguel','dos Santonio','goalkeeper');
INSERT INTO players VALUES('DRA',2,'Bernardo','Santos','defender');
INSERT INTO players VALUES('DRA',4,'Eduardo','dos Lios','defender');
INSERT INTO players VALUES('DRA',3,'Petro','Huelgos','defender');
INSERT INTO players VALUES('DRA',5,'Cristiano','Fernandes','defender');
INSERT INTO players VALUES('DRA',22,'Rui','Huelga','defender');
INSERT INTO players VALUES('DRA',26,'Ricardo','Morientos','defender');
INSERT INTO players VALUES('DRA',24,'Frederico','dos Rios','defender');
INSERT INTO players VALUES('DRA',18,'Bernardo','Guallamos','defender');
INSERT INTO players VALUES('DRA',7,'Patricio','Luista','midfielder');
INSERT INTO players VALUES('DRA',17,'Luis','Fiestino','midfielder');
INSERT INTO players VALUES('DRA',8,'Samuel','Bravo','midfielder');
INSERT INTO players VALUES('DRA',27,'Patrick','Vista','midfielder');
INSERT INTO players VALUES('DRA',11,'Fernando','da Luiz','midfielder');
INSERT INTO players VALUES('DRA',10,'Miguel','Jorrano','midfielder');
INSERT INTO players VALUES('DRA',13,'Alex','Perreira','midfielder');
INSERT INTO players VALUES('DRA',76,'Daniel','Guarranos','midfielder');
INSERT INTO players VALUES('DRA',9,'Cristiano','Valeras','striker');
INSERT INTO players VALUES('DRA',16,'Luis','Meniros','striker');
INSERT INTO players VALUES('DRA',21,'Fernando','Pertos','striker');
INSERT INTO players VALUES('DRA',91,'Arturo','Dranos','striker');
--FKK--
INSERT INTO players VALUES('FKK',1,'Dymitr','Jatzenko','goalkeeper');
INSERT INTO players VALUES('FKK',12,'Illia','Hiacenko','goalkeeper');
INSERT INTO players VALUES('FKK',21,'Andrei','Yurkovich','goalkeeper');
INSERT INTO players VALUES('FKK',93,'Simeon','Petroshko','goalkeeper');
INSERT INTO players VALUES('FKK',2,'Stepan','Hraniak','defender');
INSERT INTO players VALUES('FKK',3,'Wołodymir','Frukovich','defender');
INSERT INTO players VALUES('FKK',6,'Dymitr','Hałensky','defender');
INSERT INTO players VALUES('FKK',5,'Iwan','Yurkowsky','defender');
INSERT INTO players VALUES('FKK',23,'Timur','Dzubałsky','defender');
INSERT INTO players VALUES('FKK',20,'Artem','Frasynovich','defender');
INSERT INTO players VALUES('FKK',29,'Miron','Walkowicz','defender');
INSERT INTO players VALUES('FKK',26,'Illia','Chegreshevsky','defender');
INSERT INTO players VALUES('FKK',10,'Stepan','Achmovsky','midfielder');
INSERT INTO players VALUES('FKK',31,'Ołeksandr','Maksymovich','midfielder');
INSERT INTO players VALUES('FKK',24,'Bogdan','Gryvansky','midfielder');
INSERT INTO players VALUES('FKK',11,'Maksym','Wołański','midfielder');
INSERT INTO players VALUES('FKK',7,'Taras','Hryzny','midfielder');
INSERT INTO players VALUES('FKK',28,'Igor','Jakuchevych','midfielder');
INSERT INTO players VALUES('FKK',91,'Roman','Fryderikovich','midfielder');
INSERT INTO players VALUES('FKK',19,'Igor','Juglowsky','midfielder');
INSERT INTO players VALUES('FKK',13,'Aleksy','Drazynsky','striker');
INSERT INTO players VALUES('FKK',9,'Wasyl','Wasylovich','striker');
INSERT INTO players VALUES('FKK',17,'Jan','Patryluk','striker');
INSERT INTO players VALUES('FKK',90,'Jegor','Zlumansky','striker');
--NIE--
INSERT INTO players VALUES('NIE',1,'Ołeg','Pietrow','goalkeeper');
INSERT INTO players VALUES('NIE',13,'Stanislav','Zhukowsky','goalkeeper');
INSERT INTO players VALUES('NIE',99,'Teofil','Nikitov','goalkeeper');
INSERT INTO players VALUES('NIE',2,'Nikolai','Harkov','defender');
INSERT INTO players VALUES('NIE',3,'Lew','Yetsynov','defender');
INSERT INTO players VALUES('NIE',22,'Leopold','Jokacenko','defender');
INSERT INTO players VALUES('NIE',6,'Igor','Smolnikovsky','defender');
INSERT INTO players VALUES('NIE',91,'Pavel','Ignacenko','defender');
INSERT INTO players VALUES('NIE',20,'Roman','Semashkov','defender');
INSERT INTO players VALUES('NIE',23,'Jan','Plyakov','defender');
INSERT INTO players VALUES('NIE',12,'Jaroslav','Zhakrov','defender');
INSERT INTO players VALUES('NIE',27,'Ludwik','Illimovichov','midfielder');
INSERT INTO players VALUES('NIE',28,'Oleg','Borisovich','midfielder');
INSERT INTO players VALUES('NIE',11,'Borys','Pyachurkov','midfielder');
INSERT INTO players VALUES('NIE',14,'Wladimir','Rostanovsky','midfielder');
INSERT INTO players VALUES('NIE',24,'Bazyl','Wlastovich','midfielder');
INSERT INTO players VALUES('NIE',89,'Sergei','Frynovich','midfielder');
INSERT INTO players VALUES('NIE',16,'Nikolai','Uginski','midfielder');
INSERT INTO players VALUES('NIE',93,'Igor','Tradensky','midfielder');
INSERT INTO players VALUES('NIE',26,'Piotr','Paganovich','midfielder');
INSERT INTO players VALUES('NIE',7,'Wladimir','Mayeev','striker');
INSERT INTO players VALUES('NIE',9,'Illia','Gregorovich','striker');
INSERT INTO players VALUES('NIE',10,'Denis','Tarkovski','striker');
INSERT INTO players VALUES('NIE',71,'Ołeksandr','Barnabovich','striker');
--SVE--
INSERT INTO players VALUES('SVE',1,'Frans','Hraviksen','goalkeeper');
INSERT INTO players VALUES('SVE',12,'Gustav','Hjalmarson','goalkeeper');
INSERT INTO players VALUES('SVE',33,'Jakob','Svenson','goalkeeper');
INSERT INTO players VALUES('SVE',2,'Ludwig','Hlavsen','defender');
INSERT INTO players VALUES('SVE',32,'Isak','Gustavson','defender');
INSERT INTO players VALUES('SVE',3,'Jesper','Clugar','defender');
INSERT INTO players VALUES('SVE',5,'Heinrich','Lustigson','defender');
INSERT INTO players VALUES('SVE',23,'Olaf','Branson','defender');
INSERT INTO players VALUES('SVE',6,'Otto','Ikarsen','defender');
INSERT INTO players VALUES('SVE',77,'Torvald','Vastavsen','defender');
INSERT INTO players VALUES('SVE',24,'Magnus','Christiansen','defender');
INSERT INTO players VALUES('SVE',91,'Max','Mansen','defender');
INSERT INTO players VALUES('SVE',21,'Linus','Paulson','midfielder');
INSERT INTO players VALUES('SVE',27,'Adam','Mikaelson','midfielder');
INSERT INTO players VALUES('SVE',10,'Mikael','Hvarsen','midfielder');
INSERT INTO players VALUES('SVE',28,'Henrik','Ivarson','midfielder');
INSERT INTO players VALUES('SVE',7,'Gunnar','Trydyrsen','midfielder');
INSERT INTO players VALUES('SVE',11,'Gabriel','Frederson','midfielder');
INSERT INTO players VALUES('SVE',29,'Samuel','Varsen','midfielder');
INSERT INTO players VALUES('SVE',8,'Ralf','Svensen','midfielder');
INSERT INTO players VALUES('SVE',4,'Rune','Hjavarsen','midfielder');
INSERT INTO players VALUES('SVE',9,'Kai','Cirlesen','striker');
INSERT INTO players VALUES('SVE',17,'Jorgen','Knutsen','striker');
INSERT INTO players VALUES('SVE',19,'Johan','Klausenhom','striker');
INSERT INTO players VALUES('SVE',31,'Erling','Ericson','striker');
INSERT INTO players VALUES('SVE',93,'Hakan','Carlson','striker');
--ACH--
INSERT INTO players VALUES('ACH',1,'Mats','van der Hooek','goalkeeper');
INSERT INTO players VALUES('ACH',12,'Eric','Gooveken','goalkeeper');
INSERT INTO players VALUES('ACH',33,'Klaus','Jarlsen','goalkeeper');
INSERT INTO players VALUES('ACH',99,'Ruud','Boersoon','goalkeeper');
INSERT INTO players VALUES('ACH',2,'Jasper','van der Lueck','defender');
INSERT INTO players VALUES('ACH',3,'Lars','Klaaviken','defender');
INSERT INTO players VALUES('ACH',22,'Max','Groosveck','defender');
INSERT INTO players VALUES('ACH',31,'Liam','van der Ploock','defender');
INSERT INTO players VALUES('ACH',4,'Luuk','van Proeden','defender');
INSERT INTO players VALUES('ACH',21,'Sam','van Samroen','defender');
INSERT INTO players VALUES('ACH',91,'Thomas','Messoon','defender');
INSERT INTO players VALUES('ACH',6,'Ruben','van Geek','defender');
INSERT INTO players VALUES('ACH',28,'Ruud','Saarsoon','defender');
INSERT INTO players VALUES('ACH',13,'Lucas','Bramsoon','midfielder');
INSERT INTO players VALUES('ACH',14,'Thijs','van Bremson','midfielder');
INSERT INTO players VALUES('ACH',30,'Liam','Pookarsen','midfielder');
INSERT INTO players VALUES('ACH',18,'Luuk','van der Rook','midfielder');
INSERT INTO players VALUES('ACH',23,'Noah','Thomsoon','midfielder');
INSERT INTO players VALUES('ACH',89,'Luuk','Nestefoort','midfielder');
INSERT INTO players VALUES('ACH',7,'Arjen','van Freeker','midfielder');
INSERT INTO players VALUES('ACH',10,'Klaas','van Mackarsoon','midfielder');
INSERT INTO players VALUES('ACH',11,'Ruud','Ilkaasoon','striker');
INSERT INTO players VALUES('ACH',9,'Patrick','Asmertoor','striker');
INSERT INTO players VALUES('ACH',17,'Edwin','Nillsen','striker');
INSERT INTO players VALUES('ACH',19,'Ruud','van Haarpen','striker');
--HAD--
INSERT INTO players VALUES('HAD',1,'Kostas','Paltiapoulos','goalkeeper');
INSERT INTO players VALUES('HAD',12,'Andreas','Kerranis','goalkeeper');
INSERT INTO players VALUES('HAD',22,'Christos','Kefaios','goalkeeper');
INSERT INTO players VALUES('HAD',2,'Jorgos','Trimunos','defender');
INSERT INTO players VALUES('HAD',3,'Talus','Chrastinos','defender');
INSERT INTO players VALUES('HAD',5,'Nikos','Astarpos','defender');
INSERT INTO players VALUES('HAD',44,'Eutyches','Fraimos','defender');
INSERT INTO players VALUES('HAD',23,'Diodor','Hasklepios','defender');
INSERT INTO players VALUES('HAD',24,'Nilus','Hiliamos','defender');
INSERT INTO players VALUES('HAD',6,'Leander','Christos','defender');
INSERT INTO players VALUES('HAD',81,'Besarion','Trastanifaitos','defender');
INSERT INTO players VALUES('HAD',37,'Leonid','Patriakoulos','defender');
INSERT INTO players VALUES('HAD',10,'Menas','Grazianopoulos','midfielder');
INSERT INTO players VALUES('HAD',11,'Diodor','Estaporos','midfielder');
INSERT INTO players VALUES('HAD',13,'Janis','Hilarionos','midfielder');
INSERT INTO players VALUES('HAD',7,'Besarion','Charistrostenes','midfielder');
INSERT INTO players VALUES('HAD',15,'Fotyn','Nastaros','midfielder');
INSERT INTO players VALUES('HAD',17,'Epafras','Franastonios','midfielder');
INSERT INTO players VALUES('HAD',93,'Talus','Pascalos','midfielder');
INSERT INTO players VALUES('HAD',19,'Meliton','Otemoklos','midfielder');
INSERT INTO players VALUES('HAD',90,'Kostas','Tristonous','midfielder');
INSERT INTO players VALUES('HAD',9,'Polidor','Postrones','striker');
INSERT INTO players VALUES('HAD',18,'Konon','Gormonionos','striker');
INSERT INTO players VALUES('HAD',20,'Teonas','Laspalion','striker');
INSERT INTO players VALUES('HAD',97,'Nikos','Charistenes','striker');
--KRE--
INSERT INTO players VALUES('KRE',1,'Tomas','Vaclavek','goalkeeper');
INSERT INTO players VALUES('KRE',12,'Pavel','Vitek','goalkeeper');
INSERT INTO players VALUES('KRE',33,'Zdenek','Hasparko','goalkeeper');
INSERT INTO players VALUES('KRE',22,'Filip','Potrawka','goalkeeper');
INSERT INTO players VALUES('KRE',3,'Ondrej','Hlavek','defender');
INSERT INTO players VALUES('KRE',36,'Petr','Gustek','defender');
INSERT INTO players VALUES('KRE',35,'Jan','Lavicky','defender');
INSERT INTO players VALUES('KRE',5,'Vojtech','Rotek','defender');
INSERT INTO players VALUES('KRE',32,'Lukas','Lipowsky','defender');
INSERT INTO players VALUES('KRE',6,'Adam','Darwidocky','defender');
INSERT INTO players VALUES('KRE',21,'Matej','Smiceck','defender');
INSERT INTO players VALUES('KRE',90,'Petr','Koulubicky','defender');
INSERT INTO players VALUES('KRE',70,'Jan','Patracky','midfielder');
INSERT INTO players VALUES('KRE',61,'David','Waclavek','midfielder');
INSERT INTO players VALUES('KRE',10,'Jan','Trocek','midfielder');
INSERT INTO players VALUES('KRE',11,'Tomas','Draposek','midfielder');
INSERT INTO players VALUES('KRE',16,'Vaclav','Nespora','midfielder');
INSERT INTO players VALUES('KRE',13,'Jakub','Bladicky','midfielder');
INSERT INTO players VALUES('KRE',91,'Filip','Planicky','midfielder');
INSERT INTO players VALUES('KRE',14,'Ondrej','Marnicek','midfielder');
INSERT INTO players VALUES('KRE',7,'Zbynek','Timinecky','striker');
INSERT INTO players VALUES('KRE',9,'Mikulas','Kosternicky','striker');
INSERT INTO players VALUES('KRE',17,'Libor','Zdranek','striker');
INSERT INTO players VALUES('KRE',19,'Sobeslav','Imiecky','striker');
INSERT INTO players VALUES('KRE',26,'Vilem','Granek','striker');
--FKB--
INSERT INTO players VALUES('FKB',1,'Nikola','Matjović','goalkeeper');
INSERT INTO players VALUES('FKB',12,'Adam','Vicević','goalkeeper');
INSERT INTO players VALUES('FKB',31,'Luka','Klisenić','goalkeeper');
INSERT INTO players VALUES('FKB',2,'Peter','Pistović','defender');
INSERT INTO players VALUES('FKB',4,'Nemanja','Rukcević','defender');
INSERT INTO players VALUES('FKB',45,'Pavle','Hirković','defender');
INSERT INTO players VALUES('FKB',6,'Vuk','Tracić','defender');
INSERT INTO players VALUES('FKB',19,'Lazar','Ivanović','defender');
INSERT INTO players VALUES('FKB',21,'Milos','Freksović','defender');
INSERT INTO players VALUES('FKB',20,'Ivan','Vistović','defender');
INSERT INTO players VALUES('FKB',23,'Matija','Simunović','defender');
INSERT INTO players VALUES('FKB',25,'Nenad','Stefanović','defender');
INSERT INTO players VALUES('FKB',24,'Andrej','Muzonić','midfielder');
INSERT INTO players VALUES('FKB',11,'Bojan','Brazović','midfielder');
INSERT INTO players VALUES('FKB',10,'Dragan','Gregorić','midfielder');
INSERT INTO players VALUES('FKB',27,'Denis','Savatić','midfielder');
INSERT INTO players VALUES('FKB',7,'Milan','Urković','midfielder');
INSERT INTO players VALUES('FKB',77,'Damjan','Lukcević','midfielder');
INSERT INTO players VALUES('FKB',91,'Semen','Pristanović','midfielder');
INSERT INTO players VALUES('FKB',29,'Todor','Brasmatić','midfielder');
INSERT INTO players VALUES('FKB',22,'Radovan','Svetić','midfielder');
INSERT INTO players VALUES('FKB',9,'Stefan','Tridamić','striker');
INSERT INTO players VALUES('FKB',17,'Dusan','Vestimović','striker');
INSERT INTO players VALUES('FKB',37,'Mihajlo','Ulcević','striker');
INSERT INTO players VALUES('FKB',93,'Lazar','Jovanović','striker');

--stats--
--FCW--
--1. match--
INSERT INTO stats VALUES('FCW',1,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FCW',5,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{17}');
INSERT INTO stats VALUES('FCW',2,1,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',33,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('FCW',6,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',14,1,90,1,NULL,NULL,FALSE,'{25}',NULL,NULL);
INSERT INTO stats VALUES('FCW',13,1,90,NULL,1,NULL,FALSE,NULL,'{25}',NULL);
INSERT INTO stats VALUES('FCW',23,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FCW',7,1,85,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('FCW',10,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{59}');
INSERT INTO stats VALUES('FCW',9,1,80,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
--subs--
INSERT INTO stats VALUES('FCW',91,1,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,1,5,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--2. match--
INSERT INTO stats VALUES('FCW',1,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',22,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,16,90,1,NULL,NULL,FALSE,'{44}',NULL,NULL);
INSERT INTO stats VALUES('FCW',97,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,16,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FCW',20,16,45,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,16,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('FCW',1,18,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,18,90,NULL,1,'{"yellow"}',FALSE,NULL,'{16}','{78}');
INSERT INTO stats VALUES('FCW',6,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',22,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,18,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,18,82,1,NULL,NULL,FALSE,'{16}',NULL,NULL);
INSERT INTO stats VALUES('FCW',7,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,18,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,18,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',97,18,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,18,35,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('FCW',1,31,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FCW',31,31,90,2,NULL,'{"yellow"}',FALSE,'{12,67}',NULL,'{51}');
INSERT INTO stats VALUES('FCW',5,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,31,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FCW',13,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,31,90,2,1,NULL,FALSE,'{80,90}','{12}',NULL);
INSERT INTO stats VALUES('FCW',7,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,31,50,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('FCW',97,31,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('FCW',9,31,85,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
--subs--
INSERT INTO stats VALUES('FCW',20,31,5,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,31,23,NULL,1,NULL,FALSE,NULL,'{90}',NULL);
INSERT INTO stats VALUES('FCW',95,31,40,NULL,2,'{"yellow"}',FALSE,NULL,'{67,80}','{87}');
--5. match--
INSERT INTO stats VALUES('FCW',1,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,35,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('FCW',2,35,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('FCW',15,35,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,35,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('FCW',13,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,35,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,35,88,2,NULL,NULL,FALSE,'{23,58}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',20,35,2,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,35,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,35,45,NULL,1,NULL,FALSE,NULL,'{58}',NULL);
--6. match--
INSERT INTO stats VALUES('FCW',1,46,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FCW',5,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,46,90,NULL,1,'{"yellow"}',FALSE,NULL,'{89}','{69}');
INSERT INTO stats VALUES('FCW',2,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,46,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FCW',23,46,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('FCW',13,46,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FCW',14,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,46,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('FCW',9,46,88,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
--subs--
INSERT INTO stats VALUES('FCW',28,46,2,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
--7. match--
INSERT INTO stats VALUES('FCW',1,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,52,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FCW',3,52,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{83}');
INSERT INTO stats VALUES('FCW',23,52,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',10,52,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('FCW',15,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,52,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('FCW',14,52,88,1,NULL,'{"yellow"}',FALSE,'{83}',NULL,'{54}');
INSERT INTO stats VALUES('FCW',9,52,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,52,20,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('FCW',95,52,45,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('FCW',17,52,2,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--8. match--
INSERT INTO stats VALUES('FCW',1,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FCW',2,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FCW',5,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',6,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,61,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FCW',23,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('FCW',7,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,61,80,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
--subs--
INSERT INTO stats VALUES('FCW',28,61,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FCW',10,61,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--9. match--
INSERT INTO stats VALUES('FCW',12,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,69,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',3,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,69,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,69,90,1,1,'{"yellow"}',FALSE,'{23}','{90}','{56}');
INSERT INTO stats VALUES('FCW',17,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,69,84,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,69,80,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,69,10,1,NULL,NULL,FALSE,'{90}',NULL,NULL);
INSERT INTO stats VALUES('FCW',97,69,6,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,69,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--10. match--
INSERT INTO stats VALUES('FCW',1,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FCW',93,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FCW',5,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('FCW',10,76,90,NULL,1,'{"yellow"}',FALSE,NULL,'{2}','{11}');
INSERT INTO stats VALUES('FCW',13,76,90,1,NULL,'{"yellow"}',FALSE,'{2}',NULL,'{78}');
INSERT INTO stats VALUES('FCW',7,76,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FCW',95,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',20,76,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,76,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,76,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('FCW',1,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,86,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FCW',5,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',33,86,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FCW',3,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,86,90,1,1,'{"yellow"}',FALSE,'{18}','{89}','{90}');
INSERT INTO stats VALUES('FCW',14,86,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('FCW',7,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,86,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('FCW',17,86,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,86,70,NULL,1,NULL,FALSE,NULL,'{18}',NULL);
--subs--
INSERT INTO stats VALUES('FCW',91,86,20,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('FCW',10,86,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
--12. match--
INSERT INTO stats VALUES('FCW',1,91,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',31,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',33,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,91,47,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,91,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,91,90,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
INSERT INTO stats VALUES('FCW',20,91,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,91,45,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('FCW',23,91,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,91,43,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('FCW',1,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,103,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('FCW',2,103,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('FCW',33,103,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FCW',3,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,103,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FCW',7,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,103,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('FCW',17,103,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,103,90,1,NULL,'{"yellow"}',FALSE,'{80}',NULL,'{61}');
INSERT INTO stats VALUES('FCW',9,103,90,NULL,1,'{"yellow"}',FALSE,NULL,'{83}','{23}');
--subs--
INSERT INTO stats VALUES('FCW',91,103,25,1,1,NULL,FALSE,'{83}','{80}',NULL);
INSERT INTO stats VALUES('FCW',10,103,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,103,15,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--14. match--
INSERT INTO stats VALUES('FCW',12,106,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FCW',6,106,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('FCW',5,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,106,78,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',7,106,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('FCW',14,106,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('FCW',17,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',20,106,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,106,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FCW',10,106,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FCW',23,106,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('FCW',1,120,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FCW',5,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',33,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',28,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('FCW',12,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,121,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('FCW',6,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',33,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,121,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('FCW',14,121,90,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{41}');
INSERT INTO stats VALUES('FCW',13,121,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('FCW',10,121,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('FCW',17,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,121,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,121,30,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{90}');
--17. match--
INSERT INTO stats VALUES('FCW',90,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,136,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('FCW',33,136,90,1,NULL,'{"yellow"}',FALSE,'{13}',NULL,'{51}');
INSERT INTO stats VALUES('FCW',93,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,136,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,136,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('FCW',17,136,50,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('FCW',10,136,90,1,NULL,'{"yellow"}',FALSE,'{78}',NULL,'{51}');
INSERT INTO stats VALUES('FCW',7,136,90,1,NULL,'{"yellow"}',FALSE,'{64}',NULL,'{15}');
INSERT INTO stats VALUES('FCW',9,136,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,136,30,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
INSERT INTO stats VALUES('FCW',14,136,40,1,NULL,'{"yellow"}',FALSE,'{86}',NULL,'{89}');
INSERT INTO stats VALUES('FCW',95,136,45,NULL,2,'{"yellow"}',FALSE,NULL,'{64,78}','{90}');
--18. match--
INSERT INTO stats VALUES('FCW',1,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',22,138,90,NULL,1,NULL,FALSE,NULL,'{45}',NULL);
INSERT INTO stats VALUES('FCW',93,138,90,1,NULL,NULL,FALSE,'{45}',NULL,NULL);
INSERT INTO stats VALUES('FCW',5,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,138,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,138,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,138,83,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',20,138,7,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,138,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,138,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('FCW',1,151,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FCW',3,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',31,151,90,NULL,1,NULL,FALSE,NULL,'{90}',NULL);
INSERT INTO stats VALUES('FCW',6,151,90,1,2,NULL,FALSE,'{2}','{44,76}',NULL);
INSERT INTO stats VALUES('FCW',5,151,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('FCW',14,151,90,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('FCW',7,151,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FCW',23,151,90,2,NULL,NULL,FALSE,'{44,90}',NULL,NULL);
INSERT INTO stats VALUES('FCW',10,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,151,82,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--subs--
INSERT INTO stats VALUES('FCW',28,151,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('FCW',1,155,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('FCW',3,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',31,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',28,155,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,155,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('FCW',1,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',22,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,166,90,NULL,1,'{"yellow"}',FALSE,NULL,'{77}','{86}');
INSERT INTO stats VALUES('FCW',5,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,166,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FCW',13,166,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,166,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('FCW',9,166,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',28,166,20,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('FCW',23,166,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,166,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--22. match--
INSERT INTO stats VALUES('FCW',1,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,172,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{18}');
INSERT INTO stats VALUES('FCW',15,172,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('FCW',14,172,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,172,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('FCW',13,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,172,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
--subs--
INSERT INTO stats VALUES('FCW',20,172,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,172,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('FCW',1,181,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,181,90,1,1,NULL,FALSE,'{44}','{12}',NULL);
INSERT INTO stats VALUES('FCW',22,181,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',33,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,181,73,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('FCW',14,181,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('FCW',15,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',20,181,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,181,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,181,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('FCW',1,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FCW',2,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,189,90,1,NULL,'{"yellow"}',FALSE,'{53}',NULL,'{66}');
INSERT INTO stats VALUES('FCW',31,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',93,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('FCW',15,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('FCW',14,189,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',10,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',91,189,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('FCW',20,189,25,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
INSERT INTO stats VALUES('FCW',7,189,45,1,1,'{"yellow"}',FALSE,'{89}','{53}','{67}');
--25. match--
INSERT INTO stats VALUES('FCW',12,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,196,90,2,1,NULL,FALSE,'{12,56}','{78}',NULL);
INSERT INTO stats VALUES('FCW',5,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,196,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('FCW',23,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,196,90,NULL,1,NULL,FALSE,NULL,'{84}',NULL);
INSERT INTO stats VALUES('FCW',10,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,196,90,2,1,NULL,FALSE,'{78,84}','{12}',NULL);
INSERT INTO stats VALUES('FCW',20,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--26. match--
INSERT INTO stats VALUES('FCW',1,206,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',5,206,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,206,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,206,90,1,NULL,NULL,FALSE,'{14}',NULL,NULL);
INSERT INTO stats VALUES('FCW',22,206,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FCW',13,206,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,206,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,206,90,1,NULL,'{"yellow"}',FALSE,'{73}',NULL,'{65}');
INSERT INTO stats VALUES('FCW',7,206,90,NULL,1,NULL,FALSE,NULL,'{90}',NULL);
INSERT INTO stats VALUES('FCW',17,206,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{7}');
INSERT INTO stats VALUES('FCW',9,206,67,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
--subs--
INSERT INTO stats VALUES('FCW',91,206,23,NULL,1,NULL,FALSE,NULL,'{73}',NULL);
INSERT INTO stats VALUES('FCW',95,206,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,206,8,1,NULL,NULL,FALSE,'{90}',NULL,NULL);
--27. match--
INSERT INTO stats VALUES('FCW',1,211,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{18}');
INSERT INTO stats VALUES('FCW',3,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',6,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',93,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,211,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('FCW',23,211,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FCW',13,211,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',14,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',9,211,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{6}');
--subs--
INSERT INTO stats VALUES('FCW',20,211,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',95,211,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('FCW',1,223,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,223,70,1,1,'{"yellow","yellow","red"}',FALSE,'{11}','{34}','{23,70,70}');
INSERT INTO stats VALUES('FCW',33,223,90,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{65}');
INSERT INTO stats VALUES('FCW',31,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FCW',3,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('FCW',10,223,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('FCW',14,223,90,1,NULL,NULL,FALSE,'{34}',NULL,NULL);
INSERT INTO stats VALUES('FCW',13,223,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',17,223,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{16}');
INSERT INTO stats VALUES('FCW',95,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('FCW',91,223,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
--subs--
INSERT INTO stats VALUES('FCW',9,223,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--29. match--
INSERT INTO stats VALUES('FCW',1,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FCW',5,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('FCW',31,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',3,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FCW',6,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',15,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FCW',23,226,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',97,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('FCW',9,226,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',20,226,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FCW',7,226,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--30. match--
INSERT INTO stats VALUES('FCW',1,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',5,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',2,240,90,1,1,NULL,FALSE,'{67}','{12}',NULL);
INSERT INTO stats VALUES('FCW',6,240,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('FCW',3,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',7,240,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('FCW',14,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',10,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',13,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FCW',23,240,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('FCW',91,240,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FCW',9,240,45,NULL,1,NULL,FALSE,NULL,'{67}',NULL);

--PIE--
--1. match--
INSERT INTO stats VALUES('PIE',12,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,2,90,NULL,1,NULL,FALSE,NULL,'{76}',NULL);
INSERT INTO stats VALUES('PIE',3,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',93,2,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{29}');
INSERT INTO stats VALUES('PIE',7,2,90,NULL,1,'{"yellow"}',FALSE,NULL,'{14}','{17}');
INSERT INTO stats VALUES('PIE',10,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,2,90,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('PIE',23,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',13,2,90,1,NULL,NULL,FALSE,'{14}',NULL,NULL);
--2. match--
INSERT INTO stats VALUES('PIE',12,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,16,90,NULL,1,NULL,FALSE,NULL,'{87}',NULL);
INSERT INTO stats VALUES('PIE',4,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,16,90,1,NULL,NULL,FALSE,'{87}',NULL,NULL);
INSERT INTO stats VALUES('PIE',23,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,16,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,16,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',13,16,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',9,16,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,16,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('PIE',12,17,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',2,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,17,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('PIE',6,17,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{7}');
INSERT INTO stats VALUES('PIE',5,17,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('PIE',93,17,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,17,90,2,NULL,NULL,FALSE,'{59,90}',NULL,NULL);
INSERT INTO stats VALUES('PIE',7,17,85,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PIE',23,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,17,90,NULL,NULL,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('PIE',9,17,55,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
--subs--
INSERT INTO stats VALUES('PIE',13,17,35,1,2,'{"yellow"}',FALSE,'{67}','{59,90}','{69}');
INSERT INTO stats VALUES('PIE',15,17,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,17,5,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--4. match--
INSERT INTO stats VALUES('PIE',12,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('PIE',3,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PIE',22,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('PIE',10,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PIE',11,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('PIE',13,32,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
--5. match--
INSERT INTO stats VALUES('PIE',12,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PIE',4,34,90,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{11}');
INSERT INTO stats VALUES('PIE',5,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,34,75,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('PIE',93,34,55,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('PIE',8,34,89,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',19,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,34,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,34,45,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('PIE',10,34,35,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,34,15,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--6. match--
INSERT INTO stats VALUES('PIE',12,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('PIE',4,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',29,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{16}');
INSERT INTO stats VALUES('PIE',11,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('PIE',15,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('PIE',7,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{38}');
INSERT INTO stats VALUES('PIE',19,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',93,47,83,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,47,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,47,35,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{56,80,80}');
INSERT INTO stats VALUES('PIE',23,47,7,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('PIE',12,51,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,51,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('PIE',2,51,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,51,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('PIE',5,51,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PIE',7,51,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('PIE',8,51,68,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('PIE',10,51,90,2,NULL,NULL,FALSE,'{38,67}',NULL,NULL);
INSERT INTO stats VALUES('PIE',11,51,45,NULL,1,'{"yellow"}',FALSE,NULL,'{38}','{10}');
INSERT INTO stats VALUES('PIE',19,51,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',24,51,60,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
--subs--
INSERT INTO stats VALUES('PIE',9,51,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,51,45,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('PIE',15,51,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--8. match--
INSERT INTO stats VALUES('PIE',99,62,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',2,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',44,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,62,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('PIE',3,62,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PIE',15,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,62,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{75}');
INSERT INTO stats VALUES('PIE',23,62,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('PIE',7,62,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('PIE',19,62,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('PIE',9,62,80,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,62,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,62,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('PIE',12,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('PIE',3,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('PIE',44,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('PIE',4,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{7}');
INSERT INTO stats VALUES('PIE',7,68,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',15,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('PIE',41,68,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',9,68,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('PIE',19,68,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{63}');
--10. match--
INSERT INTO stats VALUES('PIE',99,77,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',22,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',44,77,90,NULL,1,NULL,FALSE,NULL,'{43}',NULL);
INSERT INTO stats VALUES('PIE',29,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',93,77,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,77,90,1,NULL,NULL,FALSE,'{43}',NULL,NULL);
INSERT INTO stats VALUES('PIE',7,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,77,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('PIE',15,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,77,56,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,77,34,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PIE',19,77,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('PIE',12,85,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',22,85,90,1,NULL,NULL,FALSE,'{5}',NULL,NULL);
INSERT INTO stats VALUES('PIE',11,85,90,NULL,1,NULL,FALSE,NULL,'{5}',NULL);
INSERT INTO stats VALUES('PIE',93,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',13,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('PIE',12,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,92,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('PIE',93,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',13,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('PIE',12,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',3,102,90,NULL,2,NULL,FALSE,NULL,'{4,77}',NULL);
INSERT INTO stats VALUES('PIE',2,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',22,102,90,NULL,1,'{"yellow"}',FALSE,NULL,'{80}','{31}');
INSERT INTO stats VALUES('PIE',5,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PIE',93,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('PIE',19,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,102,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,102,90,3,NULL,'{"yellow"}',FALSE,'{4,41,80}',NULL,'{87}');
INSERT INTO stats VALUES('PIE',13,102,60,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
--subs--
INSERT INTO stats VALUES('PIE',9,102,30,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('PIE',10,102,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--14. match--
INSERT INTO stats VALUES('PIE',12,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',4,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{38}');
INSERT INTO stats VALUES('PIE',5,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PIE',7,107,60,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('PIE',11,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('PIE',19,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PIE',23,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('PIE',93,107,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,107,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,107,25,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('PIE',10,107,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('PIE',99,119,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,119,90,1,NULL,'{"yellow"}',FALSE,'{13}',NULL,'{67}');
INSERT INTO stats VALUES('PIE',4,119,90,1,NULL,NULL,FALSE,'{17}',NULL,NULL);
INSERT INTO stats VALUES('PIE',3,119,90,1,NULL,NULL,FALSE,'{35}',NULL,NULL);
INSERT INTO stats VALUES('PIE',22,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',15,119,90,2,2,'{"yellow"}',FALSE,'{65,83}','{13,44}','{90}');
INSERT INTO stats VALUES('PIE',19,119,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{77}');
INSERT INTO stats VALUES('PIE',8,119,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',93,119,79,NULL,1,'{"yellow","yellow","red"}',FALSE,NULL,'{65}','{11,79,79}');
INSERT INTO stats VALUES('PIE',11,119,90,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('PIE',9,119,90,NULL,2,NULL,FALSE,NULL,'{17,35}',NULL);
--16. match--
INSERT INTO stats VALUES('PIE',12,122,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',29,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('PIE',5,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('PIE',7,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,122,90,NULL,1,'{"yellow"}',FALSE,NULL,'{89}','{69}');
INSERT INTO stats VALUES('PIE',11,122,90,1,NULL,'{"yellow"}',FALSE,'{12}',NULL,'{80}');
INSERT INTO stats VALUES('PIE',10,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{10}');
INSERT INTO stats VALUES('PIE',8,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,122,85,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
--subs--
INSERT INTO stats VALUES('PIE',24,122,5,1,NULL,'{"yellow"}',FALSE,'{89}',NULL,'{90}');
--17. match--
INSERT INTO stats VALUES('PIE',12,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,136,90,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
INSERT INTO stats VALUES('PIE',6,136,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('PIE',4,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,136,90,1,NULL,'{"yellow"}',FALSE,'{60}',NULL,'{87}');
INSERT INTO stats VALUES('PIE',8,136,90,NULL,1,'{"yellow"}',FALSE,NULL,'{83}','{90}');
INSERT INTO stats VALUES('PIE',10,136,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('PIE',7,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,136,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,136,90,1,1,NULL,FALSE,'{47}','{11}',NULL);
INSERT INTO stats VALUES('PIE',9,136,80,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',24,136,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('PIE',12,137,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('PIE',6,137,90,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('PIE',29,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',22,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,137,78,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('PIE',8,137,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('PIE',15,137,80,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PIE',19,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,137,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,137,945,1,NULL,'{"yellow"}',FALSE,'{65}',NULL,'{49}');
INSERT INTO stats VALUES('PIE',11,137,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,137,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--19. match--
INSERT INTO stats VALUES('PIE',99,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',44,152,90,NULL,1,'{"yellow"}',FALSE,NULL,'{53}','{90}');
INSERT INTO stats VALUES('PIE',2,152,90,1,NULL,NULL,FALSE,'{14}',NULL,NULL);
INSERT INTO stats VALUES('PIE',15,152,75,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('PIE',7,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,152,90,1,NULL,NULL,FALSE,'{53}',NULL,NULL);
INSERT INTO stats VALUES('PIE',10,152,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,152,80,1,1,NULL,FALSE,'{72}','{14}',NULL);
--subs--
INSERT INTO stats VALUES('PIE',24,152,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,152,35,NULL,1,'{"yellow"}',FALSE,NULL,'{72}','{88}');
INSERT INTO stats VALUES('PIE',23,152,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('PIE',12,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,154,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('PIE',3,154,90,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('PIE',2,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,154,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('PIE',7,154,90,NULL,1,'{"yellow"}',FALSE,NULL,'{13}','{90}');
INSERT INTO stats VALUES('PIE',23,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,154,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('PIE',11,154,90,NULL,2,NULL,FALSE,NULL,'{77,89}',NULL);
INSERT INTO stats VALUES('PIE',93,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,154,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',24,154,30,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
--21. match--
INSERT INTO stats VALUES('PIE',12,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,167,90,NULL,1,'{"yellow"}',FALSE,NULL,'{2}','{87}');
INSERT INTO stats VALUES('PIE',6,167,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('PIE',44,167,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('PIE',29,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,167,90,NULL,1,'{"yellow"}',FALSE,NULL,'{11}','{89}');
INSERT INTO stats VALUES('PIE',93,167,90,1,NULL,NULL,FALSE,'{2}',NULL,NULL);
INSERT INTO stats VALUES('PIE',11,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,167,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,167,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,167,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,167,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('PIE',12,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',44,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',41,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('PIE',12,182,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,182,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',5,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,182,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('PIE',7,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,182,65,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{41}');
INSERT INTO stats VALUES('PIE',93,182,90,NULL,1,NULL,FALSE,NULL,'{74}',NULL);
INSERT INTO stats VALUES('PIE',11,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',24,182,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',9,182,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,182,25,1,NULL,NULL,FALSE,'{74}',NULL,NULL);
--24. match--
INSERT INTO stats VALUES('PIE',12,188,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('PIE',4,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',3,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,188,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('PIE',22,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,188,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('PIE',8,188,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',41,188,80,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{13}');
--subs--
INSERT INTO stats VALUES('PIE',24,188,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,188,40,NULL,1,'{"yellow","yellow","red"}',FALSE,NULL,'{56}','{80,85,85}');
--25. match--
INSERT INTO stats VALUES('PIE',12,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',22,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,197,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('PIE',5,197,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('PIE',8,197,90,1,NULL,'{"yellow"}',FALSE,'{45}',NULL,'{71}');
INSERT INTO stats VALUES('PIE',10,197,90,NULL,1,NULL,FALSE,NULL,'{45}',NULL);
INSERT INTO stats VALUES('PIE',93,197,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('PIE',23,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,197,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
--subs--
INSERT INTO stats VALUES('PIE',13,197,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--26. match--
INSERT INTO stats VALUES('PIE',12,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,205,90,1,NULL,NULL,FALSE,'{47}',NULL,NULL);
INSERT INTO stats VALUES('PIE',3,205,90,NULL,2,NULL,FALSE,NULL,'{11,47}',NULL);
INSERT INTO stats VALUES('PIE',4,205,90,NULL,1,'{"yellow"}',FALSE,NULL,'{90}','{15}');
INSERT INTO stats VALUES('PIE',5,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',15,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,205,90,2,NULL,NULL,FALSE,'{11,90}',NULL,NULL);
INSERT INTO stats VALUES('PIE',11,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,205,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('PIE',9,205,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PIE',13,205,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('PIE',12,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,212,90,NULL,1,'{"yellow"}',FALSE,NULL,'{24}','{89}');
INSERT INTO stats VALUES('PIE',2,212,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PIE',4,212,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('PIE',10,212,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PIE',23,212,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('PIE',8,212,90,2,NULL,NULL,FALSE,'{24,86}',NULL,NULL);
INSERT INTO stats VALUES('PIE',15,212,86,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,212,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,212,75,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
--subs--
INSERT INTO stats VALUES('PIE',41,212,15,NULL,1,'{"yellow"}',FALSE,NULL,'{86}','{77}');
INSERT INTO stats VALUES('PIE',93,212,4,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',11,212,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('PIE',12,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',6,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',4,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',19,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',23,222,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('PIE',15,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',8,222,90,1,1,NULL,FALSE,'{11}','{56}',NULL);
INSERT INTO stats VALUES('PIE',9,222,90,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--29. match--
INSERT INTO stats VALUES('PIE',12,227,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',5,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('PIE',2,227,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('PIE',29,227,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('PIE',6,227,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('PIE',10,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',93,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',7,227,90,2,NULL,NULL,FALSE,'{11,16}',NULL,NULL);
INSERT INTO stats VALUES('PIE',8,227,90,NULL,1,NULL,FALSE,NULL,'{16}',NULL);
INSERT INTO stats VALUES('PIE',19,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',9,227,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
--subs--
INSERT INTO stats VALUES('PIE',13,227,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
--30. match--
INSERT INTO stats VALUES('PIE',12,239,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PIE',5,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('PIE',22,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',2,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('PIE',4,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',10,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('PIE',11,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('PIE',7,239,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('PIE',23,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,'{41}','{70}');
INSERT INTO stats VALUES('PIE',15,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PIE',13,239,82,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
--subs--
INSERT INTO stats VALUES('PIE',41,239,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--RIV--
--1. match--
INSERT INTO stats VALUES('RIV',67,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,3,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RIV',14,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,3,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,3,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('RIV',1,15,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,15,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('RIV',5,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('RIV',3,15,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('RIV',6,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('RIV',35,15,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,15,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,15,63,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{63}');
INSERT INTO stats VALUES('RIV',10,15,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{31}');
INSERT INTO stats VALUES('RIV',7,15,80,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('RIV',27,15,78,NULL,1,'{"yellow","yellow","red"}',FALSE,NULL,'{11}','{44,78,78}');
--subs--
INSERT INTO stats VALUES('RIV',9,15,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('RIV',12,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',82,18,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('RIV',14,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',73,18,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,18,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,18,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',93,18,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,18,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,18,35,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,18,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('RIV',1,32,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,32,90,NULL,1,NULL,FALSE,NULL,'{6}',NULL);
INSERT INTO stats VALUES('RIV',4,32,90,1,NULL,'{"yellow"}',FALSE,'{78}',NULL,'{66}');
INSERT INTO stats VALUES('RIV',5,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,32,90,1,NULL,NULL,FALSE,'{6}',NULL,NULL);
INSERT INTO stats VALUES('RIV',10,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,32,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,32,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',93,32,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',27,32,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,32,20,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
--5. match--
INSERT INTO stats VALUES('RIV',1,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RIV',29,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,33,90,1,NULL,'{"yellow"}',FALSE,'{81}',NULL,'{89}');
INSERT INTO stats VALUES('RIV',10,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('RIV',7,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{17}');
INSERT INTO stats VALUES('RIV',14,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('RIV',16,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('RIV',20,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,33,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,33,23,NULL,1,NULL,FALSE,NULL,'{81}',NULL);
--6. match--
INSERT INTO stats VALUES('RIV',12,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',33,48,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('RIV',5,48,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('RIV',7,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,48,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RIV',13,48,90,1,NULL,NULL,FALSE,'{62}',NULL,NULL);
INSERT INTO stats VALUES('RIV',14,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',18,48,90,NULL,1,'{"yellow"}',FALSE,NULL,'{62}','{90}');
--7. match--
INSERT INTO stats VALUES('RIV',1,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,50,90,1,NULL,NULL,FALSE,'{47}',NULL,NULL);
INSERT INTO stats VALUES('RIV',13,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,50,79,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
INSERT INTO stats VALUES('RIV',35,50,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',27,50,66,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,50,24,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,50,45,NULL,2,NULL,FALSE,NULL,'{47,51}',NULL);
INSERT INTO stats VALUES('RIV',16,50,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
--8. match--
INSERT INTO stats VALUES('RIV',1,63,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('RIV',30,63,60,1,NULL,'{"yellow","yellow","red"}',FALSE,'{11}',NULL,'{43,60,60}');
INSERT INTO stats VALUES('RIV',29,63,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('RIV',5,63,90,1,NULL,'{"yellow"}',FALSE,'{41}',NULL,'{55}');
INSERT INTO stats VALUES('RIV',22,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,63,86,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,63,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('RIV',16,63,63,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('RIV',35,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,63,83,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',27,63,7,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RIV',20,63,27,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('RIV',14,63,4,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('RIV',1,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('RIV',22,67,82,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{46,82}');
INSERT INTO stats VALUES('RIV',14,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('RIV',7,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,67,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('RIV',35,67,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('RIV',93,67,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('RIV',9,67,45,NULL,1,'{"yellow"}',FALSE,NULL,'{73}','{90}');
INSERT INTO stats VALUES('RIV',20,67,30,1,NULL,NULL,FALSE,'{73}',NULL,NULL);
INSERT INTO stats VALUES('RIV',16,67,9,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--10. match--
INSERT INTO stats VALUES('RIV',1,78,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RIV',4,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,78,90,2,NULL,'{"yellow"}',FALSE,'{3,85}',NULL,'{76}');
INSERT INTO stats VALUES('RIV',3,78,90,NULL,4,'{"yellow"}',FALSE,NULL,'{3,13,22,66}','{54}');
INSERT INTO stats VALUES('RIV',5,78,90,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{39}');
INSERT INTO stats VALUES('RIV',13,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,78,90,2,NULL,NULL,FALSE,'{13,61}',NULL,NULL);
INSERT INTO stats VALUES('RIV',35,78,90,NULL,1,'{"yellow"}',FALSE,NULL,'{61}','{53}');
INSERT INTO stats VALUES('RIV',10,78,74,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('RIV',14,78,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('RIV',9,78,80,1,NULL,'{"yellow"}',FALSE,'{22}',NULL,'{33}');
--subs--
INSERT INTO stats VALUES('RIV',27,78,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,78,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,78,45,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
--11. match--
INSERT INTO stats VALUES('RIV',12,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',30,84,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
INSERT INTO stats VALUES('RIV',4,84,90,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{73}');
INSERT INTO stats VALUES('RIV',22,84,90,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('RIV',6,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,84,90,NULL,1,'{"yellow"}',FALSE,NULL,'{70}','{90}');
INSERT INTO stats VALUES('RIV',14,84,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{10}');
INSERT INTO stats VALUES('RIV',20,84,90,1,NULL,NULL,FALSE,'{14}',NULL,NULL);
INSERT INTO stats VALUES('RIV',13,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,84,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('RIV',18,84,90,1,NULL,'{"yellow"}',FALSE,'{70}',NULL,'{83}');
--12. match--
INSERT INTO stats VALUES('RIV',1,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,93,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{27}');
INSERT INTO stats VALUES('RIV',6,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,93,90,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{41}');
INSERT INTO stats VALUES('RIV',10,93,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('RIV',7,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,93,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('RIV',27,93,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,93,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('RIV',35,93,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('RIV',1,101,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',33,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,101,90,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('RIV',14,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,101,90,NULL,1,NULL,FALSE,NULL,'{85}',NULL);
--14. match--
INSERT INTO stats VALUES('RIV',12,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',29,108,90,NULL,1,NULL,FALSE,NULL,'{17}',NULL);
INSERT INTO stats VALUES('RIV',6,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',82,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,108,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('RIV',73,108,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',93,108,76,1,NULL,NULL,FALSE,'{17}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,108,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,108,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('RIV',1,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,118,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('RIV',5,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,118,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('RIV',20,118,80,NULL,1,'{"yellow"}',FALSE,NULL,'{56}','{13}');
INSERT INTO stats VALUES('RIV',14,118,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('RIV',10,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,118,70,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,118,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RIV',35,118,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
--16. match--
INSERT INTO stats VALUES('RIV',1,123,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,123,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('RIV',30,123,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('RIV',4,123,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('RIV',5,123,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('RIV',7,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,123,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,123,69,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{34,69,69}');
INSERT INTO stats VALUES('RIV',9,123,71,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
--subs--
INSERT INTO stats VALUES('RIV',27,123,19,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RIV',73,123,35,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('RIV',12,135,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,135,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('RIV',6,135,90,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('RIV',5,135,90,NULL,1,'{"yellow"}',FALSE,NULL,'{79}','{88}');
INSERT INTO stats VALUES('RIV',30,135,90,NULL,2,'{"yellow"}',FALSE,NULL,'{60,68}','{81}');
INSERT INTO stats VALUES('RIV',16,135,90,1,1,NULL,FALSE,'{32}','{4}',NULL);
INSERT INTO stats VALUES('RIV',13,135,90,1,NULL,'{"yellow"}',FALSE,'{68}',NULL,'{51}');
INSERT INTO stats VALUES('RIV',10,135,90,1,1,NULL,FALSE,'{79}','{32}',NULL);
INSERT INTO stats VALUES('RIV',7,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,135,90,2,NULL,'{"yellow"}',FALSE,'{4,60}',NULL,'{55}');
--18. match--
INSERT INTO stats VALUES('RIV',1,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,138,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('RIV',6,138,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('RIV',5,138,79,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{74,79}');
INSERT INTO stats VALUES('RIV',4,138,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RIV',7,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,138,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,138,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('RIV',14,138,73,1,NULL,'{"yellow"}',FALSE,'{59}',NULL,'{45}');
INSERT INTO stats VALUES('RIV',13,138,80,NULL,1,NULL,FALSE,NULL,'{59}',NULL);
INSERT INTO stats VALUES('RIV',93,138,60,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,138,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,138,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',73,138,17,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
--19. match--
INSERT INTO stats VALUES('RIV',1,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,152,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('RIV',4,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,152,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('RIV',3,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,152,90,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('RIV',7,152,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RIV',14,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,152,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('RIV',35,152,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',18,152,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,152,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('RIV',12,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',30,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,153,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('RIV',5,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,153,90,2,NULL,NULL,FALSE,'{11,50}',NULL,NULL);
INSERT INTO stats VALUES('RIV',16,153,90,1,2,NULL,FALSE,'{35}','{11,50}',NULL);
INSERT INTO stats VALUES('RIV',13,153,72,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',93,153,61,NULL,1,NULL,FALSE,NULL,'{35}',NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,153,29,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,153,18,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('RIV',1,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',33,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',30,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,168,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('RIV',14,168,64,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{19,64}');
INSERT INTO stats VALUES('RIV',7,168,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,168,90,NULL,1,NULL,FALSE,NULL,'{59}',NULL);
INSERT INTO stats VALUES('RIV',27,168,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('RIV',18,168,45,1,NULL,NULL,FALSE,'{59}',NULL,NULL);
INSERT INTO stats VALUES('RIV',20,168,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('RIV',12,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',29,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('RIV',3,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('RIV',7,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('RIV',16,170,40,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{11,40,40}');
INSERT INTO stats VALUES('RIV',10,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,170,82,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('RIV',27,170,56,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
--subs--
INSERT INTO stats VALUES('RIV',9,170,34,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,170,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('RIV',1,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',33,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,183,90,1,1,NULL,FALSE,'{22}','{56}',NULL);
INSERT INTO stats VALUES('RIV',73,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,183,90,1,1,NULL,FALSE,'{56}','{22}',NULL);
--24. match--
INSERT INTO stats VALUES('RIV',90,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('RIV',22,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',82,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{17}');
INSERT INTO stats VALUES('RIV',13,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,187,79,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('RIV',20,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RIV',9,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('RIV',1,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,198,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RIV',6,198,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{28}');
INSERT INTO stats VALUES('RIV',5,198,90,NULL,1,'{"yellow"}',FALSE,NULL,'{31}','{53}');
INSERT INTO stats VALUES('RIV',3,198,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('RIV',35,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,198,90,1,NULL,'{"yellow"}',FALSE,'{31}',NULL,'{61}');
INSERT INTO stats VALUES('RIV',73,198,90,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{29}');
INSERT INTO stats VALUES('RIV',13,198,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('RIV',27,198,83,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('RIV',93,198,7,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
--26. match--
INSERT INTO stats VALUES('RIV',12,204,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('RIV',30,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,204,90,1,NULL,NULL,FALSE,'{53}',NULL,NULL);
INSERT INTO stats VALUES('RIV',5,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,204,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('RIV',7,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,204,80,1,NULL,'{"yellow"}',FALSE,'{11}',NULL,'{45}');
INSERT INTO stats VALUES('RIV',14,204,90,NULL,1,NULL,FALSE,NULL,'{53}',NULL);
INSERT INTO stats VALUES('RIV',35,204,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RIV',18,204,62,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',93,204,28,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('RIV',73,204,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('RIV',1,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,213,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('RIV',5,213,90,1,1,NULL,FALSE,'{40}','{59}',NULL);
INSERT INTO stats VALUES('RIV',4,213,90,NULL,2,'{"yellow"}',FALSE,NULL,'{6,40}','{51}');
INSERT INTO stats VALUES('RIV',6,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,213,90,1,1,NULL,FALSE,'{59}','{79}',NULL);
INSERT INTO stats VALUES('RIV',7,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,213,90,1,NULL,NULL,FALSE,'{79}',NULL,NULL);
INSERT INTO stats VALUES('RIV',73,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',9,213,70,1,NULL,NULL,FALSE,'{6}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',18,213,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('RIV',1,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RIV',22,221,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RIV',5,221,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',30,221,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',16,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('RIV',7,221,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',73,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('RIV',10,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('RIV',14,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('RIV',9,221,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
--subs--
INSERT INTO stats VALUES('RIV',18,221,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('RIV',1,228,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',22,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,228,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,228,79,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('RIV',9,228,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{16}');
--subs--
INSERT INTO stats VALUES('RIV',27,228,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',73,228,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,228,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('RIV',1,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',5,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',4,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',6,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',3,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',14,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',7,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',35,238,50,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',20,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',13,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',18,238,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RIV',9,238,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RIV',10,238,40,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');

--RAI--
--1. match--
INSERT INTO stats VALUES('RAI',1,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,4,90,2,NULL,NULL,FALSE,'{14,74}',NULL,NULL);
INSERT INTO stats VALUES('RAI',4,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,4,90,NULL,1,NULL,FALSE,NULL,'{66}',NULL);
INSERT INTO stats VALUES('RAI',3,4,90,1,1,'{"yellow"}',FALSE,'{66}','{14}','{31}');
INSERT INTO stats VALUES('RAI',14,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,4,90,1,1,NULL,FALSE,'{43}','{74}',NULL);
INSERT INTO stats VALUES('RAI',21,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,4,90,NULL,1,NULL,FALSE,NULL,'{43}',NULL);
INSERT INTO stats VALUES('RAI',9,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('RAI',1,14,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',5,14,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('RAI',22,14,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('RAI',4,14,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('RAI',3,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',21,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,14,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',31,14,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('RAI',1,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',5,19,90,NULL,1,NULL,FALSE,NULL,'{76}',NULL);
INSERT INTO stats VALUES('RAI',22,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',51,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('RAI',20,19,90,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{25}');
INSERT INTO stats VALUES('RAI',15,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,19,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('RAI',10,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',16,19,85,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',99,19,5,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RAI',21,19,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('RAI',1,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',51,31,90,NULL,1,NULL,FALSE,NULL,'{57}',NULL);
INSERT INTO stats VALUES('RAI',4,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,31,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('RAI',6,31,90,NULL,1,'{"yellow"}',FALSE,NULL,'{41}','{26}');
INSERT INTO stats VALUES('RAI',15,31,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('RAI',11,31,86,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{11,86,86}');
INSERT INTO stats VALUES('RAI',17,31,90,1,NULL,NULL,FALSE,'{57}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,31,90,1,NULL,'{"yellow"}',FALSE,'{41}',NULL,'{31}');
INSERT INTO stats VALUES('RAI',20,31,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RAI',9,31,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('RAI',1,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RAI',66,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('RAI',4,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RAI',22,34,90,NULL,1,'{"yellow"}',FALSE,NULL,'{65}','{65}');
INSERT INTO stats VALUES('RAI',3,34,90,2,NULL,'{"yellow"}',FALSE,'{14,65}',NULL,'{80}');
INSERT INTO stats VALUES('RAI',15,34,90,NULL,1,'{"yellow"}',FALSE,NULL,'{14}','{76}');
INSERT INTO stats VALUES('RAI',10,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('RAI',27,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,34,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('RAI',16,34,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('RAI',12,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,48,90,1,NULL,NULL,FALSE,'{48}',NULL,NULL);
INSERT INTO stats VALUES('RAI',4,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',27,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,48,90,NULL,1,NULL,FALSE,NULL,'{48}',NULL);
INSERT INTO stats VALUES('RAI',10,48,72,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',21,48,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,48,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,48,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,48,18,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('RAI',1,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RAI',5,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('RAI',6,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('RAI',51,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('RAI',20,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',15,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('RAI',99,49,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,49,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--8. match--
INSERT INTO stats VALUES('RAI',1,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',18,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,64,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,64,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('RAI',10,64,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,64,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',31,64,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,64,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,64,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('RAI',1,66,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RAI',4,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('RAI',5,66,90,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
INSERT INTO stats VALUES('RAI',3,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RAI',15,66,90,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{56}');
INSERT INTO stats VALUES('RAI',21,66,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RAI',10,66,90,NULL,2,'{"yellow"}',FALSE,NULL,'{31,77}','{51}');
INSERT INTO stats VALUES('RAI',14,66,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',31,66,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('RAI',9,66,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--10. match--
INSERT INTO stats VALUES('RAI',1,79,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('RAI',21,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('RAI',88,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,83,90,NULL,1,'{"yellow"}',FALSE,NULL,'{25}','{76}');
INSERT INTO stats VALUES('RAI',3,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,83,90,1,NULL,NULL,FALSE,'{25}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',31,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('RAI',1,94,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,94,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('RAI',4,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,94,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',15,94,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RAI',17,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',16,94,83,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
--subs--
INSERT INTO stats VALUES('RAI',99,94,7,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RAI',10,94,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--13. match--
INSERT INTO stats VALUES('RAI',19,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,100,60,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{31,60,60}');
INSERT INTO stats VALUES('RAI',4,100,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('RAI',5,100,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('RAI',20,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,100,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,100,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('RAI',17,100,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('RAI',14,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,100,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('RAI',16,100,45,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{65}');
INSERT INTO stats VALUES('RAI',10,100,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,100,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
--14. match--
INSERT INTO stats VALUES('RAI',1,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',66,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,109,90,NULL,1,NULL,FALSE,NULL,'{4}',NULL);
INSERT INTO stats VALUES('RAI',4,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,109,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('RAI',11,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,109,90,NULL,1,'{"yellow"}',FALSE,NULL,'{20}','{74}');
INSERT INTO stats VALUES('RAI',10,109,90,1,NULL,'{"yellow"}',FALSE,'{20}',NULL,'{88}');
INSERT INTO stats VALUES('RAI',14,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',21,109,90,1,NULL,NULL,FALSE,'{4}',NULL,NULL);
INSERT INTO stats VALUES('RAI',31,109,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
--subs--
INSERT INTO stats VALUES('RAI',16,109,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
--15. match--
INSERT INTO stats VALUES('RAI',1,117,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,117,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RAI',18,117,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('RAI',15,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,117,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('RAI',11,117,79,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,117,67,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('RAI',21,117,90,NULL,2,'{"yellow"}',FALSE,NULL,'{32,65}','{70}');
INSERT INTO stats VALUES('RAI',9,117,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,117,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,117,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,117,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('RAI',1,124,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RAI',18,124,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('RAI',22,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,124,90,1,NULL,'{"yellow"}',FALSE,'{22}',NULL,'{54}');
INSERT INTO stats VALUES('RAI',3,124,90,NULL,1,'{"yellow"}',FALSE,NULL,'{22}','{80}');
INSERT INTO stats VALUES('RAI',10,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,124,90,1,NULL,'{"yellow"}',FALSE,'{15}',NULL,'{63}');
INSERT INTO stats VALUES('RAI',17,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,124,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('RAI',9,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('RAI',19,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,134,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('RAI',6,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',51,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,134,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('RAI',17,134,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('RAI',10,134,56,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('RAI',11,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,134,80,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--subs--
INSERT INTO stats VALUES('RAI',31,134,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RAI',20,134,34,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('RAI',1,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,139,90,NULL,1,NULL,FALSE,NULL,'{51}',NULL);
INSERT INTO stats VALUES('RAI',6,139,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('RAI',5,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,139,90,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
INSERT INTO stats VALUES('RAI',14,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,139,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('RAI',9,139,90,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
--19. match--
INSERT INTO stats VALUES('RAI',1,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,151,90,NULL,1,NULL,FALSE,NULL,'{51}',NULL);
INSERT INTO stats VALUES('RAI',5,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,151,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('RAI',51,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,151,90,1,1,NULL,FALSE,'{51}','{6}',NULL);
INSERT INTO stats VALUES('RAI',21,151,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,151,90,1,NULL,NULL,FALSE,'{6}',NULL,NULL);
INSERT INTO stats VALUES('RAI',14,151,90,NULL,1,'{"yellow"}',FALSE,NULL,'{88}','{11}');
INSERT INTO stats VALUES('RAI',9,151,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
--20. match--
INSERT INTO stats VALUES('RAI',1,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,154,90,NULL,1,NULL,FALSE,NULL,'{7}',NULL);
INSERT INTO stats VALUES('RAI',22,154,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('RAI',5,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,154,90,1,NULL,NULL,FALSE,'{7}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,154,69,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,154,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('RAI',17,154,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,154,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',31,154,60,NULL,2,NULL,FALSE,NULL,'{11,48}',NULL);
--subs--
INSERT INTO stats VALUES('RAI',9,154,30,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('RAI',27,154,45,1,1,NULL,FALSE,'{48}','{76}',NULL);
INSERT INTO stats VALUES('RAI',14,154,21,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('RAI',1,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,168,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('RAI',11,168,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',21,168,78,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{41,78,78}');
INSERT INTO stats VALUES('RAI',20,168,90,1,NULL,NULL,FALSE,'{44}',NULL,NULL);
INSERT INTO stats VALUES('RAI',14,168,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,168,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('RAI',16,168,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',9,168,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',27,168,45,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--22. match--
INSERT INTO stats VALUES('RAI',1,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',66,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,169,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,169,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,169,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',31,169,63,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,169,27,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,169,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',27,169,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('RAI',1,184,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RAI',5,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('RAI',4,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('RAI',11,184,90,1,NULL,'{"yellow"}',FALSE,'{26}',NULL,'{78}');
INSERT INTO stats VALUES('RAI',15,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('RAI',21,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('RAI',20,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('RAI',9,184,45,NULL,1,NULL,FALSE,NULL,'{26}',NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,184,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
--24. match--
INSERT INTO stats VALUES('RAI',1,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('RAI',4,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('RAI',6,186,90,1,NULL,'{"yellow"}',FALSE,'{14}',NULL,'{33}');
INSERT INTO stats VALUES('RAI',5,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,186,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,186,73,NULL,1,'{"yellow","red"}',FALSE,NULL,'{69}','{15,73}');
INSERT INTO stats VALUES('RAI',15,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('RAI',11,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,186,79,1,1,NULL,FALSE,'{69}','{14}',NULL);
--subs--
INSERT INTO stats VALUES('RAI',16,186,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,186,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('RAI',1,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,199,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('RAI',3,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RAI',51,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('RAI',20,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,199,90,1,1,NULL,FALSE,'{65}','{78}',NULL);
INSERT INTO stats VALUES('RAI',28,199,90,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('RAI',9,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
--26. match--
INSERT INTO stats VALUES('RAI',1,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,203,90,1,1,NULL,FALSE,'{8}','{27}',NULL);
INSERT INTO stats VALUES('RAI',6,203,90,NULL,1,NULL,FALSE,NULL,'{8}',NULL);
INSERT INTO stats VALUES('RAI',5,203,90,1,NULL,NULL,FALSE,'{27}',NULL,NULL);
INSERT INTO stats VALUES('RAI',17,203,90,NULL,1,NULL,FALSE,NULL,'{61}',NULL);
INSERT INTO stats VALUES('RAI',28,203,90,1,1,NULL,FALSE,'{61}','{55}',NULL);
INSERT INTO stats VALUES('RAI',11,203,90,1,NULL,NULL,FALSE,'{55}',NULL,NULL);
INSERT INTO stats VALUES('RAI',10,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',27,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',31,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('RAI',1,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{19}');
INSERT INTO stats VALUES('RAI',5,214,90,NULL,1,NULL,FALSE,NULL,'{3}',NULL);
INSERT INTO stats VALUES('RAI',3,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
INSERT INTO stats VALUES('RAI',18,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('RAI',6,214,90,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{61}');
INSERT INTO stats VALUES('RAI',10,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',15,214,90,1,2,'{"yellow"}',FALSE,'{3}','{40,67}','{16}');
INSERT INTO stats VALUES('RAI',17,214,90,1,NULL,NULL,FALSE,'{40}',NULL,NULL);
INSERT INTO stats VALUES('RAI',21,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',9,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
--28. match--
INSERT INTO stats VALUES('RAI',1,220,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('RAI',3,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,220,90,NULL,1,'{"yellow"}',FALSE,NULL,'{17}','{75}');
INSERT INTO stats VALUES('RAI',22,220,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('RAI',17,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',14,220,90,1,1,NULL,FALSE,'{17}','{45}',NULL);
INSERT INTO stats VALUES('RAI',15,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',27,220,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,220,90,1,NULL,NULL,FALSE,'{45}',NULL,NULL);
INSERT INTO stats VALUES('RAI',16,220,69,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('RAI',31,220,21,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('RAI',28,220,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('RAI',1,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',4,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',6,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',5,229,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{16}');
INSERT INTO stats VALUES('RAI',15,229,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('RAI',14,229,90,2,NULL,NULL,FALSE,'{22,78}',NULL,NULL);
INSERT INTO stats VALUES('RAI',20,229,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',17,229,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',11,229,90,NULL,1,'{"yellow"}',FALSE,NULL,'{22}','{51}');
INSERT INTO stats VALUES('RAI',9,229,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
--subs--
INSERT INTO stats VALUES('RAI',16,229,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,229,30,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{88}');
INSERT INTO stats VALUES('RAI',21,229,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('RAI',88,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',22,237,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('RAI',6,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',3,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',66,237,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('RAI',21,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',20,237,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('RAI',14,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',10,237,57,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('RAI',28,237,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('RAI',9,237,78,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
--subs--
INSERT INTO stats VALUES('RAI',31,237,12,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('RAI',11,237,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('RAI',17,237,33,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');

--VOI--
--1. match--
INSERT INTO stats VALUES('VOI',1,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',23,5,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('VOI',3,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,5,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('VOI',4,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,5,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,5,84,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',34,5,6,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,5,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('VOI',1,13,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,13,90,1,1,NULL,FALSE,'{14}','{67}',NULL);
INSERT INTO stats VALUES('VOI',20,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,13,90,1,1,NULL,FALSE,'{83}','{14}',NULL);
INSERT INTO stats VALUES('VOI',8,13,90,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('VOI',16,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('VOI',13,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',7,13,90,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('VOI',11,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',34,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('VOI',1,20,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,20,90,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{79}');
INSERT INTO stats VALUES('VOI',3,20,90,NULL,1,'{"yellow"}',FALSE,NULL,'{76}','{45}');
INSERT INTO stats VALUES('VOI',5,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('VOI',19,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,20,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('VOI',7,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',9,20,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
--4. match--
INSERT INTO stats VALUES('VOI',22,30,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('VOI',4,30,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('VOI',5,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',23,30,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('VOI',6,30,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('VOI',16,30,90,NULL,1,NULL,FALSE,NULL,'{61}',NULL);
INSERT INTO stats VALUES('VOI',7,30,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,30,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',9,30,70,1,NULL,NULL,FALSE,'{61}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',10,30,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,30,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,30,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('VOI',12,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,35,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,35,90,NULL,1,NULL,FALSE,NULL,'{34}',NULL);
INSERT INTO stats VALUES('VOI',11,35,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('VOI',8,35,90,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{88}');
INSERT INTO stats VALUES('VOI',13,35,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
INSERT INTO stats VALUES('VOI',21,35,55,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('VOI',9,35,84,3,NULL,'{"yellow"}',FALSE,'{14,34,67}',NULL,'{74}');
--subs--
INSERT INTO stats VALUES('VOI',25,35,6,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,35,45,1,1,NULL,FALSE,'{80}','{56}',NULL);
INSERT INTO stats VALUES('VOI',14,35,35,NULL,2,'{"yellow"}',FALSE,NULL,'{67,80}','{84}');
--6. match--
INSERT INTO stats VALUES('VOI',1,47,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',6,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,47,90,1,NULL,'{"yellow"}',FALSE,'{79}',NULL,'{55}');
INSERT INTO stats VALUES('VOI',2,47,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('VOI',16,47,90,1,NULL,'{"yellow"}',FALSE,'{73}',NULL,'{90}');
INSERT INTO stats VALUES('VOI',8,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,47,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',21,47,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,47,90,NULL,1,'{"yellow"}',FALSE,NULL,'{79}','{87}');
INSERT INTO stats VALUES('VOI',25,47,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',9,47,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('VOI',14,47,30,NULL,1,'{"yellow"}',FALSE,NULL,'{73}','{68}');
--7. match--
INSERT INTO stats VALUES('VOI',1,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,50,90,1,NULL,'{"yellow"}',FALSE,'{33}',NULL,'{67}');
INSERT INTO stats VALUES('VOI',4,50,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('VOI',6,50,90,NULL,2,NULL,FALSE,NULL,'{33,49}',NULL);
INSERT INTO stats VALUES('VOI',2,50,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('VOI',11,50,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('VOI',7,50,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,50,90,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
INSERT INTO stats VALUES('VOI',8,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,50,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,50,63,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',9,50,27,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,50,45,2,NULL,NULL,FALSE,'{49,60}',NULL,NULL);
--8. match--
INSERT INTO stats VALUES('VOI',12,64,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,64,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
INSERT INTO stats VALUES('VOI',4,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,64,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,64,90,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
INSERT INTO stats VALUES('VOI',19,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,64,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',9,64,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',10,64,17,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('VOI',8,64,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--9. match--
INSERT INTO stats VALUES('VOI',12,65,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{59}');
INSERT INTO stats VALUES('VOI',2,65,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('VOI',5,65,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('VOI',3,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,65,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',13,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,65,72,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('VOI',14,65,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,65,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{10}');
INSERT INTO stats VALUES('VOI',10,65,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('VOI',9,65,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,65,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',21,65,18,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--10. match--
INSERT INTO stats VALUES('VOI',12,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,80,90,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{54}');
INSERT INTO stats VALUES('VOI',20,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,80,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('VOI',2,80,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('VOI',13,80,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('VOI',11,80,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('VOI',19,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,80,59,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('VOI',9,80,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',10,80,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,80,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('VOI',1,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',24,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,82,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--12. match--
INSERT INTO stats VALUES('VOI',1,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,95,90,NULL,1,NULL,FALSE,NULL,'{6}',NULL);
INSERT INTO stats VALUES('VOI',3,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',23,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,95,90,1,1,'{"yellow"}',FALSE,'{6}','{77}','{57}');
INSERT INTO stats VALUES('VOI',11,95,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('VOI',14,95,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',21,95,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',25,95,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',9,95,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,95,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,95,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('VOI',1,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('VOI',6,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('VOI',4,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('VOI',20,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('VOI',11,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
INSERT INTO stats VALUES('VOI',21,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,99,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('VOI',7,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',9,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--14. match--
INSERT INTO stats VALUES('VOI',1,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('VOI',4,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('VOI',5,110,90,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{41}');
INSERT INTO stats VALUES('VOI',2,110,90,1,NULL,NULL,FALSE,'{84}',NULL,NULL);
INSERT INTO stats VALUES('VOI',6,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('VOI',19,110,90,NULL,1,'{"yellow"}',FALSE,NULL,'{84}','{71}');
INSERT INTO stats VALUES('VOI',7,110,90,NULL,1,'{"yellow"}',FALSE,NULL,'{77}','{54}');
INSERT INTO stats VALUES('VOI',13,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('VOI',11,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('VOI',10,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('VOI',1,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,116,90,2,NULL,'{"yellow"}',FALSE,'{11,60}',NULL,'{51}');
INSERT INTO stats VALUES('VOI',6,116,89,1,NULL,'{"yellow","yellow","red"}',FALSE,'{49}',NULL,'{78,89,89}');
INSERT INTO stats VALUES('VOI',4,116,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('VOI',24,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,116,90,NULL,1,NULL,FALSE,NULL,'{29}',NULL);
INSERT INTO stats VALUES('VOI',16,116,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('VOI',8,116,90,NULL,1,NULL,FALSE,NULL,'{22}',NULL);
INSERT INTO stats VALUES('VOI',7,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,116,90,NULL,1,'{"yellow"}',FALSE,NULL,'{86}','{33}');
INSERT INTO stats VALUES('VOI',10,116,82,2,3,NULL,FALSE,'{22,29}','{11,49,60}',NULL);
--subs--
INSERT INTO stats VALUES('VOI',9,116,8,1,NULL,NULL,FALSE,'{86}',NULL,NULL);
--16. match--
INSERT INTO stats VALUES('VOI',1,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,125,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',14,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,125,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,125,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,125,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',34,125,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,125,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,125,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('VOI',1,133,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('VOI',6,133,90,NULL,1,NULL,FALSE,NULL,'{39}',NULL);
INSERT INTO stats VALUES('VOI',23,133,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('VOI',3,133,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('VOI',5,133,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,133,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('VOI',16,133,90,1,NULL,'{"yellow"}',FALSE,'{39}',NULL,'{41}');
INSERT INTO stats VALUES('VOI',19,133,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('VOI',13,133,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,133,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,133,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',25,133,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,133,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
--18. match--
INSERT INTO stats VALUES('VOI',1,140,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('VOI',4,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,140,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('VOI',6,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,140,90,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('VOI',7,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,140,90,1,NULL,NULL,FALSE,'{17}',NULL,NULL);
INSERT INTO stats VALUES('VOI',8,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,140,90,NULL,1,'{"yellow"}',FALSE,NULL,'{17}','{51}');
INSERT INTO stats VALUES('VOI',9,140,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--subs--
INSERT INTO stats VALUES('VOI',10,140,9,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
--19. match--
INSERT INTO stats VALUES('VOI',1,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('VOI',2,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('VOI',14,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',13,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',21,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,150,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('VOI',10,150,64,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
--subs--
INSERT INTO stats VALUES('VOI',9,150,26,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('VOI',8,150,21,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('VOI',22,155,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,155,90,NULL,1,'{"yellow"}',FALSE,NULL,'{21}','{87}');
INSERT INTO stats VALUES('VOI',5,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,155,90,1,NULL,'{"yellow"}',FALSE,'{21}',NULL,'{65}');
INSERT INTO stats VALUES('VOI',6,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,155,90,NULL,1,'{"yellow"}',FALSE,NULL,'{76}','{90}');
INSERT INTO stats VALUES('VOI',11,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,155,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,155,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('VOI',10,155,90,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{83}');
--21. match--
INSERT INTO stats VALUES('VOI',1,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,167,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',5,167,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',24,167,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('VOI',2,167,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('VOI',8,167,90,1,NULL,'{"yellow"}',FALSE,'{13}',NULL,'{55}');
INSERT INTO stats VALUES('VOI',14,167,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{39}');
INSERT INTO stats VALUES('VOI',7,167,72,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,167,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('VOI',9,167,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',25,167,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,167,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,167,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('VOI',1,170,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('VOI',6,170,90,NULL,2,'{"yellow"}',FALSE,NULL,'{60,77}','{89}');
INSERT INTO stats VALUES('VOI',4,170,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',20,170,90,2,NULL,'{"yellow"}',FALSE,'{35,60}',NULL,'{81}');
INSERT INTO stats VALUES('VOI',13,170,90,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{34}');
INSERT INTO stats VALUES('VOI',14,170,90,NULL,1,NULL,FALSE,NULL,'{35}',NULL);
INSERT INTO stats VALUES('VOI',7,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('VOI',8,170,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('VOI',16,170,90,NULL,1,'{"yellow"}',FALSE,NULL,'{3}','{44}');
INSERT INTO stats VALUES('VOI',10,170,90,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
--23. match--
INSERT INTO stats VALUES('VOI',1,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',20,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('VOI',6,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('VOI',3,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('VOI',7,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('VOI',16,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('VOI',21,184,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('VOI',25,184,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('VOI',1,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,185,90,1,1,NULL,FALSE,'{54}','{69}',NULL);
INSERT INTO stats VALUES('VOI',2,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,185,90,NULL,2,'{"yellow"}',FALSE,NULL,'{7,60}','{86}');
INSERT INTO stats VALUES('VOI',5,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,185,90,3,1,NULL,FALSE,'{7,60,69}','{54}',NULL);
INSERT INTO stats VALUES('VOI',8,185,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',7,185,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',9,185,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',10,185,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,185,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,185,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('VOI',1,200,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('VOI',4,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',23,200,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('VOI',6,200,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('VOI',8,200,90,2,NULL,NULL,FALSE,'{23,38}',NULL,NULL);
INSERT INTO stats VALUES('VOI',19,200,90,NULL,1,NULL,FALSE,NULL,'{59}',NULL);
INSERT INTO stats VALUES('VOI',13,200,90,1,3,NULL,FALSE,'{11}','{23,38,51}',NULL);
INSERT INTO stats VALUES('VOI',14,200,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,200,90,2,NULL,'{"yellow"}',FALSE,'{51,59}',NULL,'{42}');
INSERT INTO stats VALUES('VOI',9,200,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',10,200,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('VOI',7,200,19,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
--26. match--
INSERT INTO stats VALUES('VOI',12,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,202,90,1,NULL,NULL,FALSE,'{4}',NULL,NULL);
INSERT INTO stats VALUES('VOI',2,202,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('VOI',3,202,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('VOI',6,202,90,1,1,NULL,FALSE,'{11}','{4}',NULL);
INSERT INTO stats VALUES('VOI',7,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,202,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('VOI',11,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,202,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('VOI',10,202,76,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
--subs--
INSERT INTO stats VALUES('VOI',34,202,14,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('VOI',14,202,23,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--27. match--
INSERT INTO stats VALUES('VOI',1,215,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',2,215,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('VOI',6,215,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('VOI',3,215,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{30}');
INSERT INTO stats VALUES('VOI',5,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,215,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('VOI',13,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,215,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,215,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{5}');
INSERT INTO stats VALUES('VOI',9,215,76,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{28,76}');
--subs--
INSERT INTO stats VALUES('VOI',25,215,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('VOI',16,215,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--28. match--
INSERT INTO stats VALUES('VOI',1,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('VOI',4,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('VOI',5,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',20,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',21,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('VOI',8,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,219,85,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',16,219,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,219,62,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('VOI',25,219,28,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,219,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,219,5,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('VOI',1,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,230,90,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('VOI',3,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',23,230,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('VOI',7,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',8,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',14,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',10,230,90,NULL,1,'{"yellow"}',FALSE,NULL,'{89}','{61}');
--30. match--
INSERT INTO stats VALUES('VOI',1,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',6,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',3,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',5,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',4,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',19,236,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('VOI',8,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',11,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',13,236,90,1,NULL,NULL,FALSE,'{2}',NULL,NULL);
INSERT INTO stats VALUES('VOI',7,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('VOI',34,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--SCH--
--1. match--
INSERT INTO stats VALUES('SCH',1,6,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,6,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('SCH',87,6,90,1,1,'{"yellow"}',FALSE,'{13}','{18}','{75}');
INSERT INTO stats VALUES('SCH',2,6,90,NULL,3,NULL,FALSE,NULL,'{13,41,67}',NULL);
INSERT INTO stats VALUES('SCH',6,6,90,1,1,NULL,FALSE,'{67}','{70}',NULL);
INSERT INTO stats VALUES('SCH',37,6,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('SCH',17,6,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SCH',13,6,90,3,NULL,'{"yellow"}',FALSE,'{18,41,70}',NULL,'{51}');
INSERT INTO stats VALUES('SCH',14,6,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SCH',9,6,90,1,NULL,'{"yellow"}',FALSE,'{2}',NULL,'{90}');
INSERT INTO stats VALUES('SCH',10,6,90,NULL,1,'{"yellow"}',FALSE,NULL,'{2}','{19}');
--2. match--
INSERT INTO stats VALUES('SCH',1,12,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,12,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('SCH',78,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('SCH',6,12,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('SCH',9,12,54,1,1,'{"red"}',FALSE,'{23}','{43}','{54}');
INSERT INTO stats VALUES('SCH',13,12,90,1,1,'{"yellow"}',FALSE,'{43}','{79}','{12}');
INSERT INTO stats VALUES('SCH',17,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SCH',11,12,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('SCH',14,12,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,12,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,12,30,1,NULL,NULL,FALSE,'{79}',NULL,NULL);
INSERT INTO stats VALUES('SCH',7,12,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
--3. match--
INSERT INTO stats VALUES('SCH',12,21,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('SCH',22,21,90,2,1,NULL,FALSE,'{12,65}','{31}',NULL);
INSERT INTO stats VALUES('SCH',23,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,21,61,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,21,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{53}');
INSERT INTO stats VALUES('SCH',37,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',19,21,45,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',21,21,45,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('SCH',17,21,29,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('SCH',1,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,29,90,1,NULL,NULL,FALSE,'{7}',NULL,NULL);
INSERT INTO stats VALUES('SCH',87,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,29,90,1,1,NULL,FALSE,'{78}','{49}',NULL);
INSERT INTO stats VALUES('SCH',7,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,29,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,29,90,NULL,3,NULL,FALSE,NULL,'{7,58,61}',NULL);
INSERT INTO stats VALUES('SCH',9,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,29,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,29,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',21,29,31,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
INSERT INTO stats VALUES('SCH',14,29,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',15,29,45,3,NULL,NULL,FALSE,'{49,58,61}',NULL,NULL);
--5. match--
INSERT INTO stats VALUES('SCH',1,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,36,90,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
INSERT INTO stats VALUES('SCH',2,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,36,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('SCH',15,36,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,36,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,36,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,36,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('SCH',1,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,46,90,2,NULL,NULL,FALSE,'{14,90}',NULL,NULL);
INSERT INTO stats VALUES('SCH',90,46,90,NULL,1,NULL,FALSE,NULL,'{90}',NULL);
INSERT INTO stats VALUES('SCH',17,46,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,46,90,NULL,1,'{"yellow"}',FALSE,NULL,'{23}','{88}');
INSERT INTO stats VALUES('SCH',7,46,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('SCH',11,46,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('SCH',37,46,90,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('SCH',10,46,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
--7. match--
INSERT INTO stats VALUES('SCH',1,51,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('SCH',22,51,90,NULL,1,'{"yellow"}',FALSE,NULL,'{23}','{40}');
INSERT INTO stats VALUES('SCH',23,51,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('SCH',5,51,90,2,NULL,'{"yellow"}',FALSE,'{23,61}',NULL,'{31}');
INSERT INTO stats VALUES('SCH',6,51,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('SCH',17,51,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,51,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,51,90,NULL,1,NULL,FALSE,NULL,'{70}',NULL);
INSERT INTO stats VALUES('SCH',13,51,90,NULL,1,NULL,FALSE,NULL,'{61}',NULL);
INSERT INTO stats VALUES('SCH',37,51,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('SCH',10,51,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
--subs--
INSERT INTO stats VALUES('SCH',21,51,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SCH',9,51,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
--8. match--
INSERT INTO stats VALUES('SCH',1,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',78,63,90,1,NULL,NULL,FALSE,'{44}',NULL,NULL);
INSERT INTO stats VALUES('SCH',90,63,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{30}');
INSERT INTO stats VALUES('SCH',2,63,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('SCH',22,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',15,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,63,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',20,63,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',10,63,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('SCH',12,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('SCH',2,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('SCH',5,66,90,NULL,1,NULL,FALSE,NULL,'{69}',NULL);
INSERT INTO stats VALUES('SCH',23,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SCH',6,66,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SCH',11,66,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,66,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,66,90,1,NULL,'{"yellow"}',FALSE,'{7}',NULL,'{34}');
INSERT INTO stats VALUES('SCH',17,66,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('SCH',10,66,45,NULL,1,NULL,FALSE,NULL,'{7}',NULL);
--subs--
INSERT INTO stats VALUES('SCH',20,66,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SCH',15,66,32,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
--10. match--
INSERT INTO stats VALUES('SCH',99,80,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SCH',22,80,90,1,NULL,NULL,FALSE,'{30}',NULL,NULL);
INSERT INTO stats VALUES('SCH',2,80,90,2,1,NULL,FALSE,'{4,7}','{30}',NULL);
INSERT INTO stats VALUES('SCH',6,80,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{19}');
INSERT INTO stats VALUES('SCH',5,80,90,NULL,1,'{"yellow"}',FALSE,NULL,'{4}','{65}');
INSERT INTO stats VALUES('SCH',7,80,90,1,NULL,'{"yellow"}',FALSE,'{72}',NULL,'{76}');
INSERT INTO stats VALUES('SCH',9,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,80,90,NULL,1,'{"yellow"}',FALSE,NULL,'{7}','{79}');
INSERT INTO stats VALUES('SCH',15,80,90,NULL,1,'{"yellow"}',FALSE,NULL,'{72}','{84}');
INSERT INTO stats VALUES('SCH',14,80,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{10}');
INSERT INTO stats VALUES('SCH',10,80,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('SCH',1,81,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SCH',5,81,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('SCH',78,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,81,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('SCH',6,81,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('SCH',13,81,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('SCH',15,81,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,81,90,1,1,'{"yellow"}',FALSE,'{13}','{44}','{90}');
INSERT INTO stats VALUES('SCH',11,81,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{53}');
INSERT INTO stats VALUES('SCH',14,81,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SCH',19,81,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',10,81,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,81,45,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{80}');
INSERT INTO stats VALUES('SCH',9,81,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--12. match--
INSERT INTO stats VALUES('SCH',1,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',87,96,90,NULL,1,NULL,FALSE,NULL,'{31}',NULL);
INSERT INTO stats VALUES('SCH',5,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,96,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{39}');
INSERT INTO stats VALUES('SCH',13,96,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SCH',7,96,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SCH',11,96,58,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('SCH',37,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,96,79,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,96,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,96,32,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('SCH',15,96,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('SCH',1,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,98,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('SCH',6,98,90,1,NULL,'{"yellow"}',FALSE,'{22}',NULL,'{76}');
INSERT INTO stats VALUES('SCH',22,98,90,NULL,1,NULL,FALSE,NULL,'{64}',NULL);
INSERT INTO stats VALUES('SCH',23,98,90,NULL,1,'{"yellow"}',FALSE,NULL,'{22}','{41}');
INSERT INTO stats VALUES('SCH',11,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,98,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('SCH',15,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,98,79,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('SCH',19,98,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',10,98,45,1,NULL,NULL,FALSE,'{64}',NULL,NULL);
INSERT INTO stats VALUES('SCH',37,98,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--14. match--
INSERT INTO stats VALUES('SCH',1,111,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',87,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',37,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',15,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('SCH',1,115,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,115,90,NULL,2,'{"yellow"}',FALSE,NULL,'{13,83}','{55}');
INSERT INTO stats VALUES('SCH',6,115,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SCH',2,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,115,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('SCH',7,115,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('SCH',9,115,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{40}');
INSERT INTO stats VALUES('SCH',17,115,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('SCH',15,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,115,77,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,115,13,1,NULL,'{"yellow"}',FALSE,'{83}',NULL,'{88}');
--16. match--
INSERT INTO stats VALUES('SCH',1,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('SCH',2,126,90,1,NULL,'{"yellow"}',FALSE,'{89}',NULL,'{77}');
INSERT INTO stats VALUES('SCH',87,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SCH',5,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('SCH',9,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',37,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('SCH',7,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,126,90,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
INSERT INTO stats VALUES('SCH',14,126,79,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SCH',10,126,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,126,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,126,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('SCH',1,132,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,132,90,1,NULL,NULL,FALSE,'{4}',NULL,NULL);
INSERT INTO stats VALUES('SCH',2,132,90,1,3,'{"yellow"}',FALSE,'{56}','{4,17,70}','{79}');
INSERT INTO stats VALUES('SCH',5,132,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('SCH',9,132,90,1,NULL,'{"yellow"}',FALSE,'{23}',NULL,'{87}');
INSERT INTO stats VALUES('SCH',17,132,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SCH',37,132,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('SCH',7,132,90,1,NULL,NULL,FALSE,'{17}',NULL,NULL);
INSERT INTO stats VALUES('SCH',15,132,76,NULL,1,'{"yellow"}',FALSE,NULL,'{56}','{67}');
INSERT INTO stats VALUES('SCH',10,132,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,132,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,132,14,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--18. match--
INSERT INTO stats VALUES('SCH',1,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('SCH',2,141,90,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{77}');
INSERT INTO stats VALUES('SCH',6,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('SCH',15,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,141,90,NULL,1,'{"yellow"}',FALSE,NULL,'{76}','{64}');
INSERT INTO stats VALUES('SCH',7,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('SCH',11,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',19,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--19. match--
INSERT INTO stats VALUES('SCH',1,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,149,90,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
INSERT INTO stats VALUES('SCH',5,149,90,NULL,1,NULL,FALSE,NULL,'{3}',NULL);
INSERT INTO stats VALUES('SCH',9,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,149,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,149,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
--subs--
INSERT INTO stats VALUES('SCH',19,149,21,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,149,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('SCH',1,156,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('SCH',5,156,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('SCH',78,156,90,NULL,1,NULL,FALSE,NULL,'{69}',NULL);
INSERT INTO stats VALUES('SCH',22,156,90,2,NULL,'{"yellow"}',FALSE,'{11,69}',NULL,'{81}');
INSERT INTO stats VALUES('SCH',23,156,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('SCH',14,156,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SCH',17,156,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SCH',13,156,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,156,90,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
INSERT INTO stats VALUES('SCH',11,156,90,NULL,1,'{"yellow"}',FALSE,NULL,'{31}','{88}');
INSERT INTO stats VALUES('SCH',10,156,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,156,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,156,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',37,156,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('SCH',12,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,166,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('SCH',6,166,90,1,NULL,NULL,FALSE,'{71}',NULL,NULL);
INSERT INTO stats VALUES('SCH',2,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,166,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('SCH',14,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,166,90,NULL,1,NULL,FALSE,NULL,'{71}',NULL);
INSERT INTO stats VALUES('SCH',7,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,166,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SCH',9,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,166,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('SCH',1,171,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',90,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,171,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('SCH',23,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,171,90,1,NULL,NULL,FALSE,'{5}',NULL,NULL);
INSERT INTO stats VALUES('SCH',7,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,171,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('SCH',13,171,90,NULL,1,NULL,FALSE,NULL,'{5}',NULL);
INSERT INTO stats VALUES('SCH',9,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',19,171,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('SCH',1,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',90,183,90,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('SCH',5,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,183,90,1,NULL,'{"yellow"}',FALSE,'{86}',NULL,'{74}');
INSERT INTO stats VALUES('SCH',17,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,183,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,183,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',37,183,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,183,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
--subs--
INSERT INTO stats VALUES('SCH',19,183,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,183,31,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
INSERT INTO stats VALUES('SCH',15,183,20,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
--24. match--
INSERT INTO stats VALUES('SCH',1,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,186,90,NULL,1,NULL,FALSE,NULL,'{68}',NULL);
INSERT INTO stats VALUES('SCH',78,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,186,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,186,90,NULL,1,NULL,FALSE,NULL,'{1}',NULL);
INSERT INTO stats VALUES('SCH',7,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('SCH',11,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('SCH',17,186,90,1,NULL,NULL,FALSE,'{1}',NULL,NULL);
INSERT INTO stats VALUES('SCH',9,186,90,1,NULL,NULL,FALSE,'{68}',NULL,NULL);
INSERT INTO stats VALUES('SCH',10,186,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
--25. match--
INSERT INTO stats VALUES('SCH',1,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,200,90,1,1,NULL,FALSE,'{15}','{66}',NULL);
INSERT INTO stats VALUES('SCH',6,200,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('SCH',5,200,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SCH',23,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,200,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('SCH',7,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,200,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('SCH',15,200,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SCH',20,200,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--26. match--
INSERT INTO stats VALUES('SCH',1,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',87,201,90,NULL,1,NULL,FALSE,NULL,'{51}',NULL);
INSERT INTO stats VALUES('SCH',6,201,90,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{90}');
INSERT INTO stats VALUES('SCH',78,201,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('SCH',5,201,90,1,NULL,NULL,FALSE,'{57}',NULL,NULL);
INSERT INTO stats VALUES('SCH',7,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,201,90,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
INSERT INTO stats VALUES('SCH',11,201,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',10,201,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',19,201,45,NULL,1,'{"yellow"}',FALSE,NULL,'{57}','{87}');
INSERT INTO stats VALUES('SCH',15,201,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('SCH',1,216,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SCH',6,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',78,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',5,216,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('SCH',9,216,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,216,90,NULL,1,'{"yellow"}',FALSE,NULL,'{40}','{64}');
INSERT INTO stats VALUES('SCH',13,216,90,1,NULL,'{"yellow"}',FALSE,'{13}',NULL,'{55}');
INSERT INTO stats VALUES('SCH',15,216,61,1,NULL,NULL,FALSE,'{40}',NULL,NULL);
INSERT INTO stats VALUES('SCH',14,216,90,NULL,2,NULL,FALSE,NULL,'{13,70}',NULL);
INSERT INTO stats VALUES('SCH',19,216,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',10,216,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,216,29,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('SCH',17,216,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('SCH',1,218,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',6,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,218,90,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
INSERT INTO stats VALUES('SCH',2,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',23,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',7,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',15,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',37,218,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',11,218,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,218,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
INSERT INTO stats VALUES('SCH',19,218,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',10,218,45,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{65,90,90}');
INSERT INTO stats VALUES('SCH',9,218,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,218,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('SCH',12,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',22,231,90,1,2,NULL,FALSE,'{40}','{11,70}',NULL);
INSERT INTO stats VALUES('SCH',23,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',2,231,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('SCH',5,231,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('SCH',11,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',17,231,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',9,231,90,NULL,1,'{"yellow"}',FALSE,NULL,'{40}','{55}');
INSERT INTO stats VALUES('SCH',7,231,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,231,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('SCH',19,231,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SCH',20,231,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,231,17,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('SCH',15,231,26,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
--30. match--
INSERT INTO stats VALUES('SCH',1,235,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('SCH',6,235,90,1,NULL,NULL,FALSE,'{79}',NULL,NULL);
INSERT INTO stats VALUES('SCH',5,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('SCH',23,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('SCH',90,235,90,NULL,1,'{"yellow"}',FALSE,NULL,'{79}','{80}');
INSERT INTO stats VALUES('SCH',37,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',13,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('SCH',7,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('SCH',11,235,84,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',14,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',19,235,59,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
--subs--
INSERT INTO stats VALUES('SCH',21,235,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SCH',15,235,6,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');

--LEP--
--1. match--
INSERT INTO stats VALUES('LEP',1,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',77,7,90,1,NULL,'{"yellow"}',FALSE,'{60}',NULL,'{51}');
INSERT INTO stats VALUES('LEP',2,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',27,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('LEP',13,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,7,90,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
INSERT INTO stats VALUES('LEP',10,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,7,70,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('LEP',16,7,79,1,2,NULL,FALSE,'{11}','{31,60}',NULL);
--subs--
INSERT INTO stats VALUES('LEP',9,7,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,7,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
--2. match--
INSERT INTO stats VALUES('LEP',1,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('LEP',2,11,90,1,NULL,NULL,FALSE,'{86}',NULL,NULL);
INSERT INTO stats VALUES('LEP',52,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('LEP',10,11,90,NULL,1,'{"yellow"}',FALSE,NULL,'{86}','{25}');
INSERT INTO stats VALUES('LEP',20,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{20}');
INSERT INTO stats VALUES('LEP',11,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('LEP',13,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,11,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('LEP',9,11,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',19,11,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',25,11,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('LEP',1,22,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
INSERT INTO stats VALUES('LEP',22,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,22,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',6,22,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('LEP',5,22,90,1,NULL,NULL,FALSE,'{21}',NULL,NULL);
INSERT INTO stats VALUES('LEP',11,22,90,NULL,1,'{"yellow"}',FALSE,NULL,'{21}','{67}');
INSERT INTO stats VALUES('LEP',8,22,90,1,NULL,'{"yellow"}',FALSE,'{55}',NULL,'{86}');
INSERT INTO stats VALUES('LEP',20,22,90,NULL,1,NULL,FALSE,NULL,'{55}',NULL);
INSERT INTO stats VALUES('LEP',10,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,22,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
--4. match--
INSERT INTO stats VALUES('LEP',33,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('LEP',4,28,90,1,NULL,NULL,FALSE,'{24}',NULL,NULL);
INSERT INTO stats VALUES('LEP',5,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{10}');
INSERT INTO stats VALUES('LEP',6,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('LEP',2,28,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,28,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,28,90,NULL,3,'{"yellow"}',FALSE,NULL,'{24,52,83}','{89}');
INSERT INTO stats VALUES('LEP',13,28,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{40}');
INSERT INTO stats VALUES('LEP',21,28,75,1,NULL,'{"yellow"}',FALSE,'{52}',NULL,'{23}');
INSERT INTO stats VALUES('LEP',9,28,83,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
--subs--
INSERT INTO stats VALUES('LEP',16,28,7,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',8,28,15,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
--5. match--
INSERT INTO stats VALUES('LEP',1,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,37,77,NULL,1,NULL,FALSE,NULL,'{40}',NULL);
INSERT INTO stats VALUES('LEP',10,37,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,37,90,2,1,NULL,FALSE,'{40,62}','{56}',NULL);
INSERT INTO stats VALUES('LEP',8,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,37,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',16,37,45,1,1,NULL,FALSE,'{56}','{62}',NULL);
INSERT INTO stats VALUES('LEP',11,37,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,37,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('LEP',1,45,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('LEP',2,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,45,90,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('LEP',6,45,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('LEP',10,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,45,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',25,45,90,1,NULL,NULL,FALSE,'{5}',NULL,NULL);
INSERT INTO stats VALUES('LEP',7,45,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('LEP',20,45,90,NULL,1,'{"yellow"}',FALSE,NULL,'{5}','{90}');
INSERT INTO stats VALUES('LEP',9,45,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',19,45,45,1,NULL,'{"yellow"}',FALSE,'{82}',NULL,'{51}');
INSERT INTO stats VALUES('LEP',21,45,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,45,12,NULL,2,'{"yellow"}',FALSE,NULL,'{82,85}','{80}');
--7. match--
INSERT INTO stats VALUES('LEP',12,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,52,90,1,1,NULL,FALSE,'{78}','{41}',NULL);
INSERT INTO stats VALUES('LEP',2,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,52,90,1,1,NULL,FALSE,'{41}','{78}',NULL);
INSERT INTO stats VALUES('LEP',13,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,52,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',16,52,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',9,52,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--8. match--
INSERT INTO stats VALUES('LEP',1,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,62,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,62,90,1,3,NULL,FALSE,'{27}','{1,10,57}',NULL);
INSERT INTO stats VALUES('LEP',21,62,90,NULL,1,NULL,FALSE,NULL,'{55}',NULL);
INSERT INTO stats VALUES('LEP',7,62,90,NULL,1,NULL,FALSE,NULL,'{19}',NULL);
INSERT INTO stats VALUES('LEP',13,62,90,4,1,NULL,FALSE,'{1,19,55,57}','{27}',NULL);
INSERT INTO stats VALUES('LEP',9,62,82,1,NULL,NULL,FALSE,'{10}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',19,62,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('LEP',1,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('LEP',22,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,67,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('LEP',4,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('LEP',13,67,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('LEP',7,67,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('LEP',21,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('LEP',23,67,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('LEP',93,67,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',19,67,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--10. match--
INSERT INTO stats VALUES('LEP',12,79,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('LEP',6,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('LEP',4,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',22,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',20,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{9}');
INSERT INTO stats VALUES('LEP',25,79,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('LEP',9,79,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--11. match--
INSERT INTO stats VALUES('LEP',1,82,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('LEP',6,82,90,NULL,1,'{"yellow"}',FALSE,NULL,'{44}','{45}');
INSERT INTO stats VALUES('LEP',4,82,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('LEP',77,82,90,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{11}');
INSERT INTO stats VALUES('LEP',2,82,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',13,82,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',20,82,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',11,82,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('LEP',10,82,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,82,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',19,82,79,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{55}');
--subs--
INSERT INTO stats VALUES('LEP',93,82,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,82,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('LEP',1,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,96,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('LEP',5,96,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',22,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,96,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('LEP',11,96,90,1,2,'{"yellow"}',FALSE,'{11}','{43,70}','{88}');
INSERT INTO stats VALUES('LEP',10,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,96,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,96,90,1,1,NULL,FALSE,'{43}','{11}',NULL);
INSERT INTO stats VALUES('LEP',9,96,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--13. match--
INSERT INTO stats VALUES('LEP',1,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',5,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',77,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('LEP',11,97,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,97,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,97,90,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
INSERT INTO stats VALUES('LEP',16,97,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',9,97,31,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('LEP',13,97,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,97,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--14. match--
INSERT INTO stats VALUES('LEP',1,112,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('LEP',6,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,112,90,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
INSERT INTO stats VALUES('LEP',5,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,112,90,1,1,NULL,FALSE,'{66}','{3}',NULL);
INSERT INTO stats VALUES('LEP',20,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('LEP',11,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('LEP',7,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',93,112,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',9,112,45,NULL,1,NULL,FALSE,NULL,'{66}',NULL);
--15. match--
INSERT INTO stats VALUES('LEP',1,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,114,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('LEP',27,114,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('LEP',2,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',25,114,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('LEP',13,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,114,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',16,114,9,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--16. match--
INSERT INTO stats VALUES('LEP',1,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('LEP',4,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',2,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('LEP',22,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('LEP',7,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{6}');
INSERT INTO stats VALUES('LEP',8,127,90,NULL,1,'{"yellow"}',FALSE,NULL,'{44}','{78}');
INSERT INTO stats VALUES('LEP',16,127,70,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{31}');
--subs--
INSERT INTO stats VALUES('LEP',19,127,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--17. match--
INSERT INTO stats VALUES('LEP',1,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,131,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('LEP',22,131,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('LEP',2,131,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('LEP',6,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,131,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{4}');
INSERT INTO stats VALUES('LEP',13,131,78,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{11,78,78}');
INSERT INTO stats VALUES('LEP',11,131,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',21,131,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,131,69,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{54,69,69}');
INSERT INTO stats VALUES('LEP',9,131,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',16,131,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('LEP',8,131,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('LEP',1,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('LEP',5,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{29}');
INSERT INTO stats VALUES('LEP',6,142,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('LEP',21,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',25,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,142,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{55}');
INSERT INTO stats VALUES('LEP',10,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
--19. match--
INSERT INTO stats VALUES('LEP',1,148,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('LEP',22,148,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('LEP',52,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,148,90,1,NULL,NULL,FALSE,'{80}',NULL,NULL);
INSERT INTO stats VALUES('LEP',8,148,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('LEP',21,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,148,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,148,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,148,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',16,148,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,148,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('LEP',13,148,45,NULL,1,'{"yellow"}',FALSE,NULL,'{80}','{90}');
--20. match--
INSERT INTO stats VALUES('LEP',1,157,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('LEP',6,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,157,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('LEP',22,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,157,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('LEP',10,157,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('LEP',13,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,157,90,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{64}');
INSERT INTO stats VALUES('LEP',20,157,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('LEP',93,157,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
--21. match--
INSERT INTO stats VALUES('LEP',1,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',52,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,165,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('LEP',5,165,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('LEP',4,165,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('LEP',21,165,90,NULL,2,'{"yellow"}',FALSE,NULL,'{47,70}','{88}');
INSERT INTO stats VALUES('LEP',11,165,90,NULL,1,'{"yellow"}',FALSE,NULL,'{62}','{62}');
INSERT INTO stats VALUES('LEP',7,165,70,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('LEP',8,165,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('LEP',20,165,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('LEP',9,165,41,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{4,41,41}');
--subs--
INSERT INTO stats VALUES('LEP',16,165,45,2,1,NULL,FALSE,'{47,62}','{80}',NULL);
INSERT INTO stats VALUES('LEP',10,165,20,1,NULL,NULL,FALSE,'{80}',NULL,NULL);
--22. match--
INSERT INTO stats VALUES('LEP',1,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,172,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('LEP',2,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,172,90,1,NULL,'{"yellow"}',FALSE,'{62}',NULL,'{63}');
INSERT INTO stats VALUES('LEP',7,172,90,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
INSERT INTO stats VALUES('LEP',21,172,90,1,3,NULL,FALSE,'{60}','{12,15,62}',NULL);
INSERT INTO stats VALUES('LEP',23,172,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,172,63,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,172,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',16,172,81,2,NULL,NULL,FALSE,'{12,15}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',93,172,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,172,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,172,27,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--23. match--
INSERT INTO stats VALUES('LEP',1,182,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('LEP',6,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',52,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,182,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('LEP',1,187,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('LEP',6,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('LEP',5,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('LEP',27,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('LEP',8,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,187,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('LEP',25,187,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,187,90,1,NULL,'{"yellow"}',FALSE,'{37}',NULL,'{88}');
INSERT INTO stats VALUES('LEP',16,187,90,NULL,1,'{"yellow"}',FALSE,NULL,'{37}','{90}');
--25. match--
INSERT INTO stats VALUES('LEP',1,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('LEP',52,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('LEP',22,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',4,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,199,90,NULL,1,NULL,FALSE,NULL,'{3}',NULL);
INSERT INTO stats VALUES('LEP',7,199,90,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
INSERT INTO stats VALUES('LEP',11,199,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',21,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('LEP',8,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('LEP',9,199,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
--26. match--
INSERT INTO stats VALUES('LEP',1,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',27,202,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('LEP',4,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',7,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,202,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',13,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,202,70,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('LEP',8,202,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,202,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',16,202,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,202,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('LEP',21,202,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('LEP',1,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,216,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('LEP',2,216,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('LEP',22,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,216,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('LEP',8,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,216,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('LEP',7,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',23,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',9,216,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('LEP',1,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,217,90,NULL,1,'{"yellow"}',FALSE,NULL,'{76}','{80}');
INSERT INTO stats VALUES('LEP',22,217,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('LEP',4,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,217,90,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{72}');
INSERT INTO stats VALUES('LEP',7,217,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('LEP',8,217,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('LEP',10,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',11,217,70,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('LEP',13,217,90,1,1,NULL,FALSE,'{13}','{56}',NULL);
INSERT INTO stats VALUES('LEP',16,217,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
--subs--
INSERT INTO stats VALUES('LEP',19,217,45,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{88}');
INSERT INTO stats VALUES('LEP',21,217,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('LEP',1,232,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,232,90,1,NULL,NULL,FALSE,'{47}',NULL,NULL);
INSERT INTO stats VALUES('LEP',6,232,90,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('LEP',5,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',52,232,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('LEP',7,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',20,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,232,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('LEP',10,232,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('LEP',11,232,90,1,NULL,'{"yellow"}',FALSE,'{11}',NULL,'{78}');
INSERT INTO stats VALUES('LEP',19,232,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('LEP',9,232,45,NULL,3,NULL,FALSE,NULL,'{47,67,90}',NULL);
INSERT INTO stats VALUES('LEP',13,232,30,1,NULL,'{"yellow"}',FALSE,'{90}',NULL,'{88}');
--30. match--
INSERT INTO stats VALUES('LEP',1,234,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',6,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',5,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',2,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',22,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',10,234,90,1,1,NULL,FALSE,'{61}','{49}',NULL);
INSERT INTO stats VALUES('LEP',11,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('LEP',8,234,90,1,1,NULL,FALSE,'{49}','{20}',NULL);
INSERT INTO stats VALUES('LEP',13,234,90,2,1,NULL,FALSE,'{2,20}','{61}',NULL);
INSERT INTO stats VALUES('LEP',7,234,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('LEP',16,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--PRE--
--1. match--
INSERT INTO stats VALUES('PRE',1,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',66,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,8,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
INSERT INTO stats VALUES('PRE',11,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,8,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('PRE',15,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',18,8,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,8,16,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
--2. match--
INSERT INTO stats VALUES('PRE',1,10,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PRE',4,10,90,1,NULL,NULL,FALSE,'{60}',NULL,NULL);
INSERT INTO stats VALUES('PRE',19,10,90,2,NULL,NULL,FALSE,'{12,85}',NULL,NULL);
INSERT INTO stats VALUES('PRE',5,10,90,1,NULL,NULL,FALSE,'{57}',NULL,NULL);
INSERT INTO stats VALUES('PRE',6,10,90,1,NULL,NULL,FALSE,'{43}',NULL,NULL);
INSERT INTO stats VALUES('PRE',11,10,90,1,NULL,NULL,FALSE,'{17}',NULL,NULL);
INSERT INTO stats VALUES('PRE',21,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,10,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('PRE',7,10,90,NULL,1,'{"yellow"}',FALSE,NULL,'{43}','{77}');
INSERT INTO stats VALUES('PRE',14,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,10,82,NULL,3,'{"yellow"}',FALSE,NULL,'{17,57,60}','{55}');
--subs--
INSERT INTO stats VALUES('PRE',18,10,8,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{90}');
--3. match--
INSERT INTO stats VALUES('PRE',1,23,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',66,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',34,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',93,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('PRE',1,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('PRE',6,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('PRE',3,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('PRE',4,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PRE',19,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('PRE',11,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,27,90,1,NULL,'{"yellow"}',FALSE,'{14}',NULL,'{51}');
INSERT INTO stats VALUES('PRE',14,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PRE',13,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('PRE',23,27,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
--5. match--
INSERT INTO stats VALUES('PRE',12,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,38,90,1,NULL,'{"yellow"}',FALSE,'{12}',NULL,'{44}');
INSERT INTO stats VALUES('PRE',3,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,38,90,NULL,1,NULL,FALSE,NULL,'{55}',NULL);
INSERT INTO stats VALUES('PRE',93,38,90,1,NULL,NULL,FALSE,'{55}',NULL,NULL);
INSERT INTO stats VALUES('PRE',15,38,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('PRE',13,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('PRE',1,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('PRE',4,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',36,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('PRE',19,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('PRE',13,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',21,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('PRE',7,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',93,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PRE',18,44,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,44,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('PRE',1,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,53,90,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('PRE',5,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('PRE',14,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PRE',13,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',23,53,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,53,35,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{67}');
--8. match--
INSERT INTO stats VALUES('PRE',1,61,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('PRE',4,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('PRE',66,61,90,NULL,1,'{"yellow"}',FALSE,NULL,'{22}','{66}');
INSERT INTO stats VALUES('PRE',3,61,90,1,1,NULL,FALSE,'{22}','{51}',NULL);
INSERT INTO stats VALUES('PRE',14,61,90,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
INSERT INTO stats VALUES('PRE',7,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',15,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,61,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',18,61,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
--9. match--
INSERT INTO stats VALUES('PRE',1,68,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('PRE',5,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('PRE',36,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,68,90,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{90}');
INSERT INTO stats VALUES('PRE',13,68,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,68,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{89}');
INSERT INTO stats VALUES('PRE',16,68,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('PRE',9,68,88,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,68,2,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--10. match--
INSERT INTO stats VALUES('PRE',1,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',34,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,78,90,1,NULL,NULL,FALSE,'{50}',NULL,NULL);
INSERT INTO stats VALUES('PRE',3,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,78,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('PRE',21,78,90,NULL,1,NULL,FALSE,NULL,'{50}',NULL);
INSERT INTO stats VALUES('PRE',11,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,78,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,78,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,78,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--11. match--
INSERT INTO stats VALUES('PRE',1,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,83,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('PRE',6,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,83,90,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
INSERT INTO stats VALUES('PRE',5,83,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('PRE',11,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,83,90,NULL,2,NULL,FALSE,NULL,'{32,66}',NULL);
INSERT INTO stats VALUES('PRE',7,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,83,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,83,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
--12. match--
INSERT INTO stats VALUES('PRE',12,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',36,95,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PRE',3,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,95,90,1,NULL,'{"yellow"}',FALSE,'{41}',NULL,'{89}');
INSERT INTO stats VALUES('PRE',34,95,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('PRE',7,95,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,95,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('PRE',13,95,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',16,95,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,95,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',18,95,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
--subs--
INSERT INTO stats VALUES('PRE',23,95,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,95,22,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PRE',15,95,8,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--13. match--
INSERT INTO stats VALUES('PRE',12,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,98,90,1,NULL,NULL,FALSE,'{35}',NULL,NULL);
INSERT INTO stats VALUES('PRE',19,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,98,90,NULL,1,NULL,FALSE,NULL,'{35}',NULL);
INSERT INTO stats VALUES('PRE',21,98,90,1,NULL,NULL,FALSE,'{34}',NULL,NULL);
INSERT INTO stats VALUES('PRE',93,98,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,98,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,98,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,98,90,NULL,1,NULL,FALSE,NULL,'{34}',NULL);
INSERT INTO stats VALUES('PRE',9,98,72,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,98,18,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,98,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,98,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--14. match--
INSERT INTO stats VALUES('PRE',68,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PRE',19,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('PRE',3,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',13,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,112,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('PRE',7,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,112,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',23,112,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,112,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('PRE',1,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,113,90,1,1,NULL,FALSE,'{32}','{8}',NULL);
INSERT INTO stats VALUES('PRE',4,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,113,90,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('PRE',93,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,113,90,1,NULL,NULL,FALSE,'{8}',NULL,NULL);
INSERT INTO stats VALUES('PRE',77,113,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,113,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('PRE',1,128,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,128,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('PRE',4,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,128,90,NULL,1,NULL,FALSE,NULL,'{1}',NULL);
INSERT INTO stats VALUES('PRE',13,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,128,69,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('PRE',15,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',23,128,62,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,128,28,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('PRE',1,130,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('PRE',6,130,90,1,NULL,'{"yellow"}',FALSE,'{15}',NULL,'{87}');
INSERT INTO stats VALUES('PRE',3,130,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('PRE',19,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,130,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('PRE',93,130,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{77}');
INSERT INTO stats VALUES('PRE',11,130,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('PRE',13,130,90,NULL,1,'{"yellow"}',FALSE,NULL,'{40}','{86}');
INSERT INTO stats VALUES('PRE',7,130,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('PRE',14,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',18,130,61,1,NULL,'{"yellow"}',FALSE,'{40}',NULL,'{11}');
--subs--
INSERT INTO stats VALUES('PRE',23,130,29,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--18. match--
INSERT INTO stats VALUES('PRE',1,143,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('PRE',3,143,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PRE',4,143,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,143,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,143,90,NULL,1,NULL,FALSE,NULL,'{8}',NULL);
INSERT INTO stats VALUES('PRE',93,143,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,143,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,143,90,1,NULL,NULL,FALSE,'{48}',NULL,NULL);
INSERT INTO stats VALUES('PRE',23,143,45,1,NULL,NULL,FALSE,'{8}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,143,45,NULL,1,NULL,FALSE,NULL,'{48}',NULL);
INSERT INTO stats VALUES('PRE',11,143,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('PRE',1,147,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PRE',5,147,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('PRE',34,147,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('PRE',19,147,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('PRE',6,147,90,NULL,1,'{"yellow"}',FALSE,NULL,'{51}','{55}');
INSERT INTO stats VALUES('PRE',7,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,147,79,1,1,'{"yellow","yellow","red"}',FALSE,'{51}','{11}','{4,79,79}');
INSERT INTO stats VALUES('PRE',11,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,147,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('PRE',9,147,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
--20. match--
INSERT INTO stats VALUES('PRE',1,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,158,90,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
INSERT INTO stats VALUES('PRE',5,158,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('PRE',19,158,90,1,NULL,NULL,FALSE,'{34}',NULL,NULL);
INSERT INTO stats VALUES('PRE',3,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,158,88,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,158,90,1,1,NULL,FALSE,'{12}','{34}',NULL);
INSERT INTO stats VALUES('PRE',7,158,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,158,90,1,2,NULL,FALSE,'{89}','{12,65}',NULL);
INSERT INTO stats VALUES('PRE',9,158,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,158,45,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('PRE',21,158,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',93,158,2,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('PRE',1,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,164,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
INSERT INTO stats VALUES('PRE',3,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('PRE',5,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,164,90,1,NULL,'{"yellow"}',FALSE,'{14}',NULL,'{76}');
INSERT INTO stats VALUES('PRE',13,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('PRE',14,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PRE',16,164,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('PRE',23,164,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,164,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,164,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('PRE',1,173,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,173,90,NULL,1,NULL,FALSE,NULL,'{4}',NULL);
INSERT INTO stats VALUES('PRE',34,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,173,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('PRE',6,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,173,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('PRE',21,173,90,NULL,1,'{"yellow"}',FALSE,NULL,'{66}','{23}');
INSERT INTO stats VALUES('PRE',7,173,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('PRE',16,173,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('PRE',15,173,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',23,173,81,1,NULL,'{"yellow"}',FALSE,'{4}',NULL,'{31}');
--subs--
INSERT INTO stats VALUES('PRE',9,173,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('PRE',1,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,181,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('PRE',13,181,83,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('PRE',15,181,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',93,181,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,181,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,181,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,181,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,181,7,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('PRE',1,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',34,188,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('PRE',3,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,188,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('PRE',93,188,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('PRE',7,188,90,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
INSERT INTO stats VALUES('PRE',14,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,188,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,188,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',23,188,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,188,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,188,26,NULL,1,NULL,FALSE,NULL,'{69}',NULL);
--25. match--
INSERT INTO stats VALUES('PRE',1,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',36,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',6,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,198,82,NULL,1,'{"yellow","red"}',FALSE,NULL,'{64}','{56,82}');
INSERT INTO stats VALUES('PRE',14,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,198,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,198,62,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('PRE',9,198,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('PRE',77,198,45,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{76}');
INSERT INTO stats VALUES('PRE',13,198,28,1,1,NULL,FALSE,'{64}','{67}',NULL);
--26. match--
INSERT INTO stats VALUES('PRE',1,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,203,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('PRE',6,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',36,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,203,90,NULL,1,NULL,FALSE,NULL,'{57}',NULL);
INSERT INTO stats VALUES('PRE',11,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,203,90,1,NULL,NULL,FALSE,'{57}',NULL,NULL);
INSERT INTO stats VALUES('PRE',9,203,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('PRE',76,215,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',19,215,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PRE',4,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',34,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,215,57,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,215,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,215,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,215,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,215,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,215,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,215,33,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('PRE',1,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('PRE',34,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('PRE',19,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('PRE',4,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('PRE',5,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('PRE',14,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,218,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('PRE',11,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('PRE',13,218,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PRE',18,218,69,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',9,218,21,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('PRE',68,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,232,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('PRE',19,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',5,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',3,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',13,232,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',11,232,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',16,232,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',9,232,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('PRE',18,232,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',15,232,31,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('PRE',21,232,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('PRE',1,233,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('PRE',3,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',36,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',4,233,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('PRE',19,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',21,233,90,NULL,1,'{"yellow"}',FALSE,NULL,'{3}','{35}');
INSERT INTO stats VALUES('PRE',13,233,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('PRE',93,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',7,233,77,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('PRE',15,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',18,233,60,1,NULL,'{"yellow"}',FALSE,'{3}',NULL,'{49}');
--subs--
INSERT INTO stats VALUES('PRE',9,233,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('PRE',14,233,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');

--DRA--
--1. match--
INSERT INTO stats VALUES('DRA',1,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,8,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('DRA',5,8,90,1,NULL,NULL,FALSE,'{15}',NULL,NULL);
INSERT INTO stats VALUES('DRA',18,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,8,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,8,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('DRA',10,8,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('DRA',11,8,90,NULL,1,'{"yellow"}',FALSE,NULL,'{11}','{35}');
INSERT INTO stats VALUES('DRA',27,8,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,8,73,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',16,8,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,8,45,NULL,1,NULL,FALSE,NULL,'{66}',NULL);
--2. match--
INSERT INTO stats VALUES('DRA',1,9,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('DRA',5,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('DRA',4,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,9,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,9,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,9,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',21,9,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,9,45,1,NULL,'{"yellow"}',FALSE,'{78}',NULL,'{89}');
INSERT INTO stats VALUES('DRA',7,9,30,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{79}');
--3. match--
INSERT INTO stats VALUES('DRA',1,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',26,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,24,90,1,NULL,'{"yellow"}',FALSE,'{12}',NULL,'{44}');
INSERT INTO stats VALUES('DRA',8,24,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('DRA',10,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,24,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('DRA',13,24,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('DRA',9,24,76,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{76}');
--4. match--
INSERT INTO stats VALUES('DRA',1,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,26,90,NULL,2,'{"yellow"}',FALSE,NULL,'{12,53}','{78}');
INSERT INTO stats VALUES('DRA',18,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,26,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('DRA',27,26,90,2,NULL,NULL,FALSE,'{53,65}',NULL,NULL);
INSERT INTO stats VALUES('DRA',11,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,26,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('DRA',8,26,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,26,78,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('DRA',21,26,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',16,26,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('DRA',76,26,31,NULL,1,'{"yellow"}',FALSE,NULL,'{65}','{85}');
INSERT INTO stats VALUES('DRA',17,26,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('DRA',1,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',24,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,39,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('DRA',4,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,39,90,1,NULL,'{"yellow"}',FALSE,'{65}',NULL,'{80}');
INSERT INTO stats VALUES('DRA',13,39,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('DRA',8,39,90,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('DRA',10,39,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('DRA',7,39,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('DRA',11,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('DRA',1,43,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',22,43,90,3,1,NULL,FALSE,'{3,5,90}','{78}',NULL);
INSERT INTO stats VALUES('DRA',2,43,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('DRA',5,43,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,43,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('DRA',27,43,90,NULL,2,NULL,FALSE,NULL,'{3,5}',NULL);
INSERT INTO stats VALUES('DRA',11,43,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('DRA',10,43,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,43,75,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('DRA',13,43,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',91,43,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,43,30,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('DRA',7,43,15,1,NULL,'{"yellow"}',FALSE,'{78}',NULL,'{82}');
INSERT INTO stats VALUES('DRA',76,43,45,NULL,2,'{"yellow"}',FALSE,NULL,'{67,90}','{80}');
--7. match--
INSERT INTO stats VALUES('DRA',1,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',26,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('DRA',3,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',24,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('DRA',8,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,54,90,1,NULL,'{"yellow"}',FALSE,'{60}',NULL,'{66}');
INSERT INTO stats VALUES('DRA',7,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{5}');
INSERT INTO stats VALUES('DRA',27,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,54,65,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
--subs--
INSERT INTO stats VALUES('DRA',21,54,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--8. match--
INSERT INTO stats VALUES('DRA',1,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,60,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('DRA',2,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,60,90,1,NULL,'{"yellow"}',FALSE,'{2}',NULL,'{79}');
INSERT INTO stats VALUES('DRA',27,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,60,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,60,90,NULL,1,NULL,FALSE,NULL,'{54}',NULL);
INSERT INTO stats VALUES('DRA',9,60,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',21,60,22,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('DRA',8,60,45,1,NULL,NULL,FALSE,'{54}',NULL,NULL);
--9. match--
INSERT INTO stats VALUES('DRA',1,69,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',18,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',26,69,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,69,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('DRA',3,69,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('DRA',7,69,90,1,NULL,NULL,FALSE,'{45}',NULL,NULL);
INSERT INTO stats VALUES('DRA',10,69,45,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('DRA',76,69,90,NULL,1,'{"yellow"}',FALSE,NULL,'{71}','{65}');
INSERT INTO stats VALUES('DRA',17,69,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('DRA',8,69,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('DRA',16,69,70,NULL,1,'{"yellow"}',FALSE,NULL,'{45}','{66}');
--subs--
INSERT INTO stats VALUES('DRA',9,69,20,1,1,'{"yellow"}',FALSE,'{71}','{85}','{73}');
INSERT INTO stats VALUES('DRA',11,69,45,1,NULL,'{"yellow"}',FALSE,'{85}',NULL,'{49}');
--10. match--
INSERT INTO stats VALUES('DRA',1,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',24,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',22,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,77,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,77,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',91,77,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('DRA',1,84,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('DRA',5,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,84,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('DRA',18,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,84,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,84,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('DRA',10,84,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('DRA',13,84,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,84,81,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
--subs--
INSERT INTO stats VALUES('DRA',91,84,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,84,30,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('DRA',17,84,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
--12. match--
INSERT INTO stats VALUES('DRA',12,94,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,94,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('DRA',17,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,94,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,94,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,94,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--13. match--
INSERT INTO stats VALUES('DRA',1,99,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,99,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('DRA',22,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,99,90,NULL,1,NULL,FALSE,NULL,'{58}',NULL);
INSERT INTO stats VALUES('DRA',11,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,99,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,99,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{89}');
INSERT INTO stats VALUES('DRA',7,99,90,1,NULL,NULL,FALSE,'{58}',NULL,NULL);
INSERT INTO stats VALUES('DRA',27,99,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('DRA',16,99,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,99,45,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--14. match--
INSERT INTO stats VALUES('DRA',1,111,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,111,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('DRA',10,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,111,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',21,111,75,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
--subs--
INSERT INTO stats VALUES('DRA',9,111,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('DRA',12,114,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',26,114,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',18,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',22,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,114,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('DRA',7,114,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,114,60,NULL,1,NULL,FALSE,NULL,'{3}',NULL);
INSERT INTO stats VALUES('DRA',13,114,90,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
INSERT INTO stats VALUES('DRA',91,114,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('DRA',21,114,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,114,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
--16. match--
INSERT INTO stats VALUES('DRA',1,128,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,128,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('DRA',5,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,128,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('DRA',17,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,128,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('DRA',11,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,128,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('DRA',9,128,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('DRA',1,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,129,90,NULL,1,NULL,FALSE,NULL,'{61}',NULL);
INSERT INTO stats VALUES('DRA',5,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,129,90,1,NULL,NULL,FALSE,'{61}',NULL,NULL);
INSERT INTO stats VALUES('DRA',16,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('DRA',1,144,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',24,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,144,90,1,1,NULL,FALSE,'{32}','{66}',NULL);
INSERT INTO stats VALUES('DRA',2,144,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('DRA',26,144,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('DRA',13,144,90,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('DRA',17,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,144,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,144,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('DRA',7,144,57,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,144,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,144,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,144,33,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,144,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('DRA',1,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',22,146,90,NULL,1,NULL,FALSE,NULL,'{54}',NULL);
INSERT INTO stats VALUES('DRA',7,146,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('DRA',10,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,146,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('DRA',11,146,74,1,NULL,NULL,FALSE,'{54}',NULL,NULL);
INSERT INTO stats VALUES('DRA',17,146,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,146,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,146,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,146,16,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('DRA',27,146,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('DRA',12,159,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{59}');
INSERT INTO stats VALUES('DRA',3,159,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('DRA',5,159,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('DRA',2,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,159,90,1,NULL,'{"yellow"}',FALSE,'{23}',NULL,'{57}');
INSERT INTO stats VALUES('DRA',76,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('DRA',7,159,90,NULL,1,NULL,FALSE,NULL,'{76}',NULL);
INSERT INTO stats VALUES('DRA',10,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,159,90,1,NULL,'{"yellow"}',FALSE,'{87}',NULL,'{51}');
INSERT INTO stats VALUES('DRA',9,159,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',16,159,45,2,1,NULL,FALSE,'{47,76}','{87}',NULL);
--21. match--
INSERT INTO stats VALUES('DRA',1,163,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',3,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,163,90,1,NULL,'{"yellow"}',FALSE,'{55}',NULL,'{35}');
INSERT INTO stats VALUES('DRA',18,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,163,90,NULL,1,'{"yellow"}',FALSE,NULL,'{55}','{71}');
INSERT INTO stats VALUES('DRA',17,163,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('DRA',13,163,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('DRA',8,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,163,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,163,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
--subs--
INSERT INTO stats VALUES('DRA',16,163,45,NULL,1,NULL,FALSE,NULL,'{72}',NULL);
INSERT INTO stats VALUES('DRA',27,163,23,1,NULL,'{"yellow"}',FALSE,'{72}',NULL,'{87}');
--22. match--
INSERT INTO stats VALUES('DRA',1,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',24,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,174,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('DRA',7,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,174,90,NULL,1,NULL,FALSE,NULL,'{55}',NULL);
INSERT INTO stats VALUES('DRA',27,174,90,1,NULL,NULL,FALSE,'{55}',NULL,NULL);
INSERT INTO stats VALUES('DRA',8,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('DRA',1,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,180,90,1,NULL,NULL,FALSE,'{5}',NULL,NULL);
INSERT INTO stats VALUES('DRA',18,180,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('DRA',4,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,180,90,NULL,1,NULL,FALSE,NULL,'{5}',NULL);
INSERT INTO stats VALUES('DRA',10,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,180,90,1,NULL,NULL,FALSE,'{15}',NULL,NULL);
--24. match--
INSERT INTO stats VALUES('DRA',1,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('DRA',3,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('DRA',5,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,189,90,1,NULL,'{"yellow"}',FALSE,'{23}',NULL,'{66}');
INSERT INTO stats VALUES('DRA',11,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('DRA',7,189,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',13,189,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{16}');
INSERT INTO stats VALUES('DRA',16,189,82,NULL,1,'{"yellow"}',FALSE,NULL,'{23}','{51}');
--subs--
INSERT INTO stats VALUES('DRA',9,189,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('DRA',1,197,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('DRA',4,197,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('DRA',22,197,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,197,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('DRA',3,197,90,1,NULL,NULL,FALSE,'{59}',NULL,NULL);
INSERT INTO stats VALUES('DRA',11,197,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('DRA',10,197,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('DRA',13,197,90,NULL,1,'{"yellow"}',FALSE,NULL,'{77}','{41}');
INSERT INTO stats VALUES('DRA',27,197,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',76,197,90,NULL,2,NULL,FALSE,NULL,'{56,59}',NULL);
INSERT INTO stats VALUES('DRA',16,197,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,197,23,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('DRA',17,197,45,2,NULL,'{"yellow"}',FALSE,'{56,77}',NULL,'{65}');
--26. match--
INSERT INTO stats VALUES('DRA',12,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,204,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('DRA',3,204,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('DRA',2,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',22,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,204,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,204,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('DRA',13,204,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,204,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,204,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('DRA',16,204,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',9,204,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,204,45,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
INSERT INTO stats VALUES('DRA',76,204,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('DRA',1,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',2,214,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('DRA',18,214,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,214,90,1,1,NULL,FALSE,'{12}','{66}',NULL);
INSERT INTO stats VALUES('DRA',8,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('DRA',10,214,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('DRA',27,214,90,NULL,1,NULL,FALSE,NULL,'{31}',NULL);
INSERT INTO stats VALUES('DRA',17,214,90,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{71}');
INSERT INTO stats VALUES('DRA',7,214,90,1,NULL,'{"yellow"}',FALSE,'{31}',NULL,'{55}');
INSERT INTO stats VALUES('DRA',9,214,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',21,214,45,2,NULL,'{"yellow"}',FALSE,'{66,78}',NULL,'{88}');
--28. match--
INSERT INTO stats VALUES('DRA',1,219,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,219,90,1,1,'{"yellow"}',FALSE,'{34}','{1}','{68}');
INSERT INTO stats VALUES('DRA',2,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,219,90,1,NULL,'{"yellow"}',FALSE,'{1}',NULL,'{90}');
INSERT INTO stats VALUES('DRA',5,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',13,219,90,NULL,1,'{"yellow"}',FALSE,NULL,'{56}','{12}');
INSERT INTO stats VALUES('DRA',10,219,90,1,1,NULL,FALSE,'{56}','{34}',NULL);
INSERT INTO stats VALUES('DRA',11,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('DRA',8,219,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('DRA',9,219,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
--29. match--
INSERT INTO stats VALUES('DRA',72,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',3,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',26,231,90,NULL,1,'{"yellow"}',FALSE,NULL,'{32}','{29}');
INSERT INTO stats VALUES('DRA',24,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,231,90,NULL,1,NULL,FALSE,NULL,'{68}',NULL);
INSERT INTO stats VALUES('DRA',13,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,231,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,231,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',17,231,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',9,231,60,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('DRA',16,231,30,1,NULL,NULL,FALSE,'{68}',NULL,NULL);
INSERT INTO stats VALUES('DRA',8,231,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',27,231,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('DRA',1,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',4,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',24,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',5,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',18,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',7,234,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('DRA',27,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',10,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',8,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',11,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('DRA',16,234,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--FKK--
--1. match--
INSERT INTO stats VALUES('FKK',1,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('FKK',2,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',23,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,7,90,NULL,1,'{"yellow"}',FALSE,NULL,'{34}','{55}');
INSERT INTO stats VALUES('FKK',17,7,90,1,NULL,NULL,FALSE,'{34}',NULL,NULL);
--2. match--
INSERT INTO stats VALUES('FKK',1,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,10,90,1,NULL,'{"yellow"}',FALSE,'{34}',NULL,'{67}');
INSERT INTO stats VALUES('FKK',5,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,10,90,NULL,1,'{"yellow"}',FALSE,NULL,'{34}','{51}');
INSERT INTO stats VALUES('FKK',91,10,90,1,NULL,'{"yellow"}',FALSE,'{22}',NULL,'{88}');
INSERT INTO stats VALUES('FKK',31,10,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,10,84,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FKK',19,10,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,10,65,NULL,1,NULL,FALSE,NULL,'{22}',NULL);
--subs--
INSERT INTO stats VALUES('FKK',13,10,25,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('FKK',24,10,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,10,6,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('FKK',1,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,24,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('FKK',3,24,90,NULL,1,NULL,FALSE,NULL,'{31}',NULL);
INSERT INTO stats VALUES('FKK',2,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,24,90,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
INSERT INTO stats VALUES('FKK',31,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,24,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,24,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('FKK',11,24,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',13,24,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',9,24,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,24,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,24,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('FKK',1,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',29,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',23,25,90,1,NULL,'{"yellow"}',FALSE,'{78}',NULL,'{90}');
INSERT INTO stats VALUES('FKK',19,25,90,1,1,'{"yellow"}',FALSE,'{11}','{78}','{53}');
INSERT INTO stats VALUES('FKK',91,25,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('FKK',11,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',13,25,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',90,25,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('FKK',1,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,40,90,NULL,1,'{"yellow"}',FALSE,NULL,'{22}','{77}');
INSERT INTO stats VALUES('FKK',20,40,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',6,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,40,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('FKK',11,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,40,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('FKK',19,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,40,90,1,2,NULL,FALSE,'{22}','{51,70}',NULL);
INSERT INTO stats VALUES('FKK',28,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,40,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('FKK',17,40,45,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
--6. match--
INSERT INTO stats VALUES('FKK',93,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',5,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('FKK',3,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('FKK',2,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FKK',19,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('FKK',11,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,42,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,42,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,42,90,NULL,1,'{"yellow"}',FALSE,NULL,'{82}','{54}');
INSERT INTO stats VALUES('FKK',9,42,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',90,42,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('FKK',7,42,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('FKK',24,42,19,1,NULL,NULL,FALSE,'{82}',NULL,NULL);
--7. match--
INSERT INTO stats VALUES('FKK',1,55,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,55,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKK',6,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,55,69,1,NULL,NULL,FALSE,'{27}',NULL,NULL);
INSERT INTO stats VALUES('FKK',11,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,55,57,NULL,1,NULL,FALSE,NULL,'{27}',NULL);
--subs--
INSERT INTO stats VALUES('FKK',9,55,33,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,55,21,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
--8. match--
INSERT INTO stats VALUES('FKK',1,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,59,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FKK',20,59,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{64}');
INSERT INTO stats VALUES('FKK',3,59,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('FKK',7,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,59,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKK',31,59,90,NULL,1,'{"yellow"}',FALSE,NULL,'{52}','{57}');
INSERT INTO stats VALUES('FKK',19,59,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('FKK',9,59,63,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
--subs--
INSERT INTO stats VALUES('FKK',90,59,27,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKK',24,59,45,1,NULL,NULL,FALSE,'{52}',NULL,NULL);
--9. match--
INSERT INTO stats VALUES('FKK',1,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FKK',3,70,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('FKK',20,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('FKK',28,70,90,2,NULL,'{"yellow"}',FALSE,'{2,60}',NULL,'{31}');
INSERT INTO stats VALUES('FKK',11,70,90,1,NULL,'{"yellow"}',FALSE,'{15}',NULL,'{90}');
INSERT INTO stats VALUES('FKK',24,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKK',91,70,78,NULL,1,'{"yellow","red"}',FALSE,NULL,'{23}','{17,78}');
INSERT INTO stats VALUES('FKK',19,70,88,1,3,'{"yellow","yellow","red"}',FALSE,'{23}','{15,60,67}','{43,88,88}');
INSERT INTO stats VALUES('FKK',17,70,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{39}');
--subs--
INSERT INTO stats VALUES('FKK',90,70,45,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--10. match--
INSERT INTO stats VALUES('FKK',12,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,76,90,1,1,NULL,FALSE,'{23}','{49}',NULL);
INSERT INTO stats VALUES('FKK',5,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,76,90,1,NULL,NULL,FALSE,'{60}',NULL,NULL);
INSERT INTO stats VALUES('FKK',11,76,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,76,90,NULL,2,NULL,FALSE,NULL,'{52,60}',NULL);
INSERT INTO stats VALUES('FKK',31,76,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FKK',13,76,45,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
--subs--
INSERT INTO stats VALUES('FKK',9,76,45,2,NULL,NULL,FALSE,'{49,52}',NULL,NULL);
--11. match--
INSERT INTO stats VALUES('FKK',1,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,85,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('FKK',1,93,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FKK',5,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',23,93,90,2,NULL,'{"yellow"}',FALSE,'{24,76}',NULL,'{85}');
INSERT INTO stats VALUES('FKK',20,93,90,NULL,3,'{"yellow"}',FALSE,NULL,'{24,55,89}','{11}');
INSERT INTO stats VALUES('FKK',6,93,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('FKK',10,93,90,NULL,2,'{"yellow"}',FALSE,NULL,'{76,80}','{42}');
INSERT INTO stats VALUES('FKK',11,93,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('FKK',7,93,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,93,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,93,90,2,NULL,NULL,FALSE,'{55,80}',NULL,NULL);
INSERT INTO stats VALUES('FKK',9,93,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',90,93,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,93,45,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
--13. match--
INSERT INTO stats VALUES('FKK',12,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,100,90,NULL,1,'{"yellow"}',FALSE,NULL,'{33}','{56}');
INSERT INTO stats VALUES('FKK',20,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,100,90,1,NULL,NULL,FALSE,'{49}',NULL,NULL);
INSERT INTO stats VALUES('FKK',31,100,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',90,100,90,1,1,NULL,FALSE,'{33}','{49}',NULL);
--14. match--
INSERT INTO stats VALUES('FKK',1,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,110,90,2,2,NULL,FALSE,'{20,87}','{11,54}',NULL);
INSERT INTO stats VALUES('FKK',20,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,110,90,NULL,1,NULL,FALSE,NULL,'{20}',NULL);
INSERT INTO stats VALUES('FKK',5,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,110,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('FKK',11,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,110,90,2,NULL,NULL,FALSE,'{11,54}',NULL,NULL);
INSERT INTO stats VALUES('FKK',19,110,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,110,90,NULL,1,'{"yellow"}',FALSE,NULL,'{87}','{90}');
--15. match--
INSERT INTO stats VALUES('FKK',1,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',29,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,115,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('FKK',1,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',29,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('FKK',6,127,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('FKK',5,127,90,NULL,1,'{"yellow"}',FALSE,NULL,'{23}','{56}');
INSERT INTO stats VALUES('FKK',3,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,127,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('FKK',7,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,127,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,127,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,127,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,127,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',13,127,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,127,32,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,127,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('FKK',1,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,130,69,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{5,69,69}');
INSERT INTO stats VALUES('FKK',29,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,130,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,130,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,130,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',90,130,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,130,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('FKK',12,144,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FKK',20,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,144,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('FKK',5,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,144,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('FKK',19,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,144,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('FKK',1,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,145,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{17}');
INSERT INTO stats VALUES('FKK',6,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('FKK',5,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKK',2,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('FKK',19,145,90,NULL,2,NULL,FALSE,NULL,'{64,70}',NULL);
INSERT INTO stats VALUES('FKK',24,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,145,90,2,NULL,NULL,FALSE,'{12,70}',NULL,NULL);
INSERT INTO stats VALUES('FKK',10,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FKK',7,145,90,1,NULL,NULL,FALSE,'{64}',NULL,NULL);
INSERT INTO stats VALUES('FKK',17,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('FKK',1,160,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKK',20,160,90,NULL,1,'{"yellow"}',FALSE,NULL,'{31}','{75}');
INSERT INTO stats VALUES('FKK',6,160,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('FKK',5,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,160,90,NULL,1,'{"yellow"}',FALSE,NULL,'{45}','{66}');
INSERT INTO stats VALUES('FKK',28,160,90,2,1,NULL,FALSE,'{31,45}','{67}',NULL);
INSERT INTO stats VALUES('FKK',19,160,90,1,NULL,NULL,FALSE,'{70}',NULL,NULL);
INSERT INTO stats VALUES('FKK',91,160,90,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
INSERT INTO stats VALUES('FKK',7,160,90,NULL,1,NULL,FALSE,NULL,'{70}',NULL);
INSERT INTO stats VALUES('FKK',11,160,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,160,70,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
--subs--
INSERT INTO stats VALUES('FKK',13,160,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKK',31,160,40,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{85}');
--21. match--
INSERT INTO stats VALUES('FKK',1,162,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKK',2,162,90,NULL,2,'{"yellow"}',FALSE,NULL,'{11,44}','{56}');
INSERT INTO stats VALUES('FKK',3,162,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('FKK',29,162,90,2,NULL,'{"yellow"}',FALSE,'{11,47}',NULL,'{73}');
INSERT INTO stats VALUES('FKK',20,162,90,NULL,3,'{"yellow"}',FALSE,NULL,'{47,56,78}','{62}');
INSERT INTO stats VALUES('FKK',10,162,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('FKK',28,162,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{71}');
INSERT INTO stats VALUES('FKK',19,162,90,1,1,NULL,FALSE,'{56}','{90}',NULL);
INSERT INTO stats VALUES('FKK',11,162,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',7,162,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FKK',13,162,90,1,NULL,NULL,FALSE,'{90}',NULL,NULL);
--22. match--
INSERT INTO stats VALUES('FKK',1,175,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKK',2,175,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('FKK',5,175,90,1,NULL,'{"yellow"}',FALSE,'{73}',NULL,'{43}');
INSERT INTO stats VALUES('FKK',26,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,175,90,NULL,1,NULL,FALSE,NULL,'{51}',NULL);
INSERT INTO stats VALUES('FKK',24,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,175,90,1,NULL,NULL,FALSE,'{51}',NULL,NULL);
INSERT INTO stats VALUES('FKK',7,175,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{60}');
INSERT INTO stats VALUES('FKK',28,175,85,1,NULL,NULL,FALSE,'{15}',NULL,NULL);
INSERT INTO stats VALUES('FKK',10,175,78,NULL,1,'{"yellow","yellow","red"}',FALSE,NULL,'{15}','{13,78,78}');
INSERT INTO stats VALUES('FKK',13,175,76,NULL,1,NULL,FALSE,NULL,'{73}',NULL);
--subs--
INSERT INTO stats VALUES('FKK',9,175,14,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('FKK',19,175,5,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('FKK',1,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',23,179,90,NULL,1,NULL,FALSE,NULL,'{85}',NULL);
INSERT INTO stats VALUES('FKK',2,179,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKK',5,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,179,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',13,179,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',17,179,10,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('FKK',19,179,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('FKK',1,190,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('FKK',2,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('FKK',3,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,190,90,NULL,1,'{"yellow"}',FALSE,NULL,'{54}','{40}');
INSERT INTO stats VALUES('FKK',7,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,190,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,190,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,190,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',17,190,70,1,NULL,'{"yellow","red"}',FALSE,'{54}',NULL,'{43,70}');
--subs--
INSERT INTO stats VALUES('FKK',9,190,19,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FKK',10,190,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('FKK',24,190,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('FKK',1,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,196,90,2,2,NULL,FALSE,'{23,70}','{69,85}',NULL);
INSERT INTO stats VALUES('FKK',2,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,196,90,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
INSERT INTO stats VALUES('FKK',23,196,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('FKK',7,196,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('FKK',10,196,90,1,NULL,'{"yellow"}',FALSE,'{85}',NULL,'{51}');
INSERT INTO stats VALUES('FKK',28,196,90,1,1,NULL,FALSE,'{11}','{70}',NULL);
INSERT INTO stats VALUES('FKK',31,196,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('FKK',24,196,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,196,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',13,196,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--26. match--
INSERT INTO stats VALUES('FKK',1,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,205,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKK',20,205,90,1,NULL,'{"yellow"}',FALSE,'{12}',NULL,'{54}');
INSERT INTO stats VALUES('FKK',23,205,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKK',19,205,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('FKK',31,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',10,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,205,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('FKK',13,205,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('FKK',12,213,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',29,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,213,90,NULL,1,'{"yellow"}',FALSE,NULL,'{60}','{78}');
INSERT INTO stats VALUES('FKK',20,213,90,1,1,NULL,FALSE,'{47}','{23}',NULL);
INSERT INTO stats VALUES('FKK',7,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,213,90,1,NULL,NULL,FALSE,'{60}',NULL,NULL);
INSERT INTO stats VALUES('FKK',19,213,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,213,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',13,213,45,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',17,213,45,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('FKK',28,213,32,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('FKK',1,220,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('FKK',3,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',6,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',5,220,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FKK',10,220,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('FKK',19,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',7,220,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('FKK',28,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',91,220,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',9,220,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',17,220,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('FKK',1,230,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKK',3,230,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FKK',23,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',2,230,90,NULL,1,NULL,FALSE,NULL,'{1}',NULL);
INSERT INTO stats VALUES('FKK',20,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,230,90,2,NULL,'{"yellow"}',FALSE,'{1,12}',NULL,'{61}');
INSERT INTO stats VALUES('FKK',10,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,230,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('FKK',28,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',11,230,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{56}');
INSERT INTO stats VALUES('FKK',17,230,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('FKK',1,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',3,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',20,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FKK',5,235,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('FKK',6,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',28,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',31,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',24,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',19,235,79,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FKK',11,235,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKK',13,235,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKK',9,235,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKK',10,235,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');

--NIE--
--1. match--
INSERT INTO stats VALUES('NIE',1,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('NIE',20,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('NIE',91,7,56,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('NIE',3,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('NIE',24,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',89,7,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('NIE',28,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('NIE',27,7,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('NIE',9,7,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('NIE',7,7,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('NIE',1,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',6,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('NIE',2,11,90,1,NULL,'{"yellow"}',FALSE,'{11}',NULL,'{69}');
INSERT INTO stats VALUES('NIE',3,11,90,2,1,NULL,FALSE,'{23,65}','{47}',NULL);
INSERT INTO stats VALUES('NIE',27,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,11,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,11,76,NULL,4,'{"yellow","yellow","red"}',FALSE,NULL,'{11,23,63,65}','{35,76,76}');
INSERT INTO stats VALUES('NIE',24,11,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('NIE',89,11,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',71,11,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',9,11,45,3,NULL,NULL,FALSE,'{47,63,80}',NULL,NULL);
INSERT INTO stats VALUES('NIE',11,11,30,NULL,1,'{"yellow"}',FALSE,NULL,'{80}','{66}');
--3. match--
INSERT INTO stats VALUES('NIE',1,23,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',22,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',23,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',93,23,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('NIE',28,23,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,23,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,23,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
--subs--
INSERT INTO stats VALUES('NIE',7,23,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,23,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('NIE',1,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,26,90,NULL,1,'{"yellow"}',FALSE,NULL,'{26}','{46}');
INSERT INTO stats VALUES('NIE',3,26,82,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('NIE',22,26,80,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{36,80,80}');
INSERT INTO stats VALUES('NIE',20,26,90,1,NULL,'{"yellow"}',FALSE,'{26}',NULL,'{51}');
INSERT INTO stats VALUES('NIE',26,26,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('NIE',24,26,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',14,26,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('NIE',89,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,26,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('NIE',10,26,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('NIE',1,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,40,90,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
INSERT INTO stats VALUES('NIE',23,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,40,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('NIE',16,40,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('NIE',11,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,40,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,40,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('NIE',24,40,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('NIE',7,40,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,40,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('NIE',1,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,41,79,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{11,79}');
INSERT INTO stats VALUES('NIE',3,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',22,41,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('NIE',23,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,41,90,1,NULL,'{"yellow"}',FALSE,'{55}',NULL,'{58}');
INSERT INTO stats VALUES('NIE',27,41,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('NIE',16,41,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',14,41,90,1,1,NULL,FALSE,'{2}','{55}',NULL);
INSERT INTO stats VALUES('NIE',11,41,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('NIE',7,41,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',9,41,31,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
--7. match--
INSERT INTO stats VALUES('NIE',1,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,56,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('NIE',3,56,90,3,NULL,NULL,FALSE,'{12,49,70}',NULL,NULL);
INSERT INTO stats VALUES('NIE',2,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,56,90,1,NULL,'{"yellow"}',FALSE,'{61}',NULL,'{41}');
INSERT INTO stats VALUES('NIE',11,56,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('NIE',14,56,90,NULL,1,'{"yellow"}',FALSE,NULL,'{12}','{56}');
INSERT INTO stats VALUES('NIE',27,56,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('NIE',28,56,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,56,82,1,NULL,'{"yellow"}',FALSE,'{46}',NULL,'{51}');
--subs--
INSERT INTO stats VALUES('NIE',7,56,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,56,21,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('NIE',89,56,45,NULL,4,'{"yellow"}',FALSE,NULL,'{46,49,61,70}','{82}');
--8. match--
INSERT INTO stats VALUES('NIE',1,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',2,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('NIE',23,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',3,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{59}');
INSERT INTO stats VALUES('NIE',6,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('NIE',26,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',28,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('NIE',24,58,77,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('NIE',10,58,66,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',9,58,24,1,NULL,NULL,FALSE,'{80}',NULL,NULL);
INSERT INTO stats VALUES('NIE',27,58,13,NULL,1,NULL,FALSE,NULL,'{80}',NULL);
--9. match--
INSERT INTO stats VALUES('NIE',13,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,71,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('NIE',12,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,71,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('NIE',2,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,71,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('NIE',11,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,71,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,71,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--10. match--
INSERT INTO stats VALUES('NIE',1,75,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,75,71,NULL,2,'{"yellow","red"}',FALSE,NULL,'{23,40}','{41,71}');
INSERT INTO stats VALUES('NIE',6,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('NIE',12,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('NIE',3,75,90,NULL,1,'{"yellow"}',FALSE,NULL,'{80}','{31}');
INSERT INTO stats VALUES('NIE',89,75,90,2,NULL,'{"yellow"}',FALSE,'{23,80}',NULL,'{45}');
INSERT INTO stats VALUES('NIE',14,75,90,1,1,'{"yellow"}',FALSE,'{40}','{46}','{13}');
INSERT INTO stats VALUES('NIE',16,75,90,1,NULL,'{"yellow"}',FALSE,'{46}',NULL,'{89}');
INSERT INTO stats VALUES('NIE',27,75,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',28,75,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--11. match--
INSERT INTO stats VALUES('NIE',1,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,86,90,NULL,1,'{"yellow"}',FALSE,NULL,'{37}','{78}');
INSERT INTO stats VALUES('NIE',2,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',23,86,90,1,NULL,NULL,FALSE,'{37}',NULL,NULL);
INSERT INTO stats VALUES('NIE',12,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,86,90,1,NULL,'{"yellow"}',FALSE,'{59}',NULL,'{46}');
INSERT INTO stats VALUES('NIE',11,86,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,86,90,NULL,1,'{"yellow"}',FALSE,NULL,'{59}','{11}');
INSERT INTO stats VALUES('NIE',7,86,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,86,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
--12. match--
INSERT INTO stats VALUES('NIE',1,92,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',3,92,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
INSERT INTO stats VALUES('NIE',6,92,90,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
INSERT INTO stats VALUES('NIE',20,92,90,NULL,1,'{"yellow"}',FALSE,NULL,'{69}','{78}');
INSERT INTO stats VALUES('NIE',91,92,90,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
INSERT INTO stats VALUES('NIE',11,92,90,NULL,1,'{"yellow"}',FALSE,NULL,'{83}','{88}');
INSERT INTO stats VALUES('NIE',14,92,90,1,NULL,'{"yellow"}',FALSE,'{25}',NULL,'{44}');
INSERT INTO stats VALUES('NIE',16,92,90,1,NULL,'{"yellow"}',FALSE,'{7}',NULL,'{55}');
INSERT INTO stats VALUES('NIE',27,92,90,NULL,2,NULL,FALSE,NULL,'{3,7}',NULL);
INSERT INTO stats VALUES('NIE',89,92,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',7,92,90,3,1,NULL,FALSE,'{3,60,83}','{25}',NULL);
--13. match--
INSERT INTO stats VALUES('NIE',13,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,101,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('NIE',3,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,101,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('NIE',27,101,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',93,101,66,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('NIE',7,101,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('NIE',9,101,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('NIE',11,101,24,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--14. match--
INSERT INTO stats VALUES('NIE',13,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',91,109,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('NIE',3,109,90,NULL,1,'{"yellow"}',FALSE,NULL,'{84}','{63}');
INSERT INTO stats VALUES('NIE',20,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,109,55,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,109,90,1,NULL,NULL,FALSE,'{84}',NULL,NULL);
INSERT INTO stats VALUES('NIE',26,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,109,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,109,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,109,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',7,109,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,109,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',28,109,35,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('NIE',1,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,116,90,1,NULL,NULL,FALSE,'{40}',NULL,NULL);
INSERT INTO stats VALUES('NIE',6,116,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('NIE',3,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,116,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,116,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,116,90,NULL,1,NULL,FALSE,NULL,'{40}',NULL);
INSERT INTO stats VALUES('NIE',10,116,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',7,116,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',89,116,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('NIE',1,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('NIE',3,126,90,NULL,1,'{"yellow"}',FALSE,NULL,'{11}','{77}');
INSERT INTO stats VALUES('NIE',23,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('NIE',11,126,90,1,1,'{"yellow"}',FALSE,'{50}','{56}','{13}');
INSERT INTO stats VALUES('NIE',26,126,90,2,NULL,'{"yellow"}',FALSE,'{34,87}',NULL,'{31}');
INSERT INTO stats VALUES('NIE',24,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('NIE',27,126,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('NIE',14,126,90,2,3,'{"yellow"}',FALSE,'{11,56}','{34,50,87}','{9}');
INSERT INTO stats VALUES('NIE',7,126,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('NIE',1,131,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,131,90,1,NULL,NULL,FALSE,'{43}',NULL,NULL);
INSERT INTO stats VALUES('NIE',2,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',22,131,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('NIE',12,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,131,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,131,90,1,NULL,NULL,FALSE,'{4}',NULL,NULL);
INSERT INTO stats VALUES('NIE',26,131,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,131,90,NULL,2,NULL,FALSE,NULL,'{4,43}',NULL);
INSERT INTO stats VALUES('NIE',9,131,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,131,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,131,45,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
--18. match--
INSERT INTO stats VALUES('NIE',1,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('NIE',12,143,90,1,NULL,'{"yellow"}',FALSE,'{59}',NULL,'{67}');
INSERT INTO stats VALUES('NIE',2,143,90,1,NULL,NULL,FALSE,'{45}',NULL,NULL);
INSERT INTO stats VALUES('NIE',23,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('NIE',20,143,90,1,1,'{"yellow"}',FALSE,'{32}','{45}','{14}');
INSERT INTO stats VALUES('NIE',14,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('NIE',11,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('NIE',93,143,90,NULL,1,NULL,FALSE,NULL,'{59}',NULL);
INSERT INTO stats VALUES('NIE',24,143,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('NIE',89,143,90,NULL,1,'{"yellow"}',FALSE,NULL,'{32}','{52}');
INSERT INTO stats VALUES('NIE',9,143,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,143,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('NIE',1,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',23,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,146,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{82}');
INSERT INTO stats VALUES('NIE',24,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,146,90,1,NULL,NULL,FALSE,'{87}',NULL,NULL);
INSERT INTO stats VALUES('NIE',28,146,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,146,90,1,1,NULL,FALSE,'{67}','{87}',NULL);
INSERT INTO stats VALUES('NIE',10,146,76,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',7,146,14,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('NIE',1,160,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('NIE',3,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,160,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,160,90,1,NULL,NULL,FALSE,'{42}',NULL,NULL);
INSERT INTO stats VALUES('NIE',24,160,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,160,90,NULL,1,NULL,FALSE,NULL,'{42}',NULL);
INSERT INTO stats VALUES('NIE',10,160,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',7,160,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('NIE',28,160,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('NIE',1,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('NIE',6,161,90,NULL,1,NULL,FALSE,NULL,'{55}',NULL);
INSERT INTO stats VALUES('NIE',3,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('NIE',2,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('NIE',26,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,161,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('NIE',9,161,78,1,NULL,NULL,FALSE,'{55}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,161,12,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('NIE',27,161,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--22. match--
INSERT INTO stats VALUES('NIE',1,176,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,176,90,1,NULL,'{"yellow"}',FALSE,'{48}',NULL,'{71}');
INSERT INTO stats VALUES('NIE',6,176,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('NIE',20,176,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('NIE',2,176,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('NIE',16,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',11,176,77,1,NULL,'{"yellow"}',FALSE,'{23}',NULL,'{49}');
INSERT INTO stats VALUES('NIE',28,176,90,NULL,1,NULL,FALSE,NULL,'{48}',NULL);
INSERT INTO stats VALUES('NIE',26,176,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',7,176,60,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,176,20,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('NIE',24,176,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',89,176,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--23. match--
INSERT INTO stats VALUES('NIE',99,178,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('NIE',12,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,178,90,NULL,1,NULL,FALSE,NULL,'{85}',NULL);
INSERT INTO stats VALUES('NIE',24,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,178,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',28,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,178,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('NIE',7,178,83,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',9,178,7,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,178,45,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
--24. match--
INSERT INTO stats VALUES('NIE',13,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',3,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',12,191,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('NIE',2,191,90,1,1,NULL,FALSE,'{62}','{77}',NULL);
INSERT INTO stats VALUES('NIE',20,191,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('NIE',11,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',93,191,58,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('NIE',16,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',7,191,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,191,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,191,32,NULL,1,NULL,FALSE,NULL,'{62}',NULL);
--25. match--
INSERT INTO stats VALUES('NIE',1,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('NIE',91,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',2,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('NIE',23,195,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('NIE',6,195,90,1,1,'{"yellow"}',FALSE,'{78}','{11}','{44}');
INSERT INTO stats VALUES('NIE',11,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('NIE',24,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
INSERT INTO stats VALUES('NIE',28,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('NIE',7,195,90,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
--26. match--
INSERT INTO stats VALUES('NIE',1,206,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,206,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',91,206,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('NIE',12,206,88,1,1,'{"yellow","yellow","red"}',FALSE,'{11}','{54}','{58,88,88}');
INSERT INTO stats VALUES('NIE',6,206,90,1,2,NULL,FALSE,'{15}','{11,35}',NULL);
INSERT INTO stats VALUES('NIE',14,206,90,3,NULL,NULL,FALSE,'{35,54,83}',NULL,NULL);
INSERT INTO stats VALUES('NIE',11,206,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('NIE',27,206,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('NIE',89,206,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,206,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',9,206,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',7,206,23,NULL,1,NULL,FALSE,NULL,'{70}',NULL);
INSERT INTO stats VALUES('NIE',93,206,6,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,206,45,1,1,NULL,FALSE,'{70}','{83}',NULL);
--27. match--
INSERT INTO stats VALUES('NIE',13,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,212,90,1,NULL,'{"yellow"}',FALSE,'{70}',NULL,'{88}');
INSERT INTO stats VALUES('NIE',2,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',20,212,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('NIE',3,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',24,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,212,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,212,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',93,212,90,1,NULL,NULL,FALSE,'{15}',NULL,NULL);
INSERT INTO stats VALUES('NIE',7,212,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,212,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',26,212,25,NULL,1,NULL,FALSE,NULL,'{70}',NULL);
--28. match--
INSERT INTO stats VALUES('NIE',1,221,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',2,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('NIE',6,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('NIE',12,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('NIE',22,221,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',93,221,90,NULL,4,NULL,FALSE,NULL,'{15,19,50,70}',NULL);
INSERT INTO stats VALUES('NIE',16,221,90,1,NULL,'{"yellow"}',FALSE,'{70}',NULL,'{67}');
INSERT INTO stats VALUES('NIE',11,221,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('NIE',27,221,90,2,NULL,'{"yellow"}',FALSE,'{15,19}',NULL,'{62}');
INSERT INTO stats VALUES('NIE',26,221,90,NULL,1,NULL,FALSE,NULL,'{6}',NULL);
INSERT INTO stats VALUES('NIE',7,221,90,2,NULL,'{"yellow"}',FALSE,'{6,50}',NULL,'{52}');
--29. match--
INSERT INTO stats VALUES('NIE',13,229,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('NIE',3,229,90,NULL,3,NULL,FALSE,NULL,'{31,60,62}',NULL);
INSERT INTO stats VALUES('NIE',12,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',6,229,90,NULL,1,NULL,FALSE,NULL,'{40}',NULL);
INSERT INTO stats VALUES('NIE',20,229,90,3,NULL,NULL,FALSE,'{31,40,81}',NULL,NULL);
INSERT INTO stats VALUES('NIE',24,229,90,1,NULL,'{"yellow"}',FALSE,'{60}',NULL,'{65}');
INSERT INTO stats VALUES('NIE',11,229,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,229,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,229,90,1,NULL,NULL,FALSE,'{62}',NULL,NULL);
INSERT INTO stats VALUES('NIE',93,229,90,NULL,1,NULL,FALSE,NULL,'{49}',NULL);
INSERT INTO stats VALUES('NIE',71,229,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,229,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,229,45,1,1,NULL,FALSE,'{49}','{81}',NULL);
--30. match--
INSERT INTO stats VALUES('NIE',1,236,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('NIE',91,236,90,1,NULL,'{"yellow"}',FALSE,'{52}',NULL,'{81}');
INSERT INTO stats VALUES('NIE',6,236,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('NIE',2,236,90,NULL,2,NULL,FALSE,NULL,'{52,74}',NULL);
INSERT INTO stats VALUES('NIE',3,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',16,236,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('NIE',11,236,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',14,236,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('NIE',27,236,90,2,NULL,NULL,FALSE,'{49,74}',NULL,NULL);
INSERT INTO stats VALUES('NIE',28,236,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('NIE',9,236,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('NIE',10,236,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('NIE',26,236,45,NULL,1,'{"yellow"}',FALSE,NULL,'{49}','{57}');
INSERT INTO stats VALUES('NIE',24,236,21,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');

--SVE--
--1. match--
INSERT INTO stats VALUES('SVE',1,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('SVE',6,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,5,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('SVE',23,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('SVE',4,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('SVE',11,5,90,NULL,2,NULL,FALSE,NULL,'{17,39}',NULL);
INSERT INTO stats VALUES('SVE',27,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('SVE',21,5,90,1,NULL,'{"yellow"}',FALSE,'{39}',NULL,'{71}');
INSERT INTO stats VALUES('SVE',10,5,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('SVE',17,5,90,1,NULL,'{"yellow"}',FALSE,'{17}',NULL,'{22}');
--2. match--
INSERT INTO stats VALUES('SVE',12,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('SVE',6,12,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,12,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('SVE',32,12,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('SVE',8,12,70,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('SVE',11,12,90,1,1,NULL,FALSE,'{34}','{12}',NULL);
INSERT INTO stats VALUES('SVE',7,12,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{40}');
INSERT INTO stats VALUES('SVE',21,12,87,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{43,87,87}');
INSERT INTO stats VALUES('SVE',10,12,61,NULL,1,NULL,FALSE,NULL,'{34}',NULL);
INSERT INTO stats VALUES('SVE',17,12,90,2,NULL,NULL,FALSE,'{12,84}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',31,12,29,1,NULL,NULL,FALSE,'{80}',NULL,NULL);
INSERT INTO stats VALUES('SVE',27,12,45,NULL,3,'{"yellow"}',FALSE,NULL,'{74,80,84}','{56}');
INSERT INTO stats VALUES('SVE',29,12,20,1,NULL,'{"yellow"}',FALSE,'{74}',NULL,'{88}');
--3. match--
INSERT INTO stats VALUES('SVE',1,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,22,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SVE',5,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,22,90,NULL,1,'{"yellow"}',FALSE,NULL,'{56}','{87}');
INSERT INTO stats VALUES('SVE',4,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,22,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,22,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,22,73,1,NULL,NULL,FALSE,'{49}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,22,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,22,45,1,1,'{"yellow"}',FALSE,'{56}','{49}','{65}');
--4. match--
INSERT INTO stats VALUES('SVE',1,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('SVE',3,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',91,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('SVE',23,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,27,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,27,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('SVE',21,27,65,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SVE',7,27,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,27,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,27,45,NULL,1,'{"yellow"}',FALSE,NULL,'{71}','{59}');
INSERT INTO stats VALUES('SVE',29,27,25,1,NULL,NULL,FALSE,'{71}',NULL,NULL);
INSERT INTO stats VALUES('SVE',10,27,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
--5. match--
INSERT INTO stats VALUES('SVE',1,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,39,61,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{16,61}');
INSERT INTO stats VALUES('SVE',7,39,90,1,1,NULL,FALSE,'{47}','{77}',NULL);
INSERT INTO stats VALUES('SVE',4,39,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,39,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,39,80,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{13,80,80}');
INSERT INTO stats VALUES('SVE',21,39,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',9,39,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('SVE',19,39,45,NULL,1,'{"yellow"}',FALSE,NULL,'{47}','{86}');
INSERT INTO stats VALUES('SVE',8,39,20,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,39,23,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
--6. match--
INSERT INTO stats VALUES('SVE',1,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('SVE',2,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,42,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('SVE',27,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,42,86,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,42,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,42,79,1,NULL,NULL,FALSE,'{68}',NULL,NULL);
INSERT INTO stats VALUES('SVE',19,42,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',31,42,45,NULL,1,NULL,FALSE,NULL,'{68}',NULL);
INSERT INTO stats VALUES('SVE',4,42,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,42,4,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('SVE',12,56,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('SVE',2,56,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('SVE',24,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,56,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,56,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,56,90,NULL,1,NULL,FALSE,NULL,'{80}',NULL);
INSERT INTO stats VALUES('SVE',11,56,90,1,NULL,'{"yellow"}',FALSE,'{80}',NULL,'{57}');
INSERT INTO stats VALUES('SVE',10,56,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,56,90,1,1,NULL,FALSE,'{11}','{76}',NULL);
INSERT INTO stats VALUES('SVE',17,56,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
--subs--
INSERT INTO stats VALUES('SVE',19,56,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('SVE',28,56,45,1,NULL,'{"yellow"}',FALSE,'{76}',NULL,'{50}');
INSERT INTO stats VALUES('SVE',21,56,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--8. match--
INSERT INTO stats VALUES('SVE',1,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('SVE',5,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,57,90,NULL,1,NULL,FALSE,NULL,'{20}',NULL);
INSERT INTO stats VALUES('SVE',7,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,57,90,1,NULL,NULL,FALSE,'{20}',NULL,NULL);
INSERT INTO stats VALUES('SVE',21,57,90,1,NULL,'{"yellow"}',FALSE,'{44}',NULL,'{87}');
INSERT INTO stats VALUES('SVE',8,57,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,57,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',31,57,73,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,57,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,57,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,57,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--9. match--
INSERT INTO stats VALUES('SVE',1,72,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,72,90,NULL,1,'{"yellow"}',FALSE,NULL,'{61}','{90}');
INSERT INTO stats VALUES('SVE',3,72,90,NULL,2,NULL,FALSE,NULL,'{3,55}',NULL);
INSERT INTO stats VALUES('SVE',6,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('SVE',77,72,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,72,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,72,90,1,NULL,'{"yellow"}',FALSE,'{69}',NULL,'{44}');
INSERT INTO stats VALUES('SVE',4,72,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('SVE',10,72,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,72,90,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('SVE',19,72,76,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,72,14,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('SVE',11,72,32,1,1,NULL,FALSE,'{83}','{69}',NULL);
INSERT INTO stats VALUES('SVE',21,72,45,2,NULL,NULL,FALSE,'{55,61}',NULL,NULL);
--10. match--
INSERT INTO stats VALUES('SVE',1,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,74,90,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
INSERT INTO stats VALUES('SVE',5,74,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('SVE',28,74,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('SVE',29,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,74,90,1,1,NULL,FALSE,'{22}','{43}',NULL);
INSERT INTO stats VALUES('SVE',11,74,90,3,NULL,NULL,FALSE,'{43,67,86}',NULL,NULL);
INSERT INTO stats VALUES('SVE',21,74,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,74,81,NULL,1,NULL,FALSE,NULL,'{22}',NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,74,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,74,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('SVE',1,87,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,87,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SVE',6,87,90,NULL,1,NULL,FALSE,NULL,'{66}',NULL);
INSERT INTO stats VALUES('SVE',5,87,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('SVE',91,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,87,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('SVE',4,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',9,87,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,87,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('SVE',1,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',91,91,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('SVE',23,91,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('SVE',3,91,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('SVE',5,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,91,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SVE',10,91,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,91,61,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,91,80,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('SVE',9,91,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',17,91,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SVE',11,91,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,91,29,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
--13. match--
INSERT INTO stats VALUES('SVE',12,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
INSERT INTO stats VALUES('SVE',91,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('SVE',2,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SVE',3,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('SVE',8,102,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SVE',29,102,90,NULL,1,'{"yellow"}',FALSE,NULL,'{53}','{25}');
INSERT INTO stats VALUES('SVE',10,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,102,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,102,90,1,NULL,NULL,FALSE,'{53}',NULL,NULL);
--14. match--
INSERT INTO stats VALUES('SVE',1,108,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('SVE',24,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,108,90,NULL,1,NULL,FALSE,NULL,'{50}',NULL);
INSERT INTO stats VALUES('SVE',6,108,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('SVE',21,108,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SVE',29,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,108,85,1,NULL,'{"red"}',FALSE,'{62}',NULL,'{85}');
INSERT INTO stats VALUES('SVE',7,108,67,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('SVE',9,108,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,108,23,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('SVE',10,108,45,1,1,NULL,FALSE,'{50}','{62}',NULL);
--15. match--
INSERT INTO stats VALUES('SVE',1,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,117,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('SVE',23,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',91,117,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('SVE',7,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,117,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SVE',10,117,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',9,117,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,117,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,117,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('SVE',1,125,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('SVE',3,125,90,1,NULL,'{"yellow"}',FALSE,'{11}',NULL,'{65}');
INSERT INTO stats VALUES('SVE',24,125,90,NULL,1,'{"yellow"}',FALSE,NULL,'{19}','{87}');
INSERT INTO stats VALUES('SVE',2,125,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('SVE',6,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,125,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('SVE',27,125,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SVE',4,125,90,1,NULL,NULL,FALSE,'{19}',NULL,NULL);
INSERT INTO stats VALUES('SVE',8,125,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('SVE',10,125,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',19,125,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',17,125,45,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--17. match--
INSERT INTO stats VALUES('SVE',1,132,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('SVE',32,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,132,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('SVE',3,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,132,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('SVE',28,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,132,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',93,132,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
--18. match--
INSERT INTO stats VALUES('SVE',33,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,142,90,1,1,NULL,FALSE,'{23}','{71}',NULL);
INSERT INTO stats VALUES('SVE',3,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('SVE',2,142,90,NULL,1,'{"yellow"}',FALSE,NULL,'{23}','{61}');
INSERT INTO stats VALUES('SVE',6,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('SVE',11,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SVE',7,142,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('SVE',27,142,69,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{33,69,69}');
INSERT INTO stats VALUES('SVE',21,142,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{3}');
INSERT INTO stats VALUES('SVE',9,142,78,1,NULL,'{"yellow","red"}',FALSE,'{71}',NULL,'{15,78}');
--19. match--
INSERT INTO stats VALUES('SVE',1,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,147,90,1,NULL,NULL,FALSE,'{33}',NULL,NULL);
INSERT INTO stats VALUES('SVE',2,147,90,NULL,1,NULL,FALSE,NULL,'{5}',NULL);
INSERT INTO stats VALUES('SVE',5,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,147,90,NULL,1,'{"yellow"}',FALSE,NULL,'{33}','{61}');
INSERT INTO stats VALUES('SVE',8,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,147,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,147,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,147,45,1,NULL,NULL,FALSE,'{5}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',93,147,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('SVE',7,147,25,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
--20. match--
INSERT INTO stats VALUES('SVE',1,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('SVE',6,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('SVE',23,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
INSERT INTO stats VALUES('SVE',29,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('SVE',11,159,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{59}');
INSERT INTO stats VALUES('SVE',27,159,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SVE',19,159,63,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
--subs--
INSERT INTO stats VALUES('SVE',93,159,27,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
--21. match--
INSERT INTO stats VALUES('SVE',1,162,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,162,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,162,90,1,1,NULL,FALSE,'{49}','{65}',NULL);
INSERT INTO stats VALUES('SVE',2,162,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,162,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,162,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,162,90,NULL,3,NULL,FALSE,NULL,'{2,27,49}',NULL);
INSERT INTO stats VALUES('SVE',4,162,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('SVE',8,162,90,2,NULL,NULL,FALSE,'{27,65}',NULL,NULL);
INSERT INTO stats VALUES('SVE',27,162,90,1,1,NULL,FALSE,'{2}','{83}',NULL);
INSERT INTO stats VALUES('SVE',31,162,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,162,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('SVE',1,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,176,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('SVE',7,176,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,176,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
--23. match--
INSERT INTO stats VALUES('SVE',1,177,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,177,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('SVE',32,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,177,90,2,1,NULL,FALSE,'{58,69}','{77}',NULL);
INSERT INTO stats VALUES('SVE',3,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,177,90,1,1,NULL,FALSE,'{52}','{58}',NULL);
INSERT INTO stats VALUES('SVE',10,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,177,90,NULL,2,'{"yellow"}',FALSE,NULL,'{52,69}','{67}');
INSERT INTO stats VALUES('SVE',8,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',19,177,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
--24. match--
INSERT INTO stats VALUES('SVE',1,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('SVE',23,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('SVE',21,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('SVE',8,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',27,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('SVE',11,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('SVE',7,192,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('SVE',19,192,71,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
--subs--
INSERT INTO stats VALUES('SVE',17,192,17,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{76,88,88}');
INSERT INTO stats VALUES('SVE',4,192,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('SVE',1,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,194,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('SVE',3,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,194,90,1,NULL,NULL,FALSE,'{86}',NULL,NULL);
INSERT INTO stats VALUES('SVE',27,194,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,194,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',9,194,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',19,194,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,194,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,194,11,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
--26. match--
INSERT INTO stats VALUES('SVE',1,207,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,207,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('SVE',27,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',19,207,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',17,207,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
--27. match--
INSERT INTO stats VALUES('SVE',33,211,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,211,90,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
INSERT INTO stats VALUES('SVE',3,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',24,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,211,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',28,211,90,NULL,1,NULL,FALSE,NULL,'{26}',NULL);
INSERT INTO stats VALUES('SVE',8,211,90,1,NULL,NULL,FALSE,'{26}',NULL,NULL);
INSERT INTO stats VALUES('SVE',21,211,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,211,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,211,70,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,211,20,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('SVE',7,211,45,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('SVE',10,211,30,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
--28. match--
INSERT INTO stats VALUES('SVE',1,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',32,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',6,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',10,222,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,222,90,1,NULL,'{"yellow"}',FALSE,'{58}',NULL,'{86}');
INSERT INTO stats VALUES('SVE',29,222,65,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,222,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',17,222,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,222,45,NULL,1,NULL,FALSE,NULL,'{58}',NULL);
INSERT INTO stats VALUES('SVE',11,222,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,222,25,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--29. match--
INSERT INTO stats VALUES('SVE',1,228,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',2,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',5,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',3,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',23,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',4,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',29,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',7,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,228,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',19,228,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('SVE',9,228,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('SVE',1,237,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',91,237,90,1,NULL,'{"yellow"}',FALSE,'{67}',NULL,'{49}');
INSERT INTO stats VALUES('SVE',6,237,90,1,1,NULL,FALSE,'{89}','{32}',NULL);
INSERT INTO stats VALUES('SVE',3,237,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('SVE',5,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',11,237,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('SVE',10,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',21,237,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('SVE',8,237,90,1,NULL,NULL,FALSE,'{25}',NULL,NULL);
INSERT INTO stats VALUES('SVE',7,237,90,NULL,1,NULL,FALSE,NULL,'{25}',NULL);
INSERT INTO stats VALUES('SVE',9,237,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('SVE',17,237,45,NULL,2,NULL,FALSE,NULL,'{67,89}',NULL);

--ACH--
--1. match--
INSERT INTO stats VALUES('ACH',1,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',28,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',91,4,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{18}');
INSERT INTO stats VALUES('ACH',4,4,90,NULL,1,'{"yellow"}',FALSE,NULL,'{54}','{75}');
INSERT INTO stats VALUES('ACH',2,4,90,1,NULL,'{"yellow"}',FALSE,'{12}',NULL,'{32}');
INSERT INTO stats VALUES('ACH',18,4,90,1,NULL,'{"yellow"}',FALSE,'{54}',NULL,'{87}');
INSERT INTO stats VALUES('ACH',10,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,4,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,4,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('ACH',11,4,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('ACH',9,4,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
--2. match--
INSERT INTO stats VALUES('ACH',1,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',28,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('ACH',21,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('ACH',7,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{17}');
INSERT INTO stats VALUES('ACH',23,13,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('ACH',18,13,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('ACH',13,13,63,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('ACH',17,13,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',9,13,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,13,27,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('ACH',1,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('ACH',6,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('ACH',31,21,70,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{4,70}');
INSERT INTO stats VALUES('ACH',3,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('ACH',10,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('ACH',18,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('ACH',30,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('ACH',14,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,21,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('ACH',11,21,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('ACH',1,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('ACH',28,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('ACH',3,28,90,NULL,1,NULL,FALSE,NULL,'{30}',NULL);
INSERT INTO stats VALUES('ACH',4,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('ACH',6,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('ACH',23,28,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,28,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('ACH',18,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('ACH',13,28,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{24}');
INSERT INTO stats VALUES('ACH',11,28,90,1,NULL,'{"yellow"}',FALSE,'{30}',NULL,'{49}');
--5. match--
INSERT INTO stats VALUES('ACH',1,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',91,38,90,NULL,1,NULL,FALSE,NULL,'{64}',NULL);
INSERT INTO stats VALUES('ACH',28,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,38,90,1,NULL,NULL,FALSE,'{64}',NULL,NULL);
INSERT INTO stats VALUES('ACH',7,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',89,38,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('ACH',23,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,38,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,38,63,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',9,38,27,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('ACH',1,43,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,43,90,1,NULL,NULL,FALSE,'{9}',NULL,NULL);
INSERT INTO stats VALUES('ACH',3,43,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{28}');
INSERT INTO stats VALUES('ACH',6,43,90,1,NULL,NULL,FALSE,'{34}',NULL,NULL);
INSERT INTO stats VALUES('ACH',31,43,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('ACH',7,43,90,NULL,1,NULL,FALSE,NULL,'{9}',NULL);
INSERT INTO stats VALUES('ACH',13,43,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,43,90,NULL,1,NULL,FALSE,NULL,'{34}',NULL);
INSERT INTO stats VALUES('ACH',23,43,60,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('ACH',89,43,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('ACH',11,43,74,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
--subs--
INSERT INTO stats VALUES('ACH',9,43,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,43,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
--7. match--
INSERT INTO stats VALUES('ACH',1,55,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('ACH',2,55,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('ACH',6,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,55,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('ACH',7,55,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,55,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
--8. match--
INSERT INTO stats VALUES('ACH',33,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('ACH',4,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,58,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('ACH',89,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('ACH',13,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,58,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('ACH',7,58,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,58,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('ACH',11,58,81,1,1,'{"yellow"}',FALSE,'{11}','{65}','{34}');
--subs--
INSERT INTO stats VALUES('ACH',9,58,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('ACH',1,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('ACH',2,72,90,1,NULL,'{"yellow"}',FALSE,'{83}',NULL,'{44}');
INSERT INTO stats VALUES('ACH',6,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('ACH',4,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('ACH',22,72,46,NULL,2,'{"red"}',FALSE,NULL,'{13,83}','{46}');
INSERT INTO stats VALUES('ACH',89,72,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('ACH',23,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('ACH',30,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('ACH',13,72,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('ACH',10,72,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('ACH',11,72,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',9,72,45,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
--10. match--
INSERT INTO stats VALUES('ACH',1,73,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('ACH',6,73,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('ACH',2,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('ACH',4,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
INSERT INTO stats VALUES('ACH',23,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('ACH',13,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('ACH',30,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('ACH',18,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('ACH',9,73,90,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--11. match--
INSERT INTO stats VALUES('ACH',1,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('ACH',3,88,77,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{44,77,77}');
INSERT INTO stats VALUES('ACH',4,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('ACH',2,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('ACH',18,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
INSERT INTO stats VALUES('ACH',13,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',89,88,90,1,NULL,NULL,FALSE,'{41}',NULL,NULL);
INSERT INTO stats VALUES('ACH',7,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,88,73,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
--subs--
INSERT INTO stats VALUES('ACH',9,88,17,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
--12. match--
INSERT INTO stats VALUES('ACH',33,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('ACH',4,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,90,79,1,NULL,'{"yellow","yellow","red"}',FALSE,'{65}',NULL,'{33,79,79}');
INSERT INTO stats VALUES('ACH',21,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('ACH',6,90,90,NULL,2,'{"yellow"}',FALSE,NULL,'{11,65}','{89}');
INSERT INTO stats VALUES('ACH',7,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('ACH',13,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('ACH',14,90,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('ACH',30,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,90,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',17,90,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('ACH',1,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,103,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('ACH',89,103,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,103,90,1,1,'{"yellow"}',FALSE,'{13}','{49}','{64}');
INSERT INTO stats VALUES('ACH',7,103,70,1,1,'{"yellow"}',FALSE,'{49}','{13}','{51}');
INSERT INTO stats VALUES('ACH',18,103,79,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{15,79}');
INSERT INTO stats VALUES('ACH',10,103,59,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('ACH',9,103,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',11,103,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('ACH',13,103,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,103,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
--14. match--
INSERT INTO stats VALUES('ACH',1,107,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,107,90,NULL,1,'{"yellow"}',FALSE,NULL,'{45}','{42}');
INSERT INTO stats VALUES('ACH',3,107,56,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('ACH',31,107,90,1,NULL,'{"yellow"}',FALSE,'{45}',NULL,'{88}');
INSERT INTO stats VALUES('ACH',6,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,107,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',89,107,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('ACH',23,107,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,107,79,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
--subs--
INSERT INTO stats VALUES('ACH',11,107,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,107,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('ACH',12,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,118,90,1,NULL,'{"yellow"}',FALSE,'{72}',NULL,'{32}');
INSERT INTO stats VALUES('ACH',2,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,118,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('ACH',23,118,90,1,NULL,NULL,FALSE,'{55}',NULL,NULL);
INSERT INTO stats VALUES('ACH',14,118,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('ACH',89,118,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,118,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,118,90,NULL,1,NULL,FALSE,NULL,'{48}',NULL);
INSERT INTO stats VALUES('ACH',11,118,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',17,118,45,2,2,NULL,FALSE,'{48,69}','{55,72}',NULL);
INSERT INTO stats VALUES('ACH',10,118,30,NULL,1,NULL,FALSE,NULL,'{69}',NULL);
--16. match--
INSERT INTO stats VALUES('ACH',33,124,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('ACH',3,124,90,1,NULL,NULL,FALSE,'{7}',NULL,NULL);
INSERT INTO stats VALUES('ACH',6,124,90,1,NULL,NULL,FALSE,'{29}',NULL,NULL);
INSERT INTO stats VALUES('ACH',2,124,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('ACH',21,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,124,83,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{11,83,83}');
INSERT INTO stats VALUES('ACH',13,124,90,NULL,1,'{"yellow"}',FALSE,NULL,'{29}','{66}');
INSERT INTO stats VALUES('ACH',14,124,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
INSERT INTO stats VALUES('ACH',23,124,90,NULL,1,'{"yellow"}',FALSE,NULL,'{7}','{41}');
INSERT INTO stats VALUES('ACH',7,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,124,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--17. match--
INSERT INTO stats VALUES('ACH',1,133,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,133,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
INSERT INTO stats VALUES('ACH',4,133,90,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
INSERT INTO stats VALUES('ACH',3,133,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,133,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('ACH',18,133,90,NULL,2,NULL,FALSE,NULL,'{13,77}',NULL);
INSERT INTO stats VALUES('ACH',14,133,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,133,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,133,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('ACH',13,133,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,133,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',11,133,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,133,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,133,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('ACH',1,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('ACH',6,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,141,59,NULL,1,'{"yellow","red"}',FALSE,NULL,'{24}','{22,59}');
INSERT INTO stats VALUES('ACH',7,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,141,90,1,NULL,'{"yellow"}',FALSE,'{24}',NULL,'{79}');
INSERT INTO stats VALUES('ACH',30,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,141,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('ACH',18,141,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',17,141,75,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',11,141,15,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('ACH',1,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,148,90,3,NULL,NULL,FALSE,'{33,78,51}',NULL,NULL);
INSERT INTO stats VALUES('ACH',3,148,90,NULL,1,'{"yellow"}',FALSE,NULL,'{78}','{23}');
INSERT INTO stats VALUES('ACH',21,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,148,90,NULL,2,NULL,FALSE,NULL,'{33,46}',NULL);
INSERT INTO stats VALUES('ACH',30,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,148,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,148,90,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
INSERT INTO stats VALUES('ACH',7,148,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('ACH',11,148,70,1,1,NULL,FALSE,'{46}','{51}',NULL);
--subs--
INSERT INTO stats VALUES('ACH',17,148,20,1,NULL,NULL,FALSE,'{86}',NULL,NULL);
--20. match--
INSERT INTO stats VALUES('ACH',1,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,158,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,158,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,158,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('ACH',10,158,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('ACH',23,158,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',17,158,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',11,158,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,158,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',89,158,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--21. match--
INSERT INTO stats VALUES('ACH',1,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,163,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('ACH',89,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,163,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--22. match--
INSERT INTO stats VALUES('ACH',33,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,175,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,175,90,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
INSERT INTO stats VALUES('ACH',18,175,90,1,NULL,NULL,FALSE,'{52}',NULL,NULL);
INSERT INTO stats VALUES('ACH',7,175,59,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('ACH',23,175,90,NULL,1,NULL,FALSE,NULL,'{52}',NULL);
INSERT INTO stats VALUES('ACH',10,175,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,175,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',9,175,22,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('ACH',14,175,45,NULL,1,NULL,FALSE,NULL,'{78}',NULL);
INSERT INTO stats VALUES('ACH',30,175,31,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('ACH',12,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,178,86,1,1,'{"red"}',FALSE,'{33}','{47}','{86}');
INSERT INTO stats VALUES('ACH',6,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,178,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,178,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{6}');
INSERT INTO stats VALUES('ACH',13,178,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{11}');
INSERT INTO stats VALUES('ACH',7,178,90,1,NULL,'{"yellow"}',FALSE,'{55}',NULL,'{42}');
INSERT INTO stats VALUES('ACH',18,178,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('ACH',10,178,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',17,178,45,NULL,1,'{"yellow"}',FALSE,NULL,'{33}','{23}');
--subs--
INSERT INTO stats VALUES('ACH',9,178,45,1,3,'{"yellow"}',FALSE,'{47}','{55,78,82}','{67}');
INSERT INTO stats VALUES('ACH',14,178,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,178,21,2,NULL,'{"yellow"}',FALSE,'{78,82}',NULL,'{87}');
--24. match--
INSERT INTO stats VALUES('ACH',1,192,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('ACH',6,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('ACH',4,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,192,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('ACH',21,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('ACH',10,192,66,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('ACH',14,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,192,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,192,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('ACH',18,192,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('ACH',11,192,69,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
--subs--
INSERT INTO stats VALUES('ACH',9,192,21,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('ACH',13,192,45,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--25. match--
INSERT INTO stats VALUES('ACH',1,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',21,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',28,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,193,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{63}');
INSERT INTO stats VALUES('ACH',23,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,193,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('ACH',89,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',11,193,67,NULL,1,'{"yellow"}',FALSE,NULL,'{11}','{51}');
--subs--
INSERT INTO stats VALUES('ACH',9,193,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--26. match--
INSERT INTO stats VALUES('ACH',1,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('ACH',28,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('ACH',21,208,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('ACH',3,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('ACH',2,208,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,208,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',13,208,90,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('ACH',18,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('ACH',14,208,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,208,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,208,81,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{34}');
--subs--
INSERT INTO stats VALUES('ACH',11,208,9,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',89,208,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('ACH',1,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('ACH',4,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('ACH',3,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('ACH',13,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('ACH',10,210,58,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{42,58}');
INSERT INTO stats VALUES('ACH',23,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,210,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',9,210,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{14}');
--subs--
INSERT INTO stats VALUES('ACH',17,210,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('ACH',7,210,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('ACH',12,223,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',3,223,90,2,1,NULL,FALSE,'{4,82}','{63}',NULL);
INSERT INTO stats VALUES('ACH',21,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('ACH',22,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('ACH',4,223,90,1,NULL,NULL,FALSE,'{63}',NULL,NULL);
INSERT INTO stats VALUES('ACH',13,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('ACH',7,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('ACH',89,223,90,1,1,NULL,FALSE,'{23}','{4}',NULL);
INSERT INTO stats VALUES('ACH',14,223,90,NULL,2,'{"yellow"}',FALSE,NULL,'{23,82}','{76}');
INSERT INTO stats VALUES('ACH',30,223,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('ACH',11,223,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',17,223,11,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
--29. match--
INSERT INTO stats VALUES('ACH',1,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('ACH',31,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',22,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('ACH',3,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('ACH',10,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',23,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',18,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('ACH',9,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',11,227,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',30,227,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--30. match--
INSERT INTO stats VALUES('ACH',1,238,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',6,238,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('ACH',3,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',4,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',2,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',7,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',10,238,90,1,NULL,'{"yellow"}',FALSE,'{89}',NULL,'{75}');
INSERT INTO stats VALUES('ACH',89,238,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('ACH',14,238,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('ACH',18,238,90,NULL,1,NULL,FALSE,NULL,'{89}',NULL);
INSERT INTO stats VALUES('ACH',11,238,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('ACH',17,238,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--HAD--
--1. match--
INSERT INTO stats VALUES('HAD',12,3,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',44,3,90,2,1,'{"yellow"}',FALSE,'{14,55}','{61}','{33}');
INSERT INTO stats VALUES('HAD',2,3,90,1,NULL,'{"yellow"}',FALSE,'{61}',NULL,'{85}');
INSERT INTO stats VALUES('HAD',23,3,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('HAD',13,3,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('HAD',11,3,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('HAD',15,3,90,NULL,2,'{"yellow"}',FALSE,NULL,'{14,55}','{76}');
INSERT INTO stats VALUES('HAD',17,3,79,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{63,79}');
INSERT INTO stats VALUES('HAD',10,3,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('HAD',9,3,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('HAD',1,14,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',37,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,14,90,1,NULL,NULL,FALSE,'{33}',NULL,NULL);
INSERT INTO stats VALUES('HAD',15,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,14,90,NULL,1,NULL,FALSE,NULL,'{33}',NULL);
INSERT INTO stats VALUES('HAD',13,14,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,14,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,14,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',18,14,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,14,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('HAD',11,14,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,14,32,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
--3. match--
INSERT INTO stats VALUES('HAD',1,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',23,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('HAD',6,20,65,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{3,65,65}');
INSERT INTO stats VALUES('HAD',13,20,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('HAD',19,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('HAD',17,20,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,20,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('HAD',97,20,70,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
--subs--
INSERT INTO stats VALUES('HAD',18,20,20,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('HAD',7,20,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('HAD',1,29,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('HAD',23,29,79,1,NULL,'{"yellow","yellow","red"}',FALSE,'{11}',NULL,'{36,79,79}');
INSERT INTO stats VALUES('HAD',2,29,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('HAD',3,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',44,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,29,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,29,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('HAD',90,29,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,29,50,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('HAD',13,29,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('HAD',18,29,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
--subs--
INSERT INTO stats VALUES('HAD',9,29,45,NULL,1,'{"yellow"}',FALSE,NULL,'{65}','{86}');
INSERT INTO stats VALUES('HAD',7,29,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--5. match--
INSERT INTO stats VALUES('HAD',1,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,37,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('HAD',2,37,90,1,NULL,NULL,FALSE,'{4}',NULL,NULL);
INSERT INTO stats VALUES('HAD',5,37,90,1,1,'{"yellow"}',FALSE,'{32}','{4}','{67}');
INSERT INTO stats VALUES('HAD',6,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,37,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('HAD',7,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,37,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,37,90,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
INSERT INTO stats VALUES('HAD',9,37,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',20,37,10,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--6. match--
INSERT INTO stats VALUES('HAD',1,44,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,44,90,NULL,3,NULL,FALSE,NULL,'{43,56,77}',NULL);
INSERT INTO stats VALUES('HAD',6,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('HAD',44,44,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('HAD',10,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,44,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('HAD',11,44,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,44,90,3,NULL,NULL,FALSE,'{43,56,77}',NULL,NULL);
INSERT INTO stats VALUES('HAD',93,44,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',18,44,81,1,NULL,'{"yellow"}',FALSE,'{11}',NULL,'{51}');
--subs--
INSERT INTO stats VALUES('HAD',9,44,9,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('HAD',7,44,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
--7. match--
INSERT INTO stats VALUES('HAD',12,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('HAD',5,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,54,90,1,NULL,'{"yellow"}',FALSE,'{5}',NULL,'{75}');
INSERT INTO stats VALUES('HAD',2,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('HAD',3,54,90,2,1,'{"yellow"}',FALSE,'{67,70}','{5}','{56}');
INSERT INTO stats VALUES('HAD',10,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('HAD',13,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,54,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('HAD',17,54,90,NULL,2,'{"yellow"}',FALSE,NULL,'{67,70}','{61}');
INSERT INTO stats VALUES('HAD',18,54,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
--8. match--
INSERT INTO stats VALUES('HAD',1,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,59,90,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('HAD',13,59,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,59,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('HAD',10,59,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('HAD',90,59,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('HAD',19,59,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',20,59,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,59,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,59,12,NULL,1,NULL,FALSE,NULL,'{85}',NULL);
INSERT INTO stats VALUES('HAD',7,59,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('HAD',1,71,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('HAD',2,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,71,90,1,NULL,NULL,FALSE,'{11}',NULL,NULL);
INSERT INTO stats VALUES('HAD',23,71,90,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('HAD',81,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,71,90,NULL,2,NULL,FALSE,NULL,'{11,89}',NULL);
INSERT INTO stats VALUES('HAD',7,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,71,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',10,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,71,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',97,71,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,71,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--10. match--
INSERT INTO stats VALUES('HAD',1,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,74,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',37,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,74,56,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{5,56,56}');
INSERT INTO stats VALUES('HAD',23,74,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('HAD',15,74,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('HAD',10,74,86,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{64,86}');
INSERT INTO stats VALUES('HAD',11,74,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
INSERT INTO stats VALUES('HAD',7,74,90,1,NULL,NULL,FALSE,'{47}',NULL,NULL);
INSERT INTO stats VALUES('HAD',17,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',20,74,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--11. match--
INSERT INTO stats VALUES('HAD',1,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,88,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('HAD',3,88,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('HAD',6,88,90,NULL,2,'{"yellow"}',FALSE,NULL,'{51,77}','{87}');
INSERT INTO stats VALUES('HAD',17,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('HAD',19,88,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,88,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('HAD',9,88,90,2,NULL,NULL,FALSE,'{2,51}',NULL,NULL);
--12. match--
INSERT INTO stats VALUES('HAD',1,89,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',37,89,90,2,NULL,NULL,FALSE,'{12,47}',NULL,NULL);
INSERT INTO stats VALUES('HAD',2,89,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,89,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('HAD',23,89,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('HAD',7,89,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,89,74,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,89,90,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
INSERT INTO stats VALUES('HAD',15,89,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,89,90,1,NULL,NULL,FALSE,'{44}',NULL,NULL);
INSERT INTO stats VALUES('HAD',9,89,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,89,30,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
INSERT INTO stats VALUES('HAD',13,89,45,NULL,2,NULL,FALSE,NULL,'{47,69}',NULL);
INSERT INTO stats VALUES('HAD',11,89,16,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
--13. match--
INSERT INTO stats VALUES('HAD',1,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,104,90,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('HAD',6,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,104,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('HAD',11,104,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('HAD',19,104,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,104,62,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('HAD',20,104,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,104,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('HAD',7,104,28,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('HAD',17,104,45,NULL,1,NULL,FALSE,NULL,'{76}',NULL);
--14. match--
INSERT INTO stats VALUES('HAD',1,106,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,106,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('HAD',2,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,106,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('HAD',44,106,90,1,NULL,NULL,FALSE,'{90}',NULL,NULL);
INSERT INTO stats VALUES('HAD',90,106,90,NULL,2,NULL,FALSE,NULL,'{41,90}',NULL);
INSERT INTO stats VALUES('HAD',19,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,106,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('HAD',11,106,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,106,90,3,NULL,NULL,FALSE,'{32,41,75}',NULL,NULL);
INSERT INTO stats VALUES('HAD',18,106,70,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
--subs--
INSERT INTO stats VALUES('HAD',20,106,20,NULL,1,NULL,FALSE,NULL,'{75}',NULL);
INSERT INTO stats VALUES('HAD',13,106,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--15. match--
INSERT INTO stats VALUES('HAD',1,119,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',44,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('HAD',6,119,44,NULL,1,'{"red"}',FALSE,NULL,'{22}','{44}');
INSERT INTO stats VALUES('HAD',5,119,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('HAD',11,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('HAD',7,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('HAD',10,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('HAD',13,119,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('HAD',15,119,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',18,119,74,1,NULL,'{"yellow"}',FALSE,'{22}',NULL,'{51}');
--subs--
INSERT INTO stats VALUES('HAD',9,119,16,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('HAD',1,123,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,123,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,123,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,123,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',9,123,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('HAD',18,123,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,123,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,123,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--17. match--
INSERT INTO stats VALUES('HAD',1,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,134,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('HAD',81,134,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('HAD',23,134,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{38}');
INSERT INTO stats VALUES('HAD',44,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,134,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('HAD',17,134,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,134,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('HAD',13,134,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',7,134,60,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{14,60}');
INSERT INTO stats VALUES('HAD',18,134,81,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,134,9,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('HAD',90,134,45,1,NULL,'{"yellow"}',FALSE,'{56}',NULL,'{53}');
--18. match--
INSERT INTO stats VALUES('HAD',1,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,140,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('HAD',44,140,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('HAD',3,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,140,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',17,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,140,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,140,78,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,140,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('HAD',20,140,56,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{32,56,56}');
--subs--
INSERT INTO stats VALUES('HAD',9,140,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,140,12,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--19. match--
INSERT INTO stats VALUES('HAD',1,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',37,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,149,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('HAD',2,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,149,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('HAD',19,149,90,1,1,NULL,FALSE,'{47}','{23}',NULL);
INSERT INTO stats VALUES('HAD',13,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',9,149,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--20. match--
INSERT INTO stats VALUES('HAD',1,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',81,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',37,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,157,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,157,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,157,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',9,157,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,157,32,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,157,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,157,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('HAD',12,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('HAD',2,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('HAD',5,164,90,NULL,2,NULL,FALSE,NULL,'{19,78}',NULL);
INSERT INTO stats VALUES('HAD',6,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',15,164,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('HAD',13,164,90,1,NULL,'{"yellow"}',FALSE,'{19}',NULL,'{64}');
INSERT INTO stats VALUES('HAD',7,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',19,164,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,164,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('HAD',9,164,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,164,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{69}');
INSERT INTO stats VALUES('HAD',17,164,45,1,NULL,NULL,FALSE,'{78}',NULL,NULL);
--22. match--
INSERT INTO stats VALUES('HAD',22,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,174,90,2,NULL,NULL,FALSE,'{44,60}',NULL,NULL);
INSERT INTO stats VALUES('HAD',6,174,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('HAD',37,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,174,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('HAD',11,174,90,1,1,NULL,FALSE,'{78}','{33}',NULL);
INSERT INTO stats VALUES('HAD',7,174,63,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,174,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,174,90,NULL,3,NULL,FALSE,NULL,'{44,60,78}',NULL);
INSERT INTO stats VALUES('HAD',10,174,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',9,174,77,1,NULL,NULL,FALSE,'{33}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',97,174,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,174,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,174,27,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('HAD',1,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,179,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('HAD',2,179,90,NULL,1,NULL,FALSE,NULL,'{14}',NULL);
INSERT INTO stats VALUES('HAD',23,179,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('HAD',5,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,179,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('HAD',11,179,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,179,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,179,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('HAD',9,179,45,1,NULL,'{"yellow"}',FALSE,'{14}',NULL,'{32}');
--subs--
INSERT INTO stats VALUES('HAD',18,179,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,179,19,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('HAD',1,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,191,90,1,NULL,'{"yellow"}',FALSE,'{65}',NULL,'{11}');
INSERT INTO stats VALUES('HAD',2,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,191,72,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('HAD',15,191,61,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('HAD',11,191,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,191,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('HAD',9,191,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',20,191,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('HAD',13,191,29,NULL,1,NULL,FALSE,NULL,'{65}',NULL);
INSERT INTO stats VALUES('HAD',19,191,18,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
--25. match--
INSERT INTO stats VALUES('HAD',1,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',37,194,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('HAD',23,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,194,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,194,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,194,90,1,1,'{"yellow"}',FALSE,'{52}','{77}','{89}');
INSERT INTO stats VALUES('HAD',20,194,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,194,45,NULL,1,NULL,FALSE,NULL,'{52}',NULL);
INSERT INTO stats VALUES('HAD',17,194,30,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
--26. match--
INSERT INTO stats VALUES('HAD',22,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('HAD',2,208,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('HAD',6,208,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('HAD',13,208,90,1,1,NULL,FALSE,'{47}','{88}',NULL);
INSERT INTO stats VALUES('HAD',19,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('HAD',10,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('HAD',7,208,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('HAD',11,208,61,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('HAD',9,208,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,208,45,NULL,1,'{"yellow"}',FALSE,NULL,'{47}','{90}');
INSERT INTO stats VALUES('HAD',15,208,29,1,NULL,NULL,FALSE,'{88}',NULL,NULL);
--27. match--
INSERT INTO stats VALUES('HAD',1,209,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('HAD',5,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,209,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('HAD',2,209,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('HAD',6,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,209,64,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{27,64}');
INSERT INTO stats VALUES('HAD',11,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,209,90,1,NULL,NULL,FALSE,'{87}',NULL,NULL);
INSERT INTO stats VALUES('HAD',7,209,84,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,209,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('HAD',9,209,64,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',97,209,26,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,209,6,NULL,1,NULL,FALSE,NULL,'{87}',NULL);
INSERT INTO stats VALUES('HAD',17,209,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{76}');
--28. match--
INSERT INTO stats VALUES('HAD',1,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',6,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',23,224,90,1,NULL,NULL,FALSE,'{66}',NULL,NULL);
INSERT INTO stats VALUES('HAD',81,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',10,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,224,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',93,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',90,224,59,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',9,224,77,NULL,1,NULL,FALSE,NULL,'{73}',NULL);
--subs--
INSERT INTO stats VALUES('HAD',18,224,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,224,45,1,NULL,NULL,FALSE,'{73}',NULL,NULL);
INSERT INTO stats VALUES('HAD',13,224,31,NULL,1,'{"yellow"}',FALSE,NULL,'{66}','{69}');
--29. match--
INSERT INTO stats VALUES('HAD',1,226,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('HAD',2,226,90,NULL,1,NULL,FALSE,NULL,'{75}',NULL);
INSERT INTO stats VALUES('HAD',23,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,226,90,1,NULL,'{"yellow"}',FALSE,'{75}',NULL,'{51}');
INSERT INTO stats VALUES('HAD',6,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('HAD',13,226,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',17,226,90,NULL,1,NULL,FALSE,NULL,'{23}',NULL);
INSERT INTO stats VALUES('HAD',93,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('HAD',15,226,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('HAD',9,226,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
--30. match--
INSERT INTO stats VALUES('HAD',1,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',3,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',2,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',24,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',5,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',13,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',15,239,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('HAD',10,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',11,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',7,239,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('HAD',18,239,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('HAD',9,239,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);

--KRE--
--1. match--
INSERT INTO stats VALUES('KRE',1,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',36,2,89,1,NULL,'{"yellow","yellow","red"}',FALSE,'{42}',NULL,'{51,89,89}');
INSERT INTO stats VALUES('KRE',32,2,90,NULL,1,NULL,FALSE,NULL,'{12}',NULL);
INSERT INTO stats VALUES('KRE',11,2,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,2,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('KRE',10,2,90,1,NULL,NULL,FALSE,'{60}',NULL,NULL);
INSERT INTO stats VALUES('KRE',13,2,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('KRE',70,2,90,1,4,'{"yellow"}',FALSE,'{40}','{42,60,67,77}','{71}');
INSERT INTO stats VALUES('KRE',17,2,90,3,1,NULL,FALSE,'{12,67,77}','{40}',NULL);
--2. match--
INSERT INTO stats VALUES('KRE',33,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('KRE',3,15,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,15,90,1,1,NULL,FALSE,'{16}','{6}',NULL);
INSERT INTO stats VALUES('KRE',6,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('KRE',32,15,55,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('KRE',16,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('KRE',13,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('KRE',11,15,45,NULL,1,NULL,FALSE,NULL,'{16}',NULL);
INSERT INTO stats VALUES('KRE',10,15,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('KRE',61,15,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',7,15,85,1,NULL,'{"yellow"}',FALSE,'{6}',NULL,'{82}');
--subs--
INSERT INTO stats VALUES('KRE',9,15,5,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('KRE',14,15,22,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,15,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('KRE',33,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('KRE',6,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('KRE',21,19,90,NULL,1,NULL,FALSE,NULL,'{25}',NULL);
INSERT INTO stats VALUES('KRE',3,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,19,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,19,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('KRE',70,19,90,NULL,1,NULL,FALSE,NULL,'{46}',NULL);
INSERT INTO stats VALUES('KRE',13,19,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{18}');
INSERT INTO stats VALUES('KRE',14,19,90,1,NULL,'{"yellow"}',FALSE,'{46}',NULL,'{83}');
INSERT INTO stats VALUES('KRE',91,19,90,1,NULL,'{"yellow"}',FALSE,'{25}',NULL,'{69}');
INSERT INTO stats VALUES('KRE',17,19,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
--subs--
INSERT INTO stats VALUES('KRE',9,19,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,19,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('KRE',1,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,30,90,3,NULL,'{"yellow"}',FALSE,'{2,13,90}',NULL,'{42}');
INSERT INTO stats VALUES('KRE',21,30,90,1,NULL,'{"yellow"}',FALSE,'{75}',NULL,'{57}');
INSERT INTO stats VALUES('KRE',6,30,90,2,NULL,NULL,FALSE,'{52,80}',NULL,NULL);
INSERT INTO stats VALUES('KRE',32,30,90,NULL,1,NULL,FALSE,NULL,'{2}',NULL);
INSERT INTO stats VALUES('KRE',13,30,90,NULL,1,'{"yellow"}',FALSE,NULL,'{13}','{33}');
INSERT INTO stats VALUES('KRE',11,30,90,NULL,4,'{"yellow"}',FALSE,NULL,'{52,75,80,90}','{26}');
INSERT INTO stats VALUES('KRE',91,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,30,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('KRE',61,30,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',7,30,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,30,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--5. match--
INSERT INTO stats VALUES('KRE',1,36,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('KRE',3,36,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('KRE',6,36,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('KRE',21,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',36,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,36,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,36,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('KRE',14,36,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('KRE',16,36,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,36,90,NULL,1,'{"yellow"}',FALSE,NULL,'{85}','{67}');
INSERT INTO stats VALUES('KRE',7,36,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{26}');
--subs--
INSERT INTO stats VALUES('KRE',9,36,45,1,NULL,NULL,FALSE,'{85}',NULL,NULL);
INSERT INTO stats VALUES('KRE',70,36,13,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
--6. match--
INSERT INTO stats VALUES('KRE',1,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',35,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,45,90,1,NULL,NULL,FALSE,'{13}',NULL,NULL);
INSERT INTO stats VALUES('KRE',21,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,45,90,1,NULL,NULL,FALSE,'{44}',NULL,NULL);
INSERT INTO stats VALUES('KRE',10,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,45,90,NULL,1,NULL,FALSE,NULL,'{44}',NULL);
INSERT INTO stats VALUES('KRE',70,45,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('KRE',17,45,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('KRE',1,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('KRE',3,53,90,1,NULL,'{"yellow"}',FALSE,'{54}',NULL,'{68}');
INSERT INTO stats VALUES('KRE',6,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('KRE',36,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,53,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('KRE',13,53,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('KRE',91,53,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,53,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,53,90,NULL,1,NULL,FALSE,NULL,'{70}',NULL);
INSERT INTO stats VALUES('KRE',26,53,68,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
--subs--
INSERT INTO stats VALUES('KRE',7,53,22,1,NULL,'{"yellow"}',FALSE,'{70}',NULL,'{79}');
INSERT INTO stats VALUES('KRE',14,53,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,53,45,NULL,1,NULL,FALSE,NULL,'{54}',NULL);
--8. match--
INSERT INTO stats VALUES('KRE',1,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('KRE',35,60,90,1,NULL,NULL,FALSE,'{65}',NULL,NULL);
INSERT INTO stats VALUES('KRE',32,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('KRE',3,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('KRE',21,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('KRE',16,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('KRE',11,60,90,1,1,NULL,FALSE,'{23}','{65}',NULL);
INSERT INTO stats VALUES('KRE',13,60,90,NULL,2,NULL,FALSE,NULL,'{11,23}',NULL);
INSERT INTO stats VALUES('KRE',10,60,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('KRE',70,60,69,1,NULL,'{"yellow","red"}',FALSE,'{11}',NULL,'{46,69}');
INSERT INTO stats VALUES('KRE',26,60,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--9. match--
INSERT INTO stats VALUES('KRE',1,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{62}');
INSERT INTO stats VALUES('KRE',90,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('KRE',21,70,90,NULL,1,'{"yellow"}',FALSE,NULL,'{77}','{57}');
INSERT INTO stats VALUES('KRE',6,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,70,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('KRE',61,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,70,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('KRE',13,70,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',9,70,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('KRE',17,70,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
--10. match--
INSERT INTO stats VALUES('KRE',1,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('KRE',21,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('KRE',3,75,90,2,NULL,NULL,FALSE,'{12,33}',NULL,NULL);
INSERT INTO stats VALUES('KRE',6,75,90,NULL,3,NULL,FALSE,NULL,'{33,56,67}',NULL);
INSERT INTO stats VALUES('KRE',32,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('KRE',16,75,90,NULL,2,'{"yellow"}',FALSE,NULL,'{12,70}','{42}');
INSERT INTO stats VALUES('KRE',14,75,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,75,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('KRE',61,75,90,2,NULL,NULL,FALSE,'{67,70}',NULL,NULL);
INSERT INTO stats VALUES('KRE',13,75,58,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',9,75,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
--subs--
INSERT INTO stats VALUES('KRE',17,75,32,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('KRE',91,75,45,1,NULL,NULL,FALSE,'{56}',NULL,NULL);
--11. match--
INSERT INTO stats VALUES('KRE',1,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',36,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,87,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('KRE',5,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',91,87,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,87,82,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,87,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('KRE',14,87,72,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('KRE',9,87,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',7,87,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,87,18,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,87,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--12. match--
INSERT INTO stats VALUES('KRE',1,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('KRE',3,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('KRE',36,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('KRE',16,90,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('KRE',14,90,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,90,90,1,NULL,NULL,FALSE,'{57}',NULL,NULL);
INSERT INTO stats VALUES('KRE',7,90,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,90,45,NULL,1,'{"yellow"}',FALSE,NULL,'{57}','{74}');
--13. match--
INSERT INTO stats VALUES('KRE',1,104,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('KRE',5,104,90,1,1,NULL,FALSE,'{11}','{22}',NULL);
INSERT INTO stats VALUES('KRE',36,104,90,2,1,'{"yellow"}',FALSE,'{22,67}','{11}','{64}');
INSERT INTO stats VALUES('KRE',35,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,104,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,104,90,1,NULL,'{"yellow"}',FALSE,'{86}',NULL,'{45}');
INSERT INTO stats VALUES('KRE',91,104,67,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,104,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,104,90,NULL,1,NULL,FALSE,NULL,'{86}',NULL);
INSERT INTO stats VALUES('KRE',13,104,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{70}');
INSERT INTO stats VALUES('KRE',19,104,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,104,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,104,45,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('KRE',10,104,23,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--14. match--
INSERT INTO stats VALUES('KRE',1,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,105,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('KRE',5,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,105,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('KRE',70,105,90,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('KRE',10,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',91,105,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('KRE',9,105,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',7,105,45,1,2,NULL,FALSE,'{47}','{76,83}',NULL);
--15. match--
INSERT INTO stats VALUES('KRE',1,120,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('KRE',6,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,120,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('KRE',21,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,120,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,120,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('KRE',13,120,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('KRE',91,120,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{63}');
INSERT INTO stats VALUES('KRE',11,120,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('KRE',17,120,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
--subs--
INSERT INTO stats VALUES('KRE',9,120,43,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{56,88}');
--16. match--
INSERT INTO stats VALUES('KRE',1,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('KRE',5,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('KRE',35,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('KRE',70,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,122,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('KRE',61,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('KRE',91,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('KRE',7,122,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
--17. match--
INSERT INTO stats VALUES('KRE',12,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,135,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('KRE',36,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,135,44,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('KRE',11,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,135,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,135,56,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('KRE',9,135,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{15}');
--subs--
INSERT INTO stats VALUES('KRE',7,135,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,135,34,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--18. match--
INSERT INTO stats VALUES('KRE',1,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,139,90,NULL,1,NULL,FALSE,NULL,'{6}',NULL);
INSERT INTO stats VALUES('KRE',32,139,90,1,NULL,NULL,FALSE,'{76}',NULL,NULL);
INSERT INTO stats VALUES('KRE',3,139,90,1,NULL,NULL,FALSE,'{6}',NULL,NULL);
INSERT INTO stats VALUES('KRE',6,139,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('KRE',70,139,90,NULL,1,NULL,FALSE,NULL,'{76}',NULL);
INSERT INTO stats VALUES('KRE',10,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,139,90,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('KRE',11,139,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',91,139,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('KRE',7,139,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
--19. match--
INSERT INTO stats VALUES('KRE',1,150,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('KRE',32,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('KRE',6,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('KRE',5,150,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,150,90,NULL,1,NULL,FALSE,NULL,'{80}',NULL);
INSERT INTO stats VALUES('KRE',10,150,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{54}');
INSERT INTO stats VALUES('KRE',11,150,74,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('KRE',16,150,90,2,NULL,'{"yellow"}',FALSE,'{33,80}',NULL,'{51}');
INSERT INTO stats VALUES('KRE',14,150,90,NULL,1,NULL,FALSE,NULL,'{47}',NULL);
INSERT INTO stats VALUES('KRE',13,150,90,NULL,1,NULL,FALSE,NULL,'{33}',NULL);
INSERT INTO stats VALUES('KRE',7,150,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',17,150,45,1,NULL,NULL,FALSE,'{47}',NULL,NULL);
INSERT INTO stats VALUES('KRE',91,150,16,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--20. match--
INSERT INTO stats VALUES('KRE',22,156,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('KRE',90,156,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,156,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('KRE',32,156,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,156,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,156,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,156,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('KRE',61,156,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,156,71,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,156,82,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('KRE',7,156,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
--subs--
INSERT INTO stats VALUES('KRE',17,156,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('KRE',91,156,19,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('KRE',70,156,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('KRE',1,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',3,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',90,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,165,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,165,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',9,165,83,NULL,1,NULL,FALSE,NULL,'{79}',NULL);
--subs--
INSERT INTO stats VALUES('KRE',17,165,7,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('KRE',13,165,22,1,NULL,NULL,FALSE,'{79}',NULL,NULL);
--22. match--
INSERT INTO stats VALUES('KRE',1,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',36,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,173,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{17}');
INSERT INTO stats VALUES('KRE',19,173,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('KRE',1,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,180,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('KRE',35,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',32,180,90,1,NULL,NULL,FALSE,'{89}',NULL,NULL);
INSERT INTO stats VALUES('KRE',10,180,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('KRE',70,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,180,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('KRE',16,180,90,NULL,2,NULL,FALSE,NULL,'{83,89}',NULL);
INSERT INTO stats VALUES('KRE',13,180,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',9,180,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--24. match--
INSERT INTO stats VALUES('KRE',1,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('KRE',21,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('KRE',36,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('KRE',35,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('KRE',10,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',70,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('KRE',91,190,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{38}');
INSERT INTO stats VALUES('KRE',17,190,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('KRE',1,195,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('KRE',5,195,90,NULL,1,NULL,FALSE,NULL,'{41}',NULL);
INSERT INTO stats VALUES('KRE',21,195,90,2,NULL,NULL,FALSE,'{41,88}',NULL,NULL);
INSERT INTO stats VALUES('KRE',3,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,195,90,NULL,1,NULL,FALSE,NULL,'{88}',NULL);
INSERT INTO stats VALUES('KRE',11,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,195,90,1,NULL,NULL,FALSE,'{62}',NULL,NULL);
INSERT INTO stats VALUES('KRE',14,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,195,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,195,90,NULL,1,NULL,FALSE,NULL,'{56}',NULL);
INSERT INTO stats VALUES('KRE',7,195,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',17,195,45,1,1,'{"yellow"}',FALSE,'{56}','{62}','{87}');
--26. match--
INSERT INTO stats VALUES('KRE',1,207,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',35,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,207,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{32}');
INSERT INTO stats VALUES('KRE',10,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,207,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('KRE',14,207,73,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,207,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',19,207,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',7,207,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('KRE',70,207,17,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--27. match--
INSERT INTO stats VALUES('KRE',1,210,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{76}');
INSERT INTO stats VALUES('KRE',6,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,210,90,NULL,1,NULL,FALSE,NULL,'{52}',NULL);
INSERT INTO stats VALUES('KRE',90,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('KRE',3,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('KRE',11,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',16,210,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('KRE',61,210,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,210,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',7,210,72,NULL,1,NULL,FALSE,NULL,'{50}',NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,210,18,1,NULL,NULL,FALSE,'{80}',NULL,NULL);
INSERT INTO stats VALUES('KRE',91,210,45,2,1,'{"yellow"}',FALSE,'{50,52}','{80}','{88}');
--28. match--
INSERT INTO stats VALUES('KRE',22,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,224,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('KRE',32,224,90,1,NULL,'{"yellow"}',FALSE,'{35}',NULL,'{89}');
INSERT INTO stats VALUES('KRE',3,224,90,NULL,1,NULL,FALSE,NULL,'{3}',NULL);
INSERT INTO stats VALUES('KRE',35,224,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('KRE',70,224,68,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,224,90,NULL,1,'{"yellow"}',FALSE,NULL,'{35}','{15}');
INSERT INTO stats VALUES('KRE',14,224,90,NULL,1,'{"yellow"}',FALSE,NULL,'{67}','{13}');
INSERT INTO stats VALUES('KRE',91,224,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,224,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('KRE',17,224,45,1,NULL,'{"yellow"}',FALSE,'{3}',NULL,'{32}');
--subs--
INSERT INTO stats VALUES('KRE',26,224,45,2,NULL,'{"yellow"}',FALSE,'{67,81}',NULL,'{55}');
INSERT INTO stats VALUES('KRE',10,224,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,224,22,NULL,1,NULL,FALSE,NULL,'{81}',NULL);
--29. match--
INSERT INTO stats VALUES('KRE',1,225,90,NULL,NULL,'{"yellow"}',TRUE,NULL,NULL,'{77}');
INSERT INTO stats VALUES('KRE',6,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',36,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',35,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,225,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('KRE',70,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',13,225,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('KRE',61,225,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{27}');
INSERT INTO stats VALUES('KRE',16,225,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{43}');
INSERT INTO stats VALUES('KRE',11,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',7,225,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,225,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('KRE',33,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',35,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',5,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',6,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',21,240,90,1,NULL,NULL,FALSE,'{35}',NULL,NULL);
INSERT INTO stats VALUES('KRE',13,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',10,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',14,240,82,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('KRE',70,240,63,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',91,240,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',17,240,45,NULL,1,NULL,FALSE,NULL,'{35}',NULL);
--subs--
INSERT INTO stats VALUES('KRE',9,240,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',11,240,8,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('KRE',61,240,27,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{77}');

--FKB--
--1. match--
INSERT INTO stats VALUES('FKB',1,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FKB',19,1,90,2,NULL,'{"yellow"}',FALSE,'{11,37}',NULL,'{47}');
INSERT INTO stats VALUES('FKB',6,1,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{52}');
INSERT INTO stats VALUES('FKB',4,1,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKB',27,1,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,1,90,NULL,2,'{"yellow"}',FALSE,NULL,'{11,37}','{51}');
INSERT INTO stats VALUES('FKB',11,1,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKB',29,1,60,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{50}');
INSERT INTO stats VALUES('FKB',9,1,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
--subs--
INSERT INTO stats VALUES('FKB',17,1,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,1,30,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--2. match--
INSERT INTO stats VALUES('FKB',1,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKB',45,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('FKB',20,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{22}');
INSERT INTO stats VALUES('FKB',21,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('FKB',4,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('FKB',29,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{79}');
INSERT INTO stats VALUES('FKB',22,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{56}');
INSERT INTO stats VALUES('FKB',77,9,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('FKB',7,9,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',93,9,77,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,9,13,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--3. match--
INSERT INTO stats VALUES('FKB',1,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,17,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FKB',7,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,17,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{42}');
INSERT INTO stats VALUES('FKB',9,17,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,17,20,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{47,65}');
INSERT INTO stats VALUES('FKB',11,17,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--4. match--
INSERT INTO stats VALUES('FKB',1,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,25,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('FKB',20,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,25,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',25,25,90,NULL,1,'{"yellow"}',FALSE,NULL,'{3}','{78}');
INSERT INTO stats VALUES('FKB',22,25,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{74}');
INSERT INTO stats VALUES('FKB',10,25,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{25}');
INSERT INTO stats VALUES('FKB',29,25,90,1,NULL,NULL,FALSE,'{69}',NULL,NULL);
INSERT INTO stats VALUES('FKB',11,25,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,25,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
INSERT INTO stats VALUES('FKB',93,25,45,1,NULL,NULL,FALSE,'{3}',NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',9,25,45,NULL,1,NULL,FALSE,NULL,'{69}',NULL);
INSERT INTO stats VALUES('FKB',27,25,30,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
--5. match--
INSERT INTO stats VALUES('FKB',1,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{37}');
INSERT INTO stats VALUES('FKB',19,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',21,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,33,88,NULL,NULL,'{"yellow","red"}',FALSE,NULL,NULL,'{80,88}');
INSERT INTO stats VALUES('FKB',11,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{45}');
INSERT INTO stats VALUES('FKB',7,33,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,33,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{75}');
INSERT INTO stats VALUES('FKB',27,33,90,1,NULL,NULL,FALSE,'{31}',NULL,NULL);
INSERT INTO stats VALUES('FKB',17,33,45,NULL,1,'{"yellow"}',FALSE,NULL,'{31}','{16}');
--subs--
INSERT INTO stats VALUES('FKB',9,33,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--6. match--
INSERT INTO stats VALUES('FKB',1,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,41,90,1,1,NULL,FALSE,'{13}','{42}',NULL);
INSERT INTO stats VALUES('FKB',4,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,41,90,1,NULL,NULL,FALSE,'{42}',NULL,NULL);
INSERT INTO stats VALUES('FKB',7,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,41,90,NULL,1,NULL,FALSE,NULL,'{13}',NULL);
INSERT INTO stats VALUES('FKB',27,41,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,41,79,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,41,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,41,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKB',29,41,11,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--7. match--
INSERT INTO stats VALUES('FKB',1,49,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',45,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
INSERT INTO stats VALUES('FKB',19,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',21,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKB',27,49,90,NULL,1,NULL,FALSE,NULL,'{85}',NULL);
INSERT INTO stats VALUES('FKB',7,49,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,49,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{35}');
INSERT INTO stats VALUES('FKB',29,49,72,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKB',77,49,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,49,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',17,49,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,49,30,1,NULL,'{"yellow"}',FALSE,'{85}',NULL,'{77}');
INSERT INTO stats VALUES('FKB',10,49,18,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
--8. match--
INSERT INTO stats VALUES('FKB',1,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('FKB',2,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{31}');
INSERT INTO stats VALUES('FKB',6,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('FKB',4,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('FKB',19,57,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKB',29,57,90,1,NULL,'{"yellow"}',FALSE,'{34}',NULL,'{23}');
INSERT INTO stats VALUES('FKB',10,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,57,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',17,57,90,NULL,1,'{"yellow"}',FALSE,NULL,'{34}','{21}');
--9. match--
INSERT INTO stats VALUES('FKB',1,65,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,65,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('FKB',4,65,90,1,2,'{"yellow"}',FALSE,'{47}','{32,51}','{44}');
INSERT INTO stats VALUES('FKB',2,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,65,90,2,NULL,'{"yellow"}',FALSE,'{11,81}',NULL,'{56}');
INSERT INTO stats VALUES('FKB',24,65,90,NULL,1,NULL,FALSE,NULL,'{11}',NULL);
INSERT INTO stats VALUES('FKB',7,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,65,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,65,90,NULL,1,'{"yellow"}',FALSE,NULL,'{81}','{89}');
INSERT INTO stats VALUES('FKB',9,65,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',17,65,45,1,1,'{"yellow"}',FALSE,'{51}','{47}','{80}');
--10. match--
INSERT INTO stats VALUES('FKB',1,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',25,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{53}');
INSERT INTO stats VALUES('FKB',23,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{58}');
INSERT INTO stats VALUES('FKB',20,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FKB',11,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{38}');
INSERT INTO stats VALUES('FKB',77,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('FKB',24,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,73,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,73,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
--11. match--
INSERT INTO stats VALUES('FKB',1,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',21,81,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{19}');
INSERT INTO stats VALUES('FKB',20,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,81,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{44}');
INSERT INTO stats VALUES('FKB',11,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,81,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,81,90,1,NULL,'{"yellow"}',FALSE,'{16}',NULL,'{62}');
INSERT INTO stats VALUES('FKB',9,81,90,NULL,1,NULL,FALSE,NULL,'{16}',NULL);
--12. match--
INSERT INTO stats VALUES('FKB',1,89,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,89,90,1,NULL,'{"yellow"}',FALSE,'{1}',NULL,'{34}');
INSERT INTO stats VALUES('FKB',23,89,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{13}');
INSERT INTO stats VALUES('FKB',2,89,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('FKB',21,89,90,NULL,1,'{"yellow"}',FALSE,NULL,'{1}','{44}');
INSERT INTO stats VALUES('FKB',10,89,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('FKB',22,89,90,NULL,1,'{"yellow"}',FALSE,NULL,'{87}','{79}');
INSERT INTO stats VALUES('FKB',7,89,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('FKB',11,89,90,1,NULL,'{"yellow"}',FALSE,'{77}',NULL,'{48}');
INSERT INTO stats VALUES('FKB',27,89,90,1,NULL,'{"yellow"}',FALSE,'{87}',NULL,'{90}');
INSERT INTO stats VALUES('FKB',37,89,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--13. match--
INSERT INTO stats VALUES('FKB',12,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{65}');
INSERT INTO stats VALUES('FKB',20,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKB',6,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,97,90,NULL,1,'{"yellow"}',FALSE,NULL,'{25}','{56}');
INSERT INTO stats VALUES('FKB',22,97,90,1,NULL,NULL,FALSE,'{25}',NULL,NULL);
INSERT INTO stats VALUES('FKB',10,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('FKB',29,97,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',17,97,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
--14. match--
INSERT INTO stats VALUES('FKB',1,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',25,105,66,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{66}');
INSERT INTO stats VALUES('FKB',2,105,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{48}');
INSERT INTO stats VALUES('FKB',19,105,90,1,NULL,'{"yellow"}',FALSE,'{34}',NULL,'{61}');
INSERT INTO stats VALUES('FKB',29,105,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FKB',24,105,90,NULL,1,NULL,FALSE,NULL,'{34}',NULL);
INSERT INTO stats VALUES('FKB',7,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,105,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,105,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{83}');
INSERT INTO stats VALUES('FKB',9,105,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,105,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
--15. match--
INSERT INTO stats VALUES('FKB',1,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',45,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',23,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,113,90,NULL,1,NULL,FALSE,NULL,'{87}',NULL);
INSERT INTO stats VALUES('FKB',22,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,113,90,1,NULL,NULL,FALSE,'{87}',NULL,NULL);
INSERT INTO stats VALUES('FKB',29,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',17,113,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--16. match--
INSERT INTO stats VALUES('FKB',1,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,121,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
INSERT INTO stats VALUES('FKB',19,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,121,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKB',7,121,90,1,NULL,NULL,FALSE,'{20}',NULL,NULL);
INSERT INTO stats VALUES('FKB',10,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,121,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,121,61,NULL,NULL,'{"red"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('FKB',27,121,59,NULL,1,'{"yellow"}',FALSE,NULL,'{20}','{32}');
INSERT INTO stats VALUES('FKB',9,121,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',93,121,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKB',24,121,31,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{87}');
--17. match--
INSERT INTO stats VALUES('FKB',1,129,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKB',6,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,129,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,129,90,NULL,1,NULL,FALSE,NULL,'{79}',NULL);
INSERT INTO stats VALUES('FKB',27,129,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,129,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('FKB',7,129,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{85}');
INSERT INTO stats VALUES('FKB',93,129,80,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,129,10,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,129,45,1,NULL,NULL,FALSE,'{79}',NULL,NULL);
--18. match--
INSERT INTO stats VALUES('FKB',1,137,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
INSERT INTO stats VALUES('FKB',2,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,137,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{72}');
INSERT INTO stats VALUES('FKB',19,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,137,90,NULL,1,NULL,FALSE,NULL,'{26}',NULL);
INSERT INTO stats VALUES('FKB',10,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,137,90,1,NULL,NULL,FALSE,'{26}',NULL,NULL);
INSERT INTO stats VALUES('FKB',7,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,137,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,137,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{63}');
--19. match--
INSERT INTO stats VALUES('FKB',1,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,145,90,1,NULL,NULL,FALSE,'{83}',NULL,NULL);
INSERT INTO stats VALUES('FKB',20,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{57}');
INSERT INTO stats VALUES('FKB',21,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,145,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{23}');
INSERT INTO stats VALUES('FKB',29,145,90,NULL,1,NULL,FALSE,NULL,'{83}',NULL);
INSERT INTO stats VALUES('FKB',11,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,145,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,145,90,NULL,1,NULL,FALSE,NULL,'{67}',NULL);
INSERT INTO stats VALUES('FKB',9,145,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{41}');
--subs--
INSERT INTO stats VALUES('FKB',17,145,45,1,NULL,NULL,FALSE,'{67}',NULL,NULL);
--20. match--
INSERT INTO stats VALUES('FKB',1,153,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{89}');
INSERT INTO stats VALUES('FKB',2,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,153,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('FKB',23,153,90,NULL,1,NULL,FALSE,NULL,'{77}',NULL);
INSERT INTO stats VALUES('FKB',4,153,90,1,NULL,NULL,FALSE,'{21}',NULL,NULL);
INSERT INTO stats VALUES('FKB',27,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,153,90,1,NULL,NULL,FALSE,'{77}',NULL,NULL);
INSERT INTO stats VALUES('FKB',77,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,153,90,NULL,1,'{"yellow"}',FALSE,NULL,'{21}','{32}');
INSERT INTO stats VALUES('FKB',7,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,153,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--21. match--
INSERT INTO stats VALUES('FKB',1,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{12}');
INSERT INTO stats VALUES('FKB',2,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{73}');
INSERT INTO stats VALUES('FKB',4,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{46}');
INSERT INTO stats VALUES('FKB',10,161,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{82}');
INSERT INTO stats VALUES('FKB',7,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,161,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,161,90,NULL,1,'{"yellow"}',FALSE,NULL,'{33}','{67}');
INSERT INTO stats VALUES('FKB',9,161,72,1,NULL,'{"yellow"}',FALSE,'{33}',NULL,'{61}');
--subs--
INSERT INTO stats VALUES('FKB',17,161,18,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{78}');
--22. match--
INSERT INTO stats VALUES('FKB',1,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',23,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,169,90,1,NULL,'{"yellow"}',FALSE,'{7}',NULL,'{89}');
INSERT INTO stats VALUES('FKB',45,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,169,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,169,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{84}');
INSERT INTO stats VALUES('FKB',9,169,86,NULL,1,NULL,FALSE,NULL,'{7}',NULL);
--subs--
INSERT INTO stats VALUES('FKB',93,169,4,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--23. match--
INSERT INTO stats VALUES('FKB',1,177,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{68}');
INSERT INTO stats VALUES('FKB',21,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',45,177,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('FKB',24,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,177,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{47}');
INSERT INTO stats VALUES('FKB',10,177,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{51}');
INSERT INTO stats VALUES('FKB',77,177,23,NULL,NULL,'{"yellow","yellow","red"}',FALSE,NULL,NULL,'{11,23,23}');
INSERT INTO stats VALUES('FKB',9,177,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--24. match--
INSERT INTO stats VALUES('FKB',1,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,185,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{36}');
INSERT INTO stats VALUES('FKB',4,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,185,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{71}');
INSERT INTO stats VALUES('FKB',27,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,185,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,185,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,185,61,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,185,90,1,NULL,NULL,FALSE,'{32}',NULL,NULL);
INSERT INTO stats VALUES('FKB',9,185,73,NULL,1,NULL,FALSE,NULL,'{32}',NULL);
--subs--
INSERT INTO stats VALUES('FKB',37,185,17,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{88}');
INSERT INTO stats VALUES('FKB',29,185,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',24,185,29,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--25. match--
INSERT INTO stats VALUES('FKB',12,193,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FKB',6,193,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{81}');
INSERT INTO stats VALUES('FKB',19,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',25,193,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{64}');
INSERT INTO stats VALUES('FKB',23,193,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{86}');
INSERT INTO stats VALUES('FKB',10,193,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,193,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,193,90,1,NULL,NULL,FALSE,'{12}',NULL,NULL);
INSERT INTO stats VALUES('FKB',77,193,90,NULL,2,NULL,FALSE,NULL,'{12,33}',NULL);
INSERT INTO stats VALUES('FKB',22,193,90,NULL,1,NULL,FALSE,NULL,'{60}',NULL);
INSERT INTO stats VALUES('FKB',9,193,88,2,NULL,'{"yellow"}',FALSE,'{33,60}',NULL,'{61}');
--subs--
INSERT INTO stats VALUES('FKB',17,193,2,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,193,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{55}');
--26. match--
INSERT INTO stats VALUES('FKB',1,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,201,90,1,NULL,NULL,FALSE,'{23}',NULL,NULL);
INSERT INTO stats VALUES('FKB',2,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,201,90,1,1,NULL,FALSE,'{49}','{23}',NULL);
INSERT INTO stats VALUES('FKB',11,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,201,90,NULL,3,NULL,FALSE,NULL,'{56,60,66}',NULL);
INSERT INTO stats VALUES('FKB',24,201,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',37,201,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',9,201,45,3,1,NULL,FALSE,'{56,60,66}','{49}',NULL);
--27. match--
INSERT INTO stats VALUES('FKB',1,209,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{80}');
INSERT INTO stats VALUES('FKB',4,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,209,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{33}');
INSERT INTO stats VALUES('FKB',11,209,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,209,66,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',37,209,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',17,209,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKB',24,209,24,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--28. match--
INSERT INTO stats VALUES('FKB',1,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',6,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',20,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',22,217,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{49}');
INSERT INTO stats VALUES('FKB',10,217,90,NULL,1,'{"yellow"}',FALSE,NULL,'{15}','{33}');
INSERT INTO stats VALUES('FKB',7,217,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,217,90,NULL,1,'{"yellow"}',FALSE,NULL,'{64}','{47}');
INSERT INTO stats VALUES('FKB',11,217,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{61}');
INSERT INTO stats VALUES('FKB',37,217,90,2,NULL,'{"yellow"}',FALSE,'{15,64}',NULL,'{75}');
--29. match--
INSERT INTO stats VALUES('FKB',1,225,90,NULL,NULL,NULL,TRUE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',25,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',19,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',4,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',27,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',10,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',77,225,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',7,225,62,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',9,225,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--subs--
INSERT INTO stats VALUES('FKB',93,225,45,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,225,28,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
--30. match--
INSERT INTO stats VALUES('FKB',1,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',2,233,90,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{90}');
INSERT INTO stats VALUES('FKB',20,233,90,NULL,1,NULL,FALSE,NULL,'{15}',NULL);
INSERT INTO stats VALUES('FKB',23,233,90,1,NULL,NULL,FALSE,'{15}',NULL,NULL);
INSERT INTO stats VALUES('FKB',45,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',29,233,77,1,NULL,'{"yellow","yellow","red"}',FALSE,'{51}',NULL,'{70,77,77}');
INSERT INTO stats VALUES('FKB',24,233,90,NULL,1,NULL,FALSE,NULL,'{51}',NULL);
INSERT INTO stats VALUES('FKB',27,233,90,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',11,233,90,1,NULL,NULL,FALSE,'{87}',NULL,NULL);
INSERT INTO stats VALUES('FKB',22,233,60,NULL,NULL,NULL,FALSE,NULL,NULL,NULL);
INSERT INTO stats VALUES('FKB',37,233,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{16}');
--subs--
INSERT INTO stats VALUES('FKB',17,233,45,NULL,NULL,'{"yellow"}',FALSE,NULL,NULL,'{67}');
INSERT INTO stats VALUES('FKB',7,233,30,NULL,1,NULL,FALSE,NULL,'{87}',NULL);


COMMIT;
--created by Szymon Auguścik--
