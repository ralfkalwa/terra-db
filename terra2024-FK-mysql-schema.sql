-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Apr 2024 um 12:58
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `terra`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aufgaben`
--

CREATE TABLE `aufgaben` (
  `id` int(11) NOT NULL,
  `aufgabe` text NOT NULL,
  `loesung` text NOT NULL,
  `schwierigkeit` int(11) DEFAULT NULL,
  `hinweis` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `berg`
--

CREATE TABLE `berg` (
  `B_NAME` varchar(20) NOT NULL DEFAULT '',
  `GEBIRGE` varchar(25) DEFAULT NULL,
  `HOEHE` double(16,4) DEFAULT NULL,
  `JAHR` int(11) DEFAULT NULL,
  `LAENGE` double(16,4) DEFAULT NULL,
  `BREITE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ebene`
--

CREATE TABLE `ebene` (
  `E_NAME` varchar(25) NOT NULL DEFAULT '',
  `HOEHE` double(16,4) DEFAULT NULL,
  `FLAECHE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fluss`
--

CREATE TABLE `fluss` (
  `F_NAME` varchar(20) NOT NULL DEFAULT '',
  `FLUSS` varchar(20) DEFAULT NULL,
  `SEE` varchar(25) DEFAULT NULL,
  `MEER` varchar(25) DEFAULT NULL,
  `LAENGE` int(11) DEFAULT NULL,
  `LAENGEU` double(16,4) DEFAULT NULL,
  `BREITEU` double(16,4) DEFAULT NULL,
  `LAENGEM` double(16,4) DEFAULT NULL,
  `BREITEM` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geht_ueber_in`
--

