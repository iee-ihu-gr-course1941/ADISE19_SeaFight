-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 14 Ιαν 2020 στις 14:58:55
-- Έκδοση διακομιστή: 10.4.10-MariaDB
-- Έκδοση PHP: 7.3.12
CREATE DATABASE /*!32312 IF NOT EXISTS*/`battleship` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `battleship`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `battleship`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
	update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `place_piece` (IN `x1` TINYINT, IN `y1` TINYINT)  BEGIN
	declare  p, p_color char;
	
	select  ships, piece_player into p, p_color FROM `board` WHERE 			X=x1 AND Y=y1;
	
	update board
	set  ships=p, piece_player=p_color
	where x=x1 and y=y1;
    
	update game_status set p_turn=if(p_color='W','B','W');
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_move` ()  BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `piece_player` enum('P1','P2') DEFAULT NULL,
  `ships` enum('aircraftcarrier','Battleship','Cruiser','submarine','PatrolBoat') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x`, `y`, `piece_player`, `ships`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL),
(1, 6, NULL, NULL),
(1, 7, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 10, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(2, 10, NULL, NULL),
(3, 1, NULL, NULL),
(3, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(3, 5, NULL, NULL),
(3, 6, NULL, NULL),
(3, 7, NULL, NULL),
(3, 8, NULL, NULL),
(3, 9, NULL, NULL),
(3, 10, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 8, NULL, NULL),
(4, 9, NULL, NULL),
(4, 10, NULL, NULL),
(5, 1, NULL, NULL),
(5, 2, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(5, 5, NULL, NULL),
(5, 6, NULL, NULL),
(5, 7, NULL, NULL),
(5, 8, NULL, NULL),
(5, 9, NULL, NULL),
(5, 10, NULL, NULL),
(6, 1, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL),
(6, 5, NULL, NULL),
(6, 6, NULL, NULL),
(6, 7, NULL, NULL),
(6, 8, NULL, NULL),
(6, 9, NULL, NULL),
(6, 10, NULL, NULL),
(7, 1, NULL, NULL),
(7, 2, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(7, 5, NULL, NULL),
(7, 6, NULL, NULL),
(7, 7, NULL, NULL),
(7, 8, NULL, NULL),
(7, 9, NULL, NULL),
(7, 10, NULL, NULL),
(8, 1, NULL, NULL),
(8, 2, NULL, NULL),
(8, 3, NULL, NULL),
(8, 4, NULL, NULL),
(8, 5, NULL, NULL),
(8, 6, NULL, NULL),
(8, 7, NULL, NULL),
(8, 8, NULL, NULL),
(8, 9, NULL, NULL),
(8, 10, NULL, NULL),
(9, 1, NULL, NULL),
(9, 2, NULL, NULL),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(9, 5, NULL, NULL),
(9, 6, NULL, NULL),
(9, 7, NULL, NULL),
(9, 8, NULL, NULL),
(9, 9, NULL, NULL),
(9, 10, NULL, NULL),
(10, 1, NULL, NULL),
(10, 2, NULL, NULL),
(10, 3, NULL, NULL),
(10, 4, NULL, NULL),
(10, 5, NULL, NULL),
(10, 6, NULL, NULL),
(10, 7, NULL, NULL),
(10, 8, NULL, NULL),
(10, 9, NULL, NULL),
(10, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `piece_player` enum('P1','P2') DEFAULT NULL,
  `ships` enum('aircraftcarrier','Battleship','Cruiser','submarine','PatrolBoat') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `piece_player`, `ships`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(3, 1, NULL, NULL),
(4, 1, NULL, NULL),
(5, 1, NULL, NULL),
(6, 1, NULL, NULL),
(7, 1, NULL, NULL),
(8, 1, NULL, NULL),
(9, 1, NULL, NULL),
(10, 1, NULL, NULL),
(1, 2, NULL, NULL),
(2, 2, NULL, NULL),
(3, 2, NULL, NULL),
(4, 2, NULL, NULL),
(5, 2, NULL, NULL),
(6, 2, NULL, NULL),
(7, 2, NULL, NULL),
(8, 2, NULL, NULL),
(9, 2, NULL, NULL),
(10, 2, NULL, NULL),
(1, 3, NULL, NULL),
(2, 3, NULL, NULL),
(3, 3, NULL, NULL),
(4, 3, NULL, NULL),
(5, 3, NULL, NULL),
(6, 3, NULL, NULL),
(7, 3, NULL, NULL),
(8, 3, NULL, NULL),
(9, 3, NULL, NULL),
(10, 3, NULL, NULL),
(1, 4, NULL, NULL),
(2, 4, NULL, NULL),
(3, 4, NULL, NULL),
(4, 4, NULL, NULL),
(5, 4, NULL, NULL),
(6, 4, NULL, NULL),
(7, 4, NULL, NULL),
(8, 4, NULL, NULL),
(9, 4, NULL, NULL),
(10, 4, NULL, NULL),
(1, 5, NULL, NULL),
(2, 5, NULL, NULL),
(3, 5, NULL, NULL),
(4, 5, NULL, NULL),
(5, 5, NULL, NULL),
(6, 5, NULL, NULL),
(7, 5, NULL, NULL),
(8, 5, NULL, NULL),
(9, 5, NULL, NULL),
(10, 5, NULL, NULL),
(1, 6, NULL, NULL),
(2, 6, NULL, NULL),
(3, 6, NULL, NULL),
(4, 6, NULL, NULL),
(5, 6, NULL, NULL),
(6, 6, NULL, NULL),
(7, 6, NULL, NULL),
(8, 6, NULL, NULL),
(9, 6, NULL, NULL),
(10, 6, NULL, NULL),
(1, 7, NULL, NULL),
(2, 7, NULL, NULL),
(3, 7, NULL, NULL),
(4, 7, NULL, NULL),
(5, 7, NULL, NULL),
(6, 7, NULL, NULL),
(7, 7, NULL, NULL),
(8, 7, NULL, NULL),
(9, 7, NULL, NULL),
(10, 7, NULL, NULL),
(1, 8, NULL, NULL),
(2, 8, NULL, NULL),
(3, 8, NULL, NULL),
(4, 8, NULL, NULL),
(5, 8, NULL, NULL),
(6, 8, NULL, NULL),
(7, 8, NULL, NULL),
(8, 8, NULL, NULL),
(9, 8, NULL, NULL),
(10, 8, NULL, NULL),
(1, 9, NULL, NULL),
(2, 9, NULL, NULL),
(3, 9, NULL, NULL),
(4, 9, NULL, NULL),
(5, 9, NULL, NULL),
(6, 9, NULL, NULL),
(7, 9, NULL, NULL),
(8, 9, NULL, NULL),
(9, 9, NULL, NULL),
(10, 9, NULL, NULL),
(1, 10, NULL, NULL),
(2, 10, NULL, NULL),
(3, 10, NULL, NULL),
(4, 10, NULL, NULL),
(5, 10, NULL, NULL),
(6, 10, NULL, NULL),
(7, 10, NULL, NULL),
(8, 10, NULL, NULL),
(9, 10, NULL, NULL),
(10, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','placed','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('P1','P2') DEFAULT NULL,
  `result` enum('P1','P2','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
('not active', NULL, NULL, '2020-01-14 13:34:41');

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `player` enum('P1','P2') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `player`, `token`, `last_action`) VALUES
(NULL, 'P1', NULL, '2020-01-14 13:34:41'),
(NULL, 'P2', NULL, '2020-01-14 13:34:41');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Ευρετήρια για πίνακα `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`y`,`x`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
