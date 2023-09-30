Autor:

ALTER TABLE autor ADD autor_ID BIGINT(20) UNSIGNED NOT NULL;
INSERT INTO autor (autor_ID, imie, nazwisko) VALUES (1, 'Zygmunt' , 'Miłoszewski');

Czytelnicy:

ALTER TABLE czytelnicy ADD COLUMN czytelnik_ID BIGINT(20) UNSIGNED NOT NULL;
INSERT INTO czytelnicy (czytelnik_ID, imie, nazwisko, adres, miasto, kod_pocztowy, status_aktyw, email, data_rej) VALUES (1, 'Paweł' , 'Dudziak', 'Leszno 120', 'Przemyśl', '37-700', 'aktywny', 'paweldudziak@spoko.pl',  2022-03-25 21:14:46);


Egzemplarz:

ALTER TABLE egzemplarz ADD COLUMN egzemplarz_ID BIGINT(20) UNSIGNED NOT NULL;
INSERT INTO egzemplarz (egzemplarz_ID, autor_ID, tytul, do_wypoz, twarda_okladka) VALUES (1, '1', 'Uwikłanie', 0, 1);

Ksiazka:

ALTER TABLE ksiazka ADD COLUMN ksiazka_ID BIGINT(20) UNSIGNED NOT NULL;
INSERT INTO ksiazka (ksiazka_ID, autor_ID, tytul, wydawnictwo, rok_wydania) VALUES (1, '1', 'Uwikłanie', 'W.A.B', 2021);

Rezerwacja:

ALTER TABLE rezerwacja ADD COLUMN rezerwacja_ID BIGINT(20) UNSIGNED NOT NULL;
INSERT INTO rezerwacja (rezerwacja_ID, egzemplarz_ID, czytelnik_ID, data_rez) VALUES (1, '3', '3', 2023-05-08 09:17:13);

Wypozyczenia:

ALTER TABLE wypozyczenia ADD COLUMN rezerwacja_ID BIGINT(20) NOT NULL;
INSERT INTO wypozyczenia (rezerwacja_ID, egzemplarz_ID, czytelnik_ID, data_wyp) VALUES (1, '3', '3', 2023-05-24);

