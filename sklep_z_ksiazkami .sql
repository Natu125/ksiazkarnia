-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 11, 2024 at 03:39 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep_z_ksiazkami`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres_dostawy`
--

CREATE TABLE `adres_dostawy` (
  `id_adresu_dostawy` int(11) NOT NULL,
  `kraj` varchar(35) NOT NULL,
  `miejscowosc` varchar(35) NOT NULL,
  `ulica_i_lokal` varchar(35) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `id_kto_dodal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `adres_dostawy`
--

INSERT INTO `adres_dostawy` (`id_adresu_dostawy`, `kraj`, `miejscowosc`, `ulica_i_lokal`, `id_uzytkownika`, `id_kto_dodal`) VALUES
(1, 'mars', 'chonolulu', 'ulicowa 0', 23, 23),
(2, 'Polska', 'Sosnowiec', 'Będzińska 11', 22, 22),
(3, 'Polska', 'Sosnowiec', 'Będzińska 11', 22, 22),
(4, 'Polska', 'Sosnowiec', 'Będzińska 12', 22, 22),
(5, 'Polska', 'Sosnowiec', 'Będzińska 11', 28, 28),
(10, 'Polska', 'Sosnowiec', 'Będzińska 11', 29, 29);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `imie` varchar(35) NOT NULL,
  `nazwisko` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_autora`, `imie`, `nazwisko`) VALUES
