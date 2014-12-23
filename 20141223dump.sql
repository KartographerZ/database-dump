-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `kartographe`;
CREATE DATABASE `kartographe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kartographe`;

DROP TABLE IF EXISTS `attributiondroit`;
CREATE TABLE `attributiondroit` (
  `typeDroitId` int(11) NOT NULL,
  `utilisateurId` int(11) NOT NULL,
  `cartographieId` int(11) NOT NULL,
  KEY `typeDroitId` (`typeDroitId`),
  KEY `utilisateurId` (`utilisateurId`),
  KEY `cartographieId` (`cartographieId`),
  CONSTRAINT `attributiondroit_ibfk_1` FOREIGN KEY (`typeDroitId`) REFERENCES `typedroit` (`id`),
  CONSTRAINT `attributiondroit_ibfk_2` FOREIGN KEY (`utilisateurId`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `attributiondroit_ibfk_3` FOREIGN KEY (`cartographieId`) REFERENCES `cartographie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cartographie`;
CREATE TABLE `cartographie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `typeVisibiliteId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeVisibiliteId` (`typeVisibiliteId`),
  CONSTRAINT `cartographie_ibfk_1` FOREIGN KEY (`typeVisibiliteId`) REFERENCES `typevisibilite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `typeElementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeElementId` (`typeElementId`),
  CONSTRAINT `element_ibfk_1` FOREIGN KEY (`typeElementId`) REFERENCES `typeelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `versionCartographieId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `versionCartographieId` (`versionCartographieId`),
  KEY `elementId` (`elementId`),
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`versionCartographieId`) REFERENCES `versioncartographie` (`id`),
  CONSTRAINT `position_ibfk_2` FOREIGN KEY (`elementId`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `typedroit`;
CREATE TABLE `typedroit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `typeelement`;
CREATE TABLE `typeelement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `typeutilisateur`;
CREATE TABLE `typeutilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `typevisibilite`;
CREATE TABLE `typevisibilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `EntrepriseId` int(10) NOT NULL,
  `TypeUtilisateurId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EntrepriseId` (`EntrepriseId`),
  KEY `TypeUtilisateurId` (`TypeUtilisateurId`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`EntrepriseId`) REFERENCES `Entreprise` (`id`),
  CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`EntrepriseId`) REFERENCES `Entreprise` (`id`),
  CONSTRAINT `utilisateur_ibfk_3` FOREIGN KEY (`TypeUtilisateurId`) REFERENCES `TypeUtilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `versioncartographie`;
CREATE TABLE `versioncartographie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `cartographieId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartographieId` (`cartographieId`),
  CONSTRAINT `versioncartographie_ibfk_1` FOREIGN KEY (`cartographieId`) REFERENCES `cartographie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2014-12-23 01:51:32