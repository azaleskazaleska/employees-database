/*SPRAWDZANIE CZY ISTNIEJE BAZA DANYCH 'employees' I USUWANIE JEJ */

DROP DATABASE IF EXISTS employees;

/*TWORZENIE BAZY DANYCH 'employees'*/

CREATE DATABASE employees;

/*UŻYCIE BAZY DANYCH 'employees'*/

USE employees;

/*------TWORZENIE TABEL------*/

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `dzialy`*/

DROP TABLE IF EXISTS dzialy;
CREATE TABLE dzialy (
     id_dzialu int NOT NULL AUTO_INCREMENT,
     PRIMARY KEY (id_dzialu),
     nazwa_dzialu varchar(20));

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `stanowiska`*/

DROP TABLE IF EXISTS stanowiska;
CREATE TABLE stanowiska (
    id_stanowiska int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_stanowiska),
    nazwa_stanowiska varchar(20),
    id_dzialu int,
    FOREIGN KEY (id_dzialu) REFERENCES dzialy(id_dzialu));

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `pracownicy`*/

DROP TABLE IF EXISTS pracownicy;
CREATE TABLE pracownicy (
    id_pracownika int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_pracownika),
    imie varchar(30),
    nazwisko varchar(30),
    nr_tel int,
    płeć varchar(3),
    id_stanowiska int,
    FOREIGN KEY (id_stanowiska) REFERENCES stanowiska(id_stanowiska),
    wynagrodzenie int);

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `zatrudnienie`*/

DROP TABLE IF EXISTS zatrudnienie;
CREATE TABLE zatrudnienie (
    id_pracownika int NOT NULL, 
    data_od date,
    data_do date,
    status varchar(20),
    FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika) ON DELETE CASCADE ON UPDATE CASCADE);

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `pracownicy_historia`*/

DROP TABLE IF EXISTS pracownicy_historia;
CREATE TABLE pracownicy_historia (
    id_pracownika_h int NOT NULL,
    PRIMARY KEY (id_pracownika_h),
    imie varchar(30),
    nazwisko varchar(30), 
    email varchar(30),
    nr_tel int,
    płeć varchar(3),
    id_stanowiska int,
    FOREIGN KEY (id_stanowiska) REFERENCES stanowiska(id_stanowiska),
    wynagrodzenie int);

/*SPRAWDZANIE CZY ISTNIEJE I TWORZENIE TABELI `zatrudnienie_historia`*/

DROP TABLE IF EXISTS zatrudnienie_historia;
CREATE TABLE zatrudnienie_historia (
    id_pracownika_h int NOT NULL, 
    data_od date,
    data_do date,
    status varchar(20),
    FOREIGN KEY (id_pracownika_h) REFERENCES pracownicy_historia(id_pracownika_h) ON DELETE CASCADE ON UPDATE CASCADE);

/*------UZUPEŁNIANIE TABEL PRZYKŁADOWYM ZESTAWEM DANYCH-----*/

/*ZRZUT DANYCH TABELI `dzialy`*/