(1, 'Ktoś', 'Dunno'),
(2, 'Henryk', 'Sienkiewicz'),
(3, 'Jan', 'Brzechwa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `katalog`
--

CREATE TABLE `katalog` (
  `id_katalogu` int(11) NOT NULL,
  `id_roli` int(11) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `id_kto_dodal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `katalog`
--

INSERT INTO `katalog` (`id_katalogu`, `id_roli`, `id_uzytkownika`, `id_kto_dodal`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(4, 3, 18, 18),
(5, 3, 19, 19),
(6, 3, 20, 20),
(7, 3, 21, 21),
(8, 3, 22, 22),
(9, 3, 23, 23),
(10, 3, 24, 24),
(11, 3, 25, 25),
(13, 3, 27, 27),
(14, 3, 28, 28),
(16, 1, 23, 1),
(17, 2, 23, 1),
(18, 3, 29, 29),
(19, 3, 30, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id_produktu` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `cena` float NOT NULL,
  `opis` varchar(1000) DEFAULT NULL,
  `dostepnosc` int(11) NOT NULL,
  `obrazek` varchar(150) DEFAULT NULL,
  `id_autora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`id_produktu`, `nazwa`, `cena`, `opis`, `dostepnosc`, `obrazek`, `id_autora`) VALUES
(1, 'W pustyni i w puszczy', 12.99, 'Henryk Sienkiewicz to przede wszystkim autor „Trylogii“ oraz „Quo Vadis“, za które otrzymał Literacką Nagrodę Nobla. Jednak w dorobku tego mistrza polskiej prozy znajdują się również inne cenne pozycje. Jedną z nich jest niewątpliwie „W pustyni w i puszczy“, książka, którą w młodości czytał chyba każdy z nas, a która mimo upływającego czasu nic nie straciła ze swego czaru. Wystarczy ponownie sięgnąć po historię przygód Stasia i Nel, aby przekonać się, że współczesne książki dla młodzieży nijak nie mogą rywalizować z tą powieścią Sienkiewicza.\r\n', 0, 'pustynia.jpg', 2),
(2, 'Potop', 27.99, 'Seria \"Klasyka literatury\". Tekst opatrzono wskazówkami interpretacyjnymi i hasłami ułatwiającymi nawigację po książce – dzięki nim łatwo znaleźć potrzebny w trakcie omawiania lektury fragment, zgromadzić materiały do wypracowań i ustnych wypowiedzi, zapamiętać najważniejsze informacje i utrwalić znajomość lektury.', 40, 'potop.jpg', 2),
(4, 'Janko Muzykant', 12.99, 'Lektura z opracowaniem to znakomita pomoc i inspiracja dla uczniów oraz nauczycieli. Tekst opatrzono wskazówkami interpretacyjnymi i hasłami ułatwiającymi nawigację po książce – dzięki nim łatwo znaleźć potrzebny w trakcie omawiania lektury fragment, zgromadzić materiały do wypracowań i ustnych wypowiedzi, zapamiętać najważniejsze informacje i utrwalić znajomość lektury. Zamieszczone na końcu książki opracowanie podporządkowano podstawie programowej. Zawiera ono ciekawy biogram autora, streszczenie, mapę mentalną, najważniejsze zagadnienia omawiane na lekcjach, a także wiele inspirujących informacji, podpowiedzi i zadań, dzięki którym czytanie lektury staje się twórczą przygodą.', 9, 'janko.jpg', 2),
(7, 'Pralnia serc Marigold', 99.99, 'Opis nowego produktu', 1, 'pralnia.jpg', 1),
(9, 'Krzyżacy', 18.99, 'W Krzyżakach Sienkiewicz opisuje chwile wspaniałych zwycięstw polskiego rycerstwa i wyraża niezłomną wiarę w siłę narodu polskiego, w jego odwagę i męstwo prowadzące prosto do zwycięstwa. Na tle znaczących wydarzeń historycznych autor przedstawił dzieje barwnych i wyrazistych postaci.\r\n\r\nBohaterami powieści są: Jurand ze Spychowa i jego córka Danusia, polski rycerz Maćko i jego bratanek Zbyszko z Bogdańca. Zbyszko, dzielny młody rycerz, zostaje skazany na stracenie za napaść na posła krzyżackiego. Z opresji ratuje go Danusia, zostając damą jego serca. Jednak szczęście młodych nie trwa długo, gdyż dziewczyna zostaje uprowadzona przez Krzyżaków. Czy Zbyszkowi i Jurandowi uda się odnaleźć i uwolnić Danusię? Czy zakonnicy poniosą karę za swoje niecne postępki?', 10, 'krzyzacy.jpg', 2),
(10, 'Akademia pana Kleksa', 19.99, 'Jest to pierwsza część baśniowej trylogii Jana Brzechwy, arcydzieło, do przeczytania którego nikogo nie trzeba zachęcać. Tytułową Akademię, położoną w ogromnym parku pełnym jarów i wąwozów, otacza wysoki mur, w którym jedna obok drugiej mieszczą się żelazne furtki, zamknięte na srebrne kłódeczki, a każda z nich to drzwi do innej bajki... Wraz z Panem Kleksem - niezwykłym nauczycielem i wynalazcą - bohaterowie opowieści odwiedzają baśniowe królestwa i przeżywają niewiarygodne przygody, a z każdej wyprawy wracają mądrzejsi.', 40, 'akademia.jpg', 3),
(11, 'Sto bajek', 39.99, 'W tej pięknej skarbnicy najpopularniejszych wierszy Jana Brzechwy dzieci odkryją chrząszcza, który brzmi w trzcinie, kaczkę-dziwaczkę, żurawia i czaplę, srokę, co siedzi na żerdzi, ślimaka, sójkę, która wybierała się za morze, wyspy Bergamuty, gdzie widziano kota w butach, stonogę, suma matematyka, Prota i Filipa, jajko mądrzejsze od kury, kłamczuchę, stryjka, co zamienił siekierkę na kijek, samochwałę, kokoszkę smakoszkę i wiele, wiele innych cudownych utworów, które stanowią bezcenny kanon polskiej poezji dziecięcej. Wiersze Jana Brzechwy żyją od pokoleń w pamięci małych i dużych Polaków, a ich popularność jest tak wielka, że liczne cytaty utrwaliły się w postaci powiedzonek czy aforyzmów i przeszły do języka potocznego, stając się nierozerwalną częścią naszego dziedzictwa narodowego. Ta piękna książka prezentowa – opatrzona pełnymi ciepła i radości ilustracjami, a wydana z edytorską starannością w postaci albumowej – stanie się ulubioną pozycją w biblioteczce każdego dziecka!', 40, 'sto.jpg', 3),
(12, 'Szelmostwa Lisa Witalisa', 29.99, '\"Szelmostwa lisa Witalisa\" opisują historię lisa, który zapragnął mieć wszystko. Jest to przeciętnej urody stworzenie. Uważa, że może osiągnąć sukces, oszukując innych. Pewnego dnia zamieszkuje w lesie koło Łodzi. Dzięki podstępowi szybko przejmuje władzę. Mieszkańcy lasu mianują go prezydentem. Niestety od tej pory wszystko przestaje się dla lisa układać. Mieszkańcy odkrywają jego niecne uczynki i postanawiają go osądzić. Lis zostaje ukarany.\r\n', 50, 'lis.jpg', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rola`
--

CREATE TABLE `rola` (
  `id_roli` int(11) NOT NULL,
  `nazwa` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `rola`
--

INSERT INTO `rola` (`id_roli`, `nazwa`) VALUES
(1, 'admin'),
(2, 'pracownik'),
(3, 'user');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id_uzytkownika` int(11) NOT NULL,
  `imie` varchar(35) NOT NULL,
  `nazwisko` varchar(35) NOT NULL,
  `email` varchar(35) NOT NULL,
  `haslo` varchar(80) NOT NULL,
  `data_rejestracji` date NOT NULL DEFAULT current_timestamp(),
  `id_kto_zarejestrowal` int(11) DEFAULT NULL,
  `id_adresu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id_uzytkownika`, `imie`, `nazwisko`, `email`, `haslo`, `data_rejestracji`, `id_kto_zarejestrowal`, `id_adresu`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '$2y$10$Ma8XUzJ2S.FXJsO62jQ2t.3yuFrbl5OnOsEZ4DCOg9mLNsppYWHz6', '2024-05-28', NULL, NULL),
(2, 'pracownik', 'pracownik', 'pracownik@pracownik.com', '$2y$10$A4OiHKVnnfjDWCy4PtUOU.3bXWxoGtQHWOQ8qlimPhYJqHRqqxJoq', '2024-05-28', 1, NULL),
(6, 's', 's', 'b', '$2y$10$QtOR7QKOXzb9A9b4AGQFje191SNg', '2024-05-28', 2, NULL),
(7, 'byle', 'co', 'byle@co.nie', '$2y$10$sjncCbwU8ZuKQO2U.aQJ9.3ong./', '2024-05-28', 2, NULL),
(8, 'asdf', 'asdfghjk', 'n@o2.com', '$2y$10$Bw2VTf61G3Be.iapI1W/e.OHoVg.', '2024-05-29', 2, NULL),
(9, 'nk', 'km', 'bnm', '$2y$10$B.2eL0rdXpqxtbbKSuTpdOsP/A8a', '2024-05-31', 2, NULL),
(10, 'nata', 'nata', 'n@o2.pl', '$2y$10$THxeFvMTJxbj5Skz46jCx.qzBqEp', '2024-05-31', 2, NULL),
(11, 'fsdgfrth', '4dwgtfrhyju', 'm@o2.pl', '$2y$10$6.fapOmQbiNw/xYzj5OW2.glwU2o', '2024-05-31', 2, NULL),
(12, '1234', '1234', '2@o2.pl', '$2y$10$Ml62PDQwPbudZJNczgvMpuObH/0Y', '2024-05-31', 2, NULL),
(13, 'cgvbjnm', 'dfghjkl', 'vbjhnk@o2.pl', '$2y$10$ykFa8pGZEBQYOqTkCPecvO6p46VD', '2024-05-31', 2, NULL),
(14, 'cgvbjnm, .', '21345678', 'vbj@o2.pl', '$2y$10$kOXPVgTFpvi9tSTs6m1g8OA1ZbVR', '2024-05-31', 2, NULL),
(15, 'drcfgvbhjnk', 'dcfgvbhjnkm', 'ftvgbhjn@o2.pl', '$2y$10$yGENUzdlWo7vd3jCuPjMlecsWeju', '2024-05-31', 2, NULL),
(16, 'drcfgvbhjnk', 'dcfgvbhjnkm', 'ftvgbh@o2.pl', '$2y$10$.cfl6Wy96tc4tHHys3OxVeinTUzQ', '2024-05-31', 2, NULL),
(17, 'drcfgvbhjnk', 'dcfgvbhjnkm', 'fth@o2.pl', '$2y$10$NZd5UmNT.uGFq6q1GEFDVOtoUfUc', '2024-05-31', 2, NULL),
(18, 'sxdrcfgvbhjnk', 'dfcgvhbj', 'dfgh@o2.pl', '$2y$10$sXNNoZtJ6vWQkB8fesnM9uE8AaBl', '2024-05-31', 18, NULL),
(19, 'sadcv', 'saddv', 'o2@o2.pl', '$2y$10$VIeiVVxTwXYN3RpBm4a1PuJOOOj6', '2024-06-01', 19, NULL),
(20, 'nat', 'nat', 'nat@o2.pl', '$2y$10$.XkrYW.uiaSOxAVqk8s.QeANwbRyfJW4xY8mL5Nr32JCCDRcI.Lw.', '2024-06-01', 20, NULL),
(21, 'xsfvbgnbvcx', 'asdbgfnh', '5@o2.pl', '$2y$10$HOrDwxETLUjHpSicj8vcZek.nWHRB1bUkxlNehBFABfHqHtCPYR1y', '2024-06-01', 21, NULL),
(22, 'anna', 'moś', '8@o2.pl', '$2y$10$QxugMujgqnU/YNxcXs5t2u6A6z7j5MuTHhUb932iilJv8JSfnxn7m', '2024-06-01', 22, 2),
(23, 'tak', 'tak', 'tak@tak.tak', '$2y$10$8qTNupp1HTNaCRHbIbRFduyrgmuDQKF8lvSZPGQdnzfK7qd2xeKtq', '2024-06-04', 23, 1),
(24, 'asdfgbnhj', 'dsfgh', '123234r45@o2.pl', '$2y$10$utNC/5tIiqLKAKcogTWPo.N4xdtvW7xwNuVG3XiMlMX4QWdlslhEa', '2024-06-08', 24, NULL),
(25, 'saxgfvbnh', 'dcgfvb', 'dsfgrh@02.pl', '$2y$10$6UPkJ89k8fvKyiB0RFavAu0H6tdVKB24tUjoQKPIsx9LWxf.v3lGO', '2024-06-08', 25, NULL),
(26, 'bbbbbbbbb', 'bbbbbbbbbbbbbbbbb', 'bbbbb@o2.pl', '$2y$10$Ma8XUzJ2S.FXJsO62jQ2t.3yuFrbl5OnOsEZ4DCOg9mLNsppYWHz6', '2024-06-08', 26, NULL),
(27, 'dfvgbhnyj', 'dwcefvrg', 'swdef@02.pl', '$2y$10$A4OiHKVnnfjDWCy4PtUOU.3bXWxoGtQHWOQ8qlimPhYJqHRqqxJoq', '2024-06-08', 27, NULL),
(28, 'abcd', 'bcda', 'abc@o2.pl', '$2y$10$TvXokbwuAQHoftdD5EARcOB5UVU8.byu2WvxbgQn8eAU3qLoXRrxW', '2024-06-10', 28, 5),
(29, 'Grześ ', 'Pan', 'pan@o2.pl', '$2y$10$KjMSHaSzlaeW1hByYA5z3eVO4.isA32rVRjba/bl64M2LjKngS5Wi', '2024-06-11', 29, 10),
(30, 'qswdfsvbg', 'asdfv', '22222@o2.pl', '$2y$10$qMPXnLAPaJxhlmAMtzRVsOE02GTUNZKEbQAe32Imj7xowJ2OI7ZOm', '2024-06-11', 30, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id_zamowienia` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `id_adresu_dostawy` int(11) DEFAULT NULL,
  `id_klienta` int(11) NOT NULL,
  `suma` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zamowienie`
--

INSERT INTO `zamowienie` (`id_zamowienia`, `data`, `id_adresu_dostawy`, `id_klienta`, `suma`) VALUES
(12, '2024-06-08', NULL, 22, 12.99),
(13, '2024-06-08', NULL, 22, 12.99),
(14, '2024-06-08', NULL, 22, 168.93),
(15, '2024-06-08', NULL, 22, 395.86),
(16, '2024-06-08', NULL, 22, 12.99),
(17, '2024-06-10', NULL, 28, 138.95),
(18, '2024-06-10', NULL, 28, 12.99),
(19, '2024-06-11', 10, 29, 3689.16),
(20, '2024-06-11', 10, 29, 12.99),
(21, '2024-06-11', 10, 29, 38.97),
(22, '2024-06-11', 10, 29, 389.7),
(23, '2024-06-11', 10, 29, 12.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie_produkt`
--

CREATE TABLE `zamowienie_produkt` (
  `id_z_p` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `kwota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zamowienie_produkt`
--

INSERT INTO `zamowienie_produkt` (`id_z_p`, `ilosc`, `id_zamowienia`, `id_produktu`, `kwota`) VALUES
(15, 1, 12, 1, 12.99),
(16, 1, 13, 4, 12.99),
(17, 3, 14, 9, 56.97),
(18, 4, 14, 2, 111.96),
(19, 2, 15, 12, 59.98),
(20, 12, 15, 2, 335.88),
(21, 1, 16, 4, 12.99),
(22, 1, 17, 9, 18.99),
(23, 4, 17, 12, 119.96),
(24, 1, 18, 1, 12.99),
(25, 284, 19, 1, 3689.16),
(26, 1, 20, 1, 12.99),
(27, 3, 21, 1, 38.97),
(28, 30, 22, 1, 389.7),
(29, 1, 23, 4, 12.99);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres_dostawy`
--
ALTER TABLE `adres_dostawy`
  ADD PRIMARY KEY (`id_adresu_dostawy`),
  ADD KEY `id_kto_dodał` (`id_kto_dodal`),
  ADD KEY `id_użytkownika` (`id_uzytkownika`);

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indeksy dla tabeli `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id_katalogu`),
  ADD KEY `id_roli` (`id_roli`),
  ADD KEY `id_użytkownika` (`id_uzytkownika`),
  ADD KEY `id_kto_dodał` (`id_kto_dodal`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id_produktu`),
  ADD KEY `id_autora` (`id_autora`);

--
-- Indeksy dla tabeli `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`id_roli`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id_uzytkownika`),
  ADD KEY `id_adres_domyślny` (`id_adresu`),
  ADD KEY `id_kto_zarejestrował` (`id_kto_zarejestrowal`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `id_adresu_dostawy` (`id_adresu_dostawy`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- Indeksy dla tabeli `zamowienie_produkt`
--
ALTER TABLE `zamowienie_produkt`
  ADD PRIMARY KEY (`id_z_p`),
  ADD KEY `id_zamówienia` (`id_zamowienia`),
  ADD KEY `id_produktu` (`id_produktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adres_dostawy`
--
ALTER TABLE `adres_dostawy`
  MODIFY `id_adresu_dostawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id_katalogu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `id_roli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id_uzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `zamowienie_produkt`
--
ALTER TABLE `zamowienie_produkt`
  MODIFY `id_z_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adres_dostawy`
--
ALTER TABLE `adres_dostawy`
  ADD CONSTRAINT `adres_dostawy_ibfk_1` FOREIGN KEY (`id_kto_dodal`) REFERENCES `uzytkownik` (`id_uzytkownika`),
  ADD CONSTRAINT `adres_dostawy_ibfk_2` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id_uzytkownika`);

--
-- Constraints for table `katalog`
--
ALTER TABLE `katalog`
  ADD CONSTRAINT `katalog_ibfk_1` FOREIGN KEY (`id_roli`) REFERENCES `rola` (`id_roli`),
  ADD CONSTRAINT `katalog_ibfk_2` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id_uzytkownika`),
  ADD CONSTRAINT `katalog_ibfk_3` FOREIGN KEY (`id_kto_dodal`) REFERENCES `uzytkownik` (`id_uzytkownika`);

--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`);

--
-- Constraints for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`id_adresu`) REFERENCES `adres_dostawy` (`id_adresu_dostawy`),
  ADD CONSTRAINT `uzytkownik_ibfk_2` FOREIGN KEY (`id_kto_zarejestrowal`) REFERENCES `uzytkownik` (`id_uzytkownika`);

--
-- Constraints for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`id_adresu_dostawy`) REFERENCES `adres_dostawy` (`id_adresu_dostawy`),
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`id_klienta`) REFERENCES `uzytkownik` (`id_uzytkownika`);

--
-- Constraints for table `zamowienie_produkt`
--
ALTER TABLE `zamowienie_produkt`
  ADD CONSTRAINT `zamowienie_produkt_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienie` (`id_zamowienia`),
  ADD CONSTRAINT `zamowienie_produkt_ibfk_2` FOREIGN KEY (`id_produktu`) REFERENCES `produkt` (`id_produktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
