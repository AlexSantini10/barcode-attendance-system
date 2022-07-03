-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 03, 2022 alle 12:12
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `witchers`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica`
--

CREATE TABLE `anagrafica` (
  `ID` int(11) NOT NULL,
  `codice` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `abitazione` varchar(50) NOT NULL,
  `insegnante` tinyint(1) NOT NULL DEFAULT 0,
  `entrato` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `anagrafica`
--

INSERT INTO `anagrafica` (`ID`, `codice`, `nome`, `cognome`, `email`, `abitazione`, `insegnante`, `entrato`) VALUES
(1, '1234', 'Alex', 'Santini', 'alexsantini.as@gmail.com', 'Firenzuola', 0, 0),
(2, '2345', 'Ebiware', 'Edu', 'bo', 'Imola', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `deskentratauscita`
--

CREATE TABLE `deskentratauscita` (
  `ID` int(11) NOT NULL,
  `desk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `deskentratauscita`
--

INSERT INTO `deskentratauscita` (`ID`, `desk`) VALUES
(0, 'uscita'),
(1, 'entrata');

-- --------------------------------------------------------

--
-- Struttura della tabella `log`
--

CREATE TABLE `log` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `entrataUscita` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `log`
--

INSERT INTO `log` (`ID`, `userID`, `entrataUscita`, `time`) VALUES
(1, 1, 1, '2021-01-30 09:00:10'),
(2, 1, 0, '2021-01-30 09:00:50'),
(3, 1, 1, '2021-01-30 09:01:03'),
(4, 1, 0, '2021-01-30 09:01:12'),
(5, 2, 1, '2021-01-30 09:01:48'),
(6, 2, 0, '2021-01-30 09:01:57'),
(7, 1, 1, '2022-07-03 09:43:28'),
(8, 1, 0, '2022-07-03 09:44:03'),
(9, 1, 1, '2022-07-03 10:11:54'),
(10, 1, 0, '2022-07-03 10:12:06');

-- --------------------------------------------------------

--
-- Struttura della tabella `toupdate`
--

CREATE TABLE `toupdate` (
  `ID` int(11) NOT NULL,
  `isToUpdate` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `toupdate`
--

INSERT INTO `toupdate` (`ID`, `isToUpdate`) VALUES
(1, 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `anagrafica`
--
ALTER TABLE `anagrafica`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `deskentratauscita`
--
ALTER TABLE `deskentratauscita`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `toupdate`
--
ALTER TABLE `toupdate`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `anagrafica`
--
ALTER TABLE `anagrafica`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `log`
--
ALTER TABLE `log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `toupdate`
--
ALTER TABLE `toupdate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
