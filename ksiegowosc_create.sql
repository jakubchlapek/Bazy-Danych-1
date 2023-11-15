CREATE SCHEMA IF NOT EXISTS ksiegowosc;

CREATE TABLE IF NOT EXISTS ksiegowosc.pracownicy
(
	id_pracownika INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(30) NOT NULL,
	adres VARCHAR(60) NOT NULL,
	telefon VARCHAR(20) NOT NULL
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 
	'Tabela zawierająca dane osobiste pracowników i ich identyfikator.';

CREATE TABLE IF NOT EXISTS ksiegowosc.premie
(
	id_premii INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	rodzaj VARCHAR(60) NOT NULL,
	kwota DECIMAL(12,2) NOT NULL
);
COMMENT ON TABLE ksiegowosc.premie IS 
	'Tabela zawierająca wysokość i rodzaj premii oraz ich identyfikator.';
	
CREATE TABLE IF NOT EXISTS ksiegowosc.godziny
(
	id_godziny INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin numeric NOT NULL,
	id_pracownika INT NOT NULL 
		REFERENCES ksiegowosc.pracownicy(id_pracownika)  	
);
COMMENT ON TABLE ksiegowosc.godziny IS 
	'Tabela zawierająca godziny przepracowane w  danym miesiącu 
	przez pracownika i identyfikator godzin.';

CREATE TABLE IF NOT EXISTS ksiegowosc.pensje
(
	id_pensji INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	stanowisko VARCHAR(60) NOT NULL,
	kwota DECIMAL(12,2) NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensje IS 
	'Tabela zawierająca kwoty wypłat dla danych stanowisko 
	i identyfikator pensji.';

CREATE TABLE IF NOT EXISTS ksiegowosc.wynagrodzenia
(
	id_wynagrodzenia INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data DATE NOT NULL,
	id_pracownika INT NOT NULL
		REFERENCES ksiegowosc.pracownicy(id_pracownika),
	
	id_godziny INT NOT NULL
		REFERENCES  ksiegowosc.godziny(id_godziny),
	
	id_pensji INT NOT NULL
		REFERENCES ksiegowosc.premie(id_premii),
	
	id_premii INT
		REFERENCES ksiegowosc.pensje(id_pensji)
);
COMMENT ON TABLE ksiegowosc.wynagrodzenia IS 
	'Tabela główna zawierająca wynagrodzenia pracowników 
	i identyfikator z każdej tabeli.';

