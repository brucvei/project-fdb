DROP DATABASE IF EXISTS olympic_athletes_normalized;

CREATE DATABASE olympic_athletes_normalized;

--
-- Table athletes
--

CREATE TABLE athletes (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  born_date date DEFAULT NULL,
  born_city varchar(255) DEFAULT NULL,
  height_cm int DEFAULT NULL,
  weight_kg int DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
);

INSERT INTO athletes VALUES (1,'Akinori Nakayama','1943-03-01','Nagoya, Aichi (JPN)',163,59),(2,'Chiharu Igaya','1931-05-20','Tomari, Hokkaido (JPN)',166,68),(3,'Daiki Hashimoto','2001-08-07',NULL,NULL,NULL),(4,'Eizo Kenmotsu','1948-02-13','?, Okayama (JPN)',161,57),(5,'Kaori Icho','1984-06-13','Hachinohe, Aomori (JPN)',166,61),(6,'Kazuma Kaya','1996-11-19',NULL,NULL,NULL),(7,'Kohei Uchimura','1989-01-03','Kitakyushu, Fukuoka (JPN)',160,54),(8,'Koki Ikeda','1998-05-03','Hamamatsu, Shizuoka (JPN)',NULL,NULL),(9,'Kosuke Kitajima','1982-09-22','Arakawa, Tokyo (JPN)',178,73),(10,'Mai Murakami','1996-08-05','Sagamihara, Kanagawa (JPN)',146,48),(11,'Masaji Kiyokawa','1913-02-11','Toyohashi, Aichi (JPN)',NULL,NULL),(12,'Mitsuo Tsukahara','1947-12-22','Tokyo, Tokyo (JPN)',167,66),(13,'Saori Yoshida','1982-10-05','Tsu, Mie (JPN)',157,55),(14,'Sawao Kato','1946-10-11','Gosen, Niigata (JPN)',163,59),(15,'Takaharu Furukawa','1984-08-09','Aomori, Aomori (JPN)',174,89),(16,'Takashi Ono','1931-07-26','Noshiro, Akita (JPN)',160,58),(17,'Tsunekazu Takeda','1947-11-01','Tokyo, Tokyo (JPN)',172,60),(18,'Yasuhiro Yamashita','1957-06-01','Yabe, Yamato, Kumamoto (JPN)',180,127),(19,'Yuki Ota','1985-11-25','Otsu, Shiga (JPN)',171,69),(20,'Yukio Endo','1937-01-18','Akita, Akita (JPN)',161,58);

--
-- Table biographical_information
--

CREATE TABLE biographical_information (
  id int NOT NULL AUTO_INCREMENT,
  athlete_id int DEFAULT NULL,
  category varchar(255) DEFAULT NULL,
  detail varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY athlete_id (athlete_id),
  CONSTRAINT biographical_information_ibfk_1 FOREIGN KEY (athlete_id) REFERENCES athletes (id)
);

