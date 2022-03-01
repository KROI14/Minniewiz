-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 05:17 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minniewiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `QuestionID` varchar(50) NOT NULL,
  `Answer` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`QuestionID`, `Answer`) VALUES
('Q-0001', 'Myself'),
('Q-0002', 'Noun'),
('Q-0003', 'Moon'),
('Q-0004', 'Mangoes'),
('Q-0005', 'Verb'),
('Q-0006', 'is there?'),
('Q-0007', 'Doesn\'t like.'),
('Q-0008', 'Are'),
('Q-0009', 'And'),
('Q-0011', 'Action Verbs'),
('Q-0012', 'Capital Letter'),
('Q-0015', 'Pronoun'),
('Q-0016', 'Italian'),
('Q-0017', 'Adverb'),
('Q-0018', 'Synonym'),
('Q-0019', 'Vocabulary'),
('Q-0020', 'Idiom'),
('Q-0022', 'Goodbye!'),
('Q-0023', 'May I help you?'),
('Q-0025', 'Please pass the pitcher of water.'),
('Q-0026', 'Red'),
('Q-0027', 'Colorful'),
('Q-0028', 'Kitten'),
('Q-0029', 'I will.'),
('Q-0030', 'Would you like some chocolate cake '),
('Q-0031', 'Pagong'),
('Q-0032', 'Sigla'),
('Q-0034', 'Nagsasaad ng salitang kilos '),
('Q-0035', 'Lumalangoy'),
('Q-0036', 'Kababalaghan'),
('Q-0037', 'Katatawanan'),
('Q-0038', 'Kapaligiran'),
('Q-0039', 'Tugma'),
('Q-0040', 'Sukat'),
('Q-0041', 'Dula'),
('Q-0042', 'Aktor'),
('Q-0043', 'Direktor'),
('Q-0044', 'Tanghalan'),
('Q-0045', 'Manonood'),
('Q-0046', 'Tagpo'),
('Q-0047', 'Iskrip'),
('Q-0048', 'Kasukdulan'),
('Q-0049', 'Eksena'),
('Q-0050', 'Kalutasan'),
('Q-0051', 'Padamdam'),
('Q-0052', 'Patanong'),
('Q-0054', 'Pangngalan'),
('Q-0055', 'Wika'),
('Q-0056', 'Wikang Filipino'),
('Q-0057', 'Hindi ko lang po alam ngunit bukas na po ang pinto.'),
('Q-0058', 'Luntian'),
('Q-0059', 'Tita'),
('Q-0060', 'Matamis'),
('Q-0061', 'Addition'),
('Q-0068', '11'),
('Q-0070', '7 and 9'),
('Q-0071', 'Triangle'),
('Q-0072', 'Hexagon'),
('Q-0074', 'Place Value'),
('Q-0075', 'Numerals'),
('Q-0076', 'Hundreds'),
('Q-0077', 'Ones'),
('Q-0080', '6'),
('Q-0081', 'Expression'),
('Q-0086', 'Value'),
('Q-0087', 'Minutes'),
('Q-0088', 'Hours'),
('Q-0089', 'Below'),
('Q-0090', 'Between'),
('Q-0091', 'Sasagot kaagad.'),
('Q-0092', 'Magalang'),
('Q-0093', 'Buong puso at may pagmamahal ko sila aawitan. '),
('Q-0094', 'Pipiliin kong tumayo. Kung may sugat ako, hihingi ako ng tulong. '),
('Q-0095', 'Ang tamang sagot ay A at C.'),
('Q-0096', 'Ibabalik sa tindero.'),
('Q-0097', 'Sasabihin ang totoo sa nanay at hihingi ng paumanhin. '),
('Q-0098', 'Patatawarin ko siya.'),
('Q-0099', 'Kakausapin at aawatin ko sila sa kanilang pag-aaway.'),
('Q-0100', 'Itatapon ko sa tamang lalagyan.'),
('Q-0101', 'Tama'),
('Q-0102', 'Tama'),
('Q-0103', 'Mali'),
('Q-0104', 'Pipila ako at maghihintay hanggang sa ako na ang pagbibilhan.'),
('Q-0105', 'Lalapitan ang matanda at sasabayan itong tumawid upang hindi mapahamak.'),
('Q-0106', '8'),
('Q-0107', 'Earth'),
('Q-0108', 'Venus'),
('Q-0109', 'False'),
('Q-0110', 'Herbivores'),
('Q-0111', 'Omnivores'),
('Q-0113', 'All of the above'),
('Q-0114', 'Duck'),
('Q-0115', 'Water'),
('Q-0116', 'Ang sagot ay A at B.'),
('Q-0117', 'Sasawayin mo ang mga maling ginagawa ng iba.'),
('Q-0118', 'Sasabihin mo sa iyong guro ang maling ginawa ni Bert.'),
('Q-0119', 'Tatanggapin mo ang opinyon ng iyong kaibigan.'),
('Q-0120', 'Sasang-ayon ka sa mungkahi ng iyong guro.'),
('Q-0121', 'Susundin ang sinabi ng guro.'),
('Q-0122', 'Oo, dahil mahirap kumuha ng tubig at mali ang ginawa ko.'),
('Q-0123', 'Susundin ko ang ate ko dahil iyon ang tama.'),
('Q-0124', 'Hayaan na lang ang iba ang tumulong.'),
('Q-0125', 'Sundin ang sinabi ng nanay at gawin ng maayos ang inuutos nito.'),
('Q-0126', 'Kumain ng mga masustansyang pagkain.'),
('Q-0127', 'Isda, gulay at prutas.'),
('Q-0128', 'Sasabihin ko sa aming guro ang sitwasyon ni Miko para siya ay matulungan.'),
('Q-0129', 'Palagi ako magsasanay para mas lalo pa ako maging magaling sa pagbigkas ng tula.'),
('Q-0130', 'Lalapit sa nanay at magtatanong kung ano ang pwede matulong.'),
('Q-0132', 'Solid'),
('Q-0133', 'Gas'),
('Q-0134', 'Respiratory System'),
('Q-0135', 'Ice cube'),
('Q-0136', 'Photosynthesis'),
('Q-0137', 'White Blood Cell'),
('Q-0138', 'Respiratory System'),
('Q-0139', 'Nervous System'),
('Q-0141', 'Crust'),
('Q-0143', 'Inner Core'),
('Q-0144', 'Telescope'),
('Q-0145', 'Atmosphere'),
('Q-0146', 'Thermometer'),
('Q-0147', 'Weather'),
('Q-0148', 'Weather '),
('Q-0149', 'Decomposer'),
('Q-0150', 'Ecosystem'),
('Q-0152', 'Will perform in a show.'),
('Q-0153', 'Ley'),
('Q-0154', 'Yours'),
('Q-0155', 'I\'m sorry.'),
('Q-0156', 'Cover my mouth with a hanky and say excuse me.'),
('Q-0157', '3'),
('Q-0158', 'Subtraction'),
('Q-0159', 'Even numbers'),
('Q-0161', '11'),
('Q-0162', 'Odd Numbers'),
('Q-0163', '8'),
('Q-0164', 'Addend '),
('Q-0165', 'Count On'),
('Q-0167', 'Masolusyunan '),
('Q-0168', 'Pautos/Pakiusap'),
('Q-0170', 'Add'),
('Q-0171', 'Less than'),
('Q-0172', 'Difference'),
('Q-0173', 'Sum'),
('Q-0174', 'Perimeter'),
('Q-0175', '2 and 10'),
('Q-0176', 'Carnivores'),
('Q-0177', 'None of the above.'),
('Q-0178', 'Oil'),
('Q-0179', 'B & C');

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `ChoiceID` varchar(50) NOT NULL,
  `QuestionID` varchar(50) NOT NULL,
  `Choice` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`ChoiceID`, `QuestionID`, `Choice`) VALUES
