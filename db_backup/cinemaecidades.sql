-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 26-Jun-2017 às 01:55
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.0.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinemaecidades`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`cinemaecidades`@`localhost` FUNCTION `F_numeroFilmes` () RETURNS INT(10) NO SQL
BEGIN
return (SELECT count(Filme.cod_filme) as NumeroDeFilmes FROM Filme);
END$$

CREATE DEFINER=`cinemaecidades`@`localhost` FUNCTION `F_numFilmesPorAtor` (`nomeAtor` VARCHAR(50)) RETURNS INT(10) NO SQL
BEGIN
return (SELECT count(Filme.cod_filme) 
FROM Filme, Ator, Filme2Ator
WHERE Ator.nome_ator=nomeAtor and Ator.cod_ator=Filme2Ator.cod_ator and Filme.cod_filme=Filme2Ator.cod_filme);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ator`
--

CREATE TABLE `Ator` (
  `cod_ator` int(10) UNSIGNED NOT NULL,
  `nome_ator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Ator`
--

INSERT INTO `Ator` (`cod_ator`, `nome_ator`) VALUES
(23, 'Adrien Brody'),
(18, 'Ansel Elgort'),
(4, 'Antonella Attili'),
(20, 'Ben Kingsley'),
(35, 'Benedict Cumberbatch'),
(28, 'Bengt Ekerot'),
(34, 'Benicio Del Toro'),
(33, 'Brad Pitt'),
(8, 'Cláudia Teixeira'),
(31, 'Connie Nielsen'),
(16, 'Denholm Elliott'),
(3, 'Enzo Cannavale'),
(12, 'Felicity Jones'),
(25, 'Frank Finlay'),
(7, 'Giorgio Cantarini'),
(27, 'Gunnar Björnstrand'),
(15, 'Helena Bonham Carter'),
(38, 'Hugo Weaving'),
(13, 'Irrfan Khan'),
(32, 'Jason Statham'),
(9, 'João César Monteiro'),
(30, 'Joaquin Phoenix'),
(36, 'Keira Knightley'),
(22, 'Liam Neeson'),
(14, 'Maggie Smith'),
(10, 'Manuela de Freitas'),
(37, 'Matthew Goode'),
(26, 'Max von Sydow'),
(19, 'Nat Wolff'),
(39, 'Natalie Portman'),
(6, 'Nicoletta Braschi'),
(1, 'Philippe Noiret'),
(21, 'Ralph Fiennes'),
(5, 'Roberto Benigni'),
(40, 'Rupert Graves'),
(29, 'Russell Crowe'),
(17, 'Shailene Woodley'),
(24, 'Thomas Kretschmann'),
(11, 'Tom Hanks');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ator2Link`
--

CREATE TABLE `Ator2Link` (
  `cod_ator` int(10) UNSIGNED NOT NULL,
  `cod_link` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Ator2Link`
--

INSERT INTO `Ator2Link` (`cod_ator`, `cod_link`) VALUES
(1, 78),
(3, 79),
(4, 80),
(5, 81),
(6, 82),
(7, 83),
(8, 84),
(9, 85),
(10, 86),
(11, 87),
(12, 88),
(13, 89),
(14, 90),
(15, 91),
(16, 92),
(17, 93),
(18, 94),
(19, 95),
(20, 96),
(21, 97),
(22, 98),
(23, 99),
(24, 100),
(25, 101),
(26, 102),
(27, 103),
(28, 104),
(29, 105),
(30, 106),
(31, 107),
(32, 108),
(33, 109),
(34, 110),
(38, 111),
(39, 112),
(40, 113);

-- --------------------------------------------------------

--
-- Estrutura da tabela `DataRealizacao`
--

CREATE TABLE `DataRealizacao` (
  `cod_dataRealizacao` int(10) UNSIGNED NOT NULL,
  `dataRealizacao` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `DataRealizacao`
--

INSERT INTO `DataRealizacao` (`cod_dataRealizacao`, `dataRealizacao`) VALUES
(24, 1901),
(8, 1957),
(19, 1968),
(11, 1985),
(15, 1988),
(10, 1993),
(13, 1995),
(14, 1997),
(17, 1998),
(7, 2000),
(9, 2002),
(1, 2005),
(2, 2014),
(12, 2016);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Era`
--

CREATE TABLE `Era` (
  `cod_era` int(10) UNSIGNED NOT NULL,
  `descricao_era` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Era`
--

INSERT INTO `Era` (`cod_era`, `descricao_era`) VALUES
(8, '2ª Guerra Mundial'),
(9, 'Época de realização do filme'),
(12, 'Finais do século XX'),
(7, 'Futuro'),
(13, 'Futuro próximo'),
(10, 'Idade Média'),
(1, 'Império Romano'),
(11, 'Inícios do século XX');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Filme`
--

CREATE TABLE `Filme` (
  `cod_filme` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `cod_dataRealizacao` int(10) UNSIGNED NOT NULL,
  `cod_realizador` int(10) UNSIGNED NOT NULL,
  `cod_genero` int(10) UNSIGNED NOT NULL,
  `cod_era` int(10) UNSIGNED NOT NULL,
  `cod_linguaOriginal` int(10) UNSIGNED NOT NULL,
  `cod_pontuacao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Filme`
--

INSERT INTO `Filme` (`cod_filme`, `titulo`, `cod_dataRealizacao`, `cod_realizador`, `cod_genero`, `cod_era`, `cod_linguaOriginal`, `cod_pontuacao`) VALUES
(1, 'Nuovo Cinema Paradiso', 15, 13, 9, 11, 4, 1),
(2, 'La vita è bella', 14, 12, 9, 8, 4, 3),
(3, 'A Comédia de Deus', 13, 11, 6, 12, 2, 4),
(4, 'Inferno', 12, 10, 3, 9, 1, 2),
(5, 'A Room with a View', 11, 9, 11, 11, 1, 5),
(6, 'The Fault in Our Stars', 2, 8, 9, 9, 1, 6),
(7, 'Schindler\'s List', 10, 7, 5, 8, 1, 7),
(8, 'The Pianist', 9, 6, 5, 8, 1, 1),
(9, 'Gladiator', 7, 4, 1, 1, 1, 1),
(10, 'Snatch', 7, 3, 7, 9, 1, 9),
(11, 'V for Vendetta', 1, 1, 14, 13, 1, 8),
(12, 'Det sjunde inseglet', 8, 5, 15, 10, 6, 8);

--
-- Acionadores `Filme`
--
DELIMITER $$
CREATE TRIGGER `T_Filme_TituloInseridoComSucesso` BEFORE INSERT ON `Filme` FOR EACH ROW BEGIN
	
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Filme2Ator`
--

CREATE TABLE `Filme2Ator` (
  `cod_filme` int(10) UNSIGNED NOT NULL,
  `cod_ator` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Filme2Ator`
--

INSERT INTO `Filme2Ator` (`cod_filme`, `cod_ator`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 17),
(6, 18),
(6, 19),
(7, 20),
(7, 21),
(7, 22),
(8, 23),
(8, 24),
(8, 25),
(9, 29),
(9, 30),
(9, 31),
(10, 32),
(10, 33),
(10, 34),
(11, 38),
(11, 39),
(11, 40),
(12, 26),
(12, 27),
(12, 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Filme2Link`
--

CREATE TABLE `Filme2Link` (
  `cod_filme` int(10) UNSIGNED NOT NULL,
  `cod_link` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Filme2Link`
--

INSERT INTO `Filme2Link` (`cod_filme`, `cod_link`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(1, 13),
(2, 14),
(3, 15),
(4, 16),
(5, 17),
(6, 18),
(7, 19),
(8, 20),
(9, 21),
(10, 22),
(11, 23),
(12, 24),
(11, 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Filme2Local`
--

CREATE TABLE `Filme2Local` (
  `cod_filme` int(10) UNSIGNED NOT NULL,
  `cod_local` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Filme2Local`
--

INSERT INTO `Filme2Local` (`cod_filme`, `cod_local`) VALUES
(1, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 15),
(5, 12),
(5, 16),
(5, 17),
(5, 4),
(4, 4),
(6, 18),
(6, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23),
(9, 24),
(9, 1),
(10, 25),
(11, 25),
(11, 26),
(11, 27),
(12, 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Genero`
--

CREATE TABLE `Genero` (
  `cod_genero` int(10) UNSIGNED NOT NULL,
  `descricao_genero` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Genero`
--

INSERT INTO `Genero` (`cod_genero`, `descricao_genero`) VALUES
(1, 'Ação'),
(4, 'Animação'),
(3, 'Aventura'),
(5, 'Biografia'),
(6, 'Comédia'),
(7, 'Crime'),
(13, 'Desporto'),
(8, 'Documentário'),
(9, 'Drama'),
(15, 'Fantasia'),
(12, 'Ficção científica'),
(11, 'Romance'),
(14, 'Suspense'),
(10, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura da tabela `LinguaOriginal`
--

CREATE TABLE `LinguaOriginal` (
  `cod_linguaOriginal` int(10) UNSIGNED NOT NULL,
  `linguaOriginal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `LinguaOriginal`
--

INSERT INTO `LinguaOriginal` (`cod_linguaOriginal`, `linguaOriginal`) VALUES
(3, 'Alemão'),
(5, 'Francês'),
(1, 'Inglês'),
(4, 'Italiano'),
(2, 'Português'),
(6, 'Sueco');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Link`
--

CREATE TABLE `Link` (
  `cod_link` int(10) UNSIGNED NOT NULL,
  `link` varchar(2083) NOT NULL,
  `cod_tipoLink` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Link`
--

INSERT INTO `Link` (`cod_link`, `link`, `cod_tipoLink`) VALUES
(1, 'http://www.imdb.com/title/tt0095765/', 1),
(2, 'http://www.imdb.com/title/tt0118799/', 1),
(3, 'http://www.imdb.com/title/tt0112710/', 1),
(4, 'http://www.imdb.com/title/tt3062096/', 1),
(5, 'http://www.imdb.com/title/tt0091867/', 1),
(6, 'http://www.imdb.com/title/tt2582846/', 1),
(7, 'http://www.imdb.com/title/tt0108052/', 1),
(8, 'http://www.imdb.com/title/tt0253474/', 1),
(9, 'http://www.imdb.com/title/tt0172495/', 1),
(10, 'http://www.imdb.com/title/tt0208092/', 1),
(11, 'http://www.imdb.com/title/tt0434409/', 1),
(12, 'http://www.imdb.com/title/tt0050976/', 1),
(13, 'https://www.youtube.com/embed/C2-GX0Tltgw', 4),
(14, 'https://www.youtube.com/embed/8beVLRzEqD0', 4),
(15, 'https://www.youtube.com/embed/jmvS2Q3aigw', 4),
(16, 'https://www.youtube.com/embed/RH2BD49sEZI', 4),
(17, 'https://www.youtube.com/embed/JFIPjRFuaHA', 4),
(18, 'https://www.youtube.com/embed/9ItBvH5J6ss', 4),
(19, 'https://www.youtube.com/embed/gG22XNhtnoY', 4),
(20, 'https://www.youtube.com/embed/BFwGqLa_oAo', 4),
(21, 'https://www.youtube.com/embed/ol67qo3WhJk', 4),
(22, 'https://www.youtube.com/embed/ni4tEtuTccc', 4),
(23, 'https://www.youtube.com/embed/k_13fFIrhPk', 4),
(24, 'https://www.youtube.com/embed/NtkFei4wRjE', 4),
(25, 'https://www.facebook.com/VforVendettaFilm/', 3),
(26, 'http://www.imdb.com/name/nm0868153', 9),
(39, 'http://www.imdb.com/name/nm0000905', 9),
(40, 'http://www.imdb.com/name/nm0599214', 9),
(41, 'http://www.imdb.com/name/nm0000165', 9),
(42, 'http://www.imdb.com/name/nm0412465', 9),
(43, 'http://www.imdb.com/name/nm1837748', 9),
(44, 'http://www.imdb.com/name/nm0000229', 9),
(45, 'http://www.imdb.com/name/nm0000591', 9),
(46, 'http://www.imdb.com/name/nm0000631', 9),
(47, 'http://www.imdb.com/name/nm0005363', 9),
(48, 'http://www.imdb.com/name/nm0574625', 9),
(49, 'http://www.imdb.com/name/nm0000005', 9),
(50, 'https://www.google.pt/maps/place/Roma,+It%C3%A1lia/@41.909986,12.3959136,11z/data=!3m1!4b1!4m5!3m4!1s0x132f6196f9928ebb:0xb90f770693656e38!8m2!3d41.9027835!4d12.4963655', 5),
(51, 'https://www.google.pt/maps/place/Arezzo/@43.461543,11.8673746,15z/data=!4m5!3m4!1s0x132bed43120a98ad:0x12dc843fa008d94!8m2!3d43.4612031!4d11.8757049', 5),
(52, 'https://www.google.pt/maps/place/Tosc%C3%A2nia,+It%C3%A1lia/@43.3500232,9.9079179,8z/data=!3m1!4b1!4m5!3m4!1s0x12d42b531080347b:0xbac6c3ba5b2059ab!8m2!3d43.7710513!4d11.2486208', 5),
(53, 'https://www.google.pt/maps/place/Badia+delle+Sante+Flora+e+Lucilla/@43.4655442,11.8772242,17z/data=!4m5!3m4!1s0x132bed5ac01389e3:0x53d009eedf47df73!8m2!3d43.465576!4d11.879382', 5),
(54, 'https://www.google.com/maps/place/Lisboa,+Portugal/@38.7437396,-9.2302443,12z/data=!3m1!4b1!4m5!3m4!1s0xd19331a61e4f33b:0x400ebbde49036d0!8m2!3d38.7222524!4d-9.1393366', 5),
(55, 'https://www.google.pt/maps/place/Palazzo+Ducale/@45.4337035,12.3382007,17z/data=!3m1!4b1!4m5!3m4!1s0x477eb1d76e418489:0xb809d204dcca74d1!8m2!3d45.4337035!4d12.3403894', 5),
(56, 'https://www.google.pt/maps/place/The+Boboli+Gardens/@43.7624972,11.2462109,17z/data=!3m1!4b1!4m5!3m4!1s0x132a515690734e97:0x40c02f73b03d9b2!8m2!3d43.7624972!4d11.2483996', 5),
(57, 'https://www.google.pt/maps/place/Pitti+Palace/@43.7651533,11.2478194,17z/data=!3m1!4b1!4m5!3m4!1s0x132a515441db99f1:0x5cd0cce4e6f1502a!8m2!3d43.7651533!4d11.2500081', 5),
(58, 'https://www.google.pt/maps/place/Palazzo+Vecchio/@43.7693012,11.2539622,17z/data=!3m1!4b1!4m5!3m4!1s0x132a5400e57893f9:0xe4e22be754c65787!8m2!3d43.7693012!4d11.2561509', 5),
(59, 'https://www.google.pt/maps/place/The+Baptistery+of+St.+John/@43.7731154,11.2528345,17z/data=!3m1!4b1!4m5!3m4!1s0x132a5403bff30525:0x74a3341bfd1857d!8m2!3d43.7731154!4d11.2550232', 5),
(60, 'https://www.google.pt/maps/place/Hagia+Sophia+Museum/@41.008583,28.9779863,17z/data=!3m1!4b1!4m5!3m4!1s0x14cab9be92011c27:0x236e6f6f37444fae!8m2!3d41.008583!4d28.980175', 5),
(61, 'https://www.google.pt/maps/place/Ponte+Vecchio/@43.767925,11.2509548,17z/data=!3m1!4b1!4m5!3m4!1s0x132a56aaa2dcb667:0x40310ae830e702e8!8m2!3d43.767925!4d11.2531435', 5),
(62, 'https://www.google.pt/maps/place/Veneza,+It%C3%A1lia/@45.4053211,12.101559,10z/data=!3m1!4b1!4m5!3m4!1s0x477eb1daf1d63d89:0x7ba3c6f0bd92102f!8m2!3d45.4408474!4d12.3155151', 5),
(63, 'https://www.google.pt/maps/place/Floren%C3%A7a,+It%C3%A1lia/@43.7799368,11.170928,12z/data=!3m1!4b1!4m5!3m4!1s0x132a56a680d2d6ad:0x93d57917efc72a03!8m2!3d43.7695604!4d11.2558136', 5),
(64, 'https://www.google.pt/maps/place/Istambul,+Turquia/@41.0049823,28.7319931,10z/data=!3m1!4b1!4m5!3m4!1s0x14caa7040068086b:0xe1ccfe98bc01b0d0!8m2!3d41.0082376!4d28.9783589', 5),
(65, 'https://www.google.pt/maps/place/Fountain+of+Neptune/@43.1915891,10.7433903,8z/data=!4m8!1m2!2m1!1sfontana+di+nettuno!3m4!1s0x132a5400f902c947:0xd9b8c7f1a6ce383d!8m2!3d43.7695787!4d11.2560028', 5),
(66, 'https://www.google.pt/maps/place/St+Mary+the+Virgin./@51.1862834,0.143981,17z/data=!3m1!4b1!4m5!3m4!1s0x47df507b8f8e04d1:0xa7f25e67135750c9!8m2!3d51.1862834!4d0.1461697', 5),
(67, 'https://www.google.pt/maps/place/Amsterd%C3%A3,+Reino+dos+Pa%C3%ADses+Baixos/@52.3745913,4.8285746,12z/data=!3m1!4b1!4m5!3m4!1s0x47c63fb5949a7755:0x6600fd4cb7c0af8d!8m2!3d52.3702157!4d4.8951679', 5),
(68, 'https://www.google.pt/maps/place/Casa+de+Anne+Frank/@52.3752182,4.8817878,17z/data=!3m1!4b1!4m5!3m4!1s0x47c609c5213e1149:0xd49a5d653e635b0a!8m2!3d52.3752182!4d4.8839765', 5),
(69, 'https://www.google.pt/maps/place/Campo+de+concentra%C3%A7%C3%A3o+de+Auschwitz/@50.0274106,19.1997942,17z/data=!3m1!4b1!4m5!3m4!1s0x4716be32014dffa1:0xe8e173d6821a53c5!8m2!3d50.0274106!4d19.2019829', 5),
(70, 'https://www.google.pt/maps/place/Crac%C3%B3via,+Pol%C3%B4nia/@50.0466814,19.86479,11z/data=!3m1!4b1!4m5!3m4!1s0x471644c0354e18d1:0xb46bb6b576478abf!8m2!3d50.0646501!4d19.9449799', 5),
(71, 'https://www.google.pt/maps/place/Krakowskie+Przedmie%C5%9Bcie,+Warszawa,+Pol%C3%B4nia/@52.2425963,21.0128519,17z/data=!3m1!4b1!4m5!3m4!1s0x471ecc60b44bb807:0x7141555768fcdb46!8m2!3d52.2427371!4d21.0153392', 5),
(72, 'https://www.google.pt/maps/place/Vars%C3%B3via,+Pol%C3%B4nia/@52.232855,20.9211114,11z/data=!3m1!4b1!4m5!3m4!1s0x471ecc669a869f01:0x72f0be2a88ead3fc!8m2!3d52.2296756!4d21.0122287', 5),
(73, 'https://www.google.pt/maps/place/Colosseum/@41.8902102,12.4900422,17z/data=!3m1!4b1!4m5!3m4!1s0x132f61b6532013ad:0x28f1c82e908503c4!8m2!3d41.8902102!4d12.4922309', 5),
(74, 'https://www.google.pt/maps/place/Londres,+Reino+Unido/@51.5285582,-0.241701,11z/data=!3m1!4b1!4m5!3m4!1s0x47d8a00baf21de75:0x52963a5addd52a99!8m2!3d51.5073509!4d-0.1277583', 5),
(75, 'https://www.google.pt/maps/place/Big+Ben/@51.5007292,-0.1268141,17z/data=!3m1!4b1!4m5!3m4!1s0x487604c38c8cd1d9:0xb78f2474b9a45aa9!8m2!3d51.5007292!4d-0.1246254', 5),
(76, 'https://www.google.pt/maps/place/Palace+of+Westminster/@51.5007292,-0.1268141,17z/data=!4m12!1m6!3m5!1s0x487604c38c8cd1d9:0xb78f2474b9a45aa9!2sBig+Ben!8m2!3d51.5007292!4d-0.1246254!3m4!1s0x0:0x7797a8ef74e1f7c!8m2!3d51.4994789!4d-0.1248092', 5),
(77, 'https://www.google.pt/maps/place/Estocolmo,+Su%C3%A9cia/@59.3260668,17.8474639,11z/data=!3m1!4b1!4m5!3m4!1s0x465f763119640bcb:0xa80d27d3679d7766!8m2!3d59.3293235!4d18.0685808', 5),
(78, 'http://www.imdb.com/name/nm0634159', 12),
(79, 'http://www.imdb.com/name/nm0134073', 12),
(80, 'http://www.imdb.com/name/nm0041066', 12),
(81, 'http://www.imdb.com/name/nm0000905', 12),
(82, 'http://www.imdb.com/name/nm0000971', 12),
(83, 'http://www.imdb.com/name/nm0134493', 12),
(84, 'http://www.imdb.com/name/nm0854101', 12),
(85, 'http://www.imdb.com/name/nm0599214', 12),
(86, 'http://www.imdb.com/name/nm0208473', 12),
(87, 'http://www.imdb.com/name/nm0000158', 12),
(88, 'http://www.imdb.com/name/nm0428065', 12),
(89, 'http://www.imdb.com/name/nm0451234', 12),
(90, 'http://www.imdb.com/name/nm0001749', 12),
(91, 'http://www.imdb.com/name/nm0000307', 12),
(92, 'http://www.imdb.com/name/nm0001186', 12),
(93, 'http://www.imdb.com/name/nm0940362', 12),
(94, 'http://www.imdb.com/name/nm5052065', 12),
(95, 'http://www.imdb.com/name/nm1822659', 12),
(96, 'http://www.imdb.com/name/nm0001426', 12),
(97, 'http://www.imdb.com/name/nm0000146', 12),
(98, 'http://www.imdb.com/name/nm0000553', 12),
(99, 'http://www.imdb.com/name/nm0004778', 12),
(100, 'http://www.imdb.com/name/nm0470981', 12),
(101, 'http://www.imdb.com/name/nm0277975', 12),
(102, 'http://www.imdb.com/name/nm0001884', 12),
(103, 'http://www.imdb.com/name/nm0085038', 12),
(104, 'http://www.imdb.com/name/nm0252345', 12),
(105, 'http://www.imdb.com/name/nm0000128', 12),
(106, 'http://www.imdb.com/name/nm0001618', 12),
(107, 'http://www.imdb.com/name/nm0001567', 12),
(108, 'http://www.imdb.com/name/nm0005458', 12),
(109, 'http://www.imdb.com/name/nm0000093', 12),
(110, 'http://www.imdb.com/name/nm0001125', 12),
(111, 'http://www.imdb.com/name/nm0915989', 12),
(112, 'http://www.imdb.com/name/nm0000204', 12),
(113, 'http://www.imdb.com/name/nm0001291', 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Local`
--

CREATE TABLE `Local` (
  `cod_local` int(10) UNSIGNED NOT NULL,
  `nome_local` varchar(60) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `cod_pais` int(10) UNSIGNED NOT NULL,
  `cod_tipoLocal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Local`
--

INSERT INTO `Local` (`cod_local`, `nome_local`, `latitude`, `longitude`, `cod_pais`, `cod_tipoLocal`) VALUES
(1, 'Roma', 41.901085, 12.402422, 1, 2),
(2, 'Badia delle Sante Flora e Lucilla', 43.465576, 11.877193, 1, 1),
(3, 'Arezzo', 43.460918, 11.875334, 1, 2),
(4, 'Toscana', 43.352020, 9.907816, 1, 3),
(5, 'Lisboa', 38.743740, -9.230244, 2, 2),
(6, 'Palazzo Ducale', 45.433704, 12.338201, 1, 1),
(7, 'Giardino di Boboli', 43.762497, 11.246211, 1, 1),
(8, 'Palazzo Pitti', 43.765152, 11.247819, 1, 1),
(9, 'Palazzo Vecchio', 43.769302, 11.253962, 1, 1),
(10, 'Battistero di San Giovanni', 43.773113, 11.252835, 1, 1),
(11, 'Hagia Sophia', 41.008583, 28.977985, 1, 1),
(12, 'Florença', 43.779938, 11.170928, 1, 2),
(13, 'Veneza', 45.405319, 12.101559, 1, 2),
(14, 'Istambul', 41.004982, 28.731993, 9, 2),
(15, 'Ponte Vecchio', 43.767925, 11.250955, 1, 1),
(16, 'Fontana di Nettuno', 43.767925, 11.244389, 1, 1),
(17, 'Saint Mary\'s Church', 51.186283, 0.143981, 4, 1),
(18, 'Amesterdão', 52.374592, 4.828575, 8, 2),
(19, 'Anne Frank Huis', 52.375217, 4.881788, 8, 1),
(20, 'Auschwitz-Birkenau', 50.027412, 19.199795, 6, 1),
(21, 'Cracóvia', 50.046680, 19.864790, 6, 2),
(22, 'Krakowskie Przedmiescie', 52.242596, 21.012852, 6, 1),
(23, 'Varsóvia', 52.232857, 20.921110, 6, 2),
(24, 'Colosseo', 41.890209, 12.490042, 1, 1),
(25, 'Londres', 51.528557, -0.241701, 4, 2),
(26, 'Palace of Westminster', 51.499477, -0.126998, 4, 1),
(27, 'Big Ben', 51.500729, -0.126814, 4, 1),
(28, 'Estocolmo', 59.326069, 17.847464, 7, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Local2Link`
--

CREATE TABLE `Local2Link` (
  `cod_local` int(10) UNSIGNED NOT NULL,
  `cod_link` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Local2Link`
--

INSERT INTO `Local2Link` (`cod_local`, `cod_link`) VALUES
(1, 50),
(2, 53),
(3, 51),
(4, 52),
(5, 54),
(6, 55),
(7, 56),
(8, 57),
(9, 58),
(10, 59),
(11, 60),
(12, 63),
(13, 62),
(14, 64),
(15, 61),
(16, 65),
(17, 66),
(18, 67),
(19, 68),
(20, 69),
(21, 70),
(22, 71),
(23, 72),
(24, 73),
(25, 74),
(26, 75),
(27, 76),
(28, 77);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pais`
--

CREATE TABLE `Pais` (
  `cod_pais` int(10) UNSIGNED NOT NULL,
  `nome_pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Pais`
--

INSERT INTO `Pais` (`cod_pais`, `nome_pais`) VALUES
(3, 'Alemanha'),
(5, 'França'),
(8, 'Holanda'),
(4, 'Inglaterra'),
(1, 'Itália'),
(6, 'Polónia'),
(2, 'Portugal'),
(7, 'Suécia'),
(9, 'Turquia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `PontuacaoIMDb`
--

CREATE TABLE `PontuacaoIMDb` (
  `cod_pontuacao` int(10) UNSIGNED NOT NULL,
  `pontuacao` decimal(3,1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `PontuacaoIMDb`
--

INSERT INTO `PontuacaoIMDb` (`cod_pontuacao`, `pontuacao`) VALUES
(2, '6.2'),
(5, '7.4'),
(4, '7.6'),
(6, '7.8'),
(10, '8.1'),
(8, '8.2'),
(9, '8.3'),
(1, '8.5'),
(3, '8.6'),
(7, '8.9'),
(13, '9.0'),
(11, '9.9');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Realizador`
--

CREATE TABLE `Realizador` (
  `cod_realizador` int(10) UNSIGNED NOT NULL,
  `nome_realizador` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Realizador`
--

INSERT INTO `Realizador` (`cod_realizador`, `nome_realizador`) VALUES
(13, 'Giuseppe Tornatore'),
(3, 'Guy Ritchie'),
(5, 'Ingmar Bergman'),
(9, 'James Ivory'),
(1, 'James McTeigue'),
(11, 'João César Monteiro'),
(8, 'Josh Boone'),
(2, 'Morten Tyldum'),
(4, 'Ridley Scott'),
(12, 'Roberto Benigni'),
(6, 'Roman Polanski'),
(10, 'Ron Howard'),
(7, 'Steven Spielberg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Realizador2Link`
--

CREATE TABLE `Realizador2Link` (
  `cod_realizador` int(10) UNSIGNED NOT NULL,
  `cod_link` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Realizador2Link`
--

INSERT INTO `Realizador2Link` (`cod_realizador`, `cod_link`) VALUES
(13, 26),
(12, 39),
(11, 40),
(10, 41),
(9, 42),
(8, 43),
(7, 44),
(6, 45),
(4, 46),
(3, 47),
(1, 48),
(5, 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `TipoLink`
--

CREATE TABLE `TipoLink` (
  `cod_tipoLink` int(10) UNSIGNED NOT NULL,
  `descricao_tipoLink` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `TipoLink`
--

INSERT INTO `TipoLink` (`cod_tipoLink`, `descricao_tipoLink`) VALUES
(13, 'Ator_Facebook'),
(12, 'Ator_IMDb'),
(10, 'Ator_Instagram'),
(11, 'Ator_Youtube'),
(3, 'Filme_Facebook'),
(1, 'Filme_IMDb'),
(2, 'Filme_Instagram'),
(4, 'Filme_Youtube'),
(5, 'Google Maps'),
(17, 'Local_Facebook'),
(15, 'Local_Youtube'),
(6, 'Realizador_Facebook'),
(9, 'Realizador_IMDb'),
(7, 'Realizador_Instagram'),
(8, 'Realizador_Youtube');

-- --------------------------------------------------------

--
-- Estrutura da tabela `TipoLocal`
--

CREATE TABLE `TipoLocal` (
  `cod_tipoLocal` int(10) UNSIGNED NOT NULL,
  `tipoLocal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `TipoLocal`
--

INSERT INTO `TipoLocal` (`cod_tipoLocal`, `tipoLocal`) VALUES
(2, 'Cidade'),
(1, 'Local'),
(3, 'Região');

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_Filmes2aGuerraMundial`
-- (See below for the actual view)
--
CREATE TABLE `V_Filmes2aGuerraMundial` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_FilmesDrama`
-- (See below for the actual view)
--
CREATE TABLE `V_FilmesDrama` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_FilmesEmItaliaEmItaliano`
-- (See below for the actual view)
--
CREATE TABLE `V_FilmesEmItaliaEmItaliano` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_FilmesPontuacaoMaiorQue8`
-- (See below for the actual view)
--
CREATE TABLE `V_FilmesPontuacaoMaiorQue8` (
`titulo` varchar(100)
,`pontuacao` decimal(3,1) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `V_LinkIMDbFilmesComDataRealizacaoIgualouSuperior2000`
-- (See below for the actual view)
--
CREATE TABLE `V_LinkIMDbFilmesComDataRealizacaoIgualouSuperior2000` (
`dataRealizacao` year(4)
,`titulo` varchar(100)
,`link` varchar(2083)
);

-- --------------------------------------------------------

--
-- Structure for view `V_Filmes2aGuerraMundial`
--
DROP TABLE IF EXISTS `V_Filmes2aGuerraMundial`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cinemaecidades`@`localhost` SQL SECURITY DEFINER VIEW `V_Filmes2aGuerraMundial`  AS  select `Filme`.`titulo` AS `titulo` from (`Filme` join `Era`) where ((`Era`.`descricao_era` = '2ª Guerra Mundial') and (`Era`.`cod_era` = `Filme`.`cod_era`)) ;

-- --------------------------------------------------------

--
-- Structure for view `V_FilmesDrama`
--
DROP TABLE IF EXISTS `V_FilmesDrama`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cinemaecidades`@`localhost` SQL SECURITY DEFINER VIEW `V_FilmesDrama`  AS  select `Filme`.`titulo` AS `titulo` from `Filme` where (`Filme`.`cod_genero` = 9) ;

-- --------------------------------------------------------

--
-- Structure for view `V_FilmesEmItaliaEmItaliano`
--
DROP TABLE IF EXISTS `V_FilmesEmItaliaEmItaliano`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cinemaecidades`@`localhost` SQL SECURITY DEFINER VIEW `V_FilmesEmItaliaEmItaliano`  AS  select `Filme`.`titulo` AS `titulo` from ((((`Filme` join `LinguaOriginal`) join `Filme2Local`) join `Local`) join `Pais`) where ((`Pais`.`nome_pais` = 'Itália') and (`Local`.`cod_local` = `Pais`.`cod_pais`) and (`Local`.`cod_local` = `Filme2Local`.`cod_local`) and (`Filme2Local`.`cod_filme` = `Filme`.`cod_filme`) and (`LinguaOriginal`.`linguaOriginal` = 'Italiano') and (`Filme`.`cod_linguaOriginal` = `LinguaOriginal`.`cod_linguaOriginal`)) ;

-- --------------------------------------------------------

--
-- Structure for view `V_FilmesPontuacaoMaiorQue8`
--
DROP TABLE IF EXISTS `V_FilmesPontuacaoMaiorQue8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cinemaecidades`@`localhost` SQL SECURITY DEFINER VIEW `V_FilmesPontuacaoMaiorQue8`  AS  select `Filme`.`titulo` AS `titulo`,`PontuacaoIMDb`.`pontuacao` AS `pontuacao` from (`Filme` join `PontuacaoIMDb`) where ((`PontuacaoIMDb`.`pontuacao` >= 8) and (`Filme`.`cod_pontuacao` = `PontuacaoIMDb`.`cod_pontuacao`)) order by `PontuacaoIMDb`.`pontuacao` ;

-- --------------------------------------------------------

--
-- Structure for view `V_LinkIMDbFilmesComDataRealizacaoIgualouSuperior2000`
--
DROP TABLE IF EXISTS `V_LinkIMDbFilmesComDataRealizacaoIgualouSuperior2000`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cinemaecidades`@`localhost` SQL SECURITY DEFINER VIEW `V_LinkIMDbFilmesComDataRealizacaoIgualouSuperior2000`  AS  select `DataRealizacao`.`dataRealizacao` AS `dataRealizacao`,`Filme`.`titulo` AS `titulo`,`Link`.`link` AS `link` from ((((`Filme` join `DataRealizacao`) join `Link`) join `TipoLink`) join `Filme2Link`) where ((`DataRealizacao`.`dataRealizacao` >= 2000) and (`Filme`.`cod_dataRealizacao` = `DataRealizacao`.`cod_dataRealizacao`) and (`Filme`.`cod_filme` = `Filme2Link`.`cod_filme`) and (`Link`.`cod_link` = `Filme2Link`.`cod_link`) and (`TipoLink`.`descricao_tipoLink` = 'Filme_IMDb') and (`Link`.`cod_tipoLink` = `TipoLink`.`cod_tipoLink`)) order by `DataRealizacao`.`dataRealizacao` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ator`
--
ALTER TABLE `Ator`
  ADD PRIMARY KEY (`cod_ator`),
  ADD UNIQUE KEY `nome_ator` (`nome_ator`);

--
-- Indexes for table `Ator2Link`
--
ALTER TABLE `Ator2Link`
  ADD KEY `cod_ator` (`cod_ator`),
  ADD KEY `cod_link` (`cod_link`);

--
-- Indexes for table `DataRealizacao`
--
ALTER TABLE `DataRealizacao`
  ADD PRIMARY KEY (`cod_dataRealizacao`),
  ADD UNIQUE KEY `dataRealizacao` (`dataRealizacao`);

--
-- Indexes for table `Era`
--
ALTER TABLE `Era`
  ADD PRIMARY KEY (`cod_era`),
  ADD UNIQUE KEY `descricao_era` (`descricao_era`);

--
-- Indexes for table `Filme`
--
ALTER TABLE `Filme`
  ADD PRIMARY KEY (`cod_filme`),
  ADD KEY `cod_dataRealizacao` (`cod_dataRealizacao`),
  ADD KEY `cod_realizador` (`cod_realizador`),
  ADD KEY `cod_genero` (`cod_genero`),
  ADD KEY `cod_era` (`cod_era`),
  ADD KEY `cod_linguaOriginal` (`cod_linguaOriginal`),
  ADD KEY `cod_pontuacao` (`cod_pontuacao`);

--
-- Indexes for table `Filme2Ator`
--
ALTER TABLE `Filme2Ator`
  ADD KEY `cod_filme` (`cod_filme`),
  ADD KEY `cod_ator` (`cod_ator`);

--
-- Indexes for table `Filme2Link`
--
ALTER TABLE `Filme2Link`
  ADD KEY `cod_filme` (`cod_filme`),
  ADD KEY `cod_link` (`cod_link`);

--
-- Indexes for table `Filme2Local`
--
ALTER TABLE `Filme2Local`
  ADD KEY `cod_filme` (`cod_filme`),
  ADD KEY `cod_local` (`cod_local`);

--
-- Indexes for table `Genero`
--
ALTER TABLE `Genero`
  ADD PRIMARY KEY (`cod_genero`),
  ADD UNIQUE KEY `descricao_genero` (`descricao_genero`);

--
-- Indexes for table `LinguaOriginal`
--
ALTER TABLE `LinguaOriginal`
  ADD PRIMARY KEY (`cod_linguaOriginal`),
  ADD UNIQUE KEY `linguaOriginal` (`linguaOriginal`);

--
-- Indexes for table `Link`
--
ALTER TABLE `Link`
  ADD PRIMARY KEY (`cod_link`),
  ADD KEY `cod_tipoLink` (`cod_tipoLink`);

--
-- Indexes for table `Local`
--
ALTER TABLE `Local`
  ADD PRIMARY KEY (`cod_local`),
  ADD KEY `cod_pais` (`cod_pais`),
  ADD KEY `cod_tipoLocal` (`cod_tipoLocal`);

--
-- Indexes for table `Local2Link`
--
ALTER TABLE `Local2Link`
  ADD KEY `cod_local` (`cod_local`),
  ADD KEY `cod_link` (`cod_link`);

--
-- Indexes for table `Pais`
--
ALTER TABLE `Pais`
  ADD PRIMARY KEY (`cod_pais`),
  ADD UNIQUE KEY `nome_pais` (`nome_pais`);

--
-- Indexes for table `PontuacaoIMDb`
--
ALTER TABLE `PontuacaoIMDb`
  ADD PRIMARY KEY (`cod_pontuacao`),
  ADD UNIQUE KEY `pontuacao` (`pontuacao`);

--
-- Indexes for table `Realizador`
--
ALTER TABLE `Realizador`
  ADD PRIMARY KEY (`cod_realizador`),
  ADD UNIQUE KEY `nome_realizador` (`nome_realizador`);

--
-- Indexes for table `Realizador2Link`
--
ALTER TABLE `Realizador2Link`
  ADD KEY `cod_realizador` (`cod_realizador`),
  ADD KEY `cod_link` (`cod_link`);

--
-- Indexes for table `TipoLink`
--
ALTER TABLE `TipoLink`
  ADD PRIMARY KEY (`cod_tipoLink`),
  ADD UNIQUE KEY `descricao_tipoLink` (`descricao_tipoLink`);

--
-- Indexes for table `TipoLocal`
--
ALTER TABLE `TipoLocal`
  ADD PRIMARY KEY (`cod_tipoLocal`),
  ADD UNIQUE KEY `tipoLocal` (`tipoLocal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ator`
--
ALTER TABLE `Ator`
  MODIFY `cod_ator` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `DataRealizacao`
--
ALTER TABLE `DataRealizacao`
  MODIFY `cod_dataRealizacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `Era`
--
ALTER TABLE `Era`
  MODIFY `cod_era` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `Filme`
--
ALTER TABLE `Filme`
  MODIFY `cod_filme` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Genero`
--
ALTER TABLE `Genero`
  MODIFY `cod_genero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `LinguaOriginal`
--
ALTER TABLE `LinguaOriginal`
  MODIFY `cod_linguaOriginal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Link`
--
ALTER TABLE `Link`
  MODIFY `cod_link` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `Local`
--
ALTER TABLE `Local`
  MODIFY `cod_local` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `Pais`
--
ALTER TABLE `Pais`
  MODIFY `cod_pais` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `PontuacaoIMDb`
--
ALTER TABLE `PontuacaoIMDb`
  MODIFY `cod_pontuacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `Realizador`
--
ALTER TABLE `Realizador`
  MODIFY `cod_realizador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `TipoLink`
--
ALTER TABLE `TipoLink`
  MODIFY `cod_tipoLink` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `TipoLocal`
--
ALTER TABLE `TipoLocal`
  MODIFY `cod_tipoLocal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Ator2Link`
--
ALTER TABLE `Ator2Link`
  ADD CONSTRAINT `Ator2Link_ibfk_cod_ator` FOREIGN KEY (`cod_ator`) REFERENCES `Ator` (`cod_ator`),
  ADD CONSTRAINT `Ator2Link_ibfk_cod_link` FOREIGN KEY (`cod_link`) REFERENCES `Link` (`cod_link`);

--
-- Limitadores para a tabela `Filme`
--
ALTER TABLE `Filme`
  ADD CONSTRAINT `Filme_ibfk_cod_era` FOREIGN KEY (`cod_era`) REFERENCES `Era` (`cod_era`),
  ADD CONSTRAINT `Filme_ibfk_cod_genero` FOREIGN KEY (`cod_genero`) REFERENCES `Genero` (`cod_genero`),
  ADD CONSTRAINT `Filme_ibfk_cod_linguaOriginal` FOREIGN KEY (`cod_linguaOriginal`) REFERENCES `LinguaOriginal` (`cod_linguaOriginal`),
  ADD CONSTRAINT `Filme_ibfk_cod_pontuacao` FOREIGN KEY (`cod_pontuacao`) REFERENCES `PontuacaoIMDb` (`cod_pontuacao`),
  ADD CONSTRAINT `Filme_ibfk_cod_realizador` FOREIGN KEY (`cod_realizador`) REFERENCES `Realizador` (`cod_realizador`),
  ADD CONSTRAINT `Filme_ibfk_dataRealizacao` FOREIGN KEY (`cod_dataRealizacao`) REFERENCES `DataRealizacao` (`cod_dataRealizacao`);

--
-- Limitadores para a tabela `Filme2Ator`
--
ALTER TABLE `Filme2Ator`
  ADD CONSTRAINT `Filme2Ator_ibfk_cod_ator` FOREIGN KEY (`cod_ator`) REFERENCES `Ator` (`cod_ator`),
  ADD CONSTRAINT `Filme2Ator_ibfk_cod_filme` FOREIGN KEY (`cod_filme`) REFERENCES `Filme` (`cod_filme`);

--
-- Limitadores para a tabela `Filme2Link`
--
ALTER TABLE `Filme2Link`
  ADD CONSTRAINT `Filme2Link_ibfk_cod_filme` FOREIGN KEY (`cod_filme`) REFERENCES `Filme` (`cod_filme`),
  ADD CONSTRAINT `Filme2Link_ibfk_cod_link` FOREIGN KEY (`cod_link`) REFERENCES `Link` (`cod_link`);

--
-- Limitadores para a tabela `Filme2Local`
--
ALTER TABLE `Filme2Local`
  ADD CONSTRAINT `Filme2Local_ibfk_cod_filme` FOREIGN KEY (`cod_filme`) REFERENCES `Filme` (`cod_filme`),
  ADD CONSTRAINT `Filme2Local_ibfk_cod_local` FOREIGN KEY (`cod_local`) REFERENCES `Local` (`cod_local`);

--
-- Limitadores para a tabela `Link`
--
ALTER TABLE `Link`
  ADD CONSTRAINT `Link_ibfk_cod_tipoLink` FOREIGN KEY (`cod_tipoLink`) REFERENCES `TipoLink` (`cod_tipoLink`);

--
-- Limitadores para a tabela `Local`
--
ALTER TABLE `Local`
  ADD CONSTRAINT `Local_ibfk_cod_pais` FOREIGN KEY (`cod_pais`) REFERENCES `Pais` (`cod_pais`),
  ADD CONSTRAINT `Local_ibfk_cod_tipoLocal` FOREIGN KEY (`cod_tipoLocal`) REFERENCES `TipoLocal` (`cod_tipoLocal`);

--
-- Limitadores para a tabela `Local2Link`
--
ALTER TABLE `Local2Link`
  ADD CONSTRAINT `Local2Link_ibfk_cod_link` FOREIGN KEY (`cod_link`) REFERENCES `Link` (`cod_link`),
  ADD CONSTRAINT `Local2Link_ibfk_cod_local` FOREIGN KEY (`cod_local`) REFERENCES `Local` (`cod_local`);

--
-- Limitadores para a tabela `Realizador2Link`
--
ALTER TABLE `Realizador2Link`
  ADD CONSTRAINT `Realizador2Link_ibfk_cod_link` FOREIGN KEY (`cod_link`) REFERENCES `Link` (`cod_link`),
  ADD CONSTRAINT `Realizador2Link_ibfk_cod_realizador` FOREIGN KEY (`cod_realizador`) REFERENCES `Realizador` (`cod_realizador`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
