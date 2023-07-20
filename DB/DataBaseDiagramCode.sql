CREATE TABLE `users` (
  `id_user` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL
);

CREATE TABLE `kids` (
  `id_kid` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `id_user` int,
  `birthday` varchar(255) NOT NULL,
  `genre` varchar(255),
  `gestionalAge` int,
  `birthLength` float,
  `birthWeight` float,
  `birthheadcircumference` float
);

CREATE TABLE `visits` (
  `id_visit` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `dateVisit` varchar(255) NOT NULL,
  `length` float,
  `weight` float,
  `headCir` float,
  `id_kid` int
);

CREATE TABLE `History` (
  `id_history` int PRIMARY KEY,
  `id_kid` int
);

ALTER TABLE `kids` COMMENT = 'No more than five years old';

ALTER TABLE `kids` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

ALTER TABLE `visits` ADD FOREIGN KEY (`id_kid`) REFERENCES `kids` (`id_kid`);

ALTER TABLE `visits` ADD FOREIGN KEY (`id_kid`) REFERENCES `History` (`id_kid`);
