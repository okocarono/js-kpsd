-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 05:36 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kp_sd`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_extra`
--

CREATE TABLE `ambil_extra` (
  `nis` char(4) NOT NULL,
  `id_extra` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ambil_extra`
--

INSERT INTO `ambil_extra` (`nis`, `id_extra`) VALUES
('1234', '234'),
('1232', '3245'),
('', ''),
('1234', '234'),
('1232', '3245'),
('', ''),
('1241', '123'),
('1254', '115'),
('', '');

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE `beli` (
  `nis` char(4) NOT NULL,
  `kode_buku` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beli`
--

INSERT INTO `beli` (`nis`, `kode_buku`) VALUES
('1241', 'B01'),
('1241', 'B02'),
('1241', 'B03'),
('1241', '123'),
('1241', '321'),
('1254', '223'),
('', ''),
('1241', '123'),
('1241', '321'),
('1254', '223'),
('', ''),
('1241', '123'),
('1241', '321'),
('1254', '223');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(11) NOT NULL,
  `nama_buku` varchar(20) NOT NULL,
  `harga` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `nama_buku`, `harga`) VALUES
('B01', 'IPA', 20000),
('B02', 'Matematika', 25000),
('B03', 'Bahasa Indonesia', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `ekstrakulikuler`
--

CREATE TABLE `ekstrakulikuler` (
  `id_ekstra` varchar(10) NOT NULL,
  `nama_ekstra` varchar(40) NOT NULL,
  `harga_ekstra` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `les`
--

CREATE TABLE `les` (
  `nis` char(4) NOT NULL,
  `status` varchar(5) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `les`
--

INSERT INTO `les` (`nis`, `status`, `harga`) VALUES
('1234', 'Ya', 0),
('1241', '0', 40000),
('1241', '0', 40000),
('1241', '1', 0),
('1241', '0', 0),
('1241', 'YA', 0),
('1241', '0', 0),
('1241', 'YA', 0),
('1241', 'TIDAK', 0);

-- --------------------------------------------------------

--
-- Table structure for table `melakukan`
--

CREATE TABLE `melakukan` (
  `nis` char(4) NOT NULL,
  `id_pembayaran` varchar(10) NOT NULL,
  `bulanBayar` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `melakukan`
--

INSERT INTO `melakukan` (`nis`, `id_pembayaran`, `bulanBayar`) VALUES
('1241', '1234567898', 1),
('1241', '7645389763', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `nis` char(4) NOT NULL,
  `donatur` int(6) NOT NULL,
  `pengembangan` int(6) NOT NULL,
  `pembelajaran_quran` int(6) NOT NULL,
  `buku` int(6) NOT NULL,
  `extra` int(6) NOT NULL,
  `les` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `nis`, `donatur`, `pengembangan`, `pembelajaran_quran`, `buku`, `extra`, `les`) VALUES
('1234567898', '', 50000, 100000, 60000, 0, 0, 0),
('7645389763', '', 50000, 30000, 10000, 10000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(4) NOT NULL,
  `nama_siswa` varchar(40) NOT NULL,
  `kelas` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama_siswa`, `kelas`) VALUES
('1241', 'Albin Ramadhani ?Adlros', '6'),
('1254', 'Listiyanti Devi Astuti', '6'),
('1273', 'M. Shawal Ziddan Hamdani', '6'),
('1281', 'Sulthon Alif Zidan', '6'),
('1283', 'Ahmad Faiq Aldino', '6'),
('1284', 'Amelia Alvira Putri', '6'),
('1286', 'Chintya Zaskia Mecca', '6'),
('1289', 'Flora Mutiara Jasmine', '6'),
('1290', 'Ganda Himawan', '6'),
('1291', 'Hilmi Ahmad Dzakwan', '6'),
('1293', 'Kurnia Rizqi Erlambang', '6'),
('1297', 'Muhammad Raihan Avrianda', '6'),
('1299', 'Nurul Shafa Azzahra', '6'),
('1302', 'Tazkia Awalista Bepra', '6'),
('1303', 'Via Salsabila Andreaningrum', '6'),
('1304', 'Yasfa Pudi Reswara', '6'),
('1312', 'Keanu Shaloom Firdhausa', '6'),
('1313', 'Achmad Khabib Al?fatah', '5'),
('1314', 'Adelia Hariutami Nur Asmuri', '5'),
('1315', 'Adzkia Fatimah Az-Zahra', '5'),
('1316', 'Ahmad Fahri Firdausi', '5'),
('1318', 'Arka Frilandauf Pratama', '5'),
('1319', 'Arya Adiyta Saputra', '5'),
('1320', 'Aulia Keysya Azzahra', '5'),
('1321', 'Deo Rizky Aquila', '5'),
('1322', 'Devina Ardelia Agustin', '5'),
('1323', 'Dhuha Fawwasani Bepra', '5'),
('1324', 'Dini Wulandari', '5'),
('1325', 'Elfina Novita Fidela', '5'),
('1327', 'Gilang Ersa Aribuana', '5'),
('1328', 'Hidratul Fajr Syittan Pasa', '5'),
('1329', 'Kantata Dellano Akbar', '5'),
('1330', 'Lathif Bintang Ramadhani', '5'),
('1331', 'Mailina Ihya Nashafiyah', '5'),
('1332', 'M. Hafiz Al Buchorimuslim', '5'),
('1333', 'M. Nizam Biyadillah', '5'),
('1334', 'Muhammad Rafa Ardinsyah', '5'),
('1336', 'Qurrota A?yunin', '5'),
('1337', 'Raka Pandu Pratama', '5'),
('1338', 'Sofyan Sulaiman Alfarosani', '5'),
('1339', 'Syaffa Az Zahra Amintha P.', '5'),
('1340', 'Varell Dwiarsya', '5'),
('1341', 'Yuliana Dhamayanti', '5'),
('1342', 'Brian Damar Zaenal Arif R.', '5'),
('1348', 'Aqilla Zahra Putri', '6'),
('1349', 'Latif Ihsanul Fikri', '5'),
('1351', 'Fuza Imani', '5'),
('1353', 'Abisatya Putra Endani', '4'),
('1357', 'Chelsy Diah Ayu Putrisiawati', '4'),
('1358', 'Dika Ananda Yuliyanto', '4'),
('1359', 'Diva Hofi Saputra', '4'),
('1360', 'Dona Asmara Putri', '4'),
('1361', 'Fadhila Putri Azizah', '4'),
('1362', 'Fahmi Ahmad Mafazi', '4'),
('1363', 'Fitriana Aurellia Putri', '4'),
('1365', 'Gema Sabda Bhaskara', '4'),
('1366', 'Juwita Andini', '4'),
('1367', 'Keisha Putri Nursin', '4'),
('1368', 'Muhammad Devan Rafandra', '4'),
('1369', 'Muhammad Fajri Adiansyah', '4'),
('1370', 'Muhammad Rizky', '4'),
('1371', 'Muhammad Rizky Destian', '4'),
('1372', 'Niza Salsabila', '4'),
('1373', 'Nur Miftaqul Jannah', '4'),
('1374', 'Red Aelensophi Barutu', '4'),
('1376', 'Shifa Umairoh', '4'),
('1379', 'Muhammad Safa'' Albana', '6'),
('1380', 'Anggita Ferdian Tirtana', '3'),
('1381', 'Anindita Putri Kirani', '3'),
('1382', 'Ayesha Fazlemawla R', '3'),
('1383', 'Bintan Aidil Fitrah', '3'),
('1384', 'Davin Ananda Budiyanto', '3'),
('1385', 'Diva Najwa Khairu Nisa', '3'),
('1386', 'Diyaana Nufaisah Syuhadak', '3'),
('1387', 'Fachri Fadhil Muhammad', '3'),
('1388', 'Fauzan Daffa Damar Satria', '3'),
('1389', 'Firdaus Aryasatya', '3'),
('1391', 'Haifa Mahendra', '3'),
('1392', 'Muhammad Alvino Yusuf Prasetyo', '3'),
('1394', 'Muhammad Rayyan Athallah', '3'),
('1395', 'Muhammad Reza Al-Farabi', '3'),
('1396', 'Muhaulifyan Afdha Putra Farhan', '3'),
('1398', 'Nadya Intan Nur Azizah', '3'),
('1399', 'Naelatuz Zahro', '3'),
('1400', 'Nahl Priya Prakosa', '3'),
('1401', 'Naufal Ulin Nuha', '3'),
('1402', 'Naura Mecca Hadjani', '3'),
('1403', 'Nimas Lintang S', '3'),
('1404', 'Nizwa Zahra Andanita', '3'),
('1406', 'Putri Auliya Dewi', '3'),
('1407', 'Quaneisha Mahya Haniqurrahma', '3'),
('1408', 'Rafi Firdhan Ma?ruf', '3'),
('1409', 'Raihana Miskah Salsabila', '3'),
('1410', 'Rehana Sava Darmawanti', '3'),
('1411', 'Rifa?ah Khaasyi? Salma', '3'),
('1412', 'Rosyidah Al Munawaroh', '3'),
('1413', 'Titis Maahyas Hayundia P.A.', '3'),
('1414', 'Yasmin Meilina Rahayu', '3'),
('1416', 'Muhammad Gettafijrat Raya', '5'),
('1417', 'Novita Riyana Putri', '4'),
('1420', 'Abdullah Azzam Sabilil Haq', '2'),
('1421', 'Angela Permatasari', '2'),
('1423', 'Bhagaskara Adiyatma Marendra', '2'),
('1424', 'Dafa Febrian', '2'),
('1425', 'Davino Beriq Maulana', '2'),
('1426', 'Davis Jovan Agus Pratama', '2'),
('1427', 'Dhafa Arviansyah', '2'),
('1428', 'Diva Nur Sholikhah', '2'),
('1429', 'Fadhiel Dienul Islam', '2'),
('1430', 'Feby Fitri Ardiana', '2'),
('1431', 'Halimatus Sa?diyah', '2'),
('1432', 'Ibrahim Putra Hafidz', '2'),
('1433', 'Janeeta Raras Astwatri', '2'),
('1434', 'Kanaya Fitria Ramadhani', '2'),
('1435', 'Karan Wistara Hidayat', '2'),
('1436', 'Khansa Putri Nursin', '2'),
('1437', 'Khoirul Mushthofa', '2'),
('1438', 'Layyinatusy Syifa?', '2'),
('1439', 'Maulana Putra Pratama', '2'),
('1440', 'Muhammad Fauza Latif', '2'),
('1441', 'Nadio Bagas Syahputra', '2'),
('1442', 'Naraya Ramadhan', '2'),
('1443', 'Naufal Ihza Mahendra', '2'),
('1445', 'Permata Aisyah', '2'),
('1446', 'Tatah Jowo Kawentar', '2'),
('1448', 'Ferdi Setiawan', '2'),
('1449', 'Wildan Muhadzdzib Alam', '2'),
('1450', 'Yoannita Gendhis Revasha', '2'),
('1451', 'Yumna Dinnur Rohmah', '2'),
('1452', 'R. Ilham Ega Saputra Rahmadani Zen', '3'),
('1453', 'Syaila Nanda Mahyari', '4'),
('1455', 'Choirunnisa Mafaza Fazda''un Nida', '5'),
('1457', 'Anandya Akhnaf Pradipta', '6'),
('1460', 'AHMAD HANIF FAISAL HAQQI', '1'),
('1461', 'AI FAIDATUL NI?MAH', '1'),
('1462', 'AISYAH', '1'),
('1463', 'ALYANA NUR AINI', '1'),
('1464', 'ANZILA ULAYYA  AZKA', '1'),
('1465', 'AZ ZAHRA IMUTHIA ALISHA CITRA', '1'),
('1466', 'BALQIS FAIHA PUTRI SUBAKTI', '1'),
('1467', 'CAESARO RIZKY PUTRA PRAMONO', '1'),
('1468', 'DHANI ASMORO PUTRO', '1'),
('1469', 'EMERALDI YUDA PUTRA P', '1'),
('1470', 'FADIL TAAT RAMADHAN', '1'),
('1471', 'FELLYCIANO HENDTA NAUVALY J', '1'),
('1472', 'GALANG ABI MUSTOFA', '1'),
('1473', 'GILANG NAZRIL MUSTOFA', '1'),
('1475', 'HELMI ARDIYAN HUTOMO', '1'),
('1476', 'HILMA RANAA SYARIFAH', '1'),
('1477', 'HIMAWAN ABDULLAH', '1'),
('1478', 'JOVINNO FABIAN HASYA', '1'),
('1479', 'MARCELLA MITA ANGGRAINI', '1'),
('1480', 'MAURA PUTRI SUMARIYATI', '1'),
('1481', 'MUH RAFIQ MUMTAZA AL FAREZY', '1'),
('1482', 'NUHA RIZKYA CHORI', '1'),
('1483', 'SALMA NISRINA', '1'),
('1484', 'TANAYA SHOFY NURWACHIDAH', '1'),
('1485', 'TIKSNA NARYANA PUTERA NAHDI', '1'),
('1986', 'Rani Oktafiana Putri', '3');

-- --------------------------------------------------------

--
-- Table structure for table `tagihanbulanan`
--

CREATE TABLE `tagihanbulanan` (
  `nis` char(4) NOT NULL,
  `biayabulanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `ekstrakulikuler`
--
ALTER TABLE `ekstrakulikuler`
  ADD PRIMARY KEY (`id_ekstra`);

--
-- Indexes for table `les`
--
ALTER TABLE `les`
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `melakukan`
--
ALTER TABLE `melakukan`
  ADD KEY `melakukan` (`nis`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tagihanbulanan`
--
ALTER TABLE `tagihanbulanan`
  ADD KEY `tagihanbulanan` (`nis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `melakukan`
--
ALTER TABLE `melakukan`
  ADD CONSTRAINT `melakukan` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`),
  ADD CONSTRAINT `melakukan_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`);

--
-- Constraints for table `tagihanbulanan`
--
ALTER TABLE `tagihanbulanan`
  ADD CONSTRAINT `tagihanbulanan` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