CREATE TABLE `geht_ueber_in` (
  `MEER1` varchar(25) NOT NULL,
  `MEER2` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_berg`
--

CREATE TABLE `geo_berg` (
  `id` int(11) NOT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `LT_ID` varchar(4) DEFAULT NULL,
  `B_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_ebene`
--

CREATE TABLE `geo_ebene` (
  `LT_ID` varchar(4) NOT NULL,
  `L_ID` varchar(4) NOT NULL,
  `E_NAME` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_fluss`
--

CREATE TABLE `geo_fluss` (
  `id` int(11) NOT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `LT_ID` varchar(50) DEFAULT NULL,
  `F_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_insel`
--

CREATE TABLE `geo_insel` (
  `LT_ID` varchar(4) NOT NULL,
  `L_ID` varchar(4) NOT NULL,
  `I_NAME` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_meer`
--

CREATE TABLE `geo_meer` (
  `id` int(11) NOT NULL,
  `LT_ID` varchar(4) DEFAULT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `M_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_see`
--

CREATE TABLE `geo_see` (
  `id` int(11) NOT NULL,
  `LT_ID` varchar(4) DEFAULT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `S_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geo_wueste`
--

CREATE TABLE `geo_wueste` (
  `LT_ID` varchar(4) NOT NULL,
  `L_ID` varchar(4) NOT NULL,
  `W_NAME` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hat_sitz_in`
--

CREATE TABLE `hat_sitz_in` (
  `ST_NAME` varchar(25) DEFAULT NULL,
  `LT_ID` varchar(4) DEFAULT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `ABKUERZUNG` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insel`
--

CREATE TABLE `insel` (
  `I_NAME` varchar(25) NOT NULL DEFAULT '',
  `INSELGRUPPE` varchar(25) DEFAULT NULL,
  `FLAECHE` double(16,4) DEFAULT NULL,
  `LAENGE` double(16,4) DEFAULT NULL,
  `BREITE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ist_benachbart_zu`
--

CREATE TABLE `ist_benachbart_zu` (
  `id` int(11) NOT NULL,
  `LAND1` varchar(4) DEFAULT NULL,
  `LAND2` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ist_mitglied_von`
--

CREATE TABLE `ist_mitglied_von` (
  `L_ID` varchar(4) NOT NULL,
  `ABKUERZUNG` varchar(20) NOT NULL,
  `ART` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontinent`
--

CREATE TABLE `kontinent` (
  `K_NAME` varchar(10) NOT NULL DEFAULT '',
  `FLAECHE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `land`
--

CREATE TABLE `land` (
  `L_ID` varchar(4) NOT NULL DEFAULT '',
  `L_NAME` varchar(50) DEFAULT NULL,
  `EINWOHNER` double(16,4) DEFAULT NULL,
  `FLAECHE` double(16,4) DEFAULT NULL,
  `HAUPTSTADT` varchar(25) DEFAULT NULL,
  `LT_ID` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `landteil`
--

CREATE TABLE `landteil` (
  `id` int(11) NOT NULL,
  `LT_ID` varchar(4) NOT NULL,
  `L_ID` varchar(4) NOT NULL,
  `LT_NAME` varchar(50) NOT NULL DEFAULT '',
  `EINWOHNER` double(16,4) DEFAULT NULL,
  `LAGE` char(2) DEFAULT NULL,
  `HAUPTSTADT` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `liegt_an`
--

CREATE TABLE `liegt_an` (
  `id` int(11) NOT NULL,
  `ST_NAME` varchar(25) DEFAULT NULL,
  `LT_ID` varchar(4) DEFAULT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `F_NAME` varchar(20) DEFAULT NULL,
  `S_NAME` varchar(25) DEFAULT NULL,
  `M_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `meer`
--

CREATE TABLE `meer` (
  `M_NAME` varchar(25) NOT NULL DEFAULT '',
  `TIEFE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `organisation`
--

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL,
  `O_NAME` varchar(70) DEFAULT NULL,
  `ABKUERZUNG` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `see`
--

CREATE TABLE `see` (
  `S_NAME` varchar(25) NOT NULL,
  `TIEFE` double(16,4) DEFAULT NULL,
  `FLAECHE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stadt`
--

CREATE TABLE `stadt` (
  `ST_NAME` varchar(25) NOT NULL DEFAULT '',
  `L_ID` varchar(4) NOT NULL,
  `LT_ID` varchar(4) NOT NULL,
  `EINWOHNER` int(11) DEFAULT NULL,
  `BREITE` double(16,4) DEFAULT NULL,
  `LAENGE` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `umfasst`
--

CREATE TABLE `umfasst` (
  `id` int(11) NOT NULL,
  `L_ID` varchar(4) DEFAULT NULL,
  `K_NAME` varchar(10) DEFAULT NULL,
  `PROZENT` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wueste`
--

CREATE TABLE `wueste` (
  `id` int(11) NOT NULL,
  `W_NAME` varchar(25) NOT NULL,
  `FLAECHE` double(16,4) DEFAULT NULL,
  `WUESTENART` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aufgaben`
--
ALTER TABLE `aufgaben`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `berg`
--
ALTER TABLE `berg`
  ADD PRIMARY KEY (`B_NAME`),
  ADD UNIQUE KEY `ix_b_name` (`B_NAME`);

--
-- Indizes für die Tabelle `ebene`
--
ALTER TABLE `ebene`
  ADD PRIMARY KEY (`E_NAME`),
  ADD UNIQUE KEY `ix_e_name` (`E_NAME`);

--
-- Indizes für die Tabelle `fluss`
--
ALTER TABLE `fluss`
  ADD PRIMARY KEY (`F_NAME`),
  ADD UNIQUE KEY `ix_f_name` (`F_NAME`),
  ADD KEY `fluss_ibfk_1` (`SEE`),
  ADD KEY `fluss_ibfk_2` (`MEER`);

--
-- Indizes für die Tabelle `geht_ueber_in`
--
ALTER TABLE `geht_ueber_in`
  ADD PRIMARY KEY (`MEER1`,`MEER2`),
  ADD KEY `geht_ueber_in_ibfk_2` (`MEER2`);

--
-- Indizes für die Tabelle `geo_berg`
--
ALTER TABLE `geo_berg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `geo_berg_ibfk_1` (`L_ID`,`LT_ID`),
  ADD KEY `geo_berg_ibfk_2` (`B_NAME`);

--
-- Indizes für die Tabelle `geo_ebene`
--
ALTER TABLE `geo_ebene`
  ADD PRIMARY KEY (`LT_ID`,`L_ID`,`E_NAME`),
  ADD KEY `geo_ebene_ibfk_1` (`L_ID`,`LT_ID`),
  ADD KEY `geo_ebene_ibfk_2` (`E_NAME`);

--
-- Indizes für die Tabelle `geo_fluss`
--
ALTER TABLE `geo_fluss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `geo_fluss_ibfk_1` (`F_NAME`),
  ADD KEY `geo_fluss_ibfk_2` (`L_ID`,`LT_ID`);

--
-- Indizes für die Tabelle `geo_insel`
--
ALTER TABLE `geo_insel`
  ADD PRIMARY KEY (`LT_ID`,`L_ID`,`I_NAME`),
  ADD KEY `geo_insel_ibfk_1` (`I_NAME`),
  ADD KEY `geo_insel_ibfk_2` (`L_ID`,`LT_ID`);

--
-- Indizes für die Tabelle `geo_meer`
--
ALTER TABLE `geo_meer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `geo_meer_ibfk_1` (`L_ID`,`LT_ID`),
  ADD KEY `geo_meer_ibfk_2` (`M_NAME`);

--
-- Indizes für die Tabelle `geo_see`
--
ALTER TABLE `geo_see`
  ADD PRIMARY KEY (`id`),
  ADD KEY `geo_see_ibfk_1` (`S_NAME`),
  ADD KEY `geo_see_ibfk_2` (`L_ID`,`LT_ID`);

--
-- Indizes für die Tabelle `geo_wueste`
--
ALTER TABLE `geo_wueste`
  ADD PRIMARY KEY (`LT_ID`,`L_ID`,`W_NAME`),
  ADD KEY `geo_wueste_ibfk_1` (`L_ID`,`LT_ID`),
  ADD KEY `geo_wueste_ibfk_2` (`W_NAME`);

--
-- Indizes für die Tabelle `hat_sitz_in`
--
ALTER TABLE `hat_sitz_in`
  ADD PRIMARY KEY (`ABKUERZUNG`),
  ADD KEY `hat_sitz_in_ibfk_1` (`L_ID`,`LT_ID`,`ST_NAME`);

--
-- Indizes für die Tabelle `insel`
--
ALTER TABLE `insel`
  ADD PRIMARY KEY (`I_NAME`),
  ADD UNIQUE KEY `ix_i_name` (`I_NAME`);

--
-- Indizes für die Tabelle `ist_benachbart_zu`
--
ALTER TABLE `ist_benachbart_zu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ist_benachbart_zu_ibfk_1` (`LAND2`),
  ADD KEY `ist_benachbart_zu_ibfk_2` (`LAND1`);

--
-- Indizes für die Tabelle `ist_mitglied_von`
--
ALTER TABLE `ist_mitglied_von`
  ADD PRIMARY KEY (`ABKUERZUNG`,`L_ID`),
  ADD KEY `ist_mitglied_von_ibfk_1` (`L_ID`);

--
-- Indizes für die Tabelle `kontinent`
--
ALTER TABLE `kontinent`
  ADD PRIMARY KEY (`K_NAME`),
  ADD UNIQUE KEY `ix_k_name` (`K_NAME`);

--
-- Indizes für die Tabelle `land`
--
ALTER TABLE `land`
  ADD PRIMARY KEY (`L_ID`),
  ADD UNIQUE KEY `ix_l_id2` (`L_ID`),
  ADD UNIQUE KEY `ix_l_id3` (`L_ID`),
  ADD KEY `land_ibfk_1` (`L_ID`,`LT_ID`,`HAUPTSTADT`);

--
-- Indizes für die Tabelle `landteil`
--
ALTER TABLE `landteil`
  ADD PRIMARY KEY (`L_ID`,`LT_ID`,`id`);

--
-- Indizes für die Tabelle `liegt_an`
--
ALTER TABLE `liegt_an`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liegt_an_ibfk_1` (`S_NAME`),
  ADD KEY `liegt_an_ibfk_2` (`L_ID`,`LT_ID`),
  ADD KEY `liegt_an_ibfk_4` (`M_NAME`),
  ADD KEY `liegt_an_ibfk_5` (`F_NAME`);

--
-- Indizes für die Tabelle `meer`
--
ALTER TABLE `meer`
  ADD PRIMARY KEY (`M_NAME`),
  ADD UNIQUE KEY `ix_m_name` (`M_NAME`);

--
-- Indizes für die Tabelle `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`ABKUERZUNG`,`id`);

--
-- Indizes für die Tabelle `see`
--
ALTER TABLE `see`
  ADD PRIMARY KEY (`S_NAME`);

--
-- Indizes für die Tabelle `stadt`
--
ALTER TABLE `stadt`
  ADD PRIMARY KEY (`L_ID`,`LT_ID`,`ST_NAME`),
  ADD UNIQUE KEY `ix_st_name` (`ST_NAME`);

--
-- Indizes für die Tabelle `umfasst`
--
ALTER TABLE `umfasst`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umfasst_ibfk_1` (`K_NAME`),
  ADD KEY `umfasst_ibfk_2` (`L_ID`);

--
-- Indizes für die Tabelle `wueste`
--
ALTER TABLE `wueste`
  ADD PRIMARY KEY (`W_NAME`,`id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `fluss`
--
ALTER TABLE `fluss`
  ADD CONSTRAINT `fluss_ibfk_1` FOREIGN KEY (`SEE`) REFERENCES `see` (`S_NAME`),
  ADD CONSTRAINT `fluss_ibfk_2` FOREIGN KEY (`MEER`) REFERENCES `meer` (`M_NAME`);

--
-- Constraints der Tabelle `geht_ueber_in`
--
ALTER TABLE `geht_ueber_in`
  ADD CONSTRAINT `geht_ueber_in_ibfk_1` FOREIGN KEY (`MEER1`) REFERENCES `meer` (`M_NAME`),
  ADD CONSTRAINT `geht_ueber_in_ibfk_2` FOREIGN KEY (`MEER2`) REFERENCES `meer` (`M_NAME`);

--
-- Constraints der Tabelle `geo_berg`
--
ALTER TABLE `geo_berg`
  ADD CONSTRAINT `geo_berg_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`),
  ADD CONSTRAINT `geo_berg_ibfk_2` FOREIGN KEY (`B_NAME`) REFERENCES `berg` (`B_NAME`);

--
-- Constraints der Tabelle `geo_ebene`
--
ALTER TABLE `geo_ebene`
  ADD CONSTRAINT `geo_ebene_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`),
  ADD CONSTRAINT `geo_ebene_ibfk_2` FOREIGN KEY (`E_NAME`) REFERENCES `ebene` (`E_NAME`);

--
-- Constraints der Tabelle `geo_fluss`
--
ALTER TABLE `geo_fluss`
  ADD CONSTRAINT `geo_fluss_ibfk_1` FOREIGN KEY (`F_NAME`) REFERENCES `fluss` (`F_NAME`),
  ADD CONSTRAINT `geo_fluss_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`);

--
-- Constraints der Tabelle `geo_insel`
--
ALTER TABLE `geo_insel`
  ADD CONSTRAINT `geo_insel_ibfk_1` FOREIGN KEY (`I_NAME`) REFERENCES `insel` (`I_NAME`),
  ADD CONSTRAINT `geo_insel_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`);

--
-- Constraints der Tabelle `geo_meer`
--
ALTER TABLE `geo_meer`
  ADD CONSTRAINT `geo_meer_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`),
  ADD CONSTRAINT `geo_meer_ibfk_2` FOREIGN KEY (`M_NAME`) REFERENCES `meer` (`M_NAME`);

--
-- Constraints der Tabelle `geo_see`
--
ALTER TABLE `geo_see`
  ADD CONSTRAINT `geo_see_ibfk_1` FOREIGN KEY (`S_NAME`) REFERENCES `see` (`S_NAME`),
  ADD CONSTRAINT `geo_see_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`);

--
-- Constraints der Tabelle `geo_wueste`
--
ALTER TABLE `geo_wueste`
  ADD CONSTRAINT `geo_wueste_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`),
  ADD CONSTRAINT `geo_wueste_ibfk_2` FOREIGN KEY (`W_NAME`) REFERENCES `wueste` (`W_NAME`);

--
-- Constraints der Tabelle `hat_sitz_in`
--
ALTER TABLE `hat_sitz_in`
  ADD CONSTRAINT `hat_sitz_in_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`,`ST_NAME`) REFERENCES `stadt` (`L_ID`, `LT_ID`, `ST_NAME`),
  ADD CONSTRAINT `hat_sitz_in_ibfk_2` FOREIGN KEY (`ABKUERZUNG`) REFERENCES `organisation` (`ABKUERZUNG`);

--
-- Constraints der Tabelle `ist_benachbart_zu`
--
ALTER TABLE `ist_benachbart_zu`
  ADD CONSTRAINT `ist_benachbart_zu_ibfk_1` FOREIGN KEY (`LAND2`) REFERENCES `land` (`L_ID`),
  ADD CONSTRAINT `ist_benachbart_zu_ibfk_2` FOREIGN KEY (`LAND1`) REFERENCES `land` (`L_ID`);

--
-- Constraints der Tabelle `ist_mitglied_von`
--
ALTER TABLE `ist_mitglied_von`
  ADD CONSTRAINT `ist_mitglied_von_ibfk_1` FOREIGN KEY (`L_ID`) REFERENCES `land` (`L_ID`),
  ADD CONSTRAINT `ist_mitglied_von_ibfk_2` FOREIGN KEY (`ABKUERZUNG`) REFERENCES `organisation` (`ABKUERZUNG`);

--
-- Constraints der Tabelle `land`
--
ALTER TABLE `land`
  ADD CONSTRAINT `land_ibfk_1` FOREIGN KEY (`L_ID`,`LT_ID`,`HAUPTSTADT`) REFERENCES `stadt` (`L_ID`, `LT_ID`, `ST_NAME`),
  ADD CONSTRAINT `land_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`);

--
-- Constraints der Tabelle `landteil`
--
ALTER TABLE `landteil`
  ADD CONSTRAINT `landteil_ibfk_1` FOREIGN KEY (`L_ID`) REFERENCES `land` (`L_ID`);

--
-- Constraints der Tabelle `liegt_an`
--
ALTER TABLE `liegt_an`
  ADD CONSTRAINT `liegt_an_ibfk_1` FOREIGN KEY (`S_NAME`) REFERENCES `see` (`S_NAME`),
  ADD CONSTRAINT `liegt_an_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`),
  ADD CONSTRAINT `liegt_an_ibfk_3` FOREIGN KEY (`L_ID`) REFERENCES `land` (`L_ID`),
  ADD CONSTRAINT `liegt_an_ibfk_4` FOREIGN KEY (`M_NAME`) REFERENCES `meer` (`M_NAME`),
  ADD CONSTRAINT `liegt_an_ibfk_5` FOREIGN KEY (`F_NAME`) REFERENCES `fluss` (`F_NAME`);

--
-- Constraints der Tabelle `stadt`
--
ALTER TABLE `stadt`
  ADD CONSTRAINT `stadt_ibfk_1` FOREIGN KEY (`L_ID`) REFERENCES `land` (`L_ID`),
  ADD CONSTRAINT `stadt_ibfk_2` FOREIGN KEY (`L_ID`,`LT_ID`) REFERENCES `landteil` (`L_ID`, `LT_ID`);

--
-- Constraints der Tabelle `umfasst`
--
ALTER TABLE `umfasst`
  ADD CONSTRAINT `umfasst_ibfk_1` FOREIGN KEY (`K_NAME`) REFERENCES `kontinent` (`K_NAME`),
  ADD CONSTRAINT `umfasst_ibfk_2` FOREIGN KEY (`L_ID`) REFERENCES `land` (`L_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
