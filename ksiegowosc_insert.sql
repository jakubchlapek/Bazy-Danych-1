INSERT INTO ksiegowosc.pracownicy (imie, nazwisko, adres, telefon)
VALUES
    ('Jan', 'Kowalski', 'ul. Główna 123', '5551234567'),
    ('Maria', 'Nowak', 'ul. Leśna 456', '5559876543'),
    ('Robert', 'Wiśniewski', 'ul. Długa 789', '5558765432'),
    ('Anna', 'Jankowska', 'ul. Sosnowa 321', '5552345678'),
    ('Wojciech', 'Nowakowski', 'ul. Brzozowa 654', '5557654321'),
    ('Jadwiga', 'Woźniak', 'ul. Lipowa 987', '5553456789'),
    ('Michał', 'Wojcik', 'ul. Cedrowa 210', '5558765432'),
    ('Elżbieta', 'Marta', 'ul. Świerkowa 543', '5552345678'),
    ('Krzysztof', 'Kowalczyk', 'ul. Modrzewiowa 876', '5559876543'),
    ('Ewa', 'Garcia', 'ul. Sosna 109', '5551234567');

INSERT INTO ksiegowosc.godziny (data, liczba_godzin, id_pracownika)
VALUES
    ('2023-06-01', 40, 1),
    ('2023-01-04', 38, 2),
    ('2023-04-03', 42, 3),
    ('2023-08-22', 37, 4),
    ('2023-02-05', 40, 5),
    ('2023-07-11', 39, 6),
    ('2023-01-07', 41, 7),
    ('2023-12-08', 38, 8),
    ('2023-01-29', 40, 9),
    ('2023-11-10', 37, 10);

INSERT INTO ksiegowosc.premie (rodzaj, kwota)
VALUES
    ('Premia Roczna', 1000.00),
    ('Premia za Wyniki', 800.00),
    ('Premia Kwartalna', 600.00),
    ('Premia Świąteczna', 500.00),
    ('Premia za Wyniki Sprzedaży', 700.00),
    ('Pracownik Miesiąca', 400.00),
    ('Nagroda za Wyjątkowe Osiągnięcia', 300.00),
    ('Premia Zespołowa', 900.00),
    ('Premia za Produktywność', 700.00),
    ('Premia za Obecność', 200.00);
	
INSERT INTO ksiegowosc.pensje (stanowisko, kwota)
VALUES
    ('Kierownik', 5000.00),
    ('Przedstawiciel Handlowy', 3000.00),
    ('Programista', 4500.00),
    ('Księgowy', 3500.00),
    ('Specjalista ds. Marketingu', 3200.00),
    ('Koordynator ds. HR', 2800.00),
    ('Agent Obsługi Klienta', 2800.00),
    ('Grafik', 3200.00),
    ('Kierownik Projektu', 4800.00),
    ('Analityk Danych', 3800.00);

INSERT INTO ksiegowosc.wynagrodzenia (data, id_pracownika, id_godziny, id_premii, id_pensji)
VALUES
    ('2023-03-01', 1, 1, 1, 1),
    ('2023-01-21', 2, 2, 2, 2),
    ('2023-08-21', 3, 3, 3, 3),
	('2023-04-01', 4, 4, 4, 4),
	('2023-02-04', 5, 5, 5, 5),
	('2023-08-07', 6, 6, 6, 6),
	('2023-06-17', 7, 7, 7, 7),
	('2023-12-01', 8, 8, 8, 8),
	('2023-11-02', 9, 9, 9, 9),
	('2023-08-11', 10, 10, 10, 10);