-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 28, 2021 alle 09:20
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica`
--

CREATE TABLE `anagrafica` (
  `ID` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `cellulare` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `codiceFiscale` varchar(50) NOT NULL,
  `dataDiNascita` date NOT NULL,
  `luogoDiNascita` varchar(50) NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `comune` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `CAP` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `anagrafica`
--

INSERT INTO `anagrafica` (`ID`, `nome`, `cognome`, `telefono`, `cellulare`, `email`, `codiceFiscale`, `dataDiNascita`, `luogoDiNascita`, `indirizzo`, `comune`, `provincia`, `CAP`) VALUES
(16, 'Edoardo', 'Ceroni', '0542217884', '366723919', 'ceroniedoardo@gmail.com', 'CRNDRD94O74D783B', '2002-02-24', 'Imola', 'Viale Machiavelli 9', 'Imola', 'Bologna', '53434'),
(17, 'Mirko', 'Santini', '37347378', '28238382', 'mirkosantini@gmail.com', 'SNTMRK', '2006-03-10', 'Borgo San Lorenzo', 'Via Machiavelli 15', 'Borgo San Lorenzo', 'Firenze', '50033'),
(19, 'Ajeje', 'Brazorf', '123456789', 'Non ce l\'ho', 'ajejebrazorf@gmail.com', 'JJBRZF', '2034-12-30', 'Magicville', 'Via Simoncelli 12', 'Magicville', 'Magicville', '32233'),
(25, 'Alex', 'Santini', '3667009507', '3667009507', 'alexsantin.as@gmail.com', 'SNTLXA05R02D612T', '2002-10-05', 'Firenze', 'Via Machiavelli 15', 'Firenzuola', 'Firenze', '50033');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `anagrafica`
--
ALTER TABLE `anagrafica`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `anagrafica`
--
ALTER TABLE `anagrafica`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
