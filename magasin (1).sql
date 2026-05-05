-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 05 mai 2026 à 09:56
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `IDarticle` varchar(5) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `prix` decimal(8,2) NOT NULL,
  `categorie` enum('tous','vidéo','photo','informatique','divers') NOT NULL DEFAULT 'tous'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`IDarticle`, `designation`, `prix`, `categorie`) VALUES
('CA300', 'Canon EOS 3000V zoom 28/80', 329.00, 'photo'),
('CAS07', 'Cassette DV60 par 5', 26.90, 'divers'),
('CP100', 'Caméscope Panasonic SV-AV100', 1490.00, 'vidéo'),
('CS330', 'Caméscope Sony DCR-PC330', 1629.00, 'vidéo'),
('DEL30', 'Portable Dell X300', 1715.00, 'informatique'),
('DVD75', 'DVD vierge par 3', 17.50, 'divers'),
('HP497', 'PC bureau HP497 écran TFT', 1500.00, 'informatique'),
('NIK55', 'Nikon F55+zoom 28/80', 269.00, 'photo'),
('NIK80', 'Nikon F80', 479.00, 'photo'),
('SAX15', 'Portable Samsung X15 XVM', 1999.00, 'informatique'),
('SOXMP', 'PC portable Sony Z1-XMP', 2399.00, 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `IDclient` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Age` int(11) UNSIGNED NOT NULL,
  `Mail` varchar(225) DEFAULT NULL,
  `Adresse` varchar(225) NOT NULL,
  `Ville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`IDclient`, `Nom`, `Prenom`, `Age`, `Mail`, `Adresse`, `Ville`) VALUES
(1, 'Marti', 'Jean', 36, 'mart@marti.com', '5 av. Einstein', 'Orléans'),
(2, 'Rapp', 'Paul', 44, 'rapp@libert.com', '32 av. Foch', 'Paris'),
(3, 'Devos', 'Marie', 18, 'grav@waladoo.fr', '75 bd Hochimin', 'Lille'),
(4, 'Hochon', 'Paul', 22, 'hoch@fiscali.fr', '33 rue Tsétsé', 'Chartres'),
(5, 'Grave', 'Nuyen', 18, 'grav@waladoo.fr', '75 bd Hochimin', 'Lille'),
(6, 'Hachette', 'Jeanne', 45, 'NULL', '60 rue d’Amiens', 'Versailles'),
(7, 'Marti', 'Pierre', 25, 'martin7@fiscali.fr', '4 av. Henri', 'Paris'),
(8, 'Mac Neal', 'John', 52, 'mac@freez.fr', '89 rue Diana', 'Lyon'),
(9, 'Basile', 'Did', 37, 'bas@walabi.com', '26 rue Gallas', 'Nantes'),
(10, 'Darc', 'Jeanne', 19, 'NULL', '9 av. d’Orléans', 'Paris'),
(11, 'Gaté', 'Bill', 45, 'bill@microhard.be', '9 bd des Bugs', 'Lyon');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `IDcommande` int(11) NOT NULL,
  `Date` date NOT NULL,
  `IDclient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`IDcommande`, `Date`, `IDclient`) VALUES
(1, '2012-06-11', 5),
(2, '2012-06-25', 9),
(3, '2012-07-12', 1),
(4, '2012-07-14', 3),
(5, '2012-07-31', 9),
(6, '2012-08-08', 10),
(7, '2012-08-25', 2),
(8, '2012-09-04', 7),
(9, '2012-10-15', 11),
(10, '2012-11-23', 4),
(11, '2013-01-21', 8),
(12, '2013-02-01', 5),
(13, '2013-03-03', 9);

-- --------------------------------------------------------

--
-- Structure de la table `ligne`
--

CREATE TABLE `ligne` (
  `IDarticle` varchar(5) NOT NULL,
  `IDcommande` int(11) NOT NULL,
  `Qte_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne`
--

INSERT INTO `ligne` (`IDarticle`, `IDcommande`, `Qte_commande`) VALUES
('CS330', 1, 1),
('CAS07', 1, 3),
('HP497', 2, 2),
('NIK80', 3, 5),
('SOXMP', 4, 3),
('DVD75', 4, 2),
('CA300', 5, 1),
('CAS07', 6, 3),
('CP100', 6, 1),
('SAX15', 7, 5),
('SOXMP', 8, 1),
('CP100', 8, 1),
('NIK55', 9, 1),
('DEL30', 10, 2),
('SAX15', 10, 1),
('DVD75', 11, 10),
('CS330', 12, 3),
('CAS07', 12, 4),
('SAX15', 13, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `IDuser` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prénom` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`IDuser`, `nom`, `prénom`, `age`, `mail`, `ville`, `contact`, `login`, `password`) VALUES
(1, 'Joseph ', 'Blanc', NULL, 'joseph@blanc.com', 'marseille', '+33 1 98 45 93 25', 'Useradmin', 'abcd'),
(2, 'HOUNKPE', 'Bradley', 19, 'princebradley.hounkpe@gmail.com', 'Abomey-Calavi', '0140423050', 'princebradley.hounkpe@gmail.co', '1234');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`IDarticle`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IDclient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`IDcommande`),
  ADD KEY `IDclient` (`IDclient`);

--
-- Index pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD KEY `IDcommande` (`IDcommande`),
  ADD KEY `IDarticle` (`IDarticle`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDuser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `IDclient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `IDcommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `IDuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`IDclient`) REFERENCES `client` (`IDclient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD CONSTRAINT `ligne_ibfk_2` FOREIGN KEY (`IDcommande`) REFERENCES `commande` (`IDcommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ligne_ibfk_3` FOREIGN KEY (`IDarticle`) REFERENCES `article` (`IDarticle`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