INSERT INTO `dzialy` (`id_dzialu`, `nazwa_dzialu`) VALUES
(1, 'Finanse'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Sprzedaż'),
(5, 'HR'),
(6, 'Audyt'),
(7, 'Prawny'),
(8, 'Zarząd'),
(9, 'Administracja'),
(10, 'Consulting'),
(11, 'Kontroling'),
(12, 'Social Media'),
(13, 'Kadry'),
(14, 'Płace'),
(15, 'Strategii');


/*ZRZUT DANYCH TABELI `stanowiska`*/

INSERT INTO `stanowiska` (`id_stanowiska`, `id_dzialu`, `nazwa_stanowiska`) VALUES
(1, 1, 'Ksiegowa/y'),
(2, 2, 'Programista'),
(3, 3, 'Marketing Manager'),
(4, 4, 'Sales Specialist'),
(5, 5, 'HR Manager'),
(6, 6, 'Audit consultant'),
(7, 7, 'Adwokat'),
(8, 8, 'CEO'),
(9, 9, 'Administrator'),
(10, 10, 'AMS Consultant'),
(11, 11, 'Financial Controller'),
(12, 12, 'SM Ninja'),
(13, 13, 'HR Business Partner'),
(14, 14, 'Asystent Płac'),
(15, 15, 'Strategy Advisor');

/*ZRZUT DANYCH TABELI `pracownicy`*/

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `nr_tel`, `płeć`, `id_stanowiska`, `wynagrodzenie`) VALUES
(1, 'Artur', 'Stankiewicz', 586452489, 'M', 2, 8500),
(2, 'Karolina', 'Ceglewicz', 589654785, 'K',  2, 4500),
(3, 'Janina', 'Kozioł-Leśniak', 246895214, 'K', 6, 11000),
(4, 'Adam', 'Barcz', 847483647, 'M' , 3, 5000),
(5, 'Małgorzata', 'Dwojak', 235464622, 'K' , 5, 6000),
(6, 'Maria', 'Stanisławska', 365425464, 'K', 6, 9500),
(7, 'Bartosz', 'Barkowski', 511454215, 'M' , 4, 13000),
(8, 'Karol', 'Arciewicz', 542214552, 'M', 9, 5000),
(9, 'Zenon', 'Komski', 548652122, 'M',  7, 4300),
(10, 'Sandra', 'Stanek', 525285422, 'K', 10, 3800),
(11, 'Joanna', 'Fijałkowska', 865451646, 'K', 12, 7000),
(12, 'Julia', 'Życińska', 326546498, 'K', 11, 4300),
(13, 'Anna', 'Makarowska', 296512244, 'K', 13, 6500),
(14, 'Ewa', 'Zygmuntowicz', 334146211, 'K', 14, 9000),
(15, 'Paweł', 'Korelowski', 758965442, 'M', 11, 8500),
(16, 'Leszek', 'Maj', 674567487, 'M', 15, 3500),
(17, 'Nela', 'Wysocka', 357479567, 'K', 2, 6000),
(18, 'Ryszard', 'Musiał', 567597865, 'M', 3, 3400),
(19, 'Judyta', 'Król', 86795464, 'K', 4, 8000),
(20, 'Alojzy', 'Pawlik', 753485435, 'M', 15, 22000),
(21, 'Maria', 'Janik', 867567567, 'K', 2, 5600),
(22, 'Bogdan', 'Michalik', 867567456, 'M', 8, 9000),
(23, 'Anastazja', 'Zakrzewska', 867567568, 'K', 3, 4000),
(24, 'Helena', 'Brzezińska', 97463254, 'K', 8, 7800),
(25, 'Paula', 'Kowalska', 87647, 'K', 7, 13500),
(26, 'Albin', 'Świątek', 865451646, 'M',  13, 4000),
(27, 'Oliver', 'Duda', 326546498, 'M', 15, 9500),
(28, 'Teofil', 'Kania', 296512244,'M', 14, 6800),
(29, 'Blanka', 'Kot', 334146211, 'K', 14, 7800),
(30, 'Agnieszka', 'Pawlak', 85685574, 'K', 12, 3500),
(31, 'Aldona', 'Tomczyk', 525285422, 'K', 13, 6700),
(32, 'Leopold', 'Madej', 865451646, 'M', 12, 6900),
(33, 'Leon', 'Gajda', 326546498, 'M', 1, 4500),
(34, 'Sabina', 'Piasecka', 296512244, 'K', 3, 8700),
(35, 'Halina', 'Brzozowska', 334146211, 'K', 4, 3500),
(36, 'Paweł', 'Włodarczyk', 758965442, 'M', 5, 8700),
(37, 'Artur', 'Kozioł', 586452489, 'M', 13, 8500),
(38, 'Aleksy', 'Domański', 589654785, 'M', 12, 4600),
(39, 'Janina', 'Piątek', 246895214, 'K', 13, 8400),
(40, 'Adam', 'Barcz', 847483647, 'M', 6, 8000),
(41, 'Marcelina', 'Wieczorek', 235464622, 'K', 1, 17600),
(42, 'Anna', 'Stasiak', 365425464, 'K', 5, 5700),
(43, 'Bartosz', 'Kurek', 511454215, 'M', 2, 26600),
(44, 'Teofila', 'Michalak', 542214552, 'K', 6, 7400),
(45, 'Zenon', 'Kopeć', 548652122, 'M', 3, 4600),
(46, 'Sandra', 'Bednarczyk', 525285422, 'K', 7, 9600),
(47, 'Joanna', 'Szczepańska', 865451646, 'K', 9, 8600),
(48, 'Judyta', 'Duda', 326546498, 'K', 8, 4600),
(49, 'Antonina', 'Milewska', 296512244, 'K', 10, 7900),
(50, 'Ewa', 'Zygmuntowicz', 334146211, 'K', 11, 4600);

