-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';

DROP DATABASE IF EXISTS `kartographerz`;
CREATE DATABASE `kartographerz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kartographerz`;

DROP TABLE IF EXISTS `cartography`;
CREATE TABLE `cartography` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `type_visibility_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeVisibiliteId` (`type_visibility_id`),
  CONSTRAINT `cartography_ibfk_1` FOREIGN KEY (`type_visibility_id`) REFERENCES `type_visibility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_element_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_element_id` (`type_element_id`),
  CONSTRAINT `element_ibfk_1` FOREIGN KEY (`type_element_id`) REFERENCES `type_element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_1_id` int(11) NOT NULL,
  `element_2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element_1_id` (`element_1_id`),
  KEY `element_2_id` (`element_2_id`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`element_1_id`) REFERENCES `element` (`id`),
  CONSTRAINT `link_ibfk_2` FOREIGN KEY (`element_2_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_right_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cartography_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_right_id` (`type_right_id`),
  KEY `cartography_id` (`cartography_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `right_ibfk_4` FOREIGN KEY (`type_right_id`) REFERENCES `type_right` (`id`),
  CONSTRAINT `right_ibfk_5` FOREIGN KEY (`cartography_id`) REFERENCES `cartography` (`id`),
  CONSTRAINT `right_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_element`;
CREATE TABLE `type_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_right`;
CREATE TABLE `type_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_user`;
CREATE TABLE `type_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_visibility`;
CREATE TABLE `type_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `type_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_id` (`enterprise_id`),
  KEY `type_user_id` (`type_user_id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`),
  CONSTRAINT `user_ibfk_5` FOREIGN KEY (`type_user_id`) REFERENCES `type_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `cartography_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartography_id` (`cartography_id`),
  CONSTRAINT `version_ibfk_1` FOREIGN KEY (`cartography_id`) REFERENCES `cartography` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `version_element`;
CREATE TABLE `version_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version_id` (`version_id`),
  KEY `element_id` (`element_id`),
  CONSTRAINT `version_element_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`),
  CONSTRAINT `version_element_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2014-12-27 14:03:19
