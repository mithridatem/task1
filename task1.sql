-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 12 jan. 2022 à 22:42
-- Version du serveur : 5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `task1`
--

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

CREATE TABLE `cat` (
  `id_cat` int(11) NOT NULL,
  `name_cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat`
--

INSERT INTO `cat` (`id_cat`, `name_cat`) VALUES
(1, 'perso'),
(2, 'pro'),
(3, 'mathieu'),
(4, 'course'),
(5, 'adrar12'),
(6, 'test'),
(7, 'test'),
(8, 'test'),
(9, 'test'),
(10, 'test'),
(11, 'test'),
(12, 'test'),
(13, 'toto'),
(14, 'adrar'),
(15, 'adrar'),
(16, 'toto'),
(17, 'adrar'),
(18, 'test'),
(19, 'mathieu'),
(20, 'cyberDev');

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE `task` (
  `id_task` int(11) NOT NULL,
  `name_task` varchar(50) DEFAULT NULL,
  `content_task` text,
  `date_task` date DEFAULT NULL,
  `validate_task` tinyint(1) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id_task`, `name_task`, `content_task`, `date_task`, `validate_task`, `id_user`, `id_cat`) VALUES
(1, 'test', 'test', '2022-01-10', 0, 5, 1),
(3, 'test', 'test', '2022-01-10', 0, 5, 1),
(4, 'faire les courses', 'test', '2022-01-13', 0, 5, 2),
(5, 'test125', 'test', '2022-01-21', 0, 5, 2),
(6, 'acheter des légumes', 'tomate, patates, carottes', '2022-01-30', 0, 5, 4),
(7, 'projet task manager', 'ajouter des fonctions', '2022-01-31', 0, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `first_name_user` varchar(50) NOT NULL,
  `login_user` varchar(50) NOT NULL,
  `mdp_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `first_name_user`, `login_user`, `mdp_user`) VALUES
(5, 'test', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6'),
(6, 'test1', 'test1', 'test1', '5a105e8b9d40e1329780d62ea2265d8a'),
(7, 'mithridate', 'mathieu', 'mmathieu', '81dc9bdb52d04dc20036dbd8313ed055'),
(8, 'mathieu31100', 'mithridate31100', 'mmathieu31100', '098f6bcd4621d373cade4e832627b4f6');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `task_user_FK` (`id_user`),
  ADD KEY `task_cat0_FK` (`id_cat`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cat`
--
ALTER TABLE `cat`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `task`
--
ALTER TABLE `task`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_cat0_FK` FOREIGN KEY (`id_cat`) REFERENCES `cat` (`id_cat`),
  ADD CONSTRAINT `task_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