/*ZRZUT DANYCH TABELI `zatrudnienie`*/

INSERT INTO `zatrudnienie` (`id_pracownika`, `data_od`, `data_do`, STATUS) VALUES
(1, '1999-12-11', '0000-00-00','TRWA' ),
(2, '2015-05-25', '0000-00-00','TRWA' ),
(3, '1998-11-27', '0000-00-00','TRWA' ),
(4, '2008-07-16', '0000-00-00','TRWA' ),
(5, '2021-01-31', '0000-00-00','TRWA' ),
(6, '1996-11-15', '0000-00-00','TRWA' ),
(7, '1987-09-23', '0000-00-00','TRWA' ),
(8, '2005-12-14', '0000-00-00','TRWA' ),
(9, '2015-03-02', '0000-00-00','TRWA' ),
(10, '2022-07-30', '0000-00-00','TRWA' ),
(11, '2005-02-04', '0000-00-00','TRWA' ),
(12, '2021-08-06', '0000-00-00','TRWA' ),
(13, '2003-11-26', '0000-00-00','TRWA' ),
(14, '2010-05-21', '0000-00-00','TRWA' ),
(15, '2008-10-06', '0000-00-00','TRWA' ),
(16, '1995-12-13', '0000-00-00','TRWA' ),
(17, '2016-05-26', '0000-00-00','TRWA' ),
(18, '1997-12-23', '0000-00-00','TRWA' ),
(19, '2005-07-16', '0000-00-00','TRWA' ),
(20, '2021-01-03', '0000-00-00','TRWA' ),
(21, '1998-07-26', '0000-00-00','TRWA' ),
(22, '2005-04-13', '0000-00-00','TRWA' ),
(23, '2007-12-25', '0000-00-00','TRWA' ),
(24, '2014-03-03', '0000-00-00','TRWA' ),
(25, '2002-07-31', '0000-00-00','TRWA' ),
(26, '2013-02-02', '0000-00-00','TRWA' ),
(27, '2017-06-05', '0000-00-00','TRWA' ),
(28, '2017-12-22', '0000-00-00','TRWA' ),
(29, '2020-04-24', '0000-00-00','TRWA' ),
(30, '2019-10-03', '0000-00-00','TRWA' ),
(31, '2007-04-30', '0000-00-00','TRWA' ),
(32, '2012-01-07', '0000-00-00','TRWA' ),
(33, '2016-07-02', '0000-00-00','TRWA' ),
(34, '2017-12-26', '0000-00-00','TRWA' ),
(35, '2020-01-30', '0000-00-00','TRWA' ),
(36, '2015-10-02', '0000-00-00','TRWA' ),
(37, '1997-12-17', '0000-00-00','TRWA' ),
(38, '2015-07-22', '0000-00-00','TRWA' ),
(39, '1998-11-26', '0000-00-00','TRWA' ),
(40, '2008-08-12', '0000-00-00','TRWA' ),
(41, '2021-02-26', '0000-00-00','TRWA' ),
(42, '1996-11-15', '0000-00-00','TRWA' ),
(43, '2005-07-27', '0000-00-00','TRWA' ),
(44, '2008-10-12', '0000-00-00','TRWA' ),
(45, '2018-04-05', '0000-00-00','TRWA' ),
(46, '2002-08-31', '0000-00-00','TRWA' ),
(47, '2013-03-05', '0000-00-00','TRWA' ),
(48, '2016-07-02', '0000-00-00','TRWA' ),
(49, '2007-10-25', '0000-00-00','TRWA' ),
(50, '2020-04-20', '0000-00-00','TRWA' );


/*-----WIDOKI----*/

/*WIDOK TWORZĄCY UNIKALNE ADRESY E-MAIL DLA PRACOWNIKÓW*/

CREATE VIEW maile_pracowników AS SELECT p.id_pracownika, p.imie, nazwisko, s.nazwa_stanowiska, d.nazwa_dzialu, CONCAT(imie, nazwisko,id_pracownika, '@dbms.com') AS email
FROM pracownicy AS p, stanowiska AS s, dzialy AS d WHERE p.id_stanowiska=s.id_stanowiska AND s.id_dzialu=d.id_dzialu;

