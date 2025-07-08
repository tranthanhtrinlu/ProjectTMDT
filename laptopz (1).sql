-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 08, 2025 lúc 04:43 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptopz`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `sum` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `sum`, `user_id`) VALUES
(8, 1, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `price`, `quantity`, `cart_id`, `product_id`) VALUES
(12, 1006200, 1, 8, 104);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `parent_id`, `product_id`, `user_id`) VALUES
(1, 'bàn phím tốt', '2025-06-24 00:37:17.000000', NULL, 101, 10),
(2, 'bàn phím tốt', '2025-06-24 00:37:30.000000', NULL, 101, 10),
(4, 'hahah', '2025-06-24 07:41:45.000000', 2, 101, 10),
(5, 'san pham tot', '2025-06-24 12:28:58.000000', NULL, 109, 10),
(6, 'kkkk', '2025-06-24 12:33:57.000000', NULL, 221, 10),
(7, 'kkk', '2025-06-24 12:40:38.000000', 5, 109, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `custom_orders`
--

CREATE TABLE `custom_orders` (
  `id` bigint(20) NOT NULL,
  `cable_customization` bit(1) DEFAULT NULL,
  `case_modding` bit(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `custom_notes` text DEFAULT NULL,
  `keycap_customization` bit(1) DEFAULT NULL,
  `lubing_service` bit(1) DEFAULT NULL,
  `selected_switch_type` varchar(255) DEFAULT NULL,
  `stabilizer_tuning` bit(1) DEFAULT NULL,
  `status` enum('PENDING','PROCESSING','READY','SHIPPED','CANCELLED') DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `base_keyboard_id` bigint(20) DEFAULT NULL,
  `selected_keycap_id` bigint(20) DEFAULT NULL,
  `selected_kit_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `custom_orders`
--

