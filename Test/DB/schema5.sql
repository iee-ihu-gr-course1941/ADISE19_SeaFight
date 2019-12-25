/*
SQLyog Ultimate v9.63 
MySQL - 5.5.5-10.4.8-MariaDB : Database - adise19_chess5
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`battleship` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `battleship`;

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `piece_player` enum('P1','P2') DEFAULT NULL,
  `ships` enum('aircraftcarrier','Battleship','Cruiser','submarine','PatrolBoat') DEFAULT NULL,/*(5*1),(4*1),(3*1),(2*2) */
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `board` */
insert  into `board`(`x`,`y`,`piece_player`,`ships`) values 
(1,1,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,NULL,NULL),(5,1,NULL,NULL),(6,1,NULL,NULL),(7,1,NULL,NULL),(8,1,NULL,NULL),(9,1,NULL,NULL),(10,1,NULL,NULL),(1,2,NULL,NULL),(2,2,NULL,NULL),(3,2,NULL,NULL),(4,2,NULL,NULL),(5,2,NULL,NULL),(6,2,NULL,NULL),(7,2,NULL,NULL),(8,2,NULL,NULL),(9,2,NULL,NULL),(10,2,NULL,NULL),(1,3,NULL,NULL),(2,3,NULL,NULL),(3,3,NULL,NULL),(4,3,NULL,NULL),(5,3,NULL,NULL),(6,3,NULL,NULL),(7,3,NULL,NULL),(8,3,NULL,NULL),(9,3,NULL,NULL),(10,3,NULL,NULL),(1,4,NULL,NULL),(2,4,NULL,NULL),(3,4,NULL,NULL),(4,4,NULL,NULL),(5,4,NULL,NULL),(6,4,NULL,NULL),(7,4,NULL,NULL),(8,4,NULL,NULL),(9,4,NULL,NULL),(10,4,NULL,NULL)(1,5,NULL,NULL),(2,5,NULL,NULL),(3,5,NULL,NULL),(4,5,NULL,NULL),(5,5,NULL,NULL),(6,5,NULL,NULL),(7,5,NULL,NULL),(8,5,NULL,NULL),(9,5,NULL,NULL),(10,5,NULL,NULL)(1,6,NULL,NULL),(2,6,NULL,NULL),(3,6,NULL,NULL),(4,6,NULL,NULL),(5,6,NULL,NULL),(6,6,NULL,NULL),(7,6,NULL,NULL),(8,6,NULL,NULL),(9,6,NULL,NULL),(10,6,NULL,NULL)(1,7,NULL,NULL),(2,7,NULL,NULL),(3,7,NULL,NULL),(4,7,NULL,NULL),(5,7,NULL,NULL),(6,7,NULL,NULL),(7,7,NULL,NULL),(8,7,NULL,NULL),(9,7,NULL,NULL),(10,7,NULL,NULL)(1,8,NULL,NULL),(2,8,NULL,NULL),(3,8,NULL,NULL),(4,8,NULL,NULL),(5,8,NULL,NULL),(6,8,NULL,NULL),(7,8,NULL,NULL),(8,8,NULL,NULL)(9,8,NULL,NULL),(10,8,NULL,NULL),(1,9,NULL,NULL),(2,9,NULL,NULL),(3,9,NULL,NULL),(4,9,NULL,NULL),(5,9,NULL,NULL),(6,9,NULL,NULL),(7,9,NULL,NULL),(8,9,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(1,10,NULL,NULL),(2,10,NULL,NULL),(3,10,NULL,NULL),(4,10,NULL,NULL),(5,10,NULL,NULL),(6,10,NULL,NULL),(7,10,NULL,NULL),(8,10,NULL,NULL),(9,10,NULL,NULL),(10,10,NULL,NULL);
,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,NULL,NULL),(5,1,NULL,NULL),(6,1,NULL,NULL),(7,1,NULL,NULL),(8,1,NULL,NULL),(9,1,NULL,NULL),(10,1,NULL,NULL),(1,2,NULL,NULL),(2,2,NULL,NULL),(3,2,NULL,NULL),(4,2,NULL,NULL),(5,2,NULL,NULL),(6,2,NULL,NULL),(7,2,NULL,NULL),(8,2,NULL,NULL),(9,2,NULL,NULL),(10,2,NULL,NULL),(1,3,NULL,NULL),(2,3,NULL,NULL),(3,3,NULL,NULL),(4,3,NULL,NULL),(5,3,NULL,NULL),(6,3,NULL,NULL),(7,3,NULL,NULL),(8,3,NULL,NULL),(9,3,NULL,NULL),(10,3,NULL,NULL),(1,4,NULL,NULL),(2,4,NULL,NULL),(3,4,NULL,NULL),(4,4,NULL,NULL),(5,4,NULL,NULL),(6,4,NULL,NULL),(7,4,NULL,NULL),(8,4,NULL,NULL),(9,4,NULL,NULL),(10,4,NULL,NULL)(1,5,NULL,NULL),(2,5,NULL,NULL),(3,5,NULL,NULL),(4,5,NULL,NULL),(5,5,NULL,NULL),(6,5,NULL,NULL),(7,5,NULL,NULL),(8,5,NULL,NULL),(9,5,NULL,NULL),(10,5,NULL,NULL)(1,6,NULL,NULL),(2,6,NULL,NULL),(3,6,NULL,NULL),(4,6,NULL,NULL),(5,6,NULL,NULL),(6,6,NULL,NULL),(7,6,NULL,NULL),(8,6,NULL,NULL),(9,6,NULL,NULL),(10,6,NULL,NULL)(1,7,NULL,NULL),(2,7,NULL,NULL),(3,7,NULL,NULL),(4,7,NULL,NULL),(5,7,NULL,NULL),(6,7,NULL,NULL),(7,7,NULL,NULL),(8,7,NULL,NULL),(9,7,NULL,NULL),(10,7,NULL,NULL)(1,8,NULL,NULL),(2,8,NULL,NULL),(3,8,NULL,NULL),(4,8,NULL,NULL),(5,8,NULL,NULL),(6,8,NULL,NULL),(7,8,NULL,NULL),(8,8,NULL,NULL)(9,8,NULL,NULL),(10,8,NULL,NULL),(1,9,NULL,NULL),(2,9,NULL,NULL),(3,9,NULL,NULL),(4,9,NULL,NULL),(5,9,NULL,NULL),(6,9,NULL,NULL),(7,9,NULL,NULL),(8,9,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(1,10,NULL,NULL),(2,10,NULL,NULL),(3,10,NULL,NULL),(4,10,NULL,NULL),(5,10,NULL,NULL),(6,10,NULL,NULL),(7,10,NULL,NULL),(8,10,NULL,NULL),(9,10,NULL,NULL),(10,10,NULL,NULL);

/*Table structure for table `board_empty` */

DROP TABLE IF EXISTS `board_empty`;

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `piece_player` enum('P1','P2') DEFAULT NULL,
  `ships` enum('aircraftcarrier','Battleship','Cruiser','submarine','PatrolBoat')
  PRIMARY KEY (`y`,`x`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `board_empty` */

insert  into `board_empty`(`x`,`y`,`piece_player`,`ships`) values 
(1,1,NULL,NULL),(2,1,NULL,NULL),(3,1,NULL,NULL),(4,1,NULL,NULL),(5,1,NULL,NULL),(6,1,NULL,NULL),(7,1,NULL,NULL),(8,1,NULL,NULL),(9,1,NULL,NULL),(10,1,NULL,NULL),(1,2,NULL,NULL),(2,2,NULL,NULL),(3,2,NULL,NULL),(4,2,NULL,NULL),(5,2,NULL,NULL),(6,2,NULL,NULL),(7,2,NULL,NULL),(8,2,NULL,NULL),(9,2,NULL,NULL),(10,2,NULL,NULL),(1,3,NULL,NULL),(2,3,NULL,NULL),(3,3,NULL,NULL),(4,3,NULL,NULL),(5,3,NULL,NULL),(6,3,NULL,NULL),(7,3,NULL,NULL),(8,3,NULL,NULL),(9,3,NULL,NULL),(10,3,NULL,NULL),(1,4,NULL,NULL),(2,4,NULL,NULL),(3,4,NULL,NULL),(4,4,NULL,NULL),(5,4,NULL,NULL),(6,4,NULL,NULL),(7,4,NULL,NULL),(8,4,NULL,NULL),(9,4,NULL,NULL),(10,4,NULL,NULL)(1,5,NULL,NULL),(2,5,NULL,NULL),(3,5,NULL,NULL),(4,5,NULL,NULL),(5,5,NULL,NULL),(6,5,NULL,NULL),(7,5,NULL,NULL),(8,5,NULL,NULL),(9,5,NULL,NULL),(10,5,NULL,NULL)(1,6,NULL,NULL),(2,6,NULL,NULL),(3,6,NULL,NULL),(4,6,NULL,NULL),(5,6,NULL,NULL),(6,6,NULL,NULL),(7,6,NULL,NULL),(8,6,NULL,NULL),(9,6,NULL,NULL),(10,6,NULL,NULL)(1,7,NULL,NULL),(2,7,NULL,NULL),(3,7,NULL,NULL),(4,7,NULL,NULL),(5,7,NULL,NULL),(6,7,NULL,NULL),(7,7,NULL,NULL),(8,7,NULL,NULL),(9,7,NULL,NULL),(10,7,NULL,NULL)(1,8,NULL,NULL),(2,8,NULL,NULL),(3,8,NULL,NULL),(4,8,NULL,NULL),(5,8,NULL,NULL),(6,8,NULL,NULL),(7,8,NULL,NULL),(8,8,NULL,NULL)(9,8,NULL,NULL),(10,8,NULL,NULL),(1,9,NULL,NULL),(2,9,NULL,NULL),(3,9,NULL,NULL),(4,9,NULL,NULL),(5,9,NULL,NULL),(6,9,NULL,NULL),(7,9,NULL,NULL),(8,9,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(1,10,NULL,NULL),(2,10,NULL,NULL),(3,10,NULL,NULL),(4,10,NULL,NULL),(5,10,NULL,NULL),(6,10,NULL,NULL),(7,10,NULL,NULL),(8,10,NULL,NULL),(9,10,NULL,NULL),(10,10,NULL,NULL);







/*Table structure for table `game_status` */

DROP TABLE IF EXISTS `game_status`;

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','placed','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('P1','P2') DEFAULT NULL,
  `result` enum('P1','P2','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `game_status` */

insert  into `game_status`(`status`,`p_turn`,`result`,`last_change`) values ('aborded',NULL,'W','2019-12-12 13:30:23');

/*Table structure for table `players` */

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `player` enum('P1','P2') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `players` */

insert  into `players`(`username`,`player`,`token`,`last_action`) values ('vv','P1','15d4c9daf64ac1f65a5801c0c107bf74','2019-12-12 13:24:47'),('aaa','P2','89703ced141f2f7c3b0b04c050c96fb6','2019-12-12 13:24:49');

/* Trigger structure for table `game_status` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `game_status_update` */$$

/*!50003 CREATE */ /*!50017  */ /*!50003 TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END */$$


DELIMITER ;

/* Procedure structure for procedure `clean_board` */

/*!50003 DROP PROCEDURE IF EXISTS  `clean_board` */;

DELIMITER $$

/*!50003 CREATE  PROCEDURE `clean_board`()
BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
	update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END */$$
DELIMITER ;



/* Procedure structure for procedure `move_piece` */

/*!50003 DROP PROCEDURE IF EXISTS  `move_piece` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `move_piece`(x1 tinyint,y1 tinyint,x2 tinyint,y2 tinyint)
BEGIN
	declare  p, p_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
	
	update board
	set piece=p, piece_color=p_color
	where x=x2 and y=y2;
	
	UPDATE board
	SET piece=null,piece_color=null
	WHERE X=x1 AND Y=y1;
	
	update game_status set p_turn=if(p_color='W','B','W');
    END */$$
DELIMITER ;




/* Procedure structure for procedure `test_move` */

/*!50003 DROP PROCEDURE IF EXISTS  `test_move` */;

DELIMITER $$

/*!50003 CREATE  PROCEDURE `test_move`()
BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
