-- a)
UPDATE ksiegowosc.pracownicy
SET telefon = '+48' || telefon;

-- b)
UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon FROM 1 FOR 3) || '-' ||
		      SUBSTRING(telefon FROM 4 FOR 3) || '-' || 
			  SUBSTRING(telefon FROM 7 FOR 3) || '-' || 
			  SUBSTRING(telefon FROM 10 FOR 3); 	

-- c) w ten sposob gdyby kilku pracownikow mialo tak samo dlugie nazwisko
SELECT id_pracownika, UPPER(imie), UPPER(nazwisko), UPPER(adres), telefon
FROM ksiegowosc.pracownicy
WHERE LENGTH(imie) IN (
	SELECT MAX(LENGTH(imie))
	FROM ksiegowosc.pracownicy
)
-- d)
SELECT imie, nazwisko, adres, telefon, MD5(CAST(pensje AS TEXT)) AS pensja
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia USING(id_pracownika)
INNER JOIN ksiegowosc.pensje USING(id_pensji);

-- f)
SELECT imie, nazwisko, adres, telefon, pensje.kwota AS pensja, premie.kwota AS premia
FROM ksiegowosc.wynagrodzenia
LEFT JOIN ksiegowosc.pracownicy USING(id_pracownika)
LEFT JOIN ksiegowosc.pensje USING(id_pensji)
LEFT JOIN ksiegowosc.premie USING(id_premii)

-- g)
SELECT  'Pracownik ' || imie || ' ' || nazwisko || ' w dniu ' || wynagrodzenia.data || ' otrzymał pensję całkowitą na kwotę ' ||
	   (pensje.kwota + premie.kwota + ABS(liczba_godzin - 30)*50) || ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ' || pensje.kwota ||
	   ' zł, premia: ' || premie.kwota || ' zł, nadgodziny: ' || ABS(liczba_godzin - 30)*50 || 'zł'
FROM ksiegowosc.wynagrodzenia
LEFT JOIN ksiegowosc.pracownicy USING(id_pracownika)
LEFT JOIN ksiegowosc.pensje USING(id_pensji)
LEFT JOIN ksiegowosc.premie USING(id_premii)
LEFT JOIN ksiegowosc.godziny USING(id_godziny);