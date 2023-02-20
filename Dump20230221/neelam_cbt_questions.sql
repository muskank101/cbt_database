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
INSERT INTO `questions` VALUES (13,5,2,'What will be the value of x + y + z if cos-1 x + cos-1 y + cos-1 z = 3π?','-1/3','1','3','-3','4'),(14,5,2,'f(x) = c ∀ x ∈ R is continuous on R for a fixed c ∈ R.','false','true','0','0','2'),(15,5,2,' Which of the following holds true for a vector quantity?','It has only magnitude','It has only direction','It has both magnitude and direction','none','3'),(16,6,2,'SI unit of frequency ?','hertz','pascal','newton','none','1'),(17,6,2,'how many laws of newton are there ?','1','2','3','4','3'),(18,6,2,'ohm is unit of measuring ?','resistance','current','viltage ','none','1'),(19,7,2,'which one represents oxygen ?','O','O2','O3','none','2'),(20,7,2,'methanol is ?','CH3OH','CH3CHO','CH3COOH','NH3','1'),(21,7,2,'What product(s) is/are formed when aluminum metal is treated with concentrated nitric acid?',' Al (NO3) 3','Al (NO2) 3 + H2','Al2O3','Al4O3','3'),(22,8,3,'Who is the author of the book “Life of Pi” ?','Yann Martel','Rohinton Mistry','Ken Follet','M.J. Akbar','1'),(23,8,3,'During whose reign Mahayana sect of Buddhism came into existence?','Ashoka','Kanishka','Ajatsatru','Nagarjuna','3'),(24,8,3,'What is the name of the first indigenous testing kit for COVID-19 in India, which was launched at Pune?','Patho Detect','Covid Detect',' India Detect',' Mylab Detect','1'),(25,9,3,'Tom ___ tired.','look','looked','looks','none','3'),(26,9,3,'Nafeesa is afraid_____ spiders.','from','in ','about','of','4'),(27,9,3,'correct Spelling ?','amoeba','ameba','ameoba','none','1'),(28,10,3,'Which one is NOT divisible by 3 ?','88','99','90','72','1'),(29,10,3,'What should be the value of * in 985*865, if number is divisible by 9?','6','5','4','0','3'),(30,10,3,' When 2256 is divided by 17 the remainder would be','1','16','14','none','4'),(31,10,3,'what is 2424*4123 ','24565446','67633245','24567767','none','4');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21  0:23:11