('CH-0000', 'Q-0000', ''),
('CH-0001', 'Q-0001', 'Ourselves'),
('CH-0002', 'Q-0001', 'Myself'),
('CH-0003', 'Q-0001', 'Himself'),
('CH-0004', 'Q-0001', 'Herself'),
('CH-0005', 'Q-0002', 'Noun'),
('CH-0006', 'Q-0002', 'Verb'),
('CH-0007', 'Q-0002', 'Adverb'),
('CH-0008', 'Q-0002', 'Pronoun'),
('CH-0009', 'Q-0003', 'Looks'),
('CH-0010', 'Q-0003', 'Beautiful'),
('CH-0011', 'Q-0003', 'Moon'),
('CH-0012', 'Q-0003', 'So'),
('CH-0013', 'Q-0004', 'Tasty'),
('CH-0014', 'Q-0004', 'These'),
('CH-0015', 'Q-0004', 'Mangoes'),
('CH-0016', 'Q-0004', 'Are'),
('CH-0017', 'Q-0005', 'Verb'),
('CH-0018', 'Q-0005', 'Adverb'),
('CH-0019', 'Q-0005', 'Adjective'),
('CH-0020', 'Q-0005', 'Preposition'),
('CH-0021', 'Q-0006', 'is it?'),
('CH-0022', 'Q-0006', 'is there?'),
('CH-0023', 'Q-0006', 'are there?'),
('CH-0024', 'Q-0006', 'None of the above.'),
('CH-0025', 'Q-0007', 'Don\'t like.'),
('CH-0026', 'Q-0007', 'He no likes.'),
('CH-0027', 'Q-0007', 'Doesn\'t like.'),
('CH-0028', 'Q-0007', 'None of the above.'),
('CH-0029', 'Q-0008', 'Are'),
('CH-0030', 'Q-0008', 'Is'),
('CH-0031', 'Q-0008', 'Be'),
('CH-0032', 'Q-0008', 'It is'),
('CH-0033', 'Q-0009', 'So'),
('CH-0034', 'Q-0009', 'But'),
('CH-0035', 'Q-0009', 'And'),
('CH-0036', 'Q-0009', 'None of the above.'),
('CH-0041', 'Q-0011', 'Verb'),
('CH-0042', 'Q-0011', 'Adverb'),
('CH-0043', 'Q-0011', 'Action Verbs'),
('CH-0044', 'Q-0011', 'Noun'),
('CH-0045', 'Q-0012', 'Capital Letter'),
('CH-0046', 'Q-0012', 'Small Letter'),
('CH-0047', 'Q-0012', 'Symbol'),
('CH-0048', 'Q-0012', 'Number'),
('CH-0057', 'Q-0015', 'Adjective'),
('CH-0058', 'Q-0015', 'Pronoun'),
('CH-0059', 'Q-0015', 'Noun'),
('CH-0060', 'Q-0015', 'Verb'),
('CH-0061', 'Q-0016', 'Italian'),
('CH-0062', 'Q-0016', 'Greek'),
('CH-0063', 'Q-0016', 'French'),
('CH-0064', 'Q-0016', 'Spanish'),
('CH-0065', 'Q-0017', 'Verb'),
('CH-0066', 'Q-0017', 'Adverb'),
('CH-0067', 'Q-0017', 'Noun'),
('CH-0068', 'Q-0017', 'Pronoun'),
('CH-0069', 'Q-0018', 'Antonym'),
('CH-0070', 'Q-0018', 'Verb'),
('CH-0071', 'Q-0018', 'Synonym'),
('CH-0072', 'Q-0018', 'Adjective'),
('CH-0073', 'Q-0019', 'Vocabulary'),
('CH-0074', 'Q-0019', 'Noun'),
('CH-0075', 'Q-0019', 'Idiom'),
('CH-0076', 'Q-0019', 'Verb'),
('CH-0077', 'Q-0020', 'Synonym'),
('CH-0078', 'Q-0020', 'Metaphor'),
('CH-0079', 'Q-0020', 'Phrase'),
('CH-0080', 'Q-0020', 'Idiom'),
('CH-0085', 'Q-0022', 'Good evening!'),
('CH-0086', 'Q-0022', 'How are you?'),
('CH-0087', 'Q-0022', 'Goodbye!'),
('CH-0088', 'Q-0022', 'No comment. '),
('CH-0089', 'Q-0023', 'May I help you?'),
('CH-0090', 'Q-0023', 'Sorry.'),
('CH-0091', 'Q-0023', 'No'),
('CH-0092', 'Q-0023', ' thank you!'),
('CH-0093', 'Q-0023', 'You can do it Ma\'am!'),
('CH-0100', 'Q-0025', 'Please pass the pitcher of water.'),
('CH-0101', 'Q-0025', 'Brother pass the water.'),
('CH-0102', 'Q-0025', 'Thank you.'),
('CH-0103', 'Q-0025', 'I need to drink water!!'),
('CH-0104', 'Q-0026', 'Dark'),
('CH-0105', 'Q-0026', 'Red'),
('CH-0106', 'Q-0026', 'Blue'),
('CH-0107', 'Q-0026', 'Sad'),
('CH-0108', 'Q-0027', 'Dull'),
('CH-0109', 'Q-0027', 'Old'),
('CH-0110', 'Q-0027', 'Colorful'),
('CH-0111', 'Q-0027', 'Few'),
('CH-0112', 'Q-0028', 'Cat'),
('CH-0113', 'Q-0028', 'Kitten'),
('CH-0114', 'Q-0028', 'Puppy'),
('CH-0115', 'Q-0028', 'Chick'),
('CH-0116', 'Q-0029', 'I am.'),
('CH-0117', 'Q-0029', 'I will.'),
('CH-0118', 'Q-0029', 'I did.'),
('CH-0119', 'Q-0029', 'I have.'),
('CH-0120', 'Q-0030', 'I like chocolate cake.'),
('CH-0121', 'Q-0030', 'This is a picture of a chocolate cake '),
('CH-0122', 'Q-0030', 'Would you like some chocolate cake '),
('CH-0123', 'Q-0030', 'I made that chocolate cake'),
('CH-0124', 'Q-0031', 'Pagong'),
('CH-0125', 'Q-0031', 'Isda'),
('CH-0126', 'Q-0031', 'Aso'),
('CH-0127', 'Q-0031', 'Unggoy'),
('CH-0128', 'Q-0032', 'Sisigla'),
('CH-0129', 'Q-0032', 'Sigla'),
('CH-0130', 'Q-0032', 'Sisig'),
('CH-0131', 'Q-0032', 'Pasig'),
('CH-0136', 'Q-0034', 'Nagsasaad ng salitang kilos '),
('CH-0137', 'Q-0034', 'Nagbibigay direksyon '),
('CH-0138', 'Q-0034', 'Bumubuo sa isang salita '),
('CH-0139', 'Q-0034', 'Wala sa nabanggit'),
('CH-0140', 'Q-0035', 'Maganda'),
('CH-0141', 'Q-0035', 'Matangkad'),
('CH-0142', 'Q-0035', 'Lumalangoy'),
('CH-0143', 'Q-0035', 'Kulay Puti'),
('CH-0144', 'Q-0036', 'Elemento'),
('CH-0145', 'Q-0036', 'Komedyan'),
('CH-0146', 'Q-0036', 'Kababalaghan'),
('CH-0147', 'Q-0036', 'Multo'),
('CH-0148', 'Q-0037', 'Kalungkutan'),
('CH-0149', 'Q-0037', 'Katatawanan'),
('CH-0150', 'Q-0037', 'Kasiglahan'),
('CH-0151', 'Q-0037', 'Lahat ng nabanggit.'),
('CH-0152', 'Q-0038', 'Tao'),
('CH-0153', 'Q-0038', 'Likas Yaman'),
('CH-0154', 'Q-0038', 'Kapaligiran'),
('CH-0155', 'Q-0038', 'Bahay'),
('CH-0156', 'Q-0039', 'Sukat'),
('CH-0157', 'Q-0039', 'Tema '),
('CH-0158', 'Q-0039', 'Anyo'),
('CH-0159', 'Q-0039', 'Tugma'),
('CH-0160', 'Q-0040', 'Tugma '),
('CH-0161', 'Q-0040', 'Sukat'),
('CH-0162', 'Q-0040', 'Tema'),
('CH-0163', 'Q-0040', 'Anyo'),
('CH-0164', 'Q-0041', 'Dula'),
('CH-0165', 'Q-0041', 'Nobela'),
('CH-0166', 'Q-0041', 'Manonood'),
('CH-0167', 'Q-0041', 'Iskrip'),
('CH-0168', 'Q-0042', 'Dula'),
('CH-0169', 'Q-0042', 'Aktor'),
('CH-0170', 'Q-0042', 'Manonood'),
('CH-0171', 'Q-0042', 'Direktor'),
('CH-0172', 'Q-0043', 'Nobela '),
('CH-0173', 'Q-0043', 'Aktor'),
('CH-0174', 'Q-0043', 'Manonood'),
('CH-0175', 'Q-0043', 'Direktor'),
('CH-0176', 'Q-0044', 'Pook'),
('CH-0177', 'Q-0044', 'Tagpo'),
('CH-0178', 'Q-0044', 'Tanghalan'),
('CH-0179', 'Q-0044', 'Eksena'),
('CH-0180', 'Q-0045', 'Dula'),
('CH-0181', 'Q-0045', 'Iskrip'),
('CH-0182', 'Q-0045', 'Manonood'),
('CH-0183', 'Q-0045', 'Aktor'),
('CH-0184', 'Q-0046', 'Tagpo'),
('CH-0185', 'Q-0046', 'Kasukdulan'),
('CH-0186', 'Q-0046', 'Eksena'),
('CH-0187', 'Q-0046', 'Kalutasan'),
('CH-0188', 'Q-0047', 'Kalutasan'),
('CH-0189', 'Q-0047', 'Iskrip'),
('CH-0190', 'Q-0047', 'Tagpo'),
('CH-0191', 'Q-0047', 'Kasukdulan'),
('CH-0192', 'Q-0048', 'Kalutasan'),
('CH-0193', 'Q-0048', 'Eksena '),
('CH-0194', 'Q-0048', 'Tagpo'),
('CH-0195', 'Q-0048', 'Kasukdulan'),
('CH-0196', 'Q-0049', 'Tagpo'),
('CH-0197', 'Q-0049', 'Kasukdulan'),
('CH-0198', 'Q-0049', 'Eksena'),
('CH-0199', 'Q-0049', 'Kalutusan'),
('CH-0200', 'Q-0050', 'Kalutasan'),
('CH-0201', 'Q-0050', 'Tauhan'),
('CH-0202', 'Q-0050', 'Tagpo'),
('CH-0203', 'Q-0050', 'Eksena '),
('CH-0204', 'Q-0051', 'Patanong '),
('CH-0205', 'Q-0051', 'Padamdam'),
('CH-0206', 'Q-0051', 'Pakiusap'),
('CH-0207', 'Q-0051', 'Pasalaysay'),
('CH-0208', 'Q-0052', 'Pasalaysay'),
('CH-0209', 'Q-0052', 'Pakiusap'),
('CH-0210', 'Q-0052', 'Patanong'),
('CH-0211', 'Q-0052', 'Padamdam'),
('CH-0216', 'Q-0054', 'Pangngalan'),
('CH-0217', 'Q-0054', 'Panghalip'),
('CH-0218', 'Q-0054', 'Tayutay'),
('CH-0219', 'Q-0054', 'Tula'),
('CH-0220', 'Q-0055', 'Wika'),
('CH-0221', 'Q-0055', 'Damdamin'),
('CH-0222', 'Q-0055', 'Tema'),
('CH-0223', 'Q-0055', 'Panghalip'),
('CH-0224', 'Q-0056', 'Wikang Filipino'),
('CH-0225', 'Q-0056', 'Wikang Ingles'),
('CH-0226', 'Q-0056', 'Wikang Hapon '),
('CH-0227', 'Q-0056', 'Wikang Kastila'),
('CH-0228', 'Q-0057', 'Opo'),
('CH-0229', 'Q-0057', ' naroon na siya.'),
('CH-0230', 'Q-0057', 'Ewan ko lang po baka bukas na ang pinto. '),
('CH-0231', 'Q-0057', 'Hindi ko lang po alam ngunit bukas na po ang pinto.'),
('CH-0232', 'Q-0057', 'Bakit ka nagtatanong kung pwede mo naman tingnan.'),
('CH-0233', 'Q-0058', 'Asul'),
('CH-0234', 'Q-0058', 'Lila'),
('CH-0235', 'Q-0058', 'Luntian'),
('CH-0236', 'Q-0058', 'Dilaw'),
('CH-0237', 'Q-0059', 'Ate'),
('CH-0238', 'Q-0059', 'Tita'),
('CH-0239', 'Q-0059', 'Tito'),
('CH-0240', 'Q-0059', 'Lola'),
('CH-0241', 'Q-0060', 'Maasim'),
('CH-0242', 'Q-0060', 'Maalat'),
('CH-0243', 'Q-0060', 'Matamis'),
('CH-0244', 'Q-0060', 'Mapait'),
('CH-0245', 'Q-0061', 'Addition'),
('CH-0246', 'Q-0061', 'Multiplication'),
('CH-0247', 'Q-0061', 'Subtraction'),
('CH-0248', 'Q-0061', 'Division'),
('CH-0273', 'Q-0068', '11'),
('CH-0274', 'Q-0068', '26'),
('CH-0275', 'Q-0068', '22'),
('CH-0276', 'Q-0068', '12'),
('CH-0293', 'Q-0070', '6 and 10'),
('CH-0294', 'Q-0070', '7 and 9'),
('CH-0295', 'Q-0070', '8 and 10'),
('CH-0296', 'Q-0070', '6 and 9'),
('CH-0297', 'Q-0071', 'Circle '),
('CH-0298', 'Q-0071', 'Triangle'),
('CH-0299', 'Q-0071', 'Rectangle'),
('CH-0300', 'Q-0071', 'Square'),
('CH-0301', 'Q-0072', 'Pentagon'),
('CH-0302', 'Q-0072', 'Octagon'),
('CH-0303', 'Q-0072', 'Hexagon'),
('CH-0304', 'Q-0072', 'Rectangle'),
('CH-0309', 'Q-0074', 'Value'),
('CH-0310', 'Q-0074', 'Place Value'),
('CH-0311', 'Q-0074', 'Numerals'),
('CH-0312', 'Q-0074', 'Digit'),
('CH-0313', 'Q-0075', 'Equal'),
('CH-0314', 'Q-0075', 'Value'),
('CH-0315', 'Q-0075', 'Numbers'),
('CH-0316', 'Q-0075', 'Numerals'),
('CH-0317', 'Q-0076', 'Hundreds'),
('CH-0318', 'Q-0076', 'Tens'),
('CH-0319', 'Q-0076', 'Thousands'),
('CH-0320', 'Q-0076', 'Ones'),
('CH-0321', 'Q-0077', 'Hundreds'),
('CH-0322', 'Q-0077', 'Tens'),
('CH-0323', 'Q-0077', 'Thousands'),
('CH-0324', 'Q-0077', 'Ones'),
('CH-0333', 'Q-0080', '2'),
('CH-0334', 'Q-0080', '4'),
('CH-0335', 'Q-0080', '6'),
('CH-0336', 'Q-0080', '8'),
('CH-0337', 'Q-0081', 'Value'),
('CH-0338', 'Q-0081', 'Numbers'),
('CH-0339', 'Q-0081', 'Expression'),
('CH-0340', 'Q-0081', 'Equal'),
('CH-0357', 'Q-0086', 'Plan'),
('CH-0358', 'Q-0086', 'Value'),
('CH-0359', 'Q-0086', 'Strategy'),
('CH-0360', 'Q-0086', 'Expression'),
('CH-0361', 'Q-0087', 'Seconds'),
('CH-0362', 'Q-0087', 'Hours'),
('CH-0363', 'Q-0087', 'Minutes'),
('CH-0364', 'Q-0087', 'Days'),
('CH-0365', 'Q-0088', 'Seconds'),
('CH-0366', 'Q-0088', 'Hours'),
('CH-0367', 'Q-0088', 'Minute'),
('CH-0368', 'Q-0088', 'Days'),
('CH-0369', 'Q-0089', 'Below'),
('CH-0370', 'Q-0089', 'Above'),
('CH-0371', 'Q-0089', 'Between'),
('CH-0372', 'Q-0089', 'Side'),
('CH-0373', 'Q-0090', 'Below'),
('CH-0374', 'Q-0090', 'Above'),
('CH-0375', 'Q-0090', 'Between'),
('CH-0376', 'Q-0090', 'Side'),
('CH-0377', 'Q-0091', 'Sasagot kaagad.'),
('CH-0378', 'Q-0091', 'Hindi kikibo.'),
('CH-0379', 'Q-0091', 'Papabayaan lamang.'),
('CH-0380', 'Q-0091', 'Hindi papansinin'),
('CH-0381', 'Q-0091', ''),
('CH-0382', 'Q-0092', 'Kawalan ng respeto.'),
('CH-0383', 'Q-0092', 'Magalang'),
('CH-0384', 'Q-0092', 'Pambabaliwala'),
('CH-0385', 'Q-0092', 'Walang pakialam'),
('CH-0386', 'Q-0093', 'Wala akong gagawin. '),
('CH-0387', 'Q-0093', 'Hahayaan ko na lang sila na mag-isip kung mayroon akong talent sap ag-awit.'),
('CH-0388', 'Q-0093', 'Buong puso at may pagmamahal ko sila aawitan. '),
('CH-0389', 'Q-0093', 'Aawit ako na boses lang ang maririnig nila. '),
('CH-0390', 'Q-0094', 'Iiyak ako at uuwi na. '),
('CH-0391', 'Q-0094', 'Magsusumbong ako sa mga nakatatandang kapatid ko. '),
('CH-0392', 'Q-0094', 'Pipiliin kong tumayo. Kung may sugat ako'),
('CH-0393', 'Q-0094', ' hihingi ako ng tulong. '),
('CH-0394', 'Q-0094', 'Hindi ako tatayo at hihintayin kong may makakita sa akin. '),
('CH-0395', 'Q-0095', 'Guguhit akong saranggola. Sisikapin kong gayahin upang makabuo ng saranggola. '),
('CH-0396', 'Q-0095', 'Bibili na lamang upang hindi na mahirapan gumawa.'),
('CH-0397', 'Q-0095', 'Manghihingi ng tulong sa mga kakilalang marunong gumawa ng saranggola. '),
('CH-0398', 'Q-0095', 'Ang tamang sagot ay A at C.'),
('CH-0399', 'Q-0096', 'Itatago ang pera. '),
('CH-0400', 'Q-0096', 'Ibabalik sa tindero.'),
('CH-0401', 'Q-0096', 'Ibabahagi sa kaibigan.'),
('CH-0402', 'Q-0096', 'Ibibigay sa magulang.'),
('CH-0403', 'Q-0097', 'Sasabihin ang totoo sa nanay at hihingi ng paumanhin. '),
('CH-0404', 'Q-0097', 'Ililigpit ang nabasag na pinggan at walang pagsasabihan. '),
('CH-0405', 'Q-0097', 'Sasabihin na ang kapatid na bunso ang nakabasag. '),
('CH-0406', 'Q-0097', 'Walang gagawin at hahayaan na lamang na ang Nanay ang magliligpit. '),
('CH-0407', 'Q-0098', 'Aawayin ko siya.'),
('CH-0408', 'Q-0098', 'Patatawarin ko siya.'),
('CH-0409', 'Q-0098', 'Hindi na ko makikipaglaro sakaniya.'),
('CH-0410', 'Q-0098', 'Gagantihan ko siya!'),
('CH-0411', 'Q-0099', 'Kakampihan ko ang isa kong kapatid.'),
('CH-0412', 'Q-0099', 'Hayaan na lang sila.'),
('CH-0413', 'Q-0099', 'Papanoorin ko sila habang sila ay nag-aaway.'),
('CH-0414', 'Q-0099', 'Kakausapin at aawatin ko sila sa kanilang pag-aaway.'),
('CH-0415', 'Q-0100', 'Itatapon sa daan.'),
('CH-0416', 'Q-0100', 'Itatapon ko sa kanal.'),
('CH-0417', 'Q-0100', 'Itatapon ko sa tamang lalagyan.'),
('CH-0418', 'Q-0100', 'Itatapon ko sa ilog.'),
('CH-0419', 'Q-0101', 'Tama'),
('CH-0420', 'Q-0101', 'Mali'),
('CH-0421', 'Q-0101', 'Maaari'),
('CH-0422', 'Q-0101', 'Sabagay'),
('CH-0423', 'Q-0102', 'Mali'),
('CH-0424', 'Q-0102', 'Sabagay'),
('CH-0425', 'Q-0102', 'Tama'),
('CH-0426', 'Q-0102', 'Maaari'),
('CH-0427', 'Q-0103', 'Tama'),
('CH-0428', 'Q-0103', 'Mali'),
('CH-0429', 'Q-0103', 'Sabagay'),
('CH-0430', 'Q-0103', 'Maaari'),
('CH-0431', 'Q-0104', 'Makikipag-unahan ako sa pila.'),
('CH-0432', 'Q-0104', 'Hahanap ako ng kakilala sa unahan ng pila at magpapabili ako. '),
('CH-0433', 'Q-0104', 'Lalapit ako sa tindera at sasabihin kong ako ang unahin.'),
('CH-0434', 'Q-0104', 'Pipila ako at maghihintay hanggang sa ako na ang pagbibilhan.'),
('CH-0435', 'Q-0105', 'Lalapitan ang matanda at sasabayan itong tumawid upang hindi mapahamak.'),
('CH-0436', 'Q-0105', 'Ipagsasawalang bahala ang matanda dahil hindi naman ito kaano-ano.'),
('CH-0437', 'Q-0105', 'Titignan lang ang matanda at hahayaan itong tumawid mag-isa.'),
('CH-0438', 'Q-0105', 'Makikipagkwentuhan sa kaibigan hanggang sa makatawid.'),
('CH-0439', 'Q-0106', '7'),
('CH-0440', 'Q-0106', '8'),
('CH-0441', 'Q-0106', '9'),
('CH-0442', 'Q-0106', '8 or 9'),
('CH-0443', 'Q-0107', 'Venus'),
('CH-0444', 'Q-0107', 'Mars'),
('CH-0445', 'Q-0107', 'Earth'),
('CH-0446', 'Q-0107', 'Uranus'),
('CH-0447', 'Q-0108', 'Mercury'),
('CH-0448', 'Q-0108', 'Saturn'),
('CH-0449', 'Q-0108', 'Jupiter'),
('CH-0450', 'Q-0108', 'Venus'),
('CH-0451', 'Q-0109', 'True'),
('CH-0452', 'Q-0109', 'False'),
('CH-0453', 'Q-0109', 'Maybe'),
('CH-0454', 'Q-0109', 'I don\'t know'),
('CH-0455', 'Q-0110', 'Herbivores'),
('CH-0456', 'Q-0110', 'Omnivores'),
('CH-0457', 'Q-0110', 'Carnivores'),
('CH-0458', 'Q-0110', 'None of the above'),
('CH-0459', 'Q-0111', 'Herbivores'),
('CH-0460', 'Q-0111', 'Omnivores'),
('CH-0461', 'Q-0111', 'Carnivores'),
('CH-0462', 'Q-0111', 'None of the above'),
('CH-0467', 'Q-0113', 'Aluminum'),
('CH-0468', 'Q-0113', 'Copper'),
('CH-0469', 'Q-0113', 'Iron'),
('CH-0470', 'Q-0113', 'All of the above'),
('CH-0471', 'Q-0114', 'Dog'),
('CH-0472', 'Q-0114', 'Cat'),
('CH-0473', 'Q-0114', 'Duck'),
('CH-0474', 'Q-0114', 'Sheep'),
('CH-0475', 'Q-0115', 'House'),
('CH-0476', 'Q-0115', 'Water'),
('CH-0477', 'Q-0115', 'Chocolate'),
('CH-0478', 'Q-0115', 'Fruits'),
('CH-0479', 'Q-0116', 'Bibigyan ng gamot ang nanay upang mawala ang sakit nito.'),
('CH-0480', 'Q-0116', 'Sisikaping gawin ang ibang gawaing bahay.'),
('CH-0481', 'Q-0116', 'Walang gagawin at hihintayin na lamang gumaling ang nanay.'),
('CH-0482', 'Q-0116', 'Ang sagot ay A at B.'),
('CH-0483', 'Q-0117', 'Sasawayin mo ang mga maling ginagawa ng iba.'),
('CH-0484', 'Q-0117', 'Babastusin ang matandang naglalakad sa kalye.'),
('CH-0485', 'Q-0117', 'Pagtawanan ang pagkakamali ng ibang tao. '),
('CH-0486', 'Q-0117', 'Aawayin ang kamag-aral.'),
('CH-0487', 'Q-0118', 'Aawayin si Bert.'),
('CH-0488', 'Q-0118', 'Hahayaan na lamang si Bert mangopya kay Juan.'),
('CH-0489', 'Q-0118', 'Gagaya ka kay Bert.'),
('CH-0490', 'Q-0118', 'Sasabihin mo sa iyong guro ang maling ginawa ni Bert.'),
('CH-0491', 'Q-0119', 'Walang reaksyon.'),
('CH-0492', 'Q-0119', 'Tatanggapin mo ang opinyon ng iyong kaibigan.'),
('CH-0493', 'Q-0119', 'Susuntukin mo siya.'),
('CH-0494', 'Q-0119', 'Magagalit ka.'),
('CH-0495', 'Q-0120', 'Wala sa nabanggit.'),
('CH-0496', 'Q-0120', 'Sasang-ayon ka sa mungkahi ng iyong guro.'),
('CH-0497', 'Q-0120', 'Kwestyunin ito kung bakit kailangan niya magbasa.'),
('CH-0498', 'Q-0120', 'Walang gagawin.'),
('CH-0499', 'Q-0121', 'Susundin ang sinabi ng guro.'),
('CH-0500', 'Q-0121', 'Hayaan mo ang sinabi niya.'),
('CH-0501', 'Q-0121', 'Babaliwalain ko ito.'),
('CH-0502', 'Q-0121', 'Hindi mo susunduin ang sinabi ng iyong guro.'),
('CH-0503', 'Q-0122', 'Hindi'),
('CH-0504', 'Q-0122', ' kasi gusto mo maglaro ng tubig.'),
('CH-0505', 'Q-0122', 'Hindi'),
('CH-0506', 'Q-0122', ' baliwalain ang sinasabi nito.'),
('CH-0507', 'Q-0122', 'Wala sa nabanggit.'),
('CH-0508', 'Q-0122', 'Oo'),
('CH-0509', 'Q-0122', ' dahil mahirap kumuha ng tubig at mali ang ginawa ko.'),
('CH-0510', 'Q-0123', 'Hayaan ko siyang sawayin ako.'),
('CH-0511', 'Q-0123', 'Hindi ko siya susundin.'),
('CH-0512', 'Q-0123', 'Magpapasaway ako lalo.'),
('CH-0513', 'Q-0123', 'Susundin ko ang ate ko dahil iyon ang tama.'),
('CH-0514', 'Q-0124', 'Tutulungan ko sila.'),
('CH-0515', 'Q-0124', 'Ipagdarasal ko sila.'),
('CH-0516', 'Q-0124', 'Bibigyan ng sa abot nang makakaya.'),
('CH-0517', 'Q-0124', 'Hayaan na lang ang iba ang tumulong.'),
('CH-0518', 'Q-0125', 'Ilagay sa mga halaman ang nabubulok sa basura. '),
('CH-0519', 'Q-0125', 'Ilagay sa basurahan ang mga di-nabubulok na basura. '),
('CH-0520', 'Q-0125', 'Pagsamahin ang basurang nabubulok at di-nabubulok.'),
('CH-0521', 'Q-0125', 'Sundin ang sinabi ng nanay at gawin ng maayos ang inuutos nito.'),
('CH-0522', 'Q-0126', 'Kumain ng maraming kendi at tsokolate. '),
('CH-0523', 'Q-0126', 'Kumain ng mga masustansyang pagkain.'),
('CH-0524', 'Q-0126', 'Uminom ng gatas at kumain ng tsitserya.'),
('CH-0525', 'Q-0126', 'Manood ng teleserye hanggang hating-gabi.'),
('CH-0526', 'Q-0127', 'Isda'),
('CH-0527', 'Q-0127', ' gulay at prutas.'),
('CH-0528', 'Q-0127', 'Keyk'),
('CH-0529', 'Q-0127', ' sorbetes at tsokolate.'),
('CH-0530', 'Q-0127', 'Karne'),
('CH-0531', 'Q-0127', ' hotdog at tocino.'),
('CH-0532', 'Q-0127', 'French fries at hamburger.'),
('CH-0533', 'Q-0128', 'Hindi ko siya papansinin.'),
('CH-0534', 'Q-0128', 'Sasabihin ko sa iba kong kaklase para asarin siya.'),
('CH-0535', 'Q-0128', 'Sasabihin ko sa aming guro ang sitwasyon ni Miko para siya ay matulungan.'),
('CH-0536', 'Q-0128', 'Pagtatawanan ko siya tuwing online kumustahan.'),
('CH-0537', 'Q-0129', 'Magsasanay ako kapag gusto ko lang.'),
('CH-0538', 'Q-0129', 'Hindi na ko magsasanay dahil magaling na ako.'),
('CH-0539', 'Q-0129', 'Magsasanay ako kapag may paligsahan lamang.'),
('CH-0540', 'Q-0129', 'Palagi ako magsasanay para mas lalo pa ako maging magaling sa pagbigkas ng tula.'),
('CH-0541', 'Q-0130', 'Matutulog lamang at hahayaan ang nanay na kumilos mag-isa.'),
('CH-0542', 'Q-0130', 'Lalapit sa nanay at magtatanong kung ano ang pwede matulong.'),
('CH-0543', 'Q-0130', 'Babaliwalain ang nanay at makikipaglaro lamang sa labas.'),
('CH-0544', 'Q-0130', 'Wala akong gagawin'),
('CH-0545', 'Q-0130', ' may iba namang tao na maaaring tumulong sakaniya.'),
('CH-0550', 'Q-0132', 'Solid'),
('CH-0551', 'Q-0132', 'Liquid'),
('CH-0552', 'Q-0132', 'Gas'),
('CH-0553', 'Q-0132', 'Plasma'),
('CH-0554', 'Q-0133', 'Solid'),
('CH-0555', 'Q-0133', 'Liquid'),
('CH-0556', 'Q-0133', 'Gas'),
('CH-0557', 'Q-0133', 'Plasma'),
('CH-0558', 'Q-0134', 'Nervous System'),
('CH-0559', 'Q-0134', 'Respiratory System'),
('CH-0560', 'Q-0134', 'Reproductive System'),
('CH-0561', 'Q-0134', 'Cardiovascular System'),
('CH-0562', 'Q-0135', 'Juice '),
('CH-0563', 'Q-0135', 'Ice cube'),
('CH-0564', 'Q-0135', 'Water'),
('CH-0565', 'Q-0135', 'None of the above'),
('CH-0566', 'Q-0136', 'Solid'),
('CH-0567', 'Q-0136', 'Photosynthesis'),
('CH-0568', 'Q-0136', 'Bacteria'),
('CH-0569', 'Q-0136', 'Poison'),
('CH-0570', 'Q-0137', 'Red Blood Cell'),
('CH-0571', 'Q-0137', 'White Blood Cell'),
('CH-0572', 'Q-0137', 'Egg Cell'),
('CH-0573', 'Q-0137', 'Stem Cell'),
('CH-0574', 'Q-0138', 'Cardiovascular System'),
('CH-0575', 'Q-0138', 'Reproductive System'),
('CH-0576', 'Q-0138', 'Respiratory System'),
('CH-0577', 'Q-0138', 'Skeletal System'),
('CH-0578', 'Q-0139', 'Nervous System'),
('CH-0579', 'Q-0139', 'Respiratory System'),
('CH-0580', 'Q-0139', 'Reproductive System'),
('CH-0581', 'Q-0139', 'Cardiovascular System'),
('CH-0586', 'Q-0141', 'Crust'),
('CH-0587', 'Q-0141', 'Mantle'),
('CH-0588', 'Q-0141', 'Inner Core'),
('CH-0589', 'Q-0141', 'Outer Core'),
('CH-0594', 'Q-0143', 'Crust'),
('CH-0595', 'Q-0143', 'Outer Core'),
('CH-0596', 'Q-0143', 'Inner Core'),
('CH-0597', 'Q-0143', 'Mantle'),
('CH-0598', 'Q-0144', 'Binoculars'),
('CH-0599', 'Q-0144', 'Microscope'),
('CH-0600', 'Q-0144', 'Telescope'),
('CH-0601', 'Q-0144', 'None of the above'),
('CH-0602', 'Q-0145', 'Sky'),
('CH-0603', 'Q-0145', 'Atmosphere'),
('CH-0604', 'Q-0145', 'Stratosphere'),
('CH-0605', 'Q-0145', 'Clouds'),
('CH-0606', 'Q-0146', 'Thermometer'),
('CH-0607', 'Q-0146', 'Weight Scale'),
('CH-0608', 'Q-0146', 'Protractor'),
('CH-0609', 'Q-0146', 'None of the above'),
('CH-0610', 'Q-0147', 'Typhoon'),
('CH-0611', 'Q-0147', 'Fueled'),
('CH-0612', 'Q-0147', 'Weather'),
('CH-0613', 'Q-0147', 'Hurricane'),
('CH-0614', 'Q-0148', 'Typhoon'),
('CH-0615', 'Q-0148', 'Fueled'),
('CH-0616', 'Q-0148', 'Weather '),
('CH-0617', 'Q-0148', 'Hurricane'),
('CH-0618', 'Q-0149', 'Decomposer'),
('CH-0619', 'Q-0149', 'Consumer'),
('CH-0620', 'Q-0149', 'Producer'),
('CH-0621', 'Q-0149', 'Omnivore'),
('CH-0622', 'Q-0150', 'Habitat'),
('CH-0623', 'Q-0150', 'Ecosystem'),
('CH-0624', 'Q-0150', 'Community'),
('CH-0625', 'Q-0150', 'Nature'),
('CH-0630', 'Q-0152', 'Performing in a show '),
('CH-0631', 'Q-0152', 'Performed in a show.'),
('CH-0632', 'Q-0152', 'Will perform in a show.'),
('CH-0633', 'Q-0152', 'Have performed in a show.'),
('CH-0634', 'Q-0153', 'Ley'),
('CH-0635', 'Q-0153', 'Upon'),
('CH-0636', 'Q-0153', 'Us'),
('CH-0637', 'Q-0153', 'View'),
('CH-0638', 'Q-0154', 'Your'),
('CH-0639', 'Q-0154', 'You are '),
('CH-0640', 'Q-0154', 'You'),
('CH-0641', 'Q-0154', 'Yours'),
('CH-0642', 'Q-0155', 'It\'s not my fault.'),
('CH-0643', 'Q-0155', 'Thank you.'),
('CH-0644', 'Q-0155', 'I\'m sorry.'),
('CH-0645', 'Q-0155', 'I didn\'t mean to do it.'),
('CH-0646', 'Q-0156', 'Cover my mouth with a hanky and say excuse me.'),
('CH-0647', 'Q-0156', 'Sneeze again and say I\'m sorry.'),
('CH-0648', 'Q-0156', 'Continue sneezing as if no one beside you.'),
('CH-0649', 'Q-0156', 'None of the above.'),
('CH-0650', 'Q-0157', '5'),
('CH-0651', 'Q-0157', '1'),
('CH-0652', 'Q-0157', '3'),
('CH-0653', 'Q-0157', '13'),
('CH-0654', 'Q-0158', 'Addition'),
('CH-0655', 'Q-0158', 'Multiplication'),
('CH-0656', 'Q-0158', 'Subtraction'),
('CH-0657', 'Q-0158', 'Division'),
('CH-0658', 'Q-0159', 'Even numbers'),
('CH-0659', 'Q-0159', 'Odd numbers '),
('CH-0660', 'Q-0159', 'Estimate '),
('CH-0661', 'Q-0159', 'Letters'),
('CH-0666', 'Q-0161', '13'),
('CH-0667', 'Q-0161', '11'),
('CH-0668', 'Q-0161', '21'),
('CH-0669', 'Q-0161', '3'),
('CH-0670', 'Q-0162', 'Even Numbers '),
('CH-0671', 'Q-0162', 'Odd Numbers'),
('CH-0672', 'Q-0162', 'Estimate '),
('CH-0673', 'Q-0162', 'Letters'),
('CH-0674', 'Q-0163', '2'),
('CH-0675', 'Q-0163', '3'),
('CH-0676', 'Q-0163', '8'),
('CH-0677', 'Q-0163', '10'),
('CH-0678', 'Q-0164', 'Addend '),
('CH-0679', 'Q-0164', 'Added '),
('CH-0680', 'Q-0164', 'Add '),
('CH-0681', 'Q-0164', 'Sum'),
('CH-0682', 'Q-0165', 'Count On'),
('CH-0683', 'Q-0165', 'Attributes'),
('CH-0684', 'Q-0165', 'Add '),
('CH-0685', 'Q-0165', 'Value'),
('CH-0690', 'Q-0167', 'Masolusyunan '),
('CH-0691', 'Q-0167', 'Mapaunlad'),
('CH-0692', 'Q-0167', 'Makatulong'),
('CH-0693', 'Q-0167', 'Maprotektahan'),
('CH-0694', 'Q-0168', 'Pautos/Pakiusap'),
('CH-0695', 'Q-0168', 'Patanong '),
('CH-0696', 'Q-0168', 'Pasalaysay'),
('CH-0697', 'Q-0168', 'Padamdam'),
('CH-0718', 'Q-0170', 'Addend'),
('CH-0719', 'Q-0170', 'Add'),
('CH-0720', 'Q-0170', 'Difference '),
('CH-0721', 'Q-0170', 'Sum'),
('CH-0722', 'Q-0171', 'Less than'),
('CH-0723', 'Q-0171', 'Equal'),
('CH-0724', 'Q-0171', 'Greater than'),
('CH-0725', 'Q-0171', 'Add'),
('CH-0726', 'Q-0172', 'Subtraction'),
('CH-0727', 'Q-0172', 'Value'),
('CH-0728', 'Q-0172', 'Sum'),
('CH-0729', 'Q-0172', 'Difference'),
('CH-0730', 'Q-0173', 'Subtraction'),
('CH-0731', 'Q-0173', 'Value'),
('CH-0732', 'Q-0173', 'Sum'),
('CH-0733', 'Q-0173', 'Difference'),
('CH-0734', 'Q-0174', 'Perimeter'),
('CH-0735', 'Q-0174', 'Value'),
('CH-0736', 'Q-0174', 'Cube'),
('CH-0737', 'Q-0174', 'Expression'),
('CH-0738', 'Q-0175', '1 and 2 '),
('CH-0739', 'Q-0175', '2 and 10'),
('CH-0740', 'Q-0175', '3 and 5 '),
('CH-0741', 'Q-0175', '4 and7'),
('CH-0742', 'Q-0176', 'Herbivores'),
('CH-0743', 'Q-0176', 'Omnivores'),
('CH-0744', 'Q-0176', 'Carnivores'),
('CH-0745', 'Q-0176', 'None of the above.'),
('CH-0746', 'Q-0177', 'Fumes from volcanoes'),
('CH-0747', 'Q-0177', 'Helium in balloons'),
('CH-0748', 'Q-0177', 'Bubbles in soda'),
('CH-0749', 'Q-0177', 'None of the above.'),
('CH-0750', 'Q-0178', 'Solid'),
('CH-0751', 'Q-0178', 'Liquid'),
('CH-0752', 'Q-0178', 'Oil'),
('CH-0753', 'Q-0178', 'Gas'),
('CH-0754', 'Q-0179', 'Water'),
('CH-0755', 'Q-0179', 'Solid Rock'),
('CH-0756', 'Q-0179', 'Minerals'),
('CH-0757', 'Q-0179', 'B & C');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `LevelID` varchar(50) NOT NULL,
  `SubjectID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`LevelID`, `SubjectID`, `Name`, `Duration`) VALUES
('LV-0000', 'SUB-0000', '', 0),
('LV-0001', 'SUB-0001', 'Level 1', 600000),
('LV-0002', 'SUB-0001', 'Level 2', 600000),
('LV-0003', 'SUB-0001', 'Level 3', 600000),
('LV-0004', 'SUB-0002', 'Level 1', 600000),
('LV-0005', 'SUB-0002', 'Level 2', 600000),
('LV-0006', 'SUB-0002', 'Level 3', 600000),
('LV-0007', 'SUB-0003', 'Level 1', 600000),
('LV-0008', 'SUB-0003', 'Level 2', 600000),
('LV-0009', 'SUB-0003', 'Level 3', 600000),
('LV-0010', 'SUB-0004', 'Level 1', 600000),
('LV-0011', 'SUB-0004', 'Level 2', 600000),
('LV-0012', 'SUB-0005', 'Level 1', 600000),
('LV-0013', 'SUB-0004', 'Level 3', 600000),
('LV-0014', 'SUB-0005', 'Level 2', 600000),
('LV-0015', 'SUB-0005', 'Level 3', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `level_score`
--

CREATE TABLE `level_score` (
  `ScoreID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `LevelID` varchar(50) NOT NULL,
  `Score` int(11) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_score`
--

INSERT INTO `level_score` (`ScoreID`, `UserID`, `LevelID`, `Score`, `CreatedAt`) VALUES
('SC-0000', 'U-0000', 'LV-0000', 0, '2021-09-03 14:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QuestionID` varchar(50) NOT NULL,
  `LevelID` varchar(50) NOT NULL,
  `Question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QuestionID`, `LevelID`, `Question`) VALUES
