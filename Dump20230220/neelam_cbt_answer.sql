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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-20 22:49:15
