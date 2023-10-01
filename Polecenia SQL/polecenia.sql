Autor:

CREATE TABLE `autor` (
	`autor_ID` BIGINT(20) UNSIGNED NOT NULL,
	`imie` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nazwisko` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`autor_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO autor (autor_ID, imie, nazwisko) VALUES (1, 'Zygmunt' , 'Miłoszewski');

Czytelnicy:

CREATE TABLE `czytelnicy` (
	`czytelnik_ID` BIGINT(20) NOT NULL,
	`imie` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nazwisko` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`adres` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`miasto` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`kod_pocztowy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`status_aktyw` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`data_rej` DATETIME NOT NULL,
	PRIMARY KEY (`czytelnik_ID`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO czytelnicy (czytelnik_ID, imie, nazwisko, adres, miasto, kod_pocztowy, status_aktyw, email, data_rej) VALUES (1, 'Paweł' , 'Dudziak', 'Leszno 120', 'Przemyśl', '37-700', 'ACTIVE', 'paweldudziak@spoko.pl',  '2022-03-25 21:14:46');

Egzemplarz:

CREATE TABLE `egzemplarz` (
	`egzemplarz_ID` BIGINT(20) UNSIGNED NOT NULL,
	`autor_ID` BIGINT(20) NOT NULL,
	`tytul` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`do_wypoz` BIT(1) NOT NULL,
	`twarda_okladka` BIT(1) NOT NULL,
	PRIMARY KEY (`egzemplarz_ID`) USING BTREE,
	INDEX `autor_ID` (`autor_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO egzemplarz (egzemplarz_ID, autor_ID, tytul, do_wypoz, twarda_okladka) VALUES (1, 1, 'Uwikłanie', 0, 1);

Ksiazka:

CREATE TABLE `ksiazka` (
	`ksiazka_ID` BIGINT(20) UNSIGNED NOT NULL,
	`autor_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`tytul` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`wydawnictwo` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`rok_wydania` YEAR NOT NULL,
	PRIMARY KEY (`ksiazka_ID`) USING BTREE,
	INDEX `autor_ID` (`autor_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO ksiazka (ksiazka_ID, autor_ID, tytul, wydawnictwo, rok_wydania) VALUES (1, 1, 'Uwikłanie', 'W.A.B', '2021');

Rezerwacja:

CREATE TABLE `rezerwacja` (
	`rezerwacja_ID` BIGINT(20) UNSIGNED NOT NULL,
	`egzemplarz_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`czytelnik_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`data_rez` DATETIME NOT NULL,
	PRIMARY KEY (`rezerwacja_ID`) USING BTREE,
	INDEX `czytelnik_ID` (`czytelnik_ID`) USING BTREE,
	INDEX `egzemplarz_ID` (`egzemplarz_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO rezerwacja (rezerwacja_ID, egzemplarz_ID, czytelnik_ID, data_rez) VALUES (1, 3, 3, '2023-05-08 09:17:13');

Wypozyczenia:

CREATE TABLE `wypozyczenia` (
	`rezerwacja_ID` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`egzemplarz_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`czytelnik_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`data_wyp` DATE NOT NULL,
	`data_zwrotu` DATE NOT NULL,
	INDEX `czytelnik_ID` (`czytelnik_ID`) USING BTREE,
	INDEX `egzemplarz_ID` (`egzemplarz_ID`) USING BTREE,
	INDEX `rezerwacja_ID` (`rezerwacja_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO wypozyczenia (rezerwacja_ID, egzemplarz_ID, czytelnik_ID, data_wyp, data_zwrotu) VALUES (1, 3, 3, '2023-05-24', '2023-06-22');