('Q-0000', 'LV-0000', ''),
('Q-0001', 'LV-0001', 'When helping in the kitchen, I am always careful not to hurt _____.'),
('Q-0002', 'LV-0001', 'It is a name, a person, place, thing or idea. '),
('Q-0003', 'LV-0001', '\"The moon looks so beautiful.\" Identify the noun in the sentence given.'),
('Q-0004', 'LV-0001', '\"Are these mangoes tasty?\" Identify the noun in the sentence given.'),
('Q-0005', 'LV-0001', 'A ______   describes an action or state of being.'),
('Q-0006', 'LV-0001', 'Excuse me, _____ a bathroom here?'),
('Q-0007', 'LV-0001', 'Teresa ____ to read books.'),
('Q-0008', 'LV-0001', 'The cars and buses _____ very noisy today.'),
('Q-0009', 'LV-0001', 'I have two dogs _____ one cat.'),
('Q-0011', 'LV-0002', 'Verbs that show action or ownership are called _____.'),
('Q-0012', 'LV-0002', 'What should every sentence begin with?'),
('Q-0015', 'LV-0002', 'A general word that stands for a person, place, thing, or idea.'),
('Q-0016', 'LV-0002', 'Maria is from Italy, what nationality is she?'),
('Q-0017', 'LV-0002', 'Describes or modifies a verb.'),
('Q-0018', 'LV-0002', 'A word or phrase that means exactly or nearly the same as another word or phrase in the same language.'),
('Q-0019', 'LV-0002', 'Is a set of familiar words within a person\'s language.'),
('Q-0020', 'LV-0002', 'Is a phrase or expression that typically presents a figurative, non-literal meaning attached to the phrase?'),
('Q-0022', 'LV-0003', 'Playtime is over and it is time to leave your friends at the park. What will you tell them?'),
('Q-0023', 'LV-0003', 'You saw your teacher having a hard time carrying her bag full books. You want to help her. What will you say to her?'),
('Q-0025', 'LV-0003', 'You need to drink water during dinner. The pitcher of water is beside your brother. What will you tell him?'),
('Q-0026', 'LV-0003', 'Look at the picture. What adjective could be added to the sentence?\nThe balloons are in the sky.\n'),
('Q-0027', 'LV-0003', 'Look at the picture.\nWhat adjective could be added to the sentence?\nThe candy is on the table.\n'),
('Q-0028', 'LV-0003', 'What do we call a baby cat?'),
('Q-0029', 'LV-0003', 'Which phrase suggests it is in the future tense?'),
('Q-0030', 'LV-0003', 'Which of these is a question?'),
('Q-0031', 'LV-0004', 'Siya ay may dala-dalang bahay,\nPalakad lakad sa daan ay mabagal.\nAnong hayop ito?\n'),
('Q-0032', 'LV-0004', 'Ano ang salitang ugat sa salitang pasisiglahin?'),
('Q-0034', 'LV-0004', 'Ano ang kahulugan ng pandiwa?'),
('Q-0035', 'LV-0004', 'Alin sa mga sumusunod ang halimbawa ng pandiwa?'),
('Q-0036', 'LV-0004', 'Mga di kapani paniwalang pangyayari bukod sa mga katatakutan.'),
('Q-0037', 'LV-0004', 'Diyalogong nakapagpapatawa at nakakapagbigay aliw sa mga mambabasa.'),
('Q-0038', 'LV-0004', 'Mahalaga sa lipunan.'),
('Q-0039', 'LV-0004', 'Nagbibigay ng higit na rikit o ganda sa tula.'),
('Q-0040', 'LV-0004', 'Tumutukoy sa bilang ng pantig ng bawat taludtod na bumubuo sa isang saknong.'),
('Q-0041', 'LV-0005', 'Isang anyo ng panitikang katha ng isang taong naglalayong ipaabot ang kanyang damdamin at kaisipansa mga manunuod sa pamamagitan ng pagtanghal.'),
('Q-0042', 'LV-0005', 'Ang nagbibigay buhay sa tauhan sa iskrip at sila nagbibigkas ng diyalogo, nagpapakita ng iba\'t ibang damdamin, at pinanonood sa entablado'),
('Q-0043', 'LV-0005', 'Ang siyang nagpapaliwanag at nagpapakahulugan sa iskrip, nagpapasiya sa anyo ng tagpuan, damit ng mga tauhan, paraan ng pagganap at pagbigkas ng diyalogo ng mga tauhan.\n\n'),
('Q-0044', 'LV-0005', 'Kung saang pook na napiling pagtanghalan ng dula.'),
('Q-0045', 'LV-0005', 'Ang mga saksi sa mga nagtatanghal'),
('Q-0046', 'LV-0005', 'Ang pagpapalit ng iba\'t ibang tagpuan na pinangyarihan ng mga pangyayari sa dula.'),
('Q-0047', 'LV-0005', 'Ang nakasulat na diyalogo na nagsisilbing buhay ng dula sapagkat dito inihahayag ang mga galaw, damdamin at tunggalian sa dula.'),
('Q-0048', 'LV-0005', 'Ang bahaging naglalahad ng pinakamatinding damdaming inihahayag sa pamamagitan ng karurukan ng tunggalian o paglalaban-laban sa dula.'),
('Q-0049', 'LV-0005', 'Ang paglalabas-masok ng mga tauhan sa tanghalan.'),
('Q-0050', 'LV-0005', 'Ang sangkap na nagpapakita ng kalutasan, pagwawaksi at pagtatapos ng mga suliranin at tinggalian sa dula.'),
('Q-0051', 'LV-0006', 'Nagsasaad ng matinding damdamin.'),
('Q-0052', 'LV-0006', 'Pangungusap na nais makakuha ng impormasyon.'),
('Q-0054', 'LV-0006', 'Ito ay ngalan ng tao, bagay, hayop, lugar o pangyayari.'),
('Q-0055', 'LV-0006', 'Ito ay simbolo ng salita ng mga kaisipan at saloobin.'),
('Q-0056', 'LV-0006', 'Ginagamit ito ng mga Pilipino.'),
('Q-0057', 'LV-0006', 'Tinanong ka ng iyong guro kung dumating na ang school librarian ngunit hindi ka nakatitiyak kung naroon na siya. Ano ang pinakaangkop na isasagot mo sa iyong guro?'),
('Q-0058', 'LV-0006', 'Kung ang red ay pula, ano naman ang green?'),
('Q-0059', 'LV-0006', 'Kung ang tawag mo sa nanay ng nanay mo ay lola, ano naman ang tawag mo sa kapatid na babae ng nanay mo?'),
('Q-0060', 'LV-0006', 'Ano ang lasa ng asukal? '),
('Q-0061', 'LV-0007', 'The process of uniting two or more numbers into one sum, represented by the plus symbol.'),
('Q-0068', 'LV-0007', 'Find the difference of the given numbers.'),
('Q-0070', 'LV-0007', 'Find the odd numbers. '),
('Q-0071', 'LV-0008', 'This shape is a'),
('Q-0072', 'LV-0008', 'This shape is a'),
('Q-0074', 'LV-0008', 'The value of a digit based on its position within a number.'),
('Q-0075', 'LV-0008', 'The symbols used to represent numbers.'),
('Q-0076', 'LV-0008', 'A place that has 3 digits.'),
('Q-0077', 'LV-0008', 'A place that has 1 digit.'),
('Q-0080', 'LV-0008', 'Bobby had 4 library books in his desk. Today, he brought two more books from home. How many books does Bobby have in his desk now?'),
('Q-0081', 'LV-0009', 'Shows numbers and the operation sign (+, -) but not the equal sign:'),
('Q-0086', 'LV-0009', 'The quantity of a number or set of objects is called the ______________.'),
('Q-0087', 'LV-0009', 'A unit of time, 60 seconds = 1 ______________.\n'),
('Q-0088', 'LV-0009', 'A unit of time, 60 minutes equals 1 _________.'),
('Q-0089', 'LV-0009', 'The location of an object that indication under another object.'),
('Q-0090', 'LV-0009', 'Location of an object with reference to two other objects to the left of the first and the right of the second.'),
('Q-0091', 'LV-0010', 'Tinatawag ka ng iyong nanay. Ano ang dapat mong gawin?'),
('Q-0092', 'LV-0010', 'Ang pagmamano ay tanda ng pagiging ______.'),
('Q-0093', 'LV-0010', 'Mahilig kang umawit. Nais mo iparinig ito sa sa iyong lolo at lola, ano ang iyong gagawin? '),
('Q-0094', 'LV-0010', 'Maliksi ka sa larong takbuhan. Pero minsan, nadapa ka sa pagtakbo. Ano ang gagawin mo? '),
('Q-0095', 'LV-0010', 'Gusto mong gumawa ng saranggola. Pero hindi mo alam kung paano. Ano ang gagawin mo?'),
('Q-0096', 'LV-0010', 'Sobra ang sukli ng tindero, ano ang gagawin mo?'),
('Q-0097', 'LV-0010', 'Aksidenteng nabasag mo ang pinggan. Ano ang gagawin mo?'),
('Q-0098', 'LV-0010', 'Naghahabulan kayong magkakaibigan. Nasagi ka ng isa sa mga ito. Ano ang dapat mong gawin?'),
('Q-0099', 'LV-0010', 'Umuwi ka ng bahay galing paaralan. Naabutan mong nag-aaway ang iyong mga kapatid? Ano ang dapat mong gawin?'),
('Q-0100', 'LV-0010', 'Isang araw sa iyong palalakad ay nauhaw ka. Bumili ka ng isang bote ng miniral water sa tindahan. Ano ang dapat mong gawin sa boteng pinaglagyan ng tubig?'),
('Q-0101', 'LV-0011', 'Lahat tayo ay may kakayahan at kahinaan. Ang iyong kakayahan ay dapat pagyamanin. Ang iyong kahinaan ay dapat paunlarin. '),
('Q-0102', 'LV-0011', 'Lakas ng loob ang kailangan, upang magtagumpay sa lahat ng bagay. '),
('Q-0103', 'LV-0011', 'Ang talento o kakayahan ay higit na mapahahalagahan kung ito ay kinahihiya.'),
('Q-0104', 'LV-0011', 'Gutom na gutom ka na. Pumunta ka sa isang kainan pero nakita mong mahaba ang pila sa pagbili ng pagkain. Ano ang dapat mong gawin? '),
('Q-0105', 'LV-0011', 'Dalawa kayong magkaibigan na tatawid pero nakita niyong may kasabay kayong matanda. Ano ang inyong gagawin? '),
('Q-0106', 'LV-0012', 'How many planets in the solar system?'),
('Q-0107', 'LV-0012', 'The living planet.'),
('Q-0108', 'LV-0012', 'The hottest planet.'),
('Q-0109', 'LV-0012', 'Our sun is a planet.'),
('Q-0110', 'LV-0012', 'Which category of animals that gain their energy by eating plants and only plants?'),
('Q-0111', 'LV-0012', 'Which category of animals that can eat both plants and animals?'),
('Q-0113', 'LV-0012', 'Which is metal?'),
('Q-0114', 'LV-0012', 'Which animal lay eggs?'),
('Q-0115', 'LV-0012', 'All animals need food, air, and ____ to survive.'),
('Q-0116', 'LV-0011', 'Ang iyong nanay ay may sakit, hindi makagaawa ng gawaing bahay. Ano ang iyong gagawin? '),
('Q-0117', 'LV-0011', ' Piliin sa sumusunod na sitwasyon ang naglalarawan ng katatagan ng loob.'),
('Q-0118', 'LV-0011', 'Nakita mo si bert na kumokopya ng takdang-aralin kay Juan. Ano ang dapat mong gawin?'),
('Q-0119', 'LV-0011', 'Pinagsabihan ka ng iyong kaibigan dahil lagi mong kinukuha ang kanyang lapis ng hindi nagpapaalam. Ano ang magiging reaksyon mo?'),
('Q-0120', 'LV-0011', 'Sinabihan ka ng guro mo na magbasa ka palagi pagkatapos ng klase. Ano ang gagawin mo?'),
('Q-0121', 'LV-0013', 'Kinausap ka ng iyong guro at sinabihan na dapat maligo bago pumasok sa paaralan. Ano ang magiging reaksyon mo?'),
('Q-0122', 'LV-0013', 'Pinaalalahanan ka ng iyong ina dahil palagi mong inaaksaya ang tubig na iniigib ng iyong kuya. Susundin mo ba ito?'),
('Q-0123', 'LV-0013', 'Pinagsabihan ka ng ate mo na dapat magpakita ng paggalang habang nakikipag-usap sa mga nakatatanda. Ano ang reaksyon mo?'),
('Q-0124', 'LV-0013', 'Nasunugan ng bahay ang isa mong kamag-aral lahat ng gawi ay tama maliban sa isa.'),
('Q-0125', 'LV-0013', 'Umalis ang iyong nanay, ibinilin niya na ibukod ang basura sa nabubulok sa lahat ng pagkakataon upang maisama sa halaman bilang pataba. Bilang isang responsableng bata, ano ang dapat mong gawin?'),
('Q-0126', 'LV-0013', 'Paano mo mapapanatiling malusog ang iyong katawan? '),
('Q-0127', 'LV-0013', 'Mahalaga ang pagpapanatiling malusog at malakas ang katawan. Alin sa mga sumusunod ang dapat mong kainin araw-araw? '),
('Q-0128', 'LV-0013', 'Si Miko ay malabo ang paningin. Ngunit hindi niya ito sinasabi sa iba. Ngunit pansin mo ang hirap na kaniyang nararamdaman tuwing nagkakaroon ng klase ng online kumustahan. Bilang isang mabuting kaklase ni Miko, ano ang dapat mong gawin?'),
('Q-0129', 'LV-0013', 'Mahusay ka sa pagbigkas ng tula. Ano ang gagawin mo para mas mapaunlad ang iyong kakayahan?'),
('Q-0130', 'LV-0013', 'May handaan sa inyong bahay, nakita mong nahihirapan ang iyong nanay sa pag-aasikaso. Bilang isang maging mabuting anak, ano ang iyong gagawin?'),
('Q-0132', 'LV-0014', 'A state of matter which the molecule has a fixed structure, fixed shape, and fix volume.'),
('Q-0133', 'LV-0014', 'A state of matter that has no fix structure and no fix volume, it has lower density than other state of matter, what is it?'),
('Q-0134', 'LV-0014', 'It is a network organ that helps you breathe.'),
('Q-0135', 'LV-0014', 'These are considered to be liquid, except one:'),
('Q-0136', 'LV-0014', 'It is the process used by plants, algae, and certain bacteria to harness energy from sunlight and turn it into chemical energy.'),
('Q-0137', 'LV-0014', 'Which cell referred to leukocytes that are involved in protecting the body against both infectious disease and foreign invaders?'),
('Q-0138', 'LV-0014', 'The heart is an organ that pumps blood through your body. Which network organ is related to this?'),
('Q-0139', 'LV-0014', 'The brain is a complex organ that controls memory, emotion, touch, vision, and other process that regulates our body. Which network organ is related to this?'),
('Q-0141', 'LV-0015', 'A layer of the earth that has thin shell in the outside of the earth.'),
('Q-0143', 'LV-0015', 'What is the innermost layer of the Earth?'),
('Q-0144', 'LV-0015', 'What is the device used to form magnified images of distant objects? It was also used for space.'),
('Q-0145', 'LV-0015', 'The layer of gases around the Earth.'),
('Q-0146', 'LV-0015', 'A device that measures the temperature.'),
('Q-0147', 'LV-0015', 'A giant storm that is fueled by wet weather and warm ocean.'),
('Q-0148', 'LV-0015', 'The temperature, wind, clouds and precipitation.'),
('Q-0149', 'LV-0015', 'An organism that gets energy by eating dead organism, nonliving materials or waste.'),
('Q-0150', 'LV-0015', 'A community of all the living and non-living things in an area.'),
('Q-0152', 'LV-0002', 'Select the phrase that will make the sentence correct: Three days from now, the horses ____.'),
('Q-0153', 'LV-0002', 'Which word is spelled incorrectly?\n\"Dr. Leo ley the paperwork out upon the table for us to view.\" '),
('Q-0154', 'LV-0001', 'This isn\'t my phone. I\'m sure it\'s ____.'),
('Q-0155', 'LV-0003', 'You accidentally broke your seatmate\'s crayons. What will you say to her? '),
('Q-0156', 'LV-0003', 'You\'re sick and your mother took you to a doctor for a check-up, accidentally you sneeze while inside the jeep? What should you do?'),
('Q-0157', 'LV-0007', 'Find the difference of the given numbers.'),
('Q-0158', 'LV-0007', 'The process of finding the difference between two numbers, represented by a minus sign.'),
('Q-0159', 'LV-0007', 'What do you call of 0,2,4,6,8... and so on?'),
('Q-0161', 'LV-0007', 'Find the sum of the given numbers.'),
('Q-0162', 'LV-0007', 'What do you call of 3, 5, 7... and so on?'),
('Q-0163', 'LV-0007', 'Find the sum of the given numbers.'),
('Q-0164', 'LV-0008', 'One of the numbers being added.'),
('Q-0165', 'LV-0008', 'Start at the greater addend and move forward by the other addend: 1 + 2 = 1...2,3.'),
('Q-0167', 'LV-0004', 'Ang salitang maresolba ay nangangahulugang ________.'),
('Q-0168', 'LV-0006', 'Naglalahad ng obligasyong dapat tuparin.'),
('Q-0170', 'LV-0008', 'To join or put together two quantities.'),
('Q-0171', 'LV-0009', 'A symbol used to compare two numbers, with the lesser number given first.'),
('Q-0172', 'LV-0009', 'The answer to a subtraction problem.'),
('Q-0173', 'LV-0009', 'The answer to an addition problem.'),
('Q-0174', 'LV-0009', 'A distance around an object.'),
('Q-0175', 'LV-0007', 'Find two even numbers.'),
('Q-0176', 'LV-0012', 'They are sometimes called predators.'),
('Q-0177', 'LV-0014', 'Which is not gas?'),
('Q-0178', 'LV-0014', 'There are 3 fundamental states of matter, which one is different?'),
('Q-0179', 'LV-0015', 'What is earth\'s crust made of?');

