-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: abogados
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `Abogado`
--

DROP TABLE IF EXISTS `Abogado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Abogado` (
  `idAbogado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidopaterno` varchar(40) DEFAULT NULL,
  `apellidomaterno` varchar(40) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `cp` varchar(30) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAbogado`),
  KEY `restAbo` (`idCliente`),
  CONSTRAINT `restAbo` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abogado`
--

LOCK TABLES `Abogado` WRITE;
/*!40000 ALTER TABLE `Abogado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Abogado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AbogadoCasos`
--

DROP TABLE IF EXISTS `AbogadoCasos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbogadoCasos` (
  `idAbogado` int(11) DEFAULT NULL,
  `NoCaso` int(11) DEFAULT NULL,
  KEY `restCasos` (`NoCaso`),
  KEY `restCaso` (`idAbogado`),
  CONSTRAINT `restCaso` FOREIGN KEY (`idAbogado`) REFERENCES `Abogado` (`idAbogado`),
  CONSTRAINT `restCasos` FOREIGN KEY (`NoCaso`) REFERENCES `casos` (`NoCaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbogadoCasos`
--

LOCK TABLES `AbogadoCasos` WRITE;
/*!40000 ALTER TABLE `AbogadoCasos` DISABLE KEYS */;
/*!40000 ALTER TABLE `AbogadoCasos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `idAgenda` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` varchar(30) DEFAULT NULL,
  `nota` varchar(500) DEFAULT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `asunto` varchar(500) DEFAULT NULL,
  `idAbogado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAgenda`),
  KEY `restAgenda` (`idAbogado`),
  CONSTRAINT `restAgenda` FOREIGN KEY (`idAbogado`) REFERENCES `Abogado` (`idAbogado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casos`
--

DROP TABLE IF EXISTS `casos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casos` (
  `NoCaso` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(500) DEFAULT NULL,
  `avances` varchar(500) DEFAULT NULL,
  `nota` varchar(500) DEFAULT NULL,
  `estatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NoCaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casos`
--

LOCK TABLES `casos` WRITE;
/*!40000 ALTER TABLE `casos` DISABLE KEYS */;
/*!40000 ALTER TABLE `casos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidopaterno` varchar(30) DEFAULT NULL,
  `apellidomaterno` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `CP` varchar(20) DEFAULT NULL,
  `idAgenda` int(11) DEFAULT NULL,
  `Folio` int(11) DEFAULT NULL,
  `NoCaso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `restClientes` (`Folio`),
  KEY `restCliente` (`idAgenda`),
  KEY `restClient` (`NoCaso`),
  CONSTRAINT `restClient` FOREIGN KEY (`NoCaso`) REFERENCES `casos` (`NoCaso`),
  CONSTRAINT `restCliente` FOREIGN KEY (`idAgenda`) REFERENCES `agenda` (`idAgenda`),
  CONSTRAINT `restClientes` FOREIGN KEY (`Folio`) REFERENCES `pago` (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `tipopago` varchar(30) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `honorarios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `reporteact` date DEFAULT NULL,
  `reportant` date DEFAULT NULL,
  `reportepagos` varchar(1000) DEFAULT NULL,
  `NoCaso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReporte`),
  KEY `restRepor` (`NoCaso`),
  CONSTRAINT `restRepor` FOREIGN KEY (`NoCaso`) REFERENCES `casos` (`NoCaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'auxiliar','1234567'),(2,'secretaria','234560'),(3,'abogado','569780');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-24 11:26:23
