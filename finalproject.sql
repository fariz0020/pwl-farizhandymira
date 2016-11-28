-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2016 at 07:59 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `idagent` int(11) NOT NULL,
  `namaagent` varchar(255) NOT NULL,
  `kontakagent` varchar(255) DEFAULT NULL,
  `emailagent` varchar(255) DEFAULT NULL,
  `kotaagent` varchar(255) DEFAULT NULL,
  `fotoagent` varchar(255) DEFAULT NULL,
  `detailagent` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`idagent`, `namaagent`, `kontakagent`, `emailagent`, `kotaagent`, `fotoagent`, `detailagent`) VALUES
(1, 'Agus', '0274-4353808', 'agus@mail.com', 'Yogyakarta', NULL, NULL),
(2, 'Anjas', '081391411388', 'anjas@anjas.com', 'Solo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `idamenities` int(11) NOT NULL,
  `idlisting` int(11) NOT NULL,
  `sho` char(1) NOT NULL DEFAULT 'f',
  `wif` char(1) NOT NULL DEFAULT 'f',
  `tiv` char(1) NOT NULL DEFAULT 'f',
  `spo` char(1) NOT NULL DEFAULT 'f',
  `kit` char(1) NOT NULL DEFAULT 'f',
  `wht` char(1) NOT NULL DEFAULT 'f',
  `acc` char(1) NOT NULL DEFAULT 'f',
  `sec` char(1) NOT NULL DEFAULT 'f'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`idamenities`, `idlisting`, `sho`, `wif`, `tiv`, `spo`, `kit`, `wht`, `acc`, `sec`) VALUES
(1, 1, 't', 't', 'f', 'f', 'f', 'f', 'f', 't'),
(2, 2, 'f', 't', 't', 'f', 'f', 'f', 't', 't');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `idbuilding` int(11) NOT NULL,
  `namabuilding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`idbuilding`, `namabuilding`) VALUES
(1, 'House'),
(2, 'Apartment');

-- --------------------------------------------------------

--
-- Table structure for table `foto_lisitng`
--

CREATE TABLE `foto_lisitng` (
  `idfoto` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `namafoto` varchar(255) NOT NULL,
  `idlisting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foto_lisitng`
--

INSERT INTO `foto_lisitng` (`idfoto`, `path`, `namafoto`, `idlisting`) VALUES
(1, 'house-1.jpg', 'Small House', 1),
(2, 'design-1.jpg', 'Design of Small House', 1);

-- --------------------------------------------------------

--
-- Table structure for table `listing`
--

CREATE TABLE `listing` (
  `idlisting` int(11) NOT NULL,
  `judullisting` varchar(255) NOT NULL,
  `hargalisting` int(11) NOT NULL DEFAULT '0',
  `larea` int(11) NOT NULL DEFAULT '0',
  `barea` int(11) NOT NULL DEFAULT '0',
  `bedroom` int(11) NOT NULL DEFAULT '0',
  `restroom` int(11) NOT NULL DEFAULT '0',
  `elec` int(11) NOT NULL DEFAULT '0',
  `detaillisting` text NOT NULL,
  `idbuilding` int(11) NOT NULL,
  `idagent` int(11) NOT NULL,
  `datepublish` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listing`
--

INSERT INTO `listing` (`idlisting`, `judullisting`, `hargalisting`, `larea`, `barea`, `bedroom`, `restroom`, `elec`, `detaillisting`, `idbuilding`, `idagent`, `datepublish`) VALUES
(1, 'Small House In Pakem', 499000000, 100, 80, 2, 2, 800, 'A beautiful small house in Pakem, Sleman, DIY.\r\nVery suitable for young couple.', 1, 1, '2016-11-26 19:09:40'),
(2, 'Suite Student Apartment', 800000000, 40, 40, 2, 1, 800, 'Suite student apartment in Condong Catur.\r\nDont miss it.', 2, 2, '2016-11-26 19:11:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`idagent`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`idamenities`),
  ADD KEY `fk-amenities-listing` (`idlisting`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`idbuilding`);

--
-- Indexes for table `foto_lisitng`
--
ALTER TABLE `foto_lisitng`
  ADD PRIMARY KEY (`idfoto`),
  ADD KEY `fk-fotolisting-listing` (`idlisting`);

--
-- Indexes for table `listing`
--
ALTER TABLE `listing`
  ADD PRIMARY KEY (`idlisting`),
  ADD KEY `fk-listing-building` (`idbuilding`),
  ADD KEY `fk-listing-agent` (`idagent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `idagent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `idamenities` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `idbuilding` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `foto_lisitng`
--
ALTER TABLE `foto_lisitng`
  MODIFY `idfoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `listing`
--
ALTER TABLE `listing`
  MODIFY `idlisting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenities`
--
ALTER TABLE `amenities`
  ADD CONSTRAINT `amenities_ibfk_1` FOREIGN KEY (`idlisting`) REFERENCES `listing` (`idlisting`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `foto_lisitng`
--
ALTER TABLE `foto_lisitng`
  ADD CONSTRAINT `foto_lisitng_ibfk_1` FOREIGN KEY (`idlisting`) REFERENCES `listing` (`idlisting`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `listing`
--
ALTER TABLE `listing`
  ADD CONSTRAINT `listing_ibfk_1` FOREIGN KEY (`idagent`) REFERENCES `agent` (`idagent`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `listing_ibfk_2` FOREIGN KEY (`idbuilding`) REFERENCES `building` (`idbuilding`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
