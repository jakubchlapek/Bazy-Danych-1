-- ID Pracownika i nazwisko
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy

-- ID Pracownikow gdzie płaca > 1000
SELECT w.id_pracownika
FROM ksiegowosc.wynagrodzenia as w
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
LEFT JOIN ksiegowosc.premie as prem
USING(id_premii)
WHERE (pen.kwota + prem.kwota) > 1000

-- ID Pracowników bez premii gdzie płaca > 2000 / Wszyscy mają premię
SELECT w.id_pracownika
FROM ksiegowosc.wynagrodzenia as w
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
WHERE pen.kwota > 2000
	AND w.id_premii IS NULL;
	
-- ID Pracownikow gdzie imie zaczyna sie na J
SELECT id_pracownika
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%'

-- ID pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT *
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%'
	AND imie LIKE '%a';
	
-- Imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy 
-- czas pracy to 160 h miesięcznie. -- dam powyzej 40 bo nie mam 160 w bazie
SELECT imie, nazwisko, liczba_godzin - 40 as liczba_nadgodzin
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny USING(id_pracownika)
WHERE liczba_godzin > 40;

-- Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 
-- PLN.
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.pracownicy as prac
USING(id_pracownika)
WHERE pen.kwota BETWEEN 1500 AND 3000;

-- Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali 
-- premii.
SELECT imie, nazwisko
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny USING(id_pracownika)
INNER JOIN ksiegowosc.wynagrodzenia USING(id_pracownika)
WHERE liczba_godzin > 40
	AND id_premii IS NULL;
	
-- Uszereguj pracowników według pensji
SELECT id_pracownika, imie, nazwisko, kwota
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.pracownicy as prac
USING(id_pracownika)
ORDER BY kwota DESC;

-- Uszereguj pracowników według pensji i premii malejąco.
SELECT id_pracownika, imie, nazwisko, pen.kwota + prem.kwota AS wyplata
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.pracownicy as prac
USING(id_pracownika)
INNER JOIN ksiegowosc.premie as prem
USING(id_premii)
ORDER BY 4 DESC;

-- Zlicz i pogrupuj pracowników według pola ‘stanowisko’
SELECT stanowisko, COUNT(*) as suma_pracownikow
FROM ksiegowosc.pensje
GROUP BY stanowisko;

-- Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie 
-- masz, to przyjmij dowolne inne).
SELECT AVG(pen.kwota + prem.kwota), MIN(pen.kwota + prem.kwota), MAX(pen.kwota + prem.kwota)
FROM ksiegowosc.wynagrodzenia w
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.premie as prem
USING(id_premii)
WHERE stanowisko = 'Kierownik';

-- Policz sumę wszystkich wynagrodzeń
SELECT SUM(pen.kwota + prem.kwota) AS suma_wyplat
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.premie as prem
USING(id_premii)

-- Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT stanowisko, SUM(pen.kwota + prem.kwota) AS suma_wyplat
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.premie as prem
USING(id_premii)
GROUP BY stanowisko;

-- Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT stanowisko, COUNT(id_premii) AS ilosc_premii
FROM ksiegowosc.wynagrodzenia as wyn
INNER JOIN ksiegowosc.pensje as pen
USING(id_pensji)
INNER JOIN ksiegowosc.premie as prem
USING(id_premii)
GROUP BY stanowisko;

-- Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
DELETE 
FROM ksiegowosc.pracownicy 
WHERE id_pracownika IN (
	SELECT id_pracownika
	FROM ksiegowosc.wynagrodzenia
	INNER JOIN ksiegowosc.pensje USING(id_pensji)
	WHERE kwota < 1200)


	