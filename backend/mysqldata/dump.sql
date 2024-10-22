-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: anatomia1
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_aumento`
--

DROP TABLE IF EXISTS `api_aumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_aumento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zoom` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zoom` (`zoom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_aumento`
--

LOCK TABLES `api_aumento` WRITE;
/*!40000 ALTER TABLE `api_aumento` DISABLE KEYS */;
INSERT INTO `api_aumento` VALUES
(2,'X10'),
(4,'X100'),
(1,'X4'),
(3,'X40');
/*!40000 ALTER TABLE `api_aumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_calidad`
--

DROP TABLE IF EXISTS `api_calidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_calidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(7) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_calidad`
--

LOCK TABLES `api_calidad` WRITE;
/*!40000 ALTER TABLE `api_calidad` DISABLE KEYS */;
INSERT INTO `api_calidad` VALUES
(1,'BC.1','Toma válida para examen.'),
(2,'BC.2','Toma válida para examen aunque limitada por ausencia de células endocárdicas/zona de transición.'),
(3,'BC.3','Toma válida para examen aunque limitada por hemorragia.'),
(4,'BC.4','Toma válida para examen aunque limitada por escasez de células.'),
(5,'BC.5','Toma válida para examen aunque limitada por intensa citólisis.'),
(6,'BC.6','Toma válida para examen aunque limitada por...'),
(7,'BC.7','Toma no valorable por desecación.'),
(8,'BC.8','Toma no valorable por ausencia de células...'),
(9,'BC.9','Toma no valorable por...'),
(20,'BH.1','La muestra es válida para el examen.'),
(21,'BH.2','Aunque válida, la muestra está limitada por la ausencia de células endoteliales/hepatocitos periportales.'),
(22,'BH.3','La muestra es válida para el examen, pero está limitada por la presencia de hemorragia.'),
(23,'BH.4','La muestra es válida para el examen, pero está limitada por la escasez de células.'),
(24,'BH.5','La muestra es válida para el examen, aunque está limitada por una intensa citolisis.'),
(25,'BH.6','La muestra es válida para el examen, aunque está limitada por...'),
(26,'BH.7','La muestra no es valorable debido a la desecación.'),
(27,'BH.8','La muestra no es valorable debido a la ausencia de células...'),
(28,'BH.9','La muestra no es valorable debido a...'),
(39,'BES.1','La muestra es válida para el examen.'),
(40,'BES.2','Aunque válida, la muestra está limitada por la presencia de contenido gástrico residual.'),
(41,'BES.3','La muestra es válida para el examen, pero está limitada por la presencia de sangre.'),
(42,'BES.4','La muestra es válida para el examen, pero está limitada por la escasez de células.'),
(43,'BES.5','La muestra es válida para el examen, aunque está limitada por la presencia de moco.'),
(44,'BES.6','La muestra es válida para el examen, aunque está limitada por...'),
(45,'BES.7','La muestra no es valorable debido a la desecación.'),
(46,'BES.8','La muestra no es valorable debido a la ausencia de tejido gástrico...'),
(47,'BES.9','La muestra no es valorable debido a...'),
(58,'BR.1','La muestra es válida para el examen.'),
(59,'BR.2','Aunque válida, la muestra está limitada por la presencia de tejido adiposo\nperirrenal.'),
(60,'BR.3','La muestra es válida para el examen, pero está limitada por la presencia de sangre\nen el espécimen.'),
(61,'BR.4','La muestra es válida para el examen, pero está limitada por la escasez de\nglomérulos en el corte.'),
(62,'BR.5','La muestra es válida para el examen, aunque está limitada por la presencia de\nartefactos de fijación.'),
(63,'BR.6','La muestra es válida para el examen, aunque está limitada por...'),
(64,'BR.7','La muestra no es valorable debido a la desecación.'),
(65,'BR.8','La muestra no es valorable debido a la ausencia de tejido renal...'),
(66,'BR.9','La muestra no es valorable debido a...'),
(77,'BU.1','La muestra es válida para el examen.'),
(78,'BU.2','Aunque válida, la muestra está limitada por la presencia de sangre menstrual en el\nespécimen.'),
(79,'BU.3','La muestra es válida para el examen, pero está limitada por la escasez de tejido\nendometrial en el corte.'),
(80,'BU.4','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(81,'BU.5','La muestra es válida para el examen, aunque está limitada por la presencia de\ncélulas descamadas en el endometrio.'),
(82,'BU.6','La muestra es válida para el examen, aunque está limitada por...'),
(83,'BU.7','La muestra no es valorable debido a la desecación.'),
(84,'BU.8','La muestra no es valorable debido a la ausencia de tejido uterino...'),
(85,'BU.9','La muestra no es valorable debido a...'),
(96,'BI.1','La muestra es válida para el examen.'),
(97,'BI.2','Aunque válida, la muestra está limitada por la presencia de contenido fecal en el\nlumen intestinal.'),
(98,'BI.3','La muestra es válida para el examen, pero está limitada por la escasez de tejido\nmucoso en el corte.'),
(99,'BI.4','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(100,'BI.5','La muestra es válida para el examen, aunque está limitada por la presencia de\ntejido adiposo perivisceral.'),
(101,'BI.6','La muestra es válida para el examen, aunque está limitada por...'),
(102,'BI.7','La muestra no es valorable debido a la desecación.'),
(103,'BI.8','La muestra no es valorable debido a la ausencia de tejido intestinal...'),
(104,'BI.9','La muestra no es valorable debido a...'),
(115,'BEF.1','La muestra es válida para el examen.'),
(116,'BEF.2','Aunque válida, la muestra está limitada por la presencia de contenido alimenticio\nen la luz esofágica.'),
(117,'BEF.3','La muestra es válida para el examen, pero está limitada por la escasez de tejido\nepitelial en el corte.'),
(118,'BEF.4','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(119,'BEF.5','La muestra es válida para el examen, aunque está limitada por la presencia de\ntejido conectivo periesofágico.'),
(120,'BEF.6','La muestra es válida para el examen, aunque está limitada por...'),
(121,'BEF.7','La muestra no es valorable debido a la desecación.'),
(122,'BEF.8','La muestra no es valorable debido a la ausencia de tejido esofágico...'),
(123,'BEF.9','La muestra no es valorable debido a...'),
(134,'BT.1','La muestra es válida para el examen.'),
(135,'BT.2','Aunque válida, la muestra está limitada por la presencia de células germinales\nescasas.'),
(136,'BT.3','La muestra es válida para el examen, pero está limitada por la presencia de tejido\nfibroso intersticial.'),
(137,'BT.4','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(138,'BT.5','La muestra es válida para el examen, aunque está limitada por la deshidratación\ndel tejido.'),
(139,'BT.6','La muestra es válida para el examen, aunque está limitada por...'),
(140,'BT.7','La muestra no es valorable debido a la desecación.'),
(141,'BT.8','La muestra no es valorable debido a la ausencia de tejido testicular...'),
(142,'BT.9','La muestra no es valorable debido a...'),
(153,'BP.1','La muestra es válida para el examen.'),
(154,'BP.2','Aunque válida, la muestra está limitada por la presencia de tejido necrótico en el\ncorte.'),
(155,'BP.3','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(156,'BP.4','La muestra es válida para el examen, pero está limitada por la presencia de células\ninflamatorias abundantes.'),
(157,'BP.5','La muestra es válida para el examen, aunque está limitada por la deshidratación\ndel tejido.'),
(158,'BP.6','La muestra es válida para el examen, aunque está limitada por...'),
(159,'BP.7','La muestra no es valorable debido a la desecación.'),
(160,'BP.8','La muestra no es valorable debido a la ausencia de tejido pulmonar...'),
(161,'BP.9','La muestra no es valorable debido a...'),
(172,'BB.1','La muestra es válida para el examen.'),
(173,'BB.2','Aunque válida, la muestra está limitada por la presencia de tejido hemorrágico en\nel corte.'),
(174,'BB.3','La muestra es válida para el examen, pero está limitada por la escasez de tejido\nlinfoide en la muestra.'),
(175,'BB.4','La muestra es válida para el examen, pero está limitada por la presencia de\nartefactos de fijación.'),
(176,'BB.5','La muestra es válida para el examen, aunque está limitada por la deshidratación\ndel tejido.'),
(177,'BB.6','La muestra es válida para el examen, aunque está limitada por...'),
(178,'BB.7','La muestra no es valorable debido a la desecación.'),
(179,'BB.8','La muestra no es valorable debido a la ausencia de tejido esplénico...'),
(180,'BB.9','La muestra no es valorable debido a...'),
(191,'BF.1','Toma válida para examen.'),
(192,'BF.2','Toma válida para examen aunque limitada por tamaño del feto.'),
(193,'BF.3','Toma válida para examen aunque limitada por artefactos de\nprocesamiento.'),
(194,'BF.4','Toma válida para examen aunque limitada por deterioro del tejido fetal.'),
(195,'BF.5','Toma válida para examen aunque limitada por presencia de líquido\namniótico.'),
(196,'BF.6','Toma no valorable por desecación.'),
(197,'BF.7','Toma no valorable por ausencia de tejido fetal.'),
(208,'BCB.1','Toma válida para examen.'),
(209,'BCB.2','Toma válida para examen aunque limitada por escasez de tejido cerebral.'),
(210,'BCB.3','Toma válida para examen aunque limitada por artefactos de procesamiento.'),
(211,'BCB.4','Toma válida para examen aunque limitada por hemorragia.'),
(212,'BCB.5','Toma válida para examen aunque limitada por necrosis extensa.'),
(213,'BCB.6','Toma no valorable por desecación.'),
(214,'BCB.7','Toma no valorable por ausencia de tejido cerebral.'),
(225,'BL.1','Toma válida para examen.'),
(226,'BL.2','Toma válida para examen aunque limitada por escasez de tejido lingual.'),
(227,'BL.3','Toma válida para examen aunque limitada por artefactos de\nprocesamiento.'),
(228,'BL.4','Toma válida para examen aunque limitada por hemorragia.'),
(229,'BL.5','Toma válida para examen aunque limitada por presencia de saliva.'),
(230,'BL.6','Toma no valorable por desecación.'),
(231,'BL.7','Toma no valorable por ausencia de tejido lingual.'),
(247,'BO.1','Toma válida para examen.'),
(248,'BO.2','Toma válida para examen aunque limitada por escasez de tejido\novárico.'),
(249,'BO.3','Toma válida para examen aunque limitada por artefactos de\nprocesamiento.'),
(250,'BO.4','Toma válida para examen aunque limitada por hemorragia.'),
(251,'BO.5','Toma válida para examen aunque limitada por necrosis extensa.'),
(252,'BO.6','Toma no valorable por desecación.'),
(253,'BO.7','Toma no valorable por ausencia de tejido ovárico.'),
(264,'BTF.1','Toma válida para examen.'),
(265,'BTF.2','Toma válida para examen aunque limitada por escasez de tejido\ntubárico.'),
(266,'BTF.3','Toma válida para examen aunque limitada por artefactos de\nprocesamiento.'),
(267,'BTF.4','Toma válida para examen aunque limitada por hemorragia.'),
(268,'BTF.5','Toma válida para examen aunque limitada por presencia de moco\ncervical.'),
(269,'BTF.6','Toma no valorable por desecación.'),
(270,'BTF.7','Toma no valorable por ausencia de tejido tubárico.'),
(281,'BPA.1','Toma válida para examen.'),
(282,'BPA.2','Toma válida para examen aunque limitada por escasez de tejido\npancreático.'),
(283,'BPA.3','Toma válida para examen aunque limitada por artefactos de\nprocesamiento.'),
(284,'BPA.4','Toma válida para examen aunque limitada por necrosis extensa.'),
(285,'BPA.5','Toma válida para examen aunque limitada por hemorragia.'),
(286,'BPA.6','Toma no valorable por desecación.'),
(287,'BPA.7','Toma no valorable por ausencia de tejido pancreático.'),
(298,'BPI.1','Toma válida para examen.'),
(299,'BPI.2','Toma válida para examen aunque limitada por ausencia de células\nendocervicales/zona de transición.'),
(300,'BPI.3','Toma válida para examen aunque limitada por hemorragia.'),
(301,'BPI.4','Toma válida para examen aunque limitada por escasez de células.'),
(302,'BPI.5','Toma válida para examen aunque limitada por intensa citólisis.'),
(303,'BPI.6','Toma no valorable por desecación.'),
(304,'BPI.7','Toma no valorable por ausencia de células.');
/*!40000 ALTER TABLE `api_calidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_codificacioninterpretacion`
--

DROP TABLE IF EXISTS `api_codificacioninterpretacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_codificacioninterpretacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(7) NOT NULL,
  `descripcion` longtext NOT NULL,
  `naturaleza` varchar(50) NOT NULL,
  `organo` varchar(30) NOT NULL,
  `tipo` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `api_codificacioninte_naturaleza_df3e802b_fk_api_natur` (`naturaleza`),
  KEY `api_codificacioninte_organo_1bd081ce_fk_api_organ` (`organo`),
  KEY `api_codificacioninterpretacion_tipo_732f5940_fk_api_tipo_tipo` (`tipo`),
  CONSTRAINT `api_codificacioninte_naturaleza_df3e802b_fk_api_natur` FOREIGN KEY (`naturaleza`) REFERENCES `api_naturaleza` (`naturaleza`),
  CONSTRAINT `api_codificacioninte_organo_1bd081ce_fk_api_organ` FOREIGN KEY (`organo`) REFERENCES `api_organo` (`organo`),
  CONSTRAINT `api_codificacioninterpretacion_tipo_732f5940_fk_api_tipo_tipo` FOREIGN KEY (`tipo`) REFERENCES `api_tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_codificacioninterpretacion`
--

LOCK TABLES `api_codificacioninterpretacion` WRITE;
/*!40000 ALTER TABLE `api_codificacioninterpretacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_codificacioninterpretacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_estado`
--

DROP TABLE IF EXISTS `api_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_estado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `comentario` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_estado`
--

LOCK TABLES `api_estado` WRITE;
/*!40000 ALTER TABLE `api_estado` DISABLE KEYS */;
INSERT INTO `api_estado` VALUES
(1,'No validado',NULL),
(2,'Validado',NULL),
(3,'Pendiente',NULL);
/*!40000 ALTER TABLE `api_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_formato`
--

DROP TABLE IF EXISTS `api_formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_formato` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `formato` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `formato` (`formato`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_formato`
--

LOCK TABLES `api_formato` WRITE;
/*!40000 ALTER TABLE `api_formato` DISABLE KEYS */;
INSERT INTO `api_formato` VALUES
(1,'Etanol 70%'),
(2,'Formol'),
(3,'Fresco');
/*!40000 ALTER TABLE `api_formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_imagen`
--

DROP TABLE IF EXISTS `api_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_imagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `zoom` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imagen` (`imagen`),
  KEY `api_imagen_zoom_650602df_fk_api_aumento_zoom` (`zoom`),
  CONSTRAINT `api_imagen_zoom_650602df_fk_api_aumento_zoom` FOREIGN KEY (`zoom`) REFERENCES `api_aumento` (`zoom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_imagen`
--

LOCK TABLES `api_imagen` WRITE;
/*!40000 ALTER TABLE `api_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_interpretacion`
--

DROP TABLE IF EXISTS `api_interpretacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_interpretacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(7) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_interpretacion`
--

LOCK TABLES `api_interpretacion` WRITE;
/*!40000 ALTER TABLE `api_interpretacion` DISABLE KEYS */;
INSERT INTO `api_interpretacion` VALUES
(10,'1.1','Se observa una arquitectura cardíaca conservada, con una adecuada distribución de miocitos y estructuras vasculares.'),
(11,'1.2','No se observan signos evidentes de necrosis en el tejido cardíaco, lo que sugiere una integridad estructural relativamente normal.'),
(12,'1.3','Identificación de células inflamatorias dispersas en el tejido, indicativas de una respuesta inflamatoria leve o moderada.'),
(13,'1.4','Presencia de áreas de fibrosis en el miocardio, posiblemente como resultado de un proceso de cicatrización tras una lesión cardíaca previa.'),
(14,'1.5','Se detecta una adecuada perfusión sanguínea en los vasos coronarios, indicativa de una circulación coronaria funcional.'),
(15,'1.6','Observación de células cardíacas con una apariencia histológica normal, incluyendo la presencia de discos intercalares y estriaciones transversales.'),
(16,'1.7','No se observan células tumorales ni signos de infiltración neoplásica en el tejido cardíaco.'),
(17,'1.8','Identificación de células endoteliales íntegras en los vasos sanguíneos, sugiriendo una función endotelial adecuada.'),
(18,'1.9','Se observa una distribución regular de fibras de colágeno en el miocardio, indicativo de una matriz extracelular bien organizada.'),
(19,'1.10','No se identifican anomalías estructurales significativas en las válvulas cardíacas ni en las cámaras cardíacas.'),
(29,'2.1','Se observa una arquitectura hepática conservada, con cordones de hepatocitos bien definidos y distribución lobulillar normal.'),
(30,'2.2','Hay presencia de infiltración celular en los sinusoides hepáticos, sugiriendo una respuesta inflamatoria o un proceso infiltrativo.'),
(31,'2.3','Se identifica una acumulación de lípidos en los hepatocitos, indicativo de esteatosis hepática.'),
(32,'2.4','Se observan signos de necrosis focal en el tejido, posiblemente debido a isquemia o daño tóxico.'),
(33,'2.5','Existe una marcada fibrosis periportal, sugiriendo un proceso crónico de inflamación hepática.'),
(34,'2.6','Se observan nódulos de regeneración, indicativos de un proceso de reparación hepática.'),
(35,'2.7','Presencia de células de Kupffer activadas, sugiriendo una respuesta inmunitaria o inflamatoria.'),
(36,'2.8','Se detectan células endoteliales anormales en los vasos sanguíneos hepáticos, lo que podría indicar un proceso neoplásico.'),
(37,'2.9','Se observa una marcada congestión sinusoidal, posiblemente debido a una obstrucción del flujo sanguíneo hepático.'),
(38,'2.10','Hay signos de colestasis intrahepática, indicando una obstrucción en el flujo de la bilis dentro del hígado.'),
(48,'3.1','Se observa un epitelio gástrico intacto y bien conservado.'),
(49,'3.2','Presencia de infiltración de células inflamatorias en la lámina propia, sugiriendo una\nrespuesta inflamatoria crónica.'),
(50,'3.3','Identificación de células caliciformes productoras de moco en las glándulas\ngástricas.'),
(51,'3.4','Signos de erosión superficial de la mucosa gástrica, posiblemente debido a irritación\ncrónica.'),
(52,'3.5','Presencia de gastritis aguda, evidenciada por la infiltración de neutrófilos en la\nmucosa gástrica.'),
(53,'3.6','Observación de cambios displásicos en el epitelio gástrico, sugiriendo un proceso\npreneoplásico.'),
(54,'3.7','Detección de Helicobacter pylori en la mucosa gástrica, indicando una infección\nbacteriana.'),
(55,'3.8','Presencia de metaplasia intestinal en la mucosa gástrica, sugiriendo una adaptación\nal ambiente ácido del estómago.'),
(56,'3.9','Identificación de células neuroendocrinas en las glándulas gástricas, indicando una\nfunción endocrina.'),
(57,'3.10','Signos de ulceración profunda en la mucosa gástrica, posiblemente relacionada\ncon un proceso ulceroso crónico.'),
(67,'4.1','Se observa una arquitectura renal conservada, con una adecuada distribución de los\ndiferentes componentes histológicos.'),
(68,'4.2','Presencia de infiltración de tejido adiposo perirrenal,.'),
(69,'4.3','Identificación de glóbulos rojos en los túbulos renales, indicativo de hematuria y\nposible lesión glomerular.'),
(70,'4.4','Signos de esclerosis glomerular, evidenciada por la presencia de matriz extracelular\naumentada y segmentos glomerulares colapsados.'),
(71,'4.5','Presencia de artefactos de fijación en el tejido, lo que puede dificultar la\ninterpretación precisa de algunas estructuras.'),
(72,'4.6','Observación de necrosis tubular aguda, caracterizada por la pérdida de la\narquitectura tubular y la presencia de células necróticas en el lumen tubular.'),
(73,'4.7','Detección de cilindros hialinos en los túbulos renales, indicando una posible\nproteinuria.'),
(74,'4.8','Presencia de células inflamatorias en el intersticio renal, sugiriendo una respuesta\ninflamatoria crónica.'),
(75,'4.9','Identificación de cuerpos ovales grasos en los túbulos renales, indicativos de daño\nrenal crónico y degeneración lipídica.'),
(76,'4.10','Signos de fibrosis intersticial, evidenciada por la presencia de tejido conectivo\nfibroso entre los túbulos renales y los glomérulos.'),
(86,'5.1','Se observa un endometrio bien conservado, con una adecuada proliferación glandular\ny estroma endometrial.'),
(87,'5.2','Presencia de sangre en el espécimen, indicando la fase menstrual del ciclo uterino.'),
(88,'5.3','Identificación de escaso tejido endometrial en el corte, sugiriendo una posible atrofia\nendometrial.'),
(89,'5.4','Signos de artefactos de fijación en el tejido, lo que puede dificultar la interpretación\nprecisa de algunas estructuras.'),
(90,'5.5','Observación de células descamadas en el endometrio, indicativas de la fase de\ndescamación menstrual.'),
(91,'5.6','Detección de hiperplasia glandular endometrial, sugiriendo un desequilibrio\nhormonal.'),
(92,'5.7','Presencia de infiltración de células inflamatorias en el estroma endometrial,\nindicando una respuesta inflamatoria crónica.'),
(93,'5.8','Identificación de cuerpos de Arias-Stella en las células glandulares, sugiriendo\ncambios hormonales asociados con el embarazo o condiciones patológicas.'),
(94,'5.9','Signos de adenomiosis, evidenciada por la presencia de glándulas endometriales\ndentro del miometrio.'),
(95,'5.10','Presencia de células atípicas en las glándulas endometriales, sugiriendo una posible\nneoplasia endometrial.'),
(105,'6.1','Se observa una mucosa intestinal con vellosidades bien conservadas y un epitelio\ncolumnar intacto.'),
(106,'6.2','Presencia de contenido fecal en el lumen intestinal, indicando la fase digestiva del\nproceso.'),
(107,'6.3','Identificación de escaso tejido mucoso en el corte, sugiriendo una posible atrofia de\nlas glándulas mucosas.'),
(108,'6.4','Signos de artefactos de fijación en el tejido, lo que puede dificultar la interpretación\nprecisa de algunas estructuras.'),
(109,'6.5','Observación de tejido adiposo perivisceral, indicativo de la ubicación anatómica de\nla muestra.'),
(110,'6.6','Detección de células caliciformes en las criptas intestinales, indicativas de\nproducción de moco.'),
(111,'6.7','Presencia de infiltración de células inflamatorias en la lámina propia, sugiriendo una\nrespuesta inflamatoria crónica.'),
(112,'6.8','Identificación de placas de Peyer en la mucosa intestinal, indicativas de tejido\nlinfoide asociado al intestino.'),
(113,'6.9','Signos de metaplasia intestinal, evidenciada por la presencia de células caliciformes\nen áreas no habituales.'),
(114,'6.10','Presencia de signos de regeneración epitelial, indicativos de un proceso de\nreparación tras una lesión o inflamación.'),
(124,'7.1','Se observa un epitelio escamoso estratificado bien conservado en la mucosa\nesofágica.'),
(125,'7.2','Presencia de contenido alimenticio en la luz esofágica, indicando la fase de tránsito\ndel proceso digestivo.'),
(126,'7.3','Identificación de escaso tejido epitelial en el corte, sugiriendo posible atrofia o\nadelgazamiento del epitelio.'),
(127,'7.4','Signos de artefactos de fijación en el tejido, lo que puede dificultar la interpretación\nprecisa de algunas estructuras.'),
(128,'7.5','Observación de tejido conectivo periesofágico, indicativo de la ubicación anatómica\nde la muestra.'),
(129,'7.6','Detección de células caliciformes dispersas en la mucosa esofágica, sugiriendo\nproducción de moco.'),
(130,'7.7','Presencia de infiltración de células inflamatorias en la lámina propia, indicando una\nrespuesta inflamatoria.'),
(131,'7.8','Identificación de vasos sanguíneos y nervios en la submucosa esofágica,\ncomponentes normales del tejido.'),
(132,'7.9','Signos de hiperplasia epitelial, evidenciada por un aumento en el número de capas\ncelulares.'),
(133,'7.10','Presencia de células de Langerhans en la mucosa esofágica, indicativas de una\nfunción inmunológica local.'),
(143,'8.1','Se observa una arquitectura testicular conservada, con la presencia de túbulos\nseminíferos bien definidos.'),
(144,'8.2','Presencia de células germinales escasas en los túbulos seminíferos, lo que puede\nindicar una disminución en la espermatogénesis.'),
(145,'8.3','Identificación de tejido fibroso intersticial entre los túbulos seminíferos, sugiriendo\nuna posible fibrosis testicular.'),
(146,'8.4','Signos de artefactos de fijación en el tejido, lo que puede afectar la visualización\nprecisa de algunas estructuras.'),
(147,'8.5','Observación de deshidratación del tejido, lo que puede causar contracción y\ndistorsión de las células y estructuras.'),
(148,'8.6','Detección de células de Sertoli en los túbulos seminíferos, indicativas de su función\nde soporte para las células germinales.'),
(149,'8.7','Presencia de células de Leydig en el tejido intersticial, responsables de la\nproducción de testosterona.'),
(150,'8.8','Identificación de células inmaduras o anormales en los túbulos seminíferos,\nsugiriendo un posible trastorno en la espermatogénesis.'),
(151,'8.9','Signos de inflamación testicular, evidenciados por la presencia de células\ninflamatorias en el tejido.'),
(152,'8.10','Presencia de células apoptóticas en los túbulos seminíferos, indicando un proceso\nde muerte celular programada, posiblemente relacionado con el daño testicular.'),
(162,'9.1','Se observa una arquitectura pulmonar conservada, con la presencia de alvéolos bien\ndefinidos y paredes alveolares íntegras.'),
(163,'9.2','Presencia de tejido necrótico en el corte, sugiriendo un proceso de necrosis tisular,\nposiblemente debido a una lesión o enfermedad.'),
(164,'9.3','Identificación de artefactos de fijación en el tejido, lo que puede dificultar la\ninterpretación precisa de algunas estructuras.'),
(165,'9.4','Signos de inflamación pulmonar, indicados por la presencia de células inflamatorias\nabundantes en el tejido.'),
(166,'9.5','Observación de deshidratación del tejido, lo que puede causar contracción y\ndistorsión de las células y estructuras.'),
(167,'9.6','Detección de tejido fibroso en los espacios alveolares, sugiriendo fibrosis pulmonar.'),
(168,'9.7','Presencia de células de metaplasia escamosa en las vías respiratorias, indicativas de\nuna respuesta adaptativa al daño crónico.'),
(169,'9.8','Identificación de células neoplásicas en el tejido, sugiriendo un proceso tumoral\npulmonar.'),
(170,'9.9','Signos de edema pulmonar, evidenciados por la presencia de líquido en los espacios\nalveolares.'),
(171,'9.10','Presencia de cuerpos extraños en el tejido, indicando inhalación de material\nextraño.'),
(181,'10.1','Se observa una arquitectura esplénica conservada, con una adecuada distribución\nde la pulpa blanca y roja.'),
(182,'10.2','Presencia de áreas de tejido hemorrágico en el corte, indicativo de hemorragia\nintraparenquimatosa reciente o traumática.'),
(183,'10.3','Identificación de escaso tejido linfoide en la muestra, sugiriendo una posible\natrofia o disminución de la actividad inmunológica.'),
(184,'10.4','Signos de artefactos de fijación en el tejido, lo que puede dificultar la\ninterpretación precisa de algunas estructuras.'),
(185,'10.5','Observación de deshidratación del tejido, lo que puede causar contracción y\ndistorsión de las células y estructuras.'),
(186,'10.6','Se detecta un aumento en el tamaño de los folículos linfoides, indicativo de una\nrespuesta inmunológica activa.'),
(187,'10.7','Presencia de células plasmáticas en la pulpa blanca, sugiriendo una respuesta\ninmunitaria o inflamatoria.'),
(188,'10.8','Identificación de células de la serie eritroide en la pulpa roja, indicando actividad\nhematopoyética.'),
(189,'10.9','Se observa una marcada congestión vascular en la pulpa roja, posiblemente como\nrespuesta a la hemorragia o a una estimulación inflamatoria.'),
(190,'10.10','Presencia de células fagocíticas en la pulpa roja, indicativas de la función\nfagocítica del bazo en la eliminación de células sanguíneas viejas o anormales.'),
(198,'11.1','Presencia de tejido fetal bien desarrollado.'),
(199,'11.2','Presencia de órganos internos correctamente formados.'),
(200,'11.3','Presencia de tejido nervioso en desarrollo.'),
(201,'11.4','Presencia de células sanguíneas en formación.'),
(202,'11.5','Presencia de huesos en proceso de osificación.'),
(203,'11.6','Presencia de tejido muscular en desarrollo.'),
(204,'11.7','Presencia de membranas fetales intactas.'),
(205,'11.8','Presencia de cordón umbilical sin anomalías evidentes.'),
(206,'11.9','Presencia de estructuras faciales reconocibles.'),
(207,'11.10','Presencia de extremidades bien formadas.'),
(215,'12.1','Presencia de neuronas.'),
(216,'12.2','Presencia de células gliales.'),
(217,'12.3','Presencia de fibras nerviosas mielinizadas.'),
(218,'12.4','Presencia de fibras nerviosas no mielinizadas.'),
(219,'12.5','Presencia de vasos sanguíneos.'),
(220,'12.6','Presencia de células inflamatorias.'),
(221,'12.7','Presencia de infiltración de células neoplásicas.'),
(222,'12.8','Presencia de cuerpos de inclusión intracelulares.'),
(223,'12.9','Presencia de placas de proteína beta-amiloide.'),
(224,'12.10','Presencia de cuerpos de Lewy.'),
(232,'13.1','Presencia de epitelio escamoso estratificado.'),
(233,'13.2','Presencia de papilas gustativas filiformes.'),
(234,'13.3','Presencia de papilas gustativas fungiformes.'),
(235,'13.4','Presencia de papilas gustativas foliadas.'),
(236,'13.5','Presencia de células caliciformes.'),
(237,'13.6','Presencia de células basales.'),
(238,'13.7','Presencia de células parabasales.'),
(239,'13.8','Presencia de células intermedias.'),
(240,'13.9','Presencia de células superficiales.'),
(241,'13.10','Presencia de células inflamatorias.'),
(242,'13.11','Presencia de células de Langerhans.'),
(243,'13.12','Presencia de células glandulares.'),
(244,'13.13','Presencia de células neoplásicas.'),
(245,'13.14','Presencia de células con cambios atípicos.'),
(246,'13.15','Presencia de cuerpos extraños.'),
(254,'14.1','Presencia de folículos primordiales.'),
(255,'14.2','Presencia de folículos primarios.'),
(256,'14.3','Presencia de folículos secundarios.'),
(257,'14.4','Presencia de folículos maduros.'),
(258,'14.5','Presencia de células de la granulosa.'),
(259,'14.6','Presencia de células de la teca.'),
(260,'14.7','Presencia de células lúteas.'),
(261,'14.8','Presencia de cuerpos albicans.'),
(262,'14.9','Presencia de células intersticiales.'),
(263,'14.10','Presencia de células estromales.'),
(271,'15.1','Presencia de epitelio cilíndrico.'),
(272,'15.2','Presencia de células ciliadas.'),
(273,'15.3','Presencia de células secretoras.'),
(274,'15.4','Presencia de células endometriales ectópicas.'),
(275,'15.5','Presencia de células inflamatorias.'),
(276,'15.6','Presencia de células escamosas metaplásicas.'),
(277,'15.7','Presencia de células glandulares atípicas.'),
(278,'15.8','Presencia de células endometriales.'),
(279,'15.9','Presencia de células estromales.'),
(280,'15.10','Presencia de cuerpos extraños.'),
(288,'16.1','Presencia de células acinares.'),
(289,'16.2','Presencia de islotes de Langerhans.'),
(290,'16.3','Presencia de células ductales.'),
(291,'16.4','Presencia de infiltración de células inflamatorias.'),
(292,'16.5','Presencia de necrosis focal.'),
(293,'16.6','Presencia de fibrosis intersticial.'),
(294,'16.7','Presencia de células neoplásicas.'),
(295,'16.8','Presencia de cuerpos de inclusión eosinofílicos.'),
(296,'16.9','Presencia de calcificación distrófica.'),
(297,'16.10','Presencia de células adiposas en el estroma.'),
(305,'17.1','Predominio de células epiteliales escamosas superficiales.'),
(306,'17.2','Predominio de células epiteliales escamosas intermedias.'),
(307,'17.3','Predominio de células epiteliales escamosas parabasales.'),
(308,'17.4','Poli nucleares neutrófilos.'),
(309,'17.5','Células metaplásicas inmaduras.'),
(310,'17.6','Células reactivas.'),
(311,'17.7','Alteraciones celulares sugerentes de HPV.'),
(312,'17.8','Alteraciones celulares sugerentes de Herpes.'),
(313,'17.9','Células neoplásicas.'),
(314,'17.10','Células superficiales e intermedias con cambios atípicos.'),
(315,'17.11','Células intermedias y parabasales con algunos cambios atípicos.'),
(316,'17.12','Células parabasales con algunos cambios atípicos.'),
(317,'17.13','Células escamosas de significado incierto.'),
(318,'17.14','Células epiteliales glandulares de significado incierto.');
/*!40000 ALTER TABLE `api_interpretacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_muestra`
--

DROP TABLE IF EXISTS `api_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_muestra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `interpretacion` json NOT NULL,
  `imagenes` json NOT NULL,
  `zoom` json NOT NULL,
  `calidad` varchar(7) NOT NULL,
  `formato` varchar(20) NOT NULL,
  `naturaleza` varchar(50) NOT NULL,
  `organo` varchar(30) NOT NULL,
  `sede` varchar(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `descripcionCal` longtext,
  `descripcionInt` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `api_muestra_calidad_5d2d4715_fk_api_calidad_codigo` (`calidad`),
  KEY `api_muestra_formato_631a6d92_fk_api_formato_formato` (`formato`),
  KEY `api_muestra_naturaleza_75d97783_fk_api_naturaleza_naturaleza` (`naturaleza`),
  KEY `api_muestra_organo_f2649ab5_fk_api_organo_organo` (`organo`),
  KEY `api_muestra_sede_970081c7_fk_api_sede_sede` (`sede`),
  KEY `api_muestra_username_92f0da14_fk` (`username`),
  CONSTRAINT `api_muestra_calidad_5d2d4715_fk_api_calidad_codigo` FOREIGN KEY (`calidad`) REFERENCES `api_calidad` (`codigo`),
  CONSTRAINT `api_muestra_formato_631a6d92_fk_api_formato_formato` FOREIGN KEY (`formato`) REFERENCES `api_formato` (`formato`),
  CONSTRAINT `api_muestra_naturaleza_75d97783_fk_api_naturaleza_naturaleza` FOREIGN KEY (`naturaleza`) REFERENCES `api_naturaleza` (`naturaleza`),
  CONSTRAINT `api_muestra_organo_f2649ab5_fk_api_organo_organo` FOREIGN KEY (`organo`) REFERENCES `api_organo` (`organo`),
  CONSTRAINT `api_muestra_sede_970081c7_fk_api_sede_sede` FOREIGN KEY (`sede`) REFERENCES `api_sede` (`sede`),
  CONSTRAINT `api_muestra_username_92f0da14_fk` FOREIGN KEY (`username`) REFERENCES `api_usuario` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_muestra`
--

LOCK TABLES `api_muestra` WRITE;
/*!40000 ALTER TABLE `api_muestra` DISABLE KEYS */;
INSERT INTO `api_muestra` VALUES
(10,'12231','9999-09-09','\"2.5\"','{}','{}','BC.4','Fresco','Semen','Cerebro','Córdoba','oreo','Toma válida para examen aunque limitada por escasez de células.','Existe una marcada fibrosis periportal, sugiriendo un proceso crónico de inflamación hepática.');
/*!40000 ALTER TABLE `api_muestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_naturaleza`
--

DROP TABLE IF EXISTS `api_naturaleza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_naturaleza` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) NOT NULL,
  `naturaleza` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `naturaleza` (`naturaleza`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_naturaleza`
--

LOCK TABLES `api_naturaleza` WRITE;
/*!40000 ALTER TABLE `api_naturaleza` DISABLE KEYS */;
INSERT INTO `api_naturaleza` VALUES
(1,'B','Biopsia'),
(2,'BV','Biopsias veterinarias'),
(3,'CB','Cavidad bucal'),
(4,'CV','Citología vaginal'),
(5,'EX','Extensión sanguínea'),
(6,'O','Orinas'),
(7,'E','Esputos'),
(8,'ES','Semen'),
(9,'ID','Improntas'),
(10,'F','Frotis');
/*!40000 ALTER TABLE `api_naturaleza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_organo`
--

DROP TABLE IF EXISTS `api_organo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_organo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organo` varchar(30) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organo` (`organo`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_organo`
--

LOCK TABLES `api_organo` WRITE;
/*!40000 ALTER TABLE `api_organo` DISABLE KEYS */;
INSERT INTO `api_organo` VALUES
(1,'Corazón','BC'),
(2,'Hígado','BH'),
(3,'Estómago','BES'),
(4,'Riñón','BR'),
(5,'Útero','BU'),
(6,'Intestino','BI'),
(7,'Esófago','BEF'),
(8,'Testículos','BT'),
(9,'Pulmón','BP'),
(10,'Bazo','BB'),
(11,'Feto','BF'),
(12,'Cerebro','BCB'),
(13,'Lengua','BL'),
(14,'Ovario','BO'),
(15,'Trompas de falopio','BTF'),
(16,'Páncreas','BPA'),
(17,'Piel','BPI');
/*!40000 ALTER TABLE `api_organo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rol`
--

DROP TABLE IF EXISTS `api_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rol`
--

LOCK TABLES `api_rol` WRITE;
/*!40000 ALTER TABLE `api_rol` DISABLE KEYS */;
INSERT INTO `api_rol` VALUES
(1,'Administrador/a'),
(3,'Estudiante'),
(2,'Profesor/a');
/*!40000 ALTER TABLE `api_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_sede`
--

DROP TABLE IF EXISTS `api_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_sede` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sede` varchar(11) NOT NULL,
  `codigo` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sede` (`sede`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_sede`
--

LOCK TABLES `api_sede` WRITE;
/*!40000 ALTER TABLE `api_sede` DISABLE KEYS */;
INSERT INTO `api_sede` VALUES
(1,'Albacete','A'),
(2,'Alicante','AL'),
(3,'Alicante II','ALII'),
(4,'Almería','I'),
(5,'Córdoba','C'),
(6,'Leganés','L'),
(7,'Granada','G'),
(8,'Huelva','H'),
(9,'Jerez','J'),
(10,'Madrid','M'),
(11,'Málaga','MG'),
(12,'Murcia','MU'),
(13,'Sevilla','S'),
(14,'Valencia','V'),
(15,'Zaragoza','Z');
/*!40000 ALTER TABLE `api_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tipo`
--

DROP TABLE IF EXISTS `api_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tipo`
--

LOCK TABLES `api_tipo` WRITE;
/*!40000 ALTER TABLE `api_tipo` DISABLE KEYS */;
INSERT INTO `api_tipo` VALUES
(1,'Calidad'),
(2,'Interpretación');
/*!40000 ALTER TABLE `api_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usuario`
--

DROP TABLE IF EXISTS `api_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(15) NOT NULL,
  `sede` varchar(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `api_usuario_rol_5a925189_fk_api_rol_rol` (`rol`),
  KEY `api_usuario_sede_a3a5f968_fk_api_sede_sede` (`sede`),
  CONSTRAINT `api_usuario_rol_5a925189_fk_api_rol_rol` FOREIGN KEY (`rol`) REFERENCES `api_rol` (`rol`),
  CONSTRAINT `api_usuario_sede_a3a5f968_fk_api_sede_sede` FOREIGN KEY (`sede`) REFERENCES `api_sede` (`sede`),
  CONSTRAINT `api_usuario_username_48ebbbd7_fk` FOREIGN KEY (`username`) REFERENCES `auth_user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usuario`
--

LOCK TABLES `api_usuario` WRITE;
/*!40000 ALTER TABLE `api_usuario` DISABLE KEYS */;
INSERT INTO `api_usuario` VALUES
(2,'Administrador/a','Córdoba','admin'),
(3,'Profesor/a','Córdoba','oreo');
/*!40000 ALTER TABLE `api_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add aumento',7,'add_aumento'),
(26,'Can change aumento',7,'change_aumento'),
(27,'Can delete aumento',7,'delete_aumento'),
(28,'Can view aumento',7,'view_aumento'),
(29,'Can add Calidad',8,'add_calidad'),
(30,'Can change Calidad',8,'change_calidad'),
(31,'Can delete Calidad',8,'delete_calidad'),
(32,'Can view Calidad',8,'view_calidad'),
(33,'Can add estado',9,'add_estado'),
(34,'Can change estado',9,'change_estado'),
(35,'Can delete estado',9,'delete_estado'),
(36,'Can view estado',9,'view_estado'),
(37,'Can add formato',10,'add_formato'),
(38,'Can change formato',10,'change_formato'),
(39,'Can delete formato',10,'delete_formato'),
(40,'Can view formato',10,'view_formato'),
(41,'Can add Interpretación',11,'add_interpretacion'),
(42,'Can change Interpretación',11,'change_interpretacion'),
(43,'Can delete Interpretación',11,'delete_interpretacion'),
(44,'Can view Interpretación',11,'view_interpretacion'),
(45,'Can add naturaleza',12,'add_naturaleza'),
(46,'Can change naturaleza',12,'change_naturaleza'),
(47,'Can delete naturaleza',12,'delete_naturaleza'),
(48,'Can view naturaleza',12,'view_naturaleza'),
(49,'Can add Órgano',13,'add_organo'),
(50,'Can change Órgano',13,'change_organo'),
(51,'Can delete Órgano',13,'delete_organo'),
(52,'Can view Órgano',13,'view_organo'),
(53,'Can add Rol',14,'add_rol'),
(54,'Can change Rol',14,'change_rol'),
(55,'Can delete Rol',14,'delete_rol'),
(56,'Can view Rol',14,'view_rol'),
(57,'Can add sede',15,'add_sede'),
(58,'Can change sede',15,'change_sede'),
(59,'Can delete sede',15,'delete_sede'),
(60,'Can view sede',15,'view_sede'),
(61,'Can add tipo',16,'add_tipo'),
(62,'Can change tipo',16,'change_tipo'),
(63,'Can delete tipo',16,'delete_tipo'),
(64,'Can view tipo',16,'view_tipo'),
(65,'Can add Imagen',17,'add_imagen'),
(66,'Can change Imagen',17,'change_imagen'),
(67,'Can delete Imagen',17,'delete_imagen'),
(68,'Can view Imagen',17,'view_imagen'),
(69,'Can add Codificación de Interpretación',18,'add_codificacioninterpretacion'),
(70,'Can change Codificación de Interpretación',18,'change_codificacioninterpretacion'),
(71,'Can delete Codificación de Interpretación',18,'delete_codificacioninterpretacion'),
(72,'Can view Codificación de Interpretación',18,'view_codificacioninterpretacion'),
(73,'Can add usuario',19,'add_usuario'),
(74,'Can change usuario',19,'change_usuario'),
(75,'Can delete usuario',19,'delete_usuario'),
(76,'Can view usuario',19,'view_usuario'),
(77,'Can add muestra',20,'add_muestra'),
(78,'Can change muestra',20,'change_muestra'),
(79,'Can delete muestra',20,'delete_muestra'),
(80,'Can view muestra',20,'view_muestra');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$720000$Yt7IHdsd6ZsAKWUv0vnj5Y$iW33rNh7ILRSpgq1kTG55l8CSAdiOa3YAKqJhs+DAC0=','2024-06-12 10:04:35.495101',1,'admin','','','admin@admin.admin',1,1,'2024-06-12 09:17:48.199642'),
(2,'pbkdf2_sha256$720000$aBsPvpeOZtTFZGGOIeijDT$FsGmTQkd9B2oYyqQGkI0Hq5G8VyUGDMdxpq/9DmQmzc=',NULL,0,'oreo','','','oreo@medac.es',0,1,'2024-06-12 09:24:02.497682');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2024-06-12 10:07:24.425982','6','8118',2,'[]',20,1),
(2,'2024-06-12 11:29:02.060344','6','8118',3,'',20,1),
(3,'2024-06-12 11:29:33.596185','9','8',3,'',20,1),
(4,'2024-06-12 11:29:33.628158','8','1',3,'',20,1),
(5,'2024-06-12 11:29:33.644512','7','7777',3,'',20,1),
(6,'2024-06-12 11:29:33.677116','5','9',3,'',20,1),
(7,'2024-06-12 11:29:33.689539','4','789',3,'',20,1),
(8,'2024-06-12 11:29:33.702559','3','ddd',3,'',20,1),
(9,'2024-06-12 11:29:33.721882','2','adgf',3,'',20,1),
(10,'2024-06-12 11:29:33.741712','1','grhwtehthwe',3,'',20,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(7,'api','aumento'),
(8,'api','calidad'),
(18,'api','codificacioninterpretacion'),
(9,'api','estado'),
(10,'api','formato'),
(17,'api','imagen'),
(11,'api','interpretacion'),
(20,'api','muestra'),
(12,'api','naturaleza'),
(13,'api','organo'),
(14,'api','rol'),
(15,'api','sede'),
(16,'api','tipo'),
(19,'api','usuario'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2024-06-11 16:34:49.380299'),
(2,'auth','0001_initial','2024-06-11 16:34:52.148028'),
(3,'admin','0001_initial','2024-06-11 16:34:52.925591'),
(4,'admin','0002_logentry_remove_auto_add','2024-06-11 16:34:52.981602'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-06-11 16:34:53.032478'),
(6,'api','0001_initial','2024-06-11 16:34:58.283473'),
(7,'contenttypes','0002_remove_content_type_name','2024-06-11 16:34:58.690377'),
(8,'auth','0002_alter_permission_name_max_length','2024-06-11 16:34:58.942447'),
(9,'auth','0003_alter_user_email_max_length','2024-06-11 16:34:59.056937'),
(10,'auth','0004_alter_user_username_opts','2024-06-11 16:34:59.126450'),
(11,'auth','0005_alter_user_last_login_null','2024-06-11 16:34:59.386813'),
(12,'auth','0006_require_contenttypes_0002','2024-06-11 16:34:59.406205'),
(13,'auth','0007_alter_validators_add_error_messages','2024-06-11 16:34:59.481461'),
(14,'auth','0008_alter_user_username_max_length','2024-06-11 16:35:02.414425'),
(15,'auth','0009_alter_user_last_name_max_length','2024-06-11 16:35:02.712917'),
(16,'auth','0010_alter_group_name_max_length','2024-06-11 16:35:02.831406'),
(17,'auth','0011_update_proxy_permissions','2024-06-11 16:35:02.900015'),
(18,'auth','0012_alter_user_first_name_max_length','2024-06-11 16:35:03.168780'),
(19,'sessions','0001_initial','2024-06-11 16:35:03.310007'),
(20,'api','0002_remove_muestra_descripcion_muestra_descripcioncal_and_more','2024-06-12 11:32:51.793256'),
(21,'api','0003_alter_muestra_descripcioncal_and_more','2024-06-12 11:34:36.931326');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('lrxers7bo67vsqpyzbi4w471nk5gp9hl','.eJxVjDsOwjAQBe_iGll24l8o6TmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIstDj9bgnwwXUHdId6axJbXZc5yV2RB-3y2oifl8P9OyjQy7dOadSYRuOyYYdA1gbjGJjZk0bKgViDw0k5yDhYNQW0QQUTBu-tp1G8PxOHOHI:1sHKqJ:bqxlzqWY_yU4rs6JmE9ix9Qs37g28YMd2lg3Z2YJIw4','2024-06-26 10:04:35.525321');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 12:39:45
