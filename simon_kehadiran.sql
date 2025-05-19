-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2025 at 01:42 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simon_kehadiran`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nidn` int NOT NULL,
  `nama_dosen` varchar(30) NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama_dosen`, `id_user`) VALUES
(2206231, 'Andin Ardelina', 1),
(2206232, 'Windy Anggita', 4),
(2206233, 'Putri Aulia', 6),
(2206234, 'Surya Wijaya', 7),
(2206235, 'Dedi Prasetyo', 10);

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_kehadiran` int NOT NULL,
  `tanggal` date NOT NULL,
  `pertemuan` int NOT NULL,
  `status` enum('Hadir','Alpha','Izin','Sakit') NOT NULL,
  `npm` int NOT NULL,
  `kode_matkul` varchar(5) NOT NULL,
  `kode_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `tanggal`, `pertemuan`, `status`, `npm`, `kode_matkul`, `kode_kelas`) VALUES
(1, '2025-02-11', 1, 'Hadir', 330102065, 'SBD04', 'KLS03'),
(2, '2025-02-12', 1, 'Izin', 330102066, 'FIS02', 'KLS05'),
(3, '2025-02-13', 2, 'Sakit', 330102067, 'JRM05', 'KLS04'),
(4, '2025-02-14', 2, 'Alpha', 330102068, 'MTK01', 'KLS01'),
(5, '2025-02-15', 3, 'Hadir', 330102069, 'PGR03', 'KLS02');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(5) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nama_kelas`) VALUES
('KLS01', 'A'),
('KLS02', 'B'),
('KLS03', 'C'),
('KLS04', 'D'),
('KLS05', 'E');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int NOT NULL,
  `nama_mahasiswa` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `id_user` int NOT NULL,
  `kode_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mahasiswa`, `email`, `id_user`, `kode_kelas`) VALUES
(330102065, 'Ji Rizky Cahyusna', 'jicantik12@gmail.com', 2, 'KLS03'),
(330102066, 'Ibnu Zaki', 'ibnuzaki@gmail.com', 5, 'KLS05'),
(330102067, 'Amelia Zahra', 'amelia@gmail.com', 8, 'KLS04'),
(330102068, 'Santosa Setiya', 'santosa@gmail.com', 9, 'KLS01'),
(330102069, 'Sarah Amaleya', 'sarah@gmail.com', 11, 'KLS02');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode_matkul` varchar(5) NOT NULL,
  `nama_matkul` varchar(30) NOT NULL,
  `npm` int NOT NULL,
  `nidn` int NOT NULL,
  `kode_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode_matkul`, `nama_matkul`, `npm`, `nidn`, `kode_kelas`) VALUES
('FIS02', 'Fisika', 330102066, 2206233, 'KLS05'),
('JRM05', 'Jaringan Komputer', 330102067, 2206232, 'KLS04'),
('MTK01', 'Matematika Dasar', 330102068, 2206234, 'KLS01'),
('PGR03', 'Pemrograman Web', 330102069, 2206231, 'KLS02'),
('SBD04', 'Sistem Basis Data', 330102065, 2206235, 'KLS03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'Andin Ardelina', 'andin03', 'dosen'),
(2, 'Ji Rizky Cahyusna', 'nana12', 'mahasiswa'),
(3, 'Hana Kurnia', 'hana14', 'admin'),
(4, 'Windy Anggita', 'windy23', 'dosen'),
(5, 'Ibnu Zaki', 'ibnu22', 'mahasiswa'),
(6, 'Putri Aulia', 'putri29', 'dosen'),
(7, 'Surya Wijaya', 'surya30', 'dosen'),
(8, 'Amelia Zahra', 'amel91', 'mahasiswa'),
(9, 'Santosa Setiya', 'santosa76', 'mahasiswa'),
(10, 'Dedi Prasetyo', 'dedi56', 'dosen'),
(11, 'Sarah Amaleya', 'sarah40', 'mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD UNIQUE KEY `unique_kehadiran` (`npm`,`tanggal`,`pertemuan`),
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `kode_kelas` (`kode_kelas`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `kode_kelas` (`kode_kelas`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD KEY `npm` (`npm`),
  ADD KEY `nidn` (`nidn`),
  ADD KEY `kode_kelas` (`kode_kelas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_kehadiran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kehadiran_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kehadiran_ibfk_3` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matkul_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matkul_ibfk_3` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
