-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

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
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y'),('%','test\\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y'),('localhost','zabbix','zabbix','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Geographic',0,''),(2,'Polygon properties',34,''),(3,'WKT',34,''),(4,'Numeric Functions',38,''),(5,'Plugins',35,''),(6,'MBR',34,''),(7,'Control flow functions',38,''),(8,'Transactions',35,''),(9,'Help Metadata',35,''),(10,'Account Management',35,''),(11,'Point properties',34,''),(12,'Encryption Functions',38,''),(13,'LineString properties',34,''),(14,'Miscellaneous Functions',38,''),(15,'Logical operators',38,''),(16,'Functions and Modifiers for Use with GROUP BY',35,''),(17,'Information Functions',38,''),(18,'Comparison operators',38,''),(19,'Bit Functions',38,''),(20,'Table Maintenance',35,''),(21,'User-Defined Functions',35,''),(22,'Data Types',35,''),(23,'Compound Statements',35,''),(24,'Geometry constructors',34,''),(25,'GeometryCollection properties',1,''),(26,'Administration',35,''),(27,'Data Manipulation',35,''),(28,'Utility',35,''),(29,'Language Structure',35,''),(30,'Geometry relations',34,''),(31,'Date and Time Functions',38,''),(32,'WKB',34,''),(33,'Procedures',35,''),(34,'Geographic Features',35,''),(35,'Contents',0,''),(36,'Geometry properties',34,''),(37,'String Functions',38,''),(38,'Functions',35,''),(39,'Data Definition',35,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'JOIN'),(1,'HOST'),(2,'REPEAT'),(3,'SERIALIZABLE'),(4,'REPLACE'),(5,'AT'),(6,'SCHEDULE'),(7,'RETURNS'),(8,'STARTS'),(9,'MASTER_SSL_CA'),(10,'NCHAR'),(11,'COLUMNS'),(12,'COMPLETION'),(13,'WORK'),(14,'DATETIME'),(15,'MODE'),(16,'OPEN'),(17,'INTEGER'),(18,'ESCAPE'),(19,'VALUE'),(20,'MASTER_SSL_VERIFY_SERVER_CERT'),(21,'SQL_BIG_RESULT'),(22,'DROP'),(23,'GEOMETRYCOLLECTIONFROMWKB'),(24,'EVENTS'),(25,'MONTH'),(26,'PROFILES'),(27,'DUPLICATE'),(28,'REPLICATION'),(29,'UNLOCK'),(30,'INNODB'),(31,'YEAR_MONTH'),(32,'SUBJECT'),(33,'PREPARE'),(34,'LOCK'),(35,'NDB'),(36,'CHECK'),(37,'FULL'),(38,'INT4'),(39,'BY'),(40,'NO'),(41,'MINUTE'),(42,'PARTITION'),(43,'DATA'),(44,'DAY'),(45,'SHARE'),(46,'REAL'),(47,'SEPARATOR'),(48,'MESSAGE_TEXT'),(49,'MASTER_HEARTBEAT_PERIOD'),(50,'DELETE'),(51,'ON'),(52,'COLUMN_NAME'),(53,'CONNECTION'),(54,'CLOSE'),(55,'X509'),(56,'USE'),(57,'SUBCLASS_ORIGIN'),(58,'WHERE'),(59,'PRIVILEGES'),(60,'SPATIAL'),(61,'EVENT'),(62,'SUPER'),(63,'SQL_BUFFER_RESULT'),(64,'IGNORE'),(65,'SHA2'),(66,'QUICK'),(67,'SIGNED'),(68,'OFFLINE'),(69,'SECURITY'),(70,'AUTOEXTEND_SIZE'),(71,'NDBCLUSTER'),(72,'POLYGONFROMWKB'),(73,'FALSE'),(74,'LEVEL'),(75,'FORCE'),(76,'BINARY'),(77,'TO'),(78,'CHANGE'),(79,'CURRENT_USER'),(80,'HOUR_MINUTE'),(81,'UPDATE'),(82,'PRESERVE'),(83,'TABLE_NAME'),(84,'INTO'),(85,'FEDERATED'),(86,'VARYING'),(87,'MAX_SIZE'),(88,'HOUR_SECOND'),(89,'VARIABLE'),(90,'ROLLBACK'),(91,'PROCEDURE'),(92,'TIMESTAMP'),(93,'IMPORT'),(94,'AGAINST'),(95,'CHECKSUM'),(96,'COUNT'),(97,'LONGBINARY'),(98,'THEN'),(99,'INSERT'),(100,'ENGINES'),(101,'HANDLER'),(102,'PORT'),(103,'DAY_SECOND'),(104,'EXISTS'),(105,'MUTEX'),(106,'HELP_DATE'),(107,'RELEASE'),(108,'BOOLEAN'),(109,'MOD'),(110,'DEFAULT'),(111,'TYPE'),(112,'NO_WRITE_TO_BINLOG'),(113,'OPTIMIZE'),(114,'SQLSTATE'),(115,'RESET'),(116,'CLASS_ORIGIN'),(117,'INSTALL'),(118,'ITERATE'),(119,'DO'),(120,'BIGINT'),(121,'SET'),(122,'ISSUER'),(123,'DATE'),(124,'STATUS'),(125,'FULLTEXT'),(126,'COMMENT'),(127,'MASTER_CONNECT_RETRY'),(128,'INNER'),(129,'RELAYLOG'),(130,'STOP'),(131,'MASTER_LOG_FILE'),(132,'MRG_MYISAM'),(133,'PRECISION'),(134,'REQUIRE'),(135,'TRAILING'),(136,'PARTITIONS'),(137,'LONG'),(138,'OPTION'),(139,'REORGANIZE'),(140,'ELSE'),(141,'DEALLOCATE'),(142,'IO_THREAD'),(143,'CASE'),(144,'CIPHER'),(145,'CONTINUE'),(146,'FROM'),(147,'READ'),(148,'LEFT'),(149,'ELSEIF'),(150,'MINUTE_SECOND'),(151,'COMPACT'),(152,'DEC'),(153,'FOR'),(154,'WARNINGS'),(155,'MIN_ROWS'),(156,'STRING'),(157,'CONDITION'),(158,'ENCLOSED'),(159,'FUNCTION'),(160,'AGGREGATE'),(161,'FIELDS'),(162,'INT3'),(163,'ARCHIVE'),(164,'AVG_ROW_LENGTH'),(165,'ADD'),(166,'KILL'),(167,'FLOAT4'),(168,'TABLESPACE'),(169,'VIEW'),(170,'REPEATABLE'),(171,'INFILE'),(172,'HELP_VERSION'),(173,'ORDER'),(174,'USING'),(175,'CONSTRAINT_CATALOG'),(176,'MIDDLEINT'),(177,'GRANT'),(178,'UNSIGNED'),(179,'DECIMAL'),(180,'GEOMETRYFROMTEXT'),(181,'INDEXES'),(182,'FOREIGN'),(183,'CACHE'),(184,'HOSTS'),(185,'MYSQL_ERRNO'),(186,'COMMIT'),(187,'SCHEMAS'),(188,'LEADING'),(189,'SNAPSHOT'),(190,'CONSTRAINT_NAME'),(191,'DECLARE'),(192,'LOAD'),(193,'SQL_CACHE'),(194,'CONVERT'),(195,'DYNAMIC'),(196,'COLLATE'),(197,'POLYGONFROMTEXT'),(198,'BYTE'),(199,'GLOBAL'),(200,'LINESTRINGFROMWKB'),(201,'WHEN'),(202,'HAVING'),(203,'AS'),(204,'STARTING'),(205,'RELOAD'),(206,'AUTOCOMMIT'),(207,'REVOKE'),(208,'GRANTS'),(209,'OUTER'),(210,'CURSOR_NAME'),(211,'FLOOR'),(212,'EXPLAIN'),(213,'WITH'),(214,'AFTER'),(215,'STD'),(216,'CSV'),(217,'DISABLE'),(218,'UNINSTALL'),(219,'OUTFILE'),(220,'LOW_PRIORITY'),(221,'FILE'),(222,'NODEGROUP'),(223,'SCHEMA'),(224,'SONAME'),(225,'POW'),(226,'DUAL'),(227,'MULTIPOINTFROMWKB'),(228,'INDEX'),(229,'MULTIPOINTFROMTEXT'),(230,'DEFINER'),(231,'MASTER_BIND'),(232,'REMOVE'),(233,'EXTENDED'),(234,'MULTILINESTRINGFROMWKB'),(235,'CROSS'),(236,'CONTRIBUTORS'),(237,'NATIONAL'),(238,'GROUP'),(239,'SHA'),(240,'ONLINE'),(241,'UNDO'),(242,'IGNORE_SERVER_IDS'),(243,'ZEROFILL'),(244,'CLIENT'),(245,'MASTER_PASSWORD'),(246,'OWNER'),(247,'RELAY_LOG_FILE'),(248,'TRUE'),(249,'CHARACTER'),(250,'MASTER_USER'),(251,'SCHEMA_NAME'),(252,'TABLE'),(253,'ENGINE'),(254,'INSERT_METHOD'),(255,'CASCADE'),(256,'RELAY_LOG_POS'),(257,'SQL_CALC_FOUND_ROWS'),(258,'UNION'),(259,'MYISAM'),(260,'LEAVE'),(261,'MODIFY'),(262,'MATCH'),(263,'MASTER_LOG_POS'),(264,'DISTINCTROW'),(265,'DESC'),(266,'TIME'),(267,'NUMERIC'),(268,'EXPANSION'),(269,'CODE'),(270,'CURSOR'),(271,'GEOMETRYCOLLECTIONFROMTEXT'),(272,'CHAIN'),(273,'LOGFILE'),(274,'FLUSH'),(275,'CREATE'),(276,'DESCRIBE'),(277,'EXTENT_SIZE'),(278,'MAX_UPDATES_PER_HOUR'),(279,'INT2'),(280,'PROCESSLIST'),(281,'ENDS'),(282,'LOGS'),(283,'DISCARD'),(284,'HEAP'),(285,'SOUNDS'),(286,'BETWEEN'),(287,'MULTILINESTRINGFROMTEXT'),(288,'REPAIR'),(289,'PACK_KEYS'),(290,'FAST'),(291,'VALUES'),(292,'CALL'),(293,'LOOP'),(294,'VARCHARACTER'),(295,'BEFORE'),(296,'TRUNCATE'),(297,'SHOW'),(298,'ALL'),(299,'REDUNDANT'),(300,'USER_RESOURCES'),(301,'PARTIAL'),(302,'BINLOG'),(303,'END'),(304,'SECOND'),(305,'AND'),(306,'FLOAT8'),(307,'PREV'),(308,'HOUR'),(309,'SELECT'),(310,'DATABASES'),(311,'OR'),(312,'IDENTIFIED'),(313,'WRAPPER'),(314,'MASTER_SSL_CIPHER'),(315,'SQL_SLAVE_SKIP_COUNTER'),(316,'BOTH'),(317,'BOOL'),(318,'YEAR'),(319,'MASTER_PORT'),(320,'CONCURRENT'),(321,'HELP'),(322,'UNIQUE'),(323,'TRIGGERS'),(324,'PROCESS'),(325,'OPTIONS'),(326,'RESIGNAL'),(327,'CONSISTENT'),(328,'MASTER_SSL'),(329,'DATE_ADD'),(330,'MAX_CONNECTIONS_PER_HOUR'),(331,'LIKE'),(332,'PLUGIN'),(333,'FETCH'),(334,'IN'),(335,'COLUMN'),(336,'DUMPFILE'),(337,'USAGE'),(338,'EXECUTE'),(339,'MEMORY'),(340,'CEIL'),(341,'QUERY'),(342,'MASTER_HOST'),(343,'LINES'),(344,'SQL_THREAD'),(345,'SERVER'),(346,'MAX_QUERIES_PER_HOUR'),(347,'MASTER_SSL_CERT'),(348,'MULTIPOLYGONFROMWKB'),(349,'TRANSACTION'),(350,'DAY_MINUTE'),(351,'STDDEV'),(352,'DATE_SUB'),(353,'REBUILD'),(354,'GEOMETRYFROMWKB'),(355,'INT1'),(356,'RENAME'),(357,'PARSER'),(358,'RIGHT'),(359,'ALTER'),(360,'MAX_ROWS'),(361,'SOCKET'),(362,'STRAIGHT_JOIN'),(363,'NATURAL'),(364,'VARIABLES'),(365,'ESCAPED'),(366,'SHA1'),(367,'KEY_BLOCK_SIZE'),(368,'PASSWORD'),(369,'OFFSET'),(370,'CHAR'),(371,'NEXT'),(372,'ERRORS'),(373,'SQL_LOG_BIN'),(374,'TEMPORARY'),(375,'COMMITTED'),(376,'SQL_SMALL_RESULT'),(377,'UPGRADE'),(378,'BEGIN'),(379,'DELAY_KEY_WRITE'),(380,'PROFILE'),(381,'MEDIUM'),(382,'INTERVAL'),(383,'SSL'),(384,'DAY_HOUR'),(385,'NAME'),(386,'REFERENCES'),(387,'AES_ENCRYPT'),(388,'STORAGE'),(389,'ISOLATION'),(390,'CEILING'),(391,'EVERY'),(392,'INT8'),(393,'AUTHORS'),(394,'RESTRICT'),(395,'UNCOMMITTED'),(396,'LINESTRINGFROMTEXT'),(397,'IS'),(398,'NOT'),(399,'ANALYSE'),(400,'DATAFILE'),(401,'DES_KEY_FILE'),(402,'SIGNAL'),(403,'COMPRESSED'),(404,'START'),(405,'PLUGINS'),(406,'SAVEPOINT'),(407,'IF'),(408,'ROWS'),(409,'PRIMARY'),(410,'PURGE'),(411,'LAST'),(412,'USER'),(413,'EXIT'),(414,'KEYS'),(415,'LIMIT'),(416,'KEY'),(417,'MERGE'),(418,'UNTIL'),(419,'SQL_NO_CACHE'),(420,'DELAYED'),(421,'CONSTRAINT_SCHEMA'),(422,'ANALYZE'),(423,'CONSTRAINT'),(424,'SERIAL'),(425,'ACTION'),(426,'WRITE'),(427,'INITIAL_SIZE'),(428,'SESSION'),(429,'DATABASE'),(430,'NULL'),(431,'POWER'),(432,'USE_FRM'),(433,'TERMINATED'),(434,'SLAVE'),(435,'NVARCHAR'),(436,'ASC'),(437,'RETURN'),(438,'OPTIONALLY'),(439,'ENABLE'),(440,'DIRECTORY'),(441,'MAX_USER_CONNECTIONS'),(442,'WHILE'),(443,'LOCAL'),(444,'DISTINCT'),(445,'AES_DECRYPT'),(446,'MASTER_SSL_KEY'),(447,'NONE'),(448,'TABLES'),(449,'<>'),(450,'RLIKE'),(451,'TRIGGER'),(452,'COLLATION'),(453,'SHUTDOWN'),(454,'HIGH_PRIORITY'),(455,'BTREE'),(456,'FIRST'),(457,'COALESCE'),(458,'WAIT'),(459,'CATALOG_NAME'),(460,'MASTER'),(461,'FIXED'),(462,'MULTIPOLYGONFROMTEXT'),(463,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (1,0),(356,0),(473,1),(232,2),(447,3),(3,4),(130,4),(421,4),(89,5),(89,6),(406,6),(97,7),(89,8),(185,9),(430,10),(21,11),(347,11),(421,11),(463,11),(468,11),(89,12),(406,12),(146,13),(230,14),(88,15),(356,15),(18,16),(106,16),(134,16),(347,16),(97,17),(500,17),(380,18),(3,19),(104,19),(243,19),(374,19),(459,19),(185,20),(356,21),(9,22),(30,22),(34,22),(87,22),(186,22),(237,22),(263,22),(276,22),(300,22),(331,22),(405,22),(415,22),(416,22),(463,22),(478,22),(108,23),(122,24),(170,24),(424,24),(376,25),(82,26),(104,27),(199,28),(36,29),(347,30),(468,30),(376,31),(199,32),(35,33),(237,33),(36,34),(356,34),(468,35),(417,36),(463,36),(468,36),(21,37),(294,37),(347,37),(451,37),(468,37),(500,38),(48,39),(77,39),(83,39),(130,39),(199,39),(356,39),(361,39),(421,39),(463,39),(468,39),(468,40),(472,40),(376,41),(463,42),(468,42),(212,43),(421,43),(468,43),(473,43),(376,44),(356,45),(97,46),(314,46),(361,47),(374,48),(459,48),(185,49),(48,50),(468,50),(472,50),(1,51),(89,51),(406,51),(472,51),(374,52),(459,52),(176,53),(468,53),(51,54),(106,54),(199,55),(1,56),(55,56),(194,56),(374,57),(459,57),(48,58),(83,58),(106,58),(193,59),(199,59),(249,59),(210,60),(463,60),(89,61),(300,61),(358,61),(406,61),(199,62),(356,63),(1,64),(83,64),(104,64),(130,64),(356,64),(421,64),(463,64),(66,65),(48,66),(417,66),(466,66),(230,67),(87,68),(210,68),(463,68),(199,69),(194,70),(468,71),(91,72),(482,72),(385,73),(447,74),(1,75),(39,76),(230,76),(269,76),(185,77),(269,77),(460,77),(185,78),(463,78),(89,79),(406,79),(376,80),(83,81),(104,81),(356,81),(472,81),(89,82),(406,82),(374,83),(459,83),(3,84),(104,84),(304,84),(356,84),(468,85),(257,86),(194,87),(376,88),(129,89),(146,90),(460,90),(17,91),(189,91),(302,91),(328,91),(347,91),(356,91),(416,91),(439,91),(488,91),(99,92),(188,92),(421,93),(463,93),(88,94),(401,95),(468,95),(69,96),(330,96),(433,96),(285,97),(28,98),(57,98),(85,98),(104,99),(195,99),(301,99),(486,99),(282,100),(347,100),(106,101),(313,101),(473,102),(376,103),(9,104),(30,104),(89,104),(155,104),(186,104),(276,104),(300,104),(347,105),(365,105),(109,106),(146,107),(460,107),(24,108),(88,108),(113,109),(174,109),(3,110),(104,110),(155,110),(200,110),(212,110),(243,110),(463,110),(468,110),(463,111),(115,112),(326,112),(466,112),(470,112),(115,113),(463,113),(374,114),(459,114),(38,115),(119,115),(151,115),(264,115),(374,116),(459,116),(419,117),(124,118),(89,119),(125,119),(406,119),(496,119),(221,120),(3,121),(83,121),(104,121),(129,121),(130,121),(146,121),(155,121),(182,121),(212,121),(333,121),(347,121),(356,121),(374,121),(421,121),(459,121),(463,121),(468,121),(472,121),(477,121),(494,121),(199,122),(132,123),(230,123),(262,123),(376,123),(58,124),(137,124),(215,124),(223,124),(328,124),(336,124),(347,124),(365,124),(210,125),(463,125),(468,125),(89,126),(194,126),(210,126),(406,126),(468,126),(185,127),(1,128),(424,129),(52,130),(185,131),(468,132),(314,133),(199,134),(455,135),(255,136),(285,137),(199,138),(249,138),(463,139),(57,140),(85,140),(237,141),(52,142),(324,142),(57,143),(85,143),(199,144),(313,145),(48,146),(122,146),(347,146),(356,146),(424,146),(455,146),(36,147),(106,147),(447,147),(1,148),(28,149),(376,150),(468,151),(209,152),(180,153),(313,153),(347,153),(356,153),(420,153),(330,154),(347,154),(468,155),(97,156),(180,157),(421,158),(34,159),(68,159),(97,159),(211,159),(233,159),(302,159),(336,159),(347,159),(393,159),(405,159),(416,159),(97,160),(347,161),(421,161),(252,162),(468,163),(463,164),(468,164),(60,165),(194,165),(463,165),(478,165),(176,166),(168,167),(194,168),(415,168),(463,168),(478,168),(30,169),(159,169),(454,169),(447,170),(130,171),(421,171),(190,172),(48,173),(83,173),(356,173),(361,173),(463,173),(1,174),(48,174),(86,174),(374,175),(459,175),(252,176),(199,177),(249,177),(24,178),(128,178),(168,178),(209,178),(230,178),(314,178),(500,178),(97,179),(156,179),(230,179),(411,180),(347,181),(463,182),(468,182),(472,182),(473,182),(101,183),(151,183),(304,183),(145,184),(347,184),(374,185),(459,185),(146,186),(160,187),(347,187),(455,188),(146,189),(374,190),(459,190),(180,191),(200,191),(313,191),(420,191),(304,192),(421,192),(356,193),(230,194),(377,194),(468,195),(155,196),(212,196),(468,196),(395,197),(465,198),(129,199),(137,199),(182,199),(349,199),(447,199),(452,200),(57,201),(85,201),(356,202),(1,203),(36,203),(356,203),(421,204),(199,205),(146,206),(249,207),(192,208),(347,208),(1,209),(374,210),(459,210),(221,211),(255,212),(88,213),(199,213),(210,213),(463,213),(468,213),(463,214),(260,215),(421,216),(468,216),(89,217),(406,217),(463,217),(291,218),(356,219),(3,220),(36,220),(48,220),(83,220),(104,220),(130,220),(421,220),(199,221),(194,222),(155,223),(186,223),(212,223),(309,223),(347,223),(97,224),(277,225),(279,226),(464,227),(1,228),(60,228),(87,228),(101,228),(210,228),(304,228),(308,228),(347,228),(463,228),(468,228),(425,229),(89,230),(406,230),(185,231),(463,232),(255,233),(466,233),(272,234),(1,235),(7,236),(347,236),(257,237),(430,237),(194,238),(226,238),(356,238),(427,239),(87,240),(210,240),(463,240),(313,241),(185,242),(24,243),(128,243),(168,243),(209,243),(314,243),(500,243),(199,244),(185,245),(473,246),(185,247),(385,248),(130,249),(155,249),(212,249),(257,249),(333,249),(347,249),(356,249),(421,249),(430,249),(468,249),(185,250),(374,251),(459,251),(60,252),(110,252),(115,252),(215,252),(276,252),(278,252),(321,252),(347,252),(401,252),(417,252),(463,252),(466,252),(468,252),(470,252),(194,253),(347,253),(365,253),(415,253),(463,253),(468,253),(478,253),(468,254),(30,255),(276,255),(468,255),(472,255),(185,256),(356,257),(305,258),(468,259),(310,260),(463,261),(88,262),(185,263),(356,264),(329,265),(356,265),(361,265),(230,266),(315,266),(375,266),(209,267),(88,268),(68,269),(488,269),(420,270),(246,271),(146,272),(194,273),(226,273),(151,274),(326,274),(17,275),(22,275),(60,275),(77,275),(89,275),(97,275),(155,275),(194,275),(210,275),(211,275),(278,275),(302,275),(309,275),(347,275),(358,275),(393,275),(454,275),(468,275),(473,275),(329,276),(194,277),(199,278),(234,279),(347,280),(451,280),(89,281),(39,282),(269,282),(347,282),(463,283),(468,284),(378,285),(147,286),(107,287),(463,288),(466,288),(468,289),(417,290),(3,291),(104,291),(339,292),(344,293),(257,294),(269,295),(321,296),(463,296),(7,297),(10,297),(17,297),(21,297),(25,297),(33,297),(39,297),(58,297),(68,297),(69,297),(82,297),(122,297),(134,297),(137,297),(145,297),(160,297),(170,297),(192,297),(193,297),(215,297),(223,297),(278,297),(282,297),(294,297),(308,297),(309,297),(328,297),(330,297),(333,297),(336,297),(347,297),(349,297),(358,297),(365,297),(393,297),(424,297),(451,297),(487,297),(488,297),(492,297),(38,298),(199,298),(249,298),(305,298),(356,298),(468,299),(326,300),(468,301),(122,302),(350,302),(28,303),(57,303),(85,303),(232,303),(327,303),(344,303),(496,303),(376,304),(147,305),(316,305),(314,306),(106,307),(376,308),(3,309),(104,309),(255,309),(301,309),(356,309),(160,310),(347,310),(141,311),(77,312),(130,312),(199,312),(473,313),(185,314),(182,315),(455,316),(24,317),(111,317),(376,318),(185,319),(130,320),(421,320),(118,321),(390,321),(463,322),(25,323),(347,323),(199,324),(373,325),(473,325),(374,326),(146,327),(185,328),(376,329),(199,330),(347,331),(378,331),(291,332),(347,332),(419,332),(383,333),(88,334),(122,334),(356,334),(424,334),(463,335),(356,336),(199,337),(86,338),(199,338),(356,339),(397,340),(88,341),(151,341),(176,341),(185,342),(130,343),(421,343),(52,344),(324,344),(9,345),(373,345),(473,345),(199,346),(185,347),(123,348),(146,349),(447,349),(376,350),(407,351),(376,352),(463,353),(144,354),(24,355),(110,356),(222,356),(406,356),(463,356),(210,357),(463,357),(468,357),(1,358),(60,359),(159,359),(199,359),(212,359),(226,359),(233,359),(373,359),(406,359),(439,359),(463,359),(478,359),(463,360),(468,360),(473,361),(1,362),(356,362),(1,363),(347,364),(349,364),(421,365),(427,366),(468,367),(77,368),(199,368),(473,368),(477,368),(356,369),(230,370),(465,370),(106,371),(69,372),(347,372),(494,373),(276,374),(447,375),(356,376),(212,377),(417,377),(146,378),(327,378),(468,379),(487,380),(417,381),(89,382),(376,382),(199,383),(376,384),(212,385),(199,386),(468,386),(472,386),(443,387),(282,388),(447,389),(448,390),(89,391),(128,392),(10,393),(347,393),(30,394),(276,394),(472,394),(447,395),(56,396),(84,397),(206,397),(368,397),(456,397),(84,398),(89,398),(155,398),(206,398),(312,398),(189,399),(194,400),(478,400),(326,401),(459,402),(468,403),(146,404),(324,404),(33,405),(460,406),(9,407),(28,407),(30,407),(89,407),(155,407),(186,407),(276,407),(300,407),(479,407),(130,408),(463,409),(269,410),(106,411),(77,412),(222,412),(331,412),(473,412),(313,413),(308,414),(347,414),(463,414),(48,415),(83,415),(106,415),(122,415),(356,415),(424,415),(60,416),(104,416),(463,416),(468,416),(472,416),(468,417),(232,418),(356,419),(3,420),(104,420),(486,420),(374,421),(459,421),(463,422),(470,422),(463,423),(468,423),(243,424),(468,424),(468,425),(472,425),(36,426),(194,427),(478,427),(129,428),(137,428),(349,428),(447,428),(155,429),(186,429),(212,429),(309,429),(347,429),(473,429),(84,430),(368,430),(472,430),(483,431),(466,432),(421,433),(38,434),(52,434),(89,434),(145,434),(223,434),(324,434),(406,434),(257,435),(356,436),(361,436),(491,437),(421,438),(89,439),(406,439),(463,439),(212,440),(468,440),(199,441),(496,442),(36,443),(115,443),(130,443),(326,443),(421,443),(466,443),(470,443),(0,444),(96,444),(288,444),(305,444),(356,444),(361,444),(384,444),(433,444),(497,445),(185,446),(199,447),(36,448),(134,448),(294,448),(347,448),(495,449),(27,450),(22,451),(263,451),(347,451),(347,452),(492,452),(199,453),(104,454),(356,454),(210,455),(106,456),(463,456),(468,456),(463,457),(194,458),(478,458),(374,459),(459,459),(39,460),(58,460),(185,460),(264,460),(269,460),(209,461),(468,461),(201,462),(468,463);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` VALUES (0,'MIN',16,'Syntax:\nMIN([DISTINCT] expr)\n\nReturns the minimum value of expr. MIN() may take a string argument; in\nsuch cases, it returns the minimum string value. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMIN() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(1,'JOIN',27,'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias] [index_hint_list]\n  | table_subquery [AS] alias\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr\n  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint_list:\n    index_hint [, index_hint] ...\n\nindex_hint:\n    USE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])\n  | IGNORE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n  | FORCE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, JOIN, CROSS JOIN, and INNER JOIN are syntactic equivalents\n(they can replace each other). In standard SQL, they are not\nequivalent. INNER JOIN is used with an ON clause, CROSS JOIN is used\notherwise.\n\nIn general, parentheses can be ignored in join expressions containing\nonly inner join operations. MySQL also supports nested joins (see\nhttp://dev.mysql.com/doc/refman/5.5/en/nested-join-optimization.html).\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/index-hints.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/join.html\n\n','SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n','http://dev.mysql.com/doc/refman/5.5/en/join.html'),(2,'HEX',37,'Syntax:\nHEX(str), HEX(N)\n\nFor a string argument str, HEX() returns a hexadecimal string\nrepresentation of str where each character in str is converted to two\nhexadecimal digits. The inverse of this operation is performed by the\nUNHEX() function.\n\nFor a numeric argument N, HEX() returns a hexadecimal string\nrepresentation of the value of N treated as a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16). The inverse of this operation is\nperformed by CONV(HEX(N),16,10).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT 0x616263, HEX(\'abc\'), UNHEX(HEX(\'abc\'));\n        -> \'abc\', 616263, \'abc\'\nmysql> SELECT HEX(255), CONV(HEX(255),16,10);\n        -> \'FF\', 255\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(3,'REPLACE',27,'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL---that\neither inserts or updates---see\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-on-duplicate.html.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/replace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/replace.html'),(4,'CONTAINS',30,'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(5,'SRID',36,'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(6,'CURRENT_TIMESTAMP',31,'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(7,'SHOW CONTRIBUTORS',26,'Syntax:\nSHOW CONTRIBUTORS\n\nThe SHOW CONTRIBUTORS statement displays information about the people\nwho contribute to MySQL source or to causes that we support. For each\ncontributor, it displays Name, Location, and Comment values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-contributors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-contributors.html'),(8,'VARIANCE',16,'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. The standard SQL function VAR_POP() can be used\ninstead.\n\nVARIANCE() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(9,'DROP SERVER',39,'Syntax:\nDROP SERVER [ IF EXISTS ] server_name\n\nDrops the server definition for the server named server_name. The\ncorresponding row within the mysql.servers table will be deleted. This\nstatement requires the SUPER privilege.\n\nDropping a server for a table does not affect any FEDERATED tables that\nused this connection information when they were created. See [HELP\nCREATE SERVER].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-server.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-server.html'),(10,'SHOW AUTHORS',26,'Syntax:\nSHOW AUTHORS\n\nThe SHOW AUTHORS statement displays information about the people who\nwork on MySQL. For each author, it displays Name, Location, and Comment\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-authors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-authors.html'),(11,'VAR_SAMP',16,'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(12,'CONCAT',37,'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are nonbinary strings, the\nresult is a nonbinary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent string form. This is a nonbinary string as of MySQL\n5.5.3. Before 5.5.3, it is a binary string; to to avoid that and\nproduce a nonbinary string, you can use an explicit type cast, as in\nthis example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(13,'GEOMETRY HIERARCHY',34,'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnoninstantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-geometry-class-hierarchy.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-geometry-class-hierarchy.html'),(14,'CHAR FUNCTION',37,'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(15,'DATETIME',22,'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but permits assignment of values to\nDATETIME columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(16,'SHOW CREATE TRIGGER',26,'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows a CREATE TRIGGER statement that creates the given\ntrigger.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-trigger.html'),(17,'SHOW CREATE PROCEDURE',26,'Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table. If you do not have privileges\nfor the routine itself, the value displayed for the Create Procedure or\nCreate Function field will be NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-procedure.html\n\n','mysql> SHOW CREATE PROCEDURE test.simpleproc\\G\n*************************** 1. row ***************************\n           Procedure: simpleproc\n            sql_mode:\n    Create Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)\n                      BEGIN\n                      SELECT COUNT(*) INTO param1 FROM t;\n                      END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nmysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode:\n     Create Function: CREATE FUNCTION `hello`(s CHAR(20))\n                      RETURNS CHAR(50)\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-procedure.html'),(18,'OPEN',23,'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/open.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/open.html'),(19,'INTEGER',22,'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(20,'LOWER',37,'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n\nLOWER() (and UPPER()) are ineffective when applied to binary strings\n(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert\nthe string to a nonbinary string:\n\nmysql> SET @str = BINARY \'New York\';\nmysql> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));\n+-------------+-----------------------------------+\n| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |\n+-------------+-----------------------------------+\n| New York    | new york                          |\n+-------------+-----------------------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(21,'SHOW COLUMNS',26,'Syntax:\nSHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. The LIKE clause, if present, indicates which\ncolumn names to match. The WHERE clause can be given to select rows\nusing more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nSHOW COLUMNS displays information only for those columns for which you\nhave some privilege.\n\nmysql> SHOW COLUMNS FROM City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nIf the data types differ from what you expect them to be based on a\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions under which this\noccurs are described in\nhttp://dev.mysql.com/doc/refman/5.5/en/silent-column-changes.html.\n\nThe FULL keyword causes the output to include the column collation and\ncomments, as well as the privileges you have for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW COLUMNS displays the following values for each table column:\n\nField indicates the column name.\n\nType indicates the column data type.\n\nCollation indicates the collation for nonbinary string columns, or NULL\nfor other columns. This value is displayed only if you use the FULL\nkeyword.\n\nThe Null field contains YES if NULL values can be stored in the column,\nNO if not.\n\nThe Key field indicates whether the column is indexed:\n\no If Key is empty, the column either is not indexed or is indexed only\n  as a secondary column in a multiple-column, nonunique index.\n\no If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n  in a multiple-column PRIMARY KEY.\n\no If Key is UNI, the column is the first column of a UNIQUE index. (A\n  UNIQUE index permits multiple NULL values, but you can tell whether\n  the column permits NULL by checking the Null field.)\n\no If Key is MUL, the column is the first column of a nonunique index in\n  which multiple occurrences of a given value are permitted within the\n  column.\n\nIf more than one of the Key values applies to a given column of a\ntable, Key displays the one with the highest priority, in the order\nPRI, UNI, MUL.\n\nA UNIQUE index may be displayed as PRI if it cannot contain NULL values\nand there is no PRIMARY KEY in the table. A UNIQUE index may display as\nMUL if several columns form a composite UNIQUE index; although the\ncombination of the columns is unique, each column can still hold\nmultiple occurrences of a given value.\n\nThe Default field indicates the default value that is assigned to the\ncolumn. This is NULL if the column has an explicit default of NULL, or\nif the column definition has no DEFAULT clause.\n\nThe Extra field contains any additional information that is available\nabout a given column. The value is nonempty in these cases:\nauto_increment for columns that have the AUTO_INCREMENT attribute; on\nupdate CURRENT_TIMESTAMP for TIMESTAMP columns that have the ON UPDATE\nCURRENT_TIMESTAMP attribute.\n\nPrivileges indicates the privileges you have for the column. This value\nis displayed only if you use the FULL keyword.\n\nComment indicates any comment the column has. This value is displayed\nonly if you use the FULL keyword.\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [HELP DESCRIBE].\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-columns.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-columns.html'),(22,'CREATE TRIGGER',39,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_body\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. The trigger becomes associated\nwith the table named tbl_name, which must refer to a permanent table.\nYou cannot associate a trigger with a TEMPORARY table or a view.\n\nCREATE TRIGGER requires the TRIGGER privilege for the table associated\nwith the trigger. The statement might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section. If\nbinary logging is enabled, CREATE TRIGGER might require the SUPER\nprivilege, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nThe DEFINER clause determines the security context to be used when\nchecking access privileges at trigger activation time. See later in\nthis section for more information.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after each row to be\nmodified.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. However,\n  DROP TABLE and TRUNCATE TABLE statements on the table do not activate\n  this trigger, because they do not use DELETE. Dropping a partition\n  does not activate DELETE triggers, either. See [HELP TRUNCATE TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-trigger.html'),(23,'MONTH',31,'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 1 to 12 for January to\nDecember, or 0 for dates such as \'0000-00-00\' or \'2008-00-00\' that have\na zero month part.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MONTH(\'2008-02-03\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(24,'TINYINT',22,'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(25,'SHOW TRIGGERS',26,'Syntax:\nSHOW TRIGGERS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names to match and causes the statement to display triggers\nfor those tables. The WHERE clause can be given to select rows using\nmore general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.5/en/triggers.html, the output of\nthis statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: NULL\n            sql_mode:\n             Definer: myname@localhost\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\ncharacter_set_client is the session value of the character_set_client\nsystem variable when the trigger was created. collation_connection is\nthe session value of the collation_connection system variable when the\ntrigger was created. Database Collation is the collation of the\ndatabase with which the trigger is associated.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-triggers.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-triggers.html'),(26,'MASTER_POS_WAIT',14,'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(27,'REGEXP',37,'Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/regexp.html. Returns 1 if expr\nmatches pat; otherwise it returns 0. If either expr or pat is NULL, the\nresult is NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*: Because MySQL uses the C escape syntax in strings (for example,\n\"\\n\" to represent the newline character), you must double any \"\\\" that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/regexp.html\n\n','mysql> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/regexp.html'),(28,'IF STATEMENT',23,'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nThe IF statement for stored programs implements a basic conditional\nconstruct.\n\n*Note*: There is also an IF() function, which differs from the IF\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html. The\nIF statement can have THEN, ELSE, and ELSEIF clauses, and it is\nterminated with END IF.\n\nIf the search_condition evaluates to true, the corresponding THEN or\nELSEIF clause statement_list executes. If no search_condition matches,\nthe ELSE clause statement_list executes.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/if.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/if.html'),(29,'^',19,'Syntax:\n^\n\nBitwise XOR:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(30,'DROP VIEW',39,'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which nonexisting\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnonexistent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-view.html'),(31,'WITHIN',30,'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(32,'WEEK',31,'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() enables you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEK(\'2008-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'2008-12-31\',1);\n        -> 53\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(33,'SHOW PLUGINS',26,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins. Plugin\ninformation is also available in the INFORMATION_SCHEMA.PLUGINS table.\nSee http://dev.mysql.com/doc/refman/5.5/en/plugins-table.html.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-plugins.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-plugins.html'),(34,'DROP FUNCTION UDF',21,'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-function-udf.html'),(35,'PREPARE',8,'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, \"?\" characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The \"?\" characters should not be enclosed within quotation marks,\neven if you intend to bind them to string values. Parameter markers can\nbe used only where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nA prepared statement is executed with EXECUTE and released with\nDEALLOCATE PREPARE.\n\nThe scope of a prepared statement is the session within which it is\ncreated. Other sessions cannot see it.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/prepare.html'),(36,'LOCK',8,'Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nMySQL enables client sessions to acquire table locks explicitly for the\npurpose of cooperating with other sessions for access to tables, or to\nprevent other sessions from modifying tables during periods when a\nsession requires exclusive access to them. A session can acquire or\nrelease locks only for itself. One session cannot acquire locks for\nanother session or release locks held by another session.\n\nLocks may be used to emulate transactions or to get more speed when\nupdating tables. This is explained in more detail later in this\nsection.\n\nLOCK TABLES explicitly acquires table locks for the current client\nsession. Table locks can be acquired for base tables or views. You must\nhave the LOCK TABLES privilege, and the SELECT privilege for each\nobject to be locked.\n\nFor view locking, LOCK TABLES adds all base tables used in the view to\nthe set of tables to be locked and locks them automatically. If you\nlock a table explicitly with LOCK TABLES, any tables used in triggers\nare also locked implicitly, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/lock-tables-and-triggers.html.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nsession. LOCK TABLES implicitly releases any table locks held by the\ncurrent session before acquiring new locks.\n\nAnother use for UNLOCK TABLES is to release the global read lock\nacquired with the FLUSH TABLES WITH READ LOCK statement, which enables\nyou to lock all tables in all databases. See [HELP FLUSH]. (This is a\nvery convenient way to get backups if you have a file system such as\nVeritas that can take snapshots in time.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/lock-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/lock-tables.html'),(37,'UPDATEXML',37,'Syntax:\nUpdateXML(xml_target, xpath_expr, new_xml)\n\nThis function replaces a single portion of a given fragment of XML\nmarkup xml_target with a new XML fragment new_xml, and then returns the\nchanged XML. The portion of xml_target that is replaced matches an\nXPath expression xpath_expr supplied by the user. In MySQL 5.5, the\nXPath expression can contain at most 127 characters. (This limitation\nis lifted in MySQL 5.6.)\n\nIf no expression matching xpath_expr is found, or if multiple matches\nare found, the function returns the original xml_target XML fragment.\nAll three arguments should be strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html\n\n','mysql> SELECT\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a\', \'<e>fff</e>\') AS val1,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/b\', \'<e>fff</e>\') AS val2,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'//b\', \'<e>fff</e>\') AS val3,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val4,\n    ->   UpdateXML(\'<a><d></d><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val5\n    -> \\G\n\n*************************** 1. row ***************************\nval1: <e>fff</e>\nval2: <a><b>ccc</b><d></d></a>\nval3: <a><e>fff</e><d></d></a>\nval4: <a><b>ccc</b><e>fff</e></a>\nval5: <a><d></d><b>ccc</b><d></d></a>\n','http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html'),(38,'RESET SLAVE',8,'Syntax:\nRESET SLAVE [ALL]\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary log. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay log files, and starts a new relay log file. To use RESET SLAVE,\nthe slave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\n*Note*: All relay log files are deleted, even if they have not been\ncompletely executed by the slave SQL thread. (This is a condition\nlikely to exist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nIn MySQL 5.5 (unlike the case in MySQL 5.1 and earlier), RESET SLAVE\ndoes not change any replication connection parameters such as master\nhost, master port, master user, or master password, which are retained\nin memory. This means that START SLAVE can be issued without requiring\na CHANGE MASTER TO statement following RESET SLAVE.\n\nIn MySQL 5.5.16 and later, you can use RESET SLAVE ALL to reset these\nconnection parameters (Bug #11809016). Connection parameters are also\nreset if the slave mysqld is shut down.\n\nIf the slave SQL thread was in the middle of replicating temporary\ntables when it was stopped, and RESET SLAVE is issued, these replicated\ntemporary tables are deleted on the slave.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset-slave.html'),(39,'SHOW BINARY LOGS',26,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-binary-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-binary-logs.html'),(40,'POLYGON',24,'Polygon(ls1,ls2,...)\n\nConstructs a Polygon value from a number of LineString or WKB\nLineString arguments. If any argument does not represent a LinearRing\n(that is, not a closed and simple LineString), the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(41,'MINUTE',31,'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MINUTE(\'2008-02-03 10:05:03\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(42,'DAY',31,'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(43,'MID',37,'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(44,'UUID',14,'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n\"DCE 1.1: Remote Procedure Call\" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a utf8 string of five\nhexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(45,'LINESTRING',24,'LineString(pt1,pt2,...)\n\nConstructs a LineString value from a number of Point or WKB Point\narguments. If the number of arguments is less than two, the return\nvalue is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(46,'SLEEP',14,'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(47,'CONNECTION_ID',17,'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(48,'DELETE',27,'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns a count of the number of deleted rows. This count\ncan be obtained by calling the ROW_COUNT() function (see\nhttp://dev.mysql.com/doc/refman/5.5/en/information-functions.html). The\nWHERE clause, if given, specifies the conditions that identify which\nrows to delete. With no WHERE clause, all rows are deleted. If the\nORDER BY clause is specified, the rows are deleted in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nCurrently, you cannot delete from a table and select from the same\ntable in a subquery.\n\nYou need the DELETE privilege on a table to delete rows from it. You\nneed only the SELECT privilege for any columns that are only read, such\nas those named in the WHERE clause.\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not need to know the number of\ndeleted rows, is to use TRUNCATE TABLE. However, within a transaction\nor if you have a lock on the table, TRUNCATE TABLE cannot be used\nwhereas DELETE can. See [HELP TRUNCATE TABLE], and [HELP LOCK].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/delete.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/delete.html'),(49,'ROUND',4,'Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(50,'NULLIF',7,'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(51,'CLOSE',23,'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nAn error occurs if the cursor is not open.\n\nIf not closed explicitly, a cursor is closed at the end of the BEGIN\n... END block in which it was declared.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/close.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/close.html'),(52,'STOP SLAVE',8,'Syntax:\nSTOP SLAVE [thread_types]\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\nRecommended best practice is to execute STOP SLAVE on the slave before\nstopping the slave server (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-shutdown.html, for more\ninformation).\n\nWhen using the row-based logging format: You should execute STOP SLAVE\non the slave prior to shutting down the slave server if you are\nreplicating any tables that use a nontransactional storage engine (see\nthe Note later in this section). In MySQL 5.5.9 and later, you can also\nuse STOP SLAVE SQL_THREAD for this purpose.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\n*Note*: In MySQL 5.5, STOP SLAVE waits until the current replication\nevent group affecting one or more non-transactional tables has finished\nexecuting (if there is any such replication group), or until the user\nissues a KILL QUERY or KILL CONNECTION statement. (Bug #319, Bug\n#38205)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/stop-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/stop-slave.html'),(53,'TIMEDIFF',31,'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nThe result returned by TIMEDIFF() is limited to the range allowed for\nTIME values. Alternatively, you can use either of the functions\nTIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'2008-12-31 23:59:59.000001\',\n    ->                 \'2008-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(54,'REPLACE FUNCTION',37,'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(55,'USE',28,'Syntax:\nUSE db_name\n\nThe USE db_name statement tells MySQL to use the db_name database as\nthe default (current) database for subsequent statements. The database\nremains the default until the end of the session or another USE\nstatement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/use.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/use.html'),(56,'LINEFROMTEXT',3,'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(57,'CASE OPERATOR',7,'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(58,'SHOW MASTER STATUS',26,'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the master. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nExample:\n\nmysql> SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-master-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-master-status.html'),(59,'ADDTIME',31,'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT ADDTIME(\'2007-12-31 23:59:59.999999\', \'1 1:1:1.000002\');\n        -> \'2008-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(60,'SPATIAL',34,'For MyISAM tables, MySQL can create spatial indexes using syntax\nsimilar to that for creating regular indexes, but extended with the\nSPATIAL keyword. Currently, columns in spatial indexes must be declared\nNOT NULL. The following examples demonstrate how to create spatial\nindexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage\nengines that support nonspatial indexing of spatial columns, the engine\ncreates a B-tree index. A B-tree index on spatial values will be useful\nfor exact-value lookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-indexes.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-indexes.html'),(61,'TO_SECONDS',31,'Syntax:\nTO_SECONDS(expr)\n\nGiven a date or datetime expr, returns a the number of seconds since\nthe year 0. If expr is not a valid date or datetime value, returns\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TO_SECONDS(950501);\n        -> 62966505600\nmysql> SELECT TO_SECONDS(\'2009-11-29\');\n        -> 63426672000\nmysql> SELECT TO_SECONDS(\'2009-11-29 13:43:32\');\n        -> 63426721412\nmysql> SELECT TO_SECONDS( NOW() );\n        -> 63426721458\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(62,'TIMESTAMPDIFF',31,'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns datetime_expr2 - datetime_expr1, where datetime_expr1 and\ndatetime_expr2 are date or datetime expressions. One expression may be\na date and the other a datetime; a date value is treated as a datetime\nhaving the time part \'00:00:00\' where necessary. The unit for the\nresult (an integer) is given by the unit argument. The legal values for\nunit are the same as those listed in the description of the\nTIMESTAMPADD() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\nmysql> SELECT TIMESTAMPDIFF(MINUTE,\'2003-02-01\',\'2003-05-01 12:05:55\');\n        -> 128885\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(63,'UPPER',37,'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n\nSee the description of LOWER() for information that also applies to\nUPPER(), such as information about how to perform lettercase conversion\nof binary strings (BINARY, VARBINARY, BLOB) for which these functions\nare ineffective.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(64,'FROM_UNIXTIME',31,'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on\nwhether the function is used in a string or numeric context. The value\nis expressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_UNIXTIME(1196440219);\n        -> \'2007-11-30 10:30:19\'\nmysql> SELECT FROM_UNIXTIME(1196440219) + 0;\n        -> 20071130103019.000000\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2007 30th November 10:30:59 2007\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(65,'MEDIUMBLOB',22,'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes. Each\nMEDIUMBLOB value is stored using a 3-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(66,'SHA2',12,'Syntax:\nSHA2(str, hash_length)\n\nCalculates the SHA-2 family of hash functions (SHA-224, SHA-256,\nSHA-384, and SHA-512). The first argument is the cleartext string to be\nhashed. The second argument indicates the desired bit length of the\nresult, which must have a value of 224, 256, 384, 512, or 0 (which is\nequivalent to 256). If either argument is NULL or the hash length is\nnot one of the permitted values, the return value is NULL. Otherwise,\nthe function result is a hash value containing the desired number of\nbits. See the notes at the beginning of this section about storing hash\nvalues efficiently.\n\nAs of MySQL 5.5.6, the return value is a nonbinary string in the\nconnection character set. Before 5.5.6, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT SHA2(\'abc\', 224);\n        -> \'23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(67,'IFNULL',7,'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(68,'SHOW FUNCTION CODE',26,'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-function-code.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-function-code.html'),(69,'SHOW ERRORS',26,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that it displays\ninformation only for errors, rather than for errors, warnings, and\nnotes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-errors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-errors.html'),(70,'LEAST',18,'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If any argument is NULL, the result is NULL. No comparison is needed.\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If the arguments comprise a mix of numbers and strings, they are\n  compared as numbers.\n\no If any argument is a nonbinary (character) string, the arguments are\n  compared as nonbinary strings.\n\no In all other cases, the arguments are compared as binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(71,'=',18,'=\n\nEqual:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(72,'REVERSE',37,'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(73,'ISNULL',18,'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(74,'BINARY',22,'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than nonbinary character strings. M represents the\ncolumn length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(75,'BLOB DATA TYPE',22,'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.5/en/storage-requirements.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/blob.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/blob.html'),(76,'BOUNDARY',36,'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(77,'CREATE USER',10,'Syntax:\nCREATE USER user_specification\n    [, user_specification] ...\n\nuser_specification:\n    user\n    [\n        IDENTIFIED BY [PASSWORD] \'password\'\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n    ]\n\nThe CREATE USER statement creates new MySQL accounts. To use it, you\nmust have the global CREATE USER privilege or the INSERT privilege for\nthe mysql database. For each account, CREATE USER creates a new row in\nthe mysql.user table and assigns the account no privileges. An error\noccurs if the account already exists.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nThe user specification may indicate how the user should authenticate\nwhen connecting to the server:\n\no To enable the user to connect with no password (which is insecure),\n  include no IDENTIFIED BY clause:\n\nCREATE USER \'jeffrey\'@\'localhost\';\n\n  In this case, the account uses built-in authentication and clients\n  must provide no password.\n\no To assign a password, use IDENTIFIED BY with the literal plaintext\n  password value:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\n  The account uses built-in authentication and clients must match the\n  given password.\n\no To avoid specifying the plaintext password if you know its hash value\n  (the value that PASSWORD() would return for the password), specify\n  the hash value preceded by the keyword PASSWORD:\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED BY PASSWORD \'*90E462C37378CED12064BB3388827D2BA3A9B689\';\n\n  The account uses built-in authentication and clients must match the\n  given password.\n\no To authenticate the account using a specific authentication plugin,\n  use IDENTIFIED WITH, where auth_plugin is the plugin name. It can be\n  an unquoted name or a quoted string literal. \'auth_string\' is an\n  optional quoted string literal to pass to the plugin. The plugin\n  interprets the meaning of the string, so its format is plugin\n  specific. Consult the documentation for a given plugin for\n  information about the authentication string values it accepts.\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED WITH my_auth_plugin;\n\n  For connections that use this account, the server invokes the named\n  plugin and clients must provide credentials as required for the\n  authentication method that the plugin implements. If the server\n  cannot find the plugin, either at account-creation time or connect\n  time, an error occurs. IDENTIFIED WITH can be used as of MySQL 5.5.7.\n\nThe IDENTIFIED BY and IDENTIFIED WITH clauses are mutually exclusive,\nso at most one of them can be specified for a given user.\n\nFor additional information about setting passwords, see\nhttp://dev.mysql.com/doc/refman/5.5/en/assigning-passwords.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-user.html'),(78,'POINT',24,'Point(x,y)\n\nConstructs a Point using its coordinates.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(79,'CURRENT_USER',17,'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the user name and host name combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(80,'LCASE',37,'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(81,'<=',18,'Syntax:\n<=\n\nLess than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(82,'SHOW PROFILES',26,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-profiles.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-profiles.html'),(83,'UPDATE',27,'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_reference\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in the named table with new values. The SET clause\nindicates which columns to modify and the values they should be given.\nEach value can be given as an expression, or the keyword DEFAULT to set\na column explicitly to its default value. The WHERE clause, if given,\nspecifies the conditions that identify which rows to update. With no\nWHERE clause, all rows are updated. If the ORDER BY clause is\nspecified, the rows are updated in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. For expression syntax, see\nhttp://dev.mysql.com/doc/refman/5.5/en/expressions.html.\n\ntable_references and where_condition are is specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nYou need the UPDATE privilege only for columns referenced in an UPDATE\nthat are actually updated. You need only the SELECT privilege for any\ncolumns that are read but not modified.\n\nThe UPDATE statement supports the following modifiers:\n\no With the LOW_PRIORITY keyword, execution of the UPDATE is delayed\n  until no other clients are reading from the table. This affects only\n  storage engines that use only table-level locking (such as MyISAM,\n  MEMORY, and MERGE).\n\no With the IGNORE keyword, the update statement does not abort even if\n  errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/update.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/update.html'),(84,'IS NOT NULL',18,'Syntax:\nIS NOT NULL\n\nTests whether a value is not NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(85,'CASE STATEMENT',23,'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored programs implements a complex conditional\nconstruct.\n\n*Note*: There is also a CASE expression, which differs from the CASE\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html. The\nCASE statement cannot have an ELSE NULL clause, and it is terminated\nwith END CASE instead of END.\n\nFor the first syntax, case_value is an expression. This value is\ncompared to the when_value expression in each WHEN clause until one of\nthem is equal. When an equal when_value is found, the corresponding\nTHEN clause statement_list executes. If no when_value is equal, the\nELSE clause statement_list executes, if there is one.\n\nThis syntax cannot be used to test for equality with NULL because NULL\n= NULL is false. See\nhttp://dev.mysql.com/doc/refman/5.5/en/working-with-null.html.\n\nFor the second syntax, each WHEN clause search_condition expression is\nevaluated until one is true, at which point its corresponding THEN\nclause statement_list executes. If no search_condition is equal, the\nELSE clause statement_list executes, if there is one.\n\nIf no when_value or search_condition matches the value tested and the\nCASE statement contains no ELSE clause, a Case not found for CASE\nstatement error results.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nTo handle situations where no value is matched by any WHEN clause, use\nan ELSE containing an empty BEGIN ... END block, as shown in this\nexample. (The indentation used here in the ELSE clause is for purposes\nof clarity only, and is not otherwise significant.)\n\nDELIMITER |\n\nCREATE PROCEDURE p()\n  BEGIN\n    DECLARE v INT DEFAULT 1;\n\n    CASE v\n      WHEN 2 THEN SELECT v;\n      WHEN 3 THEN SELECT 0;\n      ELSE\n        BEGIN\n        END;\n    END CASE;\n  END;\n  |\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/case.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/case.html'),(86,'EXECUTE STATEMENT',8,'Syntax:\nEXECUTE stmt_name\n    [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement with PREPARE, you execute it with an\nEXECUTE statement that refers to the prepared statement name. If the\nprepared statement contains any parameter markers, you must supply a\nUSING clause that lists user variables containing the values to be\nbound to the parameters. Parameter values can be supplied only by user\nvariables, and the USING clause must name exactly as many variables as\nthe number of parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/execute.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/execute.html'),(87,'DROP INDEX',39,'Syntax:\nDROP [ONLINE|OFFLINE] INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-index.html'),(88,'MATCH AGAINST',37,'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large data sets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in 50% or more of the rows are considered common and do not\n  match.\n\n  Full-text searches are natural language searches if the IN NATURAL\n  LANGUAGE MODE modifier is given or if no modifier is given. For more\n  information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-natural-language.html\n  .\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-boolean.html.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The IN NATURAL\n  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier\n  specifies a query expansion search. For more information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-query-expansion.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/fulltext-search.html\n\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE) AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE);\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/fulltext-search.html'),(89,'CREATE EVENT',39,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT\n    [IF NOT EXISTS]\n    event_name\n    ON SCHEDULE schedule\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    DO event_body;\n\nschedule:\n    AT timestamp [+ INTERVAL interval] ...\n  | EVERY interval\n    [STARTS timestamp [+ INTERVAL interval] ...]\n    [ENDS timestamp [+ INTERVAL interval] ...]\n\ninterval:\n    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |\n              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |\n              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}\n\nThis statement creates and schedules a new event. The event will not\nrun unless the Event Scheduler is enabled. For information about\nchecking Event Scheduler status and enabling it if necessary, see\nhttp://dev.mysql.com/doc/refman/5.5/en/events-configuration.html.\n\nCREATE EVENT requires the EVENT privilege for the schema in which the\nevent is to be created. It might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section.\n\nThe minimum requirements for a valid CREATE EVENT statement are as\nfollows:\n\no The keywords CREATE EVENT plus an event name, which uniquely\n  identifies the event in a database schema.\n\no An ON SCHEDULE clause, which determines when and how often the event\n  executes.\n\no A DO clause, which contains the SQL statement to be executed by an\n  event.\n\nThis is an example of a minimal CREATE EVENT statement:\n\nCREATE EVENT myevent\n    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR\n    DO\n      UPDATE myschema.mytable SET mycol = mycol + 1;\n\nThe previous statement creates an event named myevent. This event\nexecutes once---one hour following its creation---by running an SQL\nstatement that increments the value of the myschema.mytable table\'s\nmycol column by 1.\n\nThe event_name must be a valid MySQL identifier with a maximum length\nof 64 characters. Event names are not case sensitive, so you cannot\nhave two events named myevent and MyEvent in the same schema. In\ngeneral, the rules governing event names are the same as those for\nnames of stored routines. See\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\nAn event is associated with a schema. If no schema is indicated as part\nof event_name, the default (current) schema is assumed. To create an\nevent in a specific schema, qualify the event name with a schema using\nschema_name.event_name syntax.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-event.html'),(90,'ABS',4,'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(91,'POLYFROMWKB',32,'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(92,'NOT LIKE',37,'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(93,'SPACE',37,'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(94,'MBR DEFINITION',6,'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html\n\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','http://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html'),(95,'GEOMETRYCOLLECTION',24,'GeometryCollection(g1,g2,...)\n\nConstructs a GeometryCollection.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(96,'MAX',16,'Syntax:\nMAX([DISTINCT] expr)\n\nReturns the maximum value of expr. MAX() may take a string argument; in\nsuch cases, it returns the maximum string value. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the maximum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMAX() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(97,'CREATE FUNCTION UDF',21,'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/udf-compiling.html.\n\nTo create a function, you must have the INSERT privilege for the mysql\ndatabase. This is necessary because CREATE FUNCTION adds a row to the\nmysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-upgrade.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-function-udf.html'),(98,'*',4,'Syntax:\n*\n\nMultiplication:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(99,'TIMESTAMP',22,'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to \'2038-01-19\n03:14:07\' UTC. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nUnless specified otherwise, the first TIMESTAMP column in a table is\ndefined to be automatically set to the date and time of the most recent\nmodification if not explicitly assigned a value. This makes TIMESTAMP\nuseful for recording the timestamp of an INSERT or UPDATE operation.\nYou can also set any TIMESTAMP column to the current date and time by\nassigning it a NULL value, unless it has been defined with the NULL\nattribute to permit NULL values. The automatic initialization and\nupdating to the current date and time can be specified using DEFAULT\nCURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses, as described\nin\nhttp://dev.mysql.com/doc/refman/5.5/en/timestamp-initialization.html.\n\n*Note*: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.5; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(100,'DES_DECRYPT',12,'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.5/en/ssl-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(101,'CACHE INDEX',26,'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  [PARTITION (partition_list | ALL)]\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\npartition_list:\n  partition_name[, partition_name][, ...]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables. After the indexes have been\nassigned, they can be preloaded into the cache if desired with LOAD\nINDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cache-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/cache-index.html'),(102,'ENDPOINT',13,'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions'),(103,'COMPRESS',12,'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(104,'INSERT',27,'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert.html'),(105,'COUNT',16,'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(106,'HANDLER',27,'Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\n\nHANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\n\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/handler.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/handler.html'),(107,'MLINEFROMTEXT',3,'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(108,'GEOMCOLLFROMWKB',32,'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(109,'HELP_DATE',9,'This help information was generated from the MySQL 5.5 Reference Manual\non: 2012-08-25\n','',''),(110,'RENAME TABLE',39,'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nsession can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/rename-table.html\n\n','CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n','http://dev.mysql.com/doc/refman/5.5/en/rename-table.html'),(111,'BOOLEAN',22,'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Nonzero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(112,'DEFAULT',14,'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. An error results if the\ncolumn has no default value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(113,'MOD',4,'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(114,'TINYTEXT',22,'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TINYTEXT value is stored using a 1-byte length prefix\nthat indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(115,'OPTIMIZE TABLE',20,'Syntax:\nOPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file. After\nextensive changes to a table, this statement may also improve\nperformance of statements that use the table, sometimes significantly.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nOPTIMIZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... OPTIMIZE PARTITION to optimize one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/optimize-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/optimize-table.html'),(116,'DECODE',12,'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(117,'<=>',18,'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(118,'HELP STATEMENT',28,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/help.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/help.html'),(119,'RESET',26,'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset.html'),(120,'GET_LOCK',14,'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This enables clients that agree\non a given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also enables a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(121,'UCASE',37,'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(122,'SHOW BINLOG EVENTS',26,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-binlog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-binlog-events.html'),(123,'MPOLYFROMWKB',32,'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(124,'ITERATE',23,'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"start the loop again.\"\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/iterate.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/iterate.html'),(125,'DO',27,'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/do.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/do.html'),(126,'CURTIME',31,'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context. The value is expressed in the current time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(127,'CHAR_LENGTH',37,'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five 2-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(128,'BIGINT',22,'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(129,'SET',26,'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-statement.html'),(130,'LOAD XML',27,'Syntax:\nLOAD XML [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE [db_name.]tbl_name\n    [CHARACTER SET charset_name]\n    [ROWS IDENTIFIED BY \'<tagname>\']\n    [IGNORE number {LINES | ROWS}]\n    [(column_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD XML statement reads data from an XML file into a table. The\nfile_name must be given as a literal string. The tagname in the\noptional ROWS IDENTIFIED BY clause must also be given as a literal\nstring, and must be surrounded by angle brackets (< and >).\n\nLOAD XML acts as the complement of running the mysql client in XML\noutput mode (that is, starting the client with the --xml option). To\nwrite data from a table to an XML file, use a command such as the\nfollowing one from the system shell:\n\nshell> mysql --xml -e \'SELECT * FROM mytable\' > file.xml\n\nTo read the file back into a table, use LOAD XML INFILE. By default,\nthe <row> element is considered to be the equivalent of a database\ntable row; this can be changed using the ROWS IDENTIFIED BY clause.\n\nThis statement supports three different XML formats:\n\no Column names as attributes and column values as attribute values:\n\n<row column1=\"value1\" column2=\"value2\" .../>\n\no Column names as tags and column values as the content of these tags:\n\n<row>\n  <column1>value1</column1>\n  <column2>value2</column2>\n</row>\n\no Column names are the name attributes of <field> tags, and values are\n  the contents of these tags:\n\n<row>\n  <field name=\'column1\'>value1</field>\n  <field name=\'column2\'>value2</field>\n</row>\n\n  This is the format used by other MySQL tools, such as mysqldump.\n\nAll 3 formats can be used in the same XML file; the import routine\nautomatically detects the format for each row and interprets it\ncorrectly. Tags are matched based on the tag or attribute name and the\ncolumn name.\n\nThe following clauses work essentially the same way for LOAD XML as\nthey do for LOAD DATA:\n\no LOW_PRIORITY or CONCURRENT\n\no LOCAL\n\no REPLACE or IGNORE\n\no CHARACTER SET\n\no (column_or_user_var,...)\n\no SET\n\nSee [HELP LOAD DATA], for more information about these clauses.\n\nThe IGNORE number LINES or IGNORE number ROWS clause causes the first\nnumber rows in the XML file to be skipped. It is analogous to the LOAD\nDATA statement\'s IGNORE ... LINES clause.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-xml.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-xml.html'),(131,'CONV',4,'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(132,'DATE',22,'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but permits assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(133,'ASSIGN-VALUE',15,'Syntax:\n:=\n\nAssignment operator. Causes the user variable on the left hand side of\nthe operator to take on the value to its right. The value on the right\nhand side may be a literal value, another variable storing a value, or\nany legal expression that yields a scalar value, including the result\nof a query (provided that this value is a scalar value). You can\nperform multiple assignments in the same SET statement. You can perform\nmultiple assignments in the same statement-\n\nUnlike =, the := operator is never interpreted as a comparison\noperator. This means you can use := in any valid SQL statement (not\njust in SET statements) to assign a value to a variable.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n\nmysql> SELECT @var1:=COUNT(*) FROM t1;\n        -> 4\nmysql> SELECT @var1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html'),(134,'SHOW OPEN TABLES',26,'Syntax:\nSHOW OPEN TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.5/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-open-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-open-tables.html'),(135,'EXTRACT',31,'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT EXTRACT(YEAR FROM \'2009-07-02\');\n       -> 2009\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'2009-07-02 01:02:03\');\n       -> 200907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'2009-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(136,'ENCRYPT',12,'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument must be a string with at least two characters\nor the result will be NULL. If no salt argument is given, a random\nvalue is used.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(137,'SHOW STATUS',26,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command. The LIKE\nclause, if present, indicates which variable names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nWith the GLOBAL modifier, SHOW STATUS displays the status values for\nall connections to MySQL. With SESSION, it displays the status values\nfor the current connection. If no modifier is present, the default is\nSESSION. LOCAL is a synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION. The scope for each status\nvariable is listed at\nhttp://dev.mysql.com/doc/refman/5.5/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-status.html'),(138,'EXTRACTVALUE',37,'Syntax:\nExtractValue(xml_frag, xpath_expr)\n\nExtractValue() takes two string arguments, a fragment of XML markup\nxml_frag and an XPath expression xpath_expr (also known as a locator);\nit returns the text (CDATA) of the first text node which is a child of\nthe elements or elements matched by the XPath expression. In MySQL 5.5,\nthe XPath expression can contain at most 127 characters. (This\nlimitation is lifted in MySQL 5.6.)\n\nUsing this function is the equivalent of performing a match using the\nxpath_expr after appending /text(). In other words,\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b\') and\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b/text()\') produce the same\nresult.\n\nIf multiple matches are found, the content of the first child text node\nof each matching element is returned (in the order matched) as a\nsingle, space-delimited string.\n\nIf no matching text node is found for the expression (including the\nimplicit /text())---for whatever reason, as long as xpath_expr is\nvalid, and xml_frag consists of elements which are properly nested and\nclosed---an empty string is returned. No distinction is made between a\nmatch on an empty element and no match at all. This is by design.\n\nIf you need to determine whether no matching element was found in\nxml_frag or such an element was found but contained no child text\nnodes, you should test the result of an expression that uses the XPath\ncount() function. For example, both of these statements return an empty\nstring, as shown here:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nHowever, you can determine whether there was actually a matching\nelement using the following:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 1                                   |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 0                                   |\n+-------------------------------------+\n1 row in set (0.01 sec)\n\n*Important*: ExtractValue() returns only CDATA, and does not return any\ntags that might be contained within a matching tag, nor any of their\ncontent (see the result returned as val1 in the following example).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html\n\n','mysql> SELECT\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a\') AS val1,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a/b\') AS val2,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'//b\') AS val3,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/b\') AS val4,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b><b>eee</b></a>\', \'//b\') AS val5;\n\n+------+------+------+------+---------+\n| val1 | val2 | val3 | val4 | val5    |\n+------+------+------+------+---------+\n| ccc  | ddd  | ddd  |      | ddd eee |\n+------+------+------+------+---------+\n','http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html'),(139,'OLD_PASSWORD',12,'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added when the implementation of PASSWORD() was\nchanged in MySQL 4.1 to improve security. OLD_PASSWORD() returns the\nvalue of the pre-4.1 implementation of PASSWORD() as a string, and is\nintended to permit you to reset passwords for any pre-4.1 clients that\nneed to connect to your version 5.5 MySQL server without locking them\nout. See http://dev.mysql.com/doc/refman/5.5/en/password-hashing.html.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(140,'FORMAT',37,'Syntax:\nFORMAT(X,D[,locale])\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n\nThe optional third parameter enables a locale to be specified to be\nused for the result number\'s decimal point, thousands separator, and\ngrouping between separators. Permissible locale values are the same as\nthe legal values for the lc_time_names system variable (see\nhttp://dev.mysql.com/doc/refman/5.5/en/locale-support.html). If no\nlocale is specified, the default is \'en_US\'.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\nmysql> SELECT FORMAT(12332.2,2,\'de_DE\');\n        -> \'12.332,20\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(141,'||',15,'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is nonzero, and 0 otherwise. With a NULL operand, the result is\n1 if the other operand is nonzero, and NULL otherwise. If both operands\nare NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(142,'BIT_LENGTH',37,'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(143,'EXTERIORRING',2,'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions'),(144,'GEOMFROMWKB',32,'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(145,'SHOW SLAVE HOSTS',26,'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. (Before MySQL 5.5.3, only slaves started with the\n--report-host=host_name option are visible in this list.)\n\nThe list is displayed on any server (not just the master server). The\noutput looks like this:\n\nmysql> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+\n| Server_id  | Host      | Port | Master_id |\n+------------+-----------+------+-----------+\n|  192168010 | iconnect2 | 3306 | 192168011 |\n| 1921680101 | athena    | 3306 | 192168011 |\n+------------+-----------+------+-----------+\n\no Server_id: The unique server ID of the slave server, as configured in\n  the server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the slave server, as configured in the\n  server\'s option file, or on the command line with\n  --report-host=host_name. Note that this can differ from the machine\n  name as configured in the operating system.\n\no Port: The port the slave server is listening on.\n\n  In MySQL 5.5.23 and later, a zero in this column means that the slave\n  port (--report-port) was not set. Prior to MySQL 5.5.23, 3306 was\n  used as the default in such cases (Bug #13333431).\n\no Master_id: The unique server ID of the master server that the slave\n  server is replicating from.\n\nSome MySQL versions report another variable, Rpl_recovery_rank. This\nvariable was never used, and was removed in MySQL 5.5.3. (Bug #13963)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-slave-hosts.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-slave-hosts.html'),(146,'START TRANSACTION',8,'Syntax:\nSTART TRANSACTION [WITH CONSISTENT SNAPSHOT]\nBEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET autocommit = {0 | 1}\n\nThese statements provide control over use of transactions:\n\no START TRANSACTION or BEGIN start a new transaction.\n\no COMMIT commits the current transaction, making its changes permanent.\n\no ROLLBACK rolls back the current transaction, canceling its changes.\n\no SET autocommit disables or enables the default autocommit mode for\n  the current session.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk to make it permanent. The change cannot be\nrolled back.\n\nTo disable autocommit mode implicitly for a single series of\nstatements, use the START TRANSACTION statement:\n\nSTART TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n\nWith START TRANSACTION, autocommit remains disabled until you end the\ntransaction with COMMIT or ROLLBACK. The autocommit mode then reverts\nto its previous state.\n\nYou can also begin a transaction like this:\n\nSTART TRANSACTION WITH CONSISTENT SNAPSHOT;\n\nThe WITH CONSISTENT SNAPSHOT option starts a consistent read for\nstorage engines that are capable of it. This applies only to InnoDB.\nThe effect is the same as issuing a START TRANSACTION followed by a\nSELECT from any InnoDB table. See\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html. The\nWITH CONSISTENT SNAPSHOT option does not change the current transaction\nisolation level, so it provides a consistent snapshot only if the\ncurrent isolation level is one that permits consistent read (REPEATABLE\nREAD or SERIALIZABLE).\n\n*Important*: Many APIs used for writing MySQL client applications (such\nas JDBC) provide their own methods for starting transactions that can\n(and sometimes should) be used instead of sending a START TRANSACTION\nstatement from the client. See\nhttp://dev.mysql.com/doc/refman/5.5/en/connectors-apis.html, or the\ndocumentation for your API, for more information.\n\nTo disable autocommit mode explicitly, use the following statement:\n\nSET autocommit=0;\n\nAfter disabling autocommit mode by setting the autocommit variable to\nzero, changes to transaction-safe tables (such as those for InnoDB or\nNDBCLUSTER) are not made permanent immediately. You must use COMMIT to\nstore your changes to disk or ROLLBACK to ignore the changes.\n\nautocommit is a session variable and must be set for each session. To\ndisable autocommit mode for each new connection, see the description of\nthe autocommit system variable at\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nBEGIN and BEGIN WORK are supported as aliases of START TRANSACTION for\ninitiating a transaction. START TRANSACTION is standard SQL syntax and\nis the recommended way to start an ad-hoc transaction.\n\nThe BEGIN statement differs from the use of the BEGIN keyword that\nstarts a BEGIN ... END compound statement. The latter does not begin a\ntransaction. See [HELP BEGIN END].\n\n*Note*: Within all stored programs (stored procedures and functions,\ntriggers, and events), the parser treats BEGIN [WORK] as the beginning\nof a BEGIN ... END block. Begin a transaction in this context with\nSTART TRANSACTION instead.\n\nThe optional WORK keyword is supported for COMMIT and ROLLBACK, as are\nthe CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for\nadditional control over transaction completion. The value of the\ncompletion_type system variable determines the default completion\nbehavior. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client session after terminating the\ncurrent transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/commit.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/commit.html'),(147,'BETWEEN AND',18,'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.5/en/type-conversion.html, but\napplied to all the three arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;\n        -> 1, 0\nmysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(148,'MULTIPOLYGON',24,'MultiPolygon(poly1,poly2,...)\n\nConstructs a MultiPolygon value from a set of Polygon or WKB Polygon\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(149,'TIME_FORMAT',31,'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, seconds, and\nmicroseconds. Other specifiers produce a NULL value or 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(150,'LEFT',37,'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(151,'FLUSH QUERY CACHE',26,'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/query-cache-status-and-maintenance.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/query-cache-status-and-maintenance.html'),(152,'SET DATA TYPE',22,'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(153,'RAND',4,'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. If a\nconstant integer argument N is specified, it is used as the seed value,\nwhich produces a repeatable sequence of column values. In the following\nexample, note that the sequences of values produced by RAND(3) is the\nsame both places where it occurs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> CREATE TABLE t (i INT);\nQuery OK, 0 rows affected (0.42 sec)\n\nmysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.61914388706828 |\n|    2 | 0.93845168309142 |\n|    3 | 0.83482678498591 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.35877890638893 |\n|    2 | 0.28941420772058 |\n|    3 | 0.37073435016976 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.01 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(154,'RPAD',37,'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(155,'CREATE DATABASE',39,'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification] ...\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-database.html'),(156,'DEC',22,'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(157,'VAR_POP',16,'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. You can also use VARIANCE(), which is equivalent but\nis not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(158,'ELT',37,'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(159,'ALTER VIEW',39,'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement. ALTER\nVIEW is permitted only to the definer or users with the SUPER\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-view.html'),(160,'SHOW DATABASES',26,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-databases.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-databases.html'),(161,'~',19,'Syntax:\n~\n\nInvert all bits.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 5 & ~1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(162,'TEXT',22,'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TEXT value is stored using a 2-byte length prefix that\nindicates the number of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(163,'CONCAT_WS',37,'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(164,'ROW_COUNT',17,'Syntax:\nROW_COUNT()\n\nBefore MySQL 5.5.5, ROW_COUNT() returns the number of rows changed,\ndeleted, or inserted by the last statement if it was an UPDATE, DELETE,\nor INSERT. For other statements, the value may not be meaningful.\n\nAs of MySQL 5.5.5, ROW_COUNT() returns a value as follows:\n\no DDL statements: 0. This applies to statements such as CREATE TABLE or\n  DROP TABLE.\n\no DML statements other than SELECT: The number of affected rows. This\n  applies to statements such as UPDATE, INSERT, or DELETE (as before),\n  but now also to statements such as ALTER TABLE and LOAD DATA INFILE.\n\no SELECT: -1 if the statement returns a result set, or the number of\n  rows \"affected\" if it does not. For example, for SELECT * FROM t1,\n  ROW_COUNT() returns -1. For SELECT * FROM t1 INTO OUTFILE\n  \'file_name\', ROW_COUNT() returns the number of rows written to the\n  file.\n\no SIGNAL statements: 0.\n\nFor UPDATE statements, the affected-rows value by default is the number\nof rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to\nmysql_real_connect() when connecting to mysqld, the affected-rows value\nis the number of rows \"found\"; that is, matched by the WHERE clause.\n\nFor REPLACE statements, the affected-rows value is 2 if the new row\nreplaced an old row, because in this case, one row was inserted after\nthe duplicate was deleted.\n\nFor INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows\nvalue is 1 if the row is inserted as a new row and 2 if an existing row\nis updated.\n\nThe ROW_COUNT() value is similar to the value from the\nmysql_affected_rows() C API function and the row count that the mysql\nclient displays following statement execution.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(165,'ASIN',4,'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(166,'SIGN',4,'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(167,'SEC_TO_TIME',31,'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(168,'FLOAT',22,'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Permissible values\nare -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.5/en/no-matching-rows.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(169,'LOCATE',37,'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(170,'SHOW EVENTS',26,'Syntax:\nSHOW EVENTS [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nmysql> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nmysql> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 10\n      Interval field: SECOND\n              Starts: 2006-02-09 10:41:23\n                Ends: NULL\n              Status: ENABLED\n          Originator: 0\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-events.html'),(171,'CHARSET',17,'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(172,'SUBDATE',31,'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\nmysql> SELECT SUBDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\n\nThe second form enables the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'2008-01-02 12:00:00\', 31);\n        -> \'2007-12-02 12:00:00\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(173,'DAYOFYEAR',31,'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFYEAR(\'2007-02-03\');\n        -> 34\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(174,'%',4,'Syntax:\nN % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in\nhttp://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(175,'LONGTEXT',22,'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The effective maximum length is less if the value contains\nmulti-byte characters. The effective maximum length of LONGTEXT columns\nalso depends on the configured maximum packet size in the client/server\nprotocol and available memory. Each LONGTEXT value is stored using a\n4-byte length prefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(176,'KILL',26,'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*: You cannot use KILL with the Embedded MySQL Server library\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/kill.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/kill.html'),(177,'DISJOINT',30,'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(178,'ASTEXT',3,'AsText(g), AsWKT(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-to-convert-geometries-between-formats.html\n\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/functions-to-convert-geometries-between-formats.html'),(179,'LPAD',37,'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(180,'DECLARE CONDITION',23,'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n\nThe DECLARE ... CONDITION statement declares a named error condition,\nassociating a name with a condition that needs specific handling. The\nname can be referred to in a subsequent DECLARE ... HANDLER statement\n(see [HELP DECLARE HANDLER]).\n\nCondition declarations must appear before cursor or handler\ndeclarations.\n\nThe condition_value for DECLARE ... CONDITION can be a MySQL error code\n(a number) or an SQLSTATE value (a 5-character string literal). You\nshould not use MySQL error code 0 or SQLSTATE values that begin with\n\'00\', because those indicate success rather than an error condition.\nFor a list of MySQL error codes and SQLSTATE values, see\nhttp://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-condition.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-condition.html'),(181,'OVERLAPS',30,'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(182,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER',8,'Syntax:\nSET GLOBAL sql_slave_skip_counter = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave threads are not running.\nOtherwise, it produces an error.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-global-sql-slave-skip-counter.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-global-sql-slave-skip-counter.html'),(183,'NUMGEOMETRIES',25,'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#geometrycollection-property-functions\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#geometrycollection-property-functions'),(184,'MONTHNAME',31,'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.5/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MONTHNAME(\'2008-02-03\');\n        -> \'February\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(185,'CHANGE MASTER TO',8,'Syntax:\nCHANGE MASTER TO option [, option] ...\n\noption:\n    MASTER_BIND = \'interface_name\'\n  | MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = interval\n  | MASTER_HEARTBEAT_PERIOD = interval\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}\n  | IGNORE_SERVER_IDS = (server_id_list)\n\nserver_id_list:\n    [server_id [, server_id] ... ]\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to the master server, for reading the master binary log, and\nreading the slave relay log. It also updates the contents of the\nmaster.info and relay-log.info files. To use CHANGE MASTER TO, the\nslave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\nOptions not specified retain their value, except as indicated in the\nfollowing discussion. Thus, in most cases, there is no need to specify\noptions that do not change. For example, if the password to connect to\nyour MySQL master has changed, you just need to issue these statements\nto tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nMASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide\ninformation to the slave about how to connect to its master:\n\no MASTER_HOST and MASTER_PORT are the host name (or IP address) of the\n  master host and its TCP/IP port.\n\n  *Note*: Replication cannot use Unix socket files. You must be able to\n  connect to the master MySQL server using TCP/IP.\n\n  If you specify the MASTER_HOST or MASTER_PORT option, the slave\n  assumes that the master server is different from before (even if the\n  option value is the same as its current value.) In this case, the old\n  values for the master binary log file name and position are\n  considered no longer applicable, so if you do not specify\n  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,\n  MASTER_LOG_FILE=\'\' and MASTER_LOG_POS=4 are silently appended to it.\n\n  Setting MASTER_HOST=\'\' (that is, setting its value explicitly to an\n  empty string) is not the same as not setting MASTER_HOST at all.\n  Beginning with MySQL 5.5, trying to set MASTER_HOST to an empty\n  string fails with an error. Previously, setting MASTER_HOST to an\n  empty string caused START SLAVE subsequently to fail. (Bug #28796)\n\no MASTER_USER and MASTER_PASSWORD are the user name and password of the\n  account to use for connecting to the master.\n\n  In MySQL 5.5.20 and later, MASTER_USER cannot be made empty; setting\n  MASTER_USER = \'\' or leaving it unset when setting a value for for\n  MASTER_PASSWORD causes an error (Bug #13427949).\n\n  Currently, a password used for a replication slave account is\n  effectively limited to 32 characters in length; the password can be\n  longer, but any excess characters are truncated. This is not due to\n  any limit imposed by the MySQL Server generally, but rather is an\n  issue specific to MySQL Replication. (For more information, see Bug\n  #43439.)\n\n  The text of a running CHANGE MASTER TO statement, including values\n  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a\n  concurrent SHOW PROCESSLIST statement.\n\nThe MASTER_SSL_xxx options provide information about using SSL for the\nconnection. They correspond to the --ssl-xxx options described in\nhttp://dev.mysql.com/doc/refman/5.5/en/ssl-options.html, and\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-solutions-ssl.html.\nThese options can be changed even on slaves that are compiled without\nSSL support. They are saved to the master.info file, but are ignored if\nthe slave does not have SSL support enabled.\n\nMASTER_CONNECT_RETRY specifies how many seconds to wait between connect\nretries. The default is 60. The number of reconnection attempts is\nlimited by the --master-retry-count server option; for more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-options.html.\n\nThe MASTER_BIND option is available in MySQL Cluster NDB 7.2 and later,\nbut is not supported in mainline MySQL 5.5.\n\nMASTER_BIND is for use on replication slaves having multiple network\ninterfaces, and determines which of the slave\'s network interfaces is\nchosen for connecting to the master.\n\nMASTER_HEARTBEAT_PERIOD sets the interval in seconds between\nreplication heartbeats. Whenever the master\'s binary log is updated\nwith an event, the waiting period for the next heartbeat is reset.\ninterval is a decimal value having the range 0 to 4294967 seconds and a\nresolution in milliseconds; the smallest nonzero value is 0.001.\nHeartbeats are sent by the master only if there are no unsent events in\nthe binary log file for a period longer than interval.\n\nSetting interval to 0 disables heartbeats altogether. The default value\nfor interval is equal to the value of slave_net_timeout divided by 2.\n\nSetting @@global.slave_net_timeout to a value less than that of the\ncurrent heartbeat interval results in a warning being issued. The\neffect of issuing RESET SLAVE on the heartbeat interval is to reset it\nto the default value.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at\nwhich the slave SQL thread should begin reading from the relay log the\nnext time the thread starts. If you specify either of MASTER_LOG_FILE\nor MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.\nIf neither of MASTER_LOG_FILE or MASTER_LOG_POS is specified, the slave\nuses the last coordinates of the slave SQL thread before CHANGE MASTER\nTO was issued. This ensures that there is no discontinuity in\nreplication, even if the slave SQL thread was late compared to the\nslave I/O thread, when you merely want to change, say, the password to\nuse.\n\nCHANGE MASTER TO deletes all relay log files and starts a new one,\nunless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay\nlog files are kept; the relay_log_purge global variable is set silently\nto 0.\n\nPrior to MySQL 5.5, RELAY_LOG_FILE required an absolute path. In MySQL\n5.5, the path can be relative, in which case the path is assumed to be\nrelative to the slave\'s data directory. (Bug #12190)\n\nIGNORE_SERVER_IDS was added in MySQL 5.5. This option takes a\ncomma-separated list of 0 or more server IDs. Events originating from\nthe corresponding servers are ignored, with the exception of log\nrotation and deletion events, which are still recorded in the relay\nlog.\n\nIn circular replication, the originating server normally acts as the\nterminator of its own events, so that they are not applied more than\nonce. Thus, this option is useful in circular replication when one of\nthe servers in the circle is removed. Suppose that you have a circular\nreplication setup with 4 servers, having server IDs 1, 2, 3, and 4, and\nserver 3 fails. When bridging the gap by starting replication from\nserver 2 to server 4, you can include IGNORE_SERVER_IDS = (3) in the\nCHANGE MASTER TO statement that you issue on server 4 to tell it to use\nserver 2 as its master instead of server 3. Doing so causes it to\nignore and not to propagate any statements that originated with the\nserver that is no longer in use.\n\nIf a CHANGE MASTER TO statement is issued without any IGNORE_SERVER_IDS\noption, any existing list is preserved; RESET SLAVE also has no effect\non the server ID list. To clear the list of ignored servers, it is\nnecessary to use the option with an empty list:\n\nCHANGE MASTER TO IGNORE_SERVER_IDS = ();\n\nIf IGNORE_SERVER_IDS contains the server\'s own ID and the server was\nstarted with the --replicate-same-server-id option enabled, an error\nresults.\n\nAlso beginning with MySQL 5.5, the master.info file and the output of\nSHOW SLAVE STATUS are extended to provide the list of servers that are\ncurrently ignored. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/slave-logs-status.html, and\n[HELP SHOW SLAVE STATUS].\n\nBeginning with MySQL 5.5.5, invoking CHANGE MASTER TO causes the\nprevious values for MASTER_HOST, MASTER_PORT, MASTER_LOG_FILE, and\nMASTER_LOG_POS to be written to the error log, along with other\ninformation about the slave\'s state prior to execution.\n\nCHANGE MASTER TO is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the master binary log\ncoordinates corresponding to the time of the snapshot. After loading\nthe snapshot into the slave to synchronize it to the slave, you can run\nCHANGE MASTER TO MASTER_LOG_FILE=\'log_name\', MASTER_LOG_POS=log_pos on\nthe slave to specify the coordinates at which the slave should begin\nreading the master binary log.\n\nThe following example changes the master server the slave uses and\nestablishes the master binary log coordinates from which the slave\nbegins reading. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay log files that you want it to\nexecute again for some reason. To do this, the master need not be\nreachable. You need only use CHANGE MASTER TO and start the SQL thread\n(START SLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/change-master-to.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/change-master-to.html'),(186,'DROP DATABASE',39,'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE.\n\n*Important*: When a database is dropped, user privileges on the\ndatabase are not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-database.html'),(187,'MBREQUAL',6,'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(188,'TIMESTAMP FUNCTION',31,'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(189,'PROCEDURE ANALYSE',33,'Syntax:\nANALYSE([max_elements[,max_memory]])\n\nANALYSE() examines the result from a query and returns an analysis of\nthe results that suggests optimal data types for each column that may\nhelp reduce table sizes. To obtain this analysis, append PROCEDURE\nANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that ANALYSE() notices per column. This is used by ANALYSE() to check\n  whether the optimal data type should be of type ENUM; if there are\n  more than max_elements distinct values, then ENUM is not a suggested\n  type.\n\no max_memory (default 8192) is the maximum amount of memory that\n  ANALYSE() should allocate per column while trying to find all\n  distinct values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/procedure-analyse.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/procedure-analyse.html'),(190,'HELP_VERSION',9,'This help information was generated from the MySQL 5.5 Reference Manual\non: 2012-08-25 (revision: 31914)\n\nThis information applies to MySQL 5.5 through 5.5.29.\n','',''),(191,'CHARACTER_LENGTH',37,'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(192,'SHOW GRANTS',26,'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nuser name part of the account name, a host name part of \'%\' is used.\nFor additional information about specifying account names, see [HELP\nGRANT].\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any of the equivalent syntaxes) is\nused in DEFINER context, such as within a stored procedure that is\ndefined with SQL SECURITY DEFINER), the grants displayed are those of\nthe definer and not the invoker.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-grants.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-grants.html'),(193,'SHOW PRIVILEGES',26,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-privileges.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-privileges.html'),(194,'CREATE TABLESPACE',39,'Syntax:\nCREATE TABLESPACE tablespace_name\n    ADD DATAFILE \'file_name\'\n    USE LOGFILE GROUP logfile_group\n    [EXTENT_SIZE [=] extent_size]\n    [INITIAL_SIZE [=] initial_size]\n    [AUTOEXTEND_SIZE [=] autoextend_size]\n    [MAX_SIZE [=] max_size]\n    [NODEGROUP [=] nodegroup_id]\n    [WAIT]\n    [COMMENT [=] comment_text]\n    ENGINE [=] engine_name\n\nThis statement is used to create a tablespace, which can contain one or\nmore data files, providing storage space for tables. One data file is\ncreated and added to the tablespace using this statement. Additional\ndata files may be added to the tablespace by using the ALTER TABLESPACE\nstatement (see [HELP ALTER TABLESPACE]). For rules covering the naming\nof tablespaces, see\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and a log file group with the same name, or a\ntablespace and a data file with the same name.\n\nA log file group of one or more UNDO log files must be assigned to the\ntablespace to be created with the USE LOGFILE GROUP clause.\nlogfile_group must be an existing log file group created with CREATE\nLOGFILE GROUP (see\nhttp://dev.mysql.com/doc/refman/5.5/en/create-logfile-group.html).\nMultiple tablespaces may use the same log file group for UNDO logging.\n\nThe EXTENT_SIZE sets the size, in bytes, of the extents used by any\nfiles belonging to the tablespace. The default value is 1M. The minimum\nsize is 32K, and theoretical maximum is 2G, although the practical\nmaximum size depends on a number of factors. In most cases, changing\nthe extent size does not have any measurable effect on performance, and\nthe default value is recommended for all but the most unusual\nsituations.\n\nAn extent is a unit of disk space allocation. One extent is filled with\nas much data as that extent can contain before another extent is used.\nIn theory, up to 65,535 (64K) extents may used per data file; however,\nthe recommended maximum is 32,768 (32K). The recommended maximum size\nfor a single data file is 32G---that is, 32K extents x 1 MB per extent.\nIn addition, once an extent is allocated to a given partition, it\ncannot be used to store data from a different partition; an extent\ncannot store data from more than one partition. This means, for example\nthat a tablespace having a single datafile whose INITIAL_SIZE is 256 MB\nand whose EXTENT_SIZE is 128M has just two extents, and so can be used\nto store data from at most two different disk data table partitions.\n\nYou can see how many extents remain free in a given data file by\nquerying the INFORMATION_SCHEMA.FILES table, and so derive an estimate\nfor how much space remains free in the file. For further discussion and\nexamples, see http://dev.mysql.com/doc/refman/5.5/en/files-table.html.\n\nThe INITIAL_SIZE parameter sets the data file\'s total size in bytes.\nOnce the file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using ALTER TABLESPACE\n... ADD DATAFILE. See [HELP ALTER TABLESPACE].\n\nINITIAL_SIZE is optional; its default value is 128M.\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nWhen setting EXTENT_SIZE or INITIAL_SIZE (either or both), you may\noptionally follow the number with a one-letter abbreviation for an\norder of magnitude, similar to those used in my.cnf. Generally, this is\none of the letters M (for megabytes) or G (for gigabytes).\n\nINITIAL_SIZE, EXTENT_SIZE, and UNDO_BUFFER_SIZE are subject to rounding\nas follows:\n\no EXTENT_SIZE and UNDO_BUFFER_SIZE are each rounded up to the nearest\n  whole multiple of 32K.\n\no INITIAL_SIZE is rounded down to the nearest whole multiple of 32K.\n\n  For data files, INITIAL_SIZE is subject to further rounding; the\n  result just obtained is rounded up to the nearest whole multiple of\n  EXTENT_SIZE (after any rounding).\n\nThe rounding just described is done explicitly, and a warning is issued\nby the MySQL Server when any such rounding is performed. The rounded\nvalues are also used by the NDB kernel for calculating\nINFORMATION_SCHEMA.FILES column values and other purposes. However, to\navoid an unexpected result, we suggest that you always use whole\nmultiples of 32K in specifying these options.\n\nAUTOEXTEND_SIZE, MAX_SIZE, NODEGROUP, WAIT, and COMMENT are parsed but\nignored, and so currently have no effect. These options are intended\nfor future expansion.\n\nThe ENGINE parameter determines the storage engine which uses this\ntablespace, with engine_name being the name of the storage engine.\nCurrently, engine_name must be one of the values NDB or NDBCLUSTER.\n\nWhen CREATE TABLESPACE is used with ENGINE = NDB, a tablespace and\nassociated data file are created on each Cluster data node. You can\nverify that the data files were created and obtain information about\nthem by querying the INFORMATION_SCHEMA.FILES table. For example:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+-------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME   | EXTRA          |\n+--------------------+-------------+----------------+\n| lg_3               | newdata.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat | CLUSTER_NODE=4 |\n+--------------------+-------------+----------------+\n2 rows in set (0.01 sec)\n\n(See http://dev.mysql.com/doc/refman/5.5/en/files-table.html.)\n\nCREATE TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-tablespace.html'),(195,'INSERT FUNCTION',37,'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(196,'CRC32',4,'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(197,'XOR',15,'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is nonzero,\notherwise 0 is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(198,'STARTPOINT',13,'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions'),(199,'GRANT',10,'Syntax:\nGRANT\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    TO user_specification [, user_specification] ...\n    [REQUIRE {NONE | ssl_option [[AND] ssl_option] ...}]\n    [WITH with_option ...]\n\nGRANT PROXY ON user_specification\n    TO user_specification [, user_specification] ...\n    [WITH GRANT OPTION]\n\nobject_type:\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\npriv_level:\n    *\n  | *.*\n  | db_name.*\n  | db_name.tbl_name\n  | tbl_name\n  | db_name.routine_name\n\nuser_specification:\n    user\n    [\n        IDENTIFIED BY [PASSWORD] \'password\'\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n    ]\n\nssl_option:\n    SSL\n  | X509\n  | CIPHER \'cipher\'\n  | ISSUER \'issuer\'\n  | SUBJECT \'subject\'\n\nwith_option:\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement grants privileges to MySQL user accounts. GRANT\nalso serves to specify other account characteristics such as use of\nsecure connections and limits on access to server resources. To use\nGRANT, you must have the GRANT OPTION privilege, and you must have the\nprivileges that you are granting.\n\nNormally, a database administrator first uses CREATE USER to create an\naccount, then GRANT to define its privileges and characteristics. For\nexample:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\nGRANT SELECT ON db2.invoice TO \'jeffrey\'@\'localhost\';\nGRANT USAGE ON *.* TO \'jeffrey\'@\'localhost\' WITH MAX_QUERIES_PER_HOUR 90;\n\nHowever, if an account named in a GRANT statement does not already\nexist, GRANT may create it under the conditions described later in the\ndiscussion of the NO_AUTO_CREATE_USER SQL mode.\n\nThe REVOKE statement is related to GRANT and enables administrators to\nremove account privileges. See [HELP REVOKE].\n\nWhen successfully executed from the mysql program, GRANT responds with\nQuery OK, 0 rows affected. To determine what privileges result from the\noperation, use SHOW GRANTS. See [HELP SHOW GRANTS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/grant.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/grant.html'),(200,'DECLARE VARIABLE',23,'Syntax:\nDECLARE var_name [, var_name] ... type [DEFAULT value]\n\nThis statement declares local variables within stored programs. To\nprovide a default value for a variable, include a DEFAULT clause. The\nvalue can be specified as an expression; it need not be a constant. If\nthe DEFAULT clause is missing, the initial value is NULL.\n\nLocal variables are treated like stored routine parameters with respect\nto data type and overflow checking. See [HELP CREATE PROCEDURE].\n\nVariable declarations must appear before cursor or handler\ndeclarations.\n\nLocal variable names are not case sensitive. Permissible characters and\nquoting rules are the same as for other identifiers, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\nThe scope of a local variable is the BEGIN ... END block within which\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-local-variable.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-local-variable.html'),(201,'MPOLYFROMTEXT',3,'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(202,'MBRINTERSECTS',6,'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(203,'BIT_OR',16,'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(204,'YEARWEEK',31,'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(205,'NOT BETWEEN',18,'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(206,'IS NOT',18,'Syntax:\nIS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(207,'LOG10',4,'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(208,'SQRT',4,'Syntax:\nSQRT(X)\n\nReturns the square root of a nonnegative number X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(209,'DECIMAL',22,'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the \"-\" sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65.\nThe maximum number of supported decimals (D) is 30. If D is omitted,\nthe default is 0. If M is omitted, the default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(210,'CREATE INDEX',39,'Syntax:\nCREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_option] ...\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-index.html'),(211,'CREATE FUNCTION',39,'The CREATE FUNCTION statement is used to create stored functions and\nuser-defined functions (UDFs):\n\no For information about creating stored functions, see [HELP CREATE\n  PROCEDURE].\n\no For information about creating user-defined functions, see [HELP\n  CREATE FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-function.html'),(212,'ALTER DATABASE',39,'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\nALTER {DATABASE | SCHEMA} db_name\n    UPGRADE DATA DIRECTORY NAME\n\nalter_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE.\n\nThe database name can be omitted from the first syntax, in which case\nthe statement applies to the default database.\n\nNational Language Characteristics\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.5/en/charset.html, discusses\ncharacter set and collation names.\n\nYou can see what character sets and collations are available using,\nrespectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See\n[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more\ninformation.\n\nIf you change the default character set or collation for a database,\nstored routines that use the database defaults must be dropped and\nrecreated so that they use the new defaults. (In a stored routine,\nvariables with character data types use the database defaults if the\ncharacter set or collation are not specified explicitly. See [HELP\nCREATE PROCEDURE].)\n\nUpgrading from Versions Older than MySQL 5.1\n\nThe syntax that includes the UPGRADE DATA DIRECTORY NAME clause updates\nthe name of the directory associated with the database to use the\nencoding implemented in MySQL 5.1 for mapping database names to\ndatabase directory names (see\nhttp://dev.mysql.com/doc/refman/5.5/en/identifier-mapping.html). This\nclause is for use under these conditions:\n\no It is intended when upgrading MySQL to 5.1 or later from older\n  versions.\n\no It is intended to update a database directory name to the current\n  encoding format if the name contains special characters that need\n  encoding.\n\no The statement is used by mysqlcheck (as invoked by mysql_upgrade).\n\nFor example, if a database in MySQL 5.0 has the name a-b-c, the name\ncontains instances of the - (dash) character. In MySQL 5.0, the\ndatabase directory is also named a-b-c, which is not necessarily safe\nfor all file systems. In MySQL 5.1 and later, the same database name is\nencoded as a@002db@002dc to produce a file system-neutral directory\nname.\n\nWhen a MySQL installation is upgraded to MySQL 5.1 or later from an\nolder version,the server displays a name such as a-b-c (which is in the\nold format) as #mysql50#a-b-c, and you must refer to the name using the\n#mysql50# prefix. Use UPGRADE DATA DIRECTORY NAME in this case to\nexplicitly tell the server to re-encode the database directory name to\nthe current encoding format:\n\nALTER DATABASE `#mysql50#a-b-c` UPGRADE DATA DIRECTORY NAME;\n\nAfter executing this statement, you can refer to the database as a-b-c\nwithout the special #mysql50# prefix.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-database.html'),(213,'GEOMETRYN',25,'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#geometrycollection-property-functions\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#geometrycollection-property-functions'),(214,'<<',19,'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 1 << 2;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(215,'SHOW TABLE STATUS',26,'Syntax:\nSHOW TABLE STATUS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-table-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-table-status.html'),(216,'MD5',12,'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a string of 32 hex digits, or NULL if the argument was\nNULL. The return value can, for example, be used as a hash key. See the\nnotes at the beginning of this section about storing hash values\nefficiently.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(217,'<',18,'Syntax:\n<\n\nLess than:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 < 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(218,'UNIX_TIMESTAMP',31,'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/time-zone-support.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 1196440210\nmysql> SELECT UNIX_TIMESTAMP(\'2007-11-30 10:30:19\');\n        -> 1196440219\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(219,'DAYOFMONTH',31,'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 1 to 31, or 0 for\ndates such as \'0000-00-00\' or \'2008-00-00\' that have a zero day part.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFMONTH(\'2007-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(220,'ASCII',37,'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(221,'DIV',4,'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n\nAs of MySQL 5.5.3, if either operand has a noninteger type, the\noperands are converted to DECIMAL and divided using DECIMAL arithmetic\nbefore converting the result to BIGINT. If the result exceeds BIGINT\nrange, an error occurs. Before MySQL 5.5.3, incorrect results may occur\nfor noninteger operands that exceed BIGINT range.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 5 DIV 2;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(222,'RENAME USER',10,'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account name uses the format\ndescribed in http://dev.mysql.com/doc/refman/5.5/en/account-names.html.\nFor example:\n\nRENAME USER \'jeffrey\'@\'localhost\' TO \'jeff\'@\'127.0.0.1\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nRENAME USER causes the privileges held by the old user to be those held\nby the new user. However, RENAME USER does not automatically drop or\ninvalidate databases or objects within them that the old user created.\nThis includes stored programs or views for which the DEFINER attribute\nnames the old user. Attempts to access such objects may produce an\nerror if they execute in definer security context. (For information\nabout security context, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-security.html.)\n\nThe privilege changes take effect as indicated in\nhttp://dev.mysql.com/doc/refman/5.5/en/privilege-changes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/rename-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/rename-user.html'),(223,'SHOW SLAVE STATUS',26,'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n               Slave_IO_State: Waiting for master to send event\n                  Master_Host: localhost\n                  Master_User: root\n                  Master_Port: 3306\n                Connect_Retry: 3\n              Master_Log_File: gbichot-bin.005\n          Read_Master_Log_Pos: 79\n               Relay_Log_File: gbichot-relay-bin.005\n                Relay_Log_Pos: 548\n        Relay_Master_Log_File: gbichot-bin.005\n             Slave_IO_Running: Yes\n            Slave_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Master_Log_Pos: 79\n              Relay_Log_Space: 552\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Master_SSL_Allowed: No\n           Master_SSL_CA_File:\n           Master_SSL_CA_Path:\n              Master_SSL_Cert:\n            Master_SSL_Cipher:\n               Master_SSL_Key:\n        Seconds_Behind_Master: 8\nMaster_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids: 0\n             Master_Server_Id: 1\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-slave-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-slave-status.html'),(224,'GEOMETRY',34,'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, and ARCHIVE\ntables. See also the annotations about spatial indexes under [HELP\nSPATIAL].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-columns.html\n\n','CREATE TABLE geom (g GEOMETRY);\n','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-columns.html'),(225,'NUMPOINTS',13,'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions'),(226,'ALTER LOGFILE GROUP',39,'Syntax:\nALTER LOGFILE GROUP logfile_group\n    ADD UNDOFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement adds an UNDO file named \'file_name\' to an existing log\nfile group logfile_group. An ALTER LOGFILE GROUP statement has one and\nonly one ADD UNDOFILE clause. No DROP UNDOFILE clause is currently\nsupported.\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and an undo log file with the same name, or an undo\nlog file and a data file with the same name.\n\nThe optional INITIAL_SIZE parameter sets the UNDO file\'s initial size\nin bytes; if not specified, the initial size default to 128M (128\nmegabytes). You may optionally follow size with a one-letter\nabbreviation for an order of magnitude, similar to those used in\nmy.cnf. Generally, this is one of the letters M (for megabytes) or G\n(for gigabytes).\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nThe minimum permitted value for INITIAL_SIZE is 1M. (Bug #29574)\n\n*Note*: WAIT is parsed but otherwise ignored. This keyword currently\nhas no effect, and is intended for future expansion.\n\nThe ENGINE parameter (required) determines the storage engine which is\nused by this log file group, with engine_name being the name of the\nstorage engine. Currently, the only accepted values for engine_name are\n\"NDBCLUSTER\" and \"NDB\". The two values are equivalent.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-logfile-group.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-logfile-group.html'),(227,'&',19,'Syntax:\n&\n\nBitwise AND:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 29 & 15;\n        -> 13\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(228,'LOCALTIMESTAMP',31,'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(229,'ASSIGN-EQUAL',15,'Syntax:\n=\n\nThis operator is used to perform value assignments in two cases,\ndescribed in the next two paragraphs.\n\nWithin a SET statement, = is treated as an assignment operator that\ncauses the user variable on the left hand side of the operator to take\non the value to its right. (In other words, when used in a SET\nstatement, = is treated identically to :=.) The value on the right hand\nside may be a literal value, another variable storing a value, or any\nlegal expression that yields a scalar value, including the result of a\nquery (provided that this value is a scalar value). You can perform\nmultiple assignments in the same SET statement.\n\nIn the SET clause of an UPDATE statement, = also acts as an assignment\noperator; in this case, however, it causes the column named on the left\nhand side of the operator to assume the value given to the right,\nprovided any WHERE conditions that are part of the UPDATE are met. You\ncan make multiple assignments in the same SET clause of an UPDATE\nstatement.\n\nIn any other context, = is treated as a comparison operator.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n','http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html'),(230,'CONVERT',37,'Syntax:\nCONVERT(expr,type), CONVERT(expr USING transcoding_name)\n\nThe CONVERT() and CAST() functions take an expression of any type and\nproduce a result value of a specified type.\n\nThe type for the result can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL[(M[,D])]\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttp://dev.mysql.com/doc/refman/5.5/en/binary-varbinary.html for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. Values shorter than N bytes are padded with 0x00 bytes to a\nlength of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(231,'ADDDATE',31,'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\nmysql> SELECT ADDDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT ADDDATE(\'2008-01-02\', 31);\n        -> \'2008-02-02\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(232,'REPEAT LOOP',23,'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition expression is true. Thus, a REPEAT always enters the\nloop at least once. statement_list consists of one or more statements,\neach terminated by a semicolon (;) statement delimiter.\n\nA REPEAT statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/repeat.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT\n    ->     SET @x = @x + 1;\n    ->   UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/repeat.html'),(233,'ALTER FUNCTION',39,'Syntax:\nALTER FUNCTION func_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nfunction. More than one change may be specified in an ALTER FUNCTION\nstatement. However, you cannot change the parameters or body of a\nstored function using this statement; to make such changes, you must\ndrop and re-create the function using DROP FUNCTION and CREATE\nFUNCTION.\n\nYou must have the ALTER ROUTINE privilege for the function. (That\nprivilege is granted automatically to the function creator.) If binary\nlogging is enabled, the ALTER FUNCTION statement might also require the\nSUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-function.html'),(234,'SMALLINT',22,'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(235,'DOUBLE PRECISION',22,'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(236,'ORD',37,'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(237,'DEALLOCATE PREPARE',8,'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement produced with PREPARE, use a\nDEALLOCATE PREPARE statement that refers to the prepared statement\nname. Attempting to execute a prepared statement after deallocating it\nresults in an error.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/deallocate-prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/deallocate-prepare.html'),(238,'ENVELOPE',36,'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(239,'IS_FREE_LOCK',14,'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(240,'TOUCHES',30,'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(241,'INET_ATON',14,'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of an IPv4 network address as a\nstring, returns an integer that represents the numeric value of the\naddress in network byte order (big endian). INET_ATON() returns NULL if\nit does not understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_ATON(\'10.0.5.9\');\n        -> 167773449\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(242,'UNCOMPRESS',12,'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(243,'AUTO_INCREMENT',22,'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/example-auto-increment.html\n\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n);\n\nINSERT INTO animals (name) VALUES\n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','http://dev.mysql.com/doc/refman/5.5/en/example-auto-increment.html'),(244,'ISSIMPLE',36,'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(245,'- BINARY',4,'Syntax:\n-\n\nSubtraction:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3-5;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(246,'GEOMCOLLFROMTEXT',3,'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(247,'WKT DEFINITION',3,'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form. For a Backus-Naur grammar that\nspecifies the formal production rules for writing WKT values, see the\nOpenGIS specification document referenced in\nhttp://dev.mysql.com/doc/refman/5.5/en/spatial-extensions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-format.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-format.html'),(248,'CURRENT_TIME',31,'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(249,'REVOKE',10,'Syntax:\nREVOKE\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION\n    FROM user [, user] ...\n\nREVOKE PROXY ON user\n    FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. Each account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nREVOKE INSERT ON *.* FROM \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nFor details on the levels at which privileges exist, the permissible\npriv_type and priv_level values, and the syntax for specifying users\nand passwords, see [HELP GRANT]\n\nTo use the first REVOKE syntax, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nTo revoke all privileges, use the second syntax, which drops all\nglobal, database, table, column, and routine privileges for the named\nuser or users:\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nTo use this REVOKE syntax, you must have the global CREATE USER\nprivilege or the UPDATE privilege for the mysql database.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/revoke.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/revoke.html'),(250,'LAST_INSERT_ID',17,'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nLAST_INSERT_ID() (with no argument) returns a BIGINT (64-bit) value\nrepresenting the first automatically generated value successfully\ninserted for an AUTO_INCREMENT column as a result of the most recently\nexecuted INSERT statement. The value of LAST_INSERT_ID() remains\nunchanged if no rows are successfully inserted.\n\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value is seen by statements that follow\n  the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(251,'LAST_DAY',31,'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(252,'MEDIUMINT',22,'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(253,'FLOOR',4,'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(254,'RTRIM',37,'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(255,'EXPLAIN',28,'Syntax:\nEXPLAIN [explain_type] SELECT select_options\n\nexplain_type:\n    EXTENDED\n  | PARTITIONS\n\nOr:\n\nEXPLAIN tbl_name\n\nThe EXPLAIN statement can be used either as a way to obtain information\nabout how MySQL executes a statement, or as a synonym for DESCRIBE:\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the statement,\n  including information about how tables are joined and in which order.\n  EXPLAIN EXTENDED can be used to obtain additional information.\n\n  For information about using EXPLAIN and EXPLAIN EXTENDED to obtain\n  query execution plan information, see\n  http://dev.mysql.com/doc/refman/5.5/en/using-explain.html.\n\no EXPLAIN PARTITIONS is useful only when examining queries involving\n  partitioned tables. For details, see\n  http://dev.mysql.com/doc/refman/5.5/en/partitioning-info.html.\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name. For information about DESCRIBE and SHOW COLUMNS, see\n  [HELP DESCRIBE], and [HELP SHOW COLUMNS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/explain.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/explain.html'),(256,'DEGREES',4,'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(257,'VARCHAR',22,'[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length in\ncharacters. The range of M is 0 to 65,535. The effective maximum length\nof a VARCHAR is subject to the maximum row size (65,535 bytes, which is\nshared among all columns) and the character set used. For example, utf8\ncharacters can require up to three bytes per character, so a VARCHAR\ncolumn that uses the utf8 character set can be declared to be a maximum\nof 21,844 characters. See\nhttp://dev.mysql.com/doc/refman/5.5/en/column-count-limit.html.\n\nMySQL stores VARCHAR values as a 1-byte or 2-byte length prefix plus\ndata. The length prefix indicates the number of bytes in the value. A\nVARCHAR column uses one length byte if values require no more than 255\nbytes, two length bytes if values may require more than 255 bytes.\n\n*Note*: MySQL 5.5 follows the standard SQL specification, and does not\nremove trailing spaces from VARCHAR values.\n\nVARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the\nstandard SQL way to define that a VARCHAR column should use some\npredefined character set. MySQL 4.1 and up uses utf8 as this predefined\ncharacter set.\nhttp://dev.mysql.com/doc/refman/5.5/en/charset-national.html. NVARCHAR\nis shorthand for NATIONAL VARCHAR.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(258,'UNHEX',37,'Syntax:\n\nUNHEX(str)\n\nFor a string argument str, UNHEX(str) performs the inverse operation of\nHEX(str). That is, it interprets each pair of characters in the\nargument as a hexadecimal number and converts it to the character\nrepresented by the number. The return value is a binary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(259,'- UNARY',4,'Syntax:\n-\n\nUnary minus. This operator changes the sign of the operand.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT - 2;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(260,'STD',16,'Syntax:\nSTD(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The standard SQL function STDDEV_POP() can be used\ninstead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(261,'COS',4,'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT COS(PI());\n        -> -1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(262,'DATE FUNCTION',31,'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(263,'DROP TRIGGER',39,'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER requires the TRIGGER privilege for the table\nassociated with the trigger.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a nonexistent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS].\n\nTriggers for a table are also dropped if you drop the table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-trigger.html'),(264,'RESET MASTER',8,'Syntax:\nRESET MASTER\n\nDeletes all binary log files listed in the index file, resets the\nbinary log index file to be empty, and creates a new binary log file.\nThis statement is intended to be used only when the master is started\nfor the first time.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset-master.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset-master.html'),(265,'TAN',4,'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(266,'PI',4,'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(267,'WEEKOFYEAR',31,'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKOFYEAR(\'2008-02-20\');\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(268,'/',4,'Syntax:\n/\n\nDivision:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3/5;\n        -> 0.60\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(269,'PURGE BINARY LOGS',8,'Syntax:\nPURGE { BINARY | MASTER } LOGS\n    { TO \'log_name\' | BEFORE datetime_expr }\n\nThe binary log is a set of files that contain information about data\nmodifications made by the MySQL server. The log consists of a set of\nbinary log files, plus an index file (see\nhttp://dev.mysql.com/doc/refman/5.5/en/binary-log.html).\n\nThe PURGE BINARY LOGS statement deletes all the binary log files listed\nin the log index file prior to the specified log file name or date.\nBINARY and MASTER are synonyms. Deleted log files also are removed from\nthe list recorded in the index file, so that the given log file becomes\nthe first in the list.\n\nThis statement has no effect if the server was not started with the\n--log-bin option to enable binary logging.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/purge-binary-logs.html\n\n','PURGE BINARY LOGS TO \'mysql-bin.010\';\nPURGE BINARY LOGS BEFORE \'2008-04-02 22:46:26\';\n','http://dev.mysql.com/doc/refman/5.5/en/purge-binary-logs.html'),(270,'STDDEV_SAMP',16,'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(271,'SCHEMA',17,'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(272,'MLINEFROMWKB',32,'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(273,'LOG2',4,'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(274,'SUBTIME',31,'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SUBTIME(\'2007-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'2007-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(275,'UNCOMPRESSED_LENGTH',12,'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(276,'DROP TABLE',39,'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich nonexisting tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\n*Important*: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nNote that for a partitioned table, DROP TABLE permanently removes the\ntable definition, all of its partitions, and all of the data which was\nstored in those partitions. It also removes the partitioning definition\n(.par) file associated with the dropped table.\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each nonexistent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are permitted to make porting easier. In MySQL\n5.5, they do nothing.\n\n*Note*: DROP TABLE automatically commits the current active\ntransaction, unless you use the TEMPORARY keyword.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-table.html'),(277,'POW',4,'Syntax:\nPOW(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(278,'SHOW CREATE TABLE',26,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-table.html'),(279,'DUAL',27,'You are permitted to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/select.html'),(280,'INSTR',37,'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(281,'NOW',31,'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context. The value is expressed in the\ncurrent time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT NOW();\n        -> \'2007-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 20071215235026.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(282,'SHOW ENGINES',26,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-engines.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-engines.html'),(283,'>=',18,'Syntax:\n>=\n\nGreater than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 >= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(284,'EXP',4,'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X. The inverse of this function is LOG() (using a single\nargument only) or LN().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(285,'LONGBLOB',22,'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The effective maximum length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and\navailable memory. Each LONGBLOB value is stored using a 4-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(286,'POINTN',13,'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions'),(287,'YEAR DATA TYPE',22,'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. YEAR(2) or YEAR(4) differ in display format, but have the same\nrange of values. In four-digit format, values display as 1901 to 2155,\nand 0000. In two-digit format, values display as 70 to 69, representing\nyears from 1970 to 2069. MySQL displays YEAR values in YYYY or\nYYformat, but permits assignment of values to YEAR columns using either\nstrings or numbers.\n\n*Note*: The YEAR(2) data type has certain issues that you should\nconsider before choosing to use it. As of MySQL 5.5.27, YEAR(2) is\ndeprecated. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/migrating-to-year4.html.\n\nFor additional information about YEAR display format and inerpretation\nof input values, see http://dev.mysql.com/doc/refman/5.5/en/year.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(288,'SUM',16,'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used to sum only the distinct values\nof expr.\n\nSUM() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(289,'OCT',37,'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(290,'SYSDATE',31,'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context.\n\nSYSDATE() returns the time at which it executes. This differs from the\nbehavior for NOW(), which returns a constant time that indicates the\ntime at which the statement began to execute. (Within a stored function\nor trigger, NOW() returns the time at which the function or triggering\nstatement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is nondeterministic\nand therefore unsafe for replication if statement-based binary logging\nis used. If that is a problem, you can use row-based logging.\n\nAlternatively, you can use the --sysdate-is-now option to cause\nSYSDATE() to be an alias for NOW(). This works if the option is used on\nboth the master and the slave.\n\nThe nondeterministic nature of SYSDATE() also means that indexes cannot\nbe used for evaluating expressions that refer to it.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(291,'UNINSTALL PLUGIN',5,'Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed server plugin. It requires the\nDELETE privilege for the mysql.plugin table.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\ntable, so that subsequent server restarts will not load and initialize\nthe plugin. UNINSTALL PLUGIN does not remove the plugin\'s shared\nlibrary file.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/uninstall-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/uninstall-plugin.html'),(292,'ASBINARY',32,'AsBinary(g), AsWKB(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-to-convert-geometries-between-formats.html\n\n','SELECT AsBinary(g) FROM geom;\n','http://dev.mysql.com/doc/refman/5.5/en/functions-to-convert-geometries-between-formats.html'),(293,'REPEAT FUNCTION',37,'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(294,'SHOW TABLES',26,'Syntax:\nSHOW [FULL] TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nThis statement also lists any views in the database. The FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-tables.html'),(295,'MAKEDATE',31,'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);\n        -> \'2011-01-31\', \'2011-02-01\'\nmysql> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);\n        -> \'2011-12-31\', \'2014-12-31\'\nmysql> SELECT MAKEDATE(2011,0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(296,'BINARY OPERATOR',37,'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column is not defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(297,'MBROVERLAPS',6,'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap. The term spatially overlaps is\nused if two geometries intersect and their intersection results in a\ngeometry of the same dimension but not equal to either of the given\ngeometries.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(298,'SOUNDEX',37,'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All nonalphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See Bug\n  #22638 for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(299,'MBRTOUCHES',6,'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch. Two geometries spatially touch if\nthe interiors of the geometries do not intersect, but the boundary of\none of the geometries intersects either the boundary or the interior of\nthe other.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(300,'DROP EVENT',39,'Syntax:\nDROP EVENT [IF EXISTS] event_name\n\nThis statement drops the event named event_name. The event immediately\nceases being active, and is deleted completely from the server.\n\nIf the event does not exist, the error ERROR 1517 (HY000): Unknown\nevent \'event_name\' results. You can override this and cause the\nstatement to generate a warning for nonexistent events instead using IF\nEXISTS.\n\nThis statement requires the EVENT privilege for the schema to which the\nevent to be dropped belongs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-event.html'),(301,'INSERT SELECT',27,'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert-select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert-select.html'),(302,'CREATE PROCEDURE',39,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n\nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n\nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nroutine_body:\n    Valid SQL routine statement\n\nThese statements create stored routines. By default, a routine is\nassociated with the default database. To associate the routine\nexplicitly with a given database, specify the name as db_name.sp_name\nwhen you create it.\n\nThe CREATE FUNCTION statement is also used in MySQL to support UDFs\n(user-defined functions). See\nhttp://dev.mysql.com/doc/refman/5.5/en/adding-functions.html. A UDF can\nbe regarded as an external stored function. Stored functions share\ntheir namespace with UDFs. See\nhttp://dev.mysql.com/doc/refman/5.5/en/function-resolution.html, for\nthe rules describing how the server interprets references to different\nkinds of functions.\n\nTo invoke a stored procedure, use the CALL statement (see [HELP CALL]).\nTo invoke a stored function, refer to it in an expression. The function\nreturns a value during expression evaluation.\n\nCREATE PROCEDURE and CREATE FUNCTION require the CREATE ROUTINE\nprivilege. They might also require the SUPER privilege, depending on\nthe DEFINER value, as described later in this section. If binary\nlogging is enabled, CREATE FUNCTION might require the SUPER privilege,\nas described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nBy default, MySQL automatically grants the ALTER ROUTINE and EXECUTE\nprivileges to the routine creator. This behavior can be changed by\ndisabling the automatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at routine execution time, as\ndescribed later in this section.\n\nIf the routine name is the same as the name of a built-in SQL function,\na syntax error occurs unless you use a space between the name and the\nfollowing parenthesis when defining the routine or invoking it later.\nFor this reason, avoid using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always permissible to have spaces after a stored\nroutine name, regardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Parameter names are not case sensitive.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. For a FUNCTION, parameters are always regarded as IN\nparameters.\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable in the\nCALL statement that invokes the procedure so that you can obtain its\nvalue when the procedure returns. If you are calling the procedure from\nwithin another stored procedure or function, you can also pass a\nroutine parameter or local routine variable as an IN or INOUT\nparameter.\n\nThe following example shows a simple stored procedure that uses an OUT\nparameter:\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n\nThe example uses the mysql client delimiter command to change the\nstatement delimiter from ; to // while the procedure is being defined.\nThis enables the ; delimiter used in the procedure body to be passed\nthrough to the server rather than being interpreted by mysql itself.\nSee\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-defining.html.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe following example function takes a parameter, performs an operation\nusing an SQL function, and returns the result. In this case, it is\nunnecessary to use delimiter because the function definition contains\nno internal ; statement delimiters:\n\nmysql> CREATE FUNCTION hello (s CHAR(20))\nmysql> RETURNS CHAR(50) DETERMINISTIC\n    -> RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT hello(\'world\');\n+----------------+\n| hello(\'world\') |\n+----------------+\n| Hello, world!  |\n+----------------+\n1 row in set (0.00 sec)\n\nParameter types and function return types can be declared to use any\nvalid data type, except that the COLLATE attribute cannot be used prior\nto MySQL 5.5.3. As of 5.5.3, COLLATE can be used if preceded by the\nCHARACTER SET attribute.\n\nThe routine_body consists of a valid SQL routine statement. This can be\na simple statement such as SELECT or INSERT, or a compound statement\nwritten using BEGIN and END. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described in\nhttp://dev.mysql.com/doc/refman/5.5/en/sql-syntax-compound-statements.h\ntml.\n\nMySQL permits routines to contain DDL statements, such as CREATE and\nDROP. MySQL also permits stored procedures (but not stored functions)\nto contain SQL transaction statements such as COMMIT. Stored functions\nmay not contain statements that perform explicit or implicit commit or\nrollback. Support for these statements is not required by the SQL\nstandard, which states that each DBMS vendor may decide whether to\npermit them.\n\nStatements that return a result set can be used within a stored\nprocedure but not within a stored function. This prohibition includes\nSELECT statements that do not have an INTO var_list clause and other\nstatements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that\ncan be determined at function definition time to return a result set, a\nNot allowed to return a result set from a function error occurs\n(ER_SP_NO_RETSET). For statements that can be determined only at\nruntime to return a result set, a PROCEDURE %s can\'t return a result\nset in the given context error occurs (ER_SP_BADSELECT).\n\nUSE statements within stored routines are not permitted. When a routine\nis invoked, an implicit USE db_name is performed (and undone when the\nroutine terminates). The causes the routine to have the given default\ndatabase while it executes. References to objects in databases other\nthan the routine default database should be qualified with the\nappropriate database name.\n\nFor additional information about statements that are not permitted in\nstored routines, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-program-restrictions.html\n.\n\nFor information about invoking stored procedures from within programs\nwritten in a language that has a MySQL interface, see [HELP CALL].\n\nMySQL stores the sql_mode system variable setting that is in effect at\nthe time a routine is created, and always executes the routine with\nthis setting in force, regardless of the server SQL mode in effect when\nthe routine is invoked.\n\nThe switch from the SQL mode of the invoker to that of the routine\noccurs after evaluation of arguments and assignment of the resulting\nvalues to routine parameters. If you define a routine in strict SQL\nmode but invoke it in nonstrict mode, assignment of arguments to\nroutine parameters does not take place in strict mode. If you require\nthat expressions passed to a routine be assigned in strict SQL mode,\nyou should invoke the routine with strict mode in effect.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-procedure.html'),(303,'VARBINARY',22,'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than nonbinary character strings. M represents the\nmaximum column length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(304,'LOAD INDEX',26,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list | ALL)]\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list:\n    partition_name[, partition_name][, ...]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE is used only for MyISAM tables. In MySQL 5.5, it\nis also supported for partitioned MyISAM tables; in addition, indexes\non partitioned tables can be preloaded for one, several, or all\npartitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-index.html'),(305,'UNION',27,'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/union.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/union.html'),(306,'TO_DAYS',31,'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'2007-10-07\');\n        -> 733321\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(307,'NOT REGEXP',37,'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/regexp.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/regexp.html'),(308,'SHOW INDEX',26,'Syntax:\nSHOW {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nYou can also list a table\'s indexes with the mysqlshow -k db_name\ntbl_name command.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-index.html'),(309,'SHOW CREATE DATABASE',26,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the given database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-database.html'),(310,'LEAVE',23,'Syntax:\nLEAVE label\n\nThis statement is used to exit the flow control construct that has the\ngiven label. If the label is for the outermost stored program block,\nLEAVE exits the program.\n\nLEAVE can be used within BEGIN ... END or loop constructs (LOOP,\nREPEAT, WHILE).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/leave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/leave.html'),(311,'NOT IN',18,'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(312,'!',15,'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnonzero, and NOT NULL returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(313,'DECLARE HANDLER',23,'Syntax:\nDECLARE handler_action HANDLER\n    FOR condition_value [, condition_value] ...\n    statement\n\nhandler_action:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n\nThe DECLARE ... HANDLER statement specifies a handler that deals with\none or more conditions. If one of these conditions occurs, the\nspecified statement executes. statement can be a simple statement such\nas SET var_name = value, or a compound statement written using BEGIN\nand END (see [HELP BEGIN END]).\n\nHandler declarations must appear after variable or condition\ndeclarations.\n\nThe handler_action value indicates what action the handler takes after\nexecution of the handler statement:\n\no CONTINUE: Execution of the current program continues.\n\no EXIT: Execution terminates for the BEGIN ... END compound statement\n  in which the handler is declared. This is true even if the condition\n  occurs in an inner block.\n\no UNDO: Not supported.\n\nThe condition_value for DECLARE ... HANDLER indicates the specific\ncondition or class of conditions that activates the handler:\n\no A MySQL error code (a number) or an SQLSTATE value (a 5-character\n  string literal). You should not use MySQL error code 0 or SQLSTATE\n  values that begin with \'00\', because those indicate success rather\n  than an error condition. For a list of MySQL error codes and SQLSTATE\n  values, see\n  http://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\no A condition name previously specified with DECLARE ... CONDITION. A\n  condition name can be associated with a MySQL error code or SQLSTATE\n  value. See [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for the class of SQLSTATE values that begin\n  with \'01\'.\n\no NOT FOUND is shorthand for the class of SQLSTATE values that begin\n  with \'02\'. This is relevant within the context of cursors and is used\n  to control what happens when a cursor reaches the end of a data set.\n  If no more rows are available, a No Data condition occurs with\n  SQLSTATE value \'02000\'. To detect this condition, you can set up a\n  handler for it (or for a NOT FOUND condition). For an example, see\n  http://dev.mysql.com/doc/refman/5.5/en/cursors.html. This condition\n  also occurs for SELECT ... INTO var_list statements that retrieve no\n  rows.\n\no SQLEXCEPTION is shorthand for the class of SQLSTATE values that do\n  not begin with \'00\', \'01\', or \'02\'.\n\nIf a condition occurs for which no handler has been declared, the\naction taken depends on the condition class:\n\no For SQLEXCEPTION conditions, the stored program terminates at the\n  statement that raised the condition, as if there were an EXIT\n  handler. If the program was called by another stored program, the\n  calling program handles the condition using the handler selection\n  rules applied to its own handlers.\n\no For SQLWARNING conditions, the program continues executing, as if\n  there were a CONTINUE handler.\n\no For NOT FOUND conditions, if the condition was raised normally, the\n  action is CONTINUE. If it was raised by SIGNAL or RESIGNAL, the\n  action is EXIT.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-handler.html\n\n','mysql> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/declare-handler.html'),(314,'DOUBLE',22,'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Permissible\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(315,'TIME',22,'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but permits assignment of values to TIME\ncolumns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(316,'&&',15,'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are nonzero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(317,'X',11,'X(p)\n\nReturns the X-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#point-property-functions\n\n','mysql> SELECT X(POINT(56.7, 53.34));\n+-----------------------+\n| X(POINT(56.7, 53.34)) |\n+-----------------------+\n|                  56.7 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#point-property-functions'),(318,'SYSTEM_USER',17,'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(319,'FOUND_ROWS',17,'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(320,'CROSSES',30,'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(321,'TRUNCATE TABLE',39,'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. It requires the DROP\nprivilege.\n\nLogically, TRUNCATE TABLE is similar to a DELETE statement that deletes\nall rows, or a sequence of DROP TABLE and CREATE TABLE statements. To\nachieve high performance, it bypasses the DML method of deleting data.\nThus, it cannot be rolled back, it does not cause ON DELETE triggers to\nfire, and it cannot be performed for InnoDB tables with parent-child\nforeign key relationships.\n\nAlthough TRUNCATE TABLE is similar to DELETE, it is classified as a DDL\nstatement rather than a DML statement. It differs from DELETE in the\nfollowing ways in MySQL 5.5:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one, particularly for large tables.\n\no Truncate operations cause an implicit commit, and so cannot be rolled\n  back.\n\no Truncation operations cannot be performed if the session holds an\n  active table lock.\n\no TRUNCATE TABLE fails for an InnoDB table if there are any FOREIGN KEY\n  constraints from other tables that reference the table. Foreign key\n  constraints between columns of the same table are permitted.\n\no Truncation operations do not return a meaningful value for the number\n  of deleted rows. The usual result is \"0 rows affected,\" which should\n  be interpreted as \"no information.\"\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no Any AUTO_INCREMENT value is reset to its start value. This is true\n  even for MyISAM and InnoDB, which normally do not reuse sequence\n  values.\n\no When used with partitioned tables, TRUNCATE TABLE preserves the\n  partitioning; that is, the data and index files are dropped and\n  re-created, while the partition definitions (.par) file is\n  unaffected.\n\no The TRUNCATE TABLE statement does not invoke ON DELETE triggers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/truncate-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/truncate-table.html'),(322,'BIT_XOR',16,'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(323,'CURRENT_DATE',31,'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(324,'START SLAVE',8,'Syntax:\nSTART SLAVE [thread_types]\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads events from the master server and stores\nthem in the relay log. The SQL thread reads events from the relay log\nand executes them. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary log, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/start-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/start-slave.html'),(325,'AREA',2,'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions'),(326,'FLUSH',26,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL]\n    flush_option [, flush_option] ...\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. To execute\nFLUSH, you must have the RELOAD privilege. Specific flush options might\nrequire additional privileges, as described later.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replication slaves. To suppress logging, use the\noptional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*: FLUSH LOGS, FLUSH MASTER, FLUSH SLAVE, and FLUSH TABLES WITH\nREAD LOCK (with or without a table list) are not written to the binary\nlog in any case because they would cause problems if replicated to a\nslave.\n\nThe FLUSH statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using the RESET statement with replication.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/flush.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/flush.html'),(327,'BEGIN END',23,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored programs (stored procedures and functions,\ntriggers, and events). A compound statement can contain multiple\nstatements, enclosed by the BEGIN and END keywords. statement_list\nrepresents a list of one or more statements, each terminated by a\nsemicolon (;) statement delimiter. The statement_list itself is\noptional, so the empty compound statement (BEGIN END) is legal.\n\nBEGIN ... END blocks can be nested.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. In the mysql\ncommand-line client, this is handled with the delimiter command.\nChanging the ; end-of-statement delimiter (for example, to //) permit ;\nto be used in a program body. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-defining.html.\n\nA BEGIN ... END block can be labeled. See [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/begin-end.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/begin-end.html'),(328,'SHOW PROCEDURE STATUS',26,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2004-08-03 15:29:37\n             Created: 2004-08-03 15:29:37\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-procedure-status.html'),(329,'DESCRIBE',28,'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. These statements also display\ninformation for views. (See [HELP SHOW COLUMNS].)\n\ncol_name can be a column name, or a string containing the SQL \"%\" and\n\"_\" wildcard characters to obtain output only for the columns with\nnames matching the string. There is no need to enclose the string\nwithin quotation marks unless it contains spaces or other special\ncharacters.\n\nmysql> DESCRIBE City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nThe description for SHOW COLUMNS provides more information about the\noutput columns (see [HELP SHOW COLUMNS]).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/describe.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/describe.html'),(330,'SHOW WARNINGS',26,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows information about the conditions (errors, warnings,\nand notes) that resulted from the last statement in the current session\nthat generated messages. It shows nothing if the last statement used a\ntable and generated no messages. (That is, a statement that uses a\ntable but generates no messages clears the message list.) Statements\nthat do not use tables and do not generate messages have no effect on\nthe message list.\n\nWarnings are generated for DML statements such as INSERT, UPDATE, and\nLOAD DATA INFILE as well as DDL statements such as CREATE TABLE and\nALTER TABLE.\n\nSHOW WARNINGS is also used following EXPLAIN EXTENDED, to display the\nextra information generated by EXPLAIN when the EXTENDED keyword is\nused. See http://dev.mysql.com/doc/refman/5.5/en/explain-extended.html.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nA related statement, SHOW ERRORS, shows only the error conditions (it\nexcludes warnings and notes). See [HELP SHOW ERRORS].\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-warnings.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-warnings.html'),(331,'DROP USER',10,'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts and their\nprivileges. It removes privilege rows for the account from all grant\ntables. To use this statement, you must have the global CREATE USER\nprivilege or the DELETE privilege for the mysql database. Each account\nname uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nDROP USER \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-user.html'),(332,'STDDEV_POP',16,'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). You can also use STD() or STDDEV(), which are equivalent\nbut not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(333,'SHOW CHARACTER SET',26,'Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-character-set.html'),(334,'SUBSTRING',37,'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'\nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'\nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(335,'ISEMPTY',36,'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(336,'SHOW FUNCTION STATUS',26,'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-function-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-function-status.html'),(337,'LTRIM',37,'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(338,'INTERSECTS',30,'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(339,'CALL',27,'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a stored procedure that was defined\npreviously with CREATE PROCEDURE.\n\nStored procedures that take no arguments can be invoked without\nparentheses. That is, CALL p() and CALL p are equivalent.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. When the procedure returns, a\nclient program can also obtain the number of rows affected for the\nfinal statement executed within the routine: At the SQL level, call the\nROW_COUNT() function; from the C API, call the mysql_affected_rows()\nfunction.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/call.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/call.html'),(340,'MBRDISJOINT',6,'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(341,'VALUES',14,'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in the ON DUPLICATE KEY UPDATE clause of\nINSERT statements and returns NULL otherwise. See\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-on-duplicate.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(342,'SUBSTRING_INDEX',37,'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(343,'ENCODE',12,'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n\nThe strength of the encryption is based on how good the random\ngenerator is. It should suffice for short strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(344,'LOOP',23,'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements, each\nterminated by a semicolon (;) statement delimiter. The statements\nwithin the loop are repeated until the loop is terminated. Usually,\nthis is accomplished with a LEAVE statement. Within a stored function,\nRETURN can also be used, which exits the function entirely.\n\nNeglecting to include a loop-termination statement results in an\ninfinite loop.\n\nA LOOP statement can be labeled. For the rules regarding label use, see\n[HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/loop.html\n\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN\n      ITERATE label1;\n    END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/loop.html'),(345,'TRUNCATE',4,'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(346,'TIMESTAMPADD',31,'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: MICROSECOND\n(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or\nYEAR.\n\nIt is possible to use FRAC_SECOND in place of MICROSECOND, but\nFRAC_SECOND is deprecated. FRAC_SECOND was removed in MySQL 5.5.3.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(347,'SHOW',26,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW AUTHORS\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW CHARACTER SET [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CONTRIBUTORS\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW EVENTS\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW MASTER STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PLUGINS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL \"%\" and \"_\"\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show.html'),(348,'GREATEST',18,'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(349,'SHOW VARIABLES',26,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand. The LIKE clause, if present, indicates which variable names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html. This\nstatement does not require any privilege. It requires only the ability\nto connect to the server.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. As of MySQL 5.5.3, if a variable has\nno global value, no value is displayed. Before 5.5.3, the session value\nis displayed. With SESSION, SHOW VARIABLES displays the values that are\nin effect for the current connection. If no modifier is present, the\ndefault is SESSION. LOCAL is a synonym for SESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the \"%\"\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because \"_\" is a wildcard that matches\nany single character, you should escape it as \"\\_\" to match it\nliterally. In practice, this is rarely necessary.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-variables.html'),(350,'BINLOG',26,'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See http://dev.mysql.com/doc/refman/5.5/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event. This\nstatement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/binlog.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/binlog.html'),(351,'BIT_AND',16,'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(352,'SECOND',31,'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(353,'ATAN2',4,'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(354,'MBRCONTAINS',6,'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(355,'HOUR',31,'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(356,'SELECT',27,'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr [, select_expr ...]\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\'\n        [CHARACTER SET charset_name]\n        export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.5/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE expression, you can use any of the functions and\n  operators that MySQL supports, except for aggregate (summary)\n  functions. See\n  http://dev.mysql.com/doc/refman/5.5/en/expressions.html, and\n  http://dev.mysql.com/doc/refman/5.5/en/functions.html.\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/select.html'),(357,'COT',4,'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(358,'SHOW CREATE EVENT',26,'Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. It requires the EVENT privilege for the database from\nwhich the event is to be shown. For example (using the same event\ne_daily defined and then altered in [HELP SHOW EVENTS]):\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-event.html\n\n','mysql> SHOW CREATE EVENT test.e_daily\\G\n*************************** 1. row ***************************\n               Event: e_daily\n            sql_mode:\n           time_zone: SYSTEM\n        Create Event: CREATE EVENT `e_daily`\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ON COMPLETION NOT PRESERVE\n                        ENABLE\n                        COMMENT \'Saves total number of sessions then\n                                clears the table each day\'\n                        DO BEGIN\n                          INSERT INTO site_activity.totals (time, total)\n                            SELECT CURRENT_TIMESTAMP, COUNT(*)\n                            FROM site_activity.sessions;\n                          DELETE FROM site_activity.sessions;\n                        END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-event.html'),(359,'LOAD_FILE',37,'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full path name to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes. If the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nThe character_set_filesystem system variable controls interpretation of\nfile names that are given as literal strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(360,'POINTFROMTEXT',3,'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(361,'GROUP_CONCAT',16,'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(362,'DATE_FORMAT',31,'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2009-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Sunday October 2009\'\nmysql> SELECT DATE_FORMAT(\'2007-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1900-10-04 22:23:00\',\n    ->                 \'%D %y %a %d %m %b %j\');\n        -> \'4th 00 Thu 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n    ->                 \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(363,'BENCHMARK',17,'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(364,'YEAR',31,'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT YEAR(\'1987-01-01\');\n        -> 1987\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(365,'SHOW ENGINE',26,'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine.\nThe following statements currently are supported:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE {NDB | NDBCLUSTER} STATUS\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex statistics. The\nstatement displays the following fields:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The source file where the mutex is implemented, and the line number\n  in the file where the mutex is created. The line number may change\n  depending on your version of MySQL.\n\no Status\n\n  The mutex status. This field displays several values if UNIV_DEBUG\n  was defined at MySQL compilation time (for example, in include/univ.i\n  in the InnoDB part of the MySQL source tree). If UNIV_DEBUG was not\n  defined, the statement displays only the os_waits value. In the\n  latter case (without UNIV_DEBUG), the information on which the output\n  is based is insufficient to distinguish regular mutexes and mutexes\n  that protect rw-locks (which permit multiple readers or a single\n  writer). Consequently, the output may appear to contain multiple rows\n  for the same mutex.\n\n  o count indicates how many times the mutex was requested.\n\n  o spin_waits indicates how many times the spinlock had to run.\n\n  o spin_rounds indicates the number of spinlock rounds. (spin_rounds\n    divided by spin_waits provides the average round count.)\n\n  o os_waits indicates the number of operating system waits. This\n    occurs when the spinlock did not work (the mutex was not locked\n    during the spinlock and it was necessary to yield to the operating\n    system and wait).\n\n  o os_yields indicates the number of times a the thread trying to lock\n    a mutex gave up its timeslice and yielded to the operating system\n    (on the presumption that permitting other threads to run will free\n    the mutex so that it can be locked).\n\n  o os_wait_times indicates the amount of time (in ms) spent in\n    operating system waits, if the timed_mutexes system variable is 1\n    (ON). If timed_mutexes is 0 (OFF), timing is disabled, so\n    os_wait_times is 0. timed_mutexes is off by default.\n\nInformation from this statement can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nmysql> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThe intent of this statement is to help the DBA to understand the\neffects that different options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and an\nattribute of the buffer, respectively:\n\no Internal buffers that are exposed as a table in the\n  performance_schema database are named after the table. Examples:\n  events_waits_history.row_size, mutex_instances.row_count.\n\no Internal buffers that are not exposed as a table are named within\n  parentheses. Examples: (pfs_cond_class).row_size,\n  (pfs_mutex_class).memory.\n\no Values that apply to the Performance Schema as a whole begin with\n  performance_schema. Example: performance_schema.memory.\n\nAttributes have these meanings:\n\no row_size cannot be changed. It is the size of the internal record\n  used by the implementation.\n\no row_count can be changed depending on the configuration options.\n\no For a table, tbl_name.memory is the product of row_size multiplied by\n  row_count. For the Performance Schema as a whole,\n  performance_schema.memory is the sum of all the memory used (the sum\n  of all other memory values).\n\nIn some cases, there is a direct relationship between a configuration\nparameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.row_count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example,\nevents_waits_history.row_count corresponds to\nperformance_schema_events_waits_history_size (the number of rows per\nthread) multiplied by performance_schema_max_thread_instances ( the\nnumber of threads).\n\nIf the server has the NDBCLUSTER storage engine enabled, SHOW ENGINE\nNDB STATUS displays cluster status information such as the number of\nconnected data nodes, the cluster connectstring, and cluster binlog\nepochs, as well as counts of various Cluster API objects created by the\nMySQL Server when connected to the cluster. Sample output from this\nstatement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7,\n  connected_host=192.168.0.103, connected_port=1186, number_of_data_nodes=4,\n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126,\n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0,\n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe rows with connection and binlog in the Name column were added to\nthe output of this statement in MySQL 5.1. The Status column in each of\nthese rows provides information about the MySQL server\'s connection to\nthe cluster and about the cluster binary log\'s status, respectively.\nThe Status information is in the form of comma-delimited set of\nname/value pairs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-engine.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-engine.html'),(366,'NAME_CONST',14,'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name. The arguments\nshould be constants.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(367,'RELEASE_LOCK',14,'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(368,'IS NULL',18,'Syntax:\nIS NULL\n\nTests whether a value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(369,'CONVERT_TZ',31,'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(370,'TIME_TO_SEC',31,'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(371,'WEEKDAY',31,'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKDAY(\'2008-02-03 22:23:00\');\n        -> 6\nmysql> SELECT WEEKDAY(\'2007-11-06\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(372,'EXPORT_SET',37,'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter \",\"). The number of bits examined is given by number_of_bits,\nwhich has a default of 64 if not specified. number_of_bits is silently\nclipped to 64 if larger than 64. It is treated as an unsigned integer,\nso a value of -1 is effectively the same as 64.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(373,'ALTER SERVER',39,'Syntax:\nALTER SERVER  server_name\n    OPTIONS (option [, option] ...)\n\nAlters the server information for server_name, adjusting any of the\noptions permitted in the CREATE SERVER statement. See [HELP CREATE\nSERVER]. The corresponding fields in the mysql.servers table are\nupdated accordingly. This statement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-server.html\n\n','ALTER SERVER s OPTIONS (USER \'sally\');\n','http://dev.mysql.com/doc/refman/5.5/en/alter-server.html'),(374,'RESIGNAL',23,'Syntax:\nRESIGNAL [condition_value]\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nRESIGNAL passes on the error condition information that is available\nduring execution of a condition handler within a compound statement\ninside a stored procedure or function, trigger, or event. RESIGNAL may\nchange some or all information before passing it on. RESIGNAL is\nrelated to SIGNAL, but instead of originating a condition as SIGNAL\ndoes, RESIGNAL relays existing condition information, possibly after\nmodifying it.\n\nRESIGNAL makes it possible to both handle an error and return the error\ninformation. Otherwise, by executing an SQL statement within the\nhandler, information that caused the handler\'s activation is destroyed.\nRESIGNAL also can make some procedures shorter if a given handler can\nhandle part of a situation, then pass the condition \"up the line\" to\nanother handler.\n\nNo special privileges are required to execute the RESIGNAL statement.\n\nFor condition_value and signal_information_item, the definitions and\nrules are the same for RESIGNAL as for SIGNAL (see [HELP SIGNAL]).\n\nThe RESIGNAL statement takes condition_value and SET clauses, both of\nwhich are optional. This leads to several possible uses:\n\no RESIGNAL alone:\n\nRESIGNAL;\n\no RESIGNAL with new signal information:\n\nRESIGNAL SET signal_information_item [, signal_information_item] ...;\n\no RESIGNAL with a condition value and possibly new signal information:\n\nRESIGNAL condition_value\n    [SET signal_information_item [, signal_information_item] ...];\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/resignal.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/resignal.html'),(375,'TIME FUNCTION',31,'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(376,'DATE_ADD',31,'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. The date argument specifies\nthe starting date or datetime value. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a \"-\" for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT \'2008-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'2009-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'2008-12-31\';\n        -> \'2009-01-01\'\nmysql> SELECT \'2005-01-01\' - INTERVAL 1 SECOND;\n        -> \'2004-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'2000-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'2001-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'2010-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'2011-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'2100-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'2101-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'2005-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'2004-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1900-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1899-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(377,'CAST',37,'Syntax:\nCAST(expr AS type)\n\nThe CAST() function takes an expression of any type and produces a\nresult value of a specified type, similar to CONVERT(). See the\ndescription of CONVERT() for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(378,'SOUNDS LIKE',37,'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(379,'PERIOD_DIFF',31,'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_DIFF(200802,200703);\n        -> 11\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(380,'LIKE',37,'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(381,'MULTIPOINT',24,'MultiPoint(pt1,pt2,...)\n\nConstructs a MultiPoint value using Point or WKB Point arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(382,'>>',19,'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 4 >> 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(383,'FETCH',23,'Syntax:\nFETCH [[NEXT] FROM] cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row for the SELECT statement associated\nwith the specified cursor (which must be open), and advances the cursor\npointer. If a row exists, the fetched columns are stored in the named\nvariables. The number of columns retrieved by the SELECT statement must\nmatch the number of output variables specified in the FETCH statement.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue \'02000\'. To detect this condition, you can set up a handler for\nit (or for a NOT FOUND condition). For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/fetch.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/fetch.html'),(384,'AVG',16,'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used to\nreturn the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(385,'TRUE FALSE',29,'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/boolean-literals.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/boolean-literals.html'),(386,'MBRWITHIN',6,'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr'),(387,'SESSION_USER',17,'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(388,'IN',18,'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.5/en/type-conversion.html, but\napplied to all the arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(389,'QUOTE',37,'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotation marks and with each instance of backslash (\"\\\"),\nsingle quote (\"\'\"), ASCII NUL, and Control+Z preceded by a backslash.\nIf the argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotation marks.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(390,'HELP COMMAND',26,'Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Plugins\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-binary-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mysql-server-side-help.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mysql-server-side-help.html'),(391,'QUARTER',31,'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT QUARTER(\'2008-04-01\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(392,'POSITION',37,'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(393,'SHOW CREATE FUNCTION',26,'Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-function.html'),(394,'IS_USED_LOCK',14,'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(395,'POLYFROMTEXT',3,'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(396,'DES_ENCRYPT',12,'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.5/en/ssl-connections.html.\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given. With no argument, the first key from\nthe DES key file is used. With a key_num argument, the given key number\n(0 to 9) from the DES key file is used. With a key_str argument, the\ngiven key string is used to encrypt str.\n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character is\nCHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.\n\nThe 128 is added to make it easier to recognize an encrypted key. If\nyou use a string key, key_num is 127.\n\nThe string length for the result is given by this formula:\n\nnew_len = orig_len + (8 - (orig_len % 8)) + 1\n\nEach line in the DES key file has the following format:\n\nkey_num des_key_str\n\nEach key_num value must be a number in the range from 0 to 9. Lines in\nthe file may be in any order. des_key_str is the string that is used to\nencrypt the message. There should be at least one space between the\nnumber and the key. The first key is the default key that is used if\nyou do not specify any key argument to DES_ENCRYPT().\n\nYou can tell MySQL to read new key values from the key file with the\nFLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.\n\nOne benefit of having a set of default keys is that it gives\napplications a way to check for the existence of encrypted column\nvalues, without giving the end user the right to decrypt those values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT customer_address FROM customer_table \n     > WHERE crypted_credit_card = DES_ENCRYPT(\'credit_card_number\');\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(397,'CEIL',4,'Syntax:\nCEIL(X)\n\nCEIL() is a synonym for CEILING().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(398,'LENGTH',37,'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five 2-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(399,'STR_TO_DATE',31,'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts. If the date,\ntime, or datetime value extracted from str is illegal, STR_TO_DATE()\nreturns NULL and produces a warning.\n\nThe server scans str attempting to match format to it. The format\nstring can contain literal characters and format specifiers beginning\nwith %. Literal characters in format must match literally in str.\nFormat specifiers in format must match a date or time part in str. For\nthe specifiers that can be used in format, see the DATE_FORMAT()\nfunction description.\n\nmysql> SELECT STR_TO_DATE(\'01,5,2013\',\'%d,%m,%Y\');\n        -> \'2013-05-01\'\nmysql> SELECT STR_TO_DATE(\'May 1, 2013\',\'%M %d,%Y\');\n        -> \'2013-05-01\'\n\nScanning starts at the beginning of str and fails if format is found\nnot to match. Extra characters at the end of str are ignored.\n\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'a%h:%i:%s\');\n        -> \'09:30:17\'\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'%h:%i:%s\');\n        -> NULL\nmysql> SELECT STR_TO_DATE(\'09:30:17a\',\'%h:%i:%s\');\n        -> \'09:30:17\'\n\nUnspecified date or time parts have a value of 0, so incompletely\nspecified values in str produce a result with some or all parts set to\n0:\n\nmysql> SELECT STR_TO_DATE(\'abc\',\'abc\');\n        -> \'0000-00-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%m\');\n        -> \'0000-09-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%s\');\n        -> \'00:00:09\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(400,'Y',11,'Y(p)\n\nReturns the Y-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#point-property-functions\n\n','mysql> SELECT Y(POINT(56.7, 53.34));\n+-----------------------+\n| Y(POINT(56.7, 53.34)) |\n+-----------------------+\n|                 53.34 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#point-property-functions'),(401,'CHECKSUM TABLE',20,'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum. This statement requires the\nSELECT privilege for the table.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See [HELP CREATE\nTABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a nonexistent table, CHECKSUM TABLE returns NULL and generates a\nwarning.\n\nIn MySQL 5.5, CHECKSUM TABLE returns 0 for partitioned tables unless\nyou include the EXTENDED option. This issue is resolved in MySQL 5.6.\n(Bug #11933226, Bug #60681)\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/checksum-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/checksum-table.html'),(402,'NUMINTERIORRINGS',2,'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions'),(403,'INTERIORRINGN',2,'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#polygon-property-functions'),(404,'UTC_TIME',31,'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(405,'DROP FUNCTION',39,'The DROP FUNCTION statement is used to drop stored functions and\nuser-defined functions (UDFs):\n\no For information about dropping stored functions, see [HELP DROP\n  PROCEDURE].\n\no For information about dropping user-defined functions, see [HELP DROP\n  FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-function.html'),(406,'ALTER EVENT',39,'Syntax:\nALTER\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT event_name\n    [ON SCHEDULE schedule]\n    [ON COMPLETION [NOT] PRESERVE]\n    [RENAME TO new_event_name]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    [DO event_body]\n\nThe ALTER EVENT statement changes one or more of the characteristics of\nan existing event without the need to drop and recreate it. The syntax\nfor each of the DEFINER, ON SCHEDULE, ON COMPLETION, COMMENT, ENABLE /\nDISABLE, and DO clauses is exactly the same as when used with CREATE\nEVENT. (See [HELP CREATE EVENT].)\n\nAny user can alter an event defined on a database for which that user\nhas the EVENT privilege. When a user executes a successful ALTER EVENT\nstatement, that user becomes the definer for the affected event.\n\nALTER EVENT works only with an existing event:\n\nmysql> ALTER EVENT no_such_event \n     >     ON SCHEDULE \n     >       EVERY \'2:3\' DAY_HOUR;\nERROR 1517 (HY000): Unknown event \'no_such_event\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-event.html'),(407,'STDDEV',16,'Syntax:\nSTDDEV(expr)\n\nReturns the population standard deviation of expr. This function is\nprovided for compatibility with Oracle. The standard SQL function\nSTDDEV_POP() can be used instead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(408,'DATE_SUB',31,'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee the description for DATE_ADD().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(409,'PERIOD_ADD',31,'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_ADD(200801,2);\n        -> 200803\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(410,'|',19,'Syntax:\n|\n\nBitwise OR:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 29 | 15;\n        -> 31\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(411,'GEOMFROMTEXT',3,'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(412,'UUID_SHORT',14,'Syntax:\nUUID_SHORT()\n\nReturns a \"short\" universal identifier as a 64-bit unsigned integer\n(rather than a string-form 128-bit identifier as returned by the UUID()\nfunction).\n\nThe value of UUID_SHORT() is guaranteed to be unique if the following\nconditions hold:\n\no The server_id of the current host is unique among your set of master\n  and slave servers\n\no server_id is between 0 and 255\n\no You do not set back your system time for your server between mysqld\n  restarts\n\no You do not invoke UUID_SHORT() on average more than 16 million times\n  per second between mysqld restarts\n\nThe UUID_SHORT() return value is constructed this way:\n\n  (server_id & 255) << 56\n+ (server_startup_time_in_seconds << 24)\n+ incremented_variable++;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID_SHORT();\n        -> 92395783831158784\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(413,'RIGHT',37,'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(414,'DATEDIFF',31,'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATEDIFF(\'2007-12-31 23:59:59\',\'2007-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'2010-11-30 23:59:59\',\'2010-12-31\');\n        -> -31\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(415,'DROP TABLESPACE',39,'Syntax:\nDROP TABLESPACE tablespace_name\n    ENGINE [=] engine_name\n\nThis statement drops a tablespace that was previously created using\nCREATE TABLESPACE (see [HELP CREATE TABLESPACE]).\n\n*Important*: The tablespace to be dropped must not contain any data\nfiles; in other words, before you can drop a tablespace, you must first\ndrop each of its data files using ALTER TABLESPACE ... DROP DATAFILE\n(see [HELP ALTER TABLESPACE]).\n\nThe ENGINE clause (required) specifies the storage engine used by the\ntablespace. Currently, the only accepted values for engine_name are NDB\nand NDBCLUSTER.\n\nDROP TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-tablespace.html'),(416,'DROP PROCEDURE',39,'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. You must have the\nALTER ROUTINE privilege for the routine. (If the\nautomatic_sp_privileges system variable is enabled, that privilege and\nEXECUTE are granted automatically to the routine creator when the\nroutine is created and dropped from the creator when the routine is\ndropped. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-procedure.html'),(417,'CHECK TABLE',20,'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nInnoDB, MyISAM, ARCHIVE, and CSV tables. For MyISAM tables, the key\nstatistics are updated as well.\n\nTo check a table, you must have some privilege for it.\n\nCHECK TABLE can also check views for problems, such as tables that are\nreferenced in the view definition that no longer exist.\n\nCHECK TABLE is supported for partitioned tables, and you can use ALTER\nTABLE ... CHECK PARTITION to check one or more partitions; for more\ninformation, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/check-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/check-table.html'),(418,'BIN',37,'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(419,'INSTALL PLUGIN',5,'Syntax:\nINSTALL PLUGIN plugin_name SONAME \'shared_library_name\'\n\nThis statement installs a server plugin. It requires the INSERT\nprivilege for the mysql.plugin table.\n\nplugin_name is the name of the plugin as defined in the plugin\ndescriptor structure contained in the library file (see\nhttp://dev.mysql.com/doc/refman/5.5/en/plugin-data-structures.html).\nPlugin names are not case sensitive. For maximal compatibility, plugin\nnames should be limited to ASCII letters, digits, and underscore\nbecause they are used in C source files, shell command lines, M4 and\nBourne shell scripts, and SQL environments.\n\nshared_library_name is the name of the shared library that contains the\nplugin code. The name includes the file name extension (for example,\nlibmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (the\ndirectory named by the plugin_dir system variable). The library must be\nin the plugin directory itself, not in a subdirectory. By default,\nplugin_dir is the plugin directory under the directory named by the\npkglibdir configuration variable, but it can be changed by setting the\nvalue of plugin_dir at server startup. For example, set its value in a\nmy.cnf file:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative path name, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN loads and initializes the plugin code to make the plugin\navailable for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used. When the server shuts down, it executes\nthe deinitialization function for each plugin that is loaded so that\nthe plugin has a change to perform any final cleanup.\n\nINSTALL PLUGIN also registers the plugin by adding a line that\nindicates the plugin name and library file name to the mysql.plugin\ntable. At server startup, the server loads and initializes any plugin\nthat is listed in the mysql.plugin table. This means that a plugin is\ninstalled with INSTALL PLUGIN only once, not every time the server\nstarts. Plugin loading at startup does not occur if the server is\nstarted with the --skip-grant-tables option.\n\nA plugin library can contain multiple plugins. For each of them to be\ninstalled, use a separate INSTALL PLUGIN statement. Each statement\nnames a different plugin, but all of them specify the same library\nname.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/install-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/install-plugin.html'),(420,'DECLARE CURSOR',23,'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor and associates it with a SELECT\nstatement that retrieves the rows to be traversed by the cursor. To\nfetch the rows later, use a FETCH statement. The number of columns\nretrieved by the SELECT statement must match the number of output\nvariables specified in the FETCH statement.\n\nThe SELECT statement cannot have an INTO clause.\n\nCursor declarations must appear before handler declarations and after\nvariable and condition declarations.\n\nA stored program may contain multiple cursor declarations, but each\ncursor declared in a given block must have a unique name. For an\nexample, see http://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nFor information available through SHOW statements, it is possible in\nmany cases to obtain equivalent information by using a cursor with an\nINFORMATION_SCHEMA table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-cursor.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-cursor.html'),(421,'LOAD DATA',27,'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [CHARACTER SET charset_name]\n    [{FIELDS | COLUMNS}\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number {LINES | ROWS}]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The file name must be given as a literal string.\n\nLOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See\nhttp://dev.mysql.com/doc/refman/5.5/en/select-into.html.) To write data\nfrom a table to a file, use SELECT ... INTO OUTFILE. To read the file\nback into a table, use LOAD DATA INFILE. The syntax of the FIELDS and\nLINES clauses is the same for both statements. Both clauses are\noptional, but FIELDS must precede LINES if both are specified.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-speed.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput. If the contents of the input file use a character set that\ndiffers from the default, it is usually preferable to specify the\ncharacter set of the file by using the CHARACTER SET clause. A\ncharacter set of binary specifies \"no conversion.\"\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option with mysqldump or mysql so that output\nis written in the character set to be used when the file is loaded with\nLOAD DATA INFILE.\n\n*Note*: It is not possible to load data files that use the ucs2, utf16,\nor utf32 character set.\n\nThe character_set_filesystem system variable controls the\ninterpretation of the file name.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.5/en/mysqlimport.html.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (such as MyISAM,\nMEMORY, and MERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nPrior to MySQL 5.5.1, CONCURRENT was not replicated when using\nstatement-based replication (see Bug #34628). However, it is replicated\nwhen using row-based replication, regardless of the version. See\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-features-load-data.h\ntml, for more information.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  path name to specify its exact location. If given as a relative path\n  name, the name is interpreted relative to the directory in which the\n  client program was started.\n\n  When using LOCAL with LOAD DATA, a copy of the file is created in the\n  server\'s temporary directory. This is not the directory determined by\n  the value of tmpdir or slave_load_tmpdir, but rather the operating\n  system\'s temporary directory, and is not configurable in the MySQL\n  Server. (Typically the system temporary directory is /tmp on Linux\n  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for\n  the copy in this directory can cause the LOAD DATA LOCAL statement to\n  fail.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the file name is an absolute path name, the server uses it as\n    given.\n\n  o If the file name is a relative path name with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a file name with no leading components is given, the server\n    looks for the file in the database directory of the default\n    database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nWindows path names are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttp://dev.mysql.com/doc/refman/5.5/en/privileges-provided.html. For\nnon-LOCAL load operations, if the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-data.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-data.html'),(422,'MULTILINESTRING',24,'MultiLineString(ls1,ls2,...)\n\nConstructs a MultiLineString value using LineString or WKB LineString\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-mysql-specific-functions'),(423,'LOCALTIME',31,'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(424,'SHOW RELAYLOG EVENTS',26,'Syntax:\nSHOW RELAYLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the relay log of a replication slave. If you do not\nspecify \'log_name\', the first relay log is displayed. This statement\nhas no effect on the master.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-relaylog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-relaylog-events.html'),(425,'MPOINTFROMTEXT',3,'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkt-functions'),(426,'BLOB',22,'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each\nBLOB value is stored using a 2-byte length prefix that indicates the\nnumber of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(427,'SHA1',12,'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a string of\n40 hex digits, or NULL if the argument was NULL. One of the possible\nuses for this function is as a hash key. See the notes at the beginning\nof this section about storing hash values efficiently. You can also use\nSHA1() as a cryptographic function for storing passwords. SHA() is\nsynonymous with SHA1().\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(428,'SUBSTR',37,'Syntax:\nSUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str\nFROM pos FOR len)\n\nSUBSTR() is a synonym for SUBSTRING().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(429,'PASSWORD',12,'Syntax:\nPASSWORD(str)\n\nCalculates and returns a hashed password string from the plaintext\npassword str and returns a nonbinary string in the connection character\nset (a binary string before MySQL 5.5.3), or NULL if the argument is\nNULL. This function is the SQL interface to the algorithm used by the\nserver to encrypt MySQL passwords for storage in the mysql.user grant\ntable.\n\nThe password hashing method used by PASSWORD() depends on the value of\nthe old_passwords system variable:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SET old_passwords = 0;\nmysql> SELECT PASSWORD(\'mypass\');\n+-------------------------------------------+\n| PASSWORD(\'mypass\')                        |\n+-------------------------------------------+\n| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 |\n+-------------------------------------------+\n\nmysql> SET old_passwords = 1;\nmysql> SELECT PASSWORD(\'mypass\');\n+--------------------+\n| PASSWORD(\'mypass\') |\n+--------------------+\n| 6f8c114b58f2ce9e   |\n+--------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(430,'CHAR',22,'[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length in\ncharacters. The range of M is 0 to 255. If M is omitted, the length is\n1.\n\n*Note*: Trailing spaces are removed when CHAR values are retrieved\nunless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(431,'UTC_DATE',31,'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(432,'DIMENSION',36,'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in\nhttp://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(433,'COUNT DISTINCT',16,'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of rows with different non-NULL expr\nvalues.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(434,'BIT',22,'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(435,'EQUALS',30,'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.5/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries'),(436,'SHOW CREATE VIEW',26,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-view.html'),(437,'INTERVAL',18,'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(438,'FROM_DAYS',31,'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_DAYS(730669);\n        -> \'2007-07-03\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(439,'ALTER PROCEDURE',39,'Syntax:\nALTER PROCEDURE proc_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nprocedure. More than one change may be specified in an ALTER PROCEDURE\nstatement. However, you cannot change the parameters or body of a\nstored procedure using this statement; to make such changes, you must\ndrop and re-create the procedure using DROP PROCEDURE and CREATE\nPROCEDURE.\n\nYou must have the ALTER ROUTINE privilege for the procedure. By\ndefault, that privilege is granted automatically to the procedure\ncreator. This behavior can be changed by disabling the\nautomatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-procedure.html'),(440,'BIT_COUNT',19,'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(441,'OCTET_LENGTH',37,'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(442,'UTC_TIMESTAMP',31,'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the\nfunction is used in a string or numeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(443,'AES_ENCRYPT',12,'Syntax:\nAES_ENCRYPT(str,key_str)\n\nAES_ENCRYPT() and AES_DECRYPT() enable encryption and decryption of\ndata using the official AES (Advanced Encryption Standard) algorithm,\npreviously known as \"Rijndael.\" Encoding with a 128-bit key length is\nused, but you can extend it up to 256 bits by modifying the source. We\nchose 128 bits because it is much faster and it is secure enough for\nmost purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DECRYPT() decrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 * (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','INSERT INTO t VALUES (1,AES_ENCRYPT(\'text\',\'password\'));\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(444,'+',4,'Syntax:\n+\n\nAddition:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3+5;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(445,'INET_NTOA',14,'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric IPv4 network address in network byte order, returns the\ndotted-quad representation of the address as a string. INET_NTOA()\nreturns NULL if it does not understand its argument.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_NTOA(167773449);\n        -> \'10.0.5.9\'\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(446,'ACOS',4,'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(447,'ISOLATION',8,'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n  {\n       REPEATABLE READ\n     | READ COMMITTED\n     | READ UNCOMMITTED\n     | SERIALIZABLE\n   }\n\nThis statement sets the transaction isolation level, used for\noperations on InnoDB tables.\n\nScope of the Isolation Level\n\nYou can set the isolation level globally, for the current session, or\nfor the next transaction:\n\no With the GLOBAL keyword, the statement sets the default transaction\n  level globally for all subsequent sessions. Existing sessions are\n  unaffected.\n\no With the SESSION keyword, the statement sets the default transaction\n  level for all subsequent transactions performed within the current\n  session.\n\no Without any SESSION or GLOBAL keyword, the statement sets the\n  isolation level for the next (not started) transaction performed\n  within the current session.\n\nA change to the global default isolation level requires the SUPER\nprivilege. Any session is free to change its session isolation level\n(even in the middle of a transaction), or the isolation level for its\nnext transaction.\n\nSET TRANSACTION ISOLATION LEVEL without GLOBAL or SESSION is not\npermitted while there is an active transaction:\n\nmysql> START TRANSACTION;\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;\nERROR 1568 (25001): Transaction isolation level can\'t be changed\nwhile a transaction is in progress\n\nTo set the global default isolation level at server startup, use the\n--transaction-isolation=level option to mysqld on the command line or\nin an option file. Values of level for this option use dashes rather\nthan spaces, so the permissible values are READ-UNCOMMITTED,\nREAD-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set\nthe default isolation level to REPEATABLE READ, use these lines in the\n[mysqld] section of an option file:\n\n[mysqld]\ntransaction-isolation = REPEATABLE-READ\n\nIt is possible to check or set the global and session transaction\nisolation levels at runtime by using the tx_isolation system variable:\n\nSELECT @@GLOBAL.tx_isolation, @@tx_isolation;\nSET GLOBAL tx_isolation=\'REPEATABLE-READ\';\nSET SESSION tx_isolation=\'SERIALIZABLE\';\n\nDetails and Usage of Isolation Levels\n\nInnoDB supports each of the transaction isolation levels described here\nusing different locking strategies. You can enforce a high degree of\nconsistency with the default REPEATABLE READ level, for operations on\ncrucial data where ACID compliance is important. Or you can relax the\nconsistency rules with READ COMMITTED or even READ UNCOMMITTED, in\nsituations such as bulk reporting where precise consistency and\nrepeatable results are less important than minimizing the amount of\noverhead for locking. SERIALIZABLE enforces even stricter rules than\nREPEATABLE READ, and is used mainly in specialized situations, such as\nwith XA transactions and for troubleshooting issues with concurrency\nand deadlocks.\n\nFor full information about how these isolation levels work with InnoDB\ntransactions, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-transaction-model.html.\nIn particular, for additional information about InnoDB record-level\nlocks and how it uses them to execute various types of statements, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-record-level-locks.html\nand http://dev.mysql.com/doc/refman/5.5/en/innodb-locks-set.html.\n\nThe following list describes how MySQL supports the different\ntransaction levels. The list goes from the most commonly used level to\nthe least used.\n\no REPEATABLE READ\n\n  This is the default isolation level for InnoDB. For consistent reads,\n  there is an important difference from the READ COMMITTED isolation\n  level: All consistent reads within the same transaction read the\n  snapshot established by the first read. This convention means that if\n  you issue several plain (nonlocking) SELECT statements within the\n  same transaction, these SELECT statements are consistent also with\n  respect to each other. See\n  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  UPDATE, and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition, or a\n  range-type search condition. For a unique index with a unique search\n  condition, InnoDB locks only the index record found, not the gap\n  before it. For other search conditions, InnoDB locks the index range\n  scanned, using gap locks or next-key (gap plus index-record) locks to\n  block insertions by other sessions into the gaps covered by the\n  range.\n\no READ COMMITTED\n\n  A somewhat Oracle-like isolation level with respect to consistent\n  (nonlocking) reads: Each consistent read, even within the same\n  transaction, sets and reads its own fresh snapshot. See\n  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  InnoDB locks only index records, not the gaps before them, and thus\n  permits the free insertion of new records next to locked records. For\n  UPDATE and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition (such as\n  WHERE id = 100), or a range-type search condition (such as WHERE id >\n  100). For a unique index with a unique search condition, InnoDB locks\n  only the index record found, not the gap before it. For range-type\n  searches, InnoDB locks the index range scanned, using gap locks or\n  next-key (gap plus index-record) locks to block insertions by other\n  sessions into the gaps covered by the range. This is necessary\n  because \"phantom rows\" must be blocked for MySQL replication and\n  recovery to work.\n\n  *Note*: In MySQL 5.5, if the READ COMMITTED isolation level is used\n  or the innodb_locks_unsafe_for_binlog system variable is enabled,\n  there is no InnoDB gap locking except for foreign-key constraint\n  checking and duplicate-key checking. Also, record locks for\n  nonmatching rows are released after MySQL has evaluated the WHERE\n  condition. If you use READ COMMITTED or enable\n  innodb_locks_unsafe_for_binlog, you must use row-based binary\n  logging.\n\no READ UNCOMMITTED\n\n  SELECT statements are performed in a nonlocking fashion, but a\n  possible earlier version of a row might be used. Thus, using this\n  isolation level, such reads are not consistent. This is also called a\n  \"dirty read.\" Otherwise, this isolation level works like READ\n  COMMITTED.\n\no SERIALIZABLE\n\n  This level is like REPEATABLE READ, but InnoDB implicitly converts\n  all plain SELECT statements to SELECT ... LOCK IN SHARE MODE if\n  autocommit is disabled. If autocommit is enabled, the SELECT is its\n  own transaction. It therefore is known to be read only and can be\n  serialized if performed as a consistent (nonlocking) read and need\n  not block for other transactions. (To force a plain SELECT to block\n  if other transactions have modified the selected rows, disable\n  autocommit.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-transaction.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-transaction.html'),(448,'CEILING',4,'Syntax:\nCEILING(X)\n\nReturns the smallest integer value not less than X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEILING(-1.23);\n        -> -1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(449,'SIN',4,'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(450,'DAYOFWEEK',31,'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFWEEK(\'2007-02-03\');\n        -> 7\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(451,'SHOW PROCESSLIST',26,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information from the INFORMATION_SCHEMA PROCESSLIST table or the\nmysqladmin processlist command. If you have the PROCESS privilege, you\ncan see all threads. Otherwise, you can see only your own threads (that\nis, threads associated with the MySQL account that you are using). If\nyou do not use the FULL keyword, only the first 100 characters of each\nstatement are shown in the Info field.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-processlist.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-processlist.html'),(452,'LINEFROMWKB',32,'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(453,'GEOMETRYTYPE',36,'GeometryType(g)\n\nReturns as a binary string the name of the geometry type of which the\ngeometry instance g is a member. The name corresponds to one of the\ninstantiable Geometry subclasses.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#general-geometry-property-functions'),(454,'CREATE VIEW',39,'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThe CREATE VIEW statement creates a new view, or replaces an existing\none if the OR REPLACE clause is given. If the view does not exist,\nCREATE OR REPLACE VIEW is the same as CREATE VIEW. If the view does\nexist, CREATE OR REPLACE VIEW is the same as ALTER VIEW.\n\nThe select_statement is a SELECT statement that provides the definition\nof the view. (When you select from the view, you select in effect using\nthe SELECT statement.) select_statement can select from base tables or\nother views.\n\nThe view definition is \"frozen\" at creation time, so changes to the\nunderlying tables afterward do not affect the view definition. For\nexample, if a view is defined as SELECT * on a table, new columns added\nto the table later do not become part of the view.\n\nThe ALGORITHM clause affects how MySQL processes the view. The DEFINER\nand SQL SECURITY clauses specify the security context to be used when\nchecking access privileges at view invocation time. The WITH CHECK\nOPTION clause can be given to constrain inserts or updates to rows in\ntables referenced by the view. These clauses are described later in\nthis section.\n\nThe CREATE VIEW statement requires the CREATE VIEW privilege for the\nview, and some privilege for each column selected by the SELECT\nstatement. For columns used elsewhere in the SELECT statement you must\nhave the SELECT privilege. If the OR REPLACE clause is present, you\nmust also have the DROP privilege for the view. CREATE VIEW might also\nrequire the SUPER privilege, depending on the DEFINER value, as\ndescribed later in this section.\n\nWhen a view is referenced, privilege checking occurs as described later\nin this section.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it:\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nWithin a database, base tables and views share the same namespace, so a\nbase table and a view cannot have the same name.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no Within a stored program, the definition cannot refer to program\n  parameters or local variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no Any tables named in the view definition must exist at definition\n  time.\n\no You cannot associate a trigger with a view.\n\no Aliases for column names in the SELECT statement are checked against\n  the maximum column length of 64 characters (not the maximum alias\n  length of 256 characters).\n\nORDER BY is permitted in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol |\n+-------+\n1 row in set (0.01 sec)\n\nmysql> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   |\n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses determine which MySQL account to\nuse when checking access privileges for the view when a statement is\nexecuted that references the view. The valid SQL SECURITY\ncharacteristic values are DEFINER and INVOKER. These indicate that the\nrequired privileges must be held by the user who defined or invoked the\nview, respectively. The default SQL SECURITY value is DEFINER.\n\nIf a user value is given for the DEFINER clause, it should be a MySQL\naccount specified as \'user_name\'@\'host_name\' (the same format used in\nthe GRANT statement), CURRENT_USER, or CURRENT_USER(). The default\nDEFINER value is the user who executes the CREATE VIEW statement. This\nis the same as specifying DEFINER = CURRENT_USER explicitly.\n\nIf you specify the DEFINER clause, these rules determine the valid\nDEFINER user values:\n\no If you do not have the SUPER privilege, the only valid user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  valid account name. If the account does not actually exist, a warning\n  is generated.\n\no Although it is possible to create a view with a nonexistent DEFINER\n  account, an error occurs when the view is referenced if the SQL\n  SECURITY value is DEFINER but the definer account does not exist.\n\nFor more information about view security, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-security.html.\n\nWithin a view definition, CURRENT_USER returns the view\'s DEFINER value\nby default. For views defined with the SQL SECURITY INVOKER\ncharacteristic, CURRENT_USER returns the account for the view\'s\ninvoker. For information about user auditing within views, see\nhttp://dev.mysql.com/doc/refman/5.5/en/account-activity-auditing.html.\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine\'s DEFINER value. This\nalso affects a view defined within such a routine, if the view\ndefinition contains a DEFINER value of CURRENT_USER.\n\nView privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to table columns, the creator\n  must have some privilege for each column in the select list of the\n  definition, and the SELECT privilege for each column used elsewhere\n  in the definition. If the definition refers to a stored function,\n  only the privileges needed to invoke the function can be checked. The\n  privileges required at function invocation time can be checked only\n  as it executes: For different invocations, different execution paths\n  within the function might be taken.\n\no The user who references a view must have appropriate privileges to\n  access it (SELECT to select from it, INSERT to insert into it, and so\n  forth.)\n\no When a view has been referenced, privileges for objects accessed by\n  the view are checked against the privileges held by the view DEFINER\n  account or invoker, depending on whether the SQL SECURITY\n  characteristic is DEFINER or INVOKER, respectively.\n\no If reference to a view causes execution of a stored function,\n  privilege checking for statements executed within the function depend\n  on whether the function SQL SECURITY characteristic is DEFINER or\n  INVOKER. If the security characteristic is DEFINER, the function runs\n  with the privileges of the DEFINER account. If the characteristic is\n  INVOKER, the function runs with the privileges determined by the\n  view\'s SQL SECURITY characteristic.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges must be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the view v\nand the function f().\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY DEFINER. The standard says that the definer of the view,\nwhich is the same as the owner of the view\'s schema, gets applicable\nprivileges on the view (for example, SELECT) and may grant them. MySQL\nhas no concept of a schema \"owner\", so MySQL adds a clause to identify\nthe definer. The DEFINER clause is an extension where the intent is to\nhave what the standard has; that is, a permanent record of who defined\nthe view. This is why the default DEFINER value is the account of the\nview creator.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL. It\naffects how MySQL processes the view. ALGORITHM takes three values:\nMERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if\nno ALGORITHM clause is present. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/view-algorithms.html.\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview nonupdatable.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n\nIn a WITH CHECK OPTION clause for an updatable view, the LOCAL and\nCASCADED keywords determine the scope of check testing when the view is\ndefined in terms of another view. The LOCAL keyword restricts the CHECK\nOPTION only to the view being defined. CASCADED causes the checks for\nunderlying views to be evaluated as well. When neither keyword is\ngiven, the default is CASCADED.\n\nFor more information about updatable views and the WITH CHECK OPTION\nclause, see\nhttp://dev.mysql.com/doc/refman/5.5/en/view-updatability.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-view.html'),(455,'TRIM',37,'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(456,'IS',18,'Syntax:\nIS boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(457,'GET_FORMAT',31,'Syntax:\nGET_FORMAT({DATE|TIME|DATETIME}, {\'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\'})\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(458,'TINYBLOB',22,'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes. Each\nTINYBLOB value is stored using a 1-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(459,'SIGNAL',23,'Syntax:\nSIGNAL condition_value\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nSIGNAL is the way to \"return\" an error. SIGNAL provides error\ninformation to a handler, to an outer portion of the application, or to\nthe client. Also, it provides control over the error\'s characteristics\n(error number, SQLSTATE value, message). Without SIGNAL, it is\nnecessary to resort to workarounds such as deliberately referring to a\nnonexistent table to cause a routine to return an error.\n\nNo special privileges are required to execute the SIGNAL statement.\n\nThe condition_value in a SIGNAL statement indicates the error value to\nbe returned. It can be an SQLSTATE value (a 5-character string literal)\nor a condition_name that refers to a named condition previously defined\nwith DECLARE ... CONDITION (see [HELP DECLARE CONDITION]).\n\nAn SQLSTATE value can indicate errors, warnings, or \"not found.\" The\nfirst two characters of the value indicate its error class, as\ndiscussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-condition-inf\normation-items. Some signal values cause statement termination; see\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-effects.\n\nThe SQLSTATE value for a SIGNAL statement should not start with \'00\'\nbecause such values indicate success and are not valid for signaling an\nerror. This is true whether the SQLSTATE value is specified directly in\nthe SIGNAL statement or in a named condition referred to in the\nstatement. If the value is invalid, a Bad SQLSTATE error occurs.\n\nTo signal a generic SQLSTATE value, use \'45000\', which means \"unhandled\nuser-defined exception.\"\n\nThe SIGNAL statement optionally includes a SET clause that contains\nmultiple signal items, in a comma-separated list of\ncondition_information_item_name = simple_value_specification\nassignments.\n\nEach condition_information_item_name may be specified only once in the\nSET clause. Otherwise, a Duplicate condition information item error\noccurs.\n\nValid simple_value_specification designators can be specified using\nstored procedure or function parameters, stored program local variables\ndeclared with DECLARE, user-defined variables, system variables, or\nliterals. A character literal may include a _charset introducer.\n\nFor information about permissible condition_information_item_name\nvalues, see\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-condition-inf\normation-items.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/signal.html\n\n','CREATE PROCEDURE p (pval INT)\nBEGIN\n  DECLARE specialty CONDITION FOR SQLSTATE \'45000\';\n  IF pval = 0 THEN\n    SIGNAL SQLSTATE \'01000\';\n  ELSEIF pval = 1 THEN\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSEIF pval = 2 THEN\n    SIGNAL specialty\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSE\n    SIGNAL SQLSTATE \'01000\'\n      SET MESSAGE_TEXT = \'A warning occurred\', MYSQL_ERRNO = 1000;\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\', MYSQL_ERRNO = 1001;\n  END IF;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/signal.html'),(460,'SAVEPOINT',8,'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO [SAVEPOINT] identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,\nRELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/savepoint.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/savepoint.html'),(461,'USER',17,'Syntax:\nUSER()\n\nReturns the current MySQL user name and host name as a string in the\nutf8 character set.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(462,'LABELS',23,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nLabels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,\nand WHILE statements. Label use for those statements follows these\nrules:\n\no begin_label must be followed by a colon.\n\no begin_label can be given without end_label. If end_label is present,\n  it must be the same as begin_label.\n\no end_label cannot be given without begin_label.\n\no Labels at the same nesting level must be distinct.\n\no Labels can be up to 16 characters long.\n\nTo refer to a label within the labeled construct, use an ITERATE or\nLEAVE statement. The following example uses those statements to\ncontinue iterating or terminate the loop:\n\nCREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\nEND;\n\nThe scope of a block label does not include the code for handlers\ndeclared within the block. For details, see [HELP DECLARE HANDLER].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/statement-labels.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/statement-labels.html'),(463,'ALTER TABLE',39,'Syntax:\nALTER [ONLINE | OFFLINE] [IGNORE] TABLE tbl_name\n    [alter_specification [, alter_specification] ...]\n    [partition_options]\n\nalter_specification:\n    table_options\n  | ADD [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (col_name column_definition,...)\n  | ADD {INDEX|KEY} [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]] PRIMARY KEY\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD FULLTEXT [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD SPATIAL [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        reference_definition\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name new_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | MAX_ROWS = rows\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO|AS] new_tbl_name\n  | ORDER BY col_name [, col_name] ...\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | FORCE\n  | ADD PARTITION (partition_definition)\n  | DROP PARTITION partition_names\n  | TRUNCATE PARTITION {partition_names | ALL}\n  | COALESCE PARTITION number\n  | REORGANIZE PARTITION [partition_names INTO (partition_definitions)]\n  | ANALYZE PARTITION {partition_names | ALL}\n  | CHECK PARTITION {partition_names | ALL}\n  | OPTIMIZE PARTITION {partition_names | ALL}\n  | REBUILD PARTITION {partition_names | ALL}\n  | REPAIR PARTITION {partition_names | ALL}\n  | PARTITION BY partitioning_expression\n  | REMOVE PARTITIONING\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\ntable_options:\n    table_option [[,] table_option] ...  (see CREATE TABLE options)\n\npartition_options:\n    (see CREATE TABLE options)\n\nALTER TABLE changes the structure of a table. For example, you can add\nor delete columns, create or destroy indexes, change the type of\nexisting columns, or rename columns or the table itself. You can also\nchange characteristics such as the storage engine used for the table or\nthe table comment.\n\nPartitioning-related clauses for ALTER TABLE can be used with\npartitioned tables for repartitioning, for adding, dropping, merging,\nand splitting partitions, and for performing partitioning maintenance.\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/alter-table-partition-operations\n.html.\n\nFollowing the table name, specify the alterations to be made. If none\nare given, ALTER TABLE does nothing.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-table.html'),(464,'MPOINTFROMWKB',32,'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(465,'CHAR BYTE',22,'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(466,'REPAIR TABLE',20,'Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM, ARCHIVE, and CSV tables. See\nhttp://dev.mysql.com/doc/refman/5.5/en/myisam-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.5/en/archive-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.5/en/csv-storage-engine.html\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nREPAIR TABLE is supported for partitioned tables. However, the USE_FRM\noption cannot be used with this statement on a partitioned table.\n\nYou can use ALTER TABLE ... REPAIR PARTITION to repair one or more\npartitions; for more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/repair-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/repair-table.html'),(467,'MERGE',39,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.5/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','http://dev.mysql.com/doc/refman/5.5/en/merge-storage-engine.html'),(468,'CREATE TABLE',39,'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_options]\n    [partition_options]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options]\n    [partition_options]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    col_name column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n      [index_option] ...\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) reference_definition\n  | CHECK (expr)\n\ncolumn_definition:\n    data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\']\n      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]\n      [STORAGE {DISK|MEMORY|DEFAULT}]\n      [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR[(length)]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY[(length)]\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nreference_definition:\n    REFERENCES tbl_name (index_col_name,...)\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    ENGINE [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]\n  | UNION [=] (tbl_name[,tbl_name]...)\n\npartition_options:\n    PARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list)\n        | RANGE{(expr) | COLUMNS(column_list)}\n        | LIST{(expr) | COLUMNS(column_list)} }\n    [PARTITIONS num]\n    [SUBPARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list) }\n      [SUBPARTITIONS num]\n    ]\n    [(partition_definition [, partition_definition] ...)]\n\npartition_definition:\n    PARTITION partition_name\n        [VALUES \n            {LESS THAN {(expr | value_list) | MAXVALUE} \n            | \n            IN (value_list)}]\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n        [(subpartition_definition [, subpartition_definition] ...)]\n\nsubpartition_definition:\n    SUBPARTITION logical_name\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some valid select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for permissible table names are given in\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html. By default,\nthe table is created in the default database, using the InnoDB storage\nengine. An error occurs if the table exists, if there is no default\ndatabase, or if the database does not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-table.html'),(469,'>',18,'Syntax:\n>\n\nGreater than:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 > 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(470,'ANALYZE TABLE',20,'Syntax:\nANALYZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for InnoDB\nand MyISAM. This statement works with InnoDB, NDB, and MyISAM tables.\nFor MyISAM tables, this statement is equivalent to using myisamchk\n--analyze.\n\nFor more information on how the analysis works within InnoDB, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-restrictions.html.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant. In addition, key distributions can be used when deciding\nwhich indexes to use for a specific table within a query.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nANALYZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... ANALYZE PARTITION to analyze one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/analyze-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/analyze-table.html'),(471,'MICROSECOND',31,'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'2009-12-31 23:59:59.000010\');\n        -> 10\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(472,'CONSTRAINT',39,'InnoDB supports foreign keys, which let you cross-reference related\ndata across tables, and foreign key constraints, which help keep this\nspread-out data consistent. The syntax for an InnoDB foreign key\nconstraint definition in the CREATE TABLE or ALTER TABLE statement\nlooks like this:\n\n[CONSTRAINT [symbol]] FOREIGN KEY\n    [index_name] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name,...)\n    [ON DELETE reference_option]\n    [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/innodb-foreign-key-constraints.html\n\n','CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                       PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                            product_category INT NOT NULL,\n                            product_id INT NOT NULL,\n                            customer_id INT NOT NULL,\n                            PRIMARY KEY(no),\n                            INDEX (product_category, product_id),\n                            FOREIGN KEY (product_category, product_id)\n                              REFERENCES product(category, id)\n                              ON UPDATE CASCADE ON DELETE RESTRICT,\n                            INDEX (customer_id),\n                            FOREIGN KEY (customer_id)\n                              REFERENCES customer(id)) ENGINE=INNODB;\n','http://dev.mysql.com/doc/refman/5.5/en/innodb-foreign-key-constraints.html'),(473,'CREATE SERVER',39,'Syntax:\nCREATE SERVER server_name\n    FOREIGN DATA WRAPPER wrapper_name\n    OPTIONS (option [, option] ...)\n\noption:\n  { HOST character-literal\n  | DATABASE character-literal\n  | USER character-literal\n  | PASSWORD character-literal\n  | SOCKET character-literal\n  | OWNER character-literal\n  | PORT numeric-literal }\n\nThis statement creates the definition of a server for use with the\nFEDERATED storage engine. The CREATE SERVER statement creates a new row\nwithin the servers table within the mysql database. This statement\nrequires the SUPER privilege.\n\nThe server_name should be a unique reference to the server. Server\ndefinitions are global within the scope of the server, it is not\npossible to qualify the server definition to a specific database.\nserver_name has a maximum length of 64 characters (names longer than 64\ncharacters are silently truncated), and is case insensitive. You may\nspecify the name as a quoted string.\n\nThe wrapper_name should be mysql, and may be quoted with single\nquotation marks. Other values for wrapper_name are not currently\nsupported.\n\nFor each option you must specify either a character literal or numeric\nliteral. Character literals are UTF-8, support a maximum length of 64\ncharacters and default to a blank (empty) string. String literals are\nsilently truncated to 64 characters. Numeric literals must be a number\nbetween 0 and 9999, default value is 0.\n\n*Note*: Note that the OWNER option is currently not applied, and has no\neffect on the ownership or operation of the server connection that is\ncreated.\n\nThe CREATE SERVER statement creates an entry in the mysql.servers table\nthat can later be used with the CREATE TABLE statement when creating a\nFEDERATED table. The options that you specify will be used to populate\nthe columns in the mysql.servers table. The table columns are\nServer_name, Host, Db, Username, Password, Port and Socket.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-server.html\n\n','CREATE SERVER s\nFOREIGN DATA WRAPPER mysql\nOPTIONS (USER \'Remote\', HOST \'192.168.1.106\', DATABASE \'test\');\n','http://dev.mysql.com/doc/refman/5.5/en/create-server.html'),(474,'FIELD',37,'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(475,'MAKETIME',31,'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(476,'CURDATE',31,'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CURDATE();\n        -> \'2008-06-13\'\nmysql> SELECT CURDATE() + 0;\n        -> 20080613\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(477,'SET PASSWORD',10,'Syntax:\nSET PASSWORD [FOR user] =\n    {\n        PASSWORD(\'cleartext password\')\n      | OLD_PASSWORD(\'cleartext password\')\n      | \'encrypted password\'\n    }\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount. When the read_only system variable is enabled, the SUPER\nprivilege is required to use SET PASSWORD, in addition to whatever\nother privileges might be required.\n\nIf the password is specified using the PASSWORD() or OLD_PASSWORD()\nfunction, the cleartext (unencrypted) password should be given as the\nargument to the function, which hashes the password and returns the\nencrypted password string. If the password is specified without using\neither function, it should be the already encrypted password value as a\nliteral string. In all cases, the encrypted password string must be in\nthe format required by the authentication method used for the account.\n\nThe old_passwords system variable value determines the hashing method\nused by PASSWORD(). If you specify the password using that function and\nSET PASSWORD rejects the password as not being in the correct format,\nit may be necessary to set old_passwords to change the hashing method.\nFor descriptions of the permitted values, see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nWith no FOR user clause, this statement sets the password for the\ncurrent user. (To see which account the server authenticated you as,\ninvoke the CURRENT_USER() function.) Any client who successfully\nconnects to the server using a nonanonymous account can change the\npassword for that account.\n\nWith a FOR user clause, this statement sets the password for the named\nuser. You must have the UPDATE privilege for the mysql database to do\nthis. The user account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. The user\nvalue should be given as \'user_name\'@\'host_name\', where \'user_name\' and\n\'host_name\' are exactly as listed in the User and Host columns of the\nmysql.user table row. (If you specify only a user name, a host name of\n\'%\' is used.) For example, to set the password for an account with User\nand Host column values of \'bob\' and \'%.example.org\', write the\nstatement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.example.org\' = PASSWORD(\'cleartext password\');\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-password.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-password.html'),(478,'ALTER TABLESPACE',39,'Syntax:\nALTER TABLESPACE tablespace_name\n    {ADD|DROP} DATAFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement can be used either to add a new data file, or to drop a\ndata file from a tablespace.\n\nThe ADD DATAFILE variant enables you to specify an initial size using\nan INITIAL_SIZE clause, where size is measured in bytes; the default\nvalue is 128M (128 megabytes). You may optionally follow this integer\nvalue with a one-letter abbreviation for an order of magnitude, similar\nto those used in my.cnf. Generally, this is one of the letters M (for\nmegabytes) or G (for gigabytes).\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and an data file with the same name, or an undo log\nfile and a tablespace with the same name.\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nINITIAL_SIZE is rounded, explicitly, as for CREATE TABLESPACE.\n\nOnce a data file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using additional ALTER\nTABLESPACE ... ADD DATAFILE statements.\n\nUsing DROP DATAFILE with ALTER TABLESPACE drops the data file\n\'file_name\' from the tablespace. You cannot drop a data file from a\ntablespace which is in use by any table; in other words, the data file\nmust be empty (no extents used). See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data-objects.\nhtml. In addition, any data file to be dropped must previously have\nbeen added to the tablespace with CREATE TABLESPACE or ALTER\nTABLESPACE.\n\nBoth ALTER TABLESPACE ... ADD DATAFILE and ALTER TABLESPACE ... DROP\nDATAFILE require an ENGINE clause which specifies the storage engine\nused by the tablespace. Currently, the only accepted values for\nengine_name are NDB and NDBCLUSTER.\n\nWAIT is parsed but otherwise ignored, and so has no effect in MySQL\n5.5. It is intended for future expansion.\n\nWhen ALTER TABLESPACE ... ADD DATAFILE is used with ENGINE = NDB, a\ndata file is created on each Cluster data node. You can verify that the\ndata files were created and obtain information about them by querying\nthe INFORMATION_SCHEMA.FILES table. For example, the following query\nshows all data files belonging to the tablespace named newts:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+--------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME    | EXTRA          |\n+--------------------+--------------+----------------+\n| lg_3               | newdata.dat  | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat  | CLUSTER_NODE=4 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=4 |\n+--------------------+--------------+----------------+\n2 rows in set (0.03 sec)\n\nSee http://dev.mysql.com/doc/refman/5.5/en/files-table.html.\n\nALTER TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-tablespace.html'),(479,'IF FUNCTION',7,'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(480,'ENUM',22,'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(481,'DATABASE',17,'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(482,'POINTFROMWKB',32,'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-values.html#gis-wkb-functions'),(483,'POWER',4,'Syntax:\nPOWER(X,Y)\n\nThis is a synonym for POW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(484,'ATAN',4,'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(485,'STRCMP',37,'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(486,'INSERT DELAYED',27,'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and BLACKHOLE\n  tables. For engines that do not support DELAYED, an error occurs.\n\no An error occurs for INSERT DELAYED if used with a table that has been\n  locked with LOCK TABLES because the insert must be handled by a\n  separate thread, not by the session that holds the lock.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no Prior to MySQL 5.5.7, INSERT DELAYED was treated as a normal INSERT\n  if the statement inserted multiple rows, binary logging was enabled,\n  and the global logging format was statement-based (that is, whenever\n  binlog_format was set to STATEMENT). Beginning with MySQL 5.5.7,\n  INSERT DELAYED is always handled as a simple INSERT (that is, without\n  the DELAYED option) whenever the value of binlog_format is STATEMENT\n  or MIXED. (In the latter case, the statement no longer triggers a\n  switch to row-based logging, and so is logged using the\n  statement-based format.)\n\n  This does not apply when using row-based binary logging mode\n  (binlog_format set to ROW), in which INSERT DELAYED statements are\n  always executed using the DELAYED option as specified, and logged as\n  row-update events.\n\no DELAYED is ignored on slave replication servers, so that INSERT\n  DELAYED is treated as a normal INSERT on slaves. This is because\n  DELAYED could cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\no INSERT DELAYED is not supported for partitioned tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert-delayed.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert-delayed.html'),(487,'SHOW PROFILE',26,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype:\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\nProfiling is controlled by the profiling session variable, which has a\ndefault value of 0 (OFF). Profiling is enabled by setting profiling to\n1 or ON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nyou will find neither of those statements in the profile list.\nMalformed statements are profiled. For example, SHOW PROFILING is an\nillegal statement, and a syntax error occurs if you try to execute it,\nbut it will show up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttp://dev.mysql.com/doc/refman/5.5/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/show-profile.html'),(488,'SHOW PROCEDURE CODE',26,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/show-procedure-code.html'),(489,'MEDIUMTEXT',22,'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\nThe effective maximum length is less if the value contains multi-byte\ncharacters. Each MEDIUMTEXT value is stored using a 3-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(490,'LN',4,'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\nIf X is less than or equal to 0, then NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(491,'RETURN',23,'Syntax:\nRETURN expr\n\nThe RETURN statement terminates execution of a stored function and\nreturns the value expr to the function caller. There must be at least\none RETURN statement in a stored function. There may be more than one\nif the function has multiple exit points.\n\nThis statement is not used in stored procedures, triggers, or events.\nThe LEAVE statement can be used to exit a stored program of those\ntypes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/return.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/return.html'),(492,'SHOW COLLATION',26,'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html. For example:\n\nmysql> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-collation.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-collation.html'),(493,'LOG',4,'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X. If X is less than or equal to 0, then NULL is returned.\n\nThe inverse of this function (when called with a single argument) is\nthe EXP() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(494,'SET SQL_LOG_BIN',8,'Syntax:\nSET sql_log_bin = {0|1}\n\nThe sql_log_bin variable controls whether logging to the binary log is\ndone. The default value is 1 (do logging). To change logging for the\ncurrent session, change the session value of this variable. The session\nuser must have the SUPER privilege to set this variable.\n\nBeginning with MySQL 5.5.5, it is no longer possible to set\n@@session.sql_log_bin within a transaction or subquery. (Bug #53437)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-sql-log-bin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-sql-log-bin.html'),(495,'!=',18,'Syntax:\n<>, !=\n\nNot equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(496,'WHILE',23,'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition expression is true. statement_list consists of one or\nmore SQL statements, each terminated by a semicolon (;) statement\ndelimiter.\n\nA WHILE statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/while.html\n\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/while.html'),(497,'AES_DECRYPT',12,'Syntax:\nAES_DECRYPT(crypt_str,key_str)\n\nThis function decrypts data using the official AES (Advanced Encryption\nStandard) algorithm. For more information, see the description of\nAES_ENCRYPT().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(498,'DAYNAME',31,'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.5/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYNAME(\'2007-02-03\');\n        -> \'Saturday\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(499,'COERCIBILITY',17,'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(500,'INT',22,'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(501,'GLENGTH',13,'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/geometry-property-functions.html#linestring-property-functions'),(502,'RADIANS',4,'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(503,'COLLATION',17,'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(504,'COALESCE',18,'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(505,'VERSION',17,'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set. The value might have a suffix in addition\nto the version number. See the description of the version system\nvariable in\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT VERSION();\n        -> \'5.5.29-standard\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(506,'MAKE_SET',37,'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by \",\"\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(507,'FIND_IN_SET',37,'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by \",\" characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (\",\") character.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'','2018-08-07 03:06:15'),('zabbix-server','root','','',1,'','2018-08-07 03:06:15');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) NOT NULL DEFAULT '0',
  `plugin` char(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `authentication_string` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('zabbix-server','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('127.0.0.1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('::1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('localhost','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',''),('zabbix-server','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',''),('localhost','zabbix','*7BC4443E867FAF820A35A3E3C28CCF5368E3803E','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

--
-- Current Database: `zabbix`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zabbix` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `zabbix`;

--
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  `old_severity` int(11) NOT NULL DEFAULT '0',
  `new_severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '1h',
  `def_shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `def_longdata` text COLLATE utf8_bin NOT NULL,
  `r_shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `r_longdata` text COLLATE utf8_bin NOT NULL,
  `formula` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `maintenance_mode` int(11) NOT NULL DEFAULT '1',
  `ack_shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_longdata` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,'0','','','','','',1,'',''),(3,'Report problems to Zabbix administrators',0,0,1,'1h','Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Updated problem: {EVENT.NAME}','{USER.FULLNAME} {EVENT.UPDATE.ACTION} problem at {EVENT.UPDATE.DATE} {EVENT.UPDATE.TIME}.\r\n{EVENT.UPDATE.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}, acknowledged: {EVENT.ACK.STATUS}.'),(4,'Report not supported items',3,0,1,'1h','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','',1,'',''),(5,'Report not supported low level discovery rules',3,0,1,'1h','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','',1,'',''),(6,'Report unknown triggers',3,0,1,'1h','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','',1,'','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  `p_eventid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  KEY `alerts_7` (`p_eventid`),
  KEY `c_alerts_6` (`acknowledgeid`),
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_5` FOREIGN KEY (`p_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_6` FOREIGN KEY (`acknowledgeid`) REFERENCES `acknowledges` (`acknowledgeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
INSERT INTO `application_prototype` VALUES (1,23665,NULL,'Startup {#SERVICE.STARTUPNAME} services');
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (1,207,206),(12,252,206),(13,262,206),(14,272,206),(15,282,206),(16,292,206),(17,302,206),(18,329,206),(19,345,179),(20,346,13),(21,347,5),(22,348,21),(23,349,15),(24,350,7),(25,351,1),(26,352,17),(27,353,9),(28,354,23),(29,355,207),(165,797,780),(166,799,780),(168,803,771),(167,803,784),(169,804,800),(170,805,799),(171,811,784),(172,812,800),(173,813,799),(174,820,784),(175,821,800),(176,822,799),(177,823,784),(178,824,800),(179,825,799),(180,836,826),(181,837,827),(182,838,826),(183,839,827),(185,840,771),(184,840,784),(186,841,800),(187,842,799),(191,846,800),(192,847,799),(193,856,848),(194,857,849),(195,858,852),(196,859,853),(197,860,854),(198,861,855),(205,868,848),(206,869,851),(207,870,852),(208,871,853),(209,872,854),(210,873,855),(212,874,771),(211,874,784),(213,875,800),(214,876,799),(215,883,784),(216,884,800),(217,885,799),(219,892,771),(218,892,784),(220,893,800),(221,894,799),(223,901,771),(222,901,784),(224,902,800),(225,903,799),(227,910,770),(226,910,781),(228,911,798),(229,912,797),(231,913,771),(230,913,782),(232,914,800),(233,915,799),(235,916,771),(234,916,784),(236,917,800),(237,918,799),(244,934,771),(243,934,784),(245,935,800),(246,936,799),(247,942,784),(248,943,800),(249,944,799),(251,949,771),(250,949,784),(252,950,800),(253,951,799),(263,969,784),(264,970,800),(265,971,799),(266,977,784),(267,978,800),(268,979,799),(270,986,771),(269,986,784),(271,987,800),(272,988,799),(273,992,782),(274,993,800),(275,994,799),(276,998,781),(277,999,798),(278,1000,797),(279,1014,779),(280,1015,776),(281,1016,777),(282,1017,778),(284,1018,771),(283,1018,784),(285,1019,800),(286,1020,799),(287,1021,779),(288,1022,776),(289,1023,777),(290,1024,778),(291,1025,786),(292,1026,800),(293,1027,799),(295,1028,771),(294,1028,784),(296,1029,800),(297,1030,799),(298,1037,779),(299,1038,776),(300,1039,777),(301,1040,778),(302,1041,784),(303,1042,800),(304,1043,799),(305,1048,852),(306,1049,855),(307,1050,854),(308,1051,853),(309,1052,848),(310,1053,784),(311,1054,800),(312,1055,799),(313,1057,1056);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(5,10001,'Filesystems',0),(7,10001,'Network interfaces',0),(9,10001,'Processes',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(21,10001,'General',0),(23,10001,'Security',0),(179,10047,'Zabbix server',0),(206,10050,'Zabbix agent',0),(207,10001,'Zabbix agent',0),(252,10074,'Zabbix agent',0),(253,10074,'CPU',0),(254,10074,'Filesystems',0),(255,10074,'General',0),(256,10074,'Memory',0),(257,10074,'Network interfaces',0),(258,10074,'OS',0),(259,10074,'Performance',0),(260,10074,'Processes',0),(261,10074,'Security',0),(262,10075,'Zabbix agent',0),(263,10075,'CPU',0),(264,10075,'Filesystems',0),(265,10075,'General',0),(266,10075,'Memory',0),(267,10075,'Network interfaces',0),(268,10075,'OS',0),(269,10075,'Performance',0),(270,10075,'Processes',0),(271,10075,'Security',0),(272,10076,'Zabbix agent',0),(273,10076,'CPU',0),(274,10076,'Filesystems',0),(275,10076,'General',0),(276,10076,'Memory',0),(277,10076,'Network interfaces',0),(278,10076,'OS',0),(279,10076,'Performance',0),(280,10076,'Processes',0),(281,10076,'Security',0),(282,10077,'Zabbix agent',0),(283,10077,'CPU',0),(284,10077,'Filesystems',0),(285,10077,'General',0),(286,10077,'Memory',0),(287,10077,'Network interfaces',0),(288,10077,'OS',0),(289,10077,'Performance',0),(290,10077,'Processes',0),(291,10077,'Security',0),(292,10078,'Zabbix agent',0),(293,10078,'CPU',0),(294,10078,'Filesystems',0),(295,10078,'General',0),(296,10078,'Memory',0),(297,10078,'Network interfaces',0),(298,10078,'OS',0),(299,10078,'Performance',0),(300,10078,'Processes',0),(301,10078,'Security',0),(302,10079,'Zabbix agent',0),(303,10079,'CPU',0),(304,10079,'Filesystems',0),(305,10079,'General',0),(306,10079,'Memory',0),(307,10079,'Network interfaces',0),(308,10079,'OS',0),(309,10079,'Performance',0),(310,10079,'Processes',0),(311,10079,'Security',0),(319,10081,'General',0),(320,10081,'Performance',0),(321,10081,'Services',0),(322,10081,'Filesystems',0),(323,10081,'OS',0),(324,10081,'Processes',0),(325,10081,'CPU',0),(328,10081,'Memory',0),(329,10081,'Zabbix agent',0),(330,10081,'Network interfaces',0),(331,10076,'Logical partitions',0),(345,10084,'Zabbix server',0),(346,10084,'CPU',0),(347,10084,'Filesystems',0),(348,10084,'General',0),(349,10084,'Memory',0),(350,10084,'Network interfaces',0),(351,10084,'OS',0),(352,10084,'Performance',0),(353,10084,'Processes',0),(354,10084,'Security',0),(355,10084,'Zabbix agent',0),(356,10048,'Zabbix proxy',0),(446,10093,'FTP service',0),(447,10094,'HTTP service',0),(448,10095,'HTTPS service',0),(449,10096,'IMAP service',0),(450,10097,'LDAP service',0),(451,10098,'NNTP service',0),(452,10099,'NTP service',0),(453,10100,'POP service',0),(454,10101,'SMTP service',0),(455,10102,'SSH service',0),(456,10103,'Telnet service',0),(727,10168,'http-8080',0),(728,10168,'http-8443',0),(729,10168,'jk-8009',0),(730,10168,'Sessions',0),(731,10168,'Tomcat',0),(732,10169,'Classes',0),(733,10169,'Compilation',0),(734,10169,'Garbage Collector',0),(735,10169,'Memory',0),(736,10169,'Memory Pool',0),(737,10169,'Operating System',0),(738,10169,'Runtime',0),(739,10169,'Threads',0),(740,10170,'MySQL',0),(741,10171,'Fans',0),(742,10171,'Temperature',0),(743,10171,'Voltage',0),(744,10172,'Fans',0),(745,10172,'Temperature',0),(746,10172,'Voltage',0),(747,10173,'Clusters',0),(748,10173,'General',0),(749,10173,'Log',0),(750,10174,'CPU',0),(751,10174,'Disks',0),(752,10174,'Filesystems',0),(753,10174,'General',0),(754,10174,'Interfaces',0),(755,10174,'Memory',0),(756,10174,'Network',0),(757,10174,'Storage',0),(758,10175,'CPU',0),(759,10175,'Datastore',0),(760,10175,'General',0),(761,10175,'Hardware',0),(762,10175,'Memory',0),(763,10175,'Network',0),(770,10182,'Network Interfaces',0),(771,10183,'Network Interfaces',0),(772,10184,'Internal Items',0),(773,10184,'Memory',0),(774,10184,'Storage',0),(775,10184,'CPU',0),(776,10185,'Internal Items',0),(777,10185,'Memory',0),(778,10185,'Storage',0),(779,10185,'CPU',0),(780,10186,'Status',0),(781,10187,'Network Interfaces',0),(782,10188,'Network Interfaces',0),(783,10189,'Network Interfaces',0),(784,10190,'Network Interfaces',0),(786,10192,'Network Interfaces',0),(797,10203,'Status',0),(798,10203,'General',0),(799,10204,'Status',0),(800,10204,'General',0),(803,10207,'Network Interfaces',0),(804,10207,'General',0),(805,10207,'Status',0),(806,10207,'CPU',0),(807,10207,'Memory',0),(808,10207,'Temperature',0),(809,10207,'Fans',0),(810,10207,'Inventory',0),(811,10208,'Network Interfaces',0),(812,10208,'General',0),(813,10208,'Status',0),(814,10208,'CPU',0),(815,10208,'Memory',0),(816,10208,'Temperature',0),(817,10208,'Power Supply',0),(818,10208,'Fans',0),(819,10208,'Inventory',0),(820,10210,'Network Interfaces',0),(821,10210,'General',0),(822,10210,'Status',0),(823,10211,'Network Interfaces',0),(824,10211,'General',0),(825,10211,'Status',0),(826,10209,'CPU',0),(827,10209,'Memory',0),(828,10210,'Temperature',0),(829,10210,'Power Supply',0),(830,10210,'Fans',0),(831,10210,'Inventory',0),(832,10211,'Temperature',0),(833,10211,'Power Supply',0),(834,10211,'Fans',0),(835,10211,'Inventory',0),(836,10210,'CPU',0),(837,10210,'Memory',0),(838,10211,'CPU',0),(839,10211,'Memory',0),(840,10218,'Network Interfaces',0),(841,10218,'General',0),(842,10218,'Status',0),(846,10220,'General',0),(847,10220,'Status',0),(848,10212,'Memory',0),(849,10213,'CPU',0),(851,10215,'CPU',0),(852,10216,'Inventory',0),(853,10217,'Temperature',0),(854,10217,'Power Supply',0),(855,10217,'Fans',0),(856,10218,'Memory',0),(857,10218,'CPU',0),(858,10218,'Inventory',0),(859,10218,'Temperature',0),(860,10218,'Power Supply',0),(861,10218,'Fans',0),(868,10220,'Memory',0),(869,10220,'CPU',0),(870,10220,'Inventory',0),(871,10220,'Temperature',0),(872,10220,'Power Supply',0),(873,10220,'Fans',0),(874,10221,'Network Interfaces',0),(875,10221,'General',0),(876,10221,'Status',0),(877,10221,'CPU',0),(878,10221,'Memory',0),(879,10221,'Temperature',0),(880,10221,'Power Supply',0),(881,10221,'Fans',0),(882,10221,'Inventory',0),(883,10222,'Network Interfaces',0),(884,10222,'General',0),(885,10222,'Status',0),(886,10222,'CPU',0),(887,10222,'Memory',0),(888,10222,'Temperature',0),(889,10222,'Fans',0),(890,10222,'Power Supply',0),(891,10222,'Inventory',0),(892,10223,'Network Interfaces',0),(893,10223,'General',0),(894,10223,'Status',0),(895,10223,'CPU',0),(896,10223,'Memory',0),(897,10223,'Temperature',0),(898,10223,'Fans',0),(899,10223,'Power Supply',0),(900,10223,'Inventory',0),(901,10224,'Network Interfaces',0),(902,10224,'General',0),(903,10224,'Status',0),(904,10224,'CPU',0),(905,10224,'Memory',0),(906,10224,'Temperature',0),(907,10224,'Power Supply',0),(908,10224,'Fans',0),(909,10224,'Inventory',0),(910,10225,'Network Interfaces',0),(911,10225,'General',0),(912,10225,'Status',0),(913,10226,'Network Interfaces',0),(914,10226,'General',0),(915,10226,'Status',0),(916,10227,'Network Interfaces',0),(917,10227,'General',0),(918,10227,'Status',0),(919,10227,'CPU',0),(920,10227,'Memory',0),(921,10227,'Temperature',0),(922,10227,'Fans',0),(923,10227,'Power Supply',0),(924,10227,'Inventory',0),(934,10229,'Network Interfaces',0),(935,10229,'General',0),(936,10229,'Status',0),(937,10229,'CPU',0),(938,10229,'Memory',0),(939,10229,'Temperature',0),(940,10229,'Fans',0),(941,10229,'Inventory',0),(942,10230,'Network Interfaces',0),(943,10230,'General',0),(944,10230,'Status',0),(945,10230,'Temperature',0),(946,10230,'Power Supply',0),(947,10230,'Fans',0),(948,10230,'Inventory',0),(949,10231,'Network Interfaces',0),(950,10231,'General',0),(951,10231,'Status',0),(952,10231,'CPU',0),(953,10231,'Memory',0),(954,10231,'Temperature',0),(955,10231,'Power Supply',0),(956,10231,'Fans',0),(957,10231,'Inventory',0),(969,10233,'Network Interfaces',0),(970,10233,'General',0),(971,10233,'Status',0),(972,10233,'CPU',0),(973,10233,'Memory',0),(974,10233,'Temperature',0),(975,10233,'Storage',0),(976,10233,'Inventory',0),(977,10234,'Network Interfaces',0),(978,10234,'General',0),(979,10234,'Status',0),(980,10234,'CPU',0),(981,10234,'Memory',0),(982,10234,'Temperature',0),(983,10234,'Power Supply',0),(984,10234,'Fans',0),(985,10234,'Inventory',0),(986,10235,'Network Interfaces',0),(987,10235,'General',0),(988,10235,'Status',0),(989,10235,'CPU',0),(990,10235,'Memory',0),(991,10235,'Inventory',0),(992,10236,'Network Interfaces',0),(993,10236,'General',0),(994,10236,'Status',0),(995,10236,'CPU',0),(996,10236,'Memory',0),(997,10236,'Inventory',0),(998,10237,'Network Interfaces',0),(999,10237,'General',0),(1000,10237,'Status',0),(1001,10237,'CPU',0),(1002,10237,'Memory',0),(1003,10237,'Inventory',0),(1014,10248,'CPU',0),(1015,10248,'Internal Items',0),(1016,10248,'Memory',0),(1017,10248,'Storage',0),(1018,10248,'Network Interfaces',0),(1019,10248,'General',0),(1020,10248,'Status',0),(1021,10249,'CPU',0),(1022,10249,'Internal Items',0),(1023,10249,'Memory',0),(1024,10249,'Storage',0),(1025,10249,'Network Interfaces',0),(1026,10249,'General',0),(1027,10249,'Status',0),(1028,10250,'Network Interfaces',0),(1029,10250,'General',0),(1030,10250,'Status',0),(1031,10250,'CPU',0),(1032,10250,'Memory',0),(1033,10250,'Temperature',0),(1034,10250,'Fans',0),(1035,10250,'Power Supply',0),(1036,10250,'Inventory',0),(1037,10251,'CPU',0),(1038,10251,'Internal Items',0),(1039,10251,'Memory',0),(1040,10251,'Storage',0),(1041,10251,'Network Interfaces',0),(1042,10251,'General',0),(1043,10251,'Status',0),(1044,10251,'Temperature',0),(1045,10251,'Fans',0),(1046,10251,'Power Supply',0),(1047,10251,'Inventory',0),(1048,10253,'Inventory',0),(1049,10253,'Fans',0),(1050,10253,'Power Supply',0),(1051,10253,'Temperature',0),(1052,10253,'Memory',0),(1053,10253,'Network Interfaces',0),(1054,10253,'General',0),(1055,10253,'Status',0),(1056,10252,'CPU',0),(1057,10253,'CPU',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,2,1533697640,3,0,'','192.168.22.1',0,''),(2,1,1533697651,3,0,'','192.168.22.1',0,''),(3,1,1533697662,1,0,'0','192.168.22.1',1,'Admin');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oldvalue` text COLLATE utf8_bin NOT NULL,
  `newvalue` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,3,'users','lang','en_GB','zh_CN');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `listen_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_metadata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`host`),
  KEY `autoreg_host_2` (`proxy_hostid`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value2` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0',''),(3,2,8,0,'9',''),(4,2,12,2,'Linux',''),(6,4,23,0,'0',''),(7,5,23,0,'2',''),(8,6,23,0,'4','');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '10m',
  `work_period` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '1-5,09:00-18:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `default_theme` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'Disaster',
  `ok_period` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '5m',
  `blink_period` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '2m',
  `problem_unack_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'CC0000',
  `problem_ack_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'CC0000',
  `ok_unack_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '009900',
  `ok_ack_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '009900',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `hk_events_internal` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '1d',
  `hk_events_discovery` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '1d',
  `hk_events_autoreg` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '1d',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '90d',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  `custom_color` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'10m','1-5,09:00-18:00',7,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster','5m','2m','CC0000','CC0000','009900','009900',1,1,1,1,1,10,1,'365d','1d','1d','1d',1,'365d',1,'365d',1,'365d',1,0,'90d',1,0,'365d',-1,0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition`
--

DROP TABLE IF EXISTS `corr_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_1` (`correlationid`),
  CONSTRAINT `c_corr_condition_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition`
--

LOCK TABLES `corr_condition` WRITE;
/*!40000 ALTER TABLE `corr_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_group`
--

DROP TABLE IF EXISTS `corr_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_group` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_group_1` (`groupid`),
  CONSTRAINT `c_corr_condition_group_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE,
  CONSTRAINT `c_corr_condition_group_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_group`
--

LOCK TABLES `corr_condition_group` WRITE;
/*!40000 ALTER TABLE `corr_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tag`
--

DROP TABLE IF EXISTS `corr_condition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tag` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tag_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tag`
--

LOCK TABLES `corr_condition_tag` WRITE;
/*!40000 ALTER TABLE `corr_condition_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagpair`
--

DROP TABLE IF EXISTS `corr_condition_tagpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagpair` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `oldtag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `newtag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagpair_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagpair`
--

LOCK TABLES `corr_condition_tagpair` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagvalue`
--

DROP TABLE IF EXISTS `corr_condition_tagvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagvalue` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagvalue_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagvalue`
--

LOCK TABLES `corr_condition_tagvalue` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_operation`
--

DROP TABLE IF EXISTS `corr_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_operation` (
  `corr_operationid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_operationid`),
  KEY `corr_operation_1` (`correlationid`),
  CONSTRAINT `c_corr_operation_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_operation`
--

LOCK TABLES `corr_operation` WRITE;
/*!40000 ALTER TABLE `corr_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `correlationid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`correlationid`),
  UNIQUE KEY `correlation_2` (`name`),
  KEY `correlation_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboardid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dashboardid`),
  KEY `c_dashboard_1` (`userid`),
  CONSTRAINT `c_dashboard_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Dashboard',1,0);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_user`
--

DROP TABLE IF EXISTS `dashboard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_user` (
  `dashboard_userid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_userid`),
  UNIQUE KEY `dashboard_user_1` (`dashboardid`,`userid`),
  KEY `c_dashboard_user_2` (`userid`),
  CONSTRAINT `c_dashboard_user_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_user`
--

LOCK TABLES `dashboard_user` WRITE;
/*!40000 ALTER TABLE `dashboard_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usrgrp`
--

DROP TABLE IF EXISTS `dashboard_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usrgrp` (
  `dashboard_usrgrpid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_usrgrpid`),
  UNIQUE KEY `dashboard_usrgrp_1` (`dashboardid`,`usrgrpid`),
  KEY `c_dashboard_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_dashboard_usrgrp_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usrgrp`
--

LOCK TABLES `dashboard_usrgrp` WRITE;
/*!40000 ALTER TABLE `dashboard_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3050122,3050122);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_community` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ports` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iprange` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '1h',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,NULL,'Local network','192.168.0.1-254','1h',0,1);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dns` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_recovery`
--

DROP TABLE IF EXISTS `event_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_recovery` (
  `eventid` bigint(20) unsigned NOT NULL,
  `r_eventid` bigint(20) unsigned NOT NULL,
  `c_eventid` bigint(20) unsigned DEFAULT NULL,
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `event_recovery_1` (`r_eventid`),
  KEY `event_recovery_2` (`c_eventid`),
  CONSTRAINT `c_event_recovery_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_3` FOREIGN KEY (`c_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_recovery`
--

LOCK TABLES `event_recovery` WRITE;
/*!40000 ALTER TABLE `event_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `eventtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`eventtagid`),
  KEY `event_tag_1` (`eventid`),
  CONSTRAINT `c_event_tag_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `name` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(5,4,'^(MMCSS|gupdate|SysmonLog|clr_optimization_v2.0.50727_32|clr_optimization_v4.0.30319_32)$',4,',',1),(6,5,'^(automatic|automatic delayed)$',3,',',1),(7,2,'^Software Loopback Interface',4,',',1),(8,2,'^(In)?[Ll]oop[Bb]ack[0-9._]*$',4,',',1),(9,2,'^NULL[0-9.]*$',4,',',1),(10,2,'^[Ll]o[0-9.]*$',4,',',1),(11,2,'^[Ss]ystem$',4,',',1),(12,2,'^Nu[0-9.]*$',4,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `name` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parameter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`name`,`parameter`),
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10199,10019,10016,'diff','0'),(10204,10055,10041,'last','0'),(10207,10058,10044,'diff','0'),(10208,10057,10043,'diff','0'),(12144,22181,13000,'last','0'),(12549,22232,13025,'nodata','5m'),(12550,10020,10047,'nodata','5m'),(12553,10056,10042,'last','0'),(12580,17350,10012,'last','0'),(12583,10025,10021,'change','0'),(12592,22686,13266,'last','0'),(12598,22454,13272,'last','0'),(12641,22189,13015,'min','10m'),(12645,22183,13073,'min','10m'),(12646,22191,13074,'min','10m'),(12648,23620,13075,'min','10m'),(12649,22185,13019,'min','10m'),(12651,22396,13017,'min','10m'),(12653,22219,13023,'min','10m'),(12715,22833,13328,'nodata','5m'),(12717,22835,13330,'last','0'),(12718,22836,13331,'last','0'),(12723,22853,13336,'diff','0'),(12724,22856,13337,'last','0'),(12725,22858,13338,'diff','0'),(12726,22859,13339,'change','0'),(12727,22861,13340,'diff','0'),(12728,22862,13341,'last','0'),(12729,22869,13342,'last','0'),(12730,22872,13343,'last','0'),(12731,22873,13344,'nodata','5m'),(12733,22875,13346,'last','0'),(12734,22876,13347,'last','0'),(12739,22893,13352,'diff','0'),(12740,22896,13353,'last','0'),(12741,22898,13354,'diff','0'),(12742,22899,13355,'change','0'),(12743,22901,13356,'diff','0'),(12744,22902,13357,'last','0'),(12745,22909,13358,'last','0'),(12746,22912,13359,'last','0'),(12747,22913,13360,'nodata','5m'),(12755,22933,13368,'diff','0'),(12757,22938,13370,'diff','0'),(12758,22939,13371,'change','0'),(12759,22941,13372,'diff','0'),(12760,22942,13373,'last','0'),(12761,22949,13374,'last','0'),(12762,22952,13375,'last','0'),(12763,22953,13376,'nodata','5m'),(12771,22973,13384,'diff','0'),(12773,22978,13386,'diff','0'),(12775,22981,13388,'diff','0'),(12776,22982,13389,'last','0'),(12777,22989,13390,'last','0'),(12778,22992,13391,'last','0'),(12779,22993,13392,'nodata','5m'),(12782,22996,13395,'last','0'),(12787,23013,13400,'diff','0'),(12788,23016,13401,'last','0'),(12789,23018,13402,'diff','0'),(12790,23019,13403,'change','0'),(12791,23021,13404,'diff','0'),(12792,23022,13405,'last','0'),(12793,23029,13406,'last','0'),(12794,23032,13407,'last','0'),(12795,23033,13408,'nodata','5m'),(12797,23035,13410,'last','0'),(12798,23036,13411,'last','0'),(12803,23053,13416,'diff','0'),(12805,23058,13418,'diff','0'),(12806,23059,13419,'change','0'),(12807,23061,13420,'diff','0'),(12808,23062,13421,'last','0'),(12809,23069,13422,'last','0'),(12810,23072,13423,'last','0'),(12812,23149,13425,'diff','0'),(12815,23150,13428,'change','0'),(12818,23668,13431,'min','10m'),(12820,23158,13433,'last','0'),(12824,23160,13437,'nodata','5m'),(12826,23165,13439,'last','0'),(12895,23271,13486,'min','10m'),(12896,23273,13487,'min','10m'),(12897,23274,13488,'min','10m'),(12898,23275,13489,'min','10m'),(12899,23276,13490,'min','10m'),(12900,23287,13491,'nodata','5m'),(12902,23289,13493,'last','0'),(12903,23290,13494,'last','0'),(12908,23307,13499,'diff','0'),(12909,23310,13500,'last','0'),(12910,23312,13501,'diff','0'),(12911,23313,13502,'change','0'),(12912,23315,13503,'diff','0'),(12913,23316,13504,'last','0'),(12914,23282,13505,'last','0'),(12915,23284,13506,'last','0'),(12926,22231,13026,'diff','0'),(12927,10059,10045,'diff','0'),(12928,23288,13492,'diff','0'),(12929,22834,13329,'diff','0'),(12930,22874,13345,'diff','0'),(12931,22914,13361,'diff','0'),(12932,22954,13377,'diff','0'),(12933,22994,13393,'diff','0'),(12934,23034,13409,'diff','0'),(12935,23161,13438,'diff','0'),(12936,23318,13507,'diff','0'),(12937,23319,13508,'diff','0'),(12938,23327,13509,'diff','0'),(12939,23320,13510,'diff','0'),(12940,23321,13511,'diff','0'),(12941,23322,13512,'diff','0'),(12942,23323,13513,'diff','0'),(12943,23324,13514,'diff','0'),(12944,23325,13515,'diff','0'),(12945,23326,13516,'diff','0'),(12946,23357,13517,'min','10m'),(12947,23342,13518,'min','10m'),(12948,23341,13519,'min','10m'),(12949,23359,13520,'min','10m'),(12965,23634,13536,'min','10m'),(12966,23635,13537,'min','10m'),(12994,23644,13544,'max','#3'),(12995,23645,13545,'max','#3'),(12996,23646,13546,'max','#3'),(12997,23647,13547,'max','#3'),(12998,23648,13548,'max','#3'),(13068,23115,13367,'avg','5m'),(13069,22922,13366,'avg','5m'),(13070,22918,13365,'avg','5m'),(13071,22917,13364,'avg','5m'),(13072,22882,13350,'avg','5m'),(13073,22878,13349,'avg','5m'),(13074,22877,13348,'avg','5m'),(13075,22962,13382,'avg','5m'),(13078,10010,10010,'avg','5m'),(13079,23296,13497,'avg','5m'),(13080,17362,13243,'avg','5m'),(13081,23301,13498,'avg','5m'),(13082,10009,10190,'avg','5m'),(13083,23292,13496,'avg','5m'),(13084,10013,10011,'avg','5m'),(13085,23291,13495,'avg','5m'),(13086,23042,13414,'avg','5m'),(13087,22842,13334,'avg','5m'),(13088,22838,13333,'avg','5m'),(13089,22837,13332,'avg','5m'),(13090,23007,13399,'avg','5m'),(13091,23002,13398,'avg','5m'),(13092,22998,13397,'avg','5m'),(13093,22997,13396,'avg','5m'),(13094,23143,13435,'avg','5m'),(13095,23140,13430,'avg','5m'),(13152,23651,13551,'max','#3'),(13154,23649,13549,'max','#3'),(13156,23650,13550,'max','#3'),(13157,23652,13552,'max','#3'),(13158,23653,13553,'max','#3'),(13159,23654,13285,'max','#3'),(13160,23661,13557,'last',''),(13161,23662,13558,'last',''),(13164,22424,13080,'avg','10m'),(13165,23252,13467,'avg','10m'),(13170,22412,13081,'avg','10m'),(13171,23253,13468,'avg','10m'),(13172,22430,13083,'avg','10m'),(13173,23255,13470,'avg','10m'),(13174,22422,13084,'avg','10m'),(13175,23256,13471,'avg','10m'),(13176,22406,13085,'avg','10m'),(13177,23257,13472,'avg','10m'),(13178,22408,13086,'avg','30m'),(13179,23258,13473,'avg','30m'),(13180,22402,13087,'avg','10m'),(13181,23259,13474,'avg','10m'),(13182,22418,13088,'avg','10m'),(13183,23260,13475,'avg','10m'),(13184,22416,13089,'avg','10m'),(13185,23261,13476,'avg','10m'),(13186,22689,13275,'avg','10m'),(13187,23262,13477,'avg','10m'),(13188,22399,13091,'avg','10m'),(13189,23264,13479,'avg','10m'),(13190,22420,13092,'avg','10m'),(13191,23265,13480,'avg','10m'),(13192,22414,13093,'min','10m'),(13193,23266,13481,'min','10m'),(13194,23171,13441,'avg','10m'),(13195,23267,13482,'avg','10m'),(13196,23663,13559,'avg','10m'),(13197,23664,13560,'avg','10m'),(13198,22426,13094,'avg','10m'),(13199,23268,13483,'avg','10m'),(13200,22404,13095,'avg','10m'),(13201,23269,13484,'avg','10m'),(13202,22400,13096,'avg','10m'),(13203,23270,13485,'avg','10m'),(13204,22401,13097,'avg','10m'),(13205,23328,13436,'avg','10m'),(13206,23347,13521,'avg','10m'),(13207,23360,13534,'avg','10m'),(13208,23352,13522,'avg','10m'),(13209,23351,13535,'avg','10m'),(13210,23350,13523,'avg','10m'),(13211,23353,13524,'avg','30m'),(13212,23354,13525,'avg','10m'),(13213,23356,13526,'avg','10m'),(13214,23355,13527,'avg','10m'),(13215,23349,13528,'avg','10m'),(13216,23348,13529,'avg','10m'),(13217,23343,13530,'avg','10m'),(13218,23344,13531,'avg','10m'),(13219,23345,13532,'avg','10m'),(13220,23346,13533,'avg','10m'),(13221,23666,13561,'min','#3'),(13222,25366,13562,'avg','10m'),(13223,25367,13563,'avg','10m'),(13224,25368,13564,'avg','10m'),(13225,25369,13565,'avg','10m'),(13226,25370,13566,'avg','10m'),(13227,25371,13567,'avg','10m'),(13228,25665,13568,'avg','10m'),(13229,25666,13569,'avg','10m'),(13230,25667,13570,'avg','10m'),(13231,25668,13571,'avg','10m'),(14249,26831,14163,'last','0'),(14250,26832,14163,'last','0'),(14251,26838,14164,'last','0'),(14252,26836,14164,'last','0'),(14253,26833,14165,'last','0'),(14254,26834,14165,'last','0'),(14255,26827,14166,'str','off'),(14256,26824,14167,'str','off'),(14257,26909,14168,'last','0'),(14258,26908,14168,'last','0'),(14259,26899,14169,'last','0'),(14260,26903,14169,'last','0'),(14261,26902,14170,'last','0'),(14262,26901,14170,'last','0'),(14263,26864,14171,'last','0'),(14264,26882,14171,'last','0'),(14265,26866,14172,'last','0'),(14266,26865,14172,'last','0'),(14267,26861,14173,'last','0'),(14268,26862,14173,'last','0'),(14269,26858,14174,'last','0'),(14270,26856,14174,'last','0'),(14271,26868,14175,'last','0'),(14272,26860,14175,'last','0'),(14273,26877,14176,'last','0'),(14274,26878,14176,'last','0'),(14275,26880,14177,'last','0'),(14276,26879,14177,'last','0'),(14277,26881,14178,'last','0'),(14278,26887,14179,'last','0'),(14279,26895,14179,'last','0'),(14280,26889,14180,'last','0'),(14281,26884,14180,'last','0'),(14282,26906,14181,'last','0'),(14283,26896,14181,'last','0'),(14284,26907,14182,'last','0'),(14285,26908,14182,'last','0'),(14286,26904,14183,'last','0'),(14287,26903,14183,'last','0'),(14288,26900,14184,'last','0'),(14289,26901,14184,'last','0'),(14290,26883,14185,'last','0'),(14291,26882,14185,'last','0'),(14292,26863,14186,'last','0'),(14293,26865,14186,'last','0'),(14294,26867,14187,'last','0'),(14295,26862,14187,'last','0'),(14296,26857,14188,'last','0'),(14297,26856,14188,'last','0'),(14298,26859,14189,'last','0'),(14299,26860,14189,'last','0'),(14300,26869,14190,'last','0'),(14301,26878,14190,'last','0'),(14302,26876,14191,'nodata','5m'),(14303,26875,14192,'str','Server'),(14304,26893,14193,'str','Client'),(14305,26924,14194,'last','0'),(14306,26932,14195,'last','0'),(14307,26932,14196,'last','0'),(14308,26930,14197,'last','0'),(14309,26930,14198,'last','0'),(14310,26931,14199,'last','0'),(14311,26931,14200,'last','0'),(14312,26929,14201,'last','0'),(14313,26929,14202,'last','0'),(14314,26928,14203,'last','0'),(14315,26928,14204,'last','0'),(14316,26925,14205,'last','0'),(14317,26943,14206,'last','0'),(14318,26943,14207,'last','0'),(14319,26939,14208,'last','0'),(14320,26939,14209,'last','0'),(14321,26940,14210,'last','0'),(14322,26940,14211,'last','0'),(14323,26941,14212,'last','0'),(14324,26941,14213,'last','0'),(14325,26942,14214,'last','0'),(14326,26942,14215,'last','0'),(14327,26938,14216,'last','0'),(14328,26938,14217,'last','0'),(14329,26937,14218,'last','0'),(14330,26937,14219,'last','0'),(14331,26933,14220,'last','0'),(14332,26933,14221,'last','0'),(14333,26934,14222,'last','0'),(14334,26935,14223,'last','0'),(14335,26935,14224,'last','0'),(14336,26936,14225,'last','0'),(14337,26936,14226,'last','0'),(14370,27036,14243,'avg','5m'),(14372,27044,14245,'avg','5m'),(14373,27044,14246,'avg','5m'),(14374,27052,14247,'avg','5m'),(14376,27060,14249,'avg','5m'),(14377,27060,14250,'avg','5m'),(14378,27067,14251,'max','#3'),(14379,27066,14252,'min','5m'),(14380,27065,14253,'avg','5m'),(14463,27138,14288,'max','#3'),(14464,27139,14289,'min','5m'),(14465,27140,14290,'avg','5m'),(14466,27148,14291,'last',''),(14468,27149,14293,'max','#3'),(14469,27150,14294,'min','5m'),(14470,27151,14295,'avg','5m'),(14471,27159,14296,'last',''),(14508,27192,14311,'max','#3'),(14509,27193,14312,'min','5m'),(14510,27194,14313,'avg','5m'),(14511,27201,14314,'last',''),(14513,27208,14316,'avg','5m'),(14514,27205,14317,'avg','5m'),(14515,27212,14318,'avg','5m'),(14516,27212,14318,'max','5m'),(14517,27212,14319,'avg','5m'),(14518,27212,14319,'max','5m'),(14519,27212,14320,'avg','5m'),(14520,27212,14320,'min','5m'),(14522,27214,14322,'diff',''),(14523,27214,14322,'strlen',''),(14536,27225,14327,'max','#3'),(14537,27226,14328,'min','5m'),(14538,27227,14329,'avg','5m'),(14539,27234,14330,'last',''),(14541,27240,14332,'avg','5m'),(14542,27239,14333,'avg','5m'),(14543,27238,14334,'last','0'),(14544,27238,14335,'last','0'),(14545,27237,14336,'diff',''),(14546,27237,14336,'strlen',''),(14547,27236,14337,'diff',''),(14548,27236,14337,'strlen',''),(14552,27247,14339,'avg','5m'),(14553,27247,14339,'max','5m'),(14554,27247,14340,'avg','5m'),(14555,27247,14340,'min','5m'),(14570,27261,14347,'max','#3'),(14571,27262,14348,'min','5m'),(14572,27263,14349,'avg','5m'),(14573,27270,14350,'last',''),(14587,27282,14356,'max','#3'),(14588,27283,14357,'min','5m'),(14589,27284,14358,'avg','5m'),(14590,27291,14359,'last',''),(14592,27294,14361,'avg','5m'),(14593,27293,14362,'avg','5m'),(14594,27296,14363,'diff',''),(14595,27296,14363,'strlen',''),(14596,27295,14364,'diff',''),(14597,27295,14364,'strlen',''),(14598,27297,14365,'diff',''),(14599,27297,14365,'strlen',''),(14600,27299,14366,'avg','5m'),(14601,27301,14367,'avg','5m'),(14602,27298,14368,'avg','5m'),(14603,27300,14369,'avg','5m'),(14606,27314,14372,'avg','5m'),(14607,27314,14372,'max','5m'),(14608,27314,14373,'avg','5m'),(14609,27314,14373,'max','5m'),(14610,27314,14374,'avg','5m'),(14611,27314,14374,'min','5m'),(14612,27315,14375,'avg','5m'),(14613,27315,14375,'max','5m'),(14614,27315,14376,'avg','5m'),(14615,27315,14376,'max','5m'),(14616,27315,14377,'avg','5m'),(14617,27315,14377,'min','5m'),(14620,27318,14380,'avg','5m'),(14621,27318,14380,'max','5m'),(14622,27318,14381,'avg','5m'),(14623,27318,14381,'max','5m'),(14624,27318,14382,'avg','5m'),(14625,27318,14382,'min','5m'),(14626,27320,14383,'diff',''),(14627,27320,14383,'strlen',''),(14641,27333,14389,'max','#3'),(14642,27334,14390,'min','5m'),(14643,27335,14391,'avg','5m'),(14644,27342,14392,'last',''),(14663,27365,14403,'max','#3'),(14664,27366,14404,'min','5m'),(14665,27367,14405,'avg','5m'),(14666,27374,14406,'last',''),(14668,27376,14408,'avg','5m'),(14669,27378,14409,'diff',''),(14670,27378,14409,'strlen',''),(14671,27380,14410,'avg','5m'),(14672,27385,14411,'diff',''),(14673,27385,14411,'strlen',''),(14676,27382,14413,'diff',''),(14677,27382,14413,'strlen',''),(14678,27414,14414,'avg','5m'),(14679,27417,14415,'avg','5m'),(14681,27419,14417,'diff',''),(14682,27419,14417,'strlen',''),(14689,27421,14420,'avg','5m'),(14690,27421,14420,'min','5m'),(14693,27424,14423,'avg','5m'),(14695,27442,14425,'avg','5m'),(14696,27427,14426,'avg','5m'),(14698,27428,14428,'diff',''),(14699,27428,14428,'strlen',''),(14702,27445,14430,'diff',''),(14703,27445,14430,'strlen',''),(14722,27430,14437,'avg','5m'),(14723,27430,14437,'min','5m'),(14726,27447,14439,'avg','5m'),(14727,27447,14439,'min','5m'),(14747,27462,14451,'max','#3'),(14748,27463,14452,'min','5m'),(14749,27464,14453,'avg','5m'),(14750,27471,14454,'last',''),(14752,27478,14456,'avg','5m'),(14753,27477,14457,'avg','5m'),(14756,27485,14460,'avg','5m'),(14757,27485,14460,'max','5m'),(14758,27485,14461,'avg','5m'),(14759,27485,14461,'max','5m'),(14760,27485,14462,'avg','5m'),(14761,27485,14462,'min','5m'),(14762,27483,14463,'diff',''),(14763,27483,14463,'strlen',''),(14776,27496,14468,'max','#3'),(14777,27497,14469,'min','5m'),(14778,27498,14470,'avg','5m'),(14779,27505,14471,'last',''),(14781,27511,14473,'avg','5m'),(14782,27509,14474,'diff',''),(14783,27509,14474,'strlen',''),(14784,27516,14475,'avg','5m'),(14785,27517,14476,'avg','5m'),(14786,27517,14476,'max','5m'),(14787,27517,14477,'avg','5m'),(14788,27517,14477,'max','5m'),(14789,27517,14478,'avg','5m'),(14790,27517,14478,'min','5m'),(14806,27532,14486,'max','#3'),(14807,27533,14487,'min','5m'),(14808,27534,14488,'avg','5m'),(14809,27541,14489,'last',''),(14811,27547,14491,'avg','5m'),(14812,27545,14492,'diff',''),(14813,27545,14492,'strlen',''),(14814,27544,14493,'diff',''),(14815,27544,14493,'strlen',''),(14816,27552,14494,'avg','5m'),(14817,27553,14495,'avg','5m'),(14818,27553,14495,'max','5m'),(14819,27553,14496,'avg','5m'),(14820,27553,14496,'max','5m'),(14821,27553,14497,'avg','5m'),(14822,27553,14497,'min','5m'),(14838,27568,14505,'max','#3'),(14839,27569,14506,'min','5m'),(14840,27570,14507,'avg','5m'),(14841,27577,14508,'last',''),(14843,27586,14510,'avg','5m'),(14844,27584,14511,'avg','5m'),(14845,27584,14511,'max','5m'),(14849,27584,14513,'avg','5m'),(14850,27584,14513,'min','5m'),(14851,27582,14514,'diff',''),(14852,27582,14514,'strlen',''),(14853,27579,14515,'diff',''),(14854,27579,14515,'strlen',''),(14855,27590,14516,'avg','5m'),(14871,27608,14524,'max','#3'),(14872,27609,14525,'min','5m'),(14873,27610,14526,'avg','5m'),(14874,27617,14527,'last',''),(14889,27631,14534,'max','#3'),(14890,27632,14535,'min','5m'),(14891,27633,14536,'avg','5m'),(14892,27640,14537,'last',''),(14907,27654,14544,'max','#3'),(14908,27655,14545,'min','5m'),(14909,27656,14546,'avg','5m'),(14910,27663,14547,'last',''),(14912,27671,14549,'avg','5m'),(14913,27670,14550,'avg','5m'),(14914,27672,14551,'avg','5m'),(14915,27672,14551,'max','5m'),(14916,27672,14552,'avg','5m'),(14917,27672,14552,'max','5m'),(14918,27672,14553,'avg','5m'),(14919,27672,14553,'min','5m'),(14922,27678,14556,'diff',''),(14923,27678,14556,'strlen',''),(14924,27677,14557,'diff',''),(14925,27677,14557,'strlen',''),(14972,27734,14582,'max','#3'),(14973,27735,14583,'min','5m'),(14974,27736,14584,'avg','5m'),(14975,27743,14585,'last',''),(14977,27753,14587,'avg','5m'),(14978,27752,14588,'avg','5m'),(14979,27751,14589,'avg','5m'),(14980,27751,14589,'max','5m'),(14981,27751,14590,'avg','5m'),(14982,27751,14590,'max','5m'),(14983,27751,14591,'avg','5m'),(14984,27751,14591,'min','5m'),(14985,27750,14592,'diff',''),(14986,27750,14592,'strlen',''),(15000,27766,14598,'max','#3'),(15001,27767,14599,'min','5m'),(15002,27768,14600,'avg','5m'),(15003,27775,14601,'last',''),(15005,27777,14603,'diff',''),(15006,27777,14603,'strlen',''),(15013,27784,14606,'avg','5m'),(15014,27784,14606,'min','5m'),(15015,27785,14607,'diff',''),(15016,27785,14607,'strlen',''),(15032,27800,14615,'max','#3'),(15033,27801,14616,'min','5m'),(15034,27802,14617,'avg','5m'),(15035,27809,14618,'last',''),(15037,27814,14620,'last','0'),(15038,27813,14621,'diff',''),(15039,27813,14621,'strlen',''),(15040,27820,14622,'avg','5m'),(15041,27819,14623,'avg','5m'),(15042,27821,14624,'avg','5m'),(15043,27821,14624,'max','5m'),(15044,27821,14625,'avg','5m'),(15045,27821,14625,'max','5m'),(15046,27821,14626,'avg','5m'),(15047,27821,14626,'min','5m'),(15094,27882,14652,'max','#3'),(15095,27883,14653,'min','5m'),(15096,27884,14654,'avg','5m'),(15097,27891,14655,'last',''),(15099,27899,14657,'avg','5m'),(15100,27897,14658,'avg','5m'),(15101,27897,14658,'max','5m'),(15102,27897,14659,'avg','5m'),(15103,27897,14659,'max','5m'),(15104,27897,14660,'avg','5m'),(15105,27897,14660,'min','5m'),(15106,27894,14661,'diff',''),(15107,27894,14661,'strlen',''),(15108,27895,14662,'diff',''),(15109,27895,14662,'strlen',''),(15110,27904,14663,'avg','5m'),(15111,27905,14664,'avg','5m'),(15112,27905,14664,'max','5m'),(15113,27905,14665,'avg','5m'),(15114,27905,14665,'max','5m'),(15115,27905,14666,'avg','5m'),(15116,27905,14666,'min','5m'),(15117,27906,14667,'avg','5m'),(15118,27906,14668,'avg','5m'),(15131,27919,14673,'max','#3'),(15132,27920,14674,'min','5m'),(15133,27921,14675,'avg','5m'),(15134,27928,14676,'last',''),(15136,27936,14678,'avg','5m'),(15137,27933,14679,'avg','5m'),(15138,27931,14680,'diff',''),(15139,27931,14680,'strlen',''),(15146,27941,14683,'avg','5m'),(15147,27941,14683,'min','5m'),(15163,27956,14691,'max','#3'),(15164,27957,14692,'min','5m'),(15165,27958,14693,'avg','5m'),(15166,27965,14694,'last',''),(15168,27975,14696,'avg','5m'),(15169,27974,14697,'avg','5m'),(15170,27970,14698,'diff',''),(15171,27970,14698,'strlen',''),(15172,27967,14699,'diff',''),(15173,27967,14699,'strlen',''),(15186,27986,14704,'max','#3'),(15187,27987,14705,'min','5m'),(15188,27988,14706,'avg','5m'),(15189,27995,14707,'last',''),(15191,27999,14709,'diff',''),(15192,27999,14709,'strlen',''),(15193,27998,14710,'diff',''),(15194,27998,14710,'strlen',''),(15195,28003,14711,'avg','5m'),(15196,28004,14712,'avg','5m'),(15209,28015,14717,'max','#3'),(15210,28016,14718,'min','5m'),(15211,28017,14719,'avg','5m'),(15212,28024,14720,'last',''),(15214,28031,14722,'avg','5m'),(15215,28028,14723,'avg','5m'),(15216,28027,14724,'diff',''),(15217,28027,14724,'strlen',''),(15580,28045,14860,'avg','5m'),(15581,28046,14861,'avg','5m'),(15582,28046,14862,'avg','5m'),(15597,28070,14869,'max','#3'),(15598,28071,14870,'min','5m'),(15599,28072,14871,'avg','5m'),(15600,28079,14872,'last',''),(15602,28084,14874,'avg','5m'),(15603,28085,14875,'avg','5m'),(15604,28085,14876,'avg','5m'),(15618,28107,14882,'max','#3'),(15619,28108,14883,'min','5m'),(15620,28109,14884,'avg','5m'),(15621,28116,14885,'last',''),(15678,28130,14906,'max','#3'),(15679,28131,14907,'min','5m'),(15680,28132,14908,'avg','5m'),(15681,28139,14909,'last',''),(15683,28143,14911,'avg','5m'),(15684,28142,14912,'diff',''),(15685,28142,14912,'strlen',''),(15686,28141,14913,'diff',''),(15687,28141,14913,'strlen',''),(15688,28150,14914,'avg','5m'),(15689,28150,14914,'max','5m'),(15690,28150,14915,'avg','5m'),(15691,28150,14915,'max','5m'),(15692,28150,14916,'avg','5m'),(15693,28150,14916,'min','5m'),(15694,28151,14917,'avg','5m'),(15697,28162,14920,'avg','5m'),(15698,28163,14921,'avg','5m'),(15699,28163,14922,'avg','5m'),(15713,28185,14928,'max','#3'),(15714,28186,14929,'min','5m'),(15715,28187,14930,'avg','5m'),(15716,28194,14931,'last',''),(15721,28201,14934,'avg','5m'),(15722,28201,14934,'max','5m'),(15723,28201,14935,'avg','5m'),(15724,28201,14935,'min','5m'),(15726,28204,14937,'diff',''),(15727,28204,14937,'strlen',''),(15729,27030,14939,'last',''),(15730,27607,14940,'last',''),(15731,27032,14941,'last',''),(15732,27191,14942,'last',''),(15733,27332,14943,'last',''),(15734,27461,14944,'last',''),(15735,27531,14945,'last',''),(15736,27567,14946,'last',''),(15737,27630,14947,'last',''),(15738,27653,14948,'last',''),(15739,27733,14949,'last',''),(15740,27799,14950,'last',''),(15741,27955,14951,'last',''),(15742,28069,14952,'last',''),(15743,28129,14953,'last',''),(15744,27038,14954,'avg','5m'),(15745,27054,14955,'avg','5m'),(15746,28052,14956,'avg','5m'),(15747,28091,14957,'avg','5m'),(15748,28169,14958,'avg','5m'),(16352,27143,15161,'max','{$SNMP_TIMEOUT}'),(16353,27618,15162,'max','{$SNMP_TIMEOUT}'),(16354,28025,15163,'max','{$SNMP_TIMEOUT}'),(16375,27154,15170,'max','{$SNMP_TIMEOUT}'),(16376,27202,15171,'max','{$SNMP_TIMEOUT}'),(16377,27235,15172,'max','{$SNMP_TIMEOUT}'),(16378,27271,15173,'max','{$SNMP_TIMEOUT}'),(16379,27292,15174,'max','{$SNMP_TIMEOUT}'),(16380,27343,15175,'max','{$SNMP_TIMEOUT}'),(16381,27375,15176,'max','{$SNMP_TIMEOUT}'),(16382,27472,15177,'max','{$SNMP_TIMEOUT}'),(16383,27506,15178,'max','{$SNMP_TIMEOUT}'),(16384,27542,15179,'max','{$SNMP_TIMEOUT}'),(16385,27578,15180,'max','{$SNMP_TIMEOUT}'),(16386,27641,15181,'max','{$SNMP_TIMEOUT}'),(16387,27664,15182,'max','{$SNMP_TIMEOUT}'),(16388,27744,15183,'max','{$SNMP_TIMEOUT}'),(16389,27776,15184,'max','{$SNMP_TIMEOUT}'),(16390,27810,15185,'max','{$SNMP_TIMEOUT}'),(16391,27892,15186,'max','{$SNMP_TIMEOUT}'),(16392,27929,15187,'max','{$SNMP_TIMEOUT}'),(16393,27966,15188,'max','{$SNMP_TIMEOUT}'),(16394,27996,15189,'max','{$SNMP_TIMEOUT}'),(16395,28080,15190,'max','{$SNMP_TIMEOUT}'),(16396,28117,15191,'max','{$SNMP_TIMEOUT}'),(16397,28140,15192,'max','{$SNMP_TIMEOUT}'),(16398,28195,15193,'max','{$SNMP_TIMEOUT}'),(16445,28210,15208,'diff',''),(16446,28210,15208,'strlen',''),(16447,28208,15209,'diff',''),(16448,28208,15209,'strlen',''),(16457,28218,15214,'avg','5m'),(16458,28218,15214,'min','5m'),(16459,28221,15215,'avg','5m'),(16472,28233,15220,'max','#3'),(16473,28234,15221,'min','5m'),(16474,28235,15222,'avg','5m'),(16475,28242,15223,'last',''),(16476,28243,15224,'max','{$SNMP_TIMEOUT}'),(16477,28246,15225,'avg','5m'),(16484,28247,15228,'avg','5m'),(16818,27213,15330,'count','#1,{$FAN_CRIT_STATUS},eq'),(16819,27479,15331,'count','#1,{$PSU_CRIT_STATUS},eq'),(16820,27479,15332,'count','#1,{$PSU_OK_STATUS},ne'),(16821,27480,15333,'count','#1,{$FAN_CRIT_STATUS},eq'),(16822,27480,15334,'count','#1,{$FAN_OK_STATUS},ne'),(16823,27784,15335,'avg','5m'),(16824,27783,15335,'last','0'),(16825,27784,15335,'max','5m'),(16826,27784,15336,'avg','5m'),(16827,27783,15336,'last','0'),(16828,27784,15336,'max','5m'),(16829,27786,15337,'count','#1,{$PSU_CRIT_STATUS},eq'),(16830,27786,15338,'count','#1,{$PSU_WARN_STATUS},eq'),(16831,27787,15339,'count','#1,{$FAN_CRIT_STATUS},eq'),(16832,27554,15340,'count','#1,{$PSU_CRIT_STATUS},eq'),(16833,27555,15341,'count','#1,{$FAN_CRIT_STATUS},eq'),(16834,27421,15342,'avg','5m'),(16835,27420,15342,'last','0'),(16836,27421,15342,'max','5m'),(16837,27421,15343,'avg','5m'),(16838,27420,15343,'last','0'),(16839,27421,15343,'max','5m'),(16840,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16841,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16842,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16843,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16844,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16845,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16846,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16847,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16848,27430,15348,'avg','5m'),(16849,27429,15348,'last','0'),(16850,27430,15348,'max','5m'),(16851,27447,15349,'avg','5m'),(16852,27446,15349,'last','0'),(16853,27447,15349,'max','5m'),(16854,28218,15350,'avg','5m'),(16855,28217,15350,'last','0'),(16856,28218,15350,'max','5m'),(16857,27430,15351,'avg','5m'),(16858,27429,15351,'last','0'),(16859,27430,15351,'max','5m'),(16860,27447,15352,'avg','5m'),(16861,27446,15352,'last','0'),(16862,27447,15352,'max','5m'),(16863,28218,15353,'avg','5m'),(16864,28217,15353,'last','0'),(16865,28218,15353,'max','5m'),(16866,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16867,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16868,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16869,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16870,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16871,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16872,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16873,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16874,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16875,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16876,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16877,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16878,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16879,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16880,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16881,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16882,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16883,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16884,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16885,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16886,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16887,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16888,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16889,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16890,27518,15366,'count','#1,{$PSU_CRIT_STATUS},eq'),(16891,27519,15367,'count','#1,{$FAN_CRIT_STATUS},eq'),(16892,27584,15368,'avg','5m'),(16893,27585,15368,'last','0'),(16894,27584,15368,'max','5m'),(16895,27593,15369,'count','#1,{$PSU_CRIT_STATUS},eq'),(16896,27595,15370,'count','#1,{$FAN_CRIT_STATUS},eq'),(16897,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"fanError\"},eq'),(16898,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16899,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"psuError\"},eq'),(16900,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"rpsError\"},eq'),(16901,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16902,28154,15373,'count','#1,{$FAN_CRIT_STATUS:\"bad\"},eq'),(16903,28154,15374,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16904,28155,15375,'count','#1,{$PSU_CRIT_STATUS:\"bad\"},eq'),(16905,28155,15376,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16906,27822,15377,'count','#1,{$FAN_CRIT_STATUS},eq'),(16907,27823,15378,'count','#1,{$PSU_CRIT_STATUS},eq'),(16908,27312,15379,'count','#1,{$PSU_CRIT_STATUS},eq'),(16909,27312,15380,'count','#1,{$PSU_OK_STATUS},ne'),(16910,27313,15381,'count','#1,{$FAN_CRIT_STATUS},eq'),(16911,27313,15382,'count','#1,{$FAN_OK_STATUS},ne'),(16912,27316,15383,'count','#1,{$PSU_CRIT_STATUS},eq'),(16913,27316,15384,'count','#1,{$PSU_OK_STATUS},ne'),(16914,27317,15385,'count','#1,{$FAN_CRIT_STATUS},eq'),(16915,27317,15386,'count','#1,{$FAN_OK_STATUS},ne'),(16916,28201,15387,'avg','5m'),(16917,28200,15387,'last','0'),(16918,28201,15387,'max','5m'),(16919,28202,15388,'count','#1,{$FAN_CRIT_STATUS},eq'),(16920,28206,15389,'count','#1,{$PSU_CRIT_STATUS},eq'),(16921,27247,15390,'avg','5m'),(16922,27246,15390,'last','0'),(16923,27247,15390,'max','5m'),(16924,27248,15391,'count','#1,{$PSU_CRIT_STATUS},eq'),(16925,27248,15392,'count','#1,{$PSU_OK_STATUS},ne'),(16926,27250,15393,'count','#1,{$FAN_CRIT_STATUS},eq'),(16927,27250,15394,'count','#1,{$FAN_OK_STATUS},ne'),(16928,27755,15395,'count','#1,{$FAN_CRIT_STATUS},eq'),(16929,27941,15396,'avg','5m'),(16930,27940,15396,'last','0'),(16931,27941,15396,'max','5m'),(16932,27941,15397,'avg','5m'),(16933,27940,15397,'last','0'),(16934,27941,15397,'max','5m'),(16935,27942,15398,'count','#1,{$FAN_CRIT_STATUS:\"failed\"},eq'),(16936,27943,15399,'count','#1,{$PSU_CRIT_STATUS:\"failed\"},eq'),(17237,27077,15490,'last',''),(17238,27077,15490,'diff',''),(17241,27604,15492,'last',''),(17242,27604,15492,'diff',''),(17243,28013,15493,'last',''),(17244,28013,15493,'diff',''),(17249,27087,15496,'last',''),(17250,27087,15496,'diff',''),(17253,27627,15498,'last',''),(17254,27627,15498,'diff',''),(17255,27984,15499,'last',''),(17256,27984,15499,'diff',''),(17261,27127,15502,'last',''),(17262,27127,15502,'diff',''),(17265,28105,15504,'last',''),(17266,28105,15504,'diff',''),(17269,27097,15506,'last',''),(17270,27097,15506,'diff',''),(17273,27107,15508,'last',''),(17274,27107,15508,'diff',''),(17277,27188,15510,'last',''),(17278,27188,15510,'diff',''),(17279,27223,15511,'last',''),(17280,27223,15511,'diff',''),(17281,27259,15512,'last',''),(17282,27259,15512,'diff',''),(17283,27280,15513,'last',''),(17284,27280,15513,'diff',''),(17285,27329,15514,'last',''),(17286,27329,15514,'diff',''),(17287,27458,15515,'last',''),(17288,27458,15515,'diff',''),(17289,27494,15516,'last',''),(17290,27494,15516,'diff',''),(17291,27528,15517,'last',''),(17292,27528,15517,'diff',''),(17293,27564,15518,'last',''),(17294,27564,15518,'diff',''),(17295,27650,15519,'last',''),(17296,27650,15519,'diff',''),(17297,27730,15520,'last',''),(17298,27730,15520,'diff',''),(17299,27764,15521,'last',''),(17300,27764,15521,'diff',''),(17301,27796,15522,'last',''),(17302,27796,15522,'diff',''),(17303,27880,15523,'last',''),(17304,27880,15523,'diff',''),(17305,27917,15524,'last',''),(17306,27917,15524,'diff',''),(17307,27952,15525,'last',''),(17308,27952,15525,'diff',''),(17309,28066,15526,'last',''),(17310,28066,15526,'diff',''),(17311,28126,15527,'last',''),(17312,28126,15527,'diff',''),(17313,28183,15528,'last',''),(17314,28183,15528,'diff',''),(17315,28231,15529,'last',''),(17316,28231,15529,'diff',''),(17357,27074,15550,'avg','15m'),(17358,27071,15550,'last',''),(17359,27075,15550,'avg','15m'),(17360,27076,15551,'avg','5m'),(17361,27073,15551,'avg','5m'),(17362,27071,15552,'change',''),(17363,27071,15552,'last',''),(17364,27070,15552,'last',''),(17365,27077,15552,'last',''),(17366,27071,15552,'prev',''),(17367,27599,15553,'avg','15m'),(17368,27603,15553,'last',''),(17369,27602,15553,'avg','15m'),(17370,28008,15554,'avg','15m'),(17371,28012,15554,'last',''),(17372,28011,15554,'avg','15m'),(17373,27598,15555,'avg','5m'),(17374,27601,15555,'avg','5m'),(17375,28007,15556,'avg','5m'),(17376,28010,15556,'avg','5m'),(17377,27603,15557,'change',''),(17378,27603,15557,'last',''),(17379,27605,15557,'last',''),(17380,27604,15557,'last',''),(17381,27603,15557,'prev',''),(17382,28012,15558,'change',''),(17383,28012,15558,'last',''),(17384,28014,15558,'last',''),(17385,28013,15558,'last',''),(17386,28012,15558,'prev',''),(17387,27084,15559,'avg','15m'),(17388,27081,15559,'last',''),(17389,27085,15559,'avg','15m'),(17390,27086,15560,'avg','5m'),(17391,27083,15560,'avg','5m'),(17392,27081,15561,'change',''),(17393,27081,15561,'last',''),(17394,27080,15561,'last',''),(17395,27087,15561,'last',''),(17396,27081,15561,'prev',''),(17397,27622,15562,'avg','15m'),(17398,27626,15562,'last',''),(17399,27625,15562,'avg','15m'),(17400,27979,15563,'avg','15m'),(17401,27983,15563,'last',''),(17402,27982,15563,'avg','15m'),(17403,27621,15564,'avg','5m'),(17404,27624,15564,'avg','5m'),(17405,27978,15565,'avg','5m'),(17406,27981,15565,'avg','5m'),(17407,27626,15566,'change',''),(17408,27626,15566,'last',''),(17409,27628,15566,'last',''),(17410,27627,15566,'last',''),(17411,27626,15566,'prev',''),(17412,27983,15567,'change',''),(17413,27983,15567,'last',''),(17414,27985,15567,'last',''),(17415,27984,15567,'last',''),(17416,27983,15567,'prev',''),(17417,27124,15568,'avg','15m'),(17418,27121,15568,'last',''),(17419,27125,15568,'avg','15m'),(17420,27126,15569,'avg','5m'),(17421,27123,15569,'avg','5m'),(17422,27121,15570,'change',''),(17423,27121,15570,'last',''),(17424,27120,15570,'last',''),(17425,27127,15570,'last',''),(17426,27121,15570,'prev',''),(17427,28100,15571,'avg','15m'),(17428,28104,15571,'last',''),(17429,28103,15571,'avg','15m'),(17430,28099,15572,'avg','5m'),(17431,28102,15572,'avg','5m'),(17432,28104,15573,'change',''),(17433,28104,15573,'last',''),(17434,28106,15573,'last',''),(17435,28105,15573,'last',''),(17436,28104,15573,'prev',''),(17437,27094,15574,'avg','15m'),(17438,27091,15574,'last',''),(17439,27095,15574,'avg','15m'),(17440,27096,15575,'avg','5m'),(17441,27093,15575,'avg','5m'),(17442,27091,15576,'change',''),(17443,27091,15576,'last',''),(17444,27090,15576,'last',''),(17445,27097,15576,'last',''),(17446,27091,15576,'prev',''),(17447,27104,15577,'avg','15m'),(17448,27101,15577,'last',''),(17449,27105,15577,'avg','15m'),(17450,27106,15578,'avg','5m'),(17451,27103,15578,'avg','5m'),(17452,27101,15579,'change',''),(17453,27101,15579,'last',''),(17454,27100,15579,'last',''),(17455,27107,15579,'last',''),(17456,27101,15579,'prev',''),(17457,27183,15580,'avg','15m'),(17458,27187,15580,'last',''),(17459,27186,15580,'avg','15m'),(17460,27218,15581,'avg','15m'),(17461,27222,15581,'last',''),(17462,27221,15581,'avg','15m'),(17463,27254,15582,'avg','15m'),(17464,27258,15582,'last',''),(17465,27257,15582,'avg','15m'),(17466,27275,15583,'avg','15m'),(17467,27279,15583,'last',''),(17468,27278,15583,'avg','15m'),(17469,27324,15584,'avg','15m'),(17470,27328,15584,'last',''),(17471,27327,15584,'avg','15m'),(17472,27453,15585,'avg','15m'),(17473,27457,15585,'last',''),(17474,27456,15585,'avg','15m'),(17475,27489,15586,'avg','15m'),(17476,27493,15586,'last',''),(17477,27492,15586,'avg','15m'),(17478,27523,15587,'avg','15m'),(17479,27527,15587,'last',''),(17480,27526,15587,'avg','15m'),(17481,27559,15588,'avg','15m'),(17482,27563,15588,'last',''),(17483,27562,15588,'avg','15m'),(17484,27645,15589,'avg','15m'),(17485,27649,15589,'last',''),(17486,27648,15589,'avg','15m'),(17487,27725,15590,'avg','15m'),(17488,27729,15590,'last',''),(17489,27728,15590,'avg','15m'),(17490,27759,15591,'avg','15m'),(17491,27763,15591,'last',''),(17492,27762,15591,'avg','15m'),(17493,27791,15592,'avg','15m'),(17494,27795,15592,'last',''),(17495,27794,15592,'avg','15m'),(17496,27875,15593,'avg','15m'),(17497,27879,15593,'last',''),(17498,27878,15593,'avg','15m'),(17499,27912,15594,'avg','15m'),(17500,27916,15594,'last',''),(17501,27915,15594,'avg','15m'),(17502,27947,15595,'avg','15m'),(17503,27951,15595,'last',''),(17504,27950,15595,'avg','15m'),(17505,28061,15596,'avg','15m'),(17506,28065,15596,'last',''),(17507,28064,15596,'avg','15m'),(17508,28121,15597,'avg','15m'),(17509,28125,15597,'last',''),(17510,28124,15597,'avg','15m'),(17511,28178,15598,'avg','15m'),(17512,28182,15598,'last',''),(17513,28181,15598,'avg','15m'),(17514,28226,15599,'avg','15m'),(17515,28230,15599,'last',''),(17516,28229,15599,'avg','15m'),(17517,27182,15600,'avg','5m'),(17518,27185,15600,'avg','5m'),(17519,27217,15601,'avg','5m'),(17520,27220,15601,'avg','5m'),(17521,27253,15602,'avg','5m'),(17522,27256,15602,'avg','5m'),(17523,27274,15603,'avg','5m'),(17524,27277,15603,'avg','5m'),(17525,27323,15604,'avg','5m'),(17526,27326,15604,'avg','5m'),(17527,27452,15605,'avg','5m'),(17528,27455,15605,'avg','5m'),(17529,27488,15606,'avg','5m'),(17530,27491,15606,'avg','5m'),(17531,27522,15607,'avg','5m'),(17532,27525,15607,'avg','5m'),(17533,27558,15608,'avg','5m'),(17534,27561,15608,'avg','5m'),(17535,27644,15609,'avg','5m'),(17536,27647,15609,'avg','5m'),(17537,27724,15610,'avg','5m'),(17538,27727,15610,'avg','5m'),(17539,27758,15611,'avg','5m'),(17540,27761,15611,'avg','5m'),(17541,27790,15612,'avg','5m'),(17542,27793,15612,'avg','5m'),(17543,27874,15613,'avg','5m'),(17544,27877,15613,'avg','5m'),(17545,27911,15614,'avg','5m'),(17546,27914,15614,'avg','5m'),(17547,27946,15615,'avg','5m'),(17548,27949,15615,'avg','5m'),(17549,28060,15616,'avg','5m'),(17550,28063,15616,'avg','5m'),(17551,28120,15617,'avg','5m'),(17552,28123,15617,'avg','5m'),(17553,28177,15618,'avg','5m'),(17554,28180,15618,'avg','5m'),(17555,28225,15619,'avg','5m'),(17556,28228,15619,'avg','5m'),(17557,27187,15620,'change',''),(17558,27187,15620,'last',''),(17559,27189,15620,'last',''),(17560,27188,15620,'last',''),(17561,27187,15620,'prev',''),(17562,27222,15621,'change',''),(17563,27222,15621,'last',''),(17564,27224,15621,'last',''),(17565,27223,15621,'last',''),(17566,27222,15621,'prev',''),(17567,27258,15622,'change',''),(17568,27258,15622,'last',''),(17569,27260,15622,'last',''),(17570,27259,15622,'last',''),(17571,27258,15622,'prev',''),(17572,27279,15623,'change',''),(17573,27279,15623,'last',''),(17574,27281,15623,'last',''),(17575,27280,15623,'last',''),(17576,27279,15623,'prev',''),(17577,27328,15624,'change',''),(17578,27328,15624,'last',''),(17579,27330,15624,'last',''),(17580,27329,15624,'last',''),(17581,27328,15624,'prev',''),(17582,27457,15625,'change',''),(17583,27457,15625,'last',''),(17584,27459,15625,'last',''),(17585,27458,15625,'last',''),(17586,27457,15625,'prev',''),(17587,27493,15626,'change',''),(17588,27493,15626,'last',''),(17589,27495,15626,'last',''),(17590,27494,15626,'last',''),(17591,27493,15626,'prev',''),(17592,27527,15627,'change',''),(17593,27527,15627,'last',''),(17594,27529,15627,'last',''),(17595,27528,15627,'last',''),(17596,27527,15627,'prev',''),(17597,27563,15628,'change',''),(17598,27563,15628,'last',''),(17599,27565,15628,'last',''),(17600,27564,15628,'last',''),(17601,27563,15628,'prev',''),(17602,27649,15629,'change',''),(17603,27649,15629,'last',''),(17604,27651,15629,'last',''),(17605,27650,15629,'last',''),(17606,27649,15629,'prev',''),(17607,27729,15630,'change',''),(17608,27729,15630,'last',''),(17609,27731,15630,'last',''),(17610,27730,15630,'last',''),(17611,27729,15630,'prev',''),(17612,27763,15631,'change',''),(17613,27763,15631,'last',''),(17614,27765,15631,'last',''),(17615,27764,15631,'last',''),(17616,27763,15631,'prev',''),(17617,27795,15632,'change',''),(17618,27795,15632,'last',''),(17619,27797,15632,'last',''),(17620,27796,15632,'last',''),(17621,27795,15632,'prev',''),(17622,27879,15633,'change',''),(17623,27879,15633,'last',''),(17624,27881,15633,'last',''),(17625,27880,15633,'last',''),(17626,27879,15633,'prev',''),(17627,27916,15634,'change',''),(17628,27916,15634,'last',''),(17629,27918,15634,'last',''),(17630,27917,15634,'last',''),(17631,27916,15634,'prev',''),(17632,27951,15635,'change',''),(17633,27951,15635,'last',''),(17634,27953,15635,'last',''),(17635,27952,15635,'last',''),(17636,27951,15635,'prev',''),(17637,28065,15636,'change',''),(17638,28065,15636,'last',''),(17639,28067,15636,'last',''),(17640,28066,15636,'last',''),(17641,28065,15636,'prev',''),(17642,28125,15637,'change',''),(17643,28125,15637,'last',''),(17644,28127,15637,'last',''),(17645,28126,15637,'last',''),(17646,28125,15637,'prev',''),(17647,28182,15638,'change',''),(17648,28182,15638,'last',''),(17649,28184,15638,'last',''),(17650,28183,15638,'last',''),(17651,28182,15638,'prev',''),(17652,28230,15639,'change',''),(17653,28230,15639,'last',''),(17654,28232,15639,'last',''),(17655,28231,15639,'last',''),(17656,28230,15639,'prev',''),(17657,28251,15640,'min','10m'),(17658,28250,15641,'avg','10m');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `graphcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gridcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `textcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `colorpalette` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB','1A7C11,F63100,2774A4,A54F10,FC6EA3,6C59DC,AC8C14,611F27,F230E0,5CCD18,BB2A02,5A2B57,89ABF8,7EC25C,274482,2B5429,8048B4,FD5434,790E1F,87AC4D,E89DF4'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333','199C0D,F63100,2774A4,F7941D,FC6EA3,6C59DC,C7A72D,BA2A5D,F230E0,5CCD18,BB2A02,AC41A5,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4'),(3,'hc-light','FFFFFF','FFFFFF','555555','000000','333333','000000','333333','000000','000000','EBEBEB','1A7C11,F63100,2774A4,A54F10,FC6EA3,6C59DC,AC8C14,611F27,F230E0,5CCD18,BB2A02,5A2B57,89ABF8,7EC25C,274482,2B5429,8048B4,FD5434,790E1F,87AC4D,E89DF4'),(4,'hc-dark','000000','000000','666666','888888','4F4F4F','FFFFFF','FFFFFF','FFFFFF','FFFFFF','333333','199C0D,F63100,2774A4,F7941D,FC6EA3,6C59DC,C7A72D,BA2A5D,F230E0,5CCD18,BB2A02,AC41A5,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (387,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(392,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(404,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(406,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(410,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(420,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(433,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(436,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(439,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(442,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(456,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(457,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(458,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(459,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(461,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(462,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(463,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(464,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(465,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(467,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(469,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(471,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(472,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(473,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(474,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(475,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(478,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(479,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(480,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(481,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(482,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(483,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(484,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(485,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(487,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(491,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(492,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(493,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(494,'Network traffic on en0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(495,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(496,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(497,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(498,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(517,'Zabbix internal process busy %',900,200,0.0000,100.0000,406,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(518,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,404,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(519,'Zabbix server performance',900,200,0.0000,100.0000,392,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(520,'Zabbix cache usage, % free',900,200,0.0000,100.0000,410,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(521,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,420,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(522,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,442,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(523,'CPU jumps',900,200,0.0000,100.0000,439,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(524,'CPU load',900,200,0.0000,100.0000,433,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(525,'CPU utilization',900,200,0.0000,100.0000,387,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(526,'Swap usage',600,340,0.0000,100.0000,436,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(527,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(528,'Value cache effectiveness',900,200,0.0000,100.0000,527,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(529,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(530,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(531,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(532,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(533,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,10026,0),(534,'Memory usage',900,200,0.0000,100.0000,533,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23317,0),(540,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22943,0),(541,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22903,0),(542,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22983,0),(543,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23063,0),(544,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22863,0),(545,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23023,0),(546,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23159,0),(634,'http-8080 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(635,'http-8443 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(636,'jk-8009 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(637,'sessions /',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(638,'Class Loader',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(639,'File Descriptors',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(640,'Garbage Collector collections per second',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(641,'Memory Pool CMS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(642,'Memory Pool CMS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(643,'Memory Pool Code Cache',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(644,'Memory Pool Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(645,'Memory Pool PS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(646,'Memory Pool PS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(647,'Memory Pool Tenured Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(648,'Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(649,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(650,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(651,'Fan speed and ambient temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(652,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(653,'Fan speed and temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(654,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(655,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(657,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(668,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(669,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(671,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(672,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(675,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(676,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(677,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(678,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(679,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(680,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(683,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(684,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(686,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(687,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(688,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,687,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(691,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(692,'CPU utilization',900,200,0.0000,100.0000,691,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(694,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(695,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(697,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(698,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(700,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(701,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(703,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(704,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(708,'{#MODULE_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(709,'{#MODULE_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(714,'{#ENT_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(715,'{#ENT_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(718,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(719,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(724,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(725,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(727,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(728,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(730,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(731,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(733,'#{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(734,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(736,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(737,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(738,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(739,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(740,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(741,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(742,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(743,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(744,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(745,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(746,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(747,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(748,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(749,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(750,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(752,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(753,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(754,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(755,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(756,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(758,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(759,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(760,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(762,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(763,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(764,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(766,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(767,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(769,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(770,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(772,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,766,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(773,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(774,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(775,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(776,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(778,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(779,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(780,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(781,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(782,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(783,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(784,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(785,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(786,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(787,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,786,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(788,'Zabbix preprocessing queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(789,'Zabbix preprocessing queue',900,200,0.0000,100.0000,788,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (2092,634,26832,0,0,'C80000',0,2,0),(2093,634,26831,0,1,'00C800',0,2,0),(2094,634,26826,0,2,'0000C8',0,2,0),(2095,635,26836,0,0,'C80000',0,2,0),(2096,635,26838,0,1,'00C800',0,2,0),(2097,635,26837,0,2,'0000C8',0,2,0),(2098,636,26834,0,0,'C80000',0,2,0),(2099,636,26833,0,1,'00C800',0,2,0),(2100,636,26835,0,2,'0000C8',0,2,0),(2101,637,26830,0,0,'C80000',0,2,0),(2102,637,26840,0,1,'00C800',0,2,0),(2103,637,26839,0,2,'0000C8',0,2,0),(2104,638,26892,0,0,'C80000',0,2,0),(2105,638,26891,0,1,'00C800',0,2,0),(2106,638,26910,0,2,'0000C8',0,2,0),(2107,639,26879,0,0,'C80000',0,2,0),(2108,639,26880,0,1,'00C800',0,2,0),(2109,640,26906,0,0,'C80000',0,2,0),(2110,640,26895,0,1,'00C800',0,2,0),(2111,640,26889,0,2,'0000C8',0,2,0),(2112,640,26884,0,3,'C8C800',0,2,0),(2113,640,26896,0,4,'00C8C9',0,2,0),(2114,640,26887,0,5,'C800C8',0,2,0),(2115,641,26900,0,0,'C80000',0,2,0),(2116,641,26901,0,1,'00C800',0,2,0),(2117,641,26902,0,2,'0000C8',0,2,0),(2118,642,26883,0,0,'C80000',0,2,0),(2119,642,26882,0,1,'00C800',0,2,0),(2120,642,26864,0,2,'0000C8',0,2,0),(2121,643,26863,0,0,'C80000',0,2,0),(2122,643,26865,0,1,'00C800',0,2,0),(2123,643,26866,0,2,'0000C8',0,2,0),(2124,644,26867,0,0,'C80000',0,2,0),(2125,644,26862,0,1,'00C800',0,2,0),(2126,644,26861,0,2,'0000C8',0,2,0),(2127,645,26857,0,0,'C80000',0,2,0),(2128,645,26856,0,1,'00C800',0,2,0),(2129,645,26858,0,2,'0000C8',0,2,0),(2130,646,26859,0,0,'0000C8',0,2,0),(2131,646,26860,0,1,'C80000',0,2,0),(2132,646,26868,0,2,'00C800',0,2,0),(2133,647,26869,0,0,'C80000',0,2,0),(2134,647,26878,0,1,'00C800',0,2,0),(2135,647,26877,0,2,'0000C8',0,2,0),(2136,648,26872,0,0,'C80000',0,2,0),(2137,648,26870,0,1,'00C800',0,2,0),(2138,648,26873,0,2,'0000C8',0,2,0),(2139,529,23357,0,0,'DD0000',0,2,0),(2140,529,23341,0,1,'00DDDD',0,2,0),(2141,529,23342,0,2,'3333FF',0,2,0),(2142,530,23345,0,0,'990099',0,2,0),(2143,530,23348,0,1,'990000',0,2,0),(2144,530,23355,0,2,'0000EE',0,2,0),(2145,530,23352,0,3,'FF33FF',0,2,0),(2146,530,23356,0,4,'007700',0,2,0),(2147,530,23354,0,5,'003300',0,2,0),(2148,530,23346,0,6,'33FFFF',0,2,0),(2149,530,23349,0,7,'DD0000',0,2,0),(2150,530,23344,0,8,'000099',0,7,0),(2151,531,23353,0,0,'FFAA00',0,2,0),(2152,531,23347,0,1,'990099',0,2,0),(2153,531,23350,0,2,'EE0000',0,2,0),(2154,531,23343,0,3,'FF66FF',0,2,0),(2155,531,23351,0,4,'960000',0,2,0),(2156,531,23360,0,5,'007700',0,2,0),(2157,531,25369,0,6,'009999',0,2,0),(2158,531,25368,0,6,'BBBB00',0,2,0),(2159,532,23340,5,0,'00C800',0,2,0),(2160,532,23358,5,1,'C80000',1,2,0),(2227,649,26920,5,0,'00AA00',0,2,0),(2228,649,26919,5,1,'3333FF',0,2,0),(2229,650,26921,0,0,'C8C800',0,2,0),(2230,650,26922,0,1,'006400',0,2,0),(2231,650,26923,0,2,'C80000',0,2,0),(2232,650,26918,0,3,'0000EE',0,2,0),(2233,650,26917,0,4,'640000',0,2,0),(2234,650,26912,0,5,'00C800',0,2,0),(2235,650,26911,0,6,'C800C8',0,2,0),(2236,472,22945,5,0,'00AA00',0,2,0),(2237,472,22946,5,1,'3333FF',0,2,0),(2238,473,22950,0,0,'C80000',0,2,2),(2239,473,22948,0,1,'00C800',0,2,0),(2240,471,22924,0,0,'009900',0,2,0),(2241,471,22920,0,1,'000099',0,2,0),(2242,469,22922,0,0,'009900',0,2,0),(2243,469,22923,0,1,'000099',0,2,0),(2244,469,22921,0,2,'990000',0,2,0),(2245,498,23109,0,0,'009999',0,2,0),(2246,498,23112,0,1,'990099',0,2,0),(2247,498,23115,0,2,'999900',0,2,0),(2248,498,23113,0,3,'990000',0,2,0),(2249,498,23114,0,4,'000099',0,2,0),(2250,498,23110,0,5,'009900',0,2,0),(2251,540,22942,5,0,'00C800',0,2,0),(2252,492,23073,5,0,'00AA00',0,2,0),(2253,492,23074,5,1,'3333FF',0,2,0),(2254,467,22910,0,0,'C80000',0,2,2),(2255,467,22908,0,1,'00C800',0,2,0),(2256,465,22884,0,0,'009900',0,2,0),(2257,465,22880,0,1,'000099',0,2,0),(2258,463,22882,0,0,'009900',0,2,0),(2259,463,22883,0,1,'000099',0,2,0),(2260,463,22881,0,2,'990000',0,2,0),(2261,462,22886,1,0,'009999',0,2,0),(2262,462,22888,1,1,'990099',0,2,0),(2263,462,22891,1,2,'990000',0,2,0),(2264,462,22892,1,3,'000099',0,2,0),(2265,462,22885,1,4,'009900',0,2,0),(2266,541,22902,5,0,'00C800',0,2,0),(2267,464,22897,0,0,'AA0000',0,2,2),(2268,464,22895,0,1,'00AA00',0,2,0),(2269,478,22985,5,0,'00AA00',0,2,0),(2270,478,22986,5,1,'3333FF',0,2,0),(2271,479,22990,0,0,'C80000',0,2,2),(2272,479,22988,0,1,'00C800',0,2,0),(2273,475,22962,0,0,'009900',0,2,0),(2274,475,22963,0,1,'000099',0,2,0),(2275,475,22961,0,2,'990000',0,2,0),(2276,474,22968,1,0,'990099',0,2,0),(2277,474,22971,1,1,'990000',0,2,0),(2278,474,22972,1,2,'000099',0,2,0),(2279,474,22965,1,3,'009900',0,2,0),(2280,542,22982,5,0,'00C800',0,2,0),(2281,420,22446,5,0,'00AA00',0,2,0),(2282,420,22448,5,1,'3333FF',0,2,0),(2283,521,23280,5,0,'00AA00',0,2,0),(2284,521,23281,5,1,'3333FF',0,2,0),(2285,442,22456,0,0,'C80000',0,2,2),(2286,442,22452,0,1,'00C800',0,2,0),(2287,522,23285,0,0,'C80000',0,2,2),(2288,522,23283,0,1,'00C800',0,2,0),(2289,439,22680,0,0,'009900',0,2,0),(2290,439,22683,0,1,'000099',0,2,0),(2291,523,23298,0,0,'009900',0,2,0),(2292,523,23294,0,1,'000099',0,2,0),(2293,433,10010,0,0,'009900',0,2,0),(2294,433,22674,0,1,'000099',0,2,0),(2295,433,22677,0,2,'990000',0,2,0),(2296,524,23296,0,0,'009900',0,2,0),(2297,524,23297,0,1,'000099',0,2,0),(2298,524,23295,0,2,'990000',0,2,0),(2299,387,22665,1,0,'FF5555',0,2,0),(2300,387,22668,1,1,'55FF55',0,2,0),(2301,387,22671,1,2,'009999',0,2,0),(2302,387,17358,1,3,'990099',0,2,0),(2303,387,17362,1,4,'999900',0,2,0),(2304,387,17360,1,5,'990000',0,2,0),(2305,387,17356,1,6,'000099',0,2,0),(2306,387,17354,1,7,'009900',0,2,0),(2307,525,23304,1,0,'FF5555',0,2,0),(2308,525,23303,1,1,'55FF55',0,2,0),(2309,525,23300,1,2,'009999',0,2,0),(2310,525,23302,1,3,'990099',0,2,0),(2311,525,23301,1,4,'999900',0,2,0),(2312,525,23305,1,5,'990000',0,2,0),(2313,525,23306,1,6,'000099',0,2,0),(2314,525,23299,1,7,'009900',0,2,0),(2315,533,22181,5,0,'00C800',0,2,0),(2316,534,23316,5,0,'00C800',0,2,0),(2317,436,10030,0,0,'AA0000',0,2,2),(2318,436,10014,0,1,'00AA00',0,2,0),(2319,526,23311,0,0,'AA0000',0,2,2),(2320,526,23309,0,1,'00AA00',0,2,0),(2321,491,23070,0,0,'C80000',0,2,2),(2322,491,23068,0,1,'00C800',0,2,0),(2323,487,23042,0,0,'009900',0,2,0),(2324,487,23043,0,1,'000099',0,2,0),(2325,487,23041,0,2,'990000',0,2,0),(2326,543,23062,5,0,'00C800',0,2,0),(2327,494,23077,5,0,'00AA00',0,2,0),(2328,494,23078,5,1,'3333FF',0,2,0),(2329,493,23075,5,0,'00AA00',0,2,0),(2330,493,23076,5,1,'3333FF',0,2,0),(2331,461,22870,0,0,'C80000',0,2,2),(2332,461,22868,0,1,'00C800',0,2,0),(2333,459,22844,0,0,'009900',0,2,0),(2334,459,22840,0,1,'000099',0,2,0),(2335,457,22842,0,0,'009900',0,2,0),(2336,457,22843,0,1,'000099',0,2,0),(2337,457,22841,0,2,'990000',0,2,0),(2338,456,22846,1,0,'009999',0,2,0),(2339,456,22848,1,1,'990099',0,2,0),(2340,456,22851,1,2,'990000',0,2,0),(2341,456,22852,1,3,'000099',0,2,0),(2342,456,22845,1,4,'009900',0,2,0),(2343,544,22862,5,0,'00C800',0,2,0),(2344,458,22857,0,0,'AA0000',0,2,2),(2345,458,22855,0,1,'00AA00',0,2,0),(2346,484,23025,5,0,'00AA00',0,2,0),(2347,484,23026,5,1,'3333FF',0,2,0),(2348,485,23030,0,0,'C80000',0,2,2),(2349,485,23028,0,1,'00C800',0,2,0),(2350,483,23004,0,0,'009900',0,2,0),(2351,483,23000,0,1,'000099',0,2,0),(2352,481,23002,0,0,'009900',0,2,0),(2353,481,23003,0,1,'000099',0,2,0),(2354,481,23001,0,2,'990000',0,2,0),(2355,480,23007,1,0,'999900',0,2,0),(2356,480,23011,1,1,'990000',0,2,0),(2357,480,23012,1,2,'000099',0,2,0),(2358,480,23005,1,3,'009900',0,2,0),(2359,545,23022,5,0,'00C800',0,2,0),(2360,482,23017,0,0,'AA0000',0,2,2),(2361,482,23015,0,1,'00AA00',0,2,0),(2362,497,23169,5,0,'00AA00',0,2,0),(2363,497,23170,5,1,'3333FF',0,2,0),(2364,496,23167,0,0,'C80000',0,2,2),(2365,496,23164,0,1,'00C800',0,2,0),(2366,495,23143,0,0,'009900',0,2,0),(2367,495,23145,0,1,'000099',0,2,0),(2368,495,23144,0,2,'990000',0,2,0),(2369,546,23158,5,0,'00C800',0,2,0),(2370,651,26928,5,0,'EE0000',0,2,0),(2371,651,26927,0,1,'000000',1,2,0),(2372,652,26925,2,0,'880000',0,2,0),(2373,652,26932,0,1,'009900',0,2,0),(2374,652,26930,0,2,'00CCCC',0,2,0),(2375,652,26931,0,3,'000000',0,2,0),(2376,652,26929,0,4,'3333FF',0,2,0),(2377,652,26926,0,5,'777700',0,2,0),(2378,653,26933,2,0,'EE0000',0,2,0),(2379,653,26943,2,1,'EE00EE',0,2,0),(2380,653,26935,0,2,'000000',1,2,0),(2381,653,26936,4,3,'000000',1,2,0),(2382,654,26934,2,0,'880000',0,2,0),(2383,654,26939,0,1,'009900',0,2,0),(2384,654,26942,0,2,'00CCCC',0,2,0),(2385,654,26938,0,3,'000000',0,2,0),(2386,654,26937,0,4,'3333FF',0,2,0),(4474,788,28248,5,0,'1A7C11',0,2,0),(4475,789,28249,5,0,'1A7C11',0,2,0),(4476,527,22199,0,0,'C80000',0,2,0),(4477,527,22196,0,1,'00C800',0,2,0),(4478,528,23628,0,0,'C80000',0,2,0),(4479,528,23625,0,1,'00C800',0,2,0),(4480,410,22185,0,0,'007700',0,2,0),(4481,410,22189,0,1,'DD0000',0,2,0),(4482,410,22396,0,2,'00DDDD',0,2,0),(4483,410,22183,0,3,'3333FF',0,2,0),(4484,410,22191,0,4,'999900',0,2,0),(4485,410,23634,0,5,'00FF00',0,2,0),(4486,520,23276,0,0,'007700',0,2,0),(4487,520,23273,0,1,'DD0000',0,2,0),(4488,520,23275,0,2,'00DDDD',0,2,0),(4489,520,23274,0,3,'3333FF',0,2,0),(4490,520,23620,0,4,'999900',0,2,0),(4491,520,23635,0,5,'00FF00',0,2,0),(4492,404,22404,0,0,'990099',0,2,0),(4493,404,22399,0,1,'990000',0,2,0),(4494,404,22416,0,2,'0000EE',0,2,0),(4495,404,22430,0,3,'FF33FF',0,2,0),(4496,404,22418,0,4,'007700',0,2,0),(4497,404,22402,0,5,'003300',0,2,0),(4498,404,22420,0,6,'CCCC00',0,2,0),(4499,404,22400,0,7,'33FFFF',0,2,0),(4500,404,22689,0,8,'DD0000',0,2,0),(4501,404,23171,0,9,'000099',0,2,0),(4502,404,22401,0,10,'00FF00',0,2,0),(4503,518,23269,0,0,'990099',0,2,0),(4504,518,23264,0,1,'990000',0,2,0),(4505,518,23261,0,2,'0000EE',0,2,0),(4506,518,23255,0,3,'FF33FF',0,2,0),(4507,518,23260,0,4,'007700',0,2,0),(4508,518,23259,0,5,'003300',0,2,0),(4509,518,23265,0,6,'CCCC00',0,2,0),(4510,518,23270,0,7,'33FFFF',0,2,0),(4511,518,23262,0,8,'DD0000',0,2,0),(4512,518,23267,0,9,'000099',0,2,0),(4513,518,23328,0,10,'00FF00',0,2,0),(4514,406,22426,0,0,'00EE00',0,2,0),(4515,406,22422,0,1,'0000EE',0,2,0),(4516,406,22408,0,2,'FFAA00',0,2,0),(4517,406,22424,0,3,'00EEEE',0,2,0),(4518,406,22412,0,4,'990099',0,2,0),(4519,406,22406,0,5,'EE0000',0,2,0),(4520,406,22414,0,6,'FF66FF',0,2,0),(4521,406,23663,0,7,'009999',0,2,0),(4522,406,25366,0,8,'BBBB00',0,2,0),(4523,406,25370,0,9,'AA0000',0,2,0),(4524,406,25665,0,10,'990000',0,2,0),(4525,406,25666,0,11,'008800',0,2,0),(4526,517,23268,0,0,'00EE00',0,2,0),(4527,517,23256,0,1,'0000EE',0,2,0),(4528,517,23258,0,2,'FFAA00',0,2,0),(4529,517,23252,0,3,'00EEEE',0,2,0),(4530,517,23253,0,4,'990099',0,2,0),(4531,517,23257,0,5,'EE0000',0,2,0),(4532,517,23266,0,6,'FF66FF',0,2,0),(4533,517,23664,0,7,'009999',0,2,0),(4534,517,25367,0,8,'BBBB00',0,2,0),(4535,517,25371,0,9,'AA0000',0,2,0),(4536,517,25667,0,10,'990000',0,2,0),(4537,517,25668,0,11,'008800',0,2,0),(4538,392,22187,5,0,'00C800',0,2,0),(4539,392,23251,5,1,'C80000',1,2,0),(4540,519,23277,5,0,'00C800',0,2,0),(4541,519,23272,5,1,'C80000',1,2,0),(5348,738,27074,5,0,'1A7C11',0,2,0),(5349,738,27075,2,1,'2774A4',0,2,0),(5350,738,27073,0,2,'F63100',1,2,0),(5351,738,27076,0,3,'A54F10',1,2,0),(5352,738,27072,0,4,'FC6EA3',1,2,0),(5353,738,27069,0,5,'6C59DC',1,2,0),(5354,739,27599,5,0,'1A7C11',0,2,0),(5355,739,27602,2,1,'2774A4',0,2,0),(5356,739,27601,0,2,'F63100',1,2,0),(5357,739,27598,0,3,'A54F10',1,2,0),(5358,739,27600,0,4,'FC6EA3',1,2,0),(5359,739,27597,0,5,'6C59DC',1,2,0),(5360,740,28008,5,0,'1A7C11',0,2,0),(5361,740,28011,2,1,'2774A4',0,2,0),(5362,740,28010,0,2,'F63100',1,2,0),(5363,740,28007,0,3,'A54F10',1,2,0),(5364,740,28009,0,4,'FC6EA3',1,2,0),(5365,740,28006,0,5,'6C59DC',1,2,0),(5366,741,27084,5,0,'1A7C11',0,2,0),(5367,741,27085,2,1,'2774A4',0,2,0),(5368,741,27083,0,2,'F63100',1,2,0),(5369,741,27086,0,3,'A54F10',1,2,0),(5370,741,27082,0,4,'FC6EA3',1,2,0),(5371,741,27079,0,5,'6C59DC',1,2,0),(5372,742,27622,5,0,'1A7C11',0,2,0),(5373,742,27625,2,1,'2774A4',0,2,0),(5374,742,27624,0,2,'F63100',1,2,0),(5375,742,27621,0,3,'A54F10',1,2,0),(5376,742,27623,0,4,'FC6EA3',1,2,0),(5377,742,27620,0,5,'6C59DC',1,2,0),(5378,743,27979,5,0,'1A7C11',0,2,0),(5379,743,27982,2,1,'2774A4',0,2,0),(5380,743,27981,0,2,'F63100',1,2,0),(5381,743,27978,0,3,'A54F10',1,2,0),(5382,743,27980,0,4,'FC6EA3',1,2,0),(5383,743,27977,0,5,'6C59DC',1,2,0),(5384,766,27124,5,0,'1A7C11',0,2,0),(5385,766,27125,2,1,'2774A4',0,2,0),(5386,766,27123,0,2,'F63100',1,2,0),(5387,766,27126,0,3,'A54F10',1,2,0),(5388,766,27122,0,4,'FC6EA3',1,2,0),(5389,766,27119,0,5,'6C59DC',1,2,0),(5390,772,28100,5,0,'1A7C11',0,2,0),(5391,772,28103,2,1,'2774A4',0,2,0),(5392,772,28102,0,2,'F63100',1,2,0),(5393,772,28099,0,3,'A54F10',1,2,0),(5394,772,28101,0,4,'FC6EA3',1,2,0),(5395,772,28098,0,5,'6C59DC',1,2,0),(5396,744,27094,5,0,'1A7C11',0,2,0),(5397,744,27095,2,1,'2774A4',0,2,0),(5398,744,27093,0,2,'F63100',1,2,0),(5399,744,27096,0,3,'A54F10',1,2,0),(5400,744,27092,0,4,'FC6EA3',1,2,0),(5401,744,27089,0,5,'6C59DC',1,2,0),(5402,745,27104,5,0,'1A7C11',0,2,0),(5403,745,27105,2,1,'2774A4',0,2,0),(5404,745,27103,0,2,'F63100',1,2,0),(5405,745,27106,0,3,'A54F10',1,2,0),(5406,745,27102,0,4,'FC6EA3',1,2,0),(5407,745,27099,0,5,'6C59DC',1,2,0),(5408,746,27183,5,0,'1A7C11',0,2,0),(5409,746,27186,2,1,'2774A4',0,2,0),(5410,746,27185,0,2,'F63100',1,2,0),(5411,746,27182,0,3,'A54F10',1,2,0),(5412,746,27184,0,4,'FC6EA3',1,2,0),(5413,746,27181,0,5,'6C59DC',1,2,0),(5414,747,27218,5,0,'1A7C11',0,2,0),(5415,747,27221,2,1,'2774A4',0,2,0),(5416,747,27220,0,2,'F63100',1,2,0),(5417,747,27217,0,3,'A54F10',1,2,0),(5418,747,27219,0,4,'FC6EA3',1,2,0),(5419,747,27216,0,5,'6C59DC',1,2,0),(5420,748,27254,5,0,'1A7C11',0,2,0),(5421,748,27257,2,1,'2774A4',0,2,0),(5422,748,27256,0,2,'F63100',1,2,0),(5423,748,27253,0,3,'A54F10',1,2,0),(5424,748,27255,0,4,'FC6EA3',1,2,0),(5425,748,27252,0,5,'6C59DC',1,2,0),(5426,749,27275,5,0,'1A7C11',0,2,0),(5427,749,27278,2,1,'2774A4',0,2,0),(5428,749,27277,0,2,'F63100',1,2,0),(5429,749,27274,0,3,'A54F10',1,2,0),(5430,749,27276,0,4,'FC6EA3',1,2,0),(5431,749,27273,0,5,'6C59DC',1,2,0),(5432,750,27324,5,0,'1A7C11',0,2,0),(5433,750,27327,2,1,'2774A4',0,2,0),(5434,750,27326,0,2,'F63100',1,2,0),(5435,750,27323,0,3,'A54F10',1,2,0),(5436,750,27325,0,4,'FC6EA3',1,2,0),(5437,750,27322,0,5,'6C59DC',1,2,0),(5438,752,27453,5,0,'1A7C11',0,2,0),(5439,752,27456,2,1,'2774A4',0,2,0),(5440,752,27455,0,2,'F63100',1,2,0),(5441,752,27452,0,3,'A54F10',1,2,0),(5442,752,27454,0,4,'FC6EA3',1,2,0),(5443,752,27451,0,5,'6C59DC',1,2,0),(5444,753,27489,5,0,'1A7C11',0,2,0),(5445,753,27492,2,1,'2774A4',0,2,0),(5446,753,27491,0,2,'F63100',1,2,0),(5447,753,27488,0,3,'A54F10',1,2,0),(5448,753,27490,0,4,'FC6EA3',1,2,0),(5449,753,27487,0,5,'6C59DC',1,2,0),(5450,754,27523,5,0,'1A7C11',0,2,0),(5451,754,27526,2,1,'2774A4',0,2,0),(5452,754,27525,0,2,'F63100',1,2,0),(5453,754,27522,0,3,'A54F10',1,2,0),(5454,754,27524,0,4,'FC6EA3',1,2,0),(5455,754,27521,0,5,'6C59DC',1,2,0),(5456,755,27559,5,0,'1A7C11',0,2,0),(5457,755,27562,2,1,'2774A4',0,2,0),(5458,755,27561,0,2,'F63100',1,2,0),(5459,755,27558,0,3,'A54F10',1,2,0),(5460,755,27560,0,4,'FC6EA3',1,2,0),(5461,755,27557,0,5,'6C59DC',1,2,0),(5462,756,27645,5,0,'1A7C11',0,2,0),(5463,756,27648,2,1,'2774A4',0,2,0),(5464,756,27647,0,2,'F63100',1,2,0),(5465,756,27644,0,3,'A54F10',1,2,0),(5466,756,27646,0,4,'FC6EA3',1,2,0),(5467,756,27643,0,5,'6C59DC',1,2,0),(5468,758,27725,5,0,'1A7C11',0,2,0),(5469,758,27728,2,1,'2774A4',0,2,0),(5470,758,27727,0,2,'F63100',1,2,0),(5471,758,27724,0,3,'A54F10',1,2,0),(5472,758,27726,0,4,'FC6EA3',1,2,0),(5473,758,27723,0,5,'6C59DC',1,2,0),(5474,759,27759,5,0,'1A7C11',0,2,0),(5475,759,27762,2,1,'2774A4',0,2,0),(5476,759,27761,0,2,'F63100',1,2,0),(5477,759,27758,0,3,'A54F10',1,2,0),(5478,759,27760,0,4,'FC6EA3',1,2,0),(5479,759,27757,0,5,'6C59DC',1,2,0),(5480,760,27791,5,0,'1A7C11',0,2,0),(5481,760,27794,2,1,'2774A4',0,2,0),(5482,760,27793,0,2,'F63100',1,2,0),(5483,760,27790,0,3,'A54F10',1,2,0),(5484,760,27792,0,4,'FC6EA3',1,2,0),(5485,760,27789,0,5,'6C59DC',1,2,0),(5486,762,27875,5,0,'1A7C11',0,2,0),(5487,762,27878,2,1,'2774A4',0,2,0),(5488,762,27877,0,2,'F63100',1,2,0),(5489,762,27874,0,3,'A54F10',1,2,0),(5490,762,27876,0,4,'FC6EA3',1,2,0),(5491,762,27873,0,5,'6C59DC',1,2,0),(5492,763,27912,5,0,'1A7C11',0,2,0),(5493,763,27915,2,1,'2774A4',0,2,0),(5494,763,27914,0,2,'F63100',1,2,0),(5495,763,27911,0,3,'A54F10',1,2,0),(5496,763,27913,0,4,'FC6EA3',1,2,0),(5497,763,27910,0,5,'6C59DC',1,2,0),(5498,764,27947,5,0,'1A7C11',0,2,0),(5499,764,27950,2,1,'2774A4',0,2,0),(5500,764,27949,0,2,'F63100',1,2,0),(5501,764,27946,0,3,'A54F10',1,2,0),(5502,764,27948,0,4,'FC6EA3',1,2,0),(5503,764,27945,0,5,'6C59DC',1,2,0),(5504,769,28061,5,0,'1A7C11',0,2,0),(5505,769,28064,2,1,'2774A4',0,2,0),(5506,769,28063,0,2,'F63100',1,2,0),(5507,769,28060,0,3,'A54F10',1,2,0),(5508,769,28062,0,4,'FC6EA3',1,2,0),(5509,769,28059,0,5,'6C59DC',1,2,0),(5510,773,28121,5,0,'1A7C11',0,2,0),(5511,773,28124,2,1,'2774A4',0,2,0),(5512,773,28123,0,2,'F63100',1,2,0),(5513,773,28120,0,3,'A54F10',1,2,0),(5514,773,28122,0,4,'FC6EA3',1,2,0),(5515,773,28119,0,5,'6C59DC',1,2,0),(5516,778,28178,5,0,'1A7C11',0,2,0),(5517,778,28181,2,1,'2774A4',0,2,0),(5518,778,28180,0,2,'F63100',1,2,0),(5519,778,28177,0,3,'A54F10',1,2,0),(5520,778,28179,0,4,'FC6EA3',1,2,0),(5521,778,28176,0,5,'6C59DC',1,2,0),(5522,785,28226,5,0,'1A7C11',0,2,0),(5523,785,28229,2,1,'2774A4',0,2,0),(5524,785,28228,0,2,'F63100',1,2,0),(5525,785,28225,0,3,'A54F10',1,2,0),(5526,785,28227,0,4,'FC6EA3',1,2,0),(5527,785,28224,0,5,'6C59DC',1,2,0),(5528,655,27036,5,0,'1A7C11',0,2,0),(5529,779,27038,5,0,'1A7C11',0,2,0),(5530,657,27052,5,0,'1A7C11',0,2,0),(5531,767,28045,5,0,'1A7C11',0,2,0),(5532,770,28084,5,0,'1A7C11',0,2,0),(5533,776,28162,5,0,'1A7C11',0,2,0),(5534,780,27054,5,0,'1A7C11',0,2,0),(5535,781,28052,5,0,'1A7C11',0,2,0),(5536,782,28091,5,0,'1A7C11',0,2,0),(5537,783,28169,5,0,'1A7C11',0,2,0),(5538,724,27904,5,0,'1A7C11',0,2,0),(5539,725,27899,5,0,'1A7C11',0,2,0),(5540,668,27208,5,0,'1A7C11',0,2,0),(5541,669,27205,5,0,'1A7C11',0,2,0),(5542,694,27478,5,0,'1A7C11',0,2,0),(5543,695,27477,5,0,'1A7C11',0,2,0),(5544,700,27552,5,0,'1A7C11',0,2,0),(5545,701,27547,5,0,'1A7C11',0,2,0),(5546,683,27414,5,0,'1A7C11',0,2,0),(5547,684,27424,5,0,'1A7C11',0,2,0),(5548,686,27442,5,0,'1A7C11',0,2,0),(5549,784,28221,5,0,'1A7C11',0,2,0),(5550,687,27417,5,0,'1A7C11',0,2,0),(5551,688,27427,5,0,'1A7C11',0,2,0),(5552,786,28246,5,0,'1A7C11',0,2,0),(5553,787,28247,5,0,'1A7C11',0,2,0),(5554,691,27376,5,0,'1A7C11',0,2,0),(5555,692,27380,5,0,'1A7C11',0,2,0),(5556,733,28003,5,0,'1A7C11',0,2,0),(5557,734,28004,5,0,'1A7C11',0,2,0),(5558,730,27975,5,0,'1A7C11',0,2,0),(5559,731,27974,5,0,'1A7C11',0,2,0),(5560,697,27516,5,0,'1A7C11',0,2,0),(5561,698,27511,5,0,'1A7C11',0,2,0),(5562,703,27590,5,0,'1A7C11',0,2,0),(5563,704,27586,5,0,'1A7C11',0,2,0),(5564,708,27671,5,0,'1A7C11',0,2,0),(5565,709,27670,5,0,'1A7C11',0,2,0),(5566,774,28151,5,0,'1A7C11',0,2,0),(5567,775,28143,5,0,'1A7C11',0,2,0),(5568,718,27820,5,0,'1A7C11',0,2,0),(5569,719,27819,5,0,'1A7C11',0,2,0),(5570,675,27294,5,0,'1A7C11',0,2,0),(5571,676,27299,5,0,'1A7C11',0,2,0),(5572,677,27301,5,0,'1A7C11',0,2,0),(5573,678,27293,5,0,'1A7C11',0,2,0),(5574,679,27298,5,0,'1A7C11',0,2,0),(5575,680,27300,5,0,'1A7C11',0,2,0),(5576,671,27240,5,0,'1A7C11',0,2,0),(5577,672,27239,5,0,'1A7C11',0,2,0),(5578,714,27753,5,0,'1A7C11',0,2,0),(5579,715,27752,5,0,'1A7C11',0,2,0),(5580,727,27936,5,0,'1A7C11',0,2,0),(5581,728,27933,5,0,'1A7C11',0,2,0),(5582,736,28031,5,0,'1A7C11',0,2,0),(5583,737,28028,5,0,'1A7C11',0,2,0),(5587,529,28251,0,3,'00FF00',0,2,0),(5597,530,28250,0,9,'00FF00',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
INSERT INTO `group_prototype` VALUES (16,10176,'{#CLUSTER.NAME}',NULL,NULL),(17,10176,'{#DATACENTER.NAME}',NULL,NULL),(18,10176,'',7,NULL),(19,10177,'{#CLUSTER.NAME} (vm)',NULL,NULL),(20,10177,'{#DATACENTER.NAME} (vm)',NULL,NULL),(21,10177,'{#HV.NAME}',NULL,NULL),(22,10177,'',6,NULL);
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_bin NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_bin NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
INSERT INTO `host_discovery` VALUES (10176,NULL,26988,'',0,0),(10177,NULL,26989,'',0,0);
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type_full` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alias` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `os` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `os_full` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `os_short` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `serialno_a` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `serialno_b` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tag` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `asset_tag` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hardware` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hardware_full` text COLLATE utf8_bin NOT NULL,
  `software` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `software_full` text COLLATE utf8_bin NOT NULL,
  `software_app_a` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `software_app_b` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `software_app_c` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `software_app_d` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `software_app_e` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `contact` text COLLATE utf8_bin NOT NULL,
  `location` text COLLATE utf8_bin NOT NULL,
  `location_lat` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `location_lon` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notes` text COLLATE utf8_bin NOT NULL,
  `chassis` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `model` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hw_arch` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `vendor` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `contract_number` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `installer_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `deployment_status` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url_a` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url_b` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url_c` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_networks` text COLLATE utf8_bin NOT NULL,
  `host_netmask` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_router` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_router` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_address_a` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_address_b` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_address_c` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_city` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_state` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_country` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_zip` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_rack` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_notes` text COLLATE utf8_bin NOT NULL,
  `poc_1_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_notes` text COLLATE utf8_bin NOT NULL,
  `poc_2_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_notes` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
INSERT INTO `hostmacro` VALUES (351,10184,'{$CPU_UTIL_MAX}','90'),(352,10184,'{$MEMORY_UTIL_MAX}','90'),(353,10184,'{$TEMP_CRIT}','60'),(354,10184,'{$TEMP_WARN}','50'),(355,10184,'{$TEMP_CRIT_LOW}','5'),(356,10184,'{$STORAGE_UTIL_CRIT}','90'),(357,10184,'{$STORAGE_UTIL_WARN}','80'),(358,10185,'{$CPU_UTIL_MAX}','90'),(359,10185,'{$MEMORY_UTIL_MAX}','90'),(360,10185,'{$TEMP_CRIT}','60'),(361,10185,'{$TEMP_WARN}','50'),(362,10185,'{$TEMP_CRIT_LOW}','5'),(363,10185,'{$STORAGE_UTIL_CRIT}','90'),(364,10185,'{$STORAGE_UTIL_WARN}','80'),(365,10186,'{$ICMP_LOSS_WARN}','20'),(366,10186,'{$ICMP_RESPONSE_TIME_WARN}','0.15'),(367,10187,'{$IFCONTROL}','1'),(368,10187,'{$IF_UTIL_MAX}','95'),(369,10187,'{$IF_ERRORS_WARN}','2'),(370,10188,'{$IFCONTROL}','1'),(371,10188,'{$IF_UTIL_MAX}','95'),(372,10188,'{$IF_ERRORS_WARN}','2'),(373,10189,'{$IFCONTROL}','1'),(374,10189,'{$IF_UTIL_MAX}','90'),(375,10189,'{$IF_ERRORS_WARN}','2'),(376,10190,'{$IFCONTROL}','1'),(377,10190,'{$IF_UTIL_MAX}','90'),(378,10190,'{$IF_ERRORS_WARN}','2'),(382,10192,'{$IFCONTROL}','1'),(383,10192,'{$IF_UTIL_MAX}','90'),(384,10192,'{$IF_ERRORS_WARN}','2'),(385,10203,'{$SNMP_TIMEOUT}','3m'),(386,10204,'{$SNMP_TIMEOUT}','3m'),(393,10207,'{$TEMP_CRIT}','75'),(394,10207,'{$TEMP_WARN}','65'),(395,10207,'{$PSU_CRIT_STATUS}','4'),(396,10207,'{$FAN_CRIT_STATUS}','4'),(397,10207,'{$CPU_UTIL_MAX}','90'),(398,10207,'{$MEMORY_UTIL_MAX}','90'),(399,10207,'{$TEMP_CRIT_LOW}','5'),(400,10207,'{$STORAGE_UTIL_CRIT}','90'),(401,10207,'{$STORAGE_UTIL_WARN}','80'),(402,10208,'{$TEMP_CRIT}','75'),(403,10208,'{$TEMP_WARN}','65'),(404,10208,'{$HEALTH_CRIT_STATUS}','4'),(405,10208,'{$HEALTH_WARN_STATUS:\"offline\"}','2'),(406,10208,'{$HEALTH_WARN_STATUS:\"testing\"}','3'),(407,10208,'{$TEMP_WARN_STATUS}','5'),(408,10208,'{$PSU_CRIT_STATUS}','2'),(409,10208,'{$FAN_CRIT_STATUS}','2'),(410,10208,'{$PSU_OK_STATUS}','4'),(411,10208,'{$FAN_OK_STATUS}','4'),(412,10208,'{$CPU_UTIL_MAX}','90'),(413,10208,'{$MEMORY_UTIL_MAX}','90'),(414,10208,'{$TEMP_CRIT_LOW}','5'),(415,10208,'{$STORAGE_UTIL_CRIT}','90'),(416,10208,'{$STORAGE_UTIL_WARN}','80'),(417,10210,'{$TEMP_CRIT}','75'),(418,10210,'{$TEMP_WARN}','65'),(419,10210,'{$PSU_CRIT_STATUS}','3'),(420,10210,'{$FAN_CRIT_STATUS}','3'),(421,10210,'{$PSU_OK_STATUS}','2'),(422,10210,'{$FAN_OK_STATUS}','2'),(423,10210,'{$CPU_UTIL_MAX}','90'),(424,10210,'{$MEMORY_UTIL_MAX}','90'),(425,10210,'{$TEMP_CRIT_LOW}','5'),(426,10210,'{$STORAGE_UTIL_CRIT}','90'),(427,10210,'{$STORAGE_UTIL_WARN}','80'),(428,10211,'{$TEMP_CRIT}','75'),(429,10211,'{$TEMP_WARN}','65'),(430,10211,'{$PSU_CRIT_STATUS}','3'),(431,10211,'{$FAN_CRIT_STATUS}','3'),(432,10211,'{$PSU_OK_STATUS}','2'),(433,10211,'{$FAN_OK_STATUS}','2'),(434,10211,'{$CPU_UTIL_MAX}','90'),(435,10211,'{$MEMORY_UTIL_MAX}','90'),(436,10211,'{$TEMP_CRIT_LOW}','5'),(437,10211,'{$STORAGE_UTIL_CRIT}','90'),(438,10211,'{$STORAGE_UTIL_WARN}','80'),(439,10217,'{$TEMP_CRIT:\"CPU\"}','75'),(440,10217,'{$TEMP_WARN:\"CPU\"}','70'),(441,10217,'{$TEMP_WARN_STATUS}','2'),(442,10217,'{$TEMP_CRIT_STATUS}','3'),(443,10217,'{$TEMP_DISASTER_STATUS}','4'),(448,10218,'{$CPU_UTIL_MAX}','90'),(449,10218,'{$MEMORY_UTIL_MAX}','90'),(450,10218,'{$TEMP_CRIT}','60'),(451,10218,'{$TEMP_WARN}','50'),(452,10218,'{$TEMP_CRIT_LOW}','5'),(453,10218,'{$STORAGE_UTIL_CRIT}','90'),(454,10218,'{$STORAGE_UTIL_WARN}','80'),(462,10220,'{$CPU_UTIL_MAX}','90'),(463,10220,'{$MEMORY_UTIL_MAX}','90'),(464,10220,'{$TEMP_CRIT}','60'),(465,10220,'{$TEMP_WARN}','50'),(466,10220,'{$TEMP_CRIT_LOW}','5'),(467,10220,'{$STORAGE_UTIL_CRIT}','90'),(468,10220,'{$STORAGE_UTIL_WARN}','80'),(469,10221,'{$TEMP_CRIT}','65'),(470,10221,'{$TEMP_WARN}','55'),(471,10221,'{$PSU_CRIT_STATUS}','2'),(472,10221,'{$FAN_CRIT_STATUS}','2'),(473,10221,'{$PSU_OK_STATUS}','1'),(474,10221,'{$FAN_OK_STATUS}','1'),(475,10221,'{$CPU_UTIL_MAX}','90'),(476,10221,'{$MEMORY_UTIL_MAX}','90'),(477,10221,'{$TEMP_CRIT_LOW}','5'),(478,10221,'{$STORAGE_UTIL_CRIT}','90'),(479,10221,'{$STORAGE_UTIL_WARN}','80'),(480,10222,'{$TEMP_CRIT}','75'),(481,10222,'{$TEMP_WARN}','65'),(482,10222,'{$PSU_CRIT_STATUS}','5'),(483,10222,'{$FAN_CRIT_STATUS}','5'),(484,10222,'{$CPU_UTIL_MAX}','90'),(485,10222,'{$MEMORY_UTIL_MAX}','90'),(486,10222,'{$TEMP_CRIT_LOW}','5'),(487,10222,'{$STORAGE_UTIL_CRIT}','90'),(488,10222,'{$STORAGE_UTIL_WARN}','80'),(489,10223,'{$TEMP_CRIT}','75'),(490,10223,'{$TEMP_WARN}','65'),(491,10223,'{$PSU_CRIT_STATUS}','4'),(492,10223,'{$FAN_CRIT_STATUS}','2'),(493,10223,'{$CPU_UTIL_MAX}','90'),(494,10223,'{$MEMORY_UTIL_MAX}','90'),(495,10223,'{$TEMP_CRIT_LOW}','5'),(496,10223,'{$STORAGE_UTIL_CRIT}','90'),(497,10223,'{$STORAGE_UTIL_WARN}','80'),(498,10224,'{$TEMP_CRIT}','65'),(499,10224,'{$TEMP_WARN}','55'),(500,10224,'{$TEMP_CRIT_STATUS}','1'),(501,10224,'{$PSU_CRIT_STATUS}','3'),(502,10224,'{$FAN_CRIT_STATUS}','2'),(505,10224,'{$CPU_UTIL_MAX}','90'),(506,10224,'{$MEMORY_UTIL_MAX}','90'),(507,10224,'{$TEMP_CRIT_LOW}','5'),(508,10224,'{$STORAGE_UTIL_CRIT}','90'),(509,10224,'{$STORAGE_UTIL_WARN}','80'),(510,10227,'{$FAN_CRIT_STATUS:\"fanError\"}','41'),(511,10227,'{$FAN_CRIT_STATUS:\"hardwareFaulty\"}','91'),(512,10227,'{$PSU_CRIT_STATUS:\"psuError\"}','51'),(513,10227,'{$PSU_CRIT_STATUS:\"rpsError\"}','61'),(514,10227,'{$PSU_CRIT_STATUS:\"hardwareFaulty\"}','91'),(515,10227,'{$CPU_UTIL_MAX}','90'),(516,10227,'{$MEMORY_UTIL_MAX}','90'),(517,10227,'{$TEMP_CRIT}','60'),(518,10227,'{$TEMP_WARN}','50'),(519,10227,'{$TEMP_CRIT_LOW}','5'),(520,10227,'{$STORAGE_UTIL_CRIT}','90'),(521,10227,'{$STORAGE_UTIL_WARN}','80'),(533,10229,'{$FAN_CRIT_STATUS}','2'),(534,10229,'{$CPU_UTIL_MAX}','90'),(535,10229,'{$MEMORY_UTIL_MAX}','90'),(536,10229,'{$TEMP_CRIT}','60'),(537,10229,'{$TEMP_WARN}','50'),(538,10229,'{$TEMP_CRIT_LOW}','5'),(539,10229,'{$STORAGE_UTIL_CRIT}','90'),(540,10229,'{$STORAGE_UTIL_WARN}','80'),(541,10230,'{$TEMP_CRIT_STATUS}','3'),(542,10230,'{$TEMP_WARN_STATUS}','2'),(543,10230,'{$PSU_CRIT_STATUS}','3'),(544,10230,'{$FAN_CRIT_STATUS}','3'),(547,10230,'{$TEMP_CRIT}','60'),(548,10230,'{$TEMP_WARN}','50'),(549,10230,'{$TEMP_CRIT_LOW}','5'),(550,10230,'{$STORAGE_UTIL_CRIT}','90'),(551,10230,'{$STORAGE_UTIL_WARN}','80'),(552,10231,'{$TEMP_CRIT:\"Routing Engine\"}','80'),(553,10231,'{$TEMP_WARN:\"Routing Engine\"}','70'),(554,10231,'{$HEALTH_CRIT_STATUS}','3'),(555,10231,'{$FAN_CRIT_STATUS}','6'),(556,10231,'{$PSU_CRIT_STATUS}','6'),(557,10231,'{$CPU_UTIL_MAX}','90'),(558,10231,'{$MEMORY_UTIL_MAX}','90'),(559,10231,'{$TEMP_CRIT}','60'),(560,10231,'{$TEMP_WARN}','50'),(561,10231,'{$TEMP_CRIT_LOW}','5'),(562,10231,'{$STORAGE_UTIL_CRIT}','90'),(563,10231,'{$STORAGE_UTIL_WARN}','80'),(572,10233,'{$TEMP_CRIT:\"CPU\"}','75'),(573,10233,'{$TEMP_WARN:\"CPU\"}','70'),(574,10233,'{$CPU_UTIL_MAX}','90'),(575,10233,'{$MEMORY_UTIL_MAX}','90'),(576,10233,'{$TEMP_CRIT}','60'),(577,10233,'{$TEMP_WARN}','50'),(578,10233,'{$TEMP_CRIT_LOW}','5'),(579,10233,'{$STORAGE_UTIL_CRIT}','90'),(580,10233,'{$STORAGE_UTIL_WARN}','80'),(581,10234,'{$TEMP_WARN_STATUS}','2'),(582,10234,'{$TEMP_CRIT_STATUS}','3'),(583,10234,'{$PSU_CRIT_STATUS:\"failed\"}','2'),(584,10234,'{$FAN_CRIT_STATUS:\"failed\"}','2'),(585,10234,'{$CPU_UTIL_MAX}','90'),(586,10234,'{$MEMORY_UTIL_MAX}','90'),(587,10234,'{$TEMP_CRIT}','60'),(588,10234,'{$TEMP_WARN}','50'),(589,10234,'{$TEMP_CRIT_LOW}','5'),(590,10234,'{$STORAGE_UTIL_CRIT}','90'),(591,10234,'{$STORAGE_UTIL_WARN}','80'),(592,10235,'{$TEMP_CRIT}','75'),(593,10235,'{$TEMP_WARN}','65'),(594,10235,'{$PSU_CRIT_STATUS}','1'),(595,10235,'{$FAN_CRIT_STATUS}','1'),(596,10235,'{$CPU_UTIL_MAX}','90'),(597,10235,'{$MEMORY_UTIL_MAX}','90'),(598,10235,'{$TEMP_CRIT_LOW}','5'),(599,10235,'{$STORAGE_UTIL_CRIT}','90'),(600,10235,'{$STORAGE_UTIL_WARN}','80'),(601,10236,'{$CPU_UTIL_MAX}','90'),(602,10236,'{$MEMORY_UTIL_MAX}','90'),(603,10237,'{$CPU_UTIL_MAX}','90'),(604,10237,'{$MEMORY_UTIL_MAX}','90'),(605,10248,'{$CPU_UTIL_MAX}','90'),(606,10248,'{$MEMORY_UTIL_MAX}','90'),(607,10248,'{$TEMP_CRIT}','60'),(608,10248,'{$TEMP_WARN}','50'),(609,10248,'{$TEMP_CRIT_LOW}','5'),(610,10248,'{$STORAGE_UTIL_CRIT}','90'),(611,10248,'{$STORAGE_UTIL_WARN}','80'),(612,10249,'{$CPU_UTIL_MAX}','90'),(613,10249,'{$MEMORY_UTIL_MAX}','90'),(614,10249,'{$TEMP_CRIT}','60'),(615,10249,'{$TEMP_WARN}','50'),(616,10249,'{$TEMP_CRIT_LOW}','5'),(617,10249,'{$STORAGE_UTIL_CRIT}','90'),(618,10249,'{$STORAGE_UTIL_WARN}','80'),(619,10250,'{$FAN_CRIT_STATUS:\"bad\"}','2'),(620,10250,'{$PSU_CRIT_STATUS:\"bad\"}','2'),(621,10250,'{$TEMP_WARN_STATUS}','3'),(622,10250,'{$TEMP_CRIT_STATUS}','2'),(623,10250,'{$CPU_UTIL_MAX}','90'),(624,10250,'{$MEMORY_UTIL_MAX}','90'),(625,10250,'{$TEMP_CRIT}','60'),(626,10250,'{$TEMP_WARN}','50'),(627,10250,'{$TEMP_CRIT_LOW}','5'),(628,10250,'{$STORAGE_UTIL_CRIT}','90'),(629,10250,'{$STORAGE_UTIL_WARN}','80'),(630,10251,'{$PSU_CRIT_STATUS}','2'),(631,10251,'{$FAN_CRIT_STATUS}','3'),(632,10251,'{$TEMP_WARN_STATUS}','3'),(633,10251,'{$CPU_UTIL_MAX}','90'),(634,10251,'{$MEMORY_UTIL_MAX}','90'),(635,10251,'{$TEMP_CRIT}','60'),(636,10251,'{$TEMP_WARN}','50'),(637,10251,'{$TEMP_CRIT_LOW}','5'),(638,10251,'{$STORAGE_UTIL_CRIT}','90'),(639,10251,'{$STORAGE_UTIL_WARN}','80'),(640,10253,'{$CPU_UTIL_MAX}','90'),(641,10253,'{$MEMORY_UTIL_MAX}','90'),(642,10253,'{$TEMP_CRIT}','60'),(643,10253,'{$TEMP_WARN}','50'),(644,10253,'{$TEMP_CRIT_LOW}','5'),(645,10253,'{$STORAGE_UTIL_CRIT}','90'),(646,10253,'{$STORAGE_UTIL_WARN}','80'),(647,10230,'{$PSU_WARN_STATUS}','4'),(648,10217,'{$PSU_CRIT_STATUS:\"critical\"}','3'),(649,10217,'{$PSU_CRIT_STATUS:\"shutdown\"}','4'),(650,10217,'{$PSU_WARN_STATUS:\"warning\"}','2'),(651,10217,'{$PSU_WARN_STATUS:\"notFunctioning\"}','6'),(652,10217,'{$FAN_CRIT_STATUS:\"critical\"}','3'),(653,10217,'{$FAN_CRIT_STATUS:\"shutdown\"}','4'),(654,10217,'{$FAN_WARN_STATUS:\"warning\"}','2'),(655,10217,'{$FAN_WARN_STATUS:\"notFunctioning\"}','6'),(656,10250,'{$FAN_WARN_STATUS:\"warning\"}','3'),(657,10250,'{$PSU_WARN_STATUS:\"warning\"}','3');
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '-1',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tls_psk` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `proxy_address` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `auto_compress` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,NULL,'Template OS Linux',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux',0,NULL,'',1,1,'','','','','',1),(10047,NULL,'Template App Zabbix Server',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','','','',1),(10048,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','','','',1),(10050,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','','','',1),(10074,NULL,'Template OS OpenBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS OpenBSD',0,NULL,'',1,1,'','','','','',1),(10075,NULL,'Template OS FreeBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS FreeBSD',0,NULL,'',1,1,'','','','','',1),(10076,NULL,'Template OS AIX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS AIX',0,NULL,'',1,1,'','','','','',1),(10077,NULL,'Template OS HP-UX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS HP-UX',0,NULL,'',1,1,'','','','','',1),(10078,NULL,'Template OS Solaris',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Solaris',0,NULL,'',1,1,'','','','','',1),(10079,NULL,'Template OS Mac OS X',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Mac OS X',0,NULL,'',1,1,'','','','','',1),(10081,NULL,'Template OS Windows',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','','','',1),(10084,NULL,'Zabbix server',1,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Zabbix server',0,NULL,'',1,1,'','','','','',1),(10093,NULL,'Template App FTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App FTP Service',0,NULL,'',1,1,'','','','','',1),(10094,NULL,'Template App HTTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTP Service',0,NULL,'',1,1,'','','','','',1),(10095,NULL,'Template App HTTPS Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTPS Service',0,NULL,'',1,1,'','','','','',1),(10096,NULL,'Template App IMAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IMAP Service',0,NULL,'',1,1,'','','','','',1),(10097,NULL,'Template App LDAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App LDAP Service',0,NULL,'',1,1,'','','','','',1),(10098,NULL,'Template App NNTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NNTP Service',0,NULL,'',1,1,'','','','','',1),(10099,NULL,'Template App NTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NTP Service',0,NULL,'',1,1,'','','','','',1),(10100,NULL,'Template App POP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App POP Service',0,NULL,'',1,1,'','','','','',1),(10101,NULL,'Template App SMTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SMTP Service',0,NULL,'',1,1,'','','','','',1),(10102,NULL,'Template App SSH Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','','','',1),(10103,NULL,'Template App Telnet Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Telnet Service',0,NULL,'',1,1,'','','','','',1),(10168,NULL,'Template App Apache Tomcat JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Apache Tomcat JMX',0,NULL,'',1,1,'','','','','',1),(10169,NULL,'Template App Generic Java JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Generic Java JMX',0,NULL,'',1,1,'','','','','',1),(10170,NULL,'Template DB MySQL',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template DB MySQL',0,NULL,'',1,1,'','','','','',1),(10171,NULL,'Template Server Intel SR1530 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1530 IPMI',0,NULL,'',1,1,'','','','','',1),(10172,NULL,'Template Server Intel SR1630 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1630 IPMI',0,NULL,'',1,1,'','','','','',1),(10173,NULL,'Template VM VMware',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware',0,NULL,'',1,1,'','','','','',1),(10174,NULL,'Template VM VMware Guest',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Guest',0,NULL,'',1,1,'','','','','',1),(10175,NULL,'Template VM VMware Hypervisor',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Hypervisor',0,NULL,'',1,1,'','','','','',1),(10176,NULL,'{#HV.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#HV.NAME}',2,NULL,'',1,1,'','','','','',1),(10177,NULL,'{#VM.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#VM.NAME}',2,NULL,'',1,1,'','','','','',1),(10182,NULL,'Template Module EtherLike-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv1',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.14\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','','','',1),(10183,NULL,'Template Module EtherLike-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv2',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.14\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','','','',1),(10184,NULL,'Template Module HOST-RESOURCES-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv1',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','','','',1),(10185,NULL,'Template Module HOST-RESOURCES-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv2',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','','','',1),(10186,NULL,'Template Module ICMP Ping',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module ICMP Ping',0,NULL,'Template Module ICMP Ping version: 0.14',1,1,'','','','','',1),(10187,NULL,'Template Module Interfaces Simple SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv1',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10188,NULL,'Template Module Interfaces Simple SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv2',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10189,NULL,'Template Module Interfaces SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv1',0,NULL,'Template Interfaces version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10190,NULL,'Template Module Interfaces SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv2',0,NULL,'Template Interfaces version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10192,NULL,'Template Module Interfaces Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Windows SNMPv2',0,NULL,'Template Module Interfaces Windows version: 0.14\r\nOverview: Special version of interfaces template that is required for Windows OS. Since MS doesn\'t support 64 bit counters but supports ifAlias.\r\n\r\nMIBs used:\r\nIF-MIB',1,1,'','','','','',1),(10203,NULL,'Template Module Generic SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv1',0,NULL,'Template Module Generic version: 0.14\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','','','',1),(10204,NULL,'Template Module Generic SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv2',0,NULL,'Template Module Generic version: 0.14\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','','','',1),(10207,NULL,'Template Net Alcatel Timetra TiMOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Alcatel Timetra TiMOS SNMPv2',0,NULL,'Template Net Alcatel Timetra TiMOS version: 0.14\r\nMIBs used:\r\nTIMETRA-SYSTEM-MIB\r\nSNMPv2-MIB\r\nTIMETRA-CHASSIS-MIB',1,1,'','','','','',1),(10208,NULL,'Template Net Brocade FC SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade FC SNMPv2',0,NULL,'Template Net Brocade FC version: 0.14\r\nOverview: https://community.brocade.com/dtscp75322/attachments/dtscp75322/fibre/25235/1/FOS_MIB_Reference_v740.pdf\r\n\r\nMIBs used:\r\nSW-MIB\r\nKnown Issues:\r\ndescription : no IF-MIB::ifAlias is available\r\nversion : v6.3.1c, v7.0.0c,  v7.4.1c\r\ndevice : all',1,1,'','','','','',1),(10209,NULL,'Template Module Brocade_Foundry Performance SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Brocade_Foundry Performance SNMPv2',0,NULL,'Template Module Brocade_Foundry Performance version: 0.14\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','','','',1),(10210,NULL,'Template Net Brocade_Foundry Nonstackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Nonstackable SNMPv2',0,NULL,'Template Net Brocade_Foundry Nonstackable version: 0.14\r\nOverview: For devices(old Foundry devices, MLXe and so on) that doesn\'t support Stackable SNMP Tables: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table -\r\nFOUNDRY-SN-AGENT-MIB::snChasFanTable, snChasPwrSupplyTable,snAgentTempTable are used instead.\r\nFor example:\r\nThe objects in table snChasPwrSupply2Table is not supported on the NetIron and the FastIron SX devices.\r\nsnChasFan2Table is not supported on  on the NetIron devices.\r\nsnAgentTemp2Table is not supported on old versions of MLXe\r\n\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','','','',1),(10211,NULL,'Template Net Brocade_Foundry Stackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Stackable SNMPv2',0,NULL,'Template Brocade_Foundry Stackable version: 0.14\r\nOverview: For devices(most of the IronWare Brocade devices) that support Stackable SNMP Tables in FOUNDRY-SN-AGENT-MIB: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table - so objects from all Stack members are provided.\r\n\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB\r\nFOUNDRY-SN-STACKING-MIB\r\nKnown Issues:\r\ndescription : Correct fan(returns fan status as \'other(1)\' and temperature (returns 0) for the non-master Switches are not available in SNMP\r\nversion : Version 08.0.40b and above\r\ndevice : ICX 7750 in stack',1,1,'','','','','',1),(10212,NULL,'Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',0,NULL,'Template Cisco CISCO-MEMORY-POOL-MIB version: 0.14\r\nMIBs used:\r\nCISCO-MEMORY-POOL-MIB',1,1,'','','','','',1),(10213,NULL,'Template Module Cisco CISCO-PROCESS-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB SNMPv2',0,NULL,'Template Cisco CISCO-PROCESS-MIB version: 0.14\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','','','',1),(10215,NULL,'Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',0,NULL,'Template Cisco OLD-CISCO-CPU-MIB version: 0.14\r\nMIBs used:\r\nOLD-CISCO-CPU-MIB',1,1,'','','','','',1),(10216,NULL,'Template Module Cisco Inventory SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco Inventory SNMPv2',0,NULL,'Template Cisco Inventory version: 0.14\r\nMIBs used:\r\nENTITY-MIB\r\nSNMPv2-MIB',1,1,'','','','','',1),(10217,NULL,'Template Module Cisco CISCO-ENVMON-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-ENVMON-MIB SNMPv2',0,NULL,'Template Cisco CISCO-ENVMON-MIB version: 0.14\r\nMIBs used:\r\nCISCO-ENVMON-MIB',1,1,'','','','','',1),(10218,NULL,'Template Net Cisco IOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS SNMPv2',0,NULL,'Template Cisco IOS Software releases 12.2(3.5) or later version: 0.14\r\nKnown Issues:\r\ndescription : no if(in|out)(Errors|Discards) are available for vlan ifType\r\nversion : IOS for example: 12.1(22)EA11, 15.4(3)M2\r\ndevice : C2911, C7600',1,1,'','','','','',1),(10220,NULL,'Template Net Cisco IOS prior to 12.0_3_T SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS prior to 12.0_3_T SNMPv2',0,NULL,'Cisco IOS Software releases prior to 12.0(3)T version: 0.14',1,1,'','','','','',1),(10221,NULL,'Template Net Dell Force S-Series SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Dell Force S-Series SNMPv2',0,NULL,'Template Dell Force S-Series version: 0.14\r\nMIBs used:\r\nF10-S-SERIES-CHASSIS-MIB',1,1,'','','','','',1),(10222,NULL,'Template Net D-Link DES 7200 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES 7200 SNMPv2',0,NULL,'Template D-Link DES 7200 version: 0.14\r\nMIBs used:\r\nMY-PROCESS-MIB\r\nMY-MEMORY-MIB\r\nMY-SYSTEM-MIB\r\nSNMPv2-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10223,NULL,'Template Net D-Link DES_DGS Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES_DGS Switch SNMPv2',0,NULL,'Template D-Link DES_DGS Switch version: 0.14\r\nMIBs used:\r\nDLINK-AGENT-MIB\r\nEQUIPMENT-MIB\r\nSNMPv2-MIB\r\nENTITY-MIB\r\nKnown Issues:\r\ndescription : D-Link reports missing PSU as fail(4)\r\nversion : Firmware: 1.73R008,hardware revision:B1\r\ndevice : DGS-3420-26SC Gigabit Ethernet Switch',1,1,'','','','','',1),(10224,NULL,'Template Net Extreme EXOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Extreme EXOS SNMPv2',0,NULL,'Template Extreme EXOS version: 0.14\r\nMIBs used:\r\nEXTREME-SOFTWARE-MONITOR-MIB\r\nEXTREME-SYSTEM-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10225,NULL,'Template Net Network Generic Device SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv1',0,NULL,'Template Net Network Generic Device version: 0.14\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','','','',1),(10226,NULL,'Template Net Network Generic Device SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv2',0,NULL,'Template Net Network Generic Device version: 0.14\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','','','',1),(10227,NULL,'Template Net HP Comware HH3C SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Comware HH3C SNMPv2',0,NULL,'Template Net HP Comware (HH3C) version: 0.14\r\nOverview: http://certifiedgeek.weebly.com/blog/hp-comware-snmp-mib-for-cpu-memory-and-temperature\r\nhttp://www.h3c.com.hk/products___solutions/technology/system_management/configuration_example/200912/656451_57_0.htm\r\n\r\nMIBs used:\r\nHH3C-ENTITY-EXT-MIB\r\nENTITY-MIB\r\nKnown Issues:\r\ndescription : No temperature sensors. All entities of them return 0 for HH3C-ENTITY-EXT-MIB::hh3cEntityExtTemperature\r\nversion : 1910-48 Switch Software Version 5.20.99, Release 1116 Copyright(c)2010-2016 Hewlett Packard Enterprise Development LP\r\ndevice : HP 1910-48',1,1,'','','','','',1),(10229,NULL,'Template Net Huawei VRP SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Huawei VRP SNMPv2',0,NULL,'Template Net Huawei VRP version: 0.14\r\nOverview: Reference: https://www.slideshare.net/Huanetwork/huawei-s5700-naming-conventions-and-port-numbering-conventions\r\nReference: http://support.huawei.com/enterprise/KnowledgebaseReadAction.action?contentId=KB1000090234\r\n\r\nMIBs used:\r\nHUAWEI-ENTITY-EXTENT-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10230,NULL,'Template Net Intel_Qlogic Infiniband SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Intel_Qlogic Infiniband SNMPv2',0,NULL,'Template Net Intel_Qlogic Infiniband version: 0.14\r\nMIBs used:\r\nICS-CHASSIS-MIB',1,1,'','','','','',1),(10231,NULL,'Template Net Juniper SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Juniper SNMPv2',0,NULL,'Template Net Juniper version: 0.14\r\nMIBs used:\r\nJUNIPER-MIB\r\nJUNIPER-ALARM-MIB\r\nSNMPv2-MIB',1,1,'','','','','',1),(10233,NULL,'Template Net Mikrotik SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mikrotik SNMPv2',0,NULL,'Template Net Mikrotik version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB\r\nMIKROTIK-MIB\r\nKnown Issues:\r\ndescription : Doesn\'t have ifHighSpeed filled. fixed in more recent versions\r\nversion : RotuerOS 6.28 or lower\r\ndevice : description : Doesn\'t have any temperature sensors\r\nversion : RotuerOS 6.38.5\r\ndevice : Mikrotik 941-2nD, Mikrotik 951G-2HnD',1,1,'','','','','',1),(10234,NULL,'Template Net Netgear Fastpath SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Netgear Fastpath SNMPv2',0,NULL,'Template Net Netgear Fastpath version: 0.14\r\nOverview: https://kb.netgear.com/24352/MIBs-for-Smart-switches\r\n\r\nMIBs used:\r\nFASTPATH-SWITCHING-MIB\r\nFASTPATH-BOXSERVICES-PRIVATE-MIB',1,1,'','','','','',1),(10235,NULL,'Template Net QTech QSW SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net QTech QSW SNMPv2',0,NULL,'Template Net QTech QSW version: 0.14\r\nMIBs used:\r\nQTECH-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10236,NULL,'Template Net TP-LINK SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net TP-LINK SNMPv2',0,NULL,'Template Net TP-LINK JetStream version: 0.14\r\nOverview: Link to MIBs: http://www.tp-linkru.com/download/T2600G-28TS.html#MIBs_Files\r\nSample device overview page: http://www.tp-linkru.com/products/details/cat-39_T2600G-28TS.html#overview\r\nemulation page(web): http://www.tp-linkru.com/resources/simulator/T2600G-28TS(UN)_1.0/Index.htm\r\n\r\nMIBs used:\r\nTPLINK-SYSMONITOR-MIB\r\nTPLINK-SYSINFO-MIB\r\nKnown Issues:\r\ndescription : default sysLocation, sysName and sysContact is not filled with proper data. Real hostname and location can be found only in private branch(TPLINK-SYSINFO-MIB). Please check whether this problem exists in the latest firware: http://www.tp-linkru.com/download/T2600G-28TS.html#Firmware\r\nversion : 2.0.0 Build 20170628 Rel.55184(Beta)\r\ndevice : T2600G-28TS 2.0description : The Serial number of the product(tpSysInfoSerialNum) is missing in HW versions prior to V2_170323\r\nversion : prior to version V2_170323\r\ndevice : T2600G-28TS 2.0',1,1,'','','','','',1),(10237,NULL,'Template Net Ubiquiti AirOS SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Ubiquiti AirOS SNMPv1',0,NULL,'Template Net Ubiquiti AirOS version: 0.14\r\nMIBs used:\r\nFROGFOOT-RESOURCES-MIB\r\nIEEE802dot11-MIB\r\nKnown Issues:\r\ndescription : UBNT unifi reports speed: like IF-MIB::ifSpeed.1 = Gauge32: 4294967295 for all interfaces\r\nversion : Firmware: BZ.ar7240.v3.7.51.6230.170322.1513\r\ndevice : UBNT UAP-LRdescription : UBNT AirMax(NanoStation, NanoBridge etc) reports ifSpeed: as 0 for VLAN and wireless(ath0) interfaces\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5description : UBNT AirMax(NanoStation, NanoBridge etc) reports always return ifType: as ethernet(6) even for wifi,vlans and other types\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5description : ifXTable is not provided in IF-MIB. So Interfaces Simple Template is used instead\r\nversion : all above\r\ndevice : NanoStation, UAP-LR',1,1,'','','','','',1),(10248,NULL,'Template OS Linux SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux SNMPv2',0,NULL,'Template OS Linux version: 0.14',1,1,'','','','','',1),(10249,NULL,'Template OS Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows SNMPv2',0,NULL,'Template OS Windows version: 0.14\r\nKnown Issues:\r\ndescription : Doesn\'t support In/Out 64 bit counters even thoug1h IfxTable is present:\r\nCurrently, Windows gets it’s interface status from MIB-2. Since these 64bit SNMP counters (ifHCInOctets, ifHCOutOctets, etc.) are defined as an extension to IF-MIB, Microsoft has not implemented it.\r\nhttps://social.technet.microsoft.com/Forums/windowsserver/en-US/07b62ff0-94f6-40ca-a99d-d129c1b33d70/windows-2008-r2-snmp-64bit-counters-support?forum=winservergen\r\nversion : Win2008, Win2012R2\r\ndevice : description : Doesn\'t support ifXTable at all\r\nversion : WindowsXP\r\ndevice : description : EtherLike MIB is not supported\r\nversion : *\r\ndevice : *',1,1,'','','','','',1),(10250,NULL,'Template Net HP Enterprise Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Enterprise Switch SNMPv2',0,NULL,'Template Net HP Enterprise Switch version: 0.14\r\nMIBs used:\r\nSTATISTICS-MIB\r\nNETSWITCH-MIB\r\nENTITY-SENSORS-MIB\r\nHP-ICF-CHASSIS\r\nENTITY-MIB\r\nSEMI-MIB',1,1,'','','','','',1),(10251,NULL,'Template Net Mellanox SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mellanox SNMPv2',0,NULL,'Template Net Mellanox version: 0.14\r\nMIBs used:\r\nENTITY-SENSORS-MIB\r\nENTITY-STATE-MIB\r\nENTITY-MIB',1,1,'','','','','',1),(10252,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 version: 0.14\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','','','',1),(10253,NULL,'Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Cisco IOS Software releases later to 12.0(3)T and prior to 12.2(3.5) version: 0.14',1,1,'','','','','',1);
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (194,10001,10),(189,10047,12),(188,10048,12),(187,10050,8),(196,10074,10),(192,10075,10),(191,10076,10),(193,10077,10),(197,10078,10),(195,10079,10),(198,10081,10),(92,10084,4),(175,10093,8),(178,10094,8),(177,10095,8),(179,10096,8),(180,10097,8),(181,10098,8),(182,10099,8),(183,10100,8),(184,10101,8),(185,10102,8),(186,10103,8),(174,10168,12),(176,10169,12),(190,10170,13),(199,10171,11),(200,10172,11),(201,10173,14),(202,10174,14),(203,10175,14),(208,10182,8),(209,10183,8),(210,10184,8),(211,10185,8),(212,10186,8),(213,10187,8),(214,10188,8),(215,10189,8),(216,10190,8),(218,10192,8),(229,10203,8),(230,10204,8),(233,10207,9),(234,10208,9),(235,10209,8),(236,10210,9),(237,10211,9),(238,10212,8),(239,10213,8),(241,10215,8),(242,10216,8),(243,10217,8),(244,10218,9),(246,10220,9),(247,10221,9),(248,10222,9),(249,10223,9),(250,10224,9),(251,10225,9),(252,10226,9),(253,10227,9),(255,10229,9),(256,10230,9),(257,10231,9),(259,10233,9),(260,10234,9),(261,10235,9),(262,10236,9),(263,10237,9),(274,10248,10),(275,10249,10),(276,10250,9),(277,10251,9),(278,10252,8),(279,10253,9);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (4,10001,10050),(31,10074,10050),(32,10075,10050),(33,10076,10050),(34,10077,10050),(35,10078,10050),(36,10079,10050),(37,10081,10050),(39,10084,10001),(38,10084,10047),(131,10176,10175),(132,10177,10174),(133,10203,10186),(134,10204,10186),(136,10207,10183),(135,10207,10190),(137,10207,10204),(138,10208,10190),(139,10208,10204),(141,10210,10190),(142,10210,10204),(140,10210,10209),(144,10211,10190),(145,10211,10204),(143,10211,10209),(151,10218,10183),(150,10218,10190),(152,10218,10204),(149,10218,10212),(148,10218,10213),(146,10218,10216),(147,10218,10217),(163,10220,10204),(161,10220,10212),(162,10220,10215),(159,10220,10216),(160,10220,10217),(165,10221,10183),(164,10221,10190),(166,10221,10204),(167,10222,10190),(168,10222,10204),(170,10223,10183),(169,10223,10190),(171,10223,10204),(173,10224,10183),(172,10224,10190),(174,10224,10204),(176,10225,10182),(175,10225,10187),(177,10225,10203),(179,10226,10183),(178,10226,10188),(180,10226,10204),(182,10227,10183),(181,10227,10190),(183,10227,10204),(189,10229,10183),(188,10229,10190),(190,10229,10204),(191,10230,10190),(192,10230,10204),(194,10231,10183),(193,10231,10190),(195,10231,10204),(200,10233,10190),(201,10233,10204),(202,10234,10190),(203,10234,10204),(205,10235,10183),(204,10235,10190),(206,10235,10204),(207,10236,10188),(208,10236,10204),(209,10237,10187),(210,10237,10203),(213,10248,10183),(211,10248,10185),(212,10248,10190),(214,10248,10204),(215,10249,10185),(216,10249,10192),(217,10249,10204),(219,10250,10183),(218,10250,10190),(220,10250,10204),(221,10251,10185),(222,10251,10190),(223,10251,10204),(228,10253,10190),(229,10253,10204),(226,10253,10212),(224,10253,10216),(225,10253,10217),(227,10253,10252);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hstgrp`
--

DROP TABLE IF EXISTS `hstgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstgrp` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `hstgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hstgrp`
--

LOCK TABLES `hstgrp` WRITE;
/*!40000 ALTER TABLE `hstgrp` DISABLE KEYS */;
INSERT INTO `hstgrp` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Templates/Modules',0,0),(9,'Templates/Network Devices',0,0),(10,'Templates/Operating Systems',0,0),(11,'Templates/Servers Hardware',0,0),(12,'Templates/Applications',0,0),(13,'Templates/Databases',0,0),(14,'Templates/Virtualization',0,0);
/*!40000 ALTER TABLE `hstgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timeout` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '15s',
  `posts` text COLLATE utf8_bin NOT NULL,
  `required` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status_codes` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep_field`
--

DROP TABLE IF EXISTS `httpstep_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep_field` (
  `httpstep_fieldid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`httpstep_fieldid`),
  KEY `httpstep_field_1` (`httpstepid`),
  CONSTRAINT `c_httpstep_field_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep_field`
--

LOCK TABLES `httpstep_field` WRITE;
/*!40000 ALTER TABLE `httpstep_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '1m',
  `status` int(11) NOT NULL DEFAULT '0',
  `agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `http_password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest_field`
--

DROP TABLE IF EXISTS `httptest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest_field` (
  `httptest_fieldid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`httptest_fieldid`),
  KEY `httptest_field_1` (`httptestid`),
  CONSTRAINT `c_httptest_field_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest_field`
--

LOCK TABLES `httptest_field` WRITE;
/*!40000 ALTER TABLE `httptest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('auditlog','auditid',3),('auditlog_details','auditdetailid',1),('profiles','profileid',10);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `port` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,10084,1,1,1,'127.0.0.1','','10050',1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
INSERT INTO `item_application_prototype` VALUES (1,1,23666);
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,22444,8,'{#IFNAME}','@Network interfaces for discovery'),(2,22450,8,'{#FSTYPE}','@File systems for discovery'),(4,22867,8,'{#FSTYPE}','@File systems for discovery'),(5,22907,8,'{#FSTYPE}','@File systems for discovery'),(6,22944,8,'{#IFNAME}','@Network interfaces for discovery'),(7,22947,8,'{#FSTYPE}','@File systems for discovery'),(8,22984,8,'{#IFNAME}','@Network interfaces for discovery'),(9,22987,8,'{#FSTYPE}','@File systems for discovery'),(10,23024,8,'{#IFNAME}','@Network interfaces for discovery'),(11,23027,8,'{#FSTYPE}','@File systems for discovery'),(12,23067,8,'{#FSTYPE}','@File systems for discovery'),(13,23162,8,'{#FSTYPE}','@File systems for discovery'),(14,23163,8,'{#IFNAME}','@Network interfaces for discovery'),(15,23329,8,'{#IFNAME}','@Network interfaces for discovery'),(16,23540,8,'{#IFNAME}','@Network interfaces for discovery'),(19,23278,8,'{#IFNAME}','@Network interfaces for discovery'),(20,23279,8,'{#FSTYPE}','@File systems for discovery'),(21,23665,8,'{#SERVICE.NAME}','@Windows service names for discovery'),(22,23665,8,'{#SERVICE.STARTUPNAME}','@Windows service startup states for discovery'),(215,27029,8,'{#IFOPERSTATUS}','1'),(216,27029,8,'{#SNMPVALUE}','(2|3)'),(217,27031,8,'{#IFOPERSTATUS}','1'),(218,27031,8,'{#SNMPVALUE}','(2|3)'),(219,27034,8,'{#STORAGE_TYPE}','.+2$'),(220,27034,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(221,27035,8,'{#STORAGE_TYPE}','.+4$'),(222,27035,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(223,27050,8,'{#STORAGE_TYPE}','.+2$'),(224,27050,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(225,27051,8,'{#STORAGE_TYPE}','.+4$'),(226,27051,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(227,27068,8,'{#IFADMINSTATUS}','(1|3)'),(228,27068,8,'{#IFNAME}','@Network interfaces for discovery'),(229,27078,8,'{#IFADMINSTATUS}','(1|3)'),(230,27078,8,'{#IFNAME}','@Network interfaces for discovery'),(231,27088,8,'{#IFADMINSTATUS}','(1|3)'),(232,27088,8,'{#IFNAME}','@Network interfaces for discovery'),(233,27098,8,'{#IFADMINSTATUS}','(1|3)'),(234,27098,8,'{#IFNAME}','@Network interfaces for discovery'),(237,27118,8,'{#IFADMINSTATUS}','(1|3)'),(238,27118,8,'{#IFNAME}','@Network interfaces for discovery'),(243,27180,8,'{#IFADMINSTATUS}','(1|3)'),(244,27180,8,'{#IFNAME}','@Network interfaces for discovery'),(245,27190,8,'{#IFOPERSTATUS}','1'),(246,27190,8,'{#SNMPVALUE}','(2|3)'),(247,27209,8,'{#TEMP_SENSOR}','1'),(248,27210,8,'{#SNMPVALUE}','[^1]'),(249,27211,8,'{#ENT_SN}','.+'),(250,27215,8,'{#IFADMINSTATUS}','(1|3)'),(251,27215,8,'{#IFNAME}','@Network interfaces for discovery'),(253,27242,8,'{#SENSOR_TYPE}','1'),(254,27243,8,'{#SENSOR_TYPE}','3'),(255,27244,8,'{#SENSOR_TYPE}','2'),(256,27251,8,'{#IFADMINSTATUS}','(1|3)'),(257,27251,8,'{#IFNAME}','@Network interfaces for discovery'),(258,27272,8,'{#IFADMINSTATUS}','(1|3)'),(259,27272,8,'{#IFNAME}','@Network interfaces for discovery'),(260,27321,8,'{#IFADMINSTATUS}','(1|3)'),(261,27321,8,'{#IFNAME}','@Network interfaces for discovery'),(262,27331,8,'{#IFOPERSTATUS}','1'),(263,27331,8,'{#SNMPVALUE}','(2|3)'),(266,27393,8,'{#ENT_SN}','.+'),(267,27393,8,'{#ENT_CLASS}','[^3]'),(268,27399,8,'{#ENT_SN}','.+'),(269,27399,8,'{#ENT_CLASS}','[^3]'),(272,27410,8,'{#ENT_SN}','.+'),(273,27410,8,'{#ENT_CLASS}','[^3]'),(274,27450,8,'{#IFADMINSTATUS}','(1|3)'),(275,27450,8,'{#IFNAME}','@Network interfaces for discovery'),(276,27460,8,'{#IFOPERSTATUS}','1'),(277,27460,8,'{#SNMPVALUE}','(2|3)'),(278,27486,8,'{#IFADMINSTATUS}','(1|3)'),(279,27486,8,'{#IFNAME}','@Network interfaces for discovery'),(280,27520,8,'{#IFADMINSTATUS}','(1|3)'),(281,27520,8,'{#IFNAME}','@Network interfaces for discovery'),(282,27530,8,'{#IFOPERSTATUS}','1'),(283,27530,8,'{#SNMPVALUE}','(2|3)'),(284,27550,8,'{#STATUS}','[^0]'),(285,27551,8,'{#STATUS}','[^0]'),(286,27556,8,'{#IFADMINSTATUS}','(1|3)'),(287,27556,8,'{#IFNAME}','@Network interfaces for discovery'),(288,27566,8,'{#IFOPERSTATUS}','1'),(289,27566,8,'{#SNMPVALUE}','(2|3)'),(290,27596,8,'{#IFADMINSTATUS}','(1|3)'),(291,27596,8,'{#IFNAME}','@Network interfaces for discovery'),(292,27606,8,'{#IFOPERSTATUS}','1'),(293,27606,8,'{#SNMPVALUE}','(2|3)'),(294,27619,8,'{#IFADMINSTATUS}','(1|3)'),(295,27619,8,'{#IFNAME}','@Network interfaces for discovery'),(296,27629,8,'{#IFOPERSTATUS}','1'),(297,27629,8,'{#SNMPVALUE}','(2|3)'),(298,27642,8,'{#IFADMINSTATUS}','(1|3)'),(299,27642,8,'{#IFNAME}','@Network interfaces for discovery'),(300,27652,8,'{#IFOPERSTATUS}','1'),(301,27652,8,'{#SNMPVALUE}','(2|3)'),(302,27665,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(303,27665,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(304,27666,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(305,27666,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(306,27666,8,'{#SNMPVALUE}','(T|t)emperature.*(s|S)ensor'),(307,27667,8,'{#ENT_CLASS}','7'),(308,27668,8,'{#ENT_CLASS}','6'),(309,27669,8,'{#ENT_CLASS}','3'),(323,27722,8,'{#IFADMINSTATUS}','(1|3)'),(324,27722,8,'{#IFNAME}','@Network interfaces for discovery'),(325,27732,8,'{#IFOPERSTATUS}','1'),(326,27732,8,'{#SNMPVALUE}','(2|3)'),(327,27745,8,'{#ENT_NAME}','MPU.*'),(328,27746,8,'{#ENT_CLASS}','3'),(329,27756,8,'{#IFADMINSTATUS}','(1|3)'),(330,27756,8,'{#IFNAME}','@Network interfaces for discovery'),(331,27779,8,'{#SENSOR_TYPE}','2'),(332,27780,8,'{#ENT_CLASS}','2'),(333,27788,8,'{#IFADMINSTATUS}','(1|3)'),(334,27788,8,'{#IFNAME}','@Network interfaces for discovery'),(335,27798,8,'{#IFOPERSTATUS}','1'),(336,27798,8,'{#SNMPVALUE}','(2|3)'),(337,27815,8,'{#SNMPVALUE}','Routing Engine.*'),(338,27816,8,'{#SNMPVALUE}','[^0]+'),(350,27872,8,'{#IFADMINSTATUS}','(1|3)'),(351,27872,8,'{#IFNAME}','@Network interfaces for discovery'),(352,27903,8,'{#STORAGE_TYPE}','.+4$'),(353,27903,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(354,27909,8,'{#IFADMINSTATUS}','(1|3)'),(355,27909,8,'{#IFNAME}','@Network interfaces for discovery'),(356,27944,8,'{#IFADMINSTATUS}','(1|3)'),(357,27944,8,'{#IFNAME}','@Network interfaces for discovery'),(358,27954,8,'{#IFOPERSTATUS}','1'),(359,27954,8,'{#SNMPVALUE}','(2|3)'),(360,27976,8,'{#IFADMINSTATUS}','(1|3)'),(361,27976,8,'{#IFNAME}','@Network interfaces for discovery'),(362,28005,8,'{#IFADMINSTATUS}','(1|3)'),(363,28005,8,'{#IFNAME}','@Network interfaces for discovery'),(364,28043,8,'{#STORAGE_TYPE}','.+2$'),(365,28043,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(366,28044,8,'{#STORAGE_TYPE}','.+4$'),(367,28044,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(368,28058,8,'{#IFADMINSTATUS}','(1|3)'),(369,28058,8,'{#IFNAME}','@Network interfaces for discovery'),(370,28068,8,'{#IFOPERSTATUS}','1'),(371,28068,8,'{#SNMPVALUE}','(2|3)'),(372,28082,8,'{#STORAGE_TYPE}','.+2$'),(373,28082,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(374,28083,8,'{#STORAGE_TYPE}','.+4$'),(375,28083,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(376,28097,8,'{#IFADMINSTATUS}','(1|3)'),(377,28097,8,'{#IFNAME}','@Network interfaces for discovery'),(378,28118,8,'{#IFADMINSTATUS}','(1|3)'),(379,28118,8,'{#IFNAME}','@Network interfaces for discovery'),(380,28128,8,'{#IFOPERSTATUS}','1'),(381,28128,8,'{#SNMPVALUE}','(2|3)'),(382,28144,8,'{#SNMPVALUE}','8'),(383,28144,8,'{#SENSOR_PRECISION}','0'),(384,28146,8,'{#ENT_CLASS}','.+8.3.2$'),(385,28146,8,'{#ENT_STATUS}','(1|2|3|4)'),(386,28147,8,'{#ENT_CLASS}','.+8.3.1$'),(387,28147,8,'{#ENT_STATUS}','(1|2|3|4)'),(388,28148,8,'{#ENT_CLASS}','.+8.3.3$'),(389,28148,8,'{#ENT_STATUS}','(1|2|3|4)'),(390,28149,8,'{#ENT_CLASS}','3'),(391,28160,8,'{#STORAGE_TYPE}','.+2$'),(392,28160,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(393,28161,8,'{#STORAGE_TYPE}','.+4$'),(394,28161,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(395,28175,8,'{#IFADMINSTATUS}','(1|3)'),(396,28175,8,'{#IFNAME}','@Network interfaces for discovery'),(397,28196,8,'{#SNMPVALUE}','8'),(398,28196,8,'{#SENSOR_PRECISION}','1'),(399,28197,8,'{#SNMPVALUE}','10'),(400,28198,8,'{#ENT_CLASS}','3'),(401,28199,8,'{#ENT_CLASS}','6'),(402,28207,8,'{#ENT_SN}','.+'),(403,28207,8,'{#ENT_CLASS}','[^3]'),(404,28223,8,'{#IFADMINSTATUS}','(1|3)'),(405,28223,8,'{#IFNAME}','@Network interfaces for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (1,22446,22444,'',0,0),(3,22448,22444,'',0,0),(5,22452,22450,'',0,0),(7,22454,22450,'',0,0),(9,22456,22450,'',0,0),(11,22458,22450,'',0,0),(65,22686,22450,'',0,0),(135,22868,22867,'',0,0),(136,22869,22867,'',0,0),(137,22870,22867,'',0,0),(138,22871,22867,'',0,0),(139,22872,22867,'',0,0),(142,22908,22907,'',0,0),(143,22909,22907,'',0,0),(144,22910,22907,'',0,0),(145,22911,22907,'',0,0),(146,22912,22907,'',0,0),(147,22945,22944,'',0,0),(148,22946,22944,'',0,0),(149,22948,22947,'',0,0),(150,22949,22947,'',0,0),(151,22950,22947,'',0,0),(152,22951,22947,'',0,0),(153,22952,22947,'',0,0),(154,22985,22984,'',0,0),(155,22986,22984,'',0,0),(156,22988,22987,'',0,0),(157,22989,22987,'',0,0),(158,22990,22987,'',0,0),(159,22991,22987,'',0,0),(160,22992,22987,'',0,0),(161,23025,23024,'',0,0),(162,23026,23024,'',0,0),(163,23028,23027,'',0,0),(164,23029,23027,'',0,0),(165,23030,23027,'',0,0),(166,23031,23027,'',0,0),(167,23032,23027,'',0,0),(170,23068,23067,'',0,0),(171,23069,23067,'',0,0),(172,23070,23067,'',0,0),(173,23071,23067,'',0,0),(174,23072,23067,'',0,0),(175,23164,23162,'',0,0),(176,23165,23162,'',0,0),(178,23167,23162,'',0,0),(179,23168,23162,'',0,0),(180,23169,23163,'',0,0),(181,23170,23163,'',0,0),(182,23280,23278,'',0,0),(183,23281,23278,'',0,0),(184,23282,23279,'',0,0),(185,23283,23279,'',0,0),(186,23284,23279,'',0,0),(187,23285,23279,'',0,0),(188,23286,23279,'',0,0),(189,23073,23540,'',0,0),(190,23074,23540,'',0,0),(191,23075,23329,'',0,0),(192,23076,23329,'',0,0),(220,23666,23665,'',0,0),(746,26994,26987,'',0,0),(747,26995,26990,'',0,0),(748,26996,26990,'',0,0),(749,26997,26990,'',0,0),(750,26998,26990,'',0,0),(751,26999,26991,'',0,0),(752,27000,26991,'',0,0),(753,27001,26991,'',0,0),(754,27002,26991,'',0,0),(755,27003,26992,'',0,0),(756,27004,26992,'',0,0),(757,27005,26992,'',0,0),(758,27006,26992,'',0,0),(759,27007,26993,'',0,0),(760,27008,26993,'',0,0),(761,27009,26993,'',0,0),(762,27010,26993,'',0,0),(775,27030,27029,'',0,0),(776,27032,27031,'',0,0),(777,27036,27033,'',0,0),(778,27037,27034,'',0,0),(779,27038,27034,'',0,0),(780,27039,27034,'',0,0),(781,27040,27034,'',0,0),(782,27041,27034,'',0,0),(783,27042,27034,'',0,0),(784,27043,27035,'',0,0),(785,27044,27035,'',0,0),(786,27045,27035,'',0,0),(787,27046,27035,'',0,0),(788,27047,27035,'',0,0),(789,27048,27035,'',0,0),(790,27052,27049,'',0,0),(791,27053,27050,'',0,0),(792,27054,27050,'',0,0),(793,27055,27050,'',0,0),(794,27056,27050,'',0,0),(795,27057,27050,'',0,0),(796,27058,27050,'',0,0),(797,27059,27051,'',0,0),(798,27060,27051,'',0,0),(799,27061,27051,'',0,0),(800,27062,27051,'',0,0),(801,27063,27051,'',0,0),(802,27064,27051,'',0,0),(803,27069,27068,'',0,0),(804,27070,27068,'',0,0),(805,27071,27068,'',0,0),(806,27072,27068,'',0,0),(807,27073,27068,'',0,0),(808,27074,27068,'',0,0),(809,27075,27068,'',0,0),(810,27076,27068,'',0,0),(811,27077,27068,'',0,0),(812,27079,27078,'',0,0),(813,27080,27078,'',0,0),(814,27081,27078,'',0,0),(815,27082,27078,'',0,0),(816,27083,27078,'',0,0),(817,27084,27078,'',0,0),(818,27085,27078,'',0,0),(819,27086,27078,'',0,0),(820,27087,27078,'',0,0),(821,27089,27088,'',0,0),(822,27090,27088,'',0,0),(823,27091,27088,'',0,0),(824,27092,27088,'',0,0),(825,27093,27088,'',0,0),(826,27094,27088,'',0,0),(827,27095,27088,'',0,0),(828,27096,27088,'',0,0),(829,27097,27088,'',0,0),(830,27099,27098,'',0,0),(831,27100,27098,'',0,0),(832,27101,27098,'',0,0),(833,27102,27098,'',0,0),(834,27103,27098,'',0,0),(835,27104,27098,'',0,0),(836,27105,27098,'',0,0),(837,27106,27098,'',0,0),(838,27107,27098,'',0,0),(848,27119,27118,'',0,0),(849,27120,27118,'',0,0),(850,27121,27118,'',0,0),(851,27122,27118,'',0,0),(852,27123,27118,'',0,0),(853,27124,27118,'',0,0),(854,27125,27118,'',0,0),(855,27126,27118,'',0,0),(856,27127,27118,'',0,0),(875,27181,27180,'',0,0),(876,27182,27180,'',0,0),(877,27183,27180,'',0,0),(878,27184,27180,'',0,0),(879,27185,27180,'',0,0),(880,27186,27180,'',0,0),(881,27187,27180,'',0,0),(882,27188,27180,'',0,0),(883,27189,27180,'',0,0),(884,27191,27190,'',0,0),(885,27212,27209,'',0,0),(886,27213,27210,'',0,0),(887,27214,27211,'',0,0),(888,27216,27215,'',0,0),(889,27217,27215,'',0,0),(890,27218,27215,'',0,0),(891,27219,27215,'',0,0),(892,27220,27215,'',0,0),(893,27221,27215,'',0,0),(894,27222,27215,'',0,0),(895,27223,27215,'',0,0),(896,27224,27215,'',0,0),(898,27246,27242,'',0,0),(899,27247,27242,'',0,0),(900,27248,27243,'',0,0),(901,27249,27244,'',0,0),(902,27250,27244,'',0,0),(903,27252,27251,'',0,0),(904,27253,27251,'',0,0),(905,27254,27251,'',0,0),(906,27255,27251,'',0,0),(907,27256,27251,'',0,0),(908,27257,27251,'',0,0),(909,27258,27251,'',0,0),(910,27259,27251,'',0,0),(911,27260,27251,'',0,0),(912,27273,27272,'',0,0),(913,27274,27272,'',0,0),(914,27275,27272,'',0,0),(915,27276,27272,'',0,0),(916,27277,27272,'',0,0),(917,27278,27272,'',0,0),(918,27279,27272,'',0,0),(919,27280,27272,'',0,0),(920,27281,27272,'',0,0),(921,27312,27302,'',0,0),(922,27313,27303,'',0,0),(923,27314,27304,'',0,0),(924,27315,27306,'',0,0),(925,27316,27307,'',0,0),(926,27317,27308,'',0,0),(927,27318,27309,'',0,0),(928,27319,27310,'',0,0),(929,27320,27311,'',0,0),(930,27322,27321,'',0,0),(931,27323,27321,'',0,0),(932,27324,27321,'',0,0),(933,27325,27321,'',0,0),(934,27326,27321,'',0,0),(935,27327,27321,'',0,0),(936,27328,27321,'',0,0),(937,27329,27321,'',0,0),(938,27330,27321,'',0,0),(939,27332,27331,'',0,0),(949,27414,27390,'',0,0),(950,27415,27390,'',0,0),(951,27416,27390,'',0,0),(952,27417,27391,'',0,0),(954,27419,27393,'',0,0),(955,27420,27394,'',0,0),(956,27421,27394,'',0,0),(957,27422,27395,'',0,0),(958,27423,27396,'',0,0),(959,27424,27397,'',0,0),(960,27425,27397,'',0,0),(961,27426,27397,'',0,0),(962,27427,27398,'',0,0),(963,27428,27399,'',0,0),(964,27429,27400,'',0,0),(965,27430,27400,'',0,0),(966,27431,27401,'',0,0),(967,27432,27402,'',0,0),(977,27442,27409,'',0,0),(978,27443,27409,'',0,0),(979,27444,27409,'',0,0),(980,27445,27410,'',0,0),(981,27446,27411,'',0,0),(982,27447,27411,'',0,0),(983,27448,27412,'',0,0),(984,27449,27413,'',0,0),(985,27451,27450,'',0,0),(986,27452,27450,'',0,0),(987,27453,27450,'',0,0),(988,27454,27450,'',0,0),(989,27455,27450,'',0,0),(990,27456,27450,'',0,0),(991,27457,27450,'',0,0),(992,27458,27450,'',0,0),(993,27459,27450,'',0,0),(994,27461,27460,'',0,0),(995,27477,27473,'',0,0),(996,27478,27473,'',0,0),(997,27479,27474,'',0,0),(998,27480,27475,'',0,0),(999,27481,27476,'',0,0),(1000,27482,27476,'',0,0),(1001,27483,27476,'',0,0),(1002,27484,27476,'',0,0),(1003,27485,27476,'',0,0),(1004,27487,27486,'',0,0),(1005,27488,27486,'',0,0),(1006,27489,27486,'',0,0),(1007,27490,27486,'',0,0),(1008,27491,27486,'',0,0),(1009,27492,27486,'',0,0),(1010,27493,27486,'',0,0),(1011,27494,27486,'',0,0),(1012,27495,27486,'',0,0),(1013,27516,27512,'',0,0),(1014,27517,27513,'',0,0),(1015,27518,27514,'',0,0),(1016,27519,27515,'',0,0),(1017,27521,27520,'',0,0),(1018,27522,27520,'',0,0),(1019,27523,27520,'',0,0),(1020,27524,27520,'',0,0),(1021,27525,27520,'',0,0),(1022,27526,27520,'',0,0),(1023,27527,27520,'',0,0),(1024,27528,27520,'',0,0),(1025,27529,27520,'',0,0),(1026,27531,27530,'',0,0),(1027,27552,27548,'',0,0),(1028,27553,27549,'',0,0),(1029,27554,27550,'',0,0),(1030,27555,27551,'',0,0),(1031,27557,27556,'',0,0),(1032,27558,27556,'',0,0),(1033,27559,27556,'',0,0),(1034,27560,27556,'',0,0),(1035,27561,27556,'',0,0),(1036,27562,27556,'',0,0),(1037,27563,27556,'',0,0),(1038,27564,27556,'',0,0),(1039,27565,27556,'',0,0),(1040,27567,27566,'',0,0),(1041,27590,27587,'',0,0),(1042,27591,27587,'',0,0),(1043,27592,27587,'',0,0),(1044,27593,27588,'',0,0),(1045,27594,27589,'',0,0),(1046,27595,27589,'',0,0),(1047,27597,27596,'',0,0),(1048,27598,27596,'',0,0),(1049,27599,27596,'',0,0),(1050,27600,27596,'',0,0),(1051,27601,27596,'',0,0),(1052,27602,27596,'',0,0),(1053,27603,27596,'',0,0),(1054,27604,27596,'',0,0),(1055,27605,27596,'',0,0),(1056,27607,27606,'',0,0),(1057,27620,27619,'',0,0),(1058,27621,27619,'',0,0),(1059,27622,27619,'',0,0),(1060,27623,27619,'',0,0),(1061,27624,27619,'',0,0),(1062,27625,27619,'',0,0),(1063,27626,27619,'',0,0),(1064,27627,27619,'',0,0),(1065,27628,27619,'',0,0),(1066,27630,27629,'',0,0),(1067,27643,27642,'',0,0),(1068,27644,27642,'',0,0),(1069,27645,27642,'',0,0),(1070,27646,27642,'',0,0),(1071,27647,27642,'',0,0),(1072,27648,27642,'',0,0),(1073,27649,27642,'',0,0),(1074,27650,27642,'',0,0),(1075,27651,27642,'',0,0),(1076,27653,27652,'',0,0),(1077,27670,27665,'',0,0),(1078,27671,27665,'',0,0),(1079,27672,27666,'',0,0),(1080,27673,27667,'',0,0),(1081,27674,27668,'',0,0),(1082,27675,27669,'',0,0),(1083,27676,27669,'',0,0),(1084,27677,27669,'',0,0),(1085,27678,27669,'',0,0),(1086,27679,27669,'',0,0),(1107,27723,27722,'',0,0),(1108,27724,27722,'',0,0),(1109,27725,27722,'',0,0),(1110,27726,27722,'',0,0),(1111,27727,27722,'',0,0),(1112,27728,27722,'',0,0),(1113,27729,27722,'',0,0),(1114,27730,27722,'',0,0),(1115,27731,27722,'',0,0),(1116,27733,27732,'',0,0),(1117,27748,27745,'',0,0),(1118,27749,27745,'',0,0),(1119,27750,27745,'',0,0),(1120,27751,27745,'',0,0),(1121,27752,27745,'',0,0),(1122,27753,27745,'',0,0),(1123,27754,27746,'',0,0),(1124,27755,27747,'',0,0),(1125,27757,27756,'',0,0),(1126,27758,27756,'',0,0),(1127,27759,27756,'',0,0),(1128,27760,27756,'',0,0),(1129,27761,27756,'',0,0),(1130,27762,27756,'',0,0),(1131,27763,27756,'',0,0),(1132,27764,27756,'',0,0),(1133,27765,27756,'',0,0),(1134,27783,27779,'',0,0),(1135,27784,27779,'',0,0),(1136,27785,27780,'',0,0),(1137,27786,27781,'',0,0),(1138,27787,27782,'',0,0),(1139,27789,27788,'',0,0),(1140,27790,27788,'',0,0),(1141,27791,27788,'',0,0),(1142,27792,27788,'',0,0),(1143,27793,27788,'',0,0),(1144,27794,27788,'',0,0),(1145,27795,27788,'',0,0),(1146,27796,27788,'',0,0),(1147,27797,27788,'',0,0),(1148,27799,27798,'',0,0),(1149,27819,27815,'',0,0),(1150,27820,27815,'',0,0),(1151,27821,27816,'',0,0),(1152,27822,27817,'',0,0),(1153,27823,27818,'',0,0),(1183,27873,27872,'',0,0),(1184,27874,27872,'',0,0),(1185,27875,27872,'',0,0),(1186,27876,27872,'',0,0),(1187,27877,27872,'',0,0),(1188,27878,27872,'',0,0),(1189,27879,27872,'',0,0),(1190,27880,27872,'',0,0),(1191,27881,27872,'',0,0),(1192,27904,27901,'',0,0),(1193,27905,27902,'',0,0),(1194,27906,27903,'',0,0),(1195,27907,27903,'',0,0),(1196,27908,27903,'',0,0),(1197,27910,27909,'',0,0),(1198,27911,27909,'',0,0),(1199,27912,27909,'',0,0),(1200,27913,27909,'',0,0),(1201,27914,27909,'',0,0),(1202,27915,27909,'',0,0),(1203,27916,27909,'',0,0),(1204,27917,27909,'',0,0),(1205,27918,27909,'',0,0),(1206,27940,27937,'',0,0),(1207,27941,27937,'',0,0),(1208,27942,27938,'',0,0),(1209,27943,27939,'',0,0),(1210,27945,27944,'',0,0),(1211,27946,27944,'',0,0),(1212,27947,27944,'',0,0),(1213,27948,27944,'',0,0),(1214,27949,27944,'',0,0),(1215,27950,27944,'',0,0),(1216,27951,27944,'',0,0),(1217,27952,27944,'',0,0),(1218,27953,27944,'',0,0),(1219,27955,27954,'',0,0),(1220,27977,27976,'',0,0),(1221,27978,27976,'',0,0),(1222,27979,27976,'',0,0),(1223,27980,27976,'',0,0),(1224,27981,27976,'',0,0),(1225,27982,27976,'',0,0),(1226,27983,27976,'',0,0),(1227,27984,27976,'',0,0),(1228,27985,27976,'',0,0),(1229,28003,28001,'',0,0),(1230,28004,28002,'',0,0),(1231,28006,28005,'',0,0),(1232,28007,28005,'',0,0),(1233,28008,28005,'',0,0),(1234,28009,28005,'',0,0),(1235,28010,28005,'',0,0),(1236,28011,28005,'',0,0),(1237,28012,28005,'',0,0),(1238,28013,28005,'',0,0),(1239,28014,28005,'',0,0),(1240,28045,28042,'',0,0),(1241,28046,28044,'',0,0),(1242,28047,28044,'',0,0),(1243,28048,28044,'',0,0),(1244,28049,28044,'',0,0),(1245,28050,28044,'',0,0),(1246,28051,28044,'',0,0),(1247,28052,28043,'',0,0),(1248,28053,28043,'',0,0),(1249,28054,28043,'',0,0),(1250,28055,28043,'',0,0),(1251,28056,28043,'',0,0),(1252,28057,28043,'',0,0),(1253,28059,28058,'',0,0),(1254,28060,28058,'',0,0),(1255,28061,28058,'',0,0),(1256,28062,28058,'',0,0),(1257,28063,28058,'',0,0),(1258,28064,28058,'',0,0),(1259,28065,28058,'',0,0),(1260,28066,28058,'',0,0),(1261,28067,28058,'',0,0),(1262,28069,28068,'',0,0),(1263,28084,28081,'',0,0),(1264,28085,28083,'',0,0),(1265,28086,28083,'',0,0),(1266,28087,28083,'',0,0),(1267,28088,28083,'',0,0),(1268,28089,28083,'',0,0),(1269,28090,28083,'',0,0),(1270,28091,28082,'',0,0),(1271,28092,28082,'',0,0),(1272,28093,28082,'',0,0),(1273,28094,28082,'',0,0),(1274,28095,28082,'',0,0),(1275,28096,28082,'',0,0),(1276,28098,28097,'',0,0),(1277,28099,28097,'',0,0),(1278,28100,28097,'',0,0),(1279,28101,28097,'',0,0),(1280,28102,28097,'',0,0),(1281,28103,28097,'',0,0),(1282,28104,28097,'',0,0),(1283,28105,28097,'',0,0),(1284,28106,28097,'',0,0),(1285,28119,28118,'',0,0),(1286,28120,28118,'',0,0),(1287,28121,28118,'',0,0),(1288,28122,28118,'',0,0),(1289,28123,28118,'',0,0),(1290,28124,28118,'',0,0),(1291,28125,28118,'',0,0),(1292,28126,28118,'',0,0),(1293,28127,28118,'',0,0),(1294,28129,28128,'',0,0),(1295,28150,28144,'',0,0),(1296,28151,28145,'',0,0),(1297,28152,28145,'',0,0),(1298,28153,28145,'',0,0),(1299,28154,28146,'',0,0),(1300,28155,28147,'',0,0),(1301,28156,28148,'',0,0),(1302,28157,28149,'',0,0),(1303,28158,28149,'',0,0),(1304,28162,28159,'',0,0),(1305,28163,28161,'',0,0),(1306,28164,28161,'',0,0),(1307,28165,28161,'',0,0),(1308,28166,28161,'',0,0),(1309,28167,28161,'',0,0),(1310,28168,28161,'',0,0),(1311,28169,28160,'',0,0),(1312,28170,28160,'',0,0),(1313,28171,28160,'',0,0),(1314,28172,28160,'',0,0),(1315,28173,28160,'',0,0),(1316,28174,28160,'',0,0),(1317,28176,28175,'',0,0),(1318,28177,28175,'',0,0),(1319,28178,28175,'',0,0),(1320,28179,28175,'',0,0),(1321,28180,28175,'',0,0),(1322,28181,28175,'',0,0),(1323,28182,28175,'',0,0),(1324,28183,28175,'',0,0),(1325,28184,28175,'',0,0),(1326,28200,28196,'',0,0),(1327,28201,28196,'',0,0),(1328,28202,28197,'',0,0),(1329,28203,28197,'',0,0),(1330,28204,28198,'',0,0),(1331,28205,28198,'',0,0),(1332,28206,28199,'',0,0),(1333,28208,28207,'',0,0),(1334,28215,28212,'',0,0),(1335,28216,28213,'',0,0),(1336,28217,28214,'',0,0),(1337,28218,28214,'',0,0),(1338,28220,28219,'',0,0),(1339,28221,28219,'',0,0),(1340,28222,28219,'',0,0),(1341,28224,28223,'',0,0),(1342,28225,28223,'',0,0),(1343,28226,28223,'',0,0),(1344,28227,28223,'',0,0),(1345,28228,28223,'',0,0),(1346,28229,28223,'',0,0),(1347,28230,28223,'',0,0),(1348,28231,28223,'',0,0),(1349,28232,28223,'',0,0),(1350,28246,28244,'',0,0),(1351,28247,28245,'',0,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_preproc`
--

DROP TABLE IF EXISTS `item_preproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_preproc` (
  `item_preprocid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`item_preprocid`),
  KEY `item_preproc_1` (`itemid`,`step`),
  CONSTRAINT `c_item_preproc_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_preproc`
--

LOCK TABLES `item_preproc` WRITE;
/*!40000 ALTER TABLE `item_preproc` DISABLE KEYS */;
INSERT INTO `item_preproc` VALUES (457,26828,1,10,''),(458,26841,2,10,''),(459,26842,3,10,''),(460,26843,4,10,''),(461,26844,5,1,'0.001'),(462,26845,6,10,''),(463,26846,7,10,''),(464,26847,8,10,''),(465,26848,9,1,'0.001'),(466,26849,10,1,'0.001'),(467,26850,11,10,''),(468,26851,12,10,''),(469,26852,13,10,''),(470,26853,14,10,''),(471,26854,15,10,''),(472,26855,16,10,''),(473,26876,1,1,'0.001'),(474,26881,2,1,'100'),(475,26884,3,10,''),(476,26885,4,1,'0.001'),(477,26886,5,1,'0.001'),(478,26887,6,10,''),(479,26888,7,1,'0.001'),(480,26889,8,10,''),(481,26890,9,1,'0.001'),(482,26894,10,1,'0.001'),(483,26895,11,10,''),(484,26896,12,10,''),(485,26897,13,1,'0.001'),(486,26905,14,1,'0.001'),(487,26906,15,10,''),(488,23340,1,10,''),(495,26911,1,10,''),(496,26912,2,10,''),(497,26913,3,10,''),(498,26917,4,10,''),(499,26918,5,10,''),(500,26919,6,10,''),(501,26920,7,10,''),(502,26921,8,10,''),(503,26922,9,10,''),(504,26923,10,10,''),(505,22924,1,10,''),(506,22920,2,10,''),(507,22946,1,10,''),(508,22946,2,1,'8'),(509,22945,3,10,''),(510,22945,4,1,'8'),(511,22880,1,10,''),(512,22884,2,10,''),(513,23074,1,10,''),(514,23074,2,1,'8'),(515,23073,3,10,''),(516,23073,4,1,'8'),(517,22986,1,10,''),(518,22986,2,1,'8'),(519,22985,3,10,''),(520,22985,4,1,'8'),(521,22683,1,10,''),(522,22680,2,10,''),(523,23294,1,10,''),(524,23298,2,10,''),(525,22448,1,10,''),(526,22448,2,1,'8'),(527,22446,3,10,''),(528,22446,4,1,'8'),(529,23281,1,10,''),(530,23281,2,1,'8'),(531,23280,3,10,''),(532,23280,4,1,'8'),(533,23077,1,10,''),(534,23077,2,1,'8'),(535,23078,3,10,''),(536,23078,4,1,'8'),(537,22840,1,10,''),(538,22844,2,10,''),(539,23076,1,10,''),(540,23076,2,1,'8'),(541,23075,3,10,''),(542,23075,4,1,'8'),(543,23000,1,10,''),(544,23004,2,10,''),(545,23026,1,10,''),(546,23026,2,1,'8'),(547,23025,3,10,''),(548,23025,4,1,'8'),(549,23170,1,10,''),(550,23170,2,1,'8'),(551,23169,3,10,''),(552,23169,4,1,'8'),(3432,22196,1,10,''),(3433,22199,2,10,''),(3434,22187,3,10,''),(3435,23625,1,10,''),(3436,23628,2,10,''),(3437,23277,3,10,''),(4632,27159,1,1,'0.01'),(4633,27201,1,1,'0.01'),(4634,27234,2,1,'0.01'),(4635,27270,3,1,'0.01'),(4636,27291,4,1,'0.01'),(4637,27342,5,1,'0.01'),(4638,27374,6,1,'0.01'),(4639,27471,7,1,'0.01'),(4640,27505,8,1,'0.01'),(4641,27541,9,1,'0.01'),(4642,27577,10,1,'0.01'),(4643,27640,11,1,'0.01'),(4644,27663,12,1,'0.01'),(4645,27743,13,1,'0.01'),(4646,27775,14,1,'0.01'),(4647,27809,15,1,'0.01'),(4648,27891,16,1,'0.01'),(4649,27928,17,1,'0.01'),(4650,27965,18,1,'0.01'),(4651,27995,19,1,'0.01'),(4652,28079,20,1,'0.01'),(4653,28116,21,1,'0.01'),(4654,28139,22,1,'0.01'),(4655,28194,23,1,'0.01'),(4656,28242,24,1,'0.01'),(4657,27069,1,10,''),(4658,27072,2,10,''),(4659,27073,3,10,''),(4660,27074,4,10,''),(4661,27074,5,1,'8'),(4662,27075,6,10,''),(4663,27075,7,1,'8'),(4664,27076,8,10,''),(4665,27597,1,10,''),(4666,27600,2,10,''),(4667,27601,3,10,''),(4668,27599,4,10,''),(4669,27599,5,1,'8'),(4670,27602,6,10,''),(4671,27602,7,1,'8'),(4672,27598,8,10,''),(4673,28006,9,10,''),(4674,28009,10,10,''),(4675,28010,11,10,''),(4676,28008,12,10,''),(4677,28008,13,1,'8'),(4678,28011,14,10,''),(4679,28011,15,1,'8'),(4680,28007,16,10,''),(4681,27079,1,10,''),(4682,27082,2,10,''),(4683,27083,3,10,''),(4684,27084,4,10,''),(4685,27084,5,1,'8'),(4686,27085,6,10,''),(4687,27085,7,1,'8'),(4688,27086,8,10,''),(4689,27620,1,10,''),(4690,27623,2,10,''),(4691,27624,3,10,''),(4692,27622,4,10,''),(4693,27622,5,1,'8'),(4694,27625,6,10,''),(4695,27625,7,1,'8'),(4696,27621,8,10,''),(4697,27977,9,10,''),(4698,27980,10,10,''),(4699,27981,11,10,''),(4700,27979,12,10,''),(4701,27979,13,1,'8'),(4702,27982,14,10,''),(4703,27982,15,1,'8'),(4704,27978,16,10,''),(4705,27119,1,10,''),(4706,27121,2,1,'1000000'),(4707,27122,3,10,''),(4708,27123,4,10,''),(4709,27124,5,10,''),(4710,27124,6,1,'8'),(4711,27125,7,10,''),(4712,27125,8,1,'8'),(4713,27126,9,10,''),(4714,28098,1,10,''),(4715,28104,2,1,'1000000'),(4716,28101,3,10,''),(4717,28102,4,10,''),(4718,28100,5,10,''),(4719,28100,6,1,'8'),(4720,28103,7,10,''),(4721,28103,8,1,'8'),(4722,28099,9,10,''),(4723,27089,1,10,''),(4724,27091,2,1,'1000000'),(4725,27092,3,10,''),(4726,27093,4,10,''),(4727,27094,5,10,''),(4728,27094,6,1,'8'),(4729,27095,7,10,''),(4730,27095,8,1,'8'),(4731,27096,9,10,''),(4732,27099,1,10,''),(4733,27101,2,1,'1000000'),(4734,27102,3,10,''),(4735,27103,4,10,''),(4736,27104,5,10,''),(4737,27104,6,1,'8'),(4738,27105,7,10,''),(4739,27105,8,1,'8'),(4740,27106,9,10,''),(4741,27181,1,10,''),(4742,27187,2,1,'1000000'),(4743,27184,3,10,''),(4744,27185,4,10,''),(4745,27183,5,10,''),(4746,27183,6,1,'8'),(4747,27186,7,10,''),(4748,27186,8,1,'8'),(4749,27182,9,10,''),(4750,27216,10,10,''),(4751,27222,11,1,'1000000'),(4752,27219,12,10,''),(4753,27220,13,10,''),(4754,27218,14,10,''),(4755,27218,15,1,'8'),(4756,27221,16,10,''),(4757,27221,17,1,'8'),(4758,27217,18,10,''),(4759,27252,19,10,''),(4760,27258,20,1,'1000000'),(4761,27255,21,10,''),(4762,27256,22,10,''),(4763,27254,23,10,''),(4764,27254,24,1,'8'),(4765,27257,25,10,''),(4766,27257,26,1,'8'),(4767,27253,27,10,''),(4768,27273,28,10,''),(4769,27279,29,1,'1000000'),(4770,27276,30,10,''),(4771,27277,31,10,''),(4772,27275,32,10,''),(4773,27275,33,1,'8'),(4774,27278,34,10,''),(4775,27278,35,1,'8'),(4776,27274,36,10,''),(4777,27322,37,10,''),(4778,27328,38,1,'1000000'),(4779,27325,39,10,''),(4780,27326,40,10,''),(4781,27324,41,10,''),(4782,27324,42,1,'8'),(4783,27327,43,10,''),(4784,27327,44,1,'8'),(4785,27323,45,10,''),(4786,27451,46,10,''),(4787,27457,47,1,'1000000'),(4788,27454,48,10,''),(4789,27455,49,10,''),(4790,27453,50,10,''),(4791,27453,51,1,'8'),(4792,27456,52,10,''),(4793,27456,53,1,'8'),(4794,27452,54,10,''),(4795,27487,55,10,''),(4796,27493,56,1,'1000000'),(4797,27490,57,10,''),(4798,27491,58,10,''),(4799,27489,59,10,''),(4800,27489,60,1,'8'),(4801,27492,61,10,''),(4802,27492,62,1,'8'),(4803,27488,63,10,''),(4804,27521,64,10,''),(4805,27527,65,1,'1000000'),(4806,27524,66,10,''),(4807,27525,67,10,''),(4808,27523,68,10,''),(4809,27523,69,1,'8'),(4810,27526,70,10,''),(4811,27526,71,1,'8'),(4812,27522,72,10,''),(4813,27557,73,10,''),(4814,27563,74,1,'1000000'),(4815,27560,75,10,''),(4816,27561,76,10,''),(4817,27559,77,10,''),(4818,27559,78,1,'8'),(4819,27562,79,10,''),(4820,27562,80,1,'8'),(4821,27558,81,10,''),(4822,27643,82,10,''),(4823,27649,83,1,'1000000'),(4824,27646,84,10,''),(4825,27647,85,10,''),(4826,27645,86,10,''),(4827,27645,87,1,'8'),(4828,27648,88,10,''),(4829,27648,89,1,'8'),(4830,27644,90,10,''),(4831,27723,91,10,''),(4832,27729,92,1,'1000000'),(4833,27726,93,10,''),(4834,27727,94,10,''),(4835,27725,95,10,''),(4836,27725,96,1,'8'),(4837,27728,97,10,''),(4838,27728,98,1,'8'),(4839,27724,99,10,''),(4840,27757,100,10,''),(4841,27763,101,1,'1000000'),(4842,27760,102,10,''),(4843,27761,103,10,''),(4844,27759,104,10,''),(4845,27759,105,1,'8'),(4846,27762,106,10,''),(4847,27762,107,1,'8'),(4848,27758,108,10,''),(4849,27789,109,10,''),(4850,27795,110,1,'1000000'),(4851,27792,111,10,''),(4852,27793,112,10,''),(4853,27791,113,10,''),(4854,27791,114,1,'8'),(4855,27794,115,10,''),(4856,27794,116,1,'8'),(4857,27790,117,10,''),(4858,27873,118,10,''),(4859,27879,119,1,'1000000'),(4860,27876,120,10,''),(4861,27877,121,10,''),(4862,27875,122,10,''),(4863,27875,123,1,'8'),(4864,27878,124,10,''),(4865,27878,125,1,'8'),(4866,27874,126,10,''),(4867,27910,127,10,''),(4868,27916,128,1,'1000000'),(4869,27913,129,10,''),(4870,27914,130,10,''),(4871,27912,131,10,''),(4872,27912,132,1,'8'),(4873,27915,133,10,''),(4874,27915,134,1,'8'),(4875,27911,135,10,''),(4876,27945,136,10,''),(4877,27951,137,1,'1000000'),(4878,27948,138,10,''),(4879,27949,139,10,''),(4880,27947,140,10,''),(4881,27947,141,1,'8'),(4882,27950,142,10,''),(4883,27950,143,1,'8'),(4884,27946,144,10,''),(4885,28059,145,10,''),(4886,28065,146,1,'1000000'),(4887,28062,147,10,''),(4888,28063,148,10,''),(4889,28061,149,10,''),(4890,28061,150,1,'8'),(4891,28064,151,10,''),(4892,28064,152,1,'8'),(4893,28060,153,10,''),(4894,28119,154,10,''),(4895,28125,155,1,'1000000'),(4896,28122,156,10,''),(4897,28123,157,10,''),(4898,28121,158,10,''),(4899,28121,159,1,'8'),(4900,28124,160,10,''),(4901,28124,161,1,'8'),(4902,28120,162,10,''),(4903,28176,163,10,''),(4904,28182,164,1,'1000000'),(4905,28179,165,10,''),(4906,28180,166,10,''),(4907,28178,167,10,''),(4908,28178,168,1,'8'),(4909,28181,169,10,''),(4910,28181,170,1,'8'),(4911,28177,171,10,''),(4912,28224,172,10,''),(4913,28230,173,1,'1000000'),(4914,28227,174,10,''),(4915,28228,175,10,''),(4916,28226,176,10,''),(4917,28226,177,1,'8'),(4918,28229,178,10,''),(4919,28229,179,1,'8'),(4920,28225,180,10,''),(4921,27148,1,1,'0.01'),(4922,27617,1,1,'0.01'),(4923,28024,2,1,'0.01'),(4924,27897,1,1,'0.1'),(4925,27898,2,1,'1024'),(4926,27900,3,1,'1024'),(4927,27905,1,1,'0.1'),(4928,27907,2,1,'1024'),(4929,27908,3,1,'1024'),(4930,27203,1,5,'^(\\w|-|\\.|/)+ (\\w|-|\\.|/)+ (.+) Copyright\n\\3'),(4931,27204,2,5,'^((\\w|-|\\.|/)+)\n\\1'),(4932,27206,3,1,'1024'),(4933,27207,4,1,'1024'),(4934,27777,1,5,'Firmware Version: ([0-9.]+),\n\\1'),(4935,27778,2,5,'(.+) - Firmware\n\\1'),(4936,27377,1,5,'Version (.+), RELEASE\n\\1'),(4937,27381,1,5,'Version (.+), RELEASE\n\\1'),(4938,27384,2,5,'Version (.+), RELEASE\n\\1'),(4939,28211,3,5,'Version (.+), RELEASE\n\\1'),(4940,27591,1,1,'1024'),(4941,27592,2,1,'1024'),(4942,27811,1,5,'kernel (JUNOS [0-9a-zA-Z\\.]+)\n\\1'),(4943,27314,1,1,'0.5'),(4944,27315,2,1,'0.5'),(4945,27318,3,1,'0.5'),(4946,28201,1,1,'0.1'),(4947,27936,1,5,'60 Secs \\( ([0-9\\.]+)%\\).+300 Secs\n\\1'),(4948,28029,1,1,'1024'),(4949,28030,2,1,'1024');
/*!40000 ALTER TABLE `item_preproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_oid` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `history` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '90d',
  `trends` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '365d',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `units` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_securityname` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `formula` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `params` text COLLATE utf8_bin NOT NULL,
  `ipmi_sensor` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `publickey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `privatekey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '30d',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `jmx_endpoint` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_itemid` bigint(20) unsigned DEFAULT NULL,
  `timeout` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '3s',
  `url` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `query_fields` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `posts` text COLLATE utf8_bin NOT NULL,
  `status_codes` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '200',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `post_type` int(11) NOT NULL DEFAULT '0',
  `http_proxy` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `headers` text COLLATE utf8_bin NOT NULL,
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `request_method` int(11) NOT NULL DEFAULT '1',
  `output_format` int(11) NOT NULL DEFAULT '0',
  `ssl_cert_file` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  `allow_traps` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  KEY `items_7` (`master_itemid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_5` FOREIGN KEY (`master_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (7293,1,10016),(7296,1,10025),(7308,1,10055),(7324,1,10056),(7282,1,10057),(7289,1,10058),(7306,1,17318),(7280,1,17352),(7378,5,22452),(7379,5,22454),(7376,5,22456),(7375,5,22458),(7377,5,22686),(7374,7,22446),(7373,7,22448),(7307,9,10009),(7309,9,10013),(7303,13,10010),(7320,13,17354),(7285,13,17356),(7316,13,17358),(7283,13,17360),(7314,13,17362),(7297,13,22665),(7299,13,22668),(7318,13,22671),(7310,13,22674),(7312,13,22677),(7322,13,22680),(7301,13,22683),(7277,15,10014),(7291,15,10026),(7287,15,10030),(7278,15,17350),(7290,15,22181),(7304,17,10010),(7321,17,17354),(7286,17,17356),(7317,17,17358),(7284,17,17360),(7315,17,17362),(7298,17,22665),(7300,17,22668),(7319,17,22671),(7311,17,22674),(7313,17,22677),(7323,17,22680),(7302,17,22683),(7295,21,10025),(7281,21,10057),(7288,21,10058),(7305,21,17318),(7279,21,17352),(7294,23,10016),(7292,23,10019),(15407,179,22183),(15409,179,22185),(15429,179,22187),(15401,179,22189),(15395,179,22191),(15402,179,22196),(15404,179,22199),(15399,179,22219),(15408,179,22396),(15425,179,22399),(15397,179,22400),(15398,179,22401),(15413,179,22402),(15396,179,22404),(15418,179,22406),(15419,179,22408),(15415,179,22412),(15421,179,22414),(15423,179,22416),(15420,179,22418),(15428,179,22420),(15417,179,22422),(15412,179,22424),(15410,179,22426),(15416,179,22430),(15424,179,22689),(15411,179,23171),(15400,179,23251),(15406,179,23634),(15405,179,23661),(15403,179,23663),(15422,179,25366),(15414,179,25370),(15426,179,25665),(15427,179,25666),(15393,179,28248),(6983,206,22231),(6984,206,22232),(6985,206,23318),(6987,207,10020),(6986,207,10059),(6988,207,23319),(6990,252,22833),(6989,252,22834),(6991,252,23320),(7441,253,22840),(7456,253,22841),(7446,253,22842),(7448,253,22843),(7454,253,22844),(7452,253,22845),(7450,253,22846),(7437,253,22848),(7435,253,22851),(7423,253,22852),(7464,254,22868),(7465,254,22869),(7462,254,22870),(7461,254,22871),(7463,254,22872),(7439,255,22839),(7421,255,22853),(7419,255,22854),(7426,255,22858),(7433,255,22859),(7417,256,22855),(7418,256,22856),(7425,256,22857),(7428,256,22862),(7429,256,22863),(7460,257,23075),(7459,257,23076),(7458,258,22835),(7445,258,22836),(7440,258,22839),(7422,258,22853),(7420,258,22854),(7427,258,22858),(7434,258,22859),(7431,258,22860),(7442,259,22840),(7457,259,22841),(7447,259,22842),(7449,259,22843),(7455,259,22844),(7453,259,22845),(7451,259,22846),(7438,259,22848),(7436,259,22851),(7424,259,22852),(7444,260,22837),(7443,260,22838),(7432,261,22860),(7430,261,22861),(6993,262,22873),(6992,262,22874),(6994,262,23321),(7220,263,22880),(7235,263,22881),(7225,263,22882),(7227,263,22883),(7233,263,22884),(7231,263,22885),(7229,263,22886),(7216,263,22888),(7214,263,22891),(7202,263,22892),(7243,264,22908),(7244,264,22909),(7241,264,22910),(7240,264,22911),(7242,264,22912),(7218,265,22879),(7200,265,22893),(7198,265,22894),(7205,265,22898),(7212,265,22899),(7196,266,22895),(7197,266,22896),(7204,266,22897),(7207,266,22902),(7208,266,22903),(7239,267,23073),(7238,267,23074),(7237,268,22875),(7224,268,22876),(7219,268,22879),(7201,268,22893),(7199,268,22894),(7206,268,22898),(7213,268,22899),(7210,268,22900),(7221,269,22880),(7236,269,22881),(7226,269,22882),(7228,269,22883),(7234,269,22884),(7232,269,22885),(7230,269,22886),(7217,269,22888),(7215,269,22891),(7203,269,22892),(7223,270,22877),(7222,270,22878),(7211,271,22900),(7209,271,22901),(6996,272,22913),(6995,272,22914),(6997,272,23322),(7160,273,22920),(7155,273,22921),(7162,273,22922),(7157,273,22923),(7149,273,22924),(7164,273,23108),(7167,273,23109),(7180,273,23110),(7182,273,23111),(7185,273,23112),(7178,273,23113),(7176,273,23114),(7170,273,23115),(7147,273,23118),(7145,273,23119),(7126,273,23120),(7128,273,23121),(7124,273,23123),(7194,274,22948),(7195,274,22949),(7192,274,22950),(7191,274,22951),(7193,274,22952),(7172,274,23116),(7174,274,23117),(7151,275,22933),(7153,275,22934),(7143,275,22938),(7139,275,22939),(7135,276,22942),(7136,276,22943),(7130,276,23122),(7123,276,23124),(7120,276,23125),(7121,276,23126),(7122,276,23127),(7132,276,23128),(7133,276,23129),(7141,276,23130),(7142,276,23131),(7190,277,22945),(7189,277,22946),(7152,278,22933),(7154,278,22934),(7144,278,22938),(7140,278,22939),(7137,278,22940),(7161,279,22920),(7156,279,22921),(7163,279,22922),(7158,279,22923),(7150,279,22924),(7166,279,23108),(7169,279,23109),(7181,279,23110),(7184,279,23111),(7187,279,23112),(7179,279,23113),(7177,279,23114),(7171,279,23115),(7173,279,23116),(7175,279,23117),(7146,279,23119),(7127,279,23120),(7129,279,23121),(7131,279,23122),(7125,279,23123),(7188,280,22917),(7159,280,22918),(7138,281,22940),(7134,281,22941),(6999,282,22953),(6998,282,22954),(7000,282,23323),(7258,283,22961),(7268,283,22962),(7260,283,22963),(7262,283,22965),(7264,283,22968),(7266,283,22971),(7256,283,22972),(7275,284,22988),(7276,284,22989),(7273,284,22990),(7272,284,22991),(7274,284,22992),(7254,285,22973),(7247,285,22974),(7245,285,22978),(7253,286,22982),(7252,286,22983),(7271,287,22985),(7270,287,22986),(7255,288,22973),(7248,288,22974),(7246,288,22978),(7249,288,22980),(7259,289,22961),(7269,289,22962),(7261,289,22963),(7263,289,22965),(7265,289,22968),(7267,289,22971),(7257,289,22972),(7250,291,22980),(7251,291,22981),(7002,292,22993),(7001,292,22994),(7003,292,23324),(7486,293,23000),(7502,293,23001),(7492,293,23002),(7494,293,23003),(7500,293,23004),(7498,293,23005),(7496,293,23007),(7484,293,23011),(7482,293,23012),(7510,294,23028),(7511,294,23029),(7508,294,23030),(7507,294,23031),(7509,294,23032),(7488,295,22999),(7471,295,23013),(7469,295,23014),(7473,295,23018),(7475,295,23019),(7468,296,23015),(7466,296,23016),(7467,296,23017),(7478,296,23022),(7477,296,23023),(7506,297,23025),(7505,297,23026),(7504,298,22996),(7489,298,22999),(7472,298,23013),(7470,298,23014),(7474,298,23018),(7476,298,23019),(7480,298,23020),(7487,299,23000),(7503,299,23001),(7493,299,23002),(7495,299,23003),(7501,299,23004),(7499,299,23005),(7497,299,23007),(7485,299,23011),(7483,299,23012),(7491,300,22997),(7490,300,22998),(7481,301,23020),(7479,301,23021),(7005,302,23033),(7004,302,23034),(7006,302,23325),(7400,303,23041),(7409,303,23042),(7407,303,23043),(7415,304,23068),(7416,304,23069),(7413,304,23070),(7412,304,23071),(7414,304,23072),(7405,305,23039),(7398,305,23053),(7391,305,23054),(7389,305,23058),(7387,305,23059),(7397,306,23062),(7396,306,23063),(7402,307,23077),(7404,307,23078),(7411,308,23035),(7403,308,23036),(7406,308,23039),(7399,308,23053),(7392,308,23054),(7390,308,23058),(7388,308,23059),(7393,308,23060),(7401,309,23041),(7410,309,23042),(7408,309,23043),(7394,311,23060),(7395,311,23061),(7512,319,23149),(7516,319,23150),(7528,320,23134),(7530,320,23135),(7535,320,23136),(7526,320,23137),(7532,320,23143),(7521,320,23144),(7523,320,23145),(7538,321,23666),(7527,322,23134),(7529,322,23135),(7534,322,23136),(7525,322,23137),(7542,322,23164),(7541,322,23165),(7540,322,23167),(7539,322,23168),(7524,323,23138),(7513,323,23149),(7533,324,23140),(7531,325,23143),(7520,325,23144),(7522,325,23145),(7515,328,23147),(7514,328,23148),(7517,328,23158),(7519,328,23159),(7518,328,23668),(7008,329,23160),(7007,329,23161),(7009,329,23326),(7537,330,23169),(7536,330,23170),(7165,331,23108),(7168,331,23109),(7183,331,23111),(7186,331,23112),(7148,331,23118),(15447,345,23252),(15450,345,23253),(15451,345,23255),(15452,345,23256),(15453,345,23257),(15454,345,23258),(15448,345,23259),(15455,345,23260),(15458,345,23261),(15459,345,23262),(15460,345,23264),(15463,345,23265),(15456,345,23266),(15446,345,23267),(15445,345,23268),(15431,345,23269),(15432,345,23270),(15434,345,23271),(15435,345,23272),(15436,345,23273),(15442,345,23274),(15443,345,23275),(15444,345,23276),(15464,345,23277),(15433,345,23328),(15430,345,23620),(15437,345,23625),(15439,345,23628),(15441,345,23635),(15440,345,23662),(15438,345,23664),(15457,345,25367),(15449,345,25371),(15461,345,25667),(15462,345,25668),(15394,345,28249),(7349,346,23294),(7360,346,23295),(7351,346,23296),(7358,346,23297),(7370,346,23298),(7368,346,23299),(7366,346,23300),(7362,346,23301),(7364,346,23302),(7347,346,23303),(7345,346,23304),(7331,346,23305),(7333,346,23306),(7386,347,23282),(7385,347,23283),(7384,347,23284),(7383,347,23285),(7382,347,23286),(7354,348,23293),(7330,348,23307),(7328,348,23308),(7337,348,23312),(7344,348,23313),(7325,349,23309),(7326,349,23310),(7335,349,23311),(7338,349,23316),(7339,349,23317),(7381,350,23280),(7380,350,23281),(7372,351,23289),(7356,351,23290),(7353,351,23293),(7329,351,23307),(7327,351,23308),(7336,351,23312),(7343,351,23313),(7341,351,23314),(7350,352,23294),(7361,352,23295),(7352,352,23296),(7359,352,23297),(7371,352,23298),(7369,352,23299),(7367,352,23300),(7363,352,23301),(7365,352,23302),(7348,352,23303),(7346,352,23304),(7332,352,23305),(7334,352,23306),(7357,353,23291),(7355,353,23292),(7342,354,23314),(7340,354,23315),(7011,355,23287),(7010,355,23288),(7012,355,23327),(7019,356,23340),(7020,356,23341),(7021,356,23342),(7023,356,23343),(7016,356,23344),(7014,356,23345),(7013,356,23346),(7035,356,23347),(7024,356,23348),(7031,356,23349),(7025,356,23350),(7026,356,23351),(7027,356,23352),(7029,356,23353),(7030,356,23354),(7032,356,23355),(7034,356,23356),(7022,356,23357),(7018,356,23358),(7017,356,23359),(7028,356,23360),(7033,356,25368),(7015,356,25369),(7036,356,28250),(7037,356,28251),(6917,446,23644),(6974,447,23645),(6973,448,23646),(6975,449,23647),(6976,450,23648),(6977,451,23649),(6978,452,23650),(6979,453,23651),(6980,454,23652),(6981,455,23653),(6982,456,23654),(6887,727,26826),(6888,727,26827),(6892,727,26831),(6893,727,26832),(6904,727,26843),(6905,727,26844),(6906,727,26845),(6907,727,26846),(6916,727,26855),(6885,728,26824),(6897,728,26836),(6898,728,26837),(6899,728,26838),(6902,728,26841),(6903,728,26842),(6908,728,26847),(6909,728,26848),(6914,728,26853),(6894,729,26833),(6895,729,26834),(6896,729,26835),(6910,729,26849),(6911,729,26850),(6912,729,26851),(6913,729,26852),(6915,729,26854),(6889,730,26828),(6890,730,26829),(6891,730,26830),(6900,730,26839),(6901,730,26840),(6886,731,26825),(6953,732,26891),(6954,732,26892),(6972,732,26910),(6955,733,26893),(6956,733,26894),(6946,734,26884),(6947,734,26885),(6948,734,26886),(6949,734,26887),(6950,734,26888),(6951,734,26889),(6952,734,26890),(6957,734,26895),(6958,734,26896),(6959,734,26897),(6967,734,26905),(6968,734,26906),(6960,735,26898),(6961,735,26899),(6965,735,26903),(6966,735,26904),(6969,735,26907),(6970,735,26908),(6971,735,26909),(6918,736,26856),(6919,736,26857),(6920,736,26858),(6921,736,26859),(6922,736,26860),(6923,736,26861),(6924,736,26862),(6925,736,26863),(6926,736,26864),(6927,736,26865),(6928,736,26866),(6929,736,26867),(6930,736,26868),(6931,736,26869),(6939,736,26877),(6940,736,26878),(6944,736,26882),(6945,736,26883),(6962,736,26900),(6963,736,26901),(6964,736,26902),(6941,737,26879),(6942,737,26880),(6943,737,26881),(6933,738,26871),(6937,738,26875),(6938,738,26876),(6932,739,26870),(6934,739,26872),(6935,739,26873),(6936,739,26874),(7106,740,26911),(7107,740,26912),(7108,740,26913),(7109,740,26914),(7110,740,26915),(7111,740,26916),(7112,740,26917),(7113,740,26918),(7114,740,26919),(7115,740,26920),(7116,740,26921),(7117,740,26922),(7118,740,26923),(7119,740,26924),(7545,741,26927),(7546,742,26928),(7543,743,26925),(7544,743,26926),(7547,743,26929),(7548,743,26930),(7549,743,26931),(7550,743,26932),(7553,744,26935),(7554,744,26936),(7551,745,26933),(7561,745,26943),(7552,746,26934),(7555,746,26937),(7556,746,26938),(7557,746,26939),(7558,746,26940),(7559,746,26941),(7560,746,26942),(7610,747,26994),(7562,748,26944),(7563,748,26945),(7564,749,26946),(7575,750,26957),(7576,750,26958),(7577,750,26959),(7615,751,26999),(7616,751,27000),(7617,751,27001),(7618,751,27002),(7619,752,27003),(7620,752,27004),(7621,752,27005),(7622,752,27006),(7568,753,26950),(7570,753,26952),(7578,753,26960),(7579,753,26961),(7583,753,26965),(7611,754,26995),(7612,754,26996),(7613,754,26997),(7614,754,26998),(7565,755,26947),(7566,755,26948),(7567,755,26949),(7573,755,26955),(7574,755,26956),(7580,755,26962),(7581,755,26963),(7582,755,26964),(7569,757,26951),(7571,757,26953),(7572,757,26954),(7595,758,26977),(7599,758,26980),(7600,758,26981),(7602,758,26982),(7607,758,26985),(7623,759,27007),(7624,759,27008),(7625,759,27009),(7626,759,27010),(7588,760,26970),(7589,760,26971),(7590,760,26972),(7591,760,26973),(7592,760,26974),(7597,760,26978),(7598,760,26979),(7609,760,26986),(7593,761,26975),(7594,761,26976),(7596,761,26977),(7601,761,26981),(7603,761,26982),(7604,761,26983),(7605,761,26984),(7608,761,26985),(7586,762,26968),(7587,762,26969),(7606,762,26984),(7584,763,26966),(7585,763,26967),(18535,770,27030),(18537,771,27032),(18911,772,27040),(18912,772,27041),(18913,772,27042),(18917,772,27046),(18918,772,27047),(18919,772,27048),(18908,773,27037),(18909,773,27038),(18910,773,27039),(18914,774,27043),(18915,774,27044),(18916,774,27045),(18907,775,27036),(18924,776,27056),(18925,776,27057),(18926,776,27058),(18930,776,27062),(18931,776,27063),(18932,776,27064),(18921,777,27053),(18922,777,27054),(18923,777,27055),(18927,778,27059),(18928,778,27060),(18929,778,27061),(18920,779,27052),(18604,780,27065),(18605,780,27066),(18606,780,27067),(18550,781,27069),(18551,781,27070),(18552,781,27071),(18553,781,27072),(18554,781,27073),(18555,781,27074),(18556,781,27075),(18557,781,27076),(18558,781,27077),(18577,782,27079),(18578,782,27080),(18579,782,27081),(18580,782,27082),(18581,782,27083),(18582,782,27084),(18583,782,27085),(18584,782,27086),(18585,782,27087),(18709,783,27089),(18710,783,27090),(18711,783,27091),(18712,783,27092),(18713,783,27093),(18714,783,27094),(18715,783,27095),(18716,783,27096),(18717,783,27097),(18718,784,27099),(18719,784,27100),(18720,784,27101),(18721,784,27102),(18722,784,27103),(18723,784,27104),(18724,784,27105),(18725,784,27106),(18726,784,27107),(18691,786,27119),(18692,786,27120),(18693,786,27121),(18694,786,27122),(18695,786,27123),(18696,786,27124),(18697,786,27125),(18698,786,27126),(18699,786,27127),(18609,797,27138),(18608,797,27139),(18607,797,27140),(18974,797,27143),(18979,797,27148),(18972,798,27141),(18973,798,27142),(18975,798,27144),(18976,798,27145),(18977,798,27146),(18978,798,27147),(18612,799,27149),(18611,799,27150),(18610,799,27151),(18337,799,27154),(18342,799,27159),(18335,800,27152),(18336,800,27153),(18338,800,27155),(18339,800,27156),(18340,800,27157),(18341,800,27158),(18727,803,27181),(18734,803,27182),(18732,803,27183),(18730,803,27184),(18731,803,27185),(18733,803,27186),(18729,803,27187),(18735,803,27188),(18728,803,27189),(18538,803,27191),(18348,804,27195),(18347,804,27196),(18344,804,27197),(18349,804,27198),(18343,804,27199),(18346,804,27200),(18615,805,27192),(18614,805,27193),(18613,805,27194),(18350,805,27201),(18345,805,27202),(19014,806,27208),(19011,807,27205),(19012,807,27206),(19013,807,27207),(19015,808,27212),(19016,809,27213),(19009,810,27203),(19010,810,27204),(19017,810,27214),(18736,811,27216),(18743,811,27217),(18741,811,27218),(18739,811,27219),(18740,811,27220),(18742,811,27221),(18738,811,27222),(18744,811,27223),(18737,811,27224),(18356,812,27228),(18355,812,27229),(18352,812,27230),(18357,812,27231),(18351,812,27232),(18354,812,27233),(18618,813,27225),(18617,813,27226),(18616,813,27227),(18358,813,27234),(18353,813,27235),(19189,813,27238),(19191,814,27240),(19190,815,27239),(19192,816,27246),(19193,816,27247),(19194,817,27248),(19195,818,27249),(19196,818,27250),(19187,819,27236),(19188,819,27237),(18745,820,27252),(18752,820,27253),(18750,820,27254),(18748,820,27255),(18749,820,27256),(18751,820,27257),(18747,820,27258),(18753,820,27259),(18746,820,27260),(18364,821,27264),(18363,821,27265),(18360,821,27266),(18365,821,27267),(18359,821,27268),(18362,821,27269),(18621,822,27261),(18620,822,27262),(18619,822,27263),(18366,822,27270),(18361,822,27271),(18754,823,27273),(18761,823,27274),(18759,823,27275),(18757,823,27276),(18758,823,27277),(18760,823,27278),(18756,823,27279),(18762,823,27280),(18755,823,27281),(18372,824,27285),(18371,824,27286),(18368,824,27287),(18373,824,27288),(18367,824,27289),(18370,824,27290),(18624,825,27282),(18623,825,27283),(18622,825,27284),(18374,825,27291),(18369,825,27292),(19163,826,27294),(19162,827,27293),(19173,828,27314),(19174,828,27315),(19171,829,27312),(19172,830,27313),(19164,831,27295),(19165,831,27296),(19177,832,27318),(19175,833,27316),(19176,834,27317),(19166,835,27297),(19178,835,27319),(19179,835,27320),(19168,836,27299),(19167,837,27298),(19170,838,27301),(19169,839,27300),(18763,840,27322),(18770,840,27323),(18768,840,27324),(18766,840,27325),(18767,840,27326),(18769,840,27327),(18765,840,27328),(18771,840,27329),(18764,840,27330),(18539,840,27332),(18380,841,27336),(18379,841,27337),(18376,841,27338),(18381,841,27339),(18375,841,27340),(18378,841,27341),(18627,842,27333),(18626,842,27334),(18625,842,27335),(18382,842,27342),(18377,842,27343),(18388,846,27368),(18387,846,27369),(18384,846,27370),(18389,846,27371),(18383,846,27372),(18386,846,27373),(18630,847,27365),(18629,847,27366),(18628,847,27367),(18390,847,27374),(18385,847,27375),(19057,848,27414),(19058,848,27415),(19059,848,27416),(19060,849,27417),(19043,851,27376),(19044,852,27377),(19045,852,27378),(19046,852,27379),(19062,852,27419),(19063,853,27420),(19064,853,27421),(19065,854,27422),(19066,855,27423),(19067,856,27424),(19068,856,27425),(19069,856,27426),(19070,857,27427),(19051,858,27384),(19052,858,27385),(19053,858,27386),(19071,858,27428),(19072,859,27429),(19073,859,27430),(19074,860,27431),(19075,861,27432),(19076,868,27442),(19077,868,27443),(19078,868,27444),(19047,869,27380),(19048,870,27381),(19049,870,27382),(19050,870,27383),(19079,870,27445),(19080,871,27446),(19081,871,27447),(19082,872,27448),(19083,873,27449),(18772,874,27451),(18779,874,27452),(18777,874,27453),(18775,874,27454),(18776,874,27455),(18778,874,27456),(18774,874,27457),(18780,874,27458),(18773,874,27459),(18540,874,27461),(18396,875,27465),(18395,875,27466),(18392,875,27467),(18397,875,27468),(18391,875,27469),(18394,875,27470),(18633,876,27462),(18632,876,27463),(18631,876,27464),(18398,876,27471),(18393,876,27472),(19019,877,27478),(19018,878,27477),(19026,879,27485),(19020,880,27479),(19021,881,27480),(19022,882,27481),(19023,882,27482),(19024,882,27483),(19025,882,27484),(18781,883,27487),(18788,883,27488),(18786,883,27489),(18784,883,27490),(18785,883,27491),(18787,883,27492),(18783,883,27493),(18789,883,27494),(18782,883,27495),(18404,884,27499),(18403,884,27500),(18400,884,27501),(18405,884,27502),(18399,884,27503),(18402,884,27504),(18636,885,27496),(18635,885,27497),(18634,885,27498),(18406,885,27505),(18401,885,27506),(19112,886,27511),(19113,887,27516),(19114,888,27517),(19116,889,27519),(19115,890,27518),(19108,891,27507),(19109,891,27508),(19110,891,27509),(19111,891,27510),(18790,892,27521),(18797,892,27522),(18795,892,27523),(18793,892,27524),(18794,892,27525),(18796,892,27526),(18792,892,27527),(18798,892,27528),(18791,892,27529),(18541,892,27531),(18412,893,27535),(18411,893,27536),(18408,893,27537),(18413,893,27538),(18407,893,27539),(18410,893,27540),(18639,894,27532),(18638,894,27533),(18637,894,27534),(18414,894,27541),(18409,894,27542),(19038,895,27547),(19039,896,27552),(19040,897,27553),(19042,898,27555),(19041,899,27554),(19034,900,27543),(19035,900,27544),(19036,900,27545),(19037,900,27546),(18799,901,27557),(18806,901,27558),(18804,901,27559),(18802,901,27560),(18803,901,27561),(18805,901,27562),(18801,901,27563),(18807,901,27564),(18800,901,27565),(18542,901,27567),(18420,902,27571),(18419,902,27572),(18416,902,27573),(18421,902,27574),(18415,902,27575),(18418,902,27576),(18642,903,27568),(18641,903,27569),(18640,903,27570),(18422,903,27577),(18417,903,27578),(19124,904,27586),(19125,905,27590),(19126,905,27591),(19127,905,27592),(19122,906,27584),(19123,906,27585),(19128,907,27593),(19129,908,27594),(19130,908,27595),(19117,909,27579),(19118,909,27580),(19119,909,27581),(19120,909,27582),(19121,909,27583),(18559,910,27597),(18566,910,27598),(18564,910,27599),(18562,910,27600),(18563,910,27601),(18565,910,27602),(18561,910,27603),(18567,910,27604),(18560,910,27605),(18536,910,27607),(18985,911,27611),(18984,911,27612),(18981,911,27613),(18986,911,27614),(18980,911,27615),(18983,911,27616),(18645,912,27608),(18644,912,27609),(18643,912,27610),(18987,912,27617),(18982,912,27618),(18586,913,27620),(18593,913,27621),(18591,913,27622),(18589,913,27623),(18590,913,27624),(18592,913,27625),(18588,913,27626),(18594,913,27627),(18587,913,27628),(18543,913,27630),(18428,914,27634),(18427,914,27635),(18424,914,27636),(18429,914,27637),(18423,914,27638),(18426,914,27639),(18648,915,27631),(18647,915,27632),(18646,915,27633),(18430,915,27640),(18425,915,27641),(18808,916,27643),(18815,916,27644),(18813,916,27645),(18811,916,27646),(18812,916,27647),(18814,916,27648),(18810,916,27649),(18816,916,27650),(18809,916,27651),(18544,916,27653),(18436,917,27657),(18435,917,27658),(18432,917,27659),(18437,917,27660),(18431,917,27661),(18434,917,27662),(18651,918,27654),(18650,918,27655),(18649,918,27656),(18438,918,27663),(18433,918,27664),(19132,919,27671),(19131,920,27670),(19133,921,27672),(19134,922,27673),(19135,923,27674),(19136,924,27675),(19137,924,27676),(19138,924,27677),(19139,924,27678),(19140,924,27679),(18817,934,27723),(18824,934,27724),(18822,934,27725),(18820,934,27726),(18821,934,27727),(18823,934,27728),(18819,934,27729),(18825,934,27730),(18818,934,27731),(18545,934,27733),(18444,935,27737),(18443,935,27738),(18440,935,27739),(18445,935,27740),(18439,935,27741),(18442,935,27742),(18654,936,27734),(18653,936,27735),(18652,936,27736),(18446,936,27743),(18441,936,27744),(19202,937,27753),(19201,938,27752),(19200,939,27751),(19204,940,27755),(19197,941,27748),(19198,941,27749),(19199,941,27750),(19203,941,27754),(18826,942,27757),(18833,942,27758),(18831,942,27759),(18829,942,27760),(18830,942,27761),(18832,942,27762),(18828,942,27763),(18834,942,27764),(18827,942,27765),(18452,943,27769),(18451,943,27770),(18448,943,27771),(18453,943,27772),(18447,943,27773),(18450,943,27774),(18657,944,27766),(18656,944,27767),(18655,944,27768),(18454,944,27775),(18449,944,27776),(19029,945,27783),(19030,945,27784),(19032,946,27786),(19033,947,27787),(19027,948,27777),(19028,948,27778),(19031,948,27785),(18835,949,27789),(18842,949,27790),(18840,949,27791),(18838,949,27792),(18839,949,27793),(18841,949,27794),(18837,949,27795),(18843,949,27796),(18836,949,27797),(18546,949,27799),(18460,950,27803),(18459,950,27804),(18456,950,27805),(18461,950,27806),(18455,950,27807),(18458,950,27808),(18660,951,27800),(18659,951,27801),(18658,951,27802),(18462,951,27809),(18457,951,27810),(19156,951,27814),(19158,952,27820),(19157,953,27819),(19159,954,27821),(19161,955,27823),(19160,956,27822),(19153,957,27811),(19154,957,27812),(19155,957,27813),(18844,969,27873),(18851,969,27874),(18849,969,27875),(18847,969,27876),(18848,969,27877),(18850,969,27878),(18846,969,27879),(18852,969,27880),(18845,969,27881),(18468,970,27885),(18467,970,27886),(18464,970,27887),(18469,970,27888),(18463,970,27889),(18466,970,27890),(18663,971,27882),(18662,971,27883),(18661,971,27884),(18470,971,27891),(18465,971,27892),(19004,972,27904),(19001,973,27898),(19002,973,27899),(19003,973,27900),(19000,974,27897),(19005,974,27905),(19006,975,27906),(19007,975,27907),(19008,975,27908),(18996,976,27893),(18997,976,27894),(18998,976,27895),(18999,976,27896),(18853,977,27910),(18860,977,27911),(18858,977,27912),(18856,977,27913),(18857,977,27914),(18859,977,27915),(18855,977,27916),(18861,977,27917),(18854,977,27918),(18476,978,27922),(18475,978,27923),(18472,978,27924),(18477,978,27925),(18471,978,27926),(18474,978,27927),(18666,979,27919),(18665,979,27920),(18664,979,27921),(18478,979,27928),(18473,979,27929),(19211,980,27936),(19208,981,27933),(19209,981,27934),(19210,981,27935),(19212,982,27940),(19213,982,27941),(19215,983,27943),(19214,984,27942),(19205,985,27930),(19206,985,27931),(19207,985,27932),(18862,986,27945),(18869,986,27946),(18867,986,27947),(18865,986,27948),(18866,986,27949),(18868,986,27950),(18864,986,27951),(18870,986,27952),(18863,986,27953),(18547,986,27955),(18484,987,27959),(18483,987,27960),(18480,987,27961),(18485,987,27962),(18479,987,27963),(18482,987,27964),(18669,988,27956),(18668,988,27957),(18667,988,27958),(18486,988,27965),(18481,988,27966),(19107,989,27975),(19104,990,27972),(19105,990,27973),(19106,990,27974),(19099,991,27967),(19100,991,27968),(19101,991,27969),(19102,991,27970),(19103,991,27971),(18595,992,27977),(18602,992,27978),(18600,992,27979),(18598,992,27980),(18599,992,27981),(18601,992,27982),(18597,992,27983),(18603,992,27984),(18596,992,27985),(18492,993,27989),(18491,993,27990),(18488,993,27991),(18493,993,27992),(18487,993,27993),(18490,993,27994),(18672,994,27986),(18671,994,27987),(18670,994,27988),(18494,994,27995),(18489,994,27996),(19097,995,28003),(19098,996,28004),(19093,997,27997),(19094,997,27998),(19095,997,27999),(19096,997,28000),(18568,998,28006),(18575,998,28007),(18573,998,28008),(18571,998,28009),(18572,998,28010),(18574,998,28011),(18570,998,28012),(18576,998,28013),(18569,998,28014),(18993,999,28018),(18992,999,28019),(18989,999,28020),(18994,999,28021),(18988,999,28022),(18991,999,28023),(18675,1000,28015),(18674,1000,28016),(18673,1000,28017),(18995,1000,28024),(18990,1000,28025),(19221,1001,28031),(19218,1002,28028),(19219,1002,28029),(19220,1002,28030),(19216,1003,28026),(19217,1003,28027),(18933,1014,28045),(18943,1015,28048),(18944,1015,28049),(18945,1015,28050),(18937,1015,28054),(18938,1015,28055),(18939,1015,28056),(18935,1016,28052),(18934,1016,28053),(18936,1016,28057),(18941,1017,28046),(18940,1017,28047),(18942,1017,28051),(18871,1018,28059),(18878,1018,28060),(18876,1018,28061),(18874,1018,28062),(18875,1018,28063),(18877,1018,28064),(18873,1018,28065),(18879,1018,28066),(18872,1018,28067),(18548,1018,28069),(18500,1019,28073),(18499,1019,28074),(18496,1019,28075),(18501,1019,28076),(18495,1019,28077),(18498,1019,28078),(18678,1020,28070),(18677,1020,28071),(18676,1020,28072),(18502,1020,28079),(18497,1020,28080),(18946,1021,28084),(18956,1022,28087),(18957,1022,28088),(18958,1022,28089),(18950,1022,28093),(18951,1022,28094),(18952,1022,28095),(18948,1023,28091),(18947,1023,28092),(18949,1023,28096),(18954,1024,28085),(18953,1024,28086),(18955,1024,28090),(18700,1025,28098),(18707,1025,28099),(18705,1025,28100),(18703,1025,28101),(18704,1025,28102),(18706,1025,28103),(18702,1025,28104),(18708,1025,28105),(18701,1025,28106),(18508,1026,28110),(18507,1026,28111),(18504,1026,28112),(18509,1026,28113),(18503,1026,28114),(18506,1026,28115),(18681,1027,28107),(18680,1027,28108),(18679,1027,28109),(18510,1027,28116),(18505,1027,28117),(18880,1028,28119),(18887,1028,28120),(18885,1028,28121),(18883,1028,28122),(18884,1028,28123),(18886,1028,28124),(18882,1028,28125),(18888,1028,28126),(18881,1028,28127),(18549,1028,28129),(18516,1029,28133),(18515,1029,28134),(18512,1029,28135),(18517,1029,28136),(18511,1029,28137),(18514,1029,28138),(18684,1030,28130),(18683,1030,28131),(18682,1030,28132),(18518,1030,28139),(18513,1030,28140),(19143,1031,28143),(19145,1032,28151),(19146,1032,28152),(19147,1032,28153),(19144,1033,28150),(19150,1033,28156),(19148,1034,28154),(19149,1035,28155),(19141,1036,28141),(19142,1036,28142),(19151,1036,28157),(19152,1036,28158),(18959,1037,28162),(18969,1038,28165),(18970,1038,28166),(18971,1038,28167),(18963,1038,28171),(18964,1038,28172),(18965,1038,28173),(18961,1039,28169),(18960,1039,28170),(18962,1039,28174),(18967,1040,28163),(18966,1040,28164),(18968,1040,28168),(18889,1041,28176),(18896,1041,28177),(18894,1041,28178),(18892,1041,28179),(18893,1041,28180),(18895,1041,28181),(18891,1041,28182),(18897,1041,28183),(18890,1041,28184),(18524,1042,28188),(18523,1042,28189),(18520,1042,28190),(18525,1042,28191),(18519,1042,28192),(18522,1042,28193),(18687,1043,28185),(18686,1043,28186),(18685,1043,28187),(18526,1043,28194),(18521,1043,28195),(19180,1044,28200),(19181,1044,28201),(19182,1045,28202),(19183,1045,28203),(19186,1046,28206),(19184,1047,28204),(19185,1047,28205),(19087,1048,28208),(19056,1048,28209),(19055,1048,28210),(19054,1048,28211),(19091,1049,28215),(19090,1050,28216),(19088,1051,28217),(19089,1051,28218),(19085,1052,28220),(19084,1052,28221),(19086,1052,28222),(18898,1053,28224),(18905,1053,28225),(18903,1053,28226),(18901,1053,28227),(18902,1053,28228),(18904,1053,28229),(18900,1053,28230),(18906,1053,28231),(18899,1053,28232),(18532,1054,28236),(18531,1054,28237),(18528,1054,28238),(18533,1054,28239),(18527,1054,28240),(18530,1054,28241),(18690,1055,28233),(18689,1055,28234),(18688,1055,28235),(18534,1055,28242),(18529,1055,28243),(19061,1056,28246),(19092,1057,28247);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `newvalue` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error'),(166,18,'1','ok'),(167,18,'2','unavailable'),(168,18,'3','nonoperational'),(169,19,'1','unknown'),(170,19,'2','halfDuplex'),(171,19,'3','fullDuplex'),(172,20,'1','up'),(173,20,'2','down'),(174,20,'3','testing'),(175,20,'4','unknown'),(176,20,'5','dormant'),(177,20,'6','notPresent'),(178,20,'7','lowerLayerDown'),(179,21,'1','other'),(180,21,'2','regular1822'),(181,21,'3','hdh1822'),(182,21,'4','ddnX25'),(183,21,'5','rfc877x25'),(184,21,'6','ethernetCsmacd'),(185,21,'7','iso88023Csmacd'),(186,21,'8','iso88024TokenBus'),(187,21,'9','iso88025TokenRing'),(188,21,'10','iso88026Man'),(189,21,'11','starLan'),(190,21,'12','proteon10Mbit'),(191,21,'13','proteon80Mbit'),(192,21,'14','hyperchannel'),(193,21,'15','fddi'),(194,21,'16','lapb'),(195,21,'17','sdlc'),(196,21,'18','ds1'),(197,21,'19','e1'),(198,21,'20','basicISDN'),(199,21,'21','primaryISDN'),(200,21,'22','propPointToPointSerial'),(201,21,'23','ppp'),(202,21,'24','softwareLoopback'),(203,21,'25','eon'),(204,21,'26','ethernet3Mbit'),(205,21,'27','nsip'),(206,21,'28','slip'),(207,21,'29','ultra'),(208,21,'30','ds3'),(209,21,'31','sip'),(210,21,'32','frameRelay'),(211,21,'33','rs232'),(212,21,'34','para'),(213,21,'35','arcnet'),(214,21,'36','arcnetPlus'),(215,21,'37','atm'),(216,21,'38','miox25'),(217,21,'39','sonet'),(218,21,'40','x25ple'),(219,21,'41','iso88022llc'),(220,21,'42','localTalk'),(221,21,'43','smdsDxi'),(222,21,'44','frameRelayService'),(223,21,'45','v35'),(224,21,'46','hssi'),(225,21,'47','hippi'),(226,21,'48','modem'),(227,21,'49','aal5'),(228,21,'50','sonetPath'),(229,21,'51','sonetVT'),(230,21,'52','smdsIcip'),(231,21,'53','propVirtual'),(232,21,'54','propMultiplexor'),(233,21,'55','ieee80212'),(234,21,'56','fibreChannel'),(235,21,'57','hippiInterface'),(236,21,'58','frameRelayInterconnect'),(237,21,'59','aflane8023'),(238,21,'60','aflane8025'),(239,21,'61','cctEmul'),(240,21,'62','fastEther'),(241,21,'63','isdn'),(242,21,'64','v11'),(243,21,'65','v36'),(244,21,'66','g703at64k'),(245,21,'67','g703at2mb'),(246,21,'68','qllc'),(247,21,'69','fastEtherFX'),(248,21,'70','channel'),(249,21,'71','ieee80211'),(250,21,'72','ibm370parChan'),(251,21,'73','escon'),(252,21,'74','dlsw'),(253,21,'75','isdns'),(254,21,'76','isdnu'),(255,21,'77','lapd'),(256,21,'78','ipSwitch'),(257,21,'79','rsrb'),(258,21,'80','atmLogical'),(259,21,'81','ds0'),(260,21,'82','ds0Bundle'),(261,21,'83','bsc'),(262,21,'84','async'),(263,21,'85','cnr'),(264,21,'86','iso88025Dtr'),(265,21,'87','eplrs'),(266,21,'88','arap'),(267,21,'89','propCnls'),(268,21,'90','hostPad'),(269,21,'91','termPad'),(270,21,'92','frameRelayMPI'),(271,21,'93','x213'),(272,21,'94','adsl'),(273,21,'95','radsl'),(274,21,'96','sdsl'),(275,21,'97','vdsl'),(276,21,'98','iso88025CRFPInt'),(277,21,'99','myrinet'),(278,21,'100','voiceEM'),(279,21,'101','voiceFXO'),(280,21,'102','voiceFXS'),(281,21,'103','voiceEncap'),(282,21,'104','voiceOverIp'),(283,21,'105','atmDxi'),(284,21,'106','atmFuni'),(285,21,'107','atmIma'),(286,21,'108','pppMultilinkBundle'),(287,21,'109','ipOverCdlc'),(288,21,'110','ipOverClaw'),(289,21,'111','stackToStack'),(290,21,'112','virtualIpAddress'),(291,21,'113','mpc'),(292,21,'114','ipOverAtm'),(293,21,'115','iso88025Fiber'),(294,21,'116','tdlc'),(295,21,'117','gigabitEthernet'),(296,21,'118','hdlc'),(297,21,'119','lapf'),(298,21,'120','v37'),(299,21,'121','x25mlp'),(300,21,'122','x25huntGroup'),(301,21,'123','trasnpHdlc'),(302,21,'124','interleave'),(303,21,'125','fast'),(304,21,'126','ip'),(305,21,'127','docsCableMaclayer'),(306,21,'128','docsCableDownstream'),(307,21,'129','docsCableUpstream'),(308,21,'130','a12MppSwitch'),(309,21,'131','tunnel'),(310,21,'132','coffee'),(311,21,'133','ces'),(312,21,'134','atmSubInterface'),(313,21,'135','l2vlan'),(314,21,'136','l3ipvlan'),(315,21,'137','l3ipxvlan'),(316,21,'138','digitalPowerline'),(317,21,'139','mediaMailOverIp'),(318,21,'140','dtm'),(319,21,'141','dcn'),(320,21,'142','ipForward'),(321,21,'143','msdsl'),(322,21,'144','ieee1394'),(323,21,'145','if-gsn'),(324,21,'146','dvbRccMacLayer'),(325,21,'147','dvbRccDownstream'),(326,21,'148','dvbRccUpstream'),(327,21,'149','atmVirtual'),(328,21,'150','mplsTunnel'),(329,21,'151','srp'),(330,21,'152','voiceOverAtm'),(331,21,'153','voiceOverFrameRelay'),(332,21,'154','idsl'),(333,21,'155','compositeLink'),(334,21,'156','ss7SigLink'),(335,21,'157','propWirelessP2P'),(336,21,'158','frForward'),(337,21,'159','rfc1483'),(338,21,'160','usb'),(339,21,'161','ieee8023adLag'),(340,21,'162','bgppolicyaccounting'),(341,21,'163','frf16MfrBundle'),(342,21,'164','h323Gatekeeper'),(343,21,'165','h323Proxy'),(344,21,'166','mpls'),(345,21,'167','mfSigLink'),(346,21,'168','hdsl2'),(347,21,'169','shdsl'),(348,21,'170','ds1FDL'),(349,21,'171','pos'),(350,21,'172','dvbAsiIn'),(351,21,'173','dvbAsiOut'),(352,21,'174','plc'),(353,21,'175','nfas'),(354,21,'176','tr008'),(355,21,'177','gr303RDT'),(356,21,'178','gr303IDT'),(357,21,'179','isup'),(358,21,'180','propDocsWirelessMaclayer'),(359,21,'181','propDocsWirelessDownstream'),(360,21,'182','propDocsWirelessUpstream'),(361,21,'183','hiperlan2'),(362,21,'184','propBWAp2Mp'),(363,21,'185','sonetOverheadChannel'),(364,21,'186','digitalWrapperOverheadChannel'),(365,21,'187','aal2'),(366,21,'188','radioMAC'),(367,21,'189','atmRadio'),(368,21,'190','imt'),(369,21,'191','mvl'),(370,21,'192','reachDSL'),(371,21,'193','frDlciEndPt'),(372,21,'194','atmVciEndPt'),(373,21,'195','opticalChannel'),(374,21,'196','opticalTransport'),(375,21,'197','propAtm'),(376,21,'198','voiceOverCable'),(377,21,'199','infiniband'),(378,21,'200','teLink'),(379,21,'201','q2931'),(380,21,'202','virtualTg'),(381,21,'203','sipTg'),(382,21,'204','sipSig'),(383,21,'205','docsCableUpstreamChannel'),(384,21,'206','econet'),(385,21,'207','pon155'),(386,21,'208','pon622'),(387,21,'209','bridge'),(388,21,'210','linegroup'),(389,21,'211','voiceEMFGD'),(390,21,'212','voiceFGDEANA'),(391,21,'213','voiceDID'),(392,21,'214','mpegTransport'),(393,21,'215','sixToFour'),(394,21,'216','gtp'),(395,21,'217','pdnEtherLoop1'),(396,21,'218','pdnEtherLoop2'),(397,21,'219','opticalChannelGroup'),(398,21,'220','homepna'),(399,21,'221','gfp'),(400,21,'222','ciscoISLvlan'),(401,21,'223','actelisMetaLOOP'),(402,21,'224','fcipLink'),(403,21,'225','rpr'),(404,21,'226','qam'),(405,21,'227','lmp'),(406,21,'228','cblVectaStar'),(407,21,'229','docsCableMCmtsDownstream'),(408,21,'230','adsl2'),(409,21,'231','macSecControlledIF'),(410,21,'232','macSecUncontrolledIF'),(411,21,'233','aviciOpticalEther'),(412,21,'234','atmbond'),(413,21,'235','voiceFGDOS'),(414,21,'236','mocaVersion1'),(415,21,'237','ieee80216WMAN'),(416,21,'238','adsl2plus'),(417,21,'239','dvbRcsMacLayer'),(418,21,'240','dvbTdm'),(419,21,'241','dvbRcsTdma'),(420,21,'242','x86Laps'),(421,21,'243','wwanPP'),(422,21,'244','wwanPP2'),(423,21,'245','voiceEBS'),(424,21,'246','ifPwType'),(425,21,'247','ilan'),(426,21,'248','pip'),(427,21,'249','aluELP'),(428,21,'250','gpon'),(429,21,'251','vdsl2'),(430,21,'252','capwapDot11Profile'),(431,21,'253','capwapDot11Bss'),(432,21,'254','capwapWtpVirtualRadio'),(433,21,'255','bits'),(434,21,'256','docsCableUpstreamRfPort'),(435,21,'257','cableDownstreamRfPort'),(436,21,'258','vmwareVirtualNic'),(437,21,'259','ieee802154'),(438,21,'260','otnOdu'),(439,21,'261','otnOtu'),(440,21,'262','ifVfiType'),(441,21,'263','g9981'),(442,21,'264','g9982'),(443,21,'265','g9983'),(444,21,'266','aluEpon'),(445,21,'267','aluEponOnu'),(446,21,'268','aluEponPhysicalUni'),(447,21,'269','aluEponLogicalLink'),(448,21,'270','aluGponOnu'),(449,21,'271','aluGponPhysicalUni'),(450,21,'272','vmwareNicTeam'),(451,21,'277','docsOfdmDownstream'),(452,21,'278','docsOfdmaUpstream'),(453,21,'279','gfast'),(454,21,'280','sdci'),(455,21,'281','xboxWireless'),(456,21,'282','fastdsl'),(457,21,'283','docsCableScte55d1FwdOob'),(458,21,'284','docsCableScte55d1RetOob'),(459,21,'285','docsCableScte55d2DsOob'),(460,21,'286','docsCableScte55d2UsOob'),(461,21,'287','docsCableNdf'),(462,21,'288','docsCableNdr'),(463,21,'289','ptm'),(464,21,'290','ghn'),(465,22,'0','not available'),(466,22,'1','available'),(467,22,'2','unknown'),(468,23,'1','deviceStateUnknown'),(469,23,'2','deviceNotEquipped'),(470,23,'3','deviceStateOk'),(471,23,'4','deviceStateFailed'),(472,23,'5','deviceStateOutOfService'),(473,24,'1','unknown'),(474,24,'2','faulty'),(475,24,'3','below-min'),(476,24,'4','nominal'),(477,24,'5','above-max'),(478,24,'6','absent'),(479,25,'1','online'),(480,25,'2','offline'),(481,25,'3','testing'),(482,25,'4','faulty'),(483,26,'1','other'),(484,26,'2','normal'),(485,26,'3','failure'),(486,27,'1','other'),(487,27,'2','normal'),(488,27,'3','failure'),(489,28,'1','normal'),(490,28,'2','warning'),(491,28,'3','critical'),(492,28,'4','shutdown'),(493,28,'5','notPresent'),(494,28,'6','notFunctioning'),(495,29,'1','true - on'),(496,29,'2','false - off'),(497,30,'1','up'),(498,30,'2','down'),(499,30,'3','absent'),(500,31,'1','up'),(501,31,'2','down'),(502,31,'3','absent'),(503,32,'1','noexist'),(504,32,'2','existnopower'),(505,32,'3','existreadypower'),(506,32,'4','normal'),(507,32,'5','powerbutabnormal'),(508,32,'6','unknown'),(509,33,'0','other'),(510,33,'1','working'),(511,33,'2','fail'),(512,33,'3','speed-0'),(513,33,'4','speed-low'),(514,33,'5','speed-middle'),(515,33,'6','speed-high'),(516,34,'0','other'),(517,34,'1','lowVoltage'),(518,34,'2','overCurrent'),(519,34,'3','working'),(520,34,'4','fail'),(521,34,'5','connect'),(522,34,'6','disconnect'),(523,35,'1','true'),(524,35,'2','false'),(525,36,'1','true - on'),(526,36,'2','false - off'),(527,37,'1','alarm'),(528,37,'2','normal'),(529,38,'1','notPresent'),(530,38,'2','presentOK'),(531,38,'3','presentNotOK'),(532,38,'4','presentPowerOff'),(533,39,'1','notSupported'),(534,39,'2','normal'),(535,39,'3','postFailure'),(536,39,'4','entityAbsent'),(537,39,'5','poeError'),(538,39,'6','stackError'),(539,39,'7','stackPortBlocked'),(540,39,'8','stackPortFailed'),(541,39,'9','sfpRecvError'),(542,39,'10','sfpSendError'),(543,39,'11','sfpBothError'),(544,39,'12','fanError'),(545,39,'13','psuError'),(546,39,'14','rpsError'),(547,39,'15','moduleFaulty'),(548,39,'16','sensorError'),(549,39,'17','hardwareFaulty'),(550,40,'1','unknown'),(551,40,'2','bad'),(552,40,'3','warning'),(553,40,'4','good'),(554,40,'5','notPresent'),(555,41,'1','normal'),(556,41,'2','abnormal'),(557,42,'1','online'),(558,42,'2','operational'),(559,42,'3','failed'),(560,42,'4','offline'),(561,43,'1','invalid'),(562,43,'2','bad'),(563,43,'3','warning'),(564,43,'4','good'),(565,43,'5','disabled'),(566,44,'1','unknown'),(567,44,'2','disabled'),(568,44,'3','failed'),(569,44,'4','warning'),(570,44,'5','standby'),(571,44,'6','engaged'),(572,44,'7','redundant'),(573,44,'8','notPresent'),(574,45,'1','normal'),(575,45,'2','high'),(576,45,'3','excessivelyHigh'),(577,45,'4','low'),(578,45,'5','excessivelyLow'),(579,45,'6','noSensor'),(580,45,'7','unknown'),(581,46,'1','other'),(582,46,'2','off'),(583,46,'3','on - RedAlarm'),(584,47,'1','unknown'),(585,47,'2','running'),(586,47,'3','ready'),(587,47,'4','reset'),(588,47,'5','runningAtFullSpeed'),(589,47,'6','down or off'),(590,47,'7','standby'),(591,48,'1','unknown'),(592,48,'2','disabled'),(593,48,'3','enabled'),(594,48,'4','testing'),(595,49,'1','operational'),(596,49,'2','failed'),(597,49,'3','powering'),(598,49,'4','notpowering'),(599,49,'5','notpresent'),(600,50,'1','operational'),(601,50,'2','failed'),(602,50,'3','powering'),(603,50,'4','notpowering'),(604,50,'5','notpresent'),(605,51,'1','normal'),(606,51,'2','warning'),(607,51,'3','critical'),(608,51,'4','shutdown'),(609,51,'5','notpresent'),(610,51,'6','notoperational'),(611,52,'0','normal'),(612,52,'1','abnormal'),(613,53,'0','normal'),(614,53,'1','abnormal'),(615,53,'2','not available'),(616,54,'1','other'),(617,54,'2','ok'),(618,54,'3','degraded'),(619,54,'4','failed'),(620,55,'1','other'),(621,55,'2','unknown'),(622,55,'3','system'),(623,55,'4','systemBoard'),(624,55,'5','ioBoard'),(625,55,'6','cpu'),(626,55,'7','memory'),(627,55,'8','storage'),(628,55,'9','removableMedia'),(629,55,'10','powerSupply'),(630,55,'11','ambient'),(631,55,'12','chassis'),(632,55,'13','bridgeCard'),(633,56,'1','other'),(634,56,'2','ida'),(635,56,'3','idaExpansion'),(636,56,'4','ida-2'),(637,56,'5','smart'),(638,56,'6','smart-2e'),(639,56,'7','smart-2p'),(640,56,'8','smart-2sl'),(641,56,'9','smart-3100es'),(642,56,'10','smart-3200'),(643,56,'11','smart-2dh'),(644,56,'12','smart-221'),(645,56,'13','sa-4250es'),(646,56,'14','sa-4200'),(647,56,'15','sa-integrated'),(648,56,'16','sa-431'),(649,56,'17','sa-5300'),(650,56,'18','raidLc2'),(651,56,'19','sa-5i'),(652,56,'20','sa-532'),(653,56,'21','sa-5312'),(654,56,'22','sa-641'),(655,56,'23','sa-642'),(656,56,'24','sa-6400'),(657,56,'25','sa-6400em'),(658,56,'26','sa-6i'),(659,56,'27','sa-generic'),(660,56,'29','sa-p600'),(661,56,'30','sa-p400'),(662,56,'31','sa-e200'),(663,56,'32','sa-e200i'),(664,56,'33','sa-p400i'),(665,56,'34','sa-p800'),(666,56,'35','sa-e500'),(667,56,'36','sa-p700m'),(668,56,'37','sa-p212'),(669,56,'38','sa-p410'),(670,56,'39','sa-p410i'),(671,56,'40','sa-p411'),(672,56,'41','sa-b110i'),(673,56,'42','sa-p712m'),(674,56,'43','sa-p711m'),(675,56,'44','sa-p812'),(676,57,'1','other'),(677,57,'2','ok'),(678,57,'3','failed'),(679,57,'4','predictiveFailure'),(680,58,'0','nonRecoverable'),(681,58,'2','critical'),(682,58,'4','nonCritical'),(683,58,'255','normal');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_server` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `exec_path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `passwd` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `maxsessions` int(11) NOT NULL DEFAULT '1',
  `maxattempts` int(11) NOT NULL DEFAULT '3',
  `attempt_interval` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '10s',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.example.com','example.com','zabbix@example.com','','','','',0,25,0,0,0,0,'',1,3,'10s'),(2,3,'Jabber','','','','','','jabber@example.com','zabbix',0,25,0,0,0,0,'',1,3,'10s'),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,'',1,3,'10s');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `publickey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `privatekey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `command` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `recovery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,2,6,'0',1,1,0,0),(2,2,4,'0',1,1,0,0),(3,3,0,'0',1,1,0,0),(4,4,0,'0',1,1,0,0),(5,5,0,'0',1,1,0,0),(6,6,0,'0',1,1,0,0),(7,3,11,'0',1,1,0,1),(8,4,11,'0',1,1,0,1),(9,5,11,'0',1,1,0,1),(10,6,11,'0',1,1,0,1);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message` text COLLATE utf8_bin NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'Problem: {EVENT.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(7,1,'Resolved: {EVENT.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {EVENT.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {EVENT.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(8,1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',NULL),(9,1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',NULL),(10,1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',NULL);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (1,1,10001);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `r_clock` int(11) NOT NULL DEFAULT '0',
  `r_ns` int(11) NOT NULL DEFAULT '0',
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `problem_1` (`source`,`object`,`objectid`),
  KEY `problem_2` (`r_clock`),
  KEY `problem_3` (`r_eventid`),
  CONSTRAINT `c_problem_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_problem_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tag`
--

DROP TABLE IF EXISTS `problem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_tag` (
  `problemtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`problemtagid`),
  KEY `problem_tag_1` (`eventid`),
  KEY `problem_tag_2` (`tag`,`value`),
  CONSTRAINT `c_problem_tag_1` FOREIGN KEY (`eventid`) REFERENCES `problem` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tag`
--

LOCK TABLES `problem_tag` WRITE;
/*!40000 ALTER TABLE `problem_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `source` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.dashbrd.dashboardid',0,1,0,'','',1),(2,1,'web.menu.login.last',0,0,0,'index.php','',3),(3,1,'web.messages',0,0,0,'0','enabled',3),(4,1,'web.messages',0,0,0,'0','triggers.recovery',3),(5,1,'web.messages',0,0,0,'a:0:{}','triggers.severities',3),(6,1,'web.menu.config.last',0,0,0,'actionconf.php','',3),(7,1,'web.actionconf.php.sort',0,0,0,'name','',3),(8,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(9,1,'web.paging.lastpage',0,0,0,'actionconf.php','',3),(10,1,'web.actionconf.eventsource',0,0,2,'','',2);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `listen_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_metadata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_bin NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `test_string` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot'),(4,'Windows service names for discovery','SysmonLog'),(5,'Windows service startup states for discovery','automatic');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (3,'System performance',2,3,10001,NULL,0),(4,'Zabbix server health',2,3,10047,NULL,0),(5,'System performance',2,2,10076,NULL,0),(6,'System performance',2,2,10077,NULL,0),(7,'System performance',2,2,10075,NULL,0),(9,'System performance',2,3,10074,NULL,0),(10,'System performance',2,3,10078,NULL,0),(16,'Zabbix server',2,2,NULL,1,0),(17,'Zabbix proxy health',2,2,10048,NULL,0),(18,'System performance',1,2,10079,NULL,0),(19,'System performance',2,2,10081,NULL,0),(20,'MySQL performance',2,1,10170,NULL,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(45,16,0,524,400,156,0,1,1,1,0,0,0,0,'',0,0,'',3),(46,16,0,525,400,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(76,17,0,532,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(77,17,0,530,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(78,17,0,531,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(79,17,0,529,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(85,20,0,650,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(86,20,0,649,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(87,5,0,469,500,148,0,0,1,1,0,1,0,0,'',0,0,'',3),(88,5,0,471,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(89,5,0,498,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(90,5,0,540,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(91,7,0,463,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(92,7,0,462,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(93,7,0,541,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(94,7,0,464,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(95,6,0,475,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(96,6,0,474,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(97,6,0,542,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(98,3,0,433,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(99,3,0,387,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(100,3,0,533,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(101,3,0,436,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(102,3,1,10009,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(103,3,1,10013,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(104,18,0,487,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(105,18,0,543,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(106,9,0,457,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(107,9,0,456,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(108,9,0,544,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(109,9,0,458,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(110,9,1,22838,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(111,9,1,22837,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(112,10,0,481,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(113,10,0,480,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(114,10,0,545,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(115,10,0,482,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(116,10,1,22998,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(117,10,1,22997,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(118,19,0,495,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(119,19,0,546,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(120,19,1,23140,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(121,19,1,23138,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(122,4,0,392,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(123,4,0,404,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(124,4,0,406,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(125,4,0,410,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(126,4,0,527,500,160,0,2,1,1,0,0,0,0,'',0,0,'',3),(127,4,0,788,500,160,1,2,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `command` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `confirmation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','ping -c 3 {HOST.CONN}; case $? in [01]) true;; *) false;; esac',2,NULL,NULL,'','',0,2),(2,'Traceroute','/bin/traceroute {HOST.CONN}',2,NULL,NULL,'','',0,2),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN}',2,7,NULL,'','',0,2);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`,`lastaccess`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('97d6dd15c1b6d04275fba0620d8524a1',1,1533697938,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '30s',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_trigger`
--

DROP TABLE IF EXISTS `sysmap_element_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_trigger` (
  `selement_triggerid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`selement_triggerid`),
  UNIQUE KEY `sysmap_element_trigger_1` (`selementid`,`triggerid`),
  KEY `c_sysmap_element_trigger_2` (`triggerid`),
  CONSTRAINT `c_sysmap_element_trigger_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_element_trigger_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_trigger`
--

LOCK TABLES `sysmap_element_trigger` WRITE;
/*!40000 ALTER TABLE `sysmap_element_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_shape`
--

DROP TABLE IF EXISTS `sysmap_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_shape` (
  `sysmap_shapeid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `text` text COLLATE utf8_bin NOT NULL,
  `font` int(11) NOT NULL DEFAULT '9',
  `font_size` int(11) NOT NULL DEFAULT '11',
  `font_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  `text_halign` int(11) NOT NULL DEFAULT '0',
  `text_valign` int(11) NOT NULL DEFAULT '0',
  `border_type` int(11) NOT NULL DEFAULT '0',
  `border_width` int(11) NOT NULL DEFAULT '1',
  `border_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  `background_color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `zindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmap_shapeid`),
  KEY `sysmap_shape_1` (`sysmapid`),
  CONSTRAINT `c_sysmap_shape_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_shape`
--

LOCK TABLES `sysmap_shape` WRITE;
/*!40000 ALTER TABLE `sysmap_shape` DISABLE KEYS */;
INSERT INTO `sysmap_shape` VALUES (1,1,0,0,0,680,15,'{MAP.NAME}',9,11,'000000',0,0,0,0,'000000','',0);
/*!40000 ALTER TABLE `sysmap_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_string_map` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_string_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (1,1,10084,0,185,NULL,'{HOST.NAME}\r\n{HOST.CONN}',0,111,61,NULL,NULL,0,0,200,200,0,0,'');
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  `label` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_filter`
--

DROP TABLE IF EXISTS `tag_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_filter` (
  `tag_filterid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_filterid`),
  KEY `c_tag_filter_1` (`usrgrpid`),
  KEY `c_tag_filter_2` (`groupid`),
  CONSTRAINT `c_tag_filter_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_tag_filter_2` FOREIGN KEY (`groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_filter`
--

LOCK TABLES `tag_filter` WRITE;
/*!40000 ALTER TABLE `tag_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ttl` int(11) NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `task_1` (`status`,`proxy_hostid`),
  KEY `c_task_1` (`proxy_hostid`),
  CONSTRAINT `c_task_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_acknowledge`
--

DROP TABLE IF EXISTS `task_acknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_acknowledge` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_acknowledge_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_acknowledge`
--

LOCK TABLES `task_acknowledge` WRITE;
/*!40000 ALTER TABLE `task_acknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_acknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_check_now`
--

DROP TABLE IF EXISTS `task_check_now`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_check_now` (
  `taskid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_check_now_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_check_now`
--

LOCK TABLES `task_check_now` WRITE;
/*!40000 ALTER TABLE `task_check_now` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_check_now` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_close_problem`
--

DROP TABLE IF EXISTS `task_close_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_close_problem` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_close_problem_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_close_problem`
--

LOCK TABLES `task_close_problem` WRITE;
/*!40000 ALTER TABLE `task_close_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_close_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command`
--

DROP TABLE IF EXISTS `task_remote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command` (
  `taskid` bigint(20) unsigned NOT NULL,
  `command_type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `publickey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `privatekey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `command` text COLLATE utf8_bin NOT NULL,
  `alertid` bigint(20) unsigned DEFAULT NULL,
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command`
--

LOCK TABLES `task_remote_command` WRITE;
/*!40000 ALTER TABLE `task_remote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command_result`
--

DROP TABLE IF EXISTS `task_remote_command_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command_result` (
  `taskid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `info` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_result_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command_result`
--

LOCK TABLES `task_remote_command_result` WRITE;
/*!40000 ALTER TABLE `task_remote_command_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
INSERT INTO `trigger_depends` VALUES (354,14195,14205),(355,14196,14195),(356,14196,14205),(357,14197,14205),(358,14198,14197),(359,14198,14205),(360,14200,14199),(361,14201,14205),(362,14202,14201),(363,14202,14205),(364,14204,14203),(365,14206,14222),(366,14207,14206),(367,14207,14222),(368,14208,14222),(369,14209,14208),(370,14209,14222),(371,14210,14222),(372,14211,14210),(373,14211,14222),(374,14212,14222),(375,14213,14212),(376,14213,14222),(377,14214,14222),(378,14215,14214),(379,14215,14222),(380,14217,14216),(381,14218,14222),(382,14219,14218),(383,14219,14222),(384,14220,14222),(385,14221,14220),(386,14221,14222),(387,14223,14222),(388,14224,14222),(389,14224,14223),(390,14225,14222),(391,14226,14222),(392,14226,14225),(3967,14246,14245),(3968,14250,14249),(3808,14252,14251),(3837,14253,14251),(3866,14253,14252),(3809,14289,14288),(3838,14290,14288),(3867,14290,14289),(3972,14291,15161),(3812,14294,14293),(3841,14295,14293),(3870,14295,14294),(3740,14296,15170),(3813,14312,14311),(3842,14313,14311),(3871,14313,14312),(3741,14314,15171),(3981,14318,14319),(3814,14328,14327),(3843,14329,14327),(3872,14329,14328),(3742,14330,15172),(4015,14335,14334),(3815,14348,14347),(3844,14349,14347),(3873,14349,14348),(3743,14350,15173),(3816,14357,14356),(3845,14358,14356),(3874,14358,14357),(3744,14359,15174),(4009,14372,14373),(4010,14375,14376),(4013,14380,14381),(3817,14390,14389),(3846,14391,14389),(3875,14391,14390),(3745,14392,15175),(3818,14404,14403),(3847,14405,14403),(3876,14405,14404),(3746,14406,15176),(3819,14452,14451),(3848,14453,14451),(3877,14453,14452),(3747,14454,15177),(3984,14460,14461),(3820,14469,14468),(3849,14470,14468),(3878,14470,14469),(3748,14471,15178),(4000,14476,14477),(3821,14487,14486),(3850,14488,14486),(3879,14488,14487),(3749,14489,15179),(3987,14495,14496),(3822,14506,14505),(3851,14507,14505),(3880,14507,14506),(3750,14508,15180),(4001,14511,15368),(3810,14525,14524),(3839,14526,14524),(3868,14526,14525),(3973,14527,15162),(3823,14535,14534),(3852,14536,14534),(3881,14536,14535),(3751,14537,15181),(3824,14545,14544),(3853,14546,14544),(3882,14546,14545),(3752,14547,15182),(4002,14551,14552),(3825,14583,14582),(3854,14584,14582),(3883,14584,14583),(3753,14585,15183),(4019,14589,14590),(3826,14599,14598),(3855,14600,14598),(3884,14600,14599),(3754,14601,15184),(3827,14616,14615),(3856,14617,14615),(3885,14617,14616),(3755,14618,15185),(4006,14624,14625),(3828,14653,14652),(3857,14654,14652),(3886,14654,14653),(3756,14655,15186),(3978,14658,14659),(3979,14664,14665),(3980,14668,14667),(3829,14674,14673),(3858,14675,14673),(3887,14675,14674),(3757,14676,15187),(3830,14692,14691),(3859,14693,14691),(3888,14693,14692),(3758,14694,15188),(3831,14705,14704),(3860,14706,14704),(3889,14706,14705),(3759,14707,15189),(3811,14718,14717),(3840,14719,14717),(3869,14719,14718),(3974,14720,15163),(3969,14862,14861),(3832,14870,14869),(3861,14871,14869),(3890,14871,14870),(3760,14872,15190),(3970,14876,14875),(3833,14883,14882),(3862,14884,14882),(3891,14884,14883),(3761,14885,15191),(3834,14907,14906),(3863,14908,14906),(3892,14908,14907),(3762,14909,15192),(4003,14914,14915),(3971,14922,14921),(3835,14929,14928),(3864,14930,14928),(3893,14930,14929),(3763,14931,15193),(3975,15161,14288),(3976,15162,14524),(3977,15163,14717),(3765,15170,14293),(3766,15171,14311),(3767,15172,14327),(3768,15173,14347),(3769,15174,14356),(3770,15175,14389),(3771,15176,14403),(3772,15177,14451),(3773,15178,14468),(3774,15179,14486),(3775,15180,14505),(3776,15181,14534),(3777,15182,14544),(3778,15183,14582),(3779,15184,14598),(3780,15185,14615),(3781,15186,14652),(3782,15187,14673),(3783,15188,14691),(3784,15189,14704),(3785,15190,14869),(3786,15191,14882),(3787,15192,14906),(3788,15193,14928),(3836,15221,15220),(3865,15222,15220),(3894,15222,15221),(3764,15223,15224),(3789,15224,15220),(3982,15332,15331),(3983,15334,15333),(3985,15335,15336),(3986,15338,15337),(3988,15342,15343),(3989,15345,15344),(3990,15347,15346),(3991,15348,15351),(3992,15349,15352),(3993,15350,15353),(3994,15357,15354),(3995,15358,15355),(3996,15359,15356),(3997,15363,15360),(3998,15364,15361),(3999,15365,15362),(4004,15374,15373),(4005,15376,15375),(4007,15380,15379),(4008,15382,15381),(4011,15384,15383),(4012,15386,15385),(4014,15387,14934),(4016,15390,14339),(4017,15392,15391),(4018,15394,15393),(4020,15396,15397),(3790,15550,15490),(3791,15551,15490),(3792,15552,15490),(3793,15553,15492),(3794,15554,15493),(3795,15555,15492),(3796,15556,15493),(3797,15557,15492),(3798,15558,15493),(3799,15559,15496),(3800,15560,15496),(3801,15561,15496),(3802,15562,15498),(3803,15563,15499),(3804,15564,15498),(3805,15565,15499),(3806,15566,15498),(3807,15567,15499),(3895,15568,15502),(3896,15569,15502),(3897,15570,15502),(3898,15571,15504),(3899,15572,15504),(3900,15573,15504),(3901,15574,15506),(3902,15575,15506),(3903,15576,15506),(3904,15577,15508),(3905,15578,15508),(3906,15579,15508),(3907,15580,15510),(3908,15581,15511),(3909,15582,15512),(3910,15583,15513),(3911,15584,15514),(3912,15585,15515),(3913,15586,15516),(3914,15587,15517),(3915,15588,15518),(3916,15589,15519),(3917,15590,15520),(3918,15591,15521),(3919,15592,15522),(3920,15593,15523),(3921,15594,15524),(3922,15595,15525),(3923,15596,15526),(3924,15597,15527),(3925,15598,15528),(3926,15599,15529),(3927,15600,15510),(3928,15601,15511),(3929,15602,15512),(3930,15603,15513),(3931,15604,15514),(3932,15605,15515),(3933,15606,15516),(3934,15607,15517),(3935,15608,15518),(3936,15609,15519),(3937,15610,15520),(3938,15611,15521),(3939,15612,15522),(3940,15613,15523),(3941,15614,15524),(3942,15615,15525),(3943,15616,15526),(3944,15617,15527),(3945,15618,15528),(3946,15619,15529),(3947,15620,15510),(3948,15621,15511),(3949,15622,15512),(3950,15623,15513),(3951,15624,15514),(3952,15625,15515),(3953,15626,15516),(3954,15627,15517),(3955,15628,15518),(3956,15629,15519),(3957,15630,15520),(3958,15631,15521),(3959,15632,15522),(3960,15633,15523),(3961,15634,15524),(3962,15635,15525),(3963,15636,15526),(3964,15637,15527),(3965,15638,15528),(3966,15639,15529);
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tag`
--

DROP TABLE IF EXISTS `trigger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tag` (
  `triggertagid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`triggertagid`),
  KEY `trigger_tag_1` (`triggerid`),
  CONSTRAINT `c_trigger_tag_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tag`
--

LOCK TABLES `trigger_tag` WRITE;
/*!40000 ALTER TABLE `trigger_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_bin NOT NULL,
  `error` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `recovery_mode` int(11) NOT NULL DEFAULT '0',
  `recovery_expression` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '',
  `correlation_mode` int(11) NOT NULL DEFAULT '0',
  `correlation_tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `manual_close` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `surname` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `passwd` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '15m',
  `lang` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'en_GB',
  `refresh` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '30s',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',1,'0','zh_CN','30s',3,'default',0,'',0,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,'15m','en_GB','30s',1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',0,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(28,'CISCO-ENVMON-MIB::CiscoEnvMonState'),(55,'CPQHLTH-MIB::cpqHeTemperatureLocale'),(56,'CPQIDA-MIB::cpqDaCntlrModel'),(57,'CPQIDA-MIB::cpqDaPhyDrvStatus'),(54,'CPQSINFO-MIB::status'),(7,'Dell Open Manage System Status'),(18,'ENTITY-SENSORS-MIB::EntitySensorStatus'),(48,'ENTITY-STATE-MIB::EntityOperState'),(33,'EQUIPMENT-MIB::swFanStatus'),(34,'EQUIPMENT-MIB::swPowerStatus'),(36,'EXTREME-SYSTEM-MIB::extremeFanOperational'),(37,'EXTREME-SYSTEM-MIB::extremeOverTemperatureAlarm'),(38,'EXTREME-SYSTEM-MIB::extremePowerSupplyStatus'),(19,'EtherLike-MIB::dot3StatsDuplexStatus'),(30,'F10-S-SERIES-CHASSIS-MIB::chSysFanTrayOperStatus'),(31,'F10-S-SERIES-CHASSIS-MIB::chSysPowerSupplyOperStatus'),(29,'F10-S-SERIES-CHASSIS-MIB::extremeFanOperational'),(50,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesFanItemState'),(49,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesPowSupplyItemState'),(51,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesTempSensorState'),(27,'FOUNDRY-SN-AGENT-MIB::snChasFanOperStatus'),(26,'FOUNDRY-SN-AGENT-MIB::snChasPwrSupplyOperStatus'),(39,'HH3C-ENTITY-EXT-MIB::hh3cEntityExtErrorStatus'),(6,'HP Insight System Status'),(40,'HP-ICF-CHASSIS::hpicfSensorStatus'),(17,'HTTP response status code'),(41,'HUAWEI-ENTITY-EXTENT-MIB::hwEntityFanState'),(2,'Host availability'),(42,'ICS-CHASSIS-MIB::icsChassisFanOperStatus'),(44,'ICS-CHASSIS-MIB::icsChassisPowerSupplyOperStatus'),(43,'ICS-CHASSIS-MIB::icsChassisSensorSlotOperStatus'),(45,'ICS-CHASSIS-MIB::icsChassisTemperatureStatus'),(20,'IF-MIB::ifOperStatus'),(21,'IF-MIB::ifType'),(58,'IMM-MIB::systemHealthStat'),(47,'JUNIPER-ALARM-MIB::jnxOperatingState'),(46,'JUNIPER-ALARM-MIB::jnxRedAlarmState'),(32,'MY-SYSTEM-MIB::mySystemFanIsNormal'),(14,'Maintenance status'),(52,'QTECH-MIB::sysFanStatus'),(53,'QTECH-MIB::sysPowerStatus'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(25,'SW-MIB::swOperStatus'),(24,'SW-MIB::swSensorStatus'),(1,'Service state'),(23,'TIMETRA-CHASSIS-MIB::TmnxDeviceState'),(35,'TruthValue'),(12,'VMware VirtualMachinePowerState'),(13,'VMware status'),(15,'Value cache operating mode'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status'),(22,'zabbix.host.available');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widgetid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`),
  KEY `widget_1` (`dashboardid`),
  CONSTRAINT `c_widget_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,1,'favgraphs','',0,0,2,3),(2,1,'favscreens','',2,0,2,3),(3,1,'favmaps','',4,0,2,3),(4,1,'problems','',0,3,6,6),(5,1,'web','',0,9,3,4),(6,1,'discovery','',3,9,3,4),(7,1,'problemhosts','',6,0,6,4),(8,1,'problemsbysv','',6,4,6,4),(9,1,'systeminfo','',6,8,6,5);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_field`
--

DROP TABLE IF EXISTS `widget_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_field` (
  `widget_fieldid` bigint(20) unsigned NOT NULL,
  `widgetid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value_groupid` bigint(20) unsigned DEFAULT NULL,
  `value_hostid` bigint(20) unsigned DEFAULT NULL,
  `value_itemid` bigint(20) unsigned DEFAULT NULL,
  `value_graphid` bigint(20) unsigned DEFAULT NULL,
  `value_sysmapid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_fieldid`),
  KEY `widget_field_1` (`widgetid`),
  KEY `widget_field_2` (`value_groupid`),
  KEY `widget_field_3` (`value_hostid`),
  KEY `widget_field_4` (`value_itemid`),
  KEY `widget_field_5` (`value_graphid`),
  KEY `widget_field_6` (`value_sysmapid`),
  CONSTRAINT `c_widget_field_1` FOREIGN KEY (`widgetid`) REFERENCES `widget` (`widgetid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_2` FOREIGN KEY (`value_groupid`) REFERENCES `hstgrp` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_3` FOREIGN KEY (`value_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_4` FOREIGN KEY (`value_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_5` FOREIGN KEY (`value_graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_6` FOREIGN KEY (`value_sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_field`
--

LOCK TABLES `widget_field` WRITE;
/*!40000 ALTER TABLE `widget_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-17  9:20:09