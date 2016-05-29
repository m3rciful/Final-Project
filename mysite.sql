-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 29 2016 г., 20:08
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 5.6.19

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

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(40) NOT NULL,
  `house` varchar(10) NOT NULL,
  `room` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `street`, `house`, `room`, `city_id`) VALUES
(0, '', '', 0, 1),
(1, 'Jaama', '4', 12, 1),
(2, 'Soo', '2', 5, 1),
(3, 'Kutse', '13', 245, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`, `country_id`) VALUES
(1, 'Narva', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Estonia');

-- --------------------------------------------------------

--
-- Структура таблицы `curator`
--

CREATE TABLE `curator` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `abbreviation` varchar(7) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `begin_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `begin_month` int(11) NOT NULL,
  `end_month` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `modul` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(40) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `code` varchar(11) NOT NULL,
  `eban` varchar(40) NOT NULL,
  `bankname` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `name`, `surname`, `code`, `eban`, `bankname`) VALUES
(1, 'Juri', 'Melnikov', '37012122234', 'EE22409348539045304', 'Swedpank'),
(2, 'Aleksandr', 'Saas', '37905232212', 'EE224850373649298384', 'Swedpank'),
(3, 'Sergei', 'Novitskov', '38011031132', 'EE2249503945345927', 'SEB'),
(4, 'Oleg', 'Dubobtsky', '37012132214', 'EE2343456754675645', 'Nordipank'),
(0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `person_address`
--

CREATE TABLE `person_address` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `person_telephones` (
  `id` int(11) NOT NULL,
  `telephone_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `registry` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id`, `registry`, `group_id`, `person_id`, `address_id`) VALUES
(1, 1234, 2, 2, 1),
(2, 1235, 0, 4, 2),
(3, 1236, 1, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `student_parents`
--

CREATE TABLE `student_parents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id`, `person_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `telefon`
--

CREATE TABLE `telefon` (
  `id` int(11) NOT NULL,
  `telephone_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `session_id` varchar(192) NOT NULL,
  `email` varchar(200) NOT NULL,
  `access` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `session_id`, `email`, `access`) VALUES
(16, 'sergei', '$2y$10$6ja9OZpnLbN3Pza4cIODm.uZeW46SsVjQcJ6XgHRSHCJZfynK743C', '', 'novitskov@gmail.com', 4),
(17, 'juri', '$2y$10$avxYDEt8N6qY/Xp.RVPHP.QyPm7y5NtatgtUyiJAWppJSu0Ir4KHS', '', 'juri.melnikov@ivkhk.ee', 3),
(18, 'olga', '$2y$10$Tb2WSfyLdOK.rEW2jfgs6ORpGQob1p8GcDM/a2XPmATbWqRUkSGXi', '', 'olga.popova@ivkhk.ee', 2),
(19, 'pupil', '$2y$10$wj/h0F.jO3bNCOpEryJ6Yuf.CpmvRgxAogEQonX7Gl/7uAH6jBu8a', '', 'pupil@ivkhk.ee', 1),
(20, 'root', '$2y$10$y9/DjEr6G5S5yle4zpmLm.9fnNVd0RkD0tKPPJ4UjbstMoysIlzmi', '', 'root@localhost', 4);

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
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