INSERT INTO biographical_information VALUES (1,1,'Roles','Competed in Olympic Games'),(2,1,'Sex','Male'),(3,1,'Full name','Akinori Nakayama'),(4,1,'Used name','Akinori Nakayama'),(5,1,'Original name','中山 彰規'),(6,1,'NOC',' Japan'),(7,2,'Roles','Competed in Olympic Games   Administrator'),(8,2,'Sex','Male'),(9,2,'Full name','Chiharu Igaya'),(10,2,'Used name','Chiharu Igaya'),(11,2,'Nick/petnames','Chick'),(12,2,'Original name','猪谷 千春'),(13,2,'Affiliations','Tokyo Oizumi High School / Dartmouth College (USA) / Physical Education Association, Yamanouchi, Nagano'),(14,2,'NOC',' Japan'),(15,3,'Roles','Competed in Olympic Games'),(16,3,'Sex','Male'),(17,3,'Full name','Daiki Hashimoto'),(18,3,'Used name','Daiki Hashimoto'),(19,3,'Original name','橋本 大輝'),(20,3,'Affiliations','Juntendo University, Bunkyo (JPN)'),(21,3,'NOC',' Japan'),(22,4,'Roles','Competed in Olympic Games'),(23,4,'Sex','Male'),(24,4,'Full name','Eizo Kenmotsu'),(25,4,'Used name','Eizo Kenmotsu'),(26,4,'Original name','監物 永三'),(27,4,'NOC',' Japan'),(28,5,'Roles','Competed in Olympic Games'),(29,5,'Sex','Female'),(30,5,'Full name','Kaori Icho'),(31,5,'Used name','Kaori Icho'),(32,5,'Original name','伊調 馨'),(33,5,'Affiliations','High School Wrestling Club Nagoya'),(34,5,'NOC',' Japan'),(35,6,'Roles','Competed in Olympic Games'),(36,6,'Sex','Male'),(37,6,'Full name','Kazuma Kaya'),(38,6,'Used name','Kazuma Kaya'),(39,6,'Original name','萱 和磨'),(40,6,'Affiliations','Central Sports, Tokyo (JPN)'),(41,6,'NOC',' Japan'),(42,7,'Roles','Competed in Olympic Games'),(43,7,'Sex','Male'),(44,7,'Full name','Kohei Uchimura'),(45,7,'Used name','Kohei Uchimura'),(46,7,'Nick/petnames','King Kohei, Superman'),(47,7,'Original name','内村 航平'),(48,7,'Affiliations','Nippon Taiiku Daigaku, Setagaya (JPN) / Konami SC, Tokyo (JPN)'),(49,7,'NOC',' Japan'),(50,8,'Roles','Competed in Olympic Games'),(51,8,'Sex','Male'),(52,8,'Full name','Koki Ikeda'),(53,8,'Used name','Koki Ikeda'),(54,8,'Original name','池田 向希'),(55,8,'NOC',' Japan'),(56,9,'Roles','Competed in Olympic Games   Other'),(57,9,'Sex','Male'),(58,9,'Full name','Kosuke Kitajima'),(59,9,'Used name','Kosuke Kitajima'),(60,9,'Original name','北島 康介'),(61,9,'Affiliations','Coca Cola Japan'),(62,9,'NOC',' Japan'),(63,10,'Roles','Competed in Olympic Games'),(64,10,'Sex','Female'),(65,10,'Full name','Mai Murakami'),(66,10,'Used name','Mai Murakami'),(67,10,'Original name','村上 茉愛'),(68,10,'Affiliations','Nippon Taiiku Daigaku, Setagaya (JPN)'),(69,10,'NOC',' Japan'),(70,11,'Roles','Competed in Olympic Games   Administrator'),(71,11,'Sex','Male'),(72,11,'Full name','Masaji Kiyokawa'),(73,11,'Used name','Masaji Kiyokawa'),(74,11,'Original name','清川 正二'),(75,11,'Died','13 April 1999 in Tokyo, Tokyo (JPN)'),(76,11,'Affiliations','Nagoya Higher Commercial School, Nagoya (JPN) / Hitotsubashi University, Kanda (JPN)'),(77,11,'NOC',' Japan'),(78,12,'Roles','Competed in Olympic Games'),(79,12,'Sex','Male'),(80,12,'Full name','Mitsuo Tsukahara'),(81,12,'Used name','Mitsuo Tsukahara'),(82,12,'Original name','塚原 光男'),(83,12,'NOC',' Japan'),(84,13,'Roles','Competed in Olympic Games   Other'),(85,13,'Sex','Female'),(86,13,'Full name','Saori Yoshida'),(87,13,'Used name','Saori Yoshida'),(88,13,'Original name','吉田 沙保里'),(89,13,'Affiliations','High School Wrestling Club Hisai/Sogho Security Services'),(90,13,'NOC',' Japan'),(91,14,'Roles','Competed in Olympic Games'),(92,14,'Sex','Male'),(93,14,'Full name','Sawao Kato'),(94,14,'Used name','Sawao Kato'),(95,14,'Original name','加藤 澤男'),(96,14,'NOC',' Japan'),(97,15,'Roles','Competed in Olympic Games'),(98,15,'Sex','Male'),(99,15,'Full name','Takaharu Furukawa'),(100,15,'Used name','Takaharu Furukawa'),(101,15,'Original name','古川 高晴'),(102,15,'Affiliations','Kindai University, Higashiosaka (JPN)'),(103,15,'NOC',' Japan'),(104,16,'Roles','Competed in Olympic Games   Other'),(105,16,'Sex','Male'),(106,16,'Full name','Takashi Ono'),(107,16,'Used name','Takashi Ono'),(108,16,'Original name','小野 喬'),(109,16,'NOC',' Japan'),(110,17,'Roles','Competed in Olympic Games   Administrator'),(111,17,'Sex','Male'),(112,17,'Full name','Tsunekazu Takeda'),(113,17,'Used name','Tsunekazu Takeda'),(114,17,'Original name','竹田 恆和'),(115,17,'Affiliations','Keio University (JPN)'),(116,17,'NOC',' Japan'),(117,18,'Roles','Competed in Olympic Games   Administrator'),(118,18,'Sex','Male'),(119,18,'Full name','Yasuhiro Yamashita'),(120,18,'Used name','Yasuhiro Yamashita'),(121,18,'Original name','山下 泰裕'),(122,18,'NOC',' Japan'),(123,19,'Roles','Competed in Olympic Games   Administrator'),(124,19,'Sex','Male'),(125,19,'Full name','Yuki Ota'),(126,19,'Used name','Yuki Ota'),(127,19,'Original name','太田 雄貴'),(128,19,'Affiliations','Kyoto Club'),(129,19,'NOC',' Japan'),(130,20,'Roles','Competed in Olympic Games   Other'),(131,20,'Sex','Male'),(132,20,'Full name','Yukio Endo'),(133,20,'Used name','Yukio Endo'),(134,20,'Original name','遠藤 幸雄'),(135,20,'Died','25 March 2009 in Tokyo, Tokyo (JPN)'),(136,20,'NOC',' Japan');

