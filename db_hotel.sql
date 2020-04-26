-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Apr 2020 um 15:35
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_hotel`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_NR` int(11) NOT NULL,
  `room_NR` int(11) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL,
  `customer_NR` int(11) DEFAULT NULL,
  `package_list_ID` int(11) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_package_list`
--

CREATE TABLE `booking_package_list` (
  `package_list_ID` int(11) NOT NULL,
  `package_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `caretaker_subject_areas`
--

CREATE TABLE `caretaker_subject_areas` (
  `SVNR` int(11) NOT NULL,
  `subject_area_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorie`
--

CREATE TABLE `categorie` (
  `categorie_ID` int(11) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_NR` int(11) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `SVNR` int(11) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hotel_room`
--

CREATE TABLE `hotel_room` (
  `room_NR` int(11) NOT NULL,
  `PERSONS` int(11) DEFAULT NULL,
  `categorie_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room_attendant_plan`
--

CREATE TABLE `room_attendant_plan` (
  `DATE` date NOT NULL,
  `TIME` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `room_NR` int(11) NOT NULL,
  `SVNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `service_package`
--

CREATE TABLE `service_package` (
  `package_ID` int(11) NOT NULL,
  `DESIGN` varchar(32) DEFAULT NULL,
  `PRICE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `service_package_caretaker_list`
--

CREATE TABLE `service_package_caretaker_list` (
  `package_ID` int(11) NOT NULL,
  `SVNR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_ID` int(11) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_NR`),
  ADD KEY `room_NR` (`room_NR`,`customer_NR`,`package_list_ID`),
  ADD KEY `customer_NR` (`customer_NR`),
  ADD KEY `package_list_ID` (`package_list_ID`);

--
-- Indizes für die Tabelle `booking_package_list`
--
ALTER TABLE `booking_package_list`
  ADD PRIMARY KEY (`package_list_ID`),
  ADD KEY `package_ID` (`package_ID`);

--
-- Indizes für die Tabelle `caretaker_subject_areas`
--
ALTER TABLE `caretaker_subject_areas`
  ADD PRIMARY KEY (`SVNR`,`subject_area_ID`),
  ADD KEY `SVNR` (`SVNR`,`subject_area_ID`),
  ADD KEY `subject_area_ID` (`subject_area_ID`);

--
-- Indizes für die Tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_NR`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SVNR`);

--
-- Indizes für die Tabelle `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD PRIMARY KEY (`room_NR`),
  ADD KEY `categorie_ID` (`categorie_ID`);

--
-- Indizes für die Tabelle `room_attendant_plan`
--
ALTER TABLE `room_attendant_plan`
  ADD PRIMARY KEY (`DATE`,`TIME`,`room_NR`),
  ADD UNIQUE KEY `SVNR` (`SVNR`),
  ADD UNIQUE KEY `SVNR_2` (`SVNR`),
  ADD KEY `DATE` (`DATE`,`TIME`,`room_NR`),
  ADD KEY `SVNR_3` (`SVNR`),
  ADD KEY `room_NR` (`room_NR`);

--
-- Indizes für die Tabelle `service_package`
--
ALTER TABLE `service_package`
  ADD PRIMARY KEY (`package_ID`);

--
-- Indizes für die Tabelle `service_package_caretaker_list`
--
ALTER TABLE `service_package_caretaker_list`
  ADD PRIMARY KEY (`package_ID`,`SVNR`),
  ADD KEY `package_ID` (`package_ID`,`SVNR`),
  ADD KEY `SVNR` (`SVNR`);

--
-- Indizes für die Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_NR`) REFERENCES `customer` (`customer_NR`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_NR`) REFERENCES `hotel_room` (`room_NR`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`package_list_ID`) REFERENCES `booking_package_list` (`package_list_ID`);

--
-- Constraints der Tabelle `booking_package_list`
--
ALTER TABLE `booking_package_list`
  ADD CONSTRAINT `booking_package_list_ibfk_1` FOREIGN KEY (`package_ID`) REFERENCES `service_package` (`package_ID`);

--
-- Constraints der Tabelle `caretaker_subject_areas`
--
ALTER TABLE `caretaker_subject_areas`
  ADD CONSTRAINT `caretaker_subject_areas_ibfk_1` FOREIGN KEY (`subject_area_ID`) REFERENCES `subject_area` (`subject_area_ID`),
  ADD CONSTRAINT `caretaker_subject_areas_ibfk_2` FOREIGN KEY (`SVNR`) REFERENCES `employee` (`SVNR`);

--
-- Constraints der Tabelle `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD CONSTRAINT `hotel_room_ibfk_1` FOREIGN KEY (`categorie_ID`) REFERENCES `categorie` (`categorie_ID`);

--
-- Constraints der Tabelle `room_attendant_plan`
--
ALTER TABLE `room_attendant_plan`
  ADD CONSTRAINT `room_attendant_plan_ibfk_1` FOREIGN KEY (`SVNR`) REFERENCES `employee` (`SVNR`),
  ADD CONSTRAINT `room_attendant_plan_ibfk_2` FOREIGN KEY (`room_NR`) REFERENCES `hotel_room` (`room_NR`);

--
-- Constraints der Tabelle `service_package_caretaker_list`
--
ALTER TABLE `service_package_caretaker_list`
  ADD CONSTRAINT `service_package_caretaker_list_ibfk_1` FOREIGN KEY (`package_ID`) REFERENCES `service_package` (`package_ID`),
  ADD CONSTRAINT `service_package_caretaker_list_ibfk_2` FOREIGN KEY (`SVNR`) REFERENCES `employee` (`SVNR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
