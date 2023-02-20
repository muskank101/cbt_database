-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: neelam_cbt
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `paper_id` int NOT NULL,
  `section_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_option` mediumtext NOT NULL,
  `is_correct` tinyint NOT NULL,
  `attempt_no` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_id_idx` (`user_id`),
  KEY `ppr_id_idx` (`paper_id`),
  KEY `sec_id_idx` (`section_id`),
  KEY `ques_id_idx` (`question_id`),
  CONSTRAINT `p_id` FOREIGN KEY (`paper_id`) REFERENCES `question_paper` (`qp_id`),
  CONSTRAINT `q_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,3,1,1,1,'1',0,1),(2,3,1,1,2,'2',1,1),(3,3,1,2,4,'3',0,1),(4,3,1,2,5,'4',1,1),(5,3,1,3,7,'2',1,1),(6,3,1,3,9,'1',0,1),(7,3,1,1,1,'2',1,2),(8,3,1,1,2,'2',1,2),(9,3,1,2,4,'2',1,2),(10,3,1,2,6,'4',0,2),(11,3,1,3,8,'4',1,2),(12,3,1,3,9,'3',0,2),(13,4,2,4,10,'1',1,1),(14,4,2,5,12,'3',1,1),(15,4,2,6,14,'2',1,1),(16,4,2,6,15,'2',0,1),(17,4,2,7,17,'3',1,1),(18,5,3,8,22,'1',1,1),(19,5,3,9,26,'4',1,1),(20,5,3,10,28,'1',0,1),(21,5,3,10,30,'4',0,1);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `ppr_id` int NOT NULL,
  `paper_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ppr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (1,'NIMCET'),(2,'JEE'),(3,'SSC');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_paper`
--