INSERT INTO `custom_orders` (`id`, `cable_customization`, `case_modding`, `created_at`, `custom_notes`, `keycap_customization`, `lubing_service`, `selected_switch_type`, `stabilizer_tuning`, `status`, `total_price`, `updated_at`, `base_keyboard_id`, `selected_keycap_id`, `selected_kit_id`, `user_id`) VALUES
(1, b'0', b'0', '2025-06-24 02:00:19.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:00:19.000000', 101, NULL, NULL, 10),
(2, b'0', b'0', '2025-06-24 02:01:06.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:01:06.000000', 101, NULL, NULL, 10),
(3, b'0', b'0', '2025-06-24 02:02:41.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:02:41.000000', 101, NULL, NULL, 10),
(4, b'0', b'0', '2025-06-24 02:02:49.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:02:49.000000', 101, NULL, NULL, 10),
(5, b'0', b'0', '2025-06-24 02:02:52.000000', NULL, b'0', b'0', NULL, b'0', 'PENDING', 5390000.00, '2025-06-24 02:02:52.000000', 101, NULL, NULL, 10),
(6, b'0', b'0', '2025-06-24 02:02:54.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:02:54.000000', 101, NULL, NULL, 10),
(7, b'0', b'0', '2025-06-24 02:03:14.000000', NULL, b'0', b'0', NULL, b'0', 'PENDING', 5390000.00, '2025-06-24 02:03:14.000000', 101, NULL, NULL, 10),
(8, b'0', b'0', '2025-06-24 02:03:29.000000', NULL, b'0', b'0', NULL, b'0', 'PROCESSING', 5390000.00, '2025-06-24 02:04:15.000000', 101, NULL, NULL, 10),
(9, b'0', b'0', '2025-06-24 02:03:35.000000', NULL, b'0', b'0', NULL, b'0', 'SHIPPED', 5390000.00, '2025-06-24 02:03:35.000000', 101, NULL, NULL, 10),
(10, b'0', b'0', '2025-06-24 02:03:44.000000', NULL, b'0', b'0', NULL, b'0', 'PENDING', 5390000.00, '2025-06-24 02:03:44.000000', 101, NULL, NULL, 10),
(11, b'0', b'0', '2025-06-24 02:04:20.000000', NULL, b'0', b'0', NULL, b'0', 'PENDING', 5390000.00, '2025-06-24 02:04:20.000000', 101, NULL, NULL, 10),
(12, b'0', b'0', '2025-06-24 02:04:28.000000', NULL, b'0', b'0', NULL, b'0', 'PROCESSING', 5390000.00, '2025-06-24 07:20:34.000000', 101, NULL, NULL, 10),
(13, b'0', b'0', '2025-06-24 02:04:49.000000', NULL, b'0', b'0', NULL, b'0', 'CANCELLED', 5390000.00, '2025-06-24 02:53:28.000000', 101, NULL, NULL, 10),
(14, b'0', b'0', '2025-06-24 02:06:54.000000', NULL, b'0', b'0', NULL, b'0', 'READY', 5390000.00, '2025-06-24 02:53:39.000000', 101, NULL, NULL, 10),
(15, b'0', b'0', '2025-06-24 02:13:59.000000', '', b'0', b'1', 'Red Linear', b'1', 'READY', 8103000.00, '2025-06-24 02:15:07.000000', 101, 204, 185, 10),
(16, b'0', b'0', '2025-06-24 02:20:16.000000', '', b'0', b'0', '', b'0', 'READY', 5390000.00, '2025-06-24 02:20:49.000000', 101, NULL, NULL, 10),
(17, b'0', b'0', '2025-06-24 02:23:03.000000', NULL, b'0', b'0', NULL, b'0', 'READY', 5390000.00, '2025-06-24 02:23:03.000000', 101, NULL, NULL, 10),
(18, b'0', b'0', '2025-06-24 02:24:04.000000', NULL, b'0', b'0', NULL, b'0', 'PROCESSING', 5390000.00, '2025-06-24 02:24:23.000000', 101, NULL, NULL, 10),
(19, b'0', b'0', '2025-06-24 02:54:23.000000', NULL, b'0', b'0', NULL, b'0', 'CANCELLED', 5390000.00, '2025-06-24 03:31:16.000000', 101, NULL, NULL, 10),
(20, b'0', b'0', '2025-06-24 12:02:20.000000', '', b'0', b'1', 'Blue Clicky', b'1', 'PROCESSING', 2458000.00, '2025-06-24 12:03:03.000000', 113, 195, 186, 10),
(21, b'0', b'0', '2025-06-24 12:26:34.000000', '', b'0', b'1', 'Red Linear', b'0', 'PROCESSING', 3909000.00, '2025-06-24 12:27:22.000000', 104, 196, 184, 10),
(22, b'0', b'0', '2025-06-24 12:34:48.000000', '', b'0', b'0', '', b'0', 'PENDING', 1290000.00, '2025-06-24 12:34:57.000000', 104, NULL, NULL, 10),
(23, b'0', b'0', '2025-06-24 12:35:58.000000', '', b'0', b'0', '', b'0', 'PENDING', 1290000.00, '2025-06-24 12:40:49.000000', 104, NULL, NULL, 10),
(24, b'0', b'0', '2025-06-24 12:41:29.000000', '', b'0', b'0', 'Red Linear', b'0', 'PENDING', 2934000.00, '2025-06-24 12:41:44.000000', 104, 195, 183, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `custom_services`
--

CREATE TABLE `custom_services` (
  `id` bigint(20) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `service_description` text DEFAULT NULL,
  `service_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_ref` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','CONFIRM','SHIPPING','COMPLETE','CANCEL') DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `payment_method`, `payment_ref`, `payment_status`, `receiver_address`, `receiver_name`, `receiver_phone`, `status`, `total_price`, `user_id`) VALUES
(11, '2025-06-24 00:36:38.000000', 'COD', 'UNKNOWN', 'PAYMENT_SUCCEED', 'huhuh', 'tri', '0346444098', 'SHIPPING', 4581500, 10),
(12, '2025-06-20 00:37:54.000000', 'BANKING', '863f591f013d400ebad33ae773c066c6', 'PAYMENT_SUCCEED', 'huhuh', 'tri', '0346444098', 'COMPLETE', 4581500, 10),
(13, '2025-06-22 00:42:22.000000', 'COD', 'UNKNOWN', 'PAYMENT_SUCCEED', 'huhuh', 'tri', '0346444098', 'COMPLETE', 4581500, 10),
(14, '2025-06-21 00:50:58.000000', 'BANKING', '9bd8a193edc74dd2a2e815448febf3b0', 'PAYMENT_SUCCEED', '123', 'tin', '0346444098', 'COMPLETE', 1494000, 10),
(30, '2025-01-15 10:30:00.000000', 'VNPAY', 'PAY_001', 'PAYMENT_SUCCEED', '123 Lê Lợi, Q1, TP.HCM', 'Nguyễn Văn A', '0901234567', 'COMPLETE', 2500000, 1),
(31, '2025-04-16 14:20:00.000000', 'COD', 'PAY_002', 'PAYMENT_SUCCEED', '456 Nguyễn Huệ, Q1, TP.HCM', 'Trần Thị B', '0902345678', 'COMPLETE', 1800000, 3),
(32, '2024-05-17 09:15:00.000000', 'VNPAY', 'PAY_003', 'PAYMENT_SUCCEED', '123 Lê Lợi, Q1, TP.HCM', 'Nguyễn Văn A', '0901234567', 'COMPLETE', 3200000, 4),
(33, '2024-03-20 16:45:00.000000', 'VNPAY', 'PAY_004', 'PAYMENT_SUCCEED', '789 Đồng Khởi, Q1, TP.HCM', 'Lê Văn C', '0903456789', 'COMPLETE', 4500000, 3),
(34, '2024-01-25 11:30:00.000000', 'COD', 'PAY_005', 'PAYMENT_SUCCEED', '456 Nguyễn Huệ, Q1, TP.HCM', 'Trần Thị B', '0902345678', 'COMPLETE', 2800000, 4),
(35, '2025-06-24 12:25:44.000000', 'BANKING', '3c2e159645ef4de2bd47758240c69c09', 'PAYMENT_UNPAID', 'Linh Trung, Thủ Đức, TPHCM', 'Tín Đào', '0346444098', 'PENDING', 1250600, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
(11, 4581500, 1, 11, 101),
(12, 4581500, 1, 12, 101),
(13, 4581500, 1, 13, 101),
(14, 1494000, 1, 14, 102),
(15, 1250600, 1, 35, 109);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `detail_desc` mediumtext NOT NULL,
  `discount` int(11) NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint(20) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `type` enum('KEYBOARD','MOUSE','KIT','KEYCAP','MOUSEPAD','SWITCH','OTHER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `detail_desc`, `discount`, `factory`, `image`, `name`, `price`, `quantity`, `short_desc`, `sold`, `target`, `type`) VALUES
(101, 'Bàn phím cơ gaming với switch Blue, RGB backlight 16.8 triệu màu, thiết kế TKL compact, keycap PBT Double-shot, kết nối USB-C có thể tháo rời, tương thích Windows/Mac', 15, 'Razer', 'razer-blackwidow-v4.jpg', 'Bàn phím Razer BlackWidow V4 75% Phantom Green Edition', 5390000, 22, 'Bàn phím gaming cơ Razer BlackWidow V4 với switch xanhh', 8, 'Gaming', 'KEYBOARD'),
(102, 'Bàn phím cơ 68 phím với Ice Crystal switch, thiết kế gasket mount, foam EVA, keycap PBT dye-sub, hỗ trợ hotswap, kết nối wireless 2.4GHz + Bluetooth + USB-C', 40, 'AULA', 'aula-f68-xanh.png', 'Bàn phím AULA F68 TM (Xanh lá/ Ice Crystal switch ) F68G', 2490000, 34, 'Bàn phím cơ AULA F68 TM switch Ice Crystal 68 phím', 12, 'Gaming', 'KEYBOARD'),
(103, 'Bàn phím cơ premium với Jadeite switch, plate PC, gasket mount structure, south-facing PCB, rotary encoder, kết nối triple mode', 22, 'Leobog', 'leobog-amg65.png', 'Bàn phím Leobog AMG65 TM (Trắng đen/ Jadeite switch) AMG6501', 2680000, 20, 'Bàn phím cơ Leobog AMG65 TM với Jadeite switch', 15, 'Gaming', 'KEYBOARD'),
(104, 'Bàn phím cơ compact với DareU Dream switch, thiết kế triple mode, gasket mount, south-facing LED, hotswap PCB, foam silicone', 22, 'DareU', 'dareu-ek75.png', 'Bàn phím cơ DareU EK75 Pro Triple Mode Black Golden Cloud switch', 1290000, 40, 'Bàn phím cơ DareU EK75 Pro với Golden Cloud switch', 25, 'Gaming', 'KEYBOARD'),
(105, 'Bàn phím cơ TKL với Moon Cat switch, thiết kế ergonomic, keycap OEM profile, kết nối có dây USB-C, tương thích đa nền tảng', 13, 'Leobog', 'leobog-a75.png', 'Bàn phím Leobog A75 TM (Moon Cat trắng/ Rambo switch) A7504', 2526000, 30, 'Bàn phím Leobog A75 TM với Rambo switch màu trắng', 18, 'Văn phòng', 'KEYBOARD'),
(107, 'Bàn phím cơ với Red switch hotswap, thiết kế 60%, gasket mount, south-facing PCB, RGB underglow, wireless triple mode', 20, 'AULA', 'aula-f2058.png', 'Bàn phím AULA F2058 cơ dây (Đen Red switch) F205802', 800000, 50, 'Bàn phím cơ AULA F2058 60% với Red switch', 35, 'Cơ bản', 'KEYBOARD'),
(108, 'Bàn phím cơ pro gaming với Blue Cloud switch, aluminum plate, rotary knob, RGB per-key, macro support, tournament mode', 24, 'DareU', 'dareu-ek87.png', 'Bàn phím cơ gaming DareU EK87 Pro Black Golden Cloud switch', 1490000, 45, 'Bàn phím gaming DareU EK87 Pro Black Golden', 30, 'Gaming', 'KEYBOARD'),
(109, 'Bàn phím cơ TKL với Haze Blue switch, thiết kế minimalist, keycap Cherry profile, anti-ghosting, N-key rollover', 26, 'DareU', 'dareu-ek106.png', 'Bàn phím cơ gaming DareU EK106 Pro Haze Blue Cloud switch', 1690000, 27, 'Bàn phím gaming DareU EK106 Pro Haze Blue', 22, 'Gaming', 'KEYBOARD'),
(110, 'Bàn phím cơ premium với Black Golden switch, CNC aluminum case, gasket mount, VIA support, rotary encoder', 26, 'DareU', 'dareu-ek106-black.jpg', 'Bàn phím cơ gaming DareU EK106 Pro Black Golden Cloud switch', 1690000, 32, 'Bàn phím gaming DareU EK106 Pro Black Golden', 19, 'Gaming', 'KEYBOARD'),
(111, 'Bàn phím cơ compact với Grey Black Dream switch, thiết kế portable, wireless connectivity, long battery life', 16, 'DareU', 'dareu-ek98l.png', 'Bàn phím cơ DareU EK98L Grey Black Dream switch', 699000, 60, 'Bàn phím cơ DareU EK98L Grey Black Dream portable', 45, 'Di động', 'KEYBOARD'),
(112, 'Bàn phím cơ 75% với Beta Linear switch, south-facing LED, hotswap socket, aluminum frame, rotary encoder', 21, 'E-Dra', 'edra-ek375v2-beta.png', 'Bàn phím cơ gaming E-Dra EK375v2 Beta Linear switch', 699000, 38, 'Bàn phím gaming E-Dra EK375v2 Beta Linear', 28, 'Gaming', 'KEYBOARD'),
(113, 'Bàn phím cơ gaming với Alpha Linear switch, RGB backlight, anti-ghosting technology, ergonomic design', 21, 'E-Dra', 'edra-ek375v2-alpha.png', 'Bàn phím cơ gaming E-Dra EK375v2 Alpha Linear switch', 699000, 42, 'Bàn phím gaming E-Dra EK375v2 Alpha Linear', 31, 'Gaming', 'KEYBOARD'),
(114, 'Bàn phím cơ 75% với Red switch, thiết kế trắng đỏ độc đáo, keycap PBT dye-sub, kết nối wireless và có dây', 17, 'AULA', 'aula-f75-red.png', 'Bàn phím AULA F75 cơ dây (Trắng Red switch) F7512', 785000, 55, 'Bàn phím AULA F75 màu trắng với Red switch', 38, 'Văn phòng', 'KEYBOARD'),
(115, 'Bàn phím cơ đen đỏ với Red switch, thiết kế gaming chuyên nghiệp, macro keys, RGB lighting effects', 17, 'AULA', 'aula-f75-black-red.png', 'Bàn phím AULA F75 cơ dây (Đen Red switch) F7513', 785000, 48, 'Bàn phím AULA F75 màu đen với Red switch', 33, 'Gaming', 'KEYBOARD'),
(116, 'Bàn phím gaming RGB với Grey Black Dream switch, aluminum top case, rotary volume control, macro support', 22, 'DareU', 'dareu-ek104.png', 'Bàn phím DareU EK104 RGB Grey Black Dream Switch', 899000, 35, 'Bàn phím DareU EK104 RGB Grey Black Dream', 27, 'Gaming', 'KEYBOARD'),
(145, 'Bàn phím cơ AULA F2058 với switch Blue Cherry MX giả, thiết kế full-size 104 phím. Sản phẩm có đèn LED RGB 16.8 triệu màu, khung nhôm chắc chắn, keycap PBT Double-shot chống phai màu. Tương thích với Windows, Mac OS. Kết nối USB Type-C, dây cáp có thể tháo rời. Thiết kế gaming chuyên nghiệp với các phím macro có thể tùy chỉnh.', 10, 'AULA', 'aula-f2058.png', 'AULA F2058 Mechanical Gaming Keyboard', 890000, 50, 'Bàn phím cơ gaming AULA F2058, switch Blue, đèn RGB, full-size 104 phím', 15, 'Gaming', 'KEYBOARD'),
(146, 'Bàn phím cơ AULA F68 thiết kế 65% compact, switch Hot-swap, có thể thay đổi switch dễ dàng. Khung case nhôm cao cấp màu xanh độc đáo. Keycap PBT với profile Cherry, foam cách âm bên trong. Kết nối USB-C, tương thích đa nền tảng. Phù hợp cho văn phòng và gaming nhẹ.', 0, 'AULA', 'aula-f68-xanh.png', 'AULA F68 Xanh Mechanical Keyboard', 750000, 35, 'Bàn phím cơ AULA F68 compact 65%, hot-swap, màu xanh đặc biệt', 8, 'Office', 'KEYBOARD'),
(147, 'Bàn phím cơ AULA F75 thiết kế TKL (87 phím), switch Gateron Red linear. Thiết kế hai tông màu đen đỏ thể thao. Có knob điều chỉnh âm lượng, đèn LED RGB per-key. Plate mounting, gasket mount cho cảm giác gõ mượt mà. Software tùy chỉnh macro và lighting effect đầy đủ.', 5, 'AULA', 'aula-f75-black-red.png', 'AULA F75 Black Red Gaming Keyboard', 950000, 40, 'Bàn phím cơ gaming AULA F75 TKL, Gateron Red, thiết kế đen đỏ', 12, 'Gaming', 'KEYBOARD'),
(148, 'Bàn phím cơ DareU EK104 full-size với switch DareU độc quyền. Thiết kế simple, chắc chắn với khung nhựa ABS cao cấp. Keycap laser-etched bền bỉ, kết nối USB dây cáp dài 1.8m. Không có đèn LED, phù hợp cho môi trường văn phòng. Giá thành hợp lý cho người mới bắt đầu.', 15, 'DareU', 'dareu-ek104.png', 'DareU EK104 Mechanical Keyboard', 680000, 60, 'Bàn phím cơ DareU EK104 full-size, switch DareU, không đèn', 25, 'Office', 'KEYBOARD'),
(149, 'Bàn phím cơ DareU EK106 với switch Blue tactile, thiết kế full-size với numpad. Có đèn LED đơn sắc trắng, khung nhôm đen sang trọng. Keycap ABS double-shot, chống phai màu hiệu quả. Software DareU để tùy chỉnh lighting và macro. Dây cáp USB braided chống đứt.', 0, 'DareU', 'dareu-ek106-black.jpg', 'DareU EK106 Black Gaming Keyboard', 850000, 45, 'Bàn phím cơ DareU EK106 full-size, switch Blue, đèn LED trắng', 18, 'Gaming', 'KEYBOARD'),
(150, 'Bàn phím cơ DareU EK75 kết nối không dây 2.4GHz và Bluetooth 5.0. Thiết kế 75% với F-row, switch hot-swappable. Pin 4000mAh sử dụng 6 tháng. Khung nhôm CNC, gasket mount cho cảm giác premium. Keycap PBT dye-sub chống phai. Tương thích Windows, Mac, Android, iOS.', 8, 'DareU', 'dareu-ek75.png', 'DareU EK75 Wireless Keyboard', 1200000, 30, 'Bàn phím cơ DareU EK75 wireless, 75% layout, hot-swap, pin lâu', 7, 'Office', 'KEYBOARD'),
(151, 'Bàn phím cơ DareU EK87 thiết kế TKL gọn gàng, switch Brown tactile vừa phải. Đèn LED RGB với nhiều hiệu ứng, khung nhựa chắc chắn. Anti-ghosting full key, tốc độ polling 1000Hz. Keycap OEM profile, laser etched. Dây cáp USB-C có thể tháo rời, dễ dàng di chuyển.', 12, 'DareU', 'dareu-ek87.png', 'DareU EK87 Gaming Keyboard', 750000, 55, 'Bàn phím cơ DareU EK87 TKL, switch Brown, đèn RGB', 20, 'Gaming', 'KEYBOARD'),
(152, 'Bàn phím cơ cao cấp DareU EK98L layout 96% với numpad compact. Kết nối wireless 2.4GHz low-latency và USB-C. Switch Kailh Box White clicky, hot-swappable. Khung nhôm CNC, plate FR4, foam EVA cách âm. Keycap PBT Cherry profile cao cấp. Pin 4000mAh, sạc nhanh USB-C.', 0, 'DareU', 'dareu-ek98l.png', 'DareU EK98L Wireless Gaming', 1350000, 25, 'Bàn phím cơ cao cấp DareU EK98L 96%, wireless, hot-swap, premium', 5, 'Gaming', 'KEYBOARD'),
(153, 'Bàn phím cơ EDRA EK375v2 Alpha thiết kế 75% độc đáo với knob xoay. Kết nối tri-mode: USB-C, 2.4GHz, Bluetooth 5.0. Switch Gateron G Pro Yellow linear, hot-swappable. South-facing PCB hỗ trợ keycap Cherry profile. Gasket mount, foam poron, plate PC. Keycap PBT dye-sublimation.', 5, 'EDRA', 'edra-ek375v2-alpha.png', 'EDRA EK375v2 Alpha Wireless', 1100000, 20, 'Bàn phím cơ EDRA EK375v2 Alpha 75%, tri-mode, gasket mount', 3, 'Enthusiast', 'KEYBOARD'),
(154, 'Phiên bản Beta của EDRA EK375v2 với thiết kế màu sắc khác biệt. Tính năng tương tự Alpha nhưng có thêm foam case và plate foam để tối ưu âm thanh. Switch Gateron G Pro Red linear, pre-lubricated. Rotary encoder metal cao cấp, LED indicator. South-facing switch socket.', 0, 'EDRA', 'edra-ek375v2-beta.png', 'EDRA EK375v2 Beta Gaming', 1150000, 18, 'Bàn phím cơ EDRA EK375v2 Beta 75%, nâng cấp âm thanh, premium', 2, 'Enthusiast', 'KEYBOARD'),
(155, 'Bàn phím cơ Leobog A75 layout 75% với thiết kế trong suốt độc đáo. Switch Leobog Reaper linear, factory pre-lubed. Gasket mount với multiple foam layers. South-facing PCB, hot-swap socket. Keycap PBT double-shot shine-through. Kết nối USB-C, software hỗ trợ đầy đủ.', 10, 'Leobog', 'leobog-a75.png', 'Leobog A75 Mechanical Keyboard', 980000, 25, 'Bàn phím cơ Leobog A75 trong suốt, 75%, gasket mount, hot-swap', 6, 'Gaming', 'KEYBOARD'),
(156, 'Bàn phím cơ cao cấp Leobog AMG65 layout 65% với thiết kế premium. CNC aluminum case, anodized finish. Switch Leobog Graywood tactile độc quyền. Daughter board kết nối, gasket O-ring mount. Keycap MT3 profile PBT, dye-sublimation legends. Kết nối USB-C, dây cáp coiled.', 0, 'Leobog', 'leobog-amg65.png', 'Leobog AMG65 Compact Gaming', 1250000, 15, 'Bàn phím cơ cao cấp Leobog AMG65 65%, CNC aluminum, premium', 1, 'Enthusiast', 'KEYBOARD'),
(157, 'Bàn phím cơ gaming cao cấp Razer BlackWidow V4 với switch Razer Green Clicky gen-3. Thiết kế full-size với dedicated media controls và command dial. Chroma RGB per-key với 16.8 triệu màu. Wrist rest magnetic ergonomic. Multi-function roller và 4 macro keys. USB passthrough port.', 15, 'Razer', 'razer-blackwidow-v4.jpg', 'Razer BlackWidow V4 Gaming', 3200000, 20, 'Bàn phím gaming cao cấp Razer BlackWidow V4, Chroma RGB, premium', 8, 'Gaming', 'KEYBOARD'),
(158, 'Bàn phím cơ Razer BlackWidow Essential với switch Razer Green mechanical. Thiết kế full-size truyền thống, đèn LED xanh. 10-key anti-ghosting, fully programmable keys. 80 triệu lần nhấn lifespan. Cable management routing, gaming mode option. Tương thích Razer Synapse 3.', 5, 'Razer', 'razer-blackwidow.png', 'Razer BlackWidow Essential', 2100000, 35, 'Bàn phím cơ Razer BlackWidow Essential, switch Green, đèn xanh', 12, 'Gaming', 'KEYBOARD'),
(171, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap và switch Akko V3 Piano Pro, chủ đề Ye Xiu độc đáo', 0, 'AKKO', 'AKKO_5098B_Ye_Xiu.png', 'Bàn phím AKKO 5098B The King’s Avatar Ye Xiu (RGB / Hotswap / Akko V3 Piano Pro)', 2290000, 100, 'Bàn phím cơ AKKO 5098B Ye Xiu', 0, 'Gaming', 'KEYBOARD'),
(172, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap và switch Akko V3 Piano Pro, thiết kế Santorini sang trọng', 0, 'AKKO', 'AKKO_5098B_Santorini.png', 'Bàn phím AKKO 5098B Santorini (RGB / Hotswap / Akko V3 Piano Pro)', 2390000, 100, 'Bàn phím cơ AKKO 5098B Santorini', 0, 'Văn phòng', 'KEYBOARD'),
(173, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap và switch Akko V3 Piano Pro, màu Black & Gold tinh tế', 0, 'AKKO', 'AKKO_5098B_Black_Gold.png', 'Bàn phím AKKO 5098B Black & Gold (RGB / Hotswap / Akko V3 Piano Pro)', 2290000, 100, 'Bàn phím cơ AKKO 5098B Black & Gold', 0, 'Sinh viên', 'KEYBOARD'),
(174, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch Piano Pro và kết nối đa chế độ, màu Antique Jade cổ điển', 0, 'AKKO', 'AKKO_YU01_Antique_Jade.png', 'Bàn phím AKKO YU01 Antique Jade (RGB / Hotswap / Piano Pro SW/ Multi-mode)', 2390000, 100, 'Bàn phím cơ AKKO YU01 Antique Jade', 0, 'Cơ bản', 'KEYBOARD'),
(175, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch Piano Pro và kết nối đa chế độ, màu White Jade thanh lịch', 0, 'AKKO', 'AKKO_YU01_White_Jade.png', 'Bàn phím AKKO YU01 White Jade (RGB / Hotswap / Piano Pro SW/ Multi-mode)', 2390000, 100, 'Bàn phím cơ AKKO YU01 White Jade', 0, 'Gaming', 'KEYBOARD'),
(176, 'Bàn phím cơ hỗ trợ hotswap, kết nối đa chế độ, thiết kế Mountain Seclusion độc đáo và cao cấp', 0, 'AKKO', 'AKKO_MU02_Mountain_Seclusion.png', 'Bàn phím cơ Akko MU02 Mountain Seclusion (Hot-Swap/Multi mode)', 3090000, 100, 'Bàn phím cơ AKKO MU02 Mountain Seclusion', 0, 'Văn phòng', 'KEYBOARD'),
(177, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch Piano Pro và kết nối đa chế độ, chủ đề Bun Wonderland vui nhộn', 0, 'AKKO', 'MonsGeek_MG108B_Bun_Wonderland.png', 'Bàn phím MonsGeek MG108B Bun Wonderland (RGB / Hotswap / Piano Pro SW/ Multi-mode)', 1699000, 100, 'Bàn phím cơ MonsGeek MG108B Bun Wonderland', 0, 'Sinh viên', 'KEYBOARD'),
(178, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch Piano Pro và kết nối đa chế độ, chủ đề Watermelon bắt mắt', 0, 'AKKO', 'MonsGeek_MG108B_Watermelon.png', 'Bàn phím MonsGeek MG108B Watermelon (RGB / Hotswap / Piano Pro SW/ Multi-mode)', 1699000, 100, 'Bàn phím cơ MonsGeek MG108B Watermelon', 0, 'Cơ bản', 'KEYBOARD'),
(179, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch Piano Pro và kết nối đa chế độ, chủ đề Dunhuang mang tính nghệ thuật', 0, 'AKKO', 'AKKO_5108B_Plus_Dunhuang.png', 'Bàn phím AKKO 5108B Plus Dunhuang (RGB / Hotswap / Piano Pro SW/ Multi-mode)', 2099000, 100, 'Bàn phím cơ AKKO 5108B Dunhuang', 0, 'Gaming', 'KEYBOARD'),
(180, 'Bàn phím cơ với switch từ tính, tốc độ phản hồi 8K Hz, kết nối USB-C và đa chế độ, màu Horizon Blue hiện đại', 0, 'AKKO', 'MonsGeek_M1W_Horizon_Blue.png', 'Bàn phím MonsGeek M1W HE-SP V3 Horizon Blue (Magnetic Switches – 8K Hz Polling Rate Wired USB-C – Multi mode)', 3099000, 100, 'Bàn phím cơ MonsGeek M1W Horizon Blue', 0, 'Văn phòng', 'KEYBOARD'),
(181, 'Bàn phím cơ với switch từ tính, tốc độ phản hồi 8K Hz, kết nối USB-C và đa chế độ, màu Lilac Purple thời thượng', 0, 'AKKO', 'MonsGeek_M1W_Lilac_Purple.png', 'Bàn phím MonsGeek M1W HE-SP V3 Lilac Purple (Magnetic Switches – 8K Hz Polling Rate Wired USB-C – Multi mode)', 3099000, 100, 'Bàn phím cơ MonsGeek M1W Lilac Purple', 0, 'Sinh viên', 'KEYBOARD'),
(182, 'Bàn phím cơ với đèn RGB, hỗ trợ hotswap, switch V3 Piano Pro và kết nối đa chế độ, chủ đề Joy of Life đầy cảm hứng', 0, 'AKKO', 'AKKO_MU01_Joy_of_Life.png', 'Bàn phím cơ AKKO MU01 Joy of Life (Hotswap,RGB / Multi-Modes/ Switch V3 Piano Pro)', 2890000, 100, 'Bàn phím cơ AKKO MU01 Joy of Life', 0, 'Cơ bản', 'KEYBOARD'),
(183, 'Kit bàn phím cơ MonsGeek M3 QMK với vỏ nhôm, hỗ trợ QMK/VIA, mạch xuôi và PCB stab, lý tưởng cho tùy chỉnh', 0, 'AKKO', 'MonsGeek_M3_QMK.png', 'Kit bàn phím cơ MonsGeek M3 QMK (Full Nhôm – Mạch xuôi – QMK / VIA – PCB Stab)', 1399000, 0, 'Kit bàn phím MonsGeek M3 QMK', 0, 'Gaming', 'KIT'),
(184, 'Kit bàn phím cơ MonsGeek M3 QMK với vỏ nhôm, hỗ trợ QMK/VIA, mạch xuôi và PCB stab, thiết kế cao cấp', 0, 'AKKO', 'MonsGeek_M3_QMK_2.png', 'Kit bàn phím cơ MonsGeek M3 QMK (Full Nhôm – Mạch xuôi – QMK / VIA – PCB Stab)', 2299000, 0, 'Kit bàn phím MonsGeek M3 QMK', 0, 'Văn phòng', 'KIT'),
(185, 'Kit bàn phím cơ MonsGeek M2 QMK với vỏ nhôm, hỗ trợ QMK/VIA, mạch xuôi và PCB stab, phù hợp tùy chỉnh', 0, 'AKKO', 'MonsGeek_M2_QMK.jpg', 'Kit bàn phím cơ MonsGeek M2 QMK (Full Nhôm – Mạch xuôi – QMK / VIA – PCB Stab)', 1399000, 0, 'Kit bàn phím MonsGeek M2 QMK', 0, 'Sinh viên', 'KIT'),
(186, 'Kit bàn phím cơ MonsGeek M1 QMK với vỏ nhôm, hỗ trợ QMK/VIA, mạch xuôi và PCB stab, tối ưu cho DIY', 0, 'AKKO', 'MonsGeek_M1_QMK.jpg', 'Kit bàn phím cơ MonsGeek M1 QMK (Full Nhôm – Mạch xuôi – QMK / VIA – PCB Stab)', 1399000, 0, 'Kit bàn phím MonsGeek M1 QMK', 0, 'Cơ bản', 'KIT'),
(187, 'Kit bàn phím AKKO ACR TOP 40 với hotswap, đèn RGB, top-mount và hỗ trợ QMK/VIA, thiết kế nhỏ gọn', 0, 'AKKO', 'AKKO_ACR_TOP_40.png', 'KIT bàn phím AKKO ACR TOP 40 (Hotswap / RGB / Top-mount / South-Facing / QMK – VIA)', 1949000, 0, 'Kit bàn phím AKKO ACR TOP 40', 0, 'Gaming', 'KIT'),
(188, 'Kit bàn phím AKKO SPR67 Gray với vỏ nhôm, spring mount, flex-cut và mạch xuôi, mang lại cảm giác gõ êm ái', 0, 'AKKO', 'AKKO_SPR67_Gray.png', 'KIT bàn phím AKKO SPR67 – Gray (Full nhôm / Spring mount / Flex-cut / Mạch xuôi)', 4559000, 100, 'Kit bàn phím AKKO SPR67 Gray', 0, 'Văn phòng', 'KIT'),
(189, 'Kit bàn phím AKKO MOD007v3 với flex-cut, gasket mount và south-facing, tối ưu cho trải nghiệm tùy chỉnh', 0, 'AKKO', 'AKKO_MOD007v3.jpg', 'Kit AKKO Designer Studio – MOD007v3 (Flex-cut / Gasket mount / South-Facing)', 3959000, 100, 'Kit bàn phím AKKO MOD007v3', 0, 'Sinh viên', 'KIT'),
(190, 'Kit bàn phím AKKO ACR TOP 75 Gray với vỏ nhôm, hotswap, top-mount và south-facing, thiết kế hiện đại', 0, 'AKKO', 'AKKO_ACR_TOP_75_Gray.jpg', 'KIT bàn phím AKKO ACR TOP 75 – Gray (Nhôm / Top mount / Hotswap / South-Facing)', 3899000, 100, 'Kit bàn phím AKKO ACR TOP 75 Gray', 0, 'Cơ bản', 'KIT'),
(191, 'Kit bàn phím AKKO MOD007S Very Peri với south-facing và mạch xuôi, mang lại sự linh hoạt cho người dùng', 0, 'AKKO', 'AKKO_MOD007S_Very_Peri.jpg', 'Kit AKKO Designer Studio – MOD007S Very Peri (South Facing / Mạch Xuôi)', 4899000, 0, 'Kit bàn phím AKKO MOD007S Very Peri', 0, 'Gaming', 'KIT'),
(192, 'Kit bàn phím cơ AKKO MOD006 với thiết kế tùy chỉnh cao, hỗ trợ DIY và trải nghiệm gõ phím chất lượng', 0, 'AKKO', 'AKKO_MOD006.png', 'Kit bàn phím cơ AKKO Designer Studio – MOD006', 4149000, 0, 'Kit bàn phím AKKO MOD006', 0, 'Văn phòng', 'KIT'),
(193, 'Kit bàn phím cơ AKKO MOD005 với hotswap 5 pin, đèn RGB, foam tiêu âm và gasket mount, lý tưởng cho DIY', 0, 'AKKO', 'AKKO_MOD005.png', 'Kit bàn phím cơ AKKO Designer Studio – MOD005 (Hotswap 5 pin / RGB / Foam tiêu âm / Gasket Mount)', 3390000, 100, 'Kit bàn phím AKKO MOD005', 0, 'Sinh viên', 'KIT'),
(194, 'Kit bàn phím cơ AKKO MOD008 với thiết kế cao cấp, hỗ trợ tùy chỉnh và mang lại trải nghiệm gõ phím tối ưu', 0, 'AKKO', 'AKKO_MOD008.png', 'Kit bàn phím cơ AKKO Designer Studio – MOD008', 3999000, 100, 'Kit bàn phím AKKO MOD008', 0, 'Cơ bản', 'KIT'),
(195, 'Bộ keycap Veekos Black Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu sắc chuyển đổi tinh tế', 0, 'AKKO', 'Veekos_Black_Gradient.png', 'Veekos Black Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Black Gradient', 0, 'Gaming', 'KEYCAP'),
(196, 'Bộ keycap Veekos Iris Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu sắc tươi sáng', 0, 'AKKO', 'Veekos_Iris_Gradient.png', 'Veekos lris Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Iris Gradient', 0, 'Văn phòng', 'KEYCAP'),
(197, 'Bộ keycap Veekos Purple Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu tím nổi bật', 0, 'AKKO', 'Veekos_Purple_Gradient.png', 'Veekos Purple Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Purple Gradient', 0, 'Sinh viên', 'KEYCAP'),
(198, 'Bộ keycap Veekos Blaze Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu sắc rực rỡ', 0, 'AKKO', 'Veekos_Blaze_Gradient.png', 'Veekos Blaze Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Blaze Gradient', 0, 'Cơ bản', 'KEYCAP'),
(199, 'Bộ keycap Veekos Forest Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu xanh tự nhiên', 0, 'AKKO', 'Veekos_Forest_Gradient.png', 'Veekos Forest Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Forest Gradient', 0, 'Gaming', 'KEYCAP'),
(200, 'Bộ keycap Veekos Rose Latte Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu hồng nhẹ nhàng', 0, 'AKKO', 'Veekos_Rose_Latte_Gradient.png', 'Veekos Rose Latte Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Rose Latte Gradient', 0, 'Văn phòng', 'KEYCAP'),
(201, 'Bộ keycap Veekos Black & Pink Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu sắc trẻ trung', 0, 'AKKO', 'Veekos_Black_Pink_Gradient.png', 'Veekos Black & Pink Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Black & Pink Gradient', 0, 'Sinh viên', 'KEYCAP'),
(202, 'Bộ keycap Veekos Blue Gradient làm từ PBT, công nghệ double-shot, profile Cherry, 135 phím, màu xanh mát mẻ', 0, 'AKKO', 'Veekos_Blue_Gradient.png', 'Veekos Blue Gradient Keycaps (PBT Double-Shot / Cherry profile / 135 nút)', 245000, 100, 'Keycap Veekos Blue Gradient', 0, 'Cơ bản', 'KEYCAP'),
(203, 'Bộ keycap Akko Swan Sonata làm từ PBT, công nghệ dye-subbed, profile MOA, 140 phím, thiết kế thanh lịch', 0, 'AKKO', 'Akko_Swan_Sonata.png', 'Akko Swan Sonata Keycap set (PBT Dye-subbed / MOA profile / 140 nút)', 1199000, 100, 'Keycap Akko Swan Sonata', 0, 'Gaming', 'KEYCAP'),
(204, 'Bộ keycap Akko Butterfly Fantasy làm từ PBT, công nghệ dye-subbed, profile MOA, 140 phím, thiết kế mộng mơ', 0, 'AKKO', 'Akko_Butterfly_Fantasy.png', 'Akko Butterfly Fantasy Keycap Set (PBT Dye-subbed / MOA profile / 140 nút)', 1199000, 100, 'Keycap Akko Butterfly Fantasy', 0, 'Văn phòng', 'KEYCAP'),
(205, 'Bộ keycap AKKO Black Gold làm từ PBT, công nghệ double-shot, profile ASA, 158 phím, màu sắc sang trọng', 0, 'AKKO', 'AKKO_Black_Gold.jpg', 'AKKO Keycap set – Black Gold (PBT Double-Shot/ASA profile/158 nút)', 999000, 100, 'Keycap AKKO Black Gold', 0, 'Sinh viên', 'KEYCAP'),
(206, 'Bộ keycap AKKO Watermelon làm từ PBT, công nghệ dye-subbed, profile MOG, 139 phím, chủ đề dưa hấu vui nhộn', 0, 'AKKO', 'AKKO_Watermelon.png', 'AKKO Keycap set – Watermelon (PBT Dye-subbed / MOG profile / 139 nút)', 790000, 100, 'Keycap AKKO Watermelon', 0, 'Cơ bản', 'KEYCAP'),
(207, 'Bộ switch AKKO Penguin Silent, 5 chân, 45 switch, thiết kế im lặng, phù hợp cho môi trường yên tĩnh', 0, 'AKKO', 'AKKO_Penguin_Silent.png', 'AKKO Penguin Switch (Silent) ( 5 pin / 45 switch)', 359000, 100, 'Switch AKKO Penguin Silent', 0, 'Văn phòng', 'SWITCH'),
(208, 'Bộ switch AKKO Fairy Silent, 5 chân, 45 switch, mang lại cảm giác gõ nhẹ nhàng và không ồn', 0, 'AKKO', 'AKKO_Fairy_Silent.png', 'AKKO Fairy Switch (Silent) ( 5 pin / 45 switch)', 359000, 100, 'Switch AKKO Fairy Silent', 0, 'Sinh viên', 'SWITCH'),
(209, 'Bộ switch AKKO Rosewood, 5 chân, 45 switch, cung cấp cảm giác gõ chắc chắn và âm thanh êm ái', 0, 'AKKO', 'AKKO_Rosewood.png', 'AKKO Switch Rosewood ( 5 pin / 45 switch)', 349000, 100, 'Switch AKKO Rosewood', 0, 'Gaming', 'SWITCH'),
(210, 'Bộ switch AKKO Dracula, 5 chân, 45 switch, thiết kế độc đáo, tối ưu cho trải nghiệm gõ phím', 0, 'AKKO', 'AKKO_Dracula.png', 'AKKO Switch Dracula ( 5 pin / 45 switch)', 399000, 100, 'Switch AKKO Dracula', 0, 'Cơ bản', 'SWITCH'),
(211, 'Bộ switch AKKO Botany, 5 chân, 45 switch, mang lại cảm giác gõ mượt mà và phản hồi tốt', 0, 'AKKO', 'AKKO_Botany.png', 'AKKO Switch Botany ( 5 pin / 45 switch)', 349000, 100, 'Switch AKKO Botany', 0, 'Văn phòng', 'SWITCH'),
(212, 'Bộ switch AKKO CS Starfish, 45 switch, cung cấp cảm giác gõ nhẹ và chính xác, phù hợp cho chơi game', 0, 'AKKO', 'AKKO_CS_Starfish.jpg', 'AKKO CS Switch – Starfish (45 switch)', 250000, 0, 'Switch AKKO CS Starfish', 0, 'Gaming', 'SWITCH'),
(213, 'Bộ switch AKKO CS Piano Lubed, 5 chân, 45 switch, bôi trơn sẵn, mang lại cảm giác gõ mượt mà', 0, 'AKKO', 'AKKO_CS_Piano_Lubed.jpg', 'AKKO CS switch – Piano (Lubed / 5 pin / 45 switch)', 399000, 0, 'Switch AKKO CS Piano Lubed', 0, 'Sinh viên', 'SWITCH'),
(214, 'Bộ switch AKKO v3 Cream Yellow Pro, 5 chân, 45 switch, mang lại cảm giác gõ nhẹ và phản hồi nhanh', 0, 'AKKO', 'AKKO_v3_Cream_Yellow_Pro.jpg', 'AKKO Switch v3 – Cream Yellow Pro ( 5 pin / 45 switch)', 259000, 100, 'Switch AKKO v3 Cream Yellow Pro', 0, 'Cơ bản', 'SWITCH'),
(215, 'Bộ switch AKKO v3 Cream Blue Pro, 5 chân, 45 switch, cung cấp âm thanh gõ đặc trưng và cảm giác tốt', 0, 'AKKO', 'AKKO_v3_Cream_Blue_Pro.jpg', 'AKKO Switch v3 – Cream Blue Pro ( 5 pin / 45 switch)', 259000, 100, 'Switch AKKO v3 Cream Blue Pro', 0, 'Gaming', 'SWITCH'),
(216, 'Bộ switch AKKO CS Haze Pink Silent, 45 switch, thiết kế im lặng, lý tưởng cho môi trường văn phòng', 0, 'AKKO', 'AKKO_CS_Haze_Pink_Silent.jpg', 'AKKO CS Switch – Haze Pink (Silent switch / 45 switch)', 349000, 0, 'Switch AKKO CS Haze Pink Silent', 0, 'Văn phòng', 'SWITCH'),
(217, 'Bộ switch AKKO CS POM Silver, 45 switch, mang lại cảm giác gõ nhanh và mượt, phù hợp cho chơi game', 0, 'AKKO', 'AKKO_CS_POM_Silver.jpg', 'AKKO CS Switch – POM Silver (45 switch)', 419000, 0, 'Switch AKKO CS POM Silver', 0, 'Sinh viên', 'SWITCH'),
(218, 'Bộ switch AKKO CS Snow Blue Grey, 5 chân, 45 switch, cung cấp cảm giác gõ cân bằng và âm thanh êm', 0, 'AKKO', 'AKKO_CS_Snow_Blue_Grey.jpg', 'AKKO CS switch – Snow Blue Grey (45 switch / 5 pin)', 399000, 0, 'Switch AKKO CS Snow Blue Grey', 0, 'Cơ bản', 'SWITCH'),
(219, 'Bàn di chuột AKKO Cabbage Dog M, thiết kế vui nhộn với hình ảnh chú khủng long, bề mặt mịn, tối ưu cho chơi game và công việc', 0, 'AKKO', 'AKKO_Cabbage_Dog.jpg', 'Bàn di AKKO Cabbage Dog', 249000, 100, 'Bàn di AKKO Cabbage Dog', 0, 'Gaming', 'MOUSEPAD'),
(220, 'Bàn di chuột AKKO Joy of Life, kích thước lớn, chủ đề nghệ thuật độc đáo, bề mặt mượt mà, phù hợp cho mọi nhu cầu', 0, 'AKKO', 'AKKO_Joy_of_Life.png', 'Bàn di AKKO Akko Joy of Life', 450000, 100, 'Bàn di AKKO Joy of Life', 0, 'Văn phòng', 'MOUSEPAD'),
(221, 'Bàn di chuột AKKO Cat Orange, thiết kế dễ thương với các nhân vật mèo, kích thước nhỏ gọn, lý tưởng cho sinh viên', 0, 'AKKO', 'AKKO_Cat_Orange.jpg', 'Bàn di Akko Cat Orange KATE/Gary MIMO/ANGIE', 149000, 100, 'Bàn di AKKO Cat Orange', 0, 'Sinh viên', 'MOUSEPAD'),
(222, 'Bàn di chuột AKKO Capybara, hình ảnh chuột lang nước đáng yêu, bề mặt chống trượt, phù hợp cho người dùng cơ bản', 0, 'AKKO', 'AKKO_Capybara.jpg', 'Bàn di Akko Capybara', 149000, 100, 'Bàn di AKKO Capybara', 0, 'Cơ bản', 'MOUSEPAD'),
(223, 'Bàn di chuột AKKO 7th Anniversary XXL, kích thước siêu lớn, thiết kế kỷ niệm 7 năm, bề mặt mịn, tối ưu cho game thủ', 0, 'AKKO', 'AKKO_7th_Anniversary_XXL.png', 'Bàn di AKKO Akko 7th Anniversary XXL', 349000, 100, 'Bàn di AKKO 7th Anniversary XXL', 0, 'Gaming', 'MOUSEPAD'),
(224, 'Bàn di chuột AKKO Dracula Castle XXL, kích thước lớn, chủ đề lâu đài ma cà rồng, bề mặt mượt, phù hợp cho văn phòng', 0, 'AKKO', 'AKKO_Dracula_Castle_XXL.jpg', 'Bàn di AKKO Dracula Castle XXL', 349000, 100, 'Bàn di AKKO Dracula Castle XXL', 0, 'Văn phòng', 'MOUSEPAD'),
(225, 'Bàn di chuột AKKO World Tour London XXL, kích thước lớn, chủ đề London, bề mặt chống trượt, lý tưởng cho sinh viên', 0, 'AKKO', 'AKKO_World_Tour_London_XXL.jpg', 'Bàn di AKKO World Tour London XXL', 349000, 100, 'Bàn di AKKO World Tour London XXL', 0, 'Sinh viên', 'MOUSEPAD'),
(226, 'Bàn di chuột AKKO Skull Cat Classic, thiết kế mèo đầu lâu độc đáo, kích thước nhỏ gọn, phù hợp cho người dùng cơ bản', 0, 'AKKO', 'AKKO_Skull_Cat_Classic.png', 'Bàn di AKKO Skull Cat Classic', 159000, 100, 'Bàn di AKKO Skull Cat Classic', 0, 'Cơ bản', 'MOUSEPAD'),
(227, 'Bàn di chuột AKKO Corgi Butt, hình ảnh mông chú chó Corgi dễ thương, bề mặt mịn, lý tưởng cho game thủ', 0, 'AKKO', 'AKKO_Corgi_Butt.jpg', 'Bàn di AKKO Corgi Butt', 159000, 100, 'Bàn di AKKO Corgi Butt', 0, 'Gaming', 'MOUSEPAD'),
(228, 'Quạt tản nhiệt điện thoại AKKO Magnetic Phone Cooler P10, màu trắng hồng, hiệu suất cao, phù hợp cho chơi game mobile', 0, 'AKKO', 'AKKO_Magnetic_Phone_Cooler_P10.png', 'Quạt tản nhiệt điện thoại AKKO Magnetic Phone Cooler P10 (Trắng / Hồng)', 529000, 100, 'Quạt tản nhiệt AKKO P10', 0, 'Văn phòng', 'OTHER'),
(229, 'USB Receiver 2.4Ghz cho bàn phím AKKO B series, B Plus series, RF series, đảm bảo kết nối không dây ổn định', 0, 'AKKO', 'AKKO_USB_Receiver_2_4Ghz.jpg', 'USB Receiver 2.4Ghz dành cho bàn phím AKKO (B series / B Plus series / RF series)', 159000, 100, 'USB Receiver AKKO 2.4Ghz', 0, 'Sinh viên', 'OTHER'),
(230, 'Bàn di chuột AKKO Tokyo Ghoul, chủ đề anime Tokyo Ghoul, bề mặt mịn, kích thước tiêu chuẩn, phù hợp cho người dùng cơ bản', 0, 'AKKO', 'AKKO_Tokyo_Ghoul.jpg', 'Bàn di AKKO Tokyo Ghoul', 299000, 100, 'Bàn di AKKO Tokyo Ghoul', 0, 'Cơ bản', 'MOUSEPAD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `comment`, `created_at`, `rating`, `product_id`, `user_id`) VALUES
(1, 'sản phẩm tốt', '2025-06-24 00:43:11.000000', 5, 101, 10),
(2, 'tốt', '2025-06-24 00:51:40.000000', 5, 102, 10),
(3, 'tốt', '2025-06-24 03:32:16.000000', 5, 109, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `description`, `name`) VALUES
(1, 'nguoi dung thong thuong', 'USER'),
(2, 'quan tri vien', 'ADMIN'),
(3, 'Nhan vien cua hang', 'EMPLOYEE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `spring_session`
--

CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `spring_session`
--

INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
('2b721555-7a99-409e-9e63-a13409c2ec97', '44c98b2b-fce7-4198-8449-3098a2e716df', 1750743125835, 1750762707595, 2592000, 1753354707595, 'zzctinboy@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `spring_session_attributes`
--

CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `spring_session_attributes`
--

INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
('2b721555-7a99-409e-9e63-a13409c2ec97', 'avatar', 0xaced0005740015313735303734323936313536302d7074312e6a7067),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'email', 0xaced00057400137a7a6374696e626f7940676d61696c2e636f6d),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'fullName', 0xaced000574000a54c3ad6e20c490c3a06f),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'id', 0xaced00057372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000a),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'jakarta.servlet.jsp.jstl.fmt.request.charset', 0xaced00057400055554462d38),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN', 0xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002465666662653233612d366335622d346639662d383633652d396131623338373439356264),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'SPRING_SECURITY_CONTEXT', 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000026c0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000026c0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000026c0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000026c0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002434653562623236652d313936312d346334392d393634392d656562623966323337333333707372002f7472692e6a6176612e6b6579626f61726473686f702e736572766963652e437573746f6d5573657244657461696c739ba3d32149a653810200014c0004757365727400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f557365723b7870737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e55736572000000000000000102000d4a000269644c00076164647265737371007e000f4c000661766174617271007e000f4c0004636172747400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f436172743b4c0005656d61696c71007e000f4c0007656e61626c65647400134c6a6176612f6c616e672f426f6f6c65616e3b4c000866756c6c4e616d6571007e000f4c00066f726465727371007e00094c000870617373776f726471007e000f4c000570686f6e6571007e000f4c000870726f766964657271007e000f4c0004726f6c657400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f526f6c653b4c0010766572696669636174696f6e436f646571007e000f7870000000000000000a74001f4c696e68205472756e672c205468e1bba720c490e1bba9632c20545048434d740015313735303734323936313536302d7074312e6a7067737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e4361727400000000000000010200044a0002696449000373756d4c000b6361727444657461696c7371007e00094c00047573657271007e001778700000000000000008000000017372002a6f72672e68696265726e6174652e636f6c6c656374696f6e2e7370692e50657273697374656e74426167963c61233a7241920200024c000362616771007e00094c001270726f7669646564436f6c6c656374696f6e71007e0006787200396f72672e68696265726e6174652e636f6c6c656374696f6e2e7370692e416273747261637450657273697374656e74436f6c6c656374696f6e33a4b04a3cf0460c02000b5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000e656c656d656e7452656d6f7665645a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b657971007e00044c00056f776e657271007e00044c0004726f6c6571007e000f4c001273657373696f6e466163746f72795575696471007e000f4c000e73746f726564536e617073686f747400164c6a6176612f696f2f53657269616c697a61626c653b787000ffffffff000000007372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000871007e002174002d7472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e436172742e6361727444657461696c737070707071007e001d7400137a7a6374696e626f7940676d61696c2e636f6d737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174000a54c3ad6e20c490c3a06f7371007e002200ffffffff000000007371007e0026000000000000000a71007e001d7400287472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e557365722e6f72646572737070707074003c243261243130246e5a4151414d596c73556f684e365a673475724e2e4f7a455553597361656e686f38757a70762f64414157596c347256497749487974000a303334363434343039387400054c4f43414c737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e526f6c6500000000000000010200044a000269644c000b6465736372697074696f6e71007e000f4c00046e616d6571007e000f4c0005757365727371007e00097870000000000000000274000d7175616e20747269207669656e74000541444d494e7371007e002200ffffffff000000007371007e0026000000000000000271007e00357400277472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e526f6c652e75736572737070707070),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'SPRING_SECURITY_SAVED_REQUEST', 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e44656661756c74536176656452657175657374000000000000026c02000f49000a736572766572506f72744c000b636f6e74657874506174687400124c6a6176612f6c616e672f537472696e673b4c0007636f6f6b6965737400154c6a6176612f7574696c2f41727261794c6973743b4c00076865616465727374000f4c6a6176612f7574696c2f4d61703b4c00076c6f63616c657371007e00024c001c6d61746368696e6752657175657374506172616d657465724e616d6571007e00014c00066d6574686f6471007e00014c000a706172616d657465727371007e00034c000870617468496e666f71007e00014c000b7175657279537472696e6771007e00014c000a7265717565737455524971007e00014c000a7265717565737455524c71007e00014c0006736368656d6571007e00014c000a7365727665724e616d6571007e00014c000b736572766c65745061746871007e0001787000001f90740000737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200396f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e5361766564436f6f6b6965000000000000026c0200084900066d61784167655a000673656375726549000776657273696f6e4c0007636f6d6d656e7471007e00014c0006646f6d61696e71007e00014c00046e616d6571007e00014c00047061746871007e00014c000576616c756571007e00017870ffffffff0000000000707074000753455353494f4e707400304e475531596d49794e6d55744d546b324d533030597a51354c546b324e446b745a575669596a6c6d4d6a4d334d7a4d7a78737200116a6176612e7574696c2e547265654d61700cc1f63e2d256ae60300014c000a636f6d70617261746f727400164c6a6176612f7574696c2f436f6d70617261746f723b78707372002a6a6176612e6c616e672e537472696e672443617365496e73656e736974697665436f6d70617261746f7277035c7d5c50e5ce02000078707704000000167400066163636570747371007e000600000001770400000001740087746578742f68746d6c2c6170706c69636174696f6e2f7868746d6c2b786d6c2c6170706c69636174696f6e2f786d6c3b713d302e392c696d6167652f617669662c696d6167652f776562702c696d6167652f61706e672c2a2f2a3b713d302e382c6170706c69636174696f6e2f7369676e65642d65786368616e67653b763d62333b713d302e377874000f6163636570742d656e636f64696e677371007e000600000001770400000001740017677a69702c206465666c6174652c2062722c207a7374647874000f6163636570742d6c616e67756167657371007e00060000000177040000000174000b76692c656e3b713d302e397874000d63616368652d636f6e74726f6c7371007e0006000000017704000000017400086e6f2d63616368657874000a636f6e6e656374696f6e7371007e00060000000177040000000174000a6b6565702d616c69766578740006636f6f6b69657371007e00060000000177040000000174003853455353494f4e3d4e475531596d49794e6d55744d546b324d533030597a51354c546b324e446b745a575669596a6c6d4d6a4d334d7a4d7a78740003646e747371007e0006000000017704000000017400013178740004686f73747371007e00060000000177040000000174000e6c6f63616c686f73743a3830383078740007726566657265727371007e00060000000177040000000174001c68747470733a2f2f6163636f756e74732e676f6f676c652e636f6d2f787400097365632d63682d75617371007e00060000000177040000000174004122476f6f676c65204368726f6d65223b763d22313337222c20224368726f6d69756d223b763d22313337222c20224e6f742f41294272616e64223b763d22323422787400107365632d63682d75612d6d6f62696c657371007e0006000000017704000000017400023f30787400127365632d63682d75612d706c6174666f726d7371007e0006000000017704000000017400092257696e646f7773227874000e7365632d66657463682d646573747371007e000600000001770400000001740008646f63756d656e747874000e7365632d66657463682d6d6f64657371007e0006000000017704000000017400086e617669676174657874000e7365632d66657463682d736974657371007e00060000000177040000000174000a63726f73732d736974657874000e7365632d66657463682d757365727371007e0006000000017704000000017400023f3178740019757067726164652d696e7365637572652d72657175657374737371007e000600000001770400000001740001317874000a757365722d6167656e747371007e00060000000177040000000174006f4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f3133372e302e302e30205361666172692f3533372e333678740011782d62726f777365722d6368616e6e656c7371007e000600000001770400000001740006737461626c6578740013782d62726f777365722d636f707972696768747371007e00060000000177040000000174002f436f70797269676874203230323520476f6f676c65204c4c432e20416c6c207269676874732072657365727665642e78740014782d62726f777365722d76616c69646174696f6e7371007e00060000000177040000000174001c4a3944536e5134796b4865696b3266426a627174482b6849726b733d7874000e782d62726f777365722d796561727371007e0006000000017704000000017400043230323578787371007e000600000002770400000002737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e74727971007e00014c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff74000071007e0056740002766971007e005671007e0056787371007e0054ffffffff71007e005671007e0056740002656e71007e005671007e00567878740008636f6e74696e75657400034745547371007e000c707704000000057400086175746875736572757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b4702000078700000000174000133740004636f64657571007e005e00000001740049342f3041564d42734a6a7a624673525136353976774f7a7247315955574968524c7078307477745639567050574e4c65376c34316967596e474a736545486d3954665744595741396774000670726f6d70747571007e005e00000001740007636f6e73656e7474000573636f70657571007e005e00000001740074656d61696c2070726f66696c652068747470733a2f2f7777772e676f6f676c65617069732e636f6d2f617574682f75736572696e666f2e70726f66696c652068747470733a2f2f7777772e676f6f676c65617069732e636f6d2f617574682f75736572696e666f2e656d61696c206f70656e696474000573746174657571007e005e0000000174002c5f6f42344438496a457a3261382d623236595a4c4f57427443734673654a49497064655159384a5475676b3d787074012e73746174653d5f6f42344438496a457a3261382d623236595a4c4f57427443734673654a49497064655159384a5475676b25334426636f64653d342532463041564d42734a6a7a624673525136353976774f7a7247315955574968524c7078307477745639567050574e4c65376c34316967596e474a736545486d395466574459574139672673636f70653d656d61696c2b70726f66696c652b68747470732533412532462532467777772e676f6f676c65617069732e636f6d2532466175746825324675736572696e666f2e70726f66696c652b68747470732533412532462532467777772e676f6f676c65617069732e636f6d2532466175746825324675736572696e666f2e656d61696c2b6f70656e69642661757468757365723d332670726f6d70743d636f6e73656e747400062f6572726f7274001b687474703a2f2f6c6f63616c686f73743a383038302f6572726f72740004687474707400096c6f63616c686f73747400062f6572726f72),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'sum', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001),
('2b721555-7a99-409e-9e63-a13409c2ec97', 'user', 0xaced0005737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e55736572000000000000000102000d4a000269644c0007616464726573737400124c6a6176612f6c616e672f537472696e673b4c000661766174617271007e00014c0004636172747400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f436172743b4c0005656d61696c71007e00014c0007656e61626c65647400134c6a6176612f6c616e672f426f6f6c65616e3b4c000866756c6c4e616d6571007e00014c00066f72646572737400104c6a6176612f7574696c2f4c6973743b4c000870617373776f726471007e00014c000570686f6e6571007e00014c000870726f766964657271007e00014c0004726f6c657400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f526f6c653b4c0010766572696669636174696f6e436f646571007e00017870000000000000000a74001f4c696e68205472756e672c205468e1bba720c490e1bba9632c20545048434d740015313735303734323936313536302d7074312e6a7067737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e4361727400000000000000010200044a0002696449000373756d4c000b6361727444657461696c7371007e00044c0004757365727400234c7472692f6a6176612f6b6579626f61726473686f702f646f6d61696e2f557365723b78700000000000000008000000017372002a6f72672e68696265726e6174652e636f6c6c656374696f6e2e7370692e50657273697374656e74426167963c61233a7241920200024c000362616771007e00044c001270726f7669646564436f6c6c656374696f6e7400164c6a6176612f7574696c2f436f6c6c656374696f6e3b787200396f72672e68696265726e6174652e636f6c6c656374696f6e2e7370692e416273747261637450657273697374656e74436f6c6c656374696f6e33a4b04a3cf0460c02000b5a001b616c6c6f774c6f61644f7574736964655472616e73616374696f6e49000a63616368656453697a655a000564697274795a000e656c656d656e7452656d6f7665645a000b696e697469616c697a65645a000d697354656d7053657373696f6e4c00036b65797400124c6a6176612f6c616e672f4f626a6563743b4c00056f776e657271007e000f4c0004726f6c6571007e00014c001273657373696f6e466163746f72795575696471007e00014c000e73746f726564536e617073686f747400164c6a6176612f696f2f53657269616c697a61626c653b787000ffffffff000000007372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000871007e000b74002d7472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e436172742e6361727444657461696c737070707071007e00067400137a7a6374696e626f7940676d61696c2e636f6d737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174000a54c3ad6e20c490c3a06f7371007e000c00ffffffff000000007371007e0012000000000000000a71007e00067400287472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e557365722e6f72646572737070707074003c243261243130246e5a4151414d596c73556f684e365a673475724e2e4f7a455553597361656e686f38757a70762f64414157596c347256497749487974000a303334363434343039387400054c4f43414c737200217472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e526f6c6500000000000000010200044a000269644c000b6465736372697074696f6e71007e00014c00046e616d6571007e00014c0005757365727371007e00047870000000000000000274000d7175616e20747269207669656e74000541444d494e7371007e000c00ffffffff000000007371007e0012000000000000000271007e00217400277472692e6a6176612e6b6579626f61726473686f702e646f6d61696e2e526f6c652e75736572737070707070);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `address`, `avatar`, `email`, `enabled`, `full_name`, `password`, `phone`, `provider`, `verification_code`, `role_id`) VALUES
(1, '', '1750718771479-java.png', 'tri1@gmail.com', b'1', 'tri tri thanh', '$2a$10$5i1u.jOkRcA/ulDvJ81eguplxumwQkwXWoc10RHX.DLsLsQCTKRb2', '', NULL, NULL, 1),
(3, 'Sai Gon', NULL, 'admin@gmail.com', b'1', 'Admin', '$2a$10$0VGybeOijKJruBvF2Wb8buZOnauQCar8Wbr0agKBhXsnsdT7qmx7a', '0123456789', 'LOCAL', NULL, 2),
(4, 'tăng nhơn phú a, thành phố thủ đức', '1750718928511-java.png', 'tranthanhtri@gmail.com', b'0', 'Trần Thanh Trí', '$2a$10$6p6qNi9.w/cT60Xl4CX0Defgh1KC7H/DfT0E02sntbfLR47LqKive', '0366084837', NULL, NULL, 2),
(8, NULL, NULL, 'comogaming1711@gmail.com', b'0', 'tran thanh tri ', '$2a$10$9ImkgZ7bETixjhW4tiP98OXFtqUZE6OITxZ9xGWU0I0CIzKd90hIO', NULL, 'LOCAL', NULL, 1),
(9, NULL, NULL, 'tranduytandtr@gmail.com', b'1', 'Trần Duy Tân', '$2a$10$viWbXk1FrbdYx0jUzQUkbOdRdpcUMOrj4KmQczhdHbbyV9xONMTMi', NULL, 'LOCAL', NULL, 2),
(10, 'Linh Trung, Thủ Đức, TPHCM', '1750742961560-pt1.jpg', 'zzctinboy@gmail.com', b'1', 'Tín Đào', '$2a$10$nZAQAMYlsUohN6Zg4urN.OzEUSYsaenho8uzpv/dAAWYl4rVIwIHy', '0346444098', 'LOCAL', NULL, 2),
(11, 'Linh Trung, Thủ Đức, TPHCM', '1750717959932-java.png', '21130564@st.hcmuaf.edu.vn', b'1', 'Tín Đào', '$2a$10$5g2SH7z2TLx9CYE1RPmIZeqr84iNRsbwjkiftcpdWE1ILIb.0ovge', '0346444098', 'LOCAL', NULL, 1),
(12, NULL, NULL, 'tin2310@gmail.com', b'0', 'Tín Đào', '$2a$10$RpHvE/a72PtWqPYZAusZuOtkNbyOd.zoJrLJwhTeO65veyC8gLsO6', NULL, 'LOCAL', '69b25b', 1),
(13, NULL, NULL, 'tindao2310@gmail.com', b'1', 'Tín Đào', '$2a$10$37riEpFsu/T9Ls5/u8LdOOAfLojHiMbCzBC2Iu9CtJInB6.UWj92m', NULL, 'LOCAL', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  ADD KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlri30okf66phtcgbe5pok7cc0` (`parent_id`),
  ADD KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  ADD KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`);

--
-- Chỉ mục cho bảng `custom_orders`
--
ALTER TABLE `custom_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9yvk150unkj1scqu2ur0sifbm` (`base_keyboard_id`),
  ADD KEY `FK638rf3eb084crjw8aghhn22qd` (`selected_keycap_id`),
  ADD KEY `FK6unbxt5arv3rtag3urbxabt02` (`selected_kit_id`),
  ADD KEY `FKn55php61tkj8qfcq9800m7i1` (`user_id`);

--
-- Chỉ mục cho bảng `custom_services`
--
ALTER TABLE `custom_services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  ADD KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  ADD KEY `FKcgy7qjc1r99dp117y9en6lxye` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `spring_session`
--
ALTER TABLE `spring_session`
  ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Chỉ mục cho bảng `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl7ao98u2bm8nijc1rv4jobcrx` (`product_id`),
  ADD KEY `FK330pyw2el06fn5g28ypyljt16` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `custom_orders`
--
ALTER TABLE `custom_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `custom_services`
--
ALTER TABLE `custom_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKlri30okf66phtcgbe5pok7cc0` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`);

--
-- Các ràng buộc cho bảng `custom_orders`
--
ALTER TABLE `custom_orders`
  ADD CONSTRAINT `FK638rf3eb084crjw8aghhn22qd` FOREIGN KEY (`selected_keycap_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK6unbxt5arv3rtag3urbxabt02` FOREIGN KEY (`selected_kit_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK9yvk150unkj1scqu2ur0sifbm` FOREIGN KEY (`base_keyboard_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKn55php61tkj8qfcq9800m7i1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `FK330pyw2el06fn5g28ypyljt16` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKl7ao98u2bm8nijc1rv4jobcrx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
