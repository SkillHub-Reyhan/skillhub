-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 202.155.94.145:51102
-- Generation Time: Nov 22, 2025 at 09:11 PM
-- Server version: 12.1.2-MariaDB-ubu2404
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skillhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `instructor` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `instructor`, `deleted_at`, `created_at`, `updated_at`) VALUES
('019aac3d-d749-718d-9d4e-0e4546377aaf', 'Desain Grafis', 'Kuasai Adobe Photoshop dan Illustrator untuk kebutuhan branding dan media sosial.', 'Aditya Mahendra', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d76f-71dc-b488-ac5fa0eb50ed', 'Pemrograman Dasar', 'Fundamental logika coding menggunakan Python dan Algoritma dasar bagi pemula.', 'Eko Kurniawan', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d794-72e3-b29b-53c53e69ec2c', 'Editing Video', 'Teknik cutting, coloring, dan transisi video cinematic menggunakan Premiere Pro.', 'Chandra Liow', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d7bb-710b-8ca7-b4924cbc5c75', 'Public Speaking', 'Cara mengatasi gugup dan berbicara dengan percaya diri di depan umum.', 'Merry Riana', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d7e3-7072-bd0a-ebb294945f77', 'Entrepreneurship', 'Membangun mindset pengusaha dan merancang model bisnis canvas yang solid.', 'Sandiaga Uno', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d809-7093-9599-7d43c500828f', 'Fashion Design', 'Mengenal pola dasar, sketsa busana, dan pemilihan bahan tekstil.', 'Ivan Gunawan', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d834-724d-8b13-630d51f31ada', 'Multimedia', 'Integrasi audio, video, dan animasi untuk produksi konten digital interaktif.', 'Dedy Corbuzier', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d857-7214-92d7-ea098ce8ec29', 'Broadcast', 'Teknik penyiaran televisi, reportase berita, dan manajemen studio siaran.', 'Najwa Shihab', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac41-1c09-73cc-859e-6180c8aa06da', 'Test', 'Ini kelas test', 'Budi', '2025-11-22 15:53:49', '2025-11-22 15:48:59', '2025-11-22 15:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `course_student`
--

CREATE TABLE `course_student` (
  `id` char(36) NOT NULL,
  `student_id` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_student`
--

INSERT INTO `course_student` (`id`, `student_id`, `course_id`, `created_at`, `updated_at`) VALUES
('019aac3d-d8be-725b-ba3c-e9253dcfb691', '019aac3d-d890-701f-99ec-1cb27aec7dc5', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d8ea-7296-ab32-b703cc0324fc', '019aac3d-d890-701f-99ec-1cb27aec7dc5', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d93c-7369-80ff-ea6ab0dbc8f7', '019aac3d-d913-708b-a40f-24061b61d593', '019aac3d-d749-718d-9d4e-0e4546377aaf', '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d964-7189-83fe-8bab979b87c9', '019aac3d-d913-708b-a40f-24061b61d593', '019aac3d-d794-72e3-b29b-53c53e69ec2c', '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d9bb-7133-83bb-c45eeed672fb', '019aac3d-d994-71af-a42b-f12bbdd32eda', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-da0e-70f7-8224-bbead9926862', '019aac3d-d9e4-71be-9205-4ef1d1647e25', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-da5a-7023-93bc-276f4f5e314b', '019aac3d-da33-7276-bdc3-5fff09818cba', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-da7f-729e-a194-7a92c19933aa', '019aac3d-da33-7276-bdc3-5fff09818cba', '019aac3d-d7e3-7072-bd0a-ebb294945f77', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-daa5-70d5-a0ad-e9febec69c9c', '019aac3d-da33-7276-bdc3-5fff09818cba', '019aac3d-d857-7214-92d7-ea098ce8ec29', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-daf7-717a-8134-a1ac66911592', '019aac3d-dacb-7171-b351-9f5ad2f0b099', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-db1f-701f-8a3e-055e764907e1', '019aac3d-dacb-7171-b351-9f5ad2f0b099', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-db49-7165-a9ab-0c8fc8ce56e7', '019aac3d-dacb-7171-b351-9f5ad2f0b099', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dba6-73b6-9893-81347f5c6238', '019aac3d-db72-72d4-bbb1-b349ed396a20', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dbfc-729d-8718-efd528d1a30f', '019aac3d-dbd3-7330-88d1-804c277c844f', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dc56-71d1-ab1d-a4e340e82028', '019aac3d-dc23-72b6-aec3-aebc9585e8cc', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dc7e-7363-b0eb-8bbb87ac25f5', '019aac3d-dc23-72b6-aec3-aebc9585e8cc', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dca4-71f6-bf12-62f21e1d3b7e', '019aac3d-dc23-72b6-aec3-aebc9585e8cc', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dcf5-73aa-815b-680839a363cf', '019aac3d-dcce-7385-bf71-fef50251b153', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dd44-70c3-b28d-701cfeff29c3', '019aac3d-dd1d-701c-b98b-461e3663c3ca', '019aac3d-d7e3-7072-bd0a-ebb294945f77', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dd6c-7103-a04a-dc99603cb7a8', '019aac3d-dd1d-701c-b98b-461e3663c3ca', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dd94-716d-a183-de9529f12ff6', '019aac3d-dd1d-701c-b98b-461e3663c3ca', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-ddff-7367-96aa-b3bd7e5df085', '019aac3d-ddc4-72e1-8310-1bc61b970b6e', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-de2d-72cb-8040-4996c521a036', '019aac3d-ddc4-72e1-8310-1bc61b970b6e', '019aac3d-d7e3-7072-bd0a-ebb294945f77', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-de5a-7009-b023-9debb468b4ea', '019aac3d-ddc4-72e1-8310-1bc61b970b6e', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-deb1-7054-9238-a2365f6e6ba1', '019aac3d-de8d-71a2-8869-444fd78cb18e', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-ded9-7247-850f-a12f4415a55a', '019aac3d-de8d-71a2-8869-444fd78cb18e', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-df2c-712c-876b-938e4b00fdbd', '019aac3d-df04-70d0-b071-8b3cee70f910', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-df55-702e-8185-72c87f022eee', '019aac3d-df04-70d0-b071-8b3cee70f910', '019aac3d-d7e3-7072-bd0a-ebb294945f77', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-dfa9-72e0-9354-3f703295d4dd', '019aac3d-df80-7380-b19a-e3c3a5d08863', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-dffb-70e3-aacb-b86a9f7e7172', '019aac3d-dfd3-7260-b630-7c793e13e647', '019aac3d-d749-718d-9d4e-0e4546377aaf', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e024-7133-943e-def6580113fe', '019aac3d-dfd3-7260-b630-7c793e13e647', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e04d-7249-b628-67ba38d53a43', '019aac3d-dfd3-7260-b630-7c793e13e647', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e0a1-71b0-861b-f292c002c4b2', '019aac3d-e078-73a7-a9bb-b953a6cd29e4', '019aac3d-d749-718d-9d4e-0e4546377aaf', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e0cd-7016-a91d-3f5a50f19e00', '019aac3d-e078-73a7-a9bb-b953a6cd29e4', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e0f4-70a1-a400-64cc2ca812ca', '019aac3d-e078-73a7-a9bb-b953a6cd29e4', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e141-701c-9aa2-44a07c063c55', '019aac3d-e11b-72e3-bd89-91a8954c6c1d', '019aac3d-d809-7093-9599-7d43c500828f', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e175-72c7-bf95-4688cd2c9a63', '019aac3d-e11b-72e3-bd89-91a8954c6c1d', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e1a9-7287-80f5-d33799e6d6be', '019aac3d-e11b-72e3-bd89-91a8954c6c1d', '019aac3d-d857-7214-92d7-ea098ce8ec29', '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e291-72f1-9ebc-a4851c9387b8', '019aac3d-e1d3-73d4-bc96-39b9eaea8f91', '019aac3d-d76f-71dc-b488-ac5fa0eb50ed', '2025-11-22 15:45:28', '2025-11-22 15:45:28'),
('019aac3d-e2b7-712a-9817-4266c822b682', '019aac3d-e1d3-73d4-bc96-39b9eaea8f91', '019aac3d-d7bb-710b-8ca7-b4924cbc5c75', '2025-11-22 15:45:28', '2025-11-22 15:45:28'),
('019aac3d-e2dd-739a-9930-8c10bc9b5937', '019aac3d-e1d3-73d4-bc96-39b9eaea8f91', '019aac3d-d7e3-7072-bd0a-ebb294945f77', '2025-11-22 15:45:28', '2025-11-22 15:45:28'),
('019aac3d-e326-7152-a030-92cefa9b8c2d', '019aac3d-e303-7275-bbb8-52e19344dc56', '019aac3d-d834-724d-8b13-630d51f31ada', '2025-11-22 15:45:28', '2025-11-22 15:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2025_11_22_113632_create_students_table', 1),
(3, '2025_11_22_113639_create_courses_table', 1),
(4, '2025_11_22_113645_create_course_student_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OJzBXjZprQpdEyp3unVJq8301YQITQ5t8VKtHIGI', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEh2ZkhwT1p4UDU2YlVHR21NMjZyQzlPQ2RScFB1R3FqSDVXT2ZHYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aWtpL2RvY3NfdXNlciI7czo1OiJyb3V0ZSI7czo5OiJ3aWtpLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1763845378);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `deleted_at`, `created_at`, `updated_at`) VALUES
('019aac3d-d890-701f-99ec-1cb27aec7dc5', 'Heru Saputra', 'pratiwi.halima@gmail.com', '(+62) 754 5367 3191', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d913-708b-a40f-24061b61d593', 'Ifa Fitriani Nasyidah S.H.', 'cecep.anggriawan@yahoo.co.id', '(+62) 22 1589 0581', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d994-71af-a42b-f12bbdd32eda', 'Rusman Edison Irawan S.H.', 'wardi26@gmail.co.id', '0269 3388 202', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-d9e4-71be-9205-4ef1d1647e25', 'Maria Hartati', 'pnashiruddin@yahoo.co.id', '(+62) 753 6664 359', NULL, '2025-11-22 15:45:25', '2025-11-22 15:45:25'),
('019aac3d-da33-7276-bdc3-5fff09818cba', 'Cornelia Prastuti', 'flaksmiwati@yahoo.com', '0790 0396 8260', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dacb-7171-b351-9f5ad2f0b099', 'Irma Ifa Riyanti', 'darsirah.damanik@gmail.co.id', '0504 9055 3223', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-db72-72d4-bbb1-b349ed396a20', 'Zalindra Ika Mayasari', 'artawan.budiman@yahoo.com', '0931 5002 3530', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dbd3-7330-88d1-804c277c844f', 'Uchita Hariyah M.TI.', 'najwa40@yahoo.co.id', '(+62) 268 2275 632', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dc23-72b6-aec3-aebc9585e8cc', 'Salimah Zelda Hartati', 'bancar.permata@yahoo.co.id', '(+62) 285 5685 933', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dcce-7385-bf71-fef50251b153', 'Leo Prabowo', 'mutia.handayani@gmail.com', '0876 557 425', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-dd1d-701c-b98b-461e3663c3ca', 'Cager Budiman', 'bkurniawan@yahoo.com', '0508 8095 123', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-ddc4-72e1-8310-1bc61b970b6e', 'Kemal Prasasta M.Pd', 'embuh.mardhiyah@yahoo.com', '0584 4282 9434', NULL, '2025-11-22 15:45:26', '2025-11-22 15:45:26'),
('019aac3d-de8d-71a2-8869-444fd78cb18e', 'Ghaliyati Farida', 'latupono.irma@yahoo.com', '0465 7841 500', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-df04-70d0-b071-8b3cee70f910', 'Danu Mulya Budiyanto', 'yprastuti@gmail.co.id', '0912 3800 5810', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-df80-7380-b19a-e3c3a5d08863', 'Michelle Farida S.Kom', 'lfarida@gmail.co.id', '(+62) 771 8061 1540', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-dfd3-7260-b630-7c793e13e647', 'Usman Halim', 'tprastuti@gmail.com', '0793 0891 3650', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e078-73a7-a9bb-b953a6cd29e4', 'Bahuwirya Sirait', 'wulan78@yahoo.co.id', '(+62) 677 4032 2962', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e11b-72e3-bd89-91a8954c6c1d', 'Hani Hariyah', 'rahmat.santoso@gmail.co.id', '0634 0260 4203', NULL, '2025-11-22 15:45:27', '2025-11-22 15:45:27'),
('019aac3d-e1d3-73d4-bc96-39b9eaea8f91', 'Ifa Namaga', 'gangsar.prabowo@yahoo.com', '0547 6715 3573', NULL, '2025-11-22 15:45:28', '2025-11-22 15:45:28'),
('019aac3d-e303-7275-bbb8-52e19344dc56', 'Ida Novitasari', 'saptono.zamira@gmail.co.id', '026 9254 053', NULL, '2025-11-22 15:45:28', '2025-11-22 15:45:28'),
('019aac45-d692-72ed-bec8-c102c8e8f279', 'test budi edit', 'budi.edit@mail.com', '0888888833333', '2025-11-22 15:54:35', '2025-11-22 15:54:09', '2025-11-22 15:54:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_student`
--
ALTER TABLE `course_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_student_student_id_foreign` (`student_id`),
  ADD KEY `course_student_course_id_foreign` (`course_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `course_student_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_student_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
