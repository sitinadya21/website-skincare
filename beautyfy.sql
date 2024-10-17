-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2024 at 04:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beautyfy`
--

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_transaksi`, `id_pelanggan`, `id_produk`, `harga_beli`, `jumlah_pesanan`, `status`) VALUES
(1, 1, 22, 6, 78400, 1, 'Done'),
(2, 2, 22, 9, 50000, 1, 'Done'),
(3, 2, 22, 10, 90000, 1, 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_balasan` int(11) DEFAULT 0,
  `id_users` int(11) DEFAULT 0,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `tgl_komentar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_komentar` varchar(50) NOT NULL DEFAULT 'Komentar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `harga_ongkir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `kabupaten`, `kecamatan`, `harga_ongkir`) VALUES
(2, 'Bandar Lampung', 'Wilayah Bandar Lampung', 20000),
(3, 'Metro', 'Luar Bandar Lampung', 50000),
(4, 'Lampung Tengah', 'Luar Bandar Lampung', 50000),
(5, 'Lampung Timur', 'Luar Bandar Lampung', 50000),
(6, 'Lampung Selatan', 'Luar Bandar Lampung', 50000),
(8, 'Lampung Utara', 'Luar Bandar Lampung', 70000),
(9, 'Lampung Barat', 'Luar Bandar Lampung', 70000),
(10, 'Pesisir Barat', 'Luar Bandar Lampung', 100000),
(11, 'Tanggamus', 'Luar Bandar Lampung', 60000),
(12, 'Way Kanan', 'Luar Bandar Lampung', 80000),
(13, 'Way Kanan', 'Luar Bandar Lampung', 80000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `telepon`, `email`, `password`, `tgl_daftar`) VALUES
(22, 'nadya', '082177856185', 'nadyandr21@gmail.com', '1234', '2022-07-28 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `metode_pembayaran` varchar(25) NOT NULL,
  `bukti_transfer` text NOT NULL,
  `status_pembayaran` varchar(25) NOT NULL DEFAULT 'Pending',
  `keterangan_pembayaran` text NOT NULL,
  `tgl_pembayaran` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `merek` varchar(25) NOT NULL,
  `kategori_produk` varchar(50) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `gambar_produk` text NOT NULL,
  `tgl_produk` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `klik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_users`, `nama_produk`, `merek`, `kategori_produk`, `deskripsi_produk`, `harga_produk`, `stok`, `berat`, `gambar_produk`, `tgl_produk`, `klik`) VALUES
(6, 4, 'Handbody', '', 'Pelembab', 'Mencerahkan kulit', 80000, 10, 50, '487f30c1a4cd52ece4da8f0f9d1c59ed.jpg', '2024-07-05 12:18:52', 2),
(9, 4, 'Serum AHA & BHA', '', 'Pembersih Wajah', 'Membersihkan wajah ', 50000, 10, 50, 'bf3bb3070d1ab76175d8eea08ccfcb7f.jpg', '2024-07-05 13:53:30', 2),
(10, 4, 'Whitening capsule', '', 'Pelembab', 'Mencerahkan dan melembapkan kulit', 90000, 20, 50, 'ea12d12c2d08ae1e33a6754d837868bb.jpg', '2022-09-01 09:23:15', 8),
(11, 4, 'Micellar Water', '', 'Pembersih Wajah', 'Membersihkan wajah dari kotoran ', 30000, 10, 50, '9078ddc76da7e09cc7c0a02f008b49fc.jpg', '2022-07-28 10:17:44', 0),
(12, 4, 'Paket Acne', '', 'Pelembab', 'Menghilangkan jerawat ', 120000, 12, 70, '6bc751aa01e68b184524d8c44dea4eec.jpg', '2022-07-28 10:19:43', 0),
(13, 4, 'Paket Whitening', '', 'Pembersih Wajah', 'Mencerahkan kulit dalam 2 minggu', 250000, 10, 80, '9668e69068159c6391c1e40effa4ab45.jpg', '2022-07-28 10:21:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `grandtotal` int(50) DEFAULT NULL,
  `total_berat` int(11) DEFAULT NULL,
  `id_ongkir` int(11) DEFAULT NULL,
  `alamat_pengiriman` text DEFAULT NULL,
  `jasa_pasang` varchar(20) DEFAULT NULL,
  `status_transaksi` varchar(20) DEFAULT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `keterangan`, `grandtotal`, `total_berat`, `id_ongkir`, `alamat_pengiriman`, `jasa_pasang`, `status_transaksi`, `tgl_transaksi`) VALUES
(1, 22, NULL, 78400, 50, 2, 'Teluk Betung', NULL, 'Pending', '2022-08-01 13:40:26'),
(2, 22, NULL, 140000, 100, 2, 'Tester', NULL, 'Pending', '2022-09-01 09:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` text NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `nama_industri` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tahun_berdiri` int(4) NOT NULL,
  `produk` text NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `email`, `password`, `name`, `photo`, `isAdmin`, `nama_industri`, `alamat`, `tahun_berdiri`, `produk`, `telepon`) VALUES
(4, 'admin@gmail.com', 'admin', 'Admin', '', 1, '', '', 0, '', '628');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