/*WIDOK WYŚWIETLAJĄCY ILOŚĆ PEŁNYCH LAT ZATRUDNIENIA PRACOWNIKÓW*/

CREATE VIEW ilosc_lat_zatrudnienia AS 
SELECT id_pracownika, floor((DATEDIFF(now(), zatrudnienie.data_od))/365) AS ilosc_lat FROM zatrudnienie;

/*WIDOK WYŚWIETLAJĄCY MIESIĘCZNE WYNAGRODZENIE, ROCZNE WYNAGRODZENIE ORAZ PREMIĘ ROCZNĄ NA PODSTAWIE*/
/*MIESIĘCZNEGO WYNAGRODZENIA ORAZ ILOŚCI PRZEPRACOWANYCH LAT*/

DROP VIEW IF EXISTS tabela_wynagrodzen;
CREATE VIEW tabela_wynagrodzen AS
SELECT p.id_pracownika, p.imie, p.nazwisko, p.wynagrodzenie AS wynagrodzenie_msc, 
p.wynagrodzenie*12 AS wynagrodzenie_rocz, p.wynagrodzenie*12*0.05+ilz.ilosc_lat*100 AS premia_rocz, 
p.wynagrodzenie*12+p.wynagrodzenie*12*0.05+ilz.ilosc_lat*100 total_wyn_rocz FROM pracownicy AS p, 
ilosc_lat_zatrudnienia AS ilz 
WHERE p.id_pracownika=ilz.id_pracownika;

/*------PROCEDURY----*/

/*PROCEDURA WYŚWIETLAJĄCA MIESIĘCZNE I ROCZNE WYNAGRODZENIE ORAZ ROCZNĄ PREMIĘ PRACOWNIKA ZA POMOCĄ id_pracownika*/

DROP PROCEDURE IF EXISTS pokaz_wynagrodzenie;
DELIMITER //
CREATE PROCEDURE pokaz_wynagrodzenie (podaj_id_pracownika int(5))
BEGIN
SELECT * FROM tabela_wynagrodzen WHERE id_pracownika=@podaj_id_pracownika;
END//
DELIMITER ;

/*PRZYKŁADOWE WYWOŁANIE PROCEDURY pokaz_wynagrodzenie*/

/*SET @podaj_id_pracownika='2';*/
/*CALL `pokaz_wynagrodzenie`(@podaj_id_pracownika);*/

/*------WYZWALACZE-----*/

/*PO DODANIU NOWEGO PRACOWNIKA DO TABELI 'pracownicy', WYZWALACZ UZUPEŁNIA W TABELI 'zatrudnienie'*/
/*id_pracownika ORAZ DATĘ ZATRUDNIENIA PRZYJMUJĄC OBECNĄ DATĘ*/

DROP TRIGGER IF EXISTS uzup_zatrudnienia;
DELIMITER $$
CREATE TRIGGER uzup_zatrudnienia AFTER INSERT ON pracownicy FOR EACH ROW
BEGIN
INSERT INTO zatrudnienie VALUES (NEW.id_pracownika, NOW(), '0000-00-00', 'TRWA' );
END
$$
DELIMITER ;

/*PO USUNIĘCIU PRACOWNIKA Z TABELI pracownicy, WYZWALACZ PRZENOSI DANE Z TABELI pracownicy DO*/
/*TABELI pracownicy_historia, A TAKŻE PRZENOSI DANE Z TABELI zatrudnienie DO TABELI zatrudnienie_historia*/
/*PRZY CZYM AKTUALIZUJE DATĘ ZAKOŃCZENIA ZATRUDNIENIA O PRZYJMUJĄC OBECNĄ DATĘ*/ 

DROP TRIGGER IF EXISTS usun_pracownika;
DELIMITER $$
CREATE TRIGGER usun_pracownika BEFORE DELETE ON pracownicy FOR EACH ROW
BEGIN
INSERT INTO pracownicy_historia SELECT * FROM pracownicy WHERE id_pracownika=OLD.id_pracownika;
INSERT INTO zatrudnienie_historia SELECT * FROM zatrudnienie WHERE id_pracownika=OLD.id_pracownika;
UPDATE zatrudnienie_historia SET data_do=NOW(), status='USTAŁO' WHERE id_pracownika_h=OLD.id_pracownika;
END
$$
DELIMITER ;