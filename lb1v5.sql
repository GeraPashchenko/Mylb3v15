-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 04 2020 г., 15:50
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lb1v5`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actor`
--

CREATE TABLE `actor` (
  `ID_Actor` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `actor`
--

INSERT INTO `actor` (`ID_Actor`, `name`) VALUES
(1, 'Джейми Фокс'),
(2, 'Сэмюэл Л. Джексон'),
(3, 'Омар Бенсон Миллер'),
(4, 'Ким Бейсингер'),
(5, 'Омар Си'),
(6, 'Франсуа Клюзе');

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `ID_FILM` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `quality` varchar(100) DEFAULT NULL,
  `resolution` varchar(100) DEFAULT NULL,
  `codec` varchar(100) DEFAULT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `carrier` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`ID_FILM`, `name`, `date`, `country`, `quality`, `resolution`, `codec`, `producer`, `director`, `carrier`) VALUES
(1, 'Джанго Освобожденный', '2013-01-01', 'США', 'HDrip', '720p', NULL, NULL, 'Квентин Тарантино', 'CD'),
(2, '8 миля', '2003-01-01', 'США', 'HDrip', '720p', NULL, 'Кёртис Хэнсон', NULL, 'CD'),
(3, '1+1/ Неприкасаемые', '2012-01-01', 'Франция', 'HDrip', '720p', NULL, 'Оливье Накаш', NULL, 'CD');

-- --------------------------------------------------------

--
-- Структура таблицы `film_actor`
--

CREATE TABLE `film_actor` (
  `FID_Film` int(11) DEFAULT NULL,
  `FID_Actor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `film_actor`
--

INSERT INTO `film_actor` (`FID_Film`, `FID_Actor`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `film_genre`
--

CREATE TABLE `film_genre` (
  `FID_Film` int(11) DEFAULT NULL,
  `FID_Genre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `film_genre`
--

INSERT INTO `film_genre` (`FID_Film`, `FID_Genre`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 1),
(3, 3),
(3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `ID_GENRE` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`ID_GENRE`, `title`) VALUES
(1, 'Драма'),
(2, 'Приключение'),
(3, 'Комедия'),
(4, 'Вестерн'),
(5, 'Музыка'),
(6, 'Биография');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID_Actor`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_FILM`);

--
-- Индексы таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD KEY `Film_fk2` (`FID_Film`),
  ADD KEY `Actor_fk` (`FID_Actor`);

--
-- Индексы таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD KEY `Film_fk` (`FID_Film`),
  ADD KEY `Genre_fk` (`FID_Genre`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_GENRE`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actor`
--
ALTER TABLE `actor`
  MODIFY `ID_Actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `ID_FILM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `ID_GENRE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `Actor_fk` FOREIGN KEY (`FID_Actor`) REFERENCES `actor` (`ID_Actor`),
  ADD CONSTRAINT `Film_fk2` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`);

--
-- Ограничения внешнего ключа таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `Film_fk` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`),
  ADD CONSTRAINT `Genre_fk` FOREIGN KEY (`FID_Genre`) REFERENCES `genre` (`ID_GENRE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