-- --------------------------------------------------------

--
-- Table structure for table `question_images`
--

CREATE TABLE `question_images` (
  `ImageID` varchar(50) NOT NULL,
  `QuestionID` varchar(50) NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_images`
--

INSERT INTO `question_images` (`ImageID`, `QuestionID`, `Image`) VALUES
('IMG-0000', 'Q-0000', ''),
('IMG-0001', 'Q-0001', '61694b6ef262fENG.jpg'),
('IMG-0002', 'Q-0003', '61694ceb59aeeENG1.jpg'),
('IMG-0003', 'Q-0004', '61694d450ea81ENG2.jpg'),
('IMG-0004', 'Q-0006', '61694dcc4aebdENG3.jpg'),
('IMG-0005', 'Q-0007', '61694e960fb76ENG4.jpg'),
('IMG-0006', 'Q-0008', '61694ee236b2cENG5.jpg'),
('IMG-0007', 'Q-0009', '61694f27474cdENG6.jpg'),
('IMG-0011', 'Q-0016', '616951f78321bENG10.jpg'),
('IMG-0013', 'Q-0023', '616e9b0410ceeunnamed.jpg'),
('IMG-0014', 'Q-0025', '616e9e86444570e60394eeeb2fe435e01f9c1a36a728e.jpg'),
('IMG-0015', 'Q-0026', '616e9ed1a916aGd-1-Lang-Adjectives-Common-Q1-B.jpg'),
('IMG-0016', 'Q-0027', '616e9f70c2afcGd-1-Lang-Adjectives-Common-Q2-B.jpg'),
('IMG-0017', 'Q-0028', '616ea0fc861c9images.jpg'),
('IMG-0018', 'Q-0029', '616ea1458ea77Future-Tense-B.jpg'),
('IMG-0019', 'Q-0030', '616ea19621a0aQuestion-Cake-B.jpg'),
('IMG-0020', 'Q-0031', '6188e91b8c50eFIL1.png'),
('IMG-0022', 'Q-0034', '6188eb2a4cef9FIL3.jpg'),
('IMG-0023', 'Q-0036', '6188eca4e4186FIL4.png'),
('IMG-0024', 'Q-0037', '6188ed551c03aFIL5.png'),
('IMG-0025', 'Q-0038', '6188edbd68b83FIL6.png'),
('IMG-0026', 'Q-0041', '6188eeee3fd6fFIL7.jpg'),
('IMG-0027', 'Q-0042', '6188ef3223e83FIL9.jpg'),
('IMG-0028', 'Q-0043', '6188ef845546eFIL10.jpg'),
('IMG-0029', 'Q-0044', '6188efd80c566FIL11.jpg'),
('IMG-0030', 'Q-0045', '6188f020826f1FIL12.jpg'),
('IMG-0031', 'Q-0047', '6188f0fab0ad9FIL13.jpg'),
('IMG-0032', 'Q-0051', '6188f293bac2fFIL14.jpg'),
('IMG-0033', 'Q-0052', '6188f329be497FIL15.png'),
('IMG-0035', 'Q-0055', '6188f4f3aadb0FIL17.png'),
('IMG-0036', 'Q-0056', '6188f57a80048FIL18.jpg'),
('IMG-0037', 'Q-0057', '6188f69c1fe7eFIL19.webp'),
('IMG-0038', 'Q-0059', '6188f8b1b2442FIL20.png'),
('IMG-0039', 'Q-0060', '6188f96a00139FIL21.jpg'),
('IMG-0040', 'Q-0061', '6188fa5fe80c5MATH1.png'),
('IMG-0047', 'Q-0068', '6188fd8538d5aMATH8.jpg'),
('IMG-0049', 'Q-0070', '6188ff836a6e7MATH11.jpg'),
('IMG-0050', 'Q-0071', '618b6040c1f87MATH12.jpg'),
('IMG-0051', 'Q-0072', '618b60a716323MATH13.jpg'),
('IMG-0053', 'Q-0074', '618b6181a1ac9MATH15.jpg'),
('IMG-0054', 'Q-0075', '618b61f0305cdMATH16.jpg'),
('IMG-0055', 'Q-0076', '618b624a12fc9MATH17.jpg'),
('IMG-0056', 'Q-0077', '618b62b58c560MATH18.jpg'),
('IMG-0059', 'Q-0080', '618b645da46a4MATH21.png'),
('IMG-0060', 'Q-0081', '618b6c3422223MATH22.png'),
('IMG-0065', 'Q-0086', '618b6dfbb038fMATH27.jpg'),
('IMG-0066', 'Q-0087', '618b6e51f32a1MATH28.png'),
('IMG-0067', 'Q-0088', '618b6ee695256MATH29.jpg'),
('IMG-0068', 'Q-0089', '618b6f317374aMATH30.jpg'),
('IMG-0069', 'Q-0090', '618b6fa9df3c7MATH31.jpg'),
('IMG-0070', 'Q-0091', '618b70999a22cESP1.png'),
('IMG-0071', 'Q-0092', '618b71202cf39ESP2.jpg'),
('IMG-0072', 'Q-0093', '618b71ce11663ESP3.jpg'),
('IMG-0073', 'Q-0094', '618b72b70eb51ESP4.png'),
('IMG-0074', 'Q-0095', '618b73624f061ESP5.png'),
('IMG-0075', 'Q-0096', '618b7450dac0fESP6.jpg'),
('IMG-0076', 'Q-0097', '618b74ff1468aESP7.jpg'),
('IMG-0077', 'Q-0098', '618b76294d7f9ESP8.jpg'),
('IMG-0078', 'Q-0099', '618b76a691df8ESP9.jpg'),
('IMG-0079', 'Q-0100', '618b773e51aa1ESP10.jpg'),
('IMG-0080', 'Q-0102', '61920283167ecESP11.jpg'),
('IMG-0081', 'Q-0103', '6192035e7d70fESP12.jpg'),
('IMG-0082', 'Q-0104', '61920414170caESP13.jpg'),
('IMG-0083', 'Q-0105', '6192051174549ESP14.jpg'),
('IMG-0084', 'Q-0106', '619205aa54e0bSCIE1.jpg'),
('IMG-0085', 'Q-0107', '619205f841a42SCI2.jpg'),
('IMG-0086', 'Q-0108', '61920632ecafeSCI3.jpg'),
('IMG-0087', 'Q-0109', '61920684a6819SCI4.jpg'),
('IMG-0088', 'Q-0110', '619206d0d7807SCI5.jpg'),
('IMG-0089', 'Q-0111', '6192071d559b4SCI6.jpg'),
('IMG-0091', 'Q-0113', '619207acd33e0SCI8.jpg'),
('IMG-0092', 'Q-0114', '61920897adfbbSCI9.png'),
('IMG-0093', 'Q-0115', '619208feaa6ecSCI10.jpg'),
('IMG-0094', 'Q-0116', '619363ab6e068ESP15.png'),
('IMG-0095', 'Q-0117', '619364b050bf1ESP16.jpg'),
('IMG-0096', 'Q-0118', '619365680fd61ESP17.jpg'),
('IMG-0097', 'Q-0119', '6193660b9712eESP18.jpg'),
('IMG-0098', 'Q-0120', '6193669a02744ESP19.jpg'),
('IMG-0099', 'Q-0121', '619367d373b9bESP20.jpg'),
('IMG-0100', 'Q-0122', '619368a4ce111ESP21.jpg'),
('IMG-0101', 'Q-0123', '6193697adb760ESP22.jpg'),
('IMG-0102', 'Q-0124', '61936b420293bESP23.jpg'),
('IMG-0103', 'Q-0125', '61936e6569ce5ESP24.jpg'),
('IMG-0104', 'Q-0126', '61936f015cd6eESP25.jpg'),
('IMG-0105', 'Q-0127', '61936fa55802aESP26.jpg'),
('IMG-0106', 'Q-0128', '619370e93b6beESP29.jpg'),
('IMG-0107', 'Q-0129', '619371ae92f2aESP30.jpg'),
('IMG-0108', 'Q-0130', '619373f84ae61ESP31.jpg'),
('IMG-0110', 'Q-0132', '6193759ac499bSCI12.jpg'),
('IMG-0111', 'Q-0133', '619375c74a871SCI13.png'),
('IMG-0112', 'Q-0134', '6193765542e85SCI14.jpg'),
('IMG-0113', 'Q-0135', '619376a497441SCI15.jpg'),
('IMG-0114', 'Q-0135', '619376a4a2406SCI16.jpg'),
('IMG-0115', 'Q-0135', '619376a4ad16bSCI17.jpg'),
('IMG-0116', 'Q-0136', '6193771a94f74SCI18.jpg'),
('IMG-0117', 'Q-0137', '61937753515b3SCI19.jpg'),
('IMG-0118', 'Q-0138', '6193781c9df56SCI20.jpg'),
('IMG-0119', 'Q-0139', '6193789a7b28bSCI21.jpg'),
('IMG-0121', 'Q-0141', '619379c646150SCI23.jpg'),
('IMG-0123', 'Q-0143', '61937a460d71cSCI25.jpg'),
('IMG-0124', 'Q-0144', '61937aba2bb64SCI26.jpg'),
('IMG-0125', 'Q-0144', '61937aba3678bSCI27.png'),
('IMG-0126', 'Q-0144', '61937aba442c1SCI28.png'),
('IMG-0127', 'Q-0145', '61937bb903d8bSCI29.jpg'),
('IMG-0128', 'Q-0146', '61937c4c37afdSCI30.jpg'),
('IMG-0129', 'Q-0146', '61937c4c45675SCI31.jpg'),
('IMG-0130', 'Q-0147', '6193816a9a4e2SCI32.jpg'),
('IMG-0131', 'Q-0148', '619381acb5bbbSCI33.jpg'),
('IMG-0132', 'Q-0149', '6193821066965SCI34.jpg'),
('IMG-0133', 'Q-0150', '6193823f2ba62SCI35.jpg'),
('IMG-0135', 'Q-0152', '61a37689bacebENG8.jpg'),
('IMG-0136', 'Q-0154', '61a37cf706a4aENG7.jpg'),
('IMG-0137', 'Q-0156', '61a37e8abdfc2image.png'),
('IMG-0138', 'Q-0157', '61a3840a26562received_1765834123610708.webp'),
('IMG-0139', 'Q-0158', '61a384b865decvector-illustration-girl-holding-subtraction-600w-346694213.webp'),
('IMG-0140', 'Q-0159', '61a3862fe351aimages~2.png'),
('IMG-0142', 'Q-0161', '61a387564a1bdreceived_448088203328227.jpeg'),
('IMG-0143', 'Q-0162', '61a387ca67126images.jpeg'),
('IMG-0144', 'Q-0163', '61a38848aba62received_284407383623927.jpeg'),
('IMG-0145', 'Q-0164', '61a3893c75d76received_935526953747014.jpeg'),
('IMG-0146', 'Q-0165', '61a38ac4c237creceived_315104773573074.webp'),
('IMG-0148', 'Q-0167', '61a6a443b8512images.jpeg'),
('IMG-0149', 'Q-0168', '61a6a4fa2900aimages (1).jpeg'),
('IMG-0151', 'Q-0170', '61a849cc4a02ereceived_1085564955523854.jpeg'),
('IMG-0152', 'Q-0171', '61a84a3013f1aScreenshot_20211201_132505_com.android.gallery3d_edit_241060284543425.jpg'),
('IMG-0153', 'Q-0172', '61a84a803125bimages_edit_241273529738184.png'),
('IMG-0154', 'Q-0173', '61a84abd6322fimages.png'),
('IMG-0155', 'Q-0174', '61a84af48b38dimages (1)_edit_241534852519915.png'),
('IMG-0156', 'Q-0175', '61a84c0ead8eeimages.jpeg'),
('IMG-0157', 'Q-0176', '61a84cbbc6090images (1).jpeg'),
('IMG-0158', 'Q-0177', '61a84d71c476fScreenshot_20211201_130842_com.android.gallery3d_edit_240082167906595~4.jpg'),
('IMG-0159', 'Q-0177', '61a84d71ca089Screenshot_20211201_130842_com.android.gallery3d_edit_240082167906595~3.jpg'),
('IMG-0160', 'Q-0177', '61a84d71d0e6cScreenshot_20211201_130842_com.android.gallery3d_edit_240082167906595~2.jpg'),
('IMG-0161', 'Q-0178', '61a84dab9543e28004c0805d725a53081d6a35e104e22_edit_240037979063372.jpg'),
('IMG-0162', 'Q-0179', '61a84e4a6832eimages (1) (1).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectID` varchar(50) NOT NULL,
  `Title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID`, `Title`) VALUES
