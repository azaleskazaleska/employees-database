# employees-database
Projekt bazy danych na MySQL, przechowującej dane na temat pracowników, ich zatrudnienia oraz struktury firmy.
W bazie zostały dodane widoki oraz triggery, dzięki którym po dodaniu danych o nowym pracowniku, 
automatycznie wygenerowany zostaje jego unikalny adres e-mail oraz zostają dodane informacje w 
tabeli 'zatrudnienie' dotyczące okresu rozpoczęcia zatrudnienia. Kolejny trigger pozwala na automatyczne 
gromadzenie danych byłych pracowników w tabeli 'zatrudnienie_historia' poprzez przypisanie daty zakończenia 
zatrudnienia jako daty usunięcia pracownika z bazy. W bazie użyto również procedury pozwalającej na sprawne 
pobieranie informacji na temat rocznych oraz miesięcznych wynagrodzeniach lub premiach pracowników.

![employees_model](https://user-images.githubusercontent.com/111015415/197410078-a526f25f-7d31-49a9-b6d7-8a4ab4aed19a.png)
