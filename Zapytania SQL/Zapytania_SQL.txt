Wyświetl czytleników których imie zaczyna się od "P"
SELECT * FROM czytelnicy WHERE imie LIKE 'P%';

Wyświetl tytuły książek od najdłuższego do najkrótszego
SELECT * FROM ksiazka ORDER BY LENGTH(tytul) DESC;

Wyswietl książke która ma najdłuższy tytuł
SELECT * FROM ksiazka ORDER BY LENGTH(tytul) DESC LIMIT 1;

Wyświetl użytkowników zarejestrowanych w tym miesiącu
SELECT * FROM czytelnicy WHERE MONTH(data_rej) = MONTH(CURRENT_DATE) AND YEAR(data_rej) = YEAR(CURRENT_DATE);

Wyświetl książki z twardą okładką
SELECT * FROM egzemplarz WHERE twarda_okladka = 1;

Wyświetl książki egzemplarz które są do wypożyczenia
SELECT * FROM egzemplarz WHERE do_wypoz = 1;

Wyświetl książki które zostały wydane przed 2020 rokiem
SELECT * FROM ksiazka WHERE rok_wydania < 2020;

Wyświetl rezerwacje które zostały wykonane w tym miesiącu
SELECT * FROM rezerwacja WHERE MONTH(data_rez) = MONTH(CURRENT_DATE()) AND YEAR(data_rez) = YEAR(CURRENT_DATE());

Wyświetl rezerwacje z tego miesiąca 
SELECT * FROM wypozyczenia WHERE MONTH(data_wyp) = MONTH(CURRENT_DATE()) AND YEAR(data_wyp) = YEAR(CURRENT_DATE());

Wyświetl użytkowników zablokowanych
SELECT * FROM czytelnicy WHERE status_aktyw = 'zablokowany';

Wyświetl użytkowników z Poznania
SELECT * FROM czytelnicy WHERE miasto = 'Poznań';

Wyświetl książki z wydawnictwa Agora
SELECT * FROM ksiazka WHERE wydawnictwo = 'Agora'

Wyswietl liczbe wypożyczeń bez wcześniejszej rezerwacji
SELECT COUNT(*) AS liczba_wypozyczen_bez_rezerwacji FROM wypozyczenia LEFT JOIN rezerwacja ON wypozyczenia.rezerwacja_ID = rezerwacja.rezerwacja_ID
WHERE rezerwacja.rezerwacja_ID IS NULL;

Wyświetl nazwiska użytwkoników którzy mają wypożyczoną chociaż jedną książke
SELECT DISTINCT czytelnicy.nazwisko FROM czytelnicy INNER JOIN wypozyczenia ON czytelnicy.czytelnik_ID = wypozyczenia.czytelnik_ID;

Wyświetl najnowsze wypożyczenie dla użytkownika Paweł
SELECT Czytelnicy.imie, wypozyczenia.data_wyp FROM wypozyczenia INNER JOIN Czytelnicy ON wypozyczenia.czytelnik_ID = Czytelnicy.czytelnik_ID
WHERE Czytelnicy.imie = 'Paweł' ORDER BY wypozyczenia.data_wyp DESC LIMIT 1;

Wyświetl tytuły książek które są dostępne w bibliotece
SELECT tytul FROM egzemplarz WHERE do_wypoz = 1;