DROP TABLE IF EXISTS `question_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_paper` (
  `qp_id` int NOT NULL,
  `p_id` int NOT NULL,
  `year` year NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`qp_id`),
  KEY `p_id_idx` (`p_id`),
  KEY `usr_id_idx` (`created_by`),
  KEY `u_id_idx` (`created_by`),
  KEY `created_by_idx` (`created_by`),
  CONSTRAINT `pprid` FOREIGN KEY (`p_id`) REFERENCES `papers` (`ppr_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`created_by`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_paper`
--

LOCK TABLES `question_paper` WRITE;
/*!40000 ALTER TABLE `question_paper` DISABLE KEYS */;
INSERT INTO `question_paper` VALUES (1,1,2018,1),(2,1,2019,2),(3,2,2020,1),(4,2,2021,2),(5,3,2021,1),(6,3,2017,2);
/*!40000 ALTER TABLE `question_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `qid` int NOT NULL,
  `section_id` int NOT NULL,
  `paper_id` int NOT NULL,
  `question` mediumtext NOT NULL,
  `option1` mediumtext NOT NULL,
  `option2` mediumtext NOT NULL,
  `option3` mediumtext NOT NULL,
  `option4` mediumtext NOT NULL,
  `answer` mediumtext NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `section_id_idx` (`section_id`),
  KEY `ppr_id_idx` (`paper_id`),
  CONSTRAINT `ppr_id` FOREIGN KEY (`paper_id`) REFERENCES `question_paper` (`qp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sec_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,1,'I ____ cold.','am','have ','had','is','2'),(2,1,1,'correct spelling ','corect','good','acurate','beaware','2'),(3,1,1,'Select the synonym of carnal','sensual','spiritual','decent','chaste','1'),(4,2,1,'What is the least common multiple (LCM) of the numbers 90, 60, 75 and 35','2700','6300','4250','2750','2'),(5,2,1,'Which of the following is NOT a parallelogram ?','square','rectangle','rhombus','trapezium','4'),(6,2,1,'Which of the following statement is true ?','1 is not a prime number','1 is a prime number','1 is a composite number','2 is not a prime number','1'),(7,3,1,'Look at this series: 2, 1, (1/2), (1/4), ... What number should come next?','1/3','1/8','2/8','1/16','2'),(8,3,1,'Marathon is to race as hibernation is to','winter','bear','dream','sleep','4'),(9,3,1,'pen:paper :: ball: __','play','jump','sleep','none','4'),(10,4,1,'smallest unit of storage','bit ',' byte','Megabyte','terabyte','1'),(11,4,1,'parts of computer system ?','Monitor','keyboard','CPU','all','4'),(12,4,1,'smallest memory ?','RAM','ROM','cache','none','3'),(13,5,2,'What will be the value of x + y + z if cos-1 x + cos-1 y + cos-1 z = 3π?','-1/3','1','3','-3','4'),(14,5,2,'f(x) = c ∀ x ∈ R is continuous on R for a fixed c ∈ R.','false','true','0','0','2'),(15,5,2,' Which of the following holds true for a vector quantity?','It has only magnitude','It has only direction','It has both magnitude and direction','none','3'),(16,6,2,'SI unit of frequency ?','hertz','pascal','newton','none','1'),(17,6,2,'how many laws of newton are there ?','1','2','3','4','3'),(18,6,2,'ohm is unit of measuring ?','resistance','current','viltage ','none','1'),(19,7,2,'which one represents oxygen ?','O','O2','O3','none','2'),(20,7,2,'methanol is ?','CH3OH','CH3CHO','CH3COOH','NH3','1'),(21,7,2,'What product(s) is/are formed when aluminum metal is treated with concentrated nitric acid?',' Al (NO3) 3','Al (NO2) 3 + H2','Al2O3','Al4O3','3'),(22,8,3,'Who is the author of the book “Life of Pi” ?','Yann Martel','Rohinton Mistry','Ken Follet','M.J. Akbar','1'),(23,8,3,'During whose reign Mahayana sect of Buddhism came into existence?','Ashoka','Kanishka','Ajatsatru','Nagarjuna','3'),(24,8,3,'What is the name of the first indigenous testing kit for COVID-19 in India, which was launched at Pune?','Patho Detect','Covid Detect',' India Detect',' Mylab Detect','1'),(25,9,3,'Tom ___ tired.','look','looked','looks','none','3'),(26,9,3,'Nafeesa is afraid_____ spiders.','from','in ','about','of','4'),(27,9,3,'correct Spelling ?','amoeba','ameba','ameoba','none','1'),(28,10,3,'Which one is NOT divisible by 3 ?','88','99','90','72','1'),(29,10,3,'What should be the value of * in 985*865, if number is divisible by 9?','6','5','4','0','3'),(30,10,3,' When 2256 is divided by 17 the remainder would be','1','16','14','none','4');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `paper_id` int NOT NULL,
  `score` int NOT NULL,
  `attempt_no` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`user_id`),
  KEY `paper_id_idx` (`paper_id`),
  CONSTRAINT `pper_id` FOREIGN KEY (`paper_id`) REFERENCES `question_paper` (`qp_id`),
  CONSTRAINT `ur_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,3,1,3,1),(2,3,1,4,2),(3,4,2,4,1),(5,5,3,2,1);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL,
  `paper_id` int NOT NULL,
  `section_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`paper_id`),
  CONSTRAINT `paper_id` FOREIGN KEY (`paper_id`) REFERENCES `question_paper` (`qp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,'english'),(2,1,'maths'),(3,1,'reasoning'),(4,1,'computer'),(5,2,'maths'),(6,2,'physics'),(7,2,'chemistry'),(8,3,'GK'),(9,3,'english'),(10,3,'aptitude');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `usename` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'neelam','root1@gmail.com','root1','admin'),(2,'muskan','root2@gmail.com','root2','admin'),(3,'ravi','ravi@gmai.com','ravi','user'),(4,'kavita','kavita12@gmail.com','kavita','user'),(5,'rahul','rahul99@gmail.com','rahul','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13 11:33:00
