-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 31 2016 г., 15:55
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mysite`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL,
  `street` varchar(40) NOT NULL,
  `house` varchar(10) NOT NULL,
  `room` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `street`, `house`, `room`, `city_id`) VALUES
(1, 'Jaama', '4', 12, 1),
(2, 'Soo', '2', 5, 1),
(3, 'Kutse', '13', 245, 1),
(4, 'OK', '123', 123, 1),
(5, 'Maleva', '31', 21, 1),
(6, 'Maleva', '31', 21, 2),
(7, 'Rea', '99', 22, 1),
(8, 'Aasa', '33', 61, 1),
(9, 'Katse', '31', 65, 1),
(10, 'Katse', '84', 3, 1),
(11, 'Katse', '16', 55, 1),
(12, 'Kalevi', '22', 16, 1),
(13, 'Rea', '92', 92, 1),
(14, 'Kalevi', '100', 34, 1),
(15, 'Aasa', '9', 97, 1),
(16, 'Parna', '69', 51, 1),
(17, 'Katse', '50', 41, 1),
(18, 'Katse', '58', 65, 1),
(19, 'Kalevi', '14', 94, 1),
(20, 'Vase', '59', 5, 1),
(21, 'Kalevi', '1', 28, 1),
(22, 'Rohu', '90', 23, 1),
(23, 'Parna', '48', 23, 1),
(24, 'Katse', '22', 23, 1),
(25, 'Katse', '66', 46, 1),
(26, 'Muru', '84', 86, 1),
(27, 'Lehe', '12', 68, 1),
(28, 'Vase', '91', 87, 1),
(29, 'Muru', '13', 98, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`, `country_id`) VALUES
(1, 'Narva', 1),
(2, 'Johvi', 2),
(3, 'Silamae', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Estonia');

-- --------------------------------------------------------

--
-- Структура таблицы `curator`
--

CREATE TABLE IF NOT EXISTS `curator` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `curator`
--

INSERT INTO `curator` (`id`, `teacher_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 1, 2),
(4, 0, 1),
(5, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL,
  `abbreviation` varchar(7) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `begin_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `begin_month` int(11) NOT NULL,
  `end_month` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`id`, `abbreviation`, `groupname`, `begin_year`, `end_year`, `begin_month`, `end_month`) VALUES
(1, 'PTVR', 'Tarkvaraarendaja', 2015, 2018, 9, 6),
(2, 'KTVR', 'Tarkvaraarendaja', 2015, 2017, 9, 6),
(3, 'PTAR', 'Andmebaaside haldus', 2014, 2016, 9, 6),
(4, 'KTAR', 'Tarkvaraandmebaaside haldus', 2010, 2013, 9, 6),
(6, 'PASR', 'Automaatika', 2013, 2016, 9, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `date`, `author`, `title`, `content`) VALUES
(1, '2015-12-16 12:30:37', 'Админ', 'Первая запись', 'Текст первой записи'),
(2, '2015-12-15 22:03:54', '', 'Первая', 'текст текст'),
(4, '2015-12-17 10:14:18', 'админ', 'Третья запись', 'Текст третьей записи (измененная)'),
(7, '2015-12-15 23:19:37', 'Админ', 'Вторая статья', 'Текст второй статьи'),
(9, '2015-12-16 00:00:07', 'Дюдя', 'Третья запись', 'Текст третьей статьи'),
(11, '2015-12-16 01:21:00', 'Dew', 'Четвертая запись', 'Текст четвертой записи (обновленный)');

-- --------------------------------------------------------

--
-- Структура таблицы `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `code` varchar(11) NOT NULL,
  `eban` varchar(40) NOT NULL,
  `bankname` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `name`, `surname`, `code`, `eban`, `bankname`) VALUES
(1, 'Juri', 'Melnikov', '37012122234', 'EE22409348539045304', 'Swedpank'),
(2, 'Aleksandr', 'Saas', '37905232212', 'EE224850373649298384', 'Swedpank'),
(3, 'Sergei', 'Novitskov', '38011031132', 'EE2249503945345927', 'SEB'),
(4, 'Oleg', 'Dubobtsky', '37012132214', 'EE2343456754675645', 'Nordipank'),
(5, 'Anja', 'Manina', '543534', 'gdfgfdg', 'dfgfdg'),
(6, 'Galina', 'Andreiman', '4762151228', 'EE344335865', 'Danske'),
(7, 'Olga', 'Evdokimova', '4997302559', 'EE731189956', 'Sampo bank'),
(8, 'Valentina', 'Knjazeva', '4656262303', 'EE5339605', 'Nordea'),
(9, 'Alissa', 'Kulikova', '481237660', 'EE446256051', 'Nordea'),
(10, 'Valentina', 'Kuzina', '3791098562', 'EE-54808717', 'Sampo bank'),
(11, 'Natalia', 'Nadolko', '483477366', 'EE230243745', 'Nordea'),
(12, 'Vjatšeslav', 'Paramonov', '4671186285', 'EE239767888', 'Sampo bank'),
(13, 'Julia', 'Rjabkova', '4829153582', 'EE57860709', 'Swedbank'),
(14, 'Oleg', 'Sikora', '4652125504', 'EE34188669', 'Swedbank'),
(15, 'Olga', 'Bakšajeva', '4928188968', 'EE-217588572', 'Danske'),
(16, 'Marina', 'Bõkova', '38011142000', 'EE-190992107', 'SEB Bank'),
(17, 'Sergei', 'Heistonen', '3654273306', 'EE-238494264', 'Sampo bank'),
(18, 'Viktoria', 'Kutšinskaja', '46312193617', 'EE965934394', 'Nordea'),
(19, 'Olga', 'Šarko', '4861186701', 'EE776913746', 'Swedbank'),
(20, 'Katerina', 'Vartan', '3981301943', 'EE-94209425', 'Sampo bank'),
(21, 'Galina', 'Vassiljeva', '3921261217', 'EE219771140', 'Sampo bank'),
(22, 'Anatoli', 'Aleksejev', '37211167564', 'EE826668502', 'Danske'),
(23, 'Oleg', 'Baljassov', '386691635', 'EE674954041', 'Sampo bank'),
(24, 'Aleksandr', 'Jakubovitš', '3666134882', 'EE708663975', 'SEB Bank'),
(25, 'Konstantin', 'Kevask', '4953142487', 'EE559162593', 'Swedbank'),
(26, 'Oleg', 'Kolunov', '49610301056', 'EE942855142', 'SEB Bank'),
(27, 'Pavel', 'Maykov', '361894054', 'EE272015609', 'Sampo bank'),
(28, 'Kristjan', 'Pellja', '389613993', 'EE532724204', 'Sampo bank');

-- --------------------------------------------------------

--
-- Структура таблицы `person_address`
--

CREATE TABLE IF NOT EXISTS `person_address` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `person_address`
--

INSERT INTO `person_address` (`id`, `person_id`, `address_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `person_telephones`
--

CREATE TABLE IF NOT EXISTS `person_telephones` (
  `id` int(11) NOT NULL,
  `telephone_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `registry` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id`, `registry`, `group_id`, `person_id`, `address_id`) VALUES
(1, 1234, 0, 2, 1),
(2, 1235, 6, 4, 2),
(3, 1236, 3, 3, 3),
(4, 5345345, 0, 5, 6),
(5, 34780, 0, 6, 7),
(6, 33134, 2, 7, 8),
(7, 35896, 6, 8, 9),
(8, 36460, 1, 9, 10),
(9, 35777, 6, 10, 11),
(10, 37281, 3, 11, 12),
(11, 35243, 3, 12, 13),
(12, 35323, 1, 13, 14),
(13, 31051, 0, 14, 15),
(14, 35002, 6, 15, 16),
(15, 38399, 3, 16, 17),
(16, 33416, 6, 17, 18),
(17, 35359, 6, 18, 19),
(18, 35675, 3, 19, 20),
(19, 30804, 6, 20, 21),
(20, 30683, 1, 21, 22),
(21, 32416, 1, 22, 23),
(22, 32385, 2, 23, 24),
(23, 35547, 2, 24, 25),
(24, 35665, 2, 25, 26),
(25, 35235, 2, 26, 27),
(26, 38842, 1, 27, 28),
(27, 38707, 3, 28, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `student_parents`
--

CREATE TABLE IF NOT EXISTS `student_parents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id`, `person_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `telefon`
--

CREATE TABLE IF NOT EXISTS `telefon` (
  `id` int(11) NOT NULL,
  `telephone_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `session_id` varchar(192) NOT NULL,
  `email` varchar(200) NOT NULL,
  `access` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `session_id`, `email`, `access`) VALUES
(16, 'sergei', '$2y$10$6ja9OZpnLbN3Pza4cIODm.uZeW46SsVjQcJ6XgHRSHCJZfynK743C', '', 'novitskov@gmail.com', 4),
(17, 'juri', '$2y$10$avxYDEt8N6qY/Xp.RVPHP.QyPm7y5NtatgtUyiJAWppJSu0Ir4KHS', '', 'juri.melnikov@ivkhk.ee', 3),
(18, 'olga', '$2y$10$Tb2WSfyLdOK.rEW2jfgs6ORpGQob1p8GcDM/a2XPmATbWqRUkSGXi', '', 'olga.popova@ivkhk.ee', 2),
(19, 'pupil', '$2y$10$wj/h0F.jO3bNCOpEryJ6Yuf.CpmvRgxAogEQonX7Gl/7uAH6jBu8a', '', 'pupil@ivkhk.ee', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `curator`
--
ALTER TABLE `curator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_teacher` (`teacher_id`),
  ADD KEY `id_group` (`group_id`),
  ADD KEY `id_teacher_2` (`teacher_id`),
  ADD KEY `id_group_2` (`group_id`);

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`);

--
-- Индексы таблицы `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `person_address`
--
ALTER TABLE `person_address`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `person_telephones`
--
ALTER TABLE `person_telephones`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `student_parents`
--
ALTER TABLE `student_parents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `telefon`
--
ALTER TABLE `telefon`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `curator`
--
ALTER TABLE `curator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `person_address`
--
ALTER TABLE `person_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `student_parents`
--
ALTER TABLE `student_parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `telefon`
--
ALTER TABLE `telefon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
