INSERT INTO rozliczenia.pracownicy (imie, nazwisko, adres, telefon)
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

INSERT INTO rozliczenia.godziny (data, liczba_godzin, id_pracownika)
VALUES
    ('2023-01-01', 40, 1),
    ('2023-01-02', 38, 2),
    ('2023-01-03', 42, 3),
    ('2023-01-04', 37, 4),
    ('2023-01-05', 40, 5),
    ('2023-01-06', 39, 6),
    ('2023-01-07', 41, 7),
    ('2023-01-08', 38, 8),
    ('2023-01-09', 40, 9),
    ('2023-01-10', 37, 10);

INSERT INTO rozliczenia.premie (rodzaj, kwota)
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
	
INSERT INTO rozliczenia.pensje (stanowisko, kwota, id_premii)
VALUES
    ('Kierownik', 5000.00, 1),
    ('Przedstawiciel Handlowy', 3000.00, 2),
    ('Programista', 4500.00, 3),
    ('Księgowy', 3500.00, 4),
    ('Specjalista ds. Marketingu', 3200.00, 5),
    ('Koordynator ds. HR', 2800.00, 6),
    ('Agent Obsługi Klienta', 2800.00, 7),
    ('Grafik', 3200.00, 8),
    ('Kierownik Projektu', 4800.00, 9),
    ('Analityk Danych', 3800.00, 10);