--
-- Table disciplines
--

CREATE TABLE disciplines (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
);

INSERT INTO disciplines VALUES (24,'100 metres Backstroke, Men'),(15,'100 metres Breaststroke, Men'),(14,'20 kilometres Race Walk, Men'),(16,'200 metres Breaststroke, Men'),(17,'4 × 100 metres Medley Relay, Men'),(22,'Balance Beam, Women'),(9,'Downhill, Men'),(25,'Featherweight, Freestyle, Women'),(3,'Floor Exercise, Men'),(20,'Floor Exercise, Women'),(31,'Foil, Individual, Men'),(32,'Foil, Team, Men'),(10,'Giant Slalom, Men'),(6,'Horizontal Bar, Men'),(4,'Horse Vault, Men'),(23,'Horse Vault, Women'),(1,'Individual All-Around, Men'),(18,'Individual All-Around, Women'),(26,'Individual, Men'),(28,'Individual, Open'),(13,'Lightweight, Freestyle, Women'),(12,'Middleweight, Freestyle, Women'),(30,'Open Class, Men'),(5,'Parallel Bars, Men'),(8,'Pommelled Horse, Men'),(7,'Rings, Men'),(11,'Slalom, Men'),(2,'Team All-Around, Men'),(19,'Team All-Around, Women'),(27,'Team, Men'),(29,'Team, Open'),(21,'Uneven Bars, Women');

--
-- Table games
--

CREATE TABLE games (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
);

INSERT INTO games VALUES (13,'1932 Summer Olympics'),(14,'1936 Summer Olympics'),(15,'1952 Summer Olympics'),(3,'1952 Winter Olympics'),(16,'1956 Summer Olympics'),(4,'1956 Winter Olympics'),(17,'1960 Summer Olympics'),(5,'1960 Winter Olympics'),(18,'1964 Summer Olympics'),(1,'1968 Summer Olympics'),(2,'1972 Summer Olympics'),(7,'1976 Summer Olympics'),(19,'1984 Summer Olympics'),(12,'2000 Summer Olympics'),(8,'2004 Summer Olympics'),(9,'2008 Summer Olympics'),(10,'2012 Summer Olympics'),(11,'2016 Summer Olympics'),(6,'2020 Summer Olympics');

--
-- Table medals
--

CREATE TABLE medals (
  id int NOT NULL AUTO_INCREMENT,
  athlete_id int DEFAULT NULL,
  medal_type varchar(255) DEFAULT NULL,
  count int DEFAULT NULL,
  PRIMARY KEY (id),
  KEY athlete_id (athlete_id),
  CONSTRAINT medals_ibfk_1 FOREIGN KEY (athlete_id) REFERENCES athletes (id)
);

