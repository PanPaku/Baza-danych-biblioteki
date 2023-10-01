-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               11.0.2-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Zrzucanie danych dla tabeli biblioteka.autor: ~5 rows (około)
DELETE FROM `autor`;
INSERT INTO `autor` (`autor_ID`, `imie`, `nazwisko`) VALUES
	(1, 'Zygmunt', 'Miłoszewski'),
	(2, 'Blanka', 'Lipińska'),
	(3, 'Mariusz', 'Szczygieł'),
	(4, 'Katarzyna', 'Bonda'),
	(5, 'Remigiusz ', 'Mróz');

-- Zrzucanie danych dla tabeli biblioteka.czytelnicy: ~5 rows (około)
DELETE FROM `czytelnicy`;
INSERT INTO `czytelnicy` (`czytelnik_ID`, `imie`, `nazwisko`, `adres`, `miasto`, `kod_pocztowy`, `status_aktyw`, `email`, `data_rej`) VALUES
	(1, 'Paweł', 'Dudziak', 'Leszno 120', 'Przemyśl', '37-700', 'ACTIVE', 'paweldudziak@spoko.pl', '2022-03-25 21:14:46'),
	(2, 'Andrzej', 'Adamiak', 'Przemyśl ul.Słowackiego 24 ', 'Przemyśl', '37-700', 'NOT ACTIVE', 'andrzejadamiak@op.pl', '2023-09-25 10:15:01'),
	(3, 'Ania', 'Kasprzyk', 'Poznań ul.Jagiellońska 12', 'Poznań', '60-001', 'ACTIVE', 'aniakasprzyk@interia.pl', '2023-09-11 21:13:10'),
	(4, 'Robert', 'Lewandowski', 'Warszawa ul.Dworskiego 3', 'Warszawa', '00-001', 'BLOCKED', 'robertlewandowski@op.pl', '2023-04-23 08:15:37'),
	(5, 'Antoni', 'Błaszczykowski', 'Szczecin ul.Lelewela 56', 'Szczecin', '70-000', 'ACTIVE', 'antonibłaszczykowski@spoko.pl', '2023-07-29 20:15:56');

-- Zrzucanie danych dla tabeli biblioteka.egzemplarz: ~5 rows (około)
DELETE FROM `egzemplarz`;
INSERT INTO `egzemplarz` (`egzemplarz_ID`, `autor_ID`, `tytul`, `do_wypoz`, `twarda_okladka`) VALUES
	(1, 1, 'Uwikłanie', b'0', b'1'),
	(2, 2, '365 dni', b'1', b'1'),
	(3, 3, 'Nie ma', b'0', b'0'),
	(4, 4, 'Okularnik', b'1', b'1'),
	(5, 5, 'Ekspoza', b'0', b'0');

-- Zrzucanie danych dla tabeli biblioteka.ksiazka: ~5 rows (około)
DELETE FROM `ksiazka`;
INSERT INTO `ksiazka` (`ksiazka_ID`, `autor_ID`, `tytul`, `wydawnictwo`, `rok_wydania`) VALUES
	(1, 1, 'Uwikłanie', 'W.A.B.', '2021'),
	(2, 2, '365 dni', 'Agora', '2022'),
	(3, 3, 'Nie ma', 'Dowody na istnienie', '2018'),
	(4, 4, 'Okularnik', 'Muza', '2015'),
	(5, 5, 'Ekspoza', 'Filia', '2016');

-- Zrzucanie danych dla tabeli biblioteka.rezerwacja: ~3 rows (około)
DELETE FROM `rezerwacja`;
INSERT INTO `rezerwacja` (`rezerwacja_ID`, `egzemplarz_ID`, `czytelnik_ID`, `data_rez`) VALUES
	(1, 3, 3, '2023-05-08 09:17:13'),
	(2, 1, 5, '2023-07-18 02:38:07'),
	(3, 5, 1, '2023-09-23 19:39:17');

-- Zrzucanie danych dla tabeli biblioteka.wypozyczenia: ~3 rows (około)
DELETE FROM `wypozyczenia`;
INSERT INTO `wypozyczenia` (`rezerwacja_ID`, `egzemplarz_ID`, `czytelnik_ID`, `data_wyp`, `data_zwrotu`) VALUES
	(1, 3, 3, '2023-05-24', '2023-06-22'),
	(2, 1, 5, '2023-07-22', '2023-07-17'),
	(3, 5, 1, '2023-09-28', '2023-09-30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
