CREATE SCHEMA IF NOT EXISTS rozliczenia;

CREATE TABLE IF NOT EXISTS rozliczenia.pracownicy
(
	id_pracownika int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(30) NOT NULL,
	adres VARCHAR(60) NOT NULL,
	telefon VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS rozliczenia.premie
(
	id_premii int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	rodzaj VARCHAR(60) NOT NULL,
	kwota money NOT NULL
);
	
CREATE TABLE IF NOT EXISTS rozliczenia.godziny
(
	id_godziny int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data date NOT NULL,
	liczba_godzin numeric NOT NULL,
	id_pracownika int NOT NULL, 
	FOREIGN KEY (id_pracownika)
		REFERENCES rozliczenia.pracownicy(id_pracownika)
);

CREATE TABLE IF NOT EXISTS rozliczenia.pensje
(
	id_pensji int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	stanowisko VARCHAR(60) NOT NULL,
	kwota money NOT NULL,
	id_premii int,
	FOREIGN KEY(id_premii)
		REFERENCES rozliczenia.premie(id_premii)
);