('SUB-0000', ''),
('SUB-0001', 'English'),
('SUB-0002', 'Filipino'),
('SUB-0003', 'Math'),
('SUB-0004', 'ESP'),
('SUB-0005', 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Firstname`, `Lastname`, `Username`, `Password`, `Image`) VALUES
('U-0000', '', '', '-------', '------', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `AnswerID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `QuestionID` varchar(50) NOT NULL,
  `ChoiceID` varchar(50) NOT NULL,
  `DateAnswered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`AnswerID`, `UserID`, `QuestionID`, `ChoiceID`, `DateAnswered`) VALUES
('ANS-0000', 'U-0000', 'Q-0000', 'CH-0000', '2021-09-03 17:49:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`QuestionID`);

--
-- Indexes for table `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`ChoiceID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`LevelID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `level_score`
--
ALTER TABLE `level_score`
  ADD PRIMARY KEY (`ScoreID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `LevelID` (`LevelID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `LevelID` (`LevelID`);

--
-- Indexes for table `question_images`
--
ALTER TABLE `question_images`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `question_images_ibfk_1` (`QuestionID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `QuestionID` (`QuestionID`),
  ADD KEY `user_answers_ibfk_3` (`ChoiceID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `level_score`
--
ALTER TABLE `level_score`
  ADD CONSTRAINT `level_score_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `level_score_ibfk_2` FOREIGN KEY (`LevelID`) REFERENCES `levels` (`LevelID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`LevelID`) REFERENCES `levels` (`LevelID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_images`
--
ALTER TABLE `question_images`
  ADD CONSTRAINT `question_images_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`ChoiceID`) REFERENCES `choices` (`ChoiceID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
