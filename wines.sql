-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2018 at 01:38 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wines`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `msg` varchar(2000) DEFAULT NULL,
  `contactdate` datetime DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  `answerdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `msg`, `contactdate`, `answer`, `answerdate`) VALUES
(1, 'Pedro Ferreira', 'pedroferreira2005@gmail.com', NULL, 'Teste de contacto', '2017-01-23 22:21:39', 'Visto', '2017-11-17 17:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `flag` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `lang`, `name`, `flag`) VALUES
(1, 1, 'Portugal', '');

-- --------------------------------------------------------

--
-- Table structure for table `destak`
--

CREATE TABLE `destak` (
  `wid` int(11) NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `dobsBE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destak`
--

INSERT INTO `destak` (`wid`, `obs`, `dobsBE`) VALUES
(1, 'Top', 'TOP WIJN'),
(17, 'Reserva do mês', 'goed reserve'),
(26, 'Verde do mês', 'VERDE van de maand'),
(32, 'Boa Reserva', 'Goede Reserve'),
(35, 'Boa reserva', 'Goede reserve'),
(36, 'Boa reserva ', 'Suggesties van Alentejo '),
(39, 'Entre os melhores do mundo', 'Een van de beste  te werld '),
(60, 'Boa Escolha', 'Goed Keuze'),
(61, 'Boa Escolha', 'Een goede keuze'),
(62, 'Rosé de verão ', 'Rosé voor de Zomer');

-- --------------------------------------------------------

--
-- Table structure for table `grape`
--

CREATE TABLE `grape` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `characteristics` varchar(1000) DEFAULT NULL,
  `charact_en` varchar(300) DEFAULT NULL,
  `charact_fr` varchar(300) DEFAULT NULL,
  `charact_be` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grape`
--

INSERT INTO `grape` (`id`, `name`, `characteristics`, `charact_en`, `charact_fr`, `charact_be`) VALUES
(1, 'Loureiro', 'Muito frutada', NULL, NULL, NULL),
(2, 'Touriga Nacional', 'A casta de referencia nos vinhos portugueses', 'The reference letter in Portuguese wines', 'La lettre de référence dans les vins portugais', 'De verwijzing brief in Portugese wijnen'),
(3, 'Rabigato', 'Casta de vinho branco', 'White wine grape', 'vin blanc', 'Witte wijndruif'),
(4, 'Touriga Franca', NULL, NULL, NULL, NULL),
(5, 'Tinta Roriz', NULL, NULL, NULL, NULL),
(6, 'Tinta Cão', '', '', '', ''),
(7, 'Alvarinho', 'Casta muito especial. Muito frutada', '', '', ''),
(8, 'Azal', '', '', '', ''),
(9, 'Trajadura', '', '', '', ''),
(10, 'Arinto', '', '', '', ''),
(11, 'Avesso', '', '', '', ''),
(12, 'Codega do Larinho', '', '', '', ''),
(13, 'Viosinho', '', '', '', ''),
(14, 'Gouveio', '', '', '', ''),
(15, 'Malvasia-Fina', '', '', '', ''),
(16, 'Moscatel', '', '', '', ''),
(17, 'Vinha Velhas', '', '', '', ''),
(18, 'Aragonez', '', '', '', ''),
(19, 'Sauvignom Blanc', '', '', '', ''),
(20, 'Fernão Pires', '', '', '', ''),
(21, 'Alicante Bouchet', '', '', '', ''),
(22, 'Syrah', '', '', '', ''),
(23, 'Antão Vaz', '', '', '', ''),
(24, 'Perrem', '', '', '', ''),
(25, 'Trincadeira', '', '', '', ''),
(27, 'Verdelho', '', '', '', ''),
(28, 'Alfrocheiro Preto', '', '', '', ''),
(29, 'Moreto', '', '', '', ''),
(30, 'Tinta Amarela', '', '', '', ''),
(32, 'Baga', '', '', '', ''),
(34, 'Bical', '', '', '', ''),
(35, 'Maria Gomes', '', '', '', ''),
(36, 'Cerceal', '', '', '', ''),
(37, 'Cabernet Sauvignon', '', '', '', ''),
(38, 'Merlot', '', '', '', ''),
(39, 'Petit verdot', '', '', '', ''),
(47, 'Pinot noir', '', '', '', ''),
(48, 'Chardonnay', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `grapescoll`
--

CREATE TABLE `grapescoll` (
  `id` int(11) NOT NULL,
  `grape1` int(11) NOT NULL,
  `porcent1` int(11) DEFAULT NULL,
  `grape2` int(11) DEFAULT NULL,
  `porcent2` int(11) DEFAULT NULL,
  `grape3` int(11) DEFAULT NULL,
  `porcent3` int(11) DEFAULT NULL,
  `grape4` int(11) DEFAULT NULL,
  `porcent4` int(11) DEFAULT NULL,
  `grape5` int(11) DEFAULT NULL,
  `grape6` int(11) DEFAULT NULL,
  `grape7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `abbreviation` varchar(3) NOT NULL COMMENT 'sigla',
  `name` varchar(50) NOT NULL,
  `flag` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `abbreviation`, `name`, `flag`) VALUES
(1, 'PT', 'Portugues', 'flagPT.jpg'),
(2, 'EN', 'English', 'flagUK.png'),
(3, 'NL', 'Nerlandais', 'flagBE.png'),
(4, 'FR', 'Frances', 'flagFR.png');

-- --------------------------------------------------------

--
-- Table structure for table `locality`
--

CREATE TABLE `locality` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `characteristics` varchar(1000) DEFAULT NULL,
  `charact_en` varchar(300) DEFAULT NULL,
  `charact_fr` varchar(300) DEFAULT NULL,
  `charact_be` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locality`
--

INSERT INTO `locality` (`id`, `name`, `characteristics`, `charact_en`, `charact_fr`, `charact_be`) VALUES
(1, 'NA', NULL, NULL, NULL, NULL),
(2, 'Penafiel', 'Onde está situada a quinta da Aveleda', NULL, NULL, NULL),
(3, 'Regua', 'Região do vinho do Porto', 'Birth of Port Wine', 'Naissance de Port Wine', 'Geboorte van Port'),
(4, 'Estremoz', '', '', '', ''),
(5, 'Vidigueira', '', '', '', ''),
(6, 'Reguengos', '', '', '', ''),
(7, 'S. João da Pesqueira', '', '', '', ''),
(8, 'Ervedosa do Douro', '', '', '', ''),
(9, 'Tabuaço', '', '', '', ''),
(10, 'Santa Marta De Penaguião', '', '', '', ''),
(12, 'Cima Corgo', '', '', '', ''),
(13, 'Monção', '', '', '', ''),
(14, 'Amarante', '', '', '', ''),
(15, 'Sousel', '', '', '', ''),
(16, 'Corgo de Cima', '', '', '', ''),
(17, 'Vila Real', '', '', '', ''),
(18, 'Alpendurada', '', '', '', ''),
(19, 'Anadia', '', '', '', ''),
(20, 'Távora - Varosa', '', '', '', ''),
(21, 'Setubal', '', '', '', ''),
(22, 'Lousã', '', '', '', ''),
(23, 'Borba', '', '', '', ''),
(24, 'Monforte', '', '', '', ''),
(25, 'Portalegre', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oenologist`
--

CREATE TABLE `oenologist` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `obs_en` varchar(300) DEFAULT NULL,
  `obs_fr` varchar(300) DEFAULT NULL,
  `obs_be` varchar(300) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oenologist`
--

INSERT INTO `oenologist` (`id`, `name`, `obs`, `obs_en`, `obs_fr`, `obs_be`, `site`) VALUES
(1, 'NA', NULL, NULL, NULL, NULL, NULL),
(2, 'Francisco Montenegro', 'Trabalha principalmente com vinhos do Douro', NULL, NULL, NULL, ''),
(3, 'José Domingues', '', '', '', '', ''),
(4, 'Rui Reboredo Madeira', '', '', '', '', ''),
(6, 'Winel Lordes Daniel Costa', '', '', '', '', ''),
(7, 'Pedro Sequeira', '', '', '', '', ''),
(8, 'Jorge Alves', '', '', '', '', ''),
(9, 'Filipa Tomaz da Costa', '', '', '', '', ''),
(10, 'João Silva', '', '', '', '', ''),
(11, 'Eduardo Batista', '', '', '', '', ''),
(12, 'Wine Lordes', '', '', '', '', ''),
(13, 'João Gonçalves Gomes', '', '', '', '', ''),
(14, 'Rui MAdeira', '', '', '', '', ''),
(15, 'Luis Cortinhas', '', '', '', '', ''),
(16, 'Jose M. Antunes', '', '', '', '', ''),
(17, 'Manuel Soares', '', '', '', '', ''),
(18, 'Bical', '', '', '', '', ''),
(19, 'Luis Duarte', '', '', '', '', ''),
(20, 'Filipe Teixeira Pinto', '', '', '', '', ''),
(21, 'Sónia Pereira', '', '', '', '', ''),
(22, 'João Nicolau Almeida', '', '', '', '', ''),
(23, 'Osvaldo Amado', '', '', '', '', ''),
(24, 'Orlando Lourenço', '', '', '', '', ''),
(25, 'Oscar Gato', '', '', '', '', ''),
(26, 'Matos e Moura', '', '', '', '', ''),
(27, 'Antonio Rosas', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `packing`
--

CREATE TABLE `packing` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packing`
--

INSERT INTO `packing` (`id`, `name`) VALUES
(1, '75 cl'),
(2, '1 l'),
(3, '1,5 l'),
(4, '3 l'),
(5, '5 l'),
(6, '20 cl Vidro'),
(7, '2l'),
(8, '2,5l'),
(9, '15cl'),
(10, 'Box 6 x 75cl'),
(11, 'Box 12 x 75cl'),
(12, 'Box 3 x 75cl'),
(13, '0,375 cl'),
(14, '70 cl'),
(15, '50 cl');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`, `address`, `country`, `phone`, `mobile`, `email`, `site`) VALUES
(1, 'NA', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Adega cooperativa de Penafiel', '', '', '', '', '', ''),
(3, 'Quinta da Lixa', '', '', '', '', 'quintadalixa@gmail.com', ''),
(4, 'Felgueiras', '', '', '', '', '', ''),
(5, 'Brites de Aguiar, LDA', '', '', '', '', 'britesaguiar@gmail.com', ''),
(6, 'Adega Cooperativa de Lousada', '', '', '', '', '', ''),
(7, 'Natália Neuza correia Cigarro Brás', 'Rua dos Camilos, 107 | 5050-273 Peso da Régua', 'Portugal', '', '', 'comercial100hectares@gmail.com', ''),
(8, 'Aveleda', '', '', '', '', '', ''),
(9, 'Nenúfar', '', '', '', '', '', ''),
(10, 'João Gonçalo Gomes', '', '', '', '', '', ''),
(11, 'Quinta Nova', '', '', '', '', '', ''),
(12, 'M Cunha', '', '', '', '', '', ''),
(13, 'Quinta de Santiago', '', '', '', '', '', ''),
(14, 'Herdade do Sabroso', '', '', '', '', '', ''),
(15, 'Aguias de Moura', '', '', '', '', '', ''),
(16, 'Monte das Serras', '', '', '', '', '', ''),
(17, 'Adega Cooperativa de Vila Real', '', '', '', '', '', ''),
(18, 'Adega Vila Real', '', '', '', '', '', ''),
(19, 'C. da Silva', '', '', '', '', '', ''),
(20, 'Casa Vilacetinho', '', '', '', '', '', ''),
(21, 'Adega Vila Seca', '', '', '', '', '', ''),
(22, 'Caves da Bairrada', '', '', '', '', '', ''),
(23, 'Caves Murganheira', '', '', '', '', '', ''),
(24, 'Quinta do Pessegueiro', '', '', '', '', '', ''),
(25, 'Quinta da Bacalhôa', '', '', '', '', '', ''),
(26, 'Dão Sul', '', '', '', '', '', ''),
(27, 'Adega de Borba', '', '', '', '', '', ''),
(28, 'Herdade do Sobroso', '', '', '', '', '', ''),
(29, 'Quinta das Bajancas', '', '', '', '', '', ''),
(30, 'Herdade de Torre de Palma', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `subtitle` varchar(200) COLLATE utf8_swedish_ci DEFAULT NULL,
  `subtitle_be` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  `subtitle_fr` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  `subtitle_en` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_swedish_ci NOT NULL,
  `description_be` varchar(1000) COLLATE utf8_swedish_ci DEFAULT NULL,
  `description_fr` varchar(1000) COLLATE utf8_swedish_ci DEFAULT NULL,
  `description_en` varchar(1000) COLLATE utf8_swedish_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `pricebuy` decimal(6,2) NOT NULL DEFAULT '0.00',
  `pricesell` decimal(6,2) NOT NULL DEFAULT '0.00',
  `packing` int(11) NOT NULL,
  `obs` varchar(1000) COLLATE utf8_swedish_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `type`, `name`, `image`, `subtitle`, `subtitle_be`, `subtitle_fr`, `subtitle_en`, `description`, `description_be`, `description_fr`, `description_en`, `qty`, `pricebuy`, `pricesell`, `packing`, `obs`, `date`) VALUES
(1, 3, 'Licor Beirão', 'Beirão.PNG', '', '', '', '', 'De cor âmbar e lágrima perfeita, o Licor Beirão é um produto português com um sabor doce e invulgar, que se funde com o seu aroma envolvente, obtido a partir de uma dupla destilação de plantas e sementes aromáticas. O Licor Beirão é preparado com produtos naturais, a partir de uma fórmula secreta criada no século XIX. É ideal para ser bebido como digestivo, puro ou com gelo, mas também é excelente para cocktails, conferindo-lhes o carácter, aroma e sabor que lhe são únicos.', '', '', 'Amber colored and with a perfect drop, Licor Beirão is a Portuguese product with a sweet and unusual taste, which is merged with its enveloping aroma, obtained thanks to a double distillation process of aromatic plants and seeds. Following a secret formula created during the 19th century, Licor Beirão is prepared with natural products. A perfect after-dinner drink, straight up or on the rocks, it is also great for cocktails, bestowing them with its unique character, aroma and taste.', 0, '0.00', '16.04', 14, '', '2017-02-02 23:45:17'),
(2, 0, 'Sobroso', 'Azeite Sobroso.PNG', 'Extra Virgem', '', '', '', 'O Azeite Virgem Extra Herdade do Sobroso é obtido de azeitonas da variedade Galega, provenientes de olival próprio com 100 anos de idade.', '', '', '', 0, '0.00', '7.50', 15, '', '2017-02-03 17:09:05'),
(4, 2, 'Sobroso', 'Azeite Sobroso.PNG', 'Extra Virgem', '', '', '', 'O Azeite Virgem Extra Herdade do Sobroso é obtido de azeitonas da variedade Galega, provenientes de olival próprio com 100 anos de idade.', '', '', '', 0, '0.00', '7.00', 15, '', '2017-02-04 09:51:35'),
(6, 3, 'Fim de Século', 'Fim de Seculo.PNG', 'Aguardente Velha', '', '', '', '', '', '', 'Dark topaz with greenis hues colour. Complex and sweet with notes of smoke, toasted nuts and caramel Slightly burning, smooth and unctuous with excellent flavor in the mouth. A pleasant and persistent ending.', 0, '0.00', '23.45', 14, '38.5% Alcool', '2017-02-04 10:04:25'),
(7, 2, 'Rio Sul', 'Azeite Rio Sul.PNG', 'Virgem', '', '', '', 'Um azeite delicado, e de superior qualidade de aroma suave e fresco. Acidez : 0,5%. Um azeite excelente para utilizar em saladas, e peixes grelhados.', '', '', '', 0, '0.00', '6.50', 1, '', '2017-02-04 10:13:15'),
(8, 3, 'Macieira', 'Macieira.PNG', '', '', '', '', '', 'Brandy Macieira is de traditionele Portugese brandewijn van druiven van de wijnstok Arinto, Periquita, Trincadeira en Fernao Pires. Deze brandy heeft ten minste zes maanden gerijpt in Franse eiken vaten.', '', '', 0, '0.00', '20.95', 2, '', '2017-02-04 10:26:47'),
(9, 3, 'Croft', 'croft.PNG', 'Brandy', '', '', '', '', 'Croft heeft een gouden kleur - Geur: heeft een unieke smaak - Mond: zachte, fluweelachtige smaak VOORBEREIDING: de leeftijd in eiken vaten', '', 'Matured in oak casks, it has a golden colour, smooth and velvet taste, subtle flavour and unique aroma.', 0, '0.00', '21.75', 2, '', '2017-02-05 23:34:53'),
(10, 3, '1920', '1920.PNG', 'Brandy', '', '', '', 'Elaborado a partir das melhores aguardentes vínicas, o Brandy 1920 é uma das marcas mais antigas da Casa \"Carvalho, Ribeiro & Ferreira\". Surgiu no mercado nos finais dos anos 40 como \"Aguardente Velha 1920\".', '', '', 'Portuguese traditional brandy, produced from the selection of the best wine brandies.', 0, '0.00', '19.10', 2, '', '2017-02-05 23:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `type_be` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `type_fr` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  `type_en` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`id`, `type`, `type_be`, `type_fr`, `type_en`) VALUES
(1, 'Vinho', 'Wijn', 'Vin', 'Wine'),
(2, 'Azeite', 'Olijfolie', 'Olive', 'Olive oil'),
(3, 'Aguardentes&Licores', 'brandewijn&likeuren', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `characteristics` varchar(1000) NOT NULL,
  `charact_en` varchar(300) DEFAULT NULL,
  `charact_fr` varchar(300) DEFAULT NULL,
  `charact_be` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `name`, `characteristics`, `charact_en`, `charact_fr`, `charact_be`) VALUES
(1, 'Douro', 'Região dos vinhos do Porto mas onde os outros não ficam atrás.', NULL, NULL, NULL),
(2, 'Vinhos Verdes', 'Minho e Douro Litural', NULL, NULL, NULL),
(3, 'Dão', 'Anadia e Bairrada', NULL, NULL, NULL),
(4, 'Beira Alta', '', NULL, NULL, NULL),
(5, 'Estremadura', 'Ribatejo e estremadura', NULL, NULL, NULL),
(6, 'Setubal', 'Peninsula de Setubal onde Fernão Pires é a casta predominante.', NULL, NULL, NULL),
(7, 'Alentejo', 'Desde Portalegre a Evora.', NULL, NULL, NULL),
(8, 'Bairrada', 'Espumantes', '', '', 'espumantes'),
(9, 'Espumante', 'Espumante', '', '', 'mousserende wijn'),
(10, 'Vinho do Porto', 'Região do Douro', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `soil`
--

CREATE TABLE `soil` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `characteristics` varchar(1000) DEFAULT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `charact_en` varchar(300) DEFAULT NULL,
  `name_fr` varchar(100) DEFAULT NULL,
  `charact_fr` varchar(300) DEFAULT NULL,
  `name_be` varchar(100) DEFAULT NULL,
  `charact_be` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soil`
--

INSERT INTO `soil` (`id`, `name`, `characteristics`, `name_en`, `charact_en`, `name_fr`, `charact_fr`, `name_be`, `charact_be`) VALUES
(1, 'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Calcario', 'n.a.', 'limestone', 'n.a.', 'calcaire', 'n.a.', 'kalksteen', 'n.a.'),
(3, 'Xisto', '', 'Shale', '', 'schiste', '', 'schilfersteen', ''),
(4, 'Granitico arenoso', '', 'granitic sandy', '', 'sable granitique', '', 'granitic sandy', ''),
(5, 'Basalto', '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Franco argiloso', '', '', '', '', '', '', ''),
(7, 'Argilo-Calcario', '', '', '', '', '', '', ''),
(8, 'Granitico', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `cookie` varchar(200) NOT NULL,
  `createdate` date NOT NULL,
  `counter` int(11) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `lastdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`cookie`, `createdate`, `counter`, `lang`, `lastdate`) VALUES
('1511266751760', '2017-11-21', 9, '', '2017-11-21 12:19:11'),
('1511266968871', '2017-11-21', 2, '', '2017-11-21 12:22:51'),
('1511268049187', '2017-11-21', 3, '', '2017-11-21 12:40:49'),
('1511268181248', '2017-11-21', 4, '', '2017-11-21 12:43:01'),
('1511328182063', '2017-11-21', 4, '', '2017-11-21 12:23:53'),
('1512395127275', '2017-12-04', 3, 'pt-PT', '2017-12-04 13:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `wcomments`
--

CREATE TABLE `wcomments` (
  `wine` int(11) NOT NULL,
  `cookie` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `comment` blob NOT NULL,
  `stars` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wine`
--

CREATE TABLE `wine` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `winetype` int(11) NOT NULL COMMENT 'red, white, rose, verde tinto...',
  `year` int(4) DEFAULT NULL,
  `subtitle` varchar(40) DEFAULT NULL COMMENT 'if is reserva...',
  `region` int(11) NOT NULL,
  `soil` int(11) DEFAULT NULL,
  `producer` int(11) NOT NULL,
  `country` int(11) DEFAULT NULL,
  `grapescoll` varchar(200) DEFAULT NULL,
  `tasting` varchar(1000) DEFAULT NULL,
  `tasting_en` varchar(1000) DEFAULT NULL,
  `tasting_fr` varchar(1000) DEFAULT NULL,
  `tasting_be` varchar(1000) DEFAULT NULL,
  `alcohol` decimal(4,2) NOT NULL,
  `service` varchar(200) DEFAULT NULL,
  `service_en` varchar(1000) DEFAULT NULL,
  `service_fr` varchar(1000) DEFAULT NULL,
  `service_be` varchar(1000) DEFAULT NULL,
  `oenologist` int(11) NOT NULL,
  `pricebuy` decimal(5,2) NOT NULL DEFAULT '0.00',
  `pricesell` decimal(5,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) DEFAULT '0',
  `photobottle` varchar(50) NOT NULL,
  `photolabel` varchar(50) DEFAULT NULL,
  `packing` int(11) NOT NULL,
  `locality` int(11) NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wine`
--

INSERT INTO `wine` (`id`, `name`, `winetype`, `year`, `subtitle`, `region`, `soil`, `producer`, `country`, `grapescoll`, `tasting`, `tasting_en`, `tasting_fr`, `tasting_be`, `alcohol`, `service`, `service_en`, `service_fr`, `service_be`, `oenologist`, `pricebuy`, `pricesell`, `qty`, `photobottle`, `photolabel`, `packing`, `locality`, `obs`, `active`, `date`) VALUES
(1, 'Bafarela Grande Reserva', 1, 2013, '', 1, 3, 5, 1, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Cor intensa. Aroma distinto. Intenso, complexo com notas florais. Na boca é intenso, sedutor, frutado e floral. Bem estruturado com taninos denso mas finos, apresenta frescura, com final longo, persistente e sedutor.', '', '', 'Mooie rode kleur, tikkeltje paars. Uitgesproken aroma – zeer intensief en complex met bloemige tinten. In de mond heeft deze wijn een mooi afgeronde smaak, met een eminente doch verleidelijke kwaliteit, met uitgesproken vruchtensmaak. Goed uitgebalanceerd, met gebonden doch delicate tannines. In zijn beleving valt deze wijn eerder door de frisheid en door de langdurende aanlokkelijke en blijvende afdronk, dan door de densiteit.', '14.50', '', '', '', 'Zijn elegant en complex profiel zorgt er voor dat deze wijn de ideale gezel is bij fijne vleeswaren en sterke, smaakvolle kazen', 7, '8.20', '15.65', 6, 'Bafarela G Res.PNG', '', 1, 7, '', 1, '2016-06-13 23:00:00'),
(2, 'Bafarela', 1, 2014, 'Reserva', 1, 3, 5, 1, 'Touriga Nacional;Touriga Franca;Tinta Roriz;Tinta Amarela', 'Cor vermelha ligeiramente violeta. Aromas intenso, marcado por frutos vermelhos, notas florais e especiado. Vinho com grande intensidade e persistência, Final fresco e longo.', '', '', 'Mooie rode kleur, tikkeltje paars. De intense aroma’s worden gedomineerd door rode vruchten, aroma’s van viooltjes en kruiden. Intens en met een sterk karakteristiek profiel is dit een stevig wijn met een frisse langdurende afdronk.', '14.00', '', '', '', 'Bafarela Reserva is een verbazingwekkende wijn dat perfect past bij traditionele Portugese gerechten, vleesgerechten, kaas en smaakvolle gebakjes. Probeer deze wijn eens bij sterke, smaakvolle kazen', 7, '3.60', '7.90', 6, 'bafarela_reserva.png', '', 1, 7, '', 1, '2016-06-13 23:00:00'),
(4, 'Aveleda Loureiro Alvarinho', 2, 2015, '', 2, 4, 8, NULL, 'Loureiro;Alvarinho;', 'vinho harmonioso, no qual os aromas florais da casta Loureiro se fundem na perfeição com as notas tropicais do Alvarinho. O resultado é um vinho complexo e elegante, com um final de boca longo e persistente.', '', 'c’est un vin harmonieux, où les arômes floraux du cépage Loureiro se marient parfaitement avec les notes tropicales du cépage Alvarinho, ce qui donne un vin complexe et élégant, avec une longue et persistante finale en bouche.', 'Complexe doch elegante en harmonieuze wijn met persistente afdronk.', '11.50', 'É a escolha ideal para acompanhar saladas requintadas, compostas por frutos do mar, entradas à base de queijo de cabra e pratos elaborados com carnes brancas, como peru ou frango.', '', 'Quinta da Aveleda est le choix idéal pour accompagner des salades composées de fruits de mer, des entrées à base de fromage de chèvre et de plats préparés avec des viandes blanches, comme la dinde ou le poulet. Il doit être consommé frais,', 'zeevruchten hapjes op basis van geitenkaas, gerechten van wit vlees zoals kalkoen of kip.', 17, '4.00', '6.80', 12, 'aveleda4.jpg', '', 1, 2, 'Quinta da Aveleda 1º no ranking da Wine Enthusiast 2014', 1, '0000-00-00 00:00:00'),
(6, '100 Hectares', 1, 2013, 'Colheita', 1, 3, 7, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Cor vermelha. Aroma de frutos silvestres e cerejas. Algumas notas florais. Na boca é frutado e intenso. Final prolongado.', '', '', 'Deze wijn werd samengesteld uit een selectie van de druiven afkomstig uit de beste wijngaarden van de Douro regio. De oogst 2013 levert een dieprode kleur met aroma’s van wilde vruchten en kersen. In de mond overheersen de fruitsmaken, de wijn heeft een langzame afdrank.', '13.50', 'Temperatura entre 16 e 18', '16 a 18', '16 a 18', 'Kamertemperatuur', 2, '3.60', '7.65', 12, '100 Hectares Colheita.PNG', '', 1, 3, 's', 1, '0000-00-00 00:00:00'),
(7, 'Vila Seca', 1, 2014, 'Colheita', 1, 3, 21, NULL, 'Touriga Nacional;Touriga Franca;', 'Aromas de frutos vermelhos e especiarias, revelam uma maceração suave de modo a preservar as notas típicas das castas e fazer com que o vinho esteja no seu auge após engarrafamento. Na boca é muito suave e doce com acidez equilibrada, taninos finos e bom final de boca', '', '', 'Aroma’s van rode vruchten en specerijen verraden een zacht maceratie waarbij de typische toetsen van de druiven behouden blijven en waardoor de wijn op zijn hoogtepunt komt na het bottelen. De smaak is heel zacht en zoet met een evenwichtige zuurtegraad, met fijne tannines en een mooie afdronk', '12.50', '', '', '', 'Ideaal bij de traditionele keuken in het algemeen, mediterraan en oriëntaal.', 4, '2.31', '5.10', 60, 'Vila seca t.PNG', '', 1, 7, 'n', 1, '0000-00-00 00:00:00'),
(9, 'Perna Seca', 2, 2014, '', 7, 5, 12, NULL, 'Arinto;Sauvignom Blanc;Fernão Pires;', 'Este vinho aromático, mineral e equilibrado', '', '', 'Deze witte toont intense aroma, vol fruit, elegant en fris in de mond. Noten van bananen en tropisch fruit, het heeft consistentie, balans en een goede lange afdronk.', '13.00', 'Da belíssima paisagem alentejana, onde vários riachos serpenteiam, nasce o Perna Seca,é uma excelente combinação para pratos peixe, sushi e saladas mediterrânicas.', '', '', '', 2, '2.31', '4.95', 0, 'Perna Seca b.PNG', NULL, 1, 4, '', 0, '2016-09-05 21:35:27'),
(10, 'Perna Seca Escolha', 1, 2014, '', 7, 5, 12, NULL, 'Touriga Nacional;Aragonez;Syrah;', 'Da belíssima paisagem alentejana, onde vários riachos serpenteiam, nasce o Perna Seca. Este vinho frutado, elegante e equilibrado, feito a partir das castas Touriga Nacional, Syrah e Aragonez é uma excelente companhia para momentos únicos e especiais.', '', '', 'Deze elegante, evenwichtige en fruitige wijn is een excellente metgezel tijdens bijzondere en unieke momenten.', '13.00', 'Servir a uma temperatura entre os 16ºC a 18ºC.', '', '', 'Serveren op kamertemperatuur.', 1, '3.70', '6.99', 60, 'Perna Seca Escolha.PNG', NULL, 1, 4, '', 1, '2016-09-05 22:00:23'),
(13, 'Vila Seca', 2, 2015, 'Colheita', 1, 3, 21, NULL, 'Rabigato;Viosinho;Gouveio;', 'Aroma muito fresco e mineral, notas cítricas e florais muito típicas dos vinhos brancos de altitude do Douro. Fresco na boca, com final médio e frutado vivo.', 'Aroma very fresh and mineral, citrus and floral notes very typical of wines White Douro altitude. Fresh in the mouth, with an average final and fruity alive.', '', 'Frisse minerale aroma’s, met een lichte citroen toets, typisch aan de witte wijnen uit de omgeving van de Douro. Fris in de mond met een fruitige afdronk. Ideaal als aperitief, of bij zeevruchten, gegrilde vis, pasta’s, pizza’s of sushi', '12.00', '', 'A gastronomic white that combines elements of richness, freshness, spice and creaminess making it sufficiently versatile to combine with both baked fish or meat dishes. Its naturally high acidity also makes it a excellent match with lighter fish and shellfish.', '', 'Oude wijnranken en geselecteerde wijnranken gesitueerd op een gemiddelde hoogte van 500m, bij uitstek voor de typische zurige variëteiten zoals de Rabigato; alsook vermenging van oudere variëteiten waarbij de lage productie een juist evenwicht tussen zuur en aroma toelaten. Koude fermentatie technologie, in een omgeving met een gecontroleerde temperatuur van ongeveer 16 ° C, teneinde bij het pletten en persen het volledige potentieel van de aroma’s van de druiven behouden. Opslag: 4 maanden in inox', 4, '2.31', '5.10', 60, 'Vila Seca Colheita B.PNG', NULL, 1, 8, '', 1, '2016-10-05 21:58:40'),
(15, 'Montes Ermos', 1, 2014, '', 1, 3, 1, NULL, 'Touriga Nacional;Touriga Franca;', 'Equilibrado', '', '', 'Evenwichtig', '14.00', 'Temperatura ambiente 16º a 18º', '', '', 'Kamertemperatuur', 1, '3.00', '10.00', 4, 'Montes_Ermos_tinto.png', NULL, 10, 1, '', 1, '2016-11-06 01:13:16'),
(17, 'Vila Seca Grande Reserva', 1, 2013, '', 1, 3, 12, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Muito elegante e fino, estilo moderno que conserva toda a alma das castas autóctones do Douro. Aroma que conjuga harmoniosamente a grande concentração dos tintos do Douro e toda e toda a sua complexidade, frutos silvestres, notas de esteva, especiarias e notas muito frescas de manjericão e bergamota. O longo estágio em barricas permitiu obter um vinho de grande elegância aromática. Taninos suaves e bem maduros, fresco e aromático, muito elegante, com final invulgarmente longo.', '', '', 'Zeer elegante en stijlvolle wijn, geproduceerd uit de authentieke druivensoorten rond de Douro, met complexe doch harmonieuze afdronk.', '14.50', '', '', '', '', 4, '8.50', '50.99', 5, 'vila seca gr x3.PNG', NULL, 12, 7, '', 1, '2016-11-14 14:46:48'),
(18, '100 Hectares', 3, 2015, '', 1, 3, 1, NULL, 'Touriga Franca;', 'Fresco', '', '', 'Fris', '12.00', 'Servir bem fresco', '', '', 'Fris serveren.', 1, '4.00', '11.00', 12, '100 Hectares rose.PNG', NULL, 1, 3, 'ae', 1, '2016-12-27 23:37:44'),
(19, 'Quinta do Pessegueiro Aluzé', 1, 2014, 'Aluzé', 1, 3, 24, NULL, 'Touriga Nacional;Touriga Franca;Vinha Velhas;', 'Apresenta uma cor vermelha e intensa com tonalidades violetas. O aroma é fino e fresco, lembrando frutos do bosque. Surgem também alguns apontamentos florais e de especiarias, como a pimenta e cravinho. Na boca tem um ataque muito fresco e directo, abrindo com volume no meio de boca e acabando com um final fino e certeiro.', '', '', 'Het heeft een intense diep rode kleur. Verse aroma s van verse rode vruchten, kersen, krenten, varierend tot kruiden zoals rozemarijn.', '12.50', 'Rosbife à Inglesa, Goraz no Forno e Bacalhau Espiritual', '', '', 'oven gebakken rode zeebrasem en kabeljauw', 22, '7.50', '13.85', 12, 'Qta  Pessegueiro.PNG', NULL, 1, 8, '', 1, '2016-12-30 17:12:42'),
(20, 'Quinta do Pessegueiro', 1, 2011, '', 1, 3, 24, NULL, 'Touriga Nacional;Touriga Franca;', 'Apresenta um aroma fresco com notas mentoladas e frutos vermelhos. Surge também cheiro a terra molhada e rocha que nos leva para um lado mais mineral. Na boca tem um ataque fresco com taninos finos. No meio de boca abre com volume e os aromas vão-se multiplicando acabando com um final fino, directo e persistente.', '', 'Ruby ,arômes frais avec des notes de fruits rouges et de la menthe les tanins fins, bon corps et finale persistante.', 'Frisse aroma\'s met een toets van rode vruchten. Verfijnde tanines in de afdronk.', '14.00', '', '', '', '.', 22, '17.00', '30.99', 6, 'Pessegueiro t.PNG', NULL, 1, 8, '', 1, '2016-12-30 17:39:11'),
(22, 'Quinta do Pessegueiro', 2, 2014, 'Aluzé', 1, 3, 24, NULL, 'Rabigato;Gouveio;Cerceal;', 'Cor dourada clara, límpido. Aroma frutado e mineral. Na boca apresenta volume e alguma acidez. É um vinho equilibrado com final de boca longo e persistente.', '', '', 'Een evenwichtige, frisse, heldere en fruitige wijn met een lange en persistente afdronk.', '13.00', 'Ideal para acompanhar pratos de peixe e mariscos', '', 'Idéal accompagne tous les plats de poisson, fruits de mer et des plats de viande plus légers.', 'Ideaal bij alle visgerechten, zeevruchtenschotels en lichte vleesgerechten.', 22, '7.50', '12.75', 6, 'Quinta do Pessegueiro Aluzé.PNG', NULL, 1, 8, '', 1, '2016-12-31 00:07:04'),
(23, 'Mirabilis', 2, 2014, 'Grande Reserva', 1, 3, 11, NULL, 'Viosinho;Gouveio;Vinha Muito Velhas', 'Aspeto brilhante, com belíssima cor citrina de reflexos esverdeados. No nariz revela uma complexidade invulgar, aroma a frutos brancos de caroço suportado pela mineralidade granitica e pelos aromas a baunilha e cravinho. Na boca sobressaem as sensações de acidez fresca intensa, equilibrada pela sólida estrutura e pela textura linear, profundo, tridimensional, tenso, de grande concentração, final muito longo, preciso e persistente; termina muito focado e transparente.', 'Brilliant in appearance, a beautiful citrus colour with green reflexes. On the nose reveals an unusual complexity, aromas of white fruits with mineral granite notes, vanilla and cloves. In the mouth a blend of sensations and intense acidity, solid structure, linear texture and concentration, resulting in a very complex and intense wine. Long finish, precise and persistent wine, focused and translucent.', '', 'Een prachtige cirtoengele kleur met lichte groene reflecties, verbergt een ongewoon complexe maar sensationele en elegante wijn, met de juiste en gebalanceerde frisse zuren.', '14.00', 'A uma temperatura de 11 a 14ºC. Harmoniza com queijos curados de pasta dura, peixes gordos, comida asiática, carnes de aves, porco e vitela', 'Serve at 11 a 14ºC. Pairs beautifully with hard cured cheeses, fatty fish, Asian style food, poultry, pork and veal.', '', 'Serveer bij een temperatuur van 11 tot 14°C. Ideaal bij harde gerijpte kazen, vette vis, aziatische gerechten, gevogelte, varkens- en kalfsvlees.', 21, '25.00', '45.00', 0, 'Mirabilis.PNG', NULL, 1, 16, '', 1, '2016-12-31 00:28:36'),
(24, 'Bafarela', 3, 2015, '', 1, 3, 5, NULL, 'Touriga Franca;Tinta Roriz;Tinta Amarela;', 'Com cor viva, este vinho apresenta frescura e intensidade no aroma com notas de frutos vermelhos. Ligeiramente floral. Na boca é volumoso e estruturado.', '', '', 'Mooie rode kleur, tikkeltje paars. Uitgesproken aroma – zeer intensief en complex met bloemige tinten. In de mond heeft deze wijn een mooi afgeronde smaak, met een eminente doch verleidelijke kwaliteit, met uitgesproken vruchtensmaak. Goed uitgebalanceerd, met gebonden doch delicate tannines. In zijn beleving valt deze wijn eerder door de frisheid en door de langdurende aanlokkelijke en blijvende afdronk, dan door de densiteit.', '13.00', '', '', '', '', 7, '3.00', '7.00', 0, 'Bafarela roses.PNG', NULL, 1, 7, '', 1, '2017-01-03 14:45:11'),
(25, 'Brites e Aguiar', 1, 2011, '', 1, 3, 5, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Nariz explosivo nas sensações florais (alfazema e cominho), muito intenso na fruta negra, compota, e algum exotismo da barrica e especiarias (cravinho e pimenta). Boca firme, corpo cheio, repleto de sabor, sedutor e másculo ao mesmo tempo, a melhor edição da marca, apesar do álcool continuar elevado.', '', '', 'Full body wijn met volle sensationele, verleidelijke  smaak en een explosief bouquet van lavendel en komijn.', '15.50', '', '', '', '', 7, '21.00', '120.00', 0, 'Brites  Aguiar.PNG', NULL, 12, 7, '', 1, '2017-01-03 14:48:01'),
(26, 'Leiras da Cocheca', 2, 2015, 'Vinho Verde', 2, 4, 12, NULL, 'Loureiro;Alvarinho;Azal;Trajadura;', 'vinho límpido e citrino que surpreende com seus intensos aromas frutados. Na boca de sabores de frutas tropicais e é equilibrado com uma frescura que se estende da ponta longa.', 'da Cocheca White 2015 Limpid wine and citrus that surprises with its intense fruity aromas. On the palate of tropical fruit flavors and is balanced with a freshness that extends', '', 'Kristalheldere citroengele wijn met frisse intense fruitige aroma\'s.', '11.00', 'Sirva com pratos de carnes brancas ou peixe temperado, frutos do mar e risoto.', '', '', 'Serveer met witte vleesgerechten, gegrild of geroosterd vlees, kruidige visgerechten, risotto en kaas.', 1, '1.98', '4.60', 60, 'Leiras.PNG', NULL, 1, 14, '', 1, '2017-01-03 14:55:34'),
(27, 'Vila Seca', 8, 0, 'Tawny', 10, 3, 21, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Aloirado, Delicado e frutado, associado a  alguns frutos vermelhos e madeira, bastante elegante  e persistente, denotando na boca uma evolução e paladar harmoniosamente agradáveis.', '', '', 'Delicaat fruitig bouquet van rode vruchten en hout. Elegante en harmonieuze afdronk.', '20.00', 'Sobremesas, doces e queijos fortes', '', '', 'Ideaal bij zoetigheid, desserts en harde kazen.', 1, '2.98', '6.85', 24, 'Porto Vila Seca T.PNG', NULL, 1, 3, '', 1, '2017-01-03 23:56:47'),
(28, 'Vila Seca', 8, 0, 'Branco', 10, 3, 21, NULL, '', '', '', '', '', '20.00', '', '', '', '', 1, '2.98', '6.85', 24, 'Porto Vila Seca.PNG', NULL, 1, 3, '', 1, '2017-01-03 23:59:49'),
(29, 'Vila Seca 10 Anos', 8, 0, '10 Anos', 10, 3, 21, NULL, '', '', '', '', '', '20.00', '', '', '', '', 1, '8.00', '16.99', 0, '10 anos Vila Seca.PNG', NULL, 1, 3, '', 1, '2017-01-04 00:01:55'),
(30, 'Quinta de Santiago', 3, 2015, 'Alvarinho', 2, 4, 9, NULL, 'Touriga Nacional;Tinta Roriz;Alvarinho;', 'De leve cor salmão, apelativo e refrescante, este vinho é complexo mas delicado a lembrar framboesa fresca, acompanha a intensidade e estrutura imponente na boca onde o alvarinho marca a elegância e frescura do conjunto.', 'This Rose shows a bright salmon color. It has a pure bouquet, dedicated but still very well defined, with fresh raspberry, well balancing with the medium-body palate, where the well-judge elegant acidity from Alvarinho binds everything together tightly.', '', 'Frisse, aantrekkelijke lichtzalmkleurige wijn met complexe toetsen van verse frambozen.', '12.50', 'Deve beber-se entre 10ºC a 12ºC e acompanha bem frutos do mar, peixes, sushi queijos e carnes brancas, em especial de aves', '', '', 'Ideaal bij 10 tot 12°C. Gaat goed samen met zeevruchten, vis, sushi, kazen en gevogelte.', 3, '7.50', '12.99', 6, 'Santiago r.PNG', NULL, 1, 13, '', 1, '2017-01-04 00:33:17'),
(31, 'Quinta de Santiago', 2, 2015, 'Alvarinho', 2, 4, 13, NULL, 'Alvarinho;', 'Cor Citrina. No nariz é elegante e complexo, com notas tropicais acentuadas e ligeiramente floral. Na boca é equilibrado e encorpado com notas florais e frutadas. Mineral. Final fresco e persistente.', 'Citric ,Mineral character, elegant and complex with intense tropical notes, peach, and jasmine. Fresh and fruity, balanced, full-bodied and persistent with freshness and minerality characteristic of the variety and terroir.', '', 'Complexe doch elegante neus met uitgesproken florale toetsen.', '12.50', 'Deve beber-se entre 10ºC a 12ºC e acompanha bem frutos do mar, peixes, sushi queijos e carnes brancas, em especial de aves', 'It should be served at a tem - perature between 10 and 12º C, pairing with sea food, sushi, cheese and white meat', '', 'Ideaal bij 10 tot 12°C. Gaat goed samen met zeevruchten, vis, sushi, kazen en gevogelte.', 3, '7.00', '13.15', 12, 'Q Santiago.PNG', NULL, 1, 13, '', 1, '2017-01-04 00:38:27'),
(32, 'Vila Seca Reserva', 2, 2015, 'Reserva', 1, 3, 21, NULL, 'Rabigato;Viosinho;Gouveio;', 'Aroma complexo, de caráter mineral em equilíbrio com frutos exóticos, citrinos, flores brancas do campo, além de discretas e sugestivas notas tostadas de barrica. Na boca é gordo e cremoso, com volume e frescura, muito longo.', '', '', 'Complexe aroma’s, mineraal karakter met een evenwicht tussen exotische vruchten, citroenaroma’s, wilde witte veldbloemen samen met discrete en suggestieve toetsen van gebrand hout. De romige en zware afdronk in de mond is langdurig en toch koel. Ideaal bij gezouten vis, zachte kazen en bij kruidige gerechten.', '13.50', '', '', '', 'In deze wijn wordt specifiek gezocht naar een evenwichtige concentratie van aroma’s en zuren uit traditioneel zeer oude wijnranken op een hoogte van ongeveer 550m die ons toelaten om het volledige karakter van deze inheemse oude wijnvariëteiten van de Douro met die specifieke romige en minerale toetsen, te demonstreren. Handmatige wijnoogst in kisten van 15kg, koude fermentatie technologie, in een beschermde omgeving met gecontroleerde temperaturen van ongeveer 16° C ten einde binnen het delicate proces van pletten en persen het volledige potentieel van de aroma’s van de druiven te behouden, door middel van een grote inspanning waardoor alle pre-fermentatie operaties met nog meer potentie en accuraatheid uitgevoerd worden. Een deel van de wijn wordt gefermenteerd in gebruikte houten vaten van Franse eik, waarbij een kleine droesem ontstaat dat verholpen wordt door regelmatig te roeren. Battonage van het uiteindelijke mengsel in inox vaten.', 4, '3.82', '7.70', 60, 'VSRb.PNG', NULL, 1, 8, '', 1, '2017-01-04 22:14:02'),
(33, 'Perna Seca', 1, 2015, '', 7, 7, 12, NULL, 'Touriga Nacional;Aragonez;Syrah;', 'cor rubi intensa, aromas e sabores limpos, é animada e jovem, uma reminiscência de uvas frescas, com uma rodada, sabor aveludado.', 'Deep ruby color, clean aromas and flavors, it is lively and young, reminiscent of fresh grapes, with a round, velvety flavor.', 'Robe rubis profond, des arômes et des saveurs propres, il est vif et jeune, qui rappelle de raisins frais, avec une saveur ronde et veloutée.', 'Deze elegante, evenwichtige en fruitige wijn is een excellente metgezel tijdens bijzondere en unieke momenten.', '13.50', 'Sirva com pratos brancos carne, grelhados ou carne assada, peixe temperado, risoto e queijo.', 'Serve with white meat dishes, grilled or roast meat, seasoned fish, risotto and cheese.', 'Servir avec des plats à base de viande blanche, viande grillée ou rôtie, du poisson assaisonné, le risotto et le fromage', 'Serveer met witvleesgerechten, gegrild of geroosterd vlees, kruidige visgerechten, risotto en kaas.', 19, '2.34', '4.99', 0, 'Perna Seca T.PNG', NULL, 1, 4, '', 1, '2017-01-08 09:03:45'),
(34, 'Quinta da Bacalhoa', 1, 2013, '', 6, 7, 25, NULL, 'Cabernet Sauvignon;Merlot;', 'Aromas de frutos vermelhos. Aroma especiado com notas de madeira. Na boca evidenciam- se os frutos vermelhos com taninos suaves bem presentes. Final fresco, mineral, elegante e muito complexo.', 'Aromas of red fruits combined with nuances of wood and spices. In the mouth, the red fruit flavours are intensified and combined with smooth tannins; it has a fresh finish, somewhat mineral, elegant and very complex.', '', 'Aroma\'s van rode vruchten en een toets van hout. Zachte tannines in de mond.', '14.50', 'Possui um grande potencial de envelhecimento. Ideal para , Pratos de carne vermelha e caça. 16 - 18°C', '', '', 'Ideaal bij rood vlees en wild.', 9, '12.00', '20.50', 0, 'Quita da Bacalhoa.PNG', NULL, 1, 21, '', 0, '2017-01-09 00:12:04'),
(35, 'Vila Seca Reserva', 1, 2014, 'Reserva', 1, 3, 21, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Aromas intenso de grande complexidade, aromas de frutos vermelhos do bosque e esteva da Touriga Franca, especiarias e frutos vermelhos da Tinta Roriz e notas florais de violeta muito frescas e elegantes da Touriga Nacional. Estágio de 12 meses em barricas americanas e francesas conferem as notas de um grande vinho do Douro de perfil moderno e internacional. Na boca é doce e envolvente, com taninos nobres muitos suaves, final longo e quente.', 'Intense aromas of great complexity, aromas of red fruits of the forest and rockrose of Touriga Franca, spices and red fruits of Tinta Roriz and notes Floral very fresh and elegant violet Touriga Nacional. 12 months aging in American and French oak barrel', '', 'Intense aroma\'s van grote complexitet, aroma\'s van rode vruchten van het bos en rockrose van Touriga Franca, kruiden en rode vruchten van Tinta roriz en merkt floral zeer fris en elegant violet Touriga Nacional. 12 maanden rijping in amerikaanse en franse eiken vaten geven de note van een grote Douro wijn modern, internationaal profiel. De smaak is zoet en boeiend, met veel zachte edele tannines, lange, warme afdronk.', '14.00', 'Pratos de carne e caça, bacalhau e cozinha mediterrânica em geral.', '', '', 'Mediterrane keuken, kabeljauw en wildgerechten.', 4, '3.80', '7.70', 60, 'Vila Seca Res T.PNG', NULL, 1, 7, '', 1, '2017-01-09 11:12:13'),
(36, 'Perna Seca Reserva', 1, 2013, 'Reserva', 7, 2, 12, NULL, 'Touriga Nacional;Aragonez;Alicante Bouchet;Syrah;', 'É um vinho complexo, elegante e estruturado. Estagiou 12 meses em barricas de carvalho francês.', '', '', 'Complexe, gestructureerde doch elegante wijn. 12 maanden gerijpt op Franse eiken vaten.', '15.00', '', '', '', '', 1, '7.00', '12.75', 0, 'Perna Seca R T.PNG', NULL, 1, 4, '', 1, '2017-01-09 11:58:19'),
(37, 'Anas', 2, 2015, '', 7, 6, 28, NULL, 'Arinto;Antão Vaz;Verdelho;', 'Cor citrous. Bom aroma e mineralidade. Fresco, intenso e elegante no palato.', 'Citrous colour. Good aroma and minerality. Fresh, intense and elegant in the palate.', 'Couleur citrous. Bon arôme et minéralité. Frais, intense et élégant en bouche.', '', '13.00', 'Aproveite bem gelada como na aperetif ou como acompanhamento de peixes, frutos do mar e pratos de carne branca.', 'Enjoy well chilled as na aperetif or as an accompaniment to fish, seafood and white meat dishes.', 'Profitez bien frais que na aperetif ou en accompagnement de poissons, fruits de mer et des plats de viande blanche.', '', 20, '3.00', '5.99', 0, 'Anas b.PNG', NULL, 1, 5, '', 0, '2017-01-10 00:45:18'),
(38, 'Anas', 1, 2015, '', 7, 6, 14, NULL, 'Aragonez;Alicante Bouchet;Syrah;', 'Intenso, frutado,vibrante, um vinho que reflete o terroir único da origem', 'Intense, fruity, vibrant, a wine that reflects the unique terroir of origin.', 'Couleur rouge rubis. Intense, arômes fruités et vibrantes. Un vin qui reflète le terroir unique de son origine.', 'Intens, fruitig, levendig, een wijn die de unieke terroir van herkomst weerspiegelt.', '14.00', 'Este vinho finamente acompanha carnes vermelhas, carne assada e carnes grelhadas.', 'This wine finely accompanies red meats, roast beef and grilled meats.', 'Ce vin accompagne finement les viandes rouges, rôti de boeuf et les viandes grillées.', '', 19, '3.00', '5.99', 0, 'ANAS T.PNG', NULL, 1, 5, '', 0, '2017-01-10 00:53:30'),
(39, 'Cabriz', 1, 2014, 'Colheita selecionada', 3, 8, 26, NULL, 'Touriga Nacional;Tinta Roriz;Alfrocheiro Preto;', 'Cor rubi intensa, aroma frutado, sendo predominante em frutos vermelhos frescos, geleia de frutos do bosque, especiarias e notas tostadas, sabor frutado, macio, elegante e harmonioso.', 'INTENSE RUBY COLOUR. FRUITY ODOUR COMPOSED MAINLY OF  FRESH RED BERRIES, WOODLAND FRUITS JAM, SPYCES AND A SLIGHT HINT OF ROASTED FLAVOURS. IT HAS A FRUITY, SOFT, ELEGANT AND HARMONIOUS FLAVOUR.', '', 'Intense robijnrode, elegante en harmonieuse wijn, met fruitige aroma\'s van verse rode vruchten en een toets van kruiden en geroosterde noten .', '13.00', 'É ideal para acompanhar queijos macios e iguarias à base de peixes de confecção elaborada, carnes brancas e vermelhas de confecção moderada da cozinha Mediterrânica, Chinesa, Indiana e Africana', 'PAIRS PERFECTLY WITH SOFT CHEESES, COMPLEX FISH BASED DELICASIES AS WELL AS RED AND WHITE MEAT DISHES OF RELATIVE COMPLEXITY TYPICAL OF THE MEDITERRANEAN, CHINESE INDIAN AND AFRICAN CUISINES.', '', 'Ideaal bij zachte kazen, bij de mediterrane, aziatische en afrikaanse keuken.', 23, '2.74', '5.99', 0, 'Cabriz.PNG', NULL, 1, 22, '46º no TOP 100 dos melhores vinhos do mundo para o WineSpectator', 1, '2017-01-10 01:15:40'),
(40, 'LH', 2, 2015, 'Douro', 1, 3, 15, NULL, 'Rabigato;Viosinho;Malvasia-Fina;', 'Aroma intenso dominado por frutos citrinos,frutos tropicais,fresco e suave resultante da boa acidez,com um final fino,elegante e persistente.', '', '', 'Intense aroma\'s van citrusvruchten en tropische vruchten geven deze wijn een fijne, zachte en elegante afdronk.', '12.50', 'Ideal para acompanhar saladas,pratos leves, peixes e mariscos', '', '', 'Ideaal bij salades, lichte gerechten, vis en schaaldieren.', 10, '2.17', '4.80', 0, 'LH b.PNG', NULL, 1, 12, '', 1, '2017-01-12 09:30:17'),
(41, 'LH', 1, 2014, '', 1, 3, 15, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'de cor vermelha rubi,com um aroma dominado por frutos vermelhos vivos , bem estruturado e elegante', '', '', 'Intense robijnrode wijn, met opvallende fruitige aroma\'s van verse rode vruchten,', '13.00', 'Ideal para todo o tipo de aves, carnes variadas e massas', '', '', 'Ideaal bij gevogelte, diverse vleesschotels en pasta.', 10, '2.17', '4.80', 0, 'LH t.PNG', NULL, 1, 12, '', 1, '2017-01-12 09:32:32'),
(42, 'Jornas', 1, 2013, '', 7, 4, 16, NULL, 'Aragonez;Alicante Bouchet;Moreto;', 'Cor vermelha intensa; aroma elegante com frutos vermelhos; na boca é suave com taninos redondos e final agradável.', 'Intense red color, elegant aromas of red fruit, smooth with rounded tannins and pleasant finish.', '', 'Intens rode kleur, elegante aroma’s van rood fruit, zacht afgeronde tanninetinten, smakelijke afdronk', '13.50', 'acompanha pratos de aves, carnes vermelhas e tábua de queijos.', 'Serving temperature 16-18ºC; it goes well with red meat and cheese.', '', 'Deze wijn gaat perfect bij rood vlees en kaas', 12, '3.00', '5.99', 0, 'jornas t.PNG', NULL, 1, 6, '', 1, '2017-01-12 10:03:16'),
(43, 'Jornas', 2, 2013, '', 7, 4, 16, NULL, 'Touriga Franca;Arinto;Antão Vaz;Verdelho;', 'Cor citrina; aroma elegante e complexo com notas florais; harmonioso, acidez viva, final sedoso e prolongado.', '', '', 'Citruskleur, elegant en complex aroma met bloemige toetsen; harmonieus, zurig, zachte en lange afdronk.', '13.00', 'Deve ser servido a uma temperatura entre os 10 e os 12ºC; este vinho acompanha na perfeição peixe grelhado, marisco e carnes brancas.', '', '', 'Deze wijn gaat goed samen met gegrilde vis, zeevruchten en wit vlees.', 13, '2.70', '5.99', 0, 'jornas b.PNG', NULL, 1, 6, '', 0, '2017-01-12 10:08:24'),
(44, 'Vila Real', 3, 2016, 'Colheita', 1, 3, 18, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'Aroma a frutos vermelhos, intenso. Na boca é suave e apresenta notas de groselha e morango com acidez equilibrada. Acompanha bem refeições ligeiras, carnes frias, queijos frescos, excelente com cozinha indiana com muita especiaria.', '', '', 'Fruitige en intense aroma\'s. Fluweelzachte afdronk met een evenwichtige balans van zuren.', '12.50', '', '', '', 'Deze wijn is ideaal bij lichte maaltijden, verse kazen en ook bij kruidige Aziatische schotels.', 15, '1.77', '4.80', 0, 'Vila real r.PNG', NULL, 1, 17, '', 1, '2017-01-12 10:21:47'),
(45, 'Dalva', 8, 2013, '', 10, 3, 19, NULL, '', 'Tem cor amarelo escuro e aroma a frutos em calda, maçã cozida, flores secas. Muito untuoso e encorpado na boca, com a doçura do fruto acompanhando uma prova suave e envolvente.', 'It has a dark yellow colour and aromas reminiscent of preserved fruit, baked apples and dried flowers. Full bodied on the palate; a smooth and engaging after taste.', '', 'Mooie donker gele kleur, bouquet van warme vruchten, gebakken appel, gedroogde bloemen. Heel volle afdronk met fruitzoete toets.', '19.00', 'Manter a garrafa em pé, em local fresco e escuro. Não evolui significativamente na garrafa.', 'Store upright in a cool dark place. It does not improve with ageing.', '', 'Rechtop bewaren op een koele donkere plaats.', 1, '0.00', '7.50', 0, 'Dalva b.PNG', NULL, 1, 1, '', 1, '2017-01-13 01:47:53'),
(46, 'Dalva', 8, 0, 'Tawny', 10, 3, 19, NULL, '', 'Bonita cor com leves nuances avermelhadas. No aroma revela suaves balsâmicos, misturando frutos jovens e secos. Muito equilibrado na boca, com final atractivo a bombom de ginja.', 'A lovely light reddish colour. Aromas of fresh and dried fruits with hints of vanilla. Very balanced on the palate with an agreable after taste of cherries.', '', 'Mooie kleur met lichtrode nuances. Een prachtig bouquet van zachte balsamico, jong gedroogde vruchten en zure kersen.', '19.00', 'Manter a garrafa em pé, em local fresco e escuro. Não evolui significativamente na garrafa. Pode guardar-se em cave ao longo de três ou quatro anos sem perder frescura.', 'Store upright in a cool dark place. It does not develop significantly in the bottle. May be kept three or four years without losing its freshness.', '', 'Rechtop bewaren op een koele donkere plaats.', 1, '0.00', '7.50', 0, 'Dalva pt.PNG', NULL, 1, 3, '', 1, '2017-01-13 01:51:11'),
(47, 'Vilacetinho', 2, 2015, '', 2, 8, 20, NULL, 'Loureiro;Azal;Arinto;Avesso;', 'Citrino com aroma a frutas brancas do pomar conjugadas com ligeiro tropical anuncia um paladar fresco, suave a agradável, óptimo para saborear em qualquer momento', 'Citric wine assimilates an aroma of white fruit from the orchard to a slight tropical taste reveals itself in the mouth as fresh, smooth and enjoyable, ideal to drink at any moment.', '', 'Deze citroenfrisse wijn assimileert een aroma van boomgaardvruchten tot een licht tropische smaak dat zich - op eender welk moment - fris, soepel en aangenaam openbaart in de mond.', '10.50', '', '', '', 'Vilacetinho is gelegen in Alpendurada. Het is een landgoed met 30 hectare wijngaarden die zich op een harmonieuze wijze in de zuidelijk georiënteerde granietrijke bodems ontvouwen, waardoor deze locatie behoort tot een van de meest gegeerde en welvarende locaties van de regio voor de productie van de Vinho Verde', 16, '1.34', '3.99', 60, 'vilacetinhoj.PNG', NULL, 1, 18, '', 1, '2017-01-13 10:26:22'),
(48, 'Vila Seca Grande Reserva', 1, 2013, '', 1, 3, 21, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;Vinha Velhas;', 'Muito elegante e fino, estilo moderno que conserva toda a alma das castas autóctones do Douro. Aroma que conjuga harmoniosamente a grande concentração dos tintos do Douro e toda e toda a sua complexidade, frutos silvestres, notas de esteva, especiarias e notas muito frescas de manjericão e bergamota. O longo estágio em barricas permitiu obter um vinho de grande elegância aromática. Taninos suaves e bem maduros, fresco e aromático, muito elegante, com final invulgarmente longo.', '', '', 'Zeer elegante en stijlvolle wijn, geproduceerd uit de authentieke druivensoorten rond de Douro, met complexe doch harmonieuze afdronk.', '14.50', '', '', '', '', 4, '0.00', '16.99', 0, 'VSGR.PNG', NULL, 1, 7, '', 1, '2017-01-14 12:08:28'),
(49, 'M&M Gold Edition', 7, 2013, 'Bruto', 8, 1, 22, NULL, 'Baga;Bical;Maria Gomes;Cerceal;', 'Detém um aspecto límpido e cor amarelo citrino com tonalidades verdes. Tem um aroma fino e notas predominantemente florais com um sabor fresco e um toque floral na fase retronasal.', '', '', 'De citrusgeelachtige kleur met groene tinten geeft deze wijn een duidelijke uitstraling. De aroma s zijn verfijnd met een florale toets.', '12.00', 'VAI BEM COM Aperitivos, acompanha pratos de peixe, carne, mariscos e sobremesas.', '', '', 'Gaat goed samen met hapjes, vlees- en visgerechten, schaaldieren en desserts.', 26, '4.98', '12.15', 0, 'm&mg.PNG', NULL, 1, 19, '', 1, '2017-01-15 23:53:07'),
(50, 'M&M Gold Edition', 7, 2013, 'Rosé', 8, 1, 22, NULL, 'Touriga Nacional;Baga;', 'Cristalino com bolha fina e persistente. Cor rosada definida. Aroma intenso a frutos vermelhos e de sabor frutado, com volume de boca notório, macio e com uma frescura crocante e mousse envolvente.', '', '', 'Kristalhelder met fijne en persistente bubbels. Intense en fruitige aroma\'s van rode vruchten  geeft deze mousserende wijn een unieke afdronk.', '12.00', '', '', '', '', 26, '4.98', '12.15', 0, 'M&Mrose.PNG', NULL, 1, 19, '', 1, '2017-01-16 00:13:04'),
(51, 'Murganheira Reserva', 7, 2012, 'Bruto', 4, 3, 23, NULL, 'Touriga Nacional;Malvasia-Fina;Cerceal;Pinot noir;Chardonnay;', 'Cor citrina e aroma a frutos secos. Sabor com Grande equilíbrio entre acidez e os frutos.', '', '', 'Heel harmonieuze aroma met vanille toetsen; Delicate en elegante smaak met een evenwichtige afdronk.', '13.50', '', '', '', 'Begeleidt perfect vis, in het bijzonder geroosterd en zeevruchten.', 24, '7.00', '14.40', 0, 'Murganheira RB.PNG', NULL, 1, 20, '', 1, '2017-01-16 21:39:24'),
(53, 'Murganheira Super Reserva', 7, 2010, 'Bruto', 4, 3, 23, NULL, 'Touriga Nacional;Tinta Roriz;Malvasia-Fina;Cerceal;', 'De aroma muito harmonioso com notas abaunilhadas. Sabor delicado e elegante,cujo o final persistente é a marca do seu equilíbrio.', '', '', 'Heel harmonieuze aroma met vanille toetsen; Delicate en elegante smaak met een evenwichtige afdronk.', '13.50', 'Acompanha na perfeição peixes,particularmente assados e mariscos', '', '', 'Begeleidt perfect vis, in het bijzonder geroosterd en zeevruchten.', 24, '7.00', '15.99', 0, 'Murganheira SRB.PNG', NULL, 1, 20, '', 1, '2017-01-17 15:14:48'),
(58, 'Borba', 3, 2015, '', 7, 7, 27, NULL, 'Aragonez;Syrah;', 'Aspecto límpido, cor rosa forte com laivos vermelhos. Aroma com boa intensidade a groselha e ameixa vermelha. Sabor equilibrado com juventude, frutado silvestre, de excelente frescura e persistência final agridoce.', 'Clear appearance, strong pink colour with hints of red. Good intensity and aromas of black currant and red plums. Flavours of wild fruits, very fresh with bittersweet finish.', '', 'Sterke roze kleur met hints van rood. Goede intensiteit en aroma\'s van zwarte bessen en rode pruimen. Smaken van wilde vruchten, zeer fris met bitterzoete afwerking.', '12.50', 'Acompanhamento de marisco, peixes frescos grelhados e carnes brancas - Aperitivo', 'At 8-10 ºC. Pairs well with seafood, fresh grilled fish, white meats. It can also be served as an aperitif. It should be consumed after bottling or within 2-3 years.', '', '', 25, '2.29', '5.00', 0, 'Borba Rosé.PNG', NULL, 1, 23, '', 0, '2017-01-30 00:25:13'),
(59, 'Beirão', 14, 0, '', 4, 1, 1, NULL, '', '', '', '', '', '22.00', '', '', '', '', 1, '0.00', '16.10', 0, 'Beirão.PNG', NULL, 14, 22, '', 1, '2017-02-02 16:28:16'),
(60, 'Telheiras', 1, 2013, '', 1, 3, 29, NULL, 'Touriga Nacional;Touriga Franca;Tinta Roriz;', 'De cor vermelho rubi. O aroma é intenso, dominando os frutos vermelhos maduros e algumas notas de especiarias. Na boca o vinho é equilibrado, com uma predominância de sabor de fruta vermelha, discreta acidez, taninos redondos e bem embrulhado, com um acabamento elegante e harmonioso.', 'Red ruby color. The aroma is intense, dominating the fruits ripe red and some spicy notes. In the mouth the wine it is balanced, with a predominance of red fruit flavor, acidity discreet, round tannins and well-wrapped, with an elegant and harmonious fin', 'couleur rubis rouge. L\'arôme est intense, dominant les fruits rouges mûrs et des notes épicées. En bouche, le vin est équilibré, avec une prédominance de saveur de fruits rouges, une acidité discrète, des tanins ronds et bien emballé, avec une finition élégante et harmonieuse', 'Robijnkleurig. Intens aroma gedomineerd door rijpe rode vruchten en enkele kruidige toetsen. In de mond smaakt de wijn evenwichtig, met een overheersende toets van rood fruit, discreet zurig, goed gekaderde tannine en een elegante en harmonieuse afdronk.', '14.00', '', 'It is ideal for accompanying roasted goat meat, mutton, chicken rice.', '', '', 27, '0.00', '6.00', 0, 'Telheiras.PNG', NULL, 1, 1, '', 1, '2017-03-20 22:02:48'),
(61, 'Torre da Palma', 1, 2014, '', 7, 1, 30, NULL, 'Touriga Nacional;Aragonez;Alicante Bouchet;', 'Concentrado de vinho de cor rubi. No nariz apresenta um aroma a frutos silvestres fresco preto, revela ser muito jovem, com forte intensidade aromática, onde as bagas vermelhas excel com notas sutis de brinde. Na boca parece ser rodada em uma maneira atraente, com taninos bem equilibrados em uma combinação muito elegante, culminando em um longo e persistente final.', 'Concentrated ruby colour wine. In the nose it presents an aroma of black fresh wild berries, reveals to be very young with strong aromatic intensity, where the red berries excel with subtle notes of toast. In the mouth appears to be round in an attractive way with tannins well balanced in a very elegant combination, culminating in a long and persistent ending.', '', '', '14.00', 'Divirta-se com, carne vermelha ligeiramente caramelizado torrado ou jogo com geléia de fruta preta. Jogo também com um poderoso queijo Português de \"Azeitão\" ou um \"Roquefort\" tradicional', 'Enjoy with roasted, slightly caramelized red meat or game with black fruit jelly. Match also with a powerful Portuguese cheese from “Azeitão” or a traditional “Roquefort”.', '', '', 19, '0.00', '19.80', 0, 'Torre da Palma t.PNG', NULL, 1, 25, '', 1, '2017-03-21 17:46:47'),
(62, 'Aguia Moura', 3, 2016, '', 1, 3, 15, NULL, 'Touriga Nacional;Touriga Franca;', 'De cor rosa,  com um aroma bastante frutado de frutos vermelhos e groselha, deixa um ar macio e fresco na boca', '', '', '', '12.50', 'Excelente como aperitivo, acompanha bem com pratos de  peixe, salas e sushi', '', '', '', 10, '0.00', '5.00', 0, 'aguia de moura r.PNG', NULL, 1, 12, '', 1, '2017-04-29 10:23:20'),
(63, 'Torre de Palma', 2, 2015, '', 7, 1, 30, NULL, 'Alvarinho;Arinto;Antão Vaz;', 'Vinho amarelo cristalino com laivos dourados, aroma complexo e elegante com notas de fruta polpa branca bem integrados com aromas de tosta provenientes da fermentação em barrica. Sabor rico em fruta com bom volume e excelente acidez.   Perfumado, elegante, com notas de laranja, tangerina, geleia e mel, é um branco muito bonito, envolvente, vibrante de frescura, longo e muito expressivo.', '', '', '', '13.50', '', '', '', '', 19, '0.00', '14.70', 0, 'Torre da Palma B.PNG', NULL, 1, 24, '', 0, '2017-04-29 11:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `wineorder`
--

CREATE TABLE `wineorder` (
  `id` int(11) NOT NULL,
  `clientname` varchar(200) NOT NULL,
  `clientphone` varchar(20) NOT NULL,
  `clientemail` varchar(200) NOT NULL,
  `clientaddress` varchar(200) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `orderlist` varchar(10000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT '''Aberta''',
  `statusdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wineorder`
--

INSERT INTO `wineorder` (`id`, `clientname`, `clientphone`, `clientemail`, `clientaddress`, `message`, `orderlist`, `date`, `status`, `statusdate`) VALUES
(1, 'Vitor faria', '0479999196', 'vitor@allfac.be', '', '', 'a:5:{i:0;O:8:\"stdClass\":6:{s:4:\"owid\";s:1:\"4\";s:6:\"owname\";s:26:\"Aveleda Loureiro Alvarinho\";s:5:\"owqty\";i:4;s:11:\"owpricesell\";s:4:\"6.80\";s:9:\"owpackage\";s:5:\"75 cl\";s:9:\"$$hashKey\";s:3:\"08P\";}i:1;O:8:\"stdClass\":6:{s:4:\"owid\";s:2:\"47\";s:6:\"owname\";s:11:\"Vilacetinho\";s:5:\"owqty\";i:2;s:11:\"owpricesell\";s:4:\"3.99\";s:9:\"owpackage\";s:5:\"75 cl\";s:9:\"$$hashKey\";s:3:\"08Q\";}i:2;O:8:\"stdClass\":5:{s:4:\"owid\";s:2:\"32\";s:6:\"owname\";s:17:\"Vila Seca Reserva\";s:11:\"owpricesell\";s:4:\"7.50\";s:9:\"owpackage\";s:5:\"75 cl\";s:9:\"$$hashKey\";s:3:\"08R\";}i:3;O:8:\"stdClass\":6:{s:4:\"owid\";s:2:\"32\";s:6:\"owname\";s:17:\"Vila Seca Reserva\";s:5:\"owqty\";i:3;s:11:\"owpricesell\";s:4:\"7.50\";s:9:\"owpackage\";s:5:\"75 cl\";s:9:\"$$hashKey\";s:3:\"08S\";}i:4;O:8:\"stdClass\":6:{s:4:\"owid\";s:1:\"2\";s:6:\"owname\";s:8:\"Bafarela\";s:5:\"owqty\";i:4;s:11:\"owpricesell\";s:4:\"7.85\";s:9:\"owpackage\";s:5:\"75 cl\";s:9:\"$$hashKey\";s:3:\"08T\";}}', '2017-03-24 23:26:20', 'Fechada', '2017-05-06 16:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `winetype`
--

CREATE TABLE `winetype` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `characteristics` varchar(1000) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `charact_en` varchar(300) DEFAULT NULL,
  `name_fr` varchar(100) DEFAULT NULL,
  `charact_fr` varchar(300) DEFAULT NULL,
  `name_be` varchar(100) DEFAULT NULL,
  `charact_be` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winetype`
--

INSERT INTO `winetype` (`id`, `name`, `characteristics`, `name_en`, `charact_en`, `name_fr`, `charact_fr`, `name_be`, `charact_be`) VALUES
(1, 'Tinto', '', '', '', '', '', 'rood', ''),
(2, 'Branco', '', '', '', '', '', 'wit', ''),
(3, 'Rosé', 'Cor rosada', NULL, NULL, NULL, NULL, '            Rose\n', NULL),
(7, 'Espumante', 'Vinho feito seguindo o metodo champanhes', NULL, NULL, NULL, NULL, 'mousserende', NULL),
(8, 'Vinho do Porto', 'Vinho fortificado da região do vinho do Porto. Douro', NULL, NULL, NULL, NULL, 'Port Wijn', NULL),
(9, 'Moscatel Favaios', 'Vinho licoroso da região de Favaios', NULL, NULL, NULL, NULL, 'Moscatel de favaaios', NULL),
(10, 'Espadeiro', 'Vinho tipo rosé proveniente da casta Espadal proviniente da região dos vinhos verdes.', '', '', '', '', 'Espadeiro', ''),
(11, 'Frisante', 'Gasificado artificialmente', 'Sparckling Wine', 'teste en', 'Glouglu', 'teste fr', 'frisante', 'teste be'),
(12, 'Azeite', 'Azeite', '0', '0', '0', '0', 'Olijfolie', 'Olijfolie'),
(14, 'Licor', '', '', '', '', '', 'sterke drank', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Indexes for table `destak`
--
ALTER TABLE `destak`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `grape`
--
ALTER TABLE `grape`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grapescoll`
--
ALTER TABLE `grapescoll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oenologist`
--
ALTER TABLE `oenologist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing`
--
ALTER TABLE `packing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soil`
--
ALTER TABLE `soil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`cookie`);

--
-- Indexes for table `wine`
--
ALTER TABLE `wine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wineorder`
--
ALTER TABLE `wineorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `winetype`
--
ALTER TABLE `winetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `grape`
--
ALTER TABLE `grape`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `grapescoll`
--
ALTER TABLE `grapescoll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `oenologist`
--
ALTER TABLE `oenologist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `packing`
--
ALTER TABLE `packing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `soil`
--
ALTER TABLE `soil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wine`
--
ALTER TABLE `wine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `wineorder`
--
ALTER TABLE `wineorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `winetype`
--
ALTER TABLE `winetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
