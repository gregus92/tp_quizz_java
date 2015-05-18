-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 18 Mai 2015 à 14:22
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `quiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `id_option` int(11) NOT NULL,
  `libelle_option` varchar(45) DEFAULT NULL,
  `ok` tinyint(1) DEFAULT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_option`),
  KEY `fk_option_question1_idx` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id_question` int(11) NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  `id_questionnaire` int(11) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `fk_question_questionnaire1_idx` (`id_questionnaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `id_questionnaire` int(11) NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_questionnaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `id_option` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  PRIMARY KEY (`id_option`,`id_test`),
  KEY `fk_option_has_test_test1_idx` (`id_test`),
  KEY `fk_option_has_test_option1_idx` (`id_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id_test` int(11) NOT NULL,
  `date_test` date DEFAULT NULL,
  `id_questionnaire` int(11) NOT NULL,
  PRIMARY KEY (`id_test`),
  KEY `fk_test_questionnaire1_idx` (`id_questionnaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
