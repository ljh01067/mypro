DROP DATABASE IF EXISTS `maze`;
CREATE DATABASE `maze`;
USE `maze`;

CREATE TABLE player(
      `name` CHAR(20) NOT NULL,
      hp INT(10) NOT NULL,
      attack INT(10) NOT NULL,
      defence INT(10) NOT NULL,
      speed INT(10) NOT NULL
);
CREATE TABLE enemy(
      hp INT(10) NOT NULL,
      attack INT(10) NOT NULL,
      defence INT(10) NOT NULL,
      speed INT(10) NOT NULL
);
INSERT INTO player
SET `name` = '주인공',
hp = 39,
attack = 52,
defence = 43,
speed = 40;

INSERT INTO enemy
SET hp = 35,
attack = 55,
defence = 40,
speed = 35;

SELECT * FROM player;
SELECT * FROM enemy;