INSERT INTO medals VALUES (1,1,'Gold',6),(2,1,'Silver',2),(3,1,'Bronze',2),(4,2,'Gold',0),(5,2,'Silver',1),(6,2,'Bronze',0),(7,3,'Gold',2),(8,3,'Silver',1),(9,3,'Bronze',0),(10,4,'Gold',3),(11,4,'Silver',3),(12,4,'Bronze',3),(13,5,'Gold',4),(14,5,'Silver',0),(15,5,'Bronze',0),(16,6,'Gold',0),(17,6,'Silver',1),(18,6,'Bronze',1),(19,7,'Gold',3),(20,7,'Silver',4),(21,7,'Bronze',0),(22,8,'Gold',0),(23,8,'Silver',1),(24,8,'Bronze',0),(25,9,'Gold',4),(26,9,'Silver',1),(27,9,'Bronze',2),(28,10,'Gold',0),(29,10,'Silver',0),(30,10,'Bronze',1),(31,11,'Gold',1),(32,11,'Silver',0),(33,11,'Bronze',1),(34,12,'Gold',5),(35,12,'Silver',1),(36,12,'Bronze',3),(37,13,'Gold',3),(38,13,'Silver',1),(39,13,'Bronze',0),(40,14,'Gold',8),(41,14,'Silver',3),(42,14,'Bronze',1),(43,15,'Gold',0),(44,15,'Silver',1),(45,15,'Bronze',2),(46,16,'Gold',5),(47,16,'Silver',4),(48,16,'Bronze',4),(49,18,'Gold',1),(50,18,'Silver',0),(51,18,'Bronze',0),(52,19,'Gold',0),(53,19,'Silver',2),(54,19,'Bronze',0),(55,20,'Gold',5),(56,20,'Silver',2),(57,20,'Bronze',0);


--
-- Table results
--

CREATE TABLE results (
  id int NOT NULL AUTO_INCREMENT,
  athlete_id int DEFAULT NULL,
  game_id int DEFAULT NULL,
  discipline_id int DEFAULT NULL,
  position varchar(255) DEFAULT NULL,
  medal varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY athlete_id (athlete_id),
  KEY game_id (game_id),
  KEY discipline_id (discipline_id),
  CONSTRAINT results_ibfk_1 FOREIGN KEY (athlete_id) REFERENCES athletes (id),
  CONSTRAINT results_ibfk_2 FOREIGN KEY (game_id) REFERENCES games (id),
  CONSTRAINT results_ibfk_3 FOREIGN KEY (discipline_id) REFERENCES disciplines (id)
);

