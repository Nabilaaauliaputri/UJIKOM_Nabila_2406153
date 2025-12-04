-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Des 2025 pada 01.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `tanggal_input` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `kategori`, `gambar`, `id_kategori`, `tanggal_input`) VALUES
(1103, 'Corat-Coret di Toilet	', 'Eka Kurniawan	', 'Yayasan Aksara Indonesia', '2000', 0, '256305356_corat.png', 1, '2025-11-29 07:41:36'),
(1104, 'Filosofi Teras', 'Henry Manampiring', 'PT Kompas Media Nusantara', '2018', 0, '1206844542_filosofi.png', NULL, '2025-11-29 07:43:24'),
(1105, 'Di Bawah Bendera Revolusi	', 'Soekarno', 'Panitia Penerbit DBR', '1959', 0, '1590737154_bendera.png', NULL, '2025-11-29 07:45:14'),
(1106, 'Cantik Itu Luka', 'Eka Kurniawan	', 'Jendela & AKY', '2002', 0, '1831193988_cantik.png', NULL, '2025-11-29 07:46:27'),
(1107, 'Supernova: Kesatria, Puteri, dan Bintang Jatuh	', 'Dee Lestari', 'KPG', '2001', 0, '1035099203_super.png', NULL, '2025-11-29 08:06:03'),
(1108, 'Bumi Manusia	', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', 0, '1152604589_bumi.png', NULL, '2025-11-29 08:08:11'),
(1109, 'Laskar Pelangi', 'Andrea Hirata	', 'Bentang Pustaka', '2005', 0, '1061328247_laskar.png', NULL, '2025-11-29 08:09:50'),
(1110, 'The Alchemist (Sang Alkemis)	', 'Paulo Coelho	', 'Editora Rocco (Brasil)', '1988', 0, '1630185122_sang alkemis.png', NULL, '2025-11-29 08:22:15'),
(1111, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin (Inggris)', '1937', 0, '1157276266_the hobbit.png', NULL, '2025-11-29 08:24:00'),
(1112, 'A Man Called Ove (Seorang Pria Bernama Ove)', 'Fredrik Backman', 'Forum (Swedia)', '2012', 0, '1859911861_a man.png', NULL, '2025-11-29 08:29:33'),
(1113, 'Rich Dad Poor Dad	', 'Robert Kiyosaki', 'Techpress, Inc. (AS)', '1997', 0, '785987758_rich.png', NULL, '2025-11-29 08:30:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tanggal_input` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tanggal_input`) VALUES
(1, 'Novel', '2025-11-29 06:32:42'),
(2, 'Pendidikan', '2025-11-29 06:32:43'),
(3, 'Teknologi', '2025-11-29 06:32:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Nabila Aulia', 'nabila10070@gmail.com', 'NAbila12345'),
(2, 'Ati kusmiati', 'ati@gmail.com', 'sti12345678');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1114;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