INSERT INTO results VALUES (1,1,1,1,'3','Bronze'),(2,1,1,2,'1','Gold'),(3,1,1,3,'2','Silver'),(4,1,1,4,'5',''),(5,1,1,5,'1','Gold'),(6,1,1,6,'\'=1','Gold'),(7,1,1,7,'1','Gold'),(8,1,1,8,'\'=12 r1/2',''),(9,1,2,1,'3','Bronze'),(10,1,2,2,'1','Gold'),(11,1,2,3,'2','Silver'),(12,1,2,4,'\'=12 r1/1',''),(13,1,2,5,'5',''),(14,1,2,6,'5',''),(15,1,2,7,'1','Gold'),(16,1,2,8,'\'=6 r1/1',''),(17,2,3,9,'24',''),(18,2,3,10,'20',''),(19,2,3,11,'11',''),(20,2,4,9,'DQ',''),(21,2,4,10,'\'=11',''),(22,2,4,11,'2','Silver'),(23,2,5,9,'34',''),(24,2,5,10,'23',''),(25,2,5,11,'12',''),(26,3,6,1,'1','Gold'),(27,3,6,2,'2','Silver'),(28,3,6,3,'10 r1/2',''),(29,3,6,5,'10 r1/2',''),(30,3,6,6,'1','Gold'),(31,3,6,7,'27 r1/2',''),(32,3,6,8,'8 r1/2',''),(33,4,1,1,'4',''),(34,4,1,2,'1','Gold'),(35,4,1,3,'6',''),(36,4,1,4,'6',''),(37,4,1,5,'5',''),(38,4,1,6,'3','Bronze'),(39,4,1,7,'7 r1/2',''),(40,4,1,8,'5',''),(41,4,2,1,'2','Silver'),(42,4,2,2,'1','Gold'),(43,4,2,3,'4',''),(44,4,2,4,'\'=4',''),(45,4,2,5,'3','Bronze'),(46,4,2,6,'4',''),(47,4,2,7,'\'=5',''),(48,4,2,8,'3','Bronze'),(49,4,7,1,'\'=6 r1/2',''),(50,4,7,2,'1','Gold'),(51,4,7,3,'6',''),(52,4,7,4,'\'=15 r1/1',''),(53,4,7,5,'\'=17 r1/2',''),(54,4,7,6,'2','Silver'),(55,4,7,7,'5',''),(56,4,7,8,'2','Silver'),(57,5,8,12,'1','Gold'),(58,5,9,12,'1','Gold'),(59,5,10,12,'1','Gold'),(60,5,11,13,'1','Gold'),(61,6,6,1,'9 r1/2',''),(62,6,6,2,'2','Silver'),(63,6,6,3,'27 r1/2',''),(64,6,6,5,'17 r1/2',''),(65,6,6,6,'17 r1/2',''),(66,6,6,7,'14 r1/2',''),(67,6,6,8,'3','Bronze'),(68,7,9,1,'2','Silver'),(69,7,9,2,'2','Silver'),(70,7,9,3,'5',''),(71,7,9,5,'10 r1/2',''),(72,7,9,6,'15 r1/2',''),(73,7,9,7,'43 r1/2',''),(74,7,9,8,'42 r1/2',''),(75,7,10,1,'1','Gold'),(76,7,10,2,'2','Silver'),(77,7,10,3,'2','Silver'),(78,7,10,5,'5 r1/2',''),(79,7,10,6,'16 r1/2',''),(80,7,10,7,'19 r1/2',''),(81,7,10,8,'60 r1/2',''),(82,7,11,1,'1','Gold'),(83,7,11,2,'1','Gold'),(84,7,11,3,'5',''),(85,7,11,5,'10 r1/2',''),(86,7,11,6,'37 r1/2',''),(87,7,11,7,'20 r1/2',''),(88,7,11,8,'14 r1/2',''),(89,7,6,5,'DNS',''),(90,7,6,6,'20 r1/2',''),(91,8,6,14,'2','Silver'),(92,9,12,15,'4',''),(93,9,12,16,'17',''),(94,9,8,15,'1','Gold'),(95,9,8,16,'1','Gold'),(96,9,8,17,'3','Bronze'),(97,9,9,15,'1','Gold'),(98,9,9,16,'1','Gold'),(99,9,9,17,'3','Bronze'),(100,9,10,15,'5',''),(101,9,10,16,'4',''),(102,9,10,17,'2','Silver'),(103,10,11,18,'14',''),(104,10,11,19,'4',''),(105,10,11,20,'7',''),(106,10,11,21,'38 r1/2',''),(107,10,11,22,'34 r1/2',''),(108,10,6,18,'5',''),(109,10,6,19,'5',''),(110,10,6,20,'\'=3','Bronze'),(111,10,6,23,'11 r1/2',''),(112,10,6,21,'64 r1/2',''),(113,10,6,22,'21 r1/2',''),(114,11,13,24,'1','Gold'),(115,11,14,24,'3','Bronze'),(116,12,1,1,'18',''),(117,12,1,2,'1','Gold'),(118,12,1,3,'4',''),(119,12,1,4,'\'=27 r1/2',''),(120,12,1,5,'\'=74 r1/2',''),(121,12,1,6,'\'=11 r1/2',''),(122,12,1,7,'4',''),(123,12,1,8,'\'=53 r1/2',''),(124,12,2,1,'8',''),(125,12,2,2,'1','Gold'),(126,12,2,3,'8 r1/1',''),(127,12,2,4,'\'=71 r1/1',''),(128,12,2,5,'\'=11 r1/1',''),(129,12,2,6,'1','Gold'),(130,12,2,7,'3','Bronze'),(131,12,2,8,'\'=34 r1/1',''),(132,12,7,1,'3','Bronze'),(133,12,7,2,'1','Gold'),(134,12,7,3,'\'=8 r1/1',''),(135,12,7,4,'2','Silver'),(136,12,7,5,'3','Bronze'),(137,12,7,6,'1','Gold'),(138,12,7,7,'\'=9 r1/1',''),(139,12,7,8,'8 r1/1',''),(140,13,8,13,'1','Gold'),(141,13,9,13,'1','Gold'),(142,13,10,13,'1','Gold'),(143,13,11,25,'2','Silver'),(144,14,1,1,'1','Gold'),(145,14,1,2,'1','Gold'),(146,14,1,3,'1','Gold'),(147,14,1,4,'\'=5 r1/2',''),(148,14,1,5,'3 r1/2',''),(149,14,1,6,'\'=3 r1/2',''),(150,14,1,7,'3','Bronze'),(151,14,1,8,'\'=8 r1/2',''),(152,14,2,1,'1','Gold'),(153,14,2,2,'1','Gold'),(154,14,2,3,'6',''),(155,14,2,4,'\'=4',''),(156,14,2,5,'1','Gold'),(157,14,2,6,'2','Silver'),(158,14,2,7,'4',''),(159,14,2,8,'2','Silver'),(160,14,7,1,'2','Silver'),(161,14,7,2,'1','Gold'),(162,14,7,3,'5',''),(163,14,7,4,'\'=7 r1/1',''),(164,14,7,5,'1','Gold'),(165,14,7,6,'4 r1/1',''),(166,14,7,7,'6',''),(167,14,7,8,'5',''),(168,15,8,26,'22',''),(169,15,8,27,'8',''),(170,15,9,26,'\'=33',''),(171,15,10,26,'2','Silver'),(172,15,10,27,'6',''),(173,15,11,26,'8',''),(174,15,6,26,'3','Bronze'),(175,15,6,27,'3','Bronze'),(176,16,15,1,'12',''),(177,16,15,2,'5',''),(178,16,15,3,'4',''),(179,16,15,4,'\'=3','Bronze'),(180,16,15,5,'\'=31',''),(181,16,15,6,'\'=19',''),(182,16,15,7,'\'=63',''),(183,16,15,8,'31',''),(184,16,16,1,'2','Silver'),(185,16,16,2,'2','Silver'),(186,16,16,3,'\'=8',''),(187,16,16,4,'\'=16',''),(188,16,16,5,'\'=3','Bronze'),(189,16,16,6,'1','Gold'),(190,16,16,7,'\'=5',''),(191,16,16,8,'2','Silver'),(192,16,17,1,'2','Silver'),(193,16,17,2,'1','Gold'),(194,16,17,3,'\'=4',''),(195,16,17,4,'\'=1','Gold'),(196,16,17,5,'3','Bronze'),(197,16,17,6,'1','Gold'),(198,16,17,7,'\'=3','Bronze'),(199,16,17,8,'6',''),(200,16,18,1,'\'=11',''),(201,16,18,2,'1','Gold'),(202,16,18,3,'\'=16 r1/2',''),(203,16,18,4,'\'=14 r1/2',''),(204,16,18,5,'\'=25 r1/2',''),(205,16,18,6,'6',''),(206,16,18,7,'\'=9 r1/2',''),(207,16,18,8,'\'=7 r1/2',''),(208,17,2,28,'42',''),(209,17,2,29,'16',''),(210,17,7,28,'39',''),(211,17,7,29,'13',''),(212,18,19,30,'1','Gold'),(213,19,8,31,'9',''),(214,19,9,31,'2','Silver'),(215,19,10,31,'\'=9',''),(216,19,10,32,'2','Silver'),(217,19,11,31,'17',''),(218,20,17,1,'\'=5',''),(219,20,17,2,'1','Gold'),(220,20,17,3,'\'=10 r1/2',''),(221,20,17,4,'5',''),(222,20,17,5,'7 r1/2',''),(223,20,17,6,'4',''),(224,20,17,7,'\'=12 r1/2',''),(225,20,17,8,'\'=10 r1/2',''),(226,20,18,1,'1','Gold'),(227,20,18,2,'1','Gold'),(228,20,18,3,'\'=2','Silver'),(229,20,18,4,'6',''),(230,20,18,5,'1','Gold'),(231,20,18,6,'5',''),(232,20,18,7,'6',''),(233,20,18,8,'\'=17 r1/2',''),(234,20,1,1,'8',''),(235,20,1,2,'1','Gold'),(236,20,1,3,'\'=11 r1/2',''),(237,20,1,4,'2','Silver'),(238,20,1,5,'\'=9 r1/2',''),(239,20,1,6,'6',''),(240,20,1,7,'8 r1/2',''),(241,20,1,8,'\'=26 r1/2','');