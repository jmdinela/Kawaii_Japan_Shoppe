-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 12:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = product',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `type`, `date_created`, `date_updated`) VALUES
(3, 'Plasticwares', '&lt;p&gt;Everyday household items made from lightweight and durable plastic, including containers, cups, and plates.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 04:45:36', NULL),
(4, 'Ceramics', '&lt;p&gt;Functional and decorative items crafted from clay, such as dishes, mugs, and vases, known for their durability and aesthetic appeal.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 04:57:43', NULL),
(5, 'Kitchen Utensils', '&lt;p&gt;Essential tools for food preparation, such as spatulas, ladles, and knives, making cooking tasks more efficient.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:02:59', NULL),
(6, 'Plates', '&lt;p&gt;Flat, round dishes in various materials (ceramics, glass, plastic) used for serving food on different occasions.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:03:16', NULL),
(7, 'Frames', '&lt;p&gt;Structures to display and enhance the visual appeal of pictures, artworks, or documents, available in different materials.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:03:34', NULL),
(8, 'Baking Tools', '&lt;p&gt;Utensils and equipment like measuring cups and mixing bowls used in baking for precise and efficient preparation.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:05:16', NULL),
(9, 'Tools', '&lt;p&gt;General implements, including screwdrivers and pliers, for household maintenance, repair, or construction tasks.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:05:31', NULL),
(10, 'Electronics', '&lt;p&gt;Household electronic devices, such as televisions and smartphones, enhancing entertainment, communication, and productivity.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:05:45', NULL),
(11, 'Accessories', '&lt;p&gt;Supplementary items that complement or enhance the functionality and appearance of a space, including decorative and organizational elements.&lt;br&gt;&lt;/p&gt;', 1, '2023-12-12 05:06:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices_items`
--

CREATE TABLE `invoices_items` (
  `id` int(30) NOT NULL,
  `invoice_id` int(30) NOT NULL,
  `form_id` int(30) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices_items`
--

INSERT INTO `invoices_items` (`id`, `invoice_id`, `form_id`, `unit`, `quantity`, `price`, `total`) VALUES
(61, 35, 41, 'pcs', 1, 30000, 30000),
(62, 35, 40, 'pcs', 1, 12799, 12799),
(63, 35, 45, 'pcs', 1, 335, 335),
(64, 36, 26, 'pcs', 3, 150, 450),
(65, 36, 39, 'pcs', 1, 15499, 15499),
(66, 36, 40, 'pcs', 2, 12799, 25598),
(67, 37, 41, 'pcs', 1, 30000, 30000),
(68, 37, 43, 'pcs', 1, 500, 500),
(69, 37, 42, 'pcs', 1, 875, 875),
(70, 37, 45, 'pcs', 1, 335, 335),
(71, 38, 31, 'pcs', 1, 235, 235),
(72, 38, 30, 'pcs', 1, 25, 25),
(73, 38, 32, 'pcs', 3, 175, 525),
(74, 38, 40, 'pcs', 1, 12799, 12799),
(75, 38, 43, 'pcs', 1, 500, 500),
(76, 38, 44, 'pcs', 2, 250, 500),
(77, 39, 48, 'pcs', 1, 250, 250),
(78, 39, 34, 'pcs', 1, 158, 158),
(79, 39, 28, 'pcs', 1, 250, 250),
(80, 39, 42, 'pcs', 1, 875, 875),
(81, 39, 41, 'pcs', 1, 30000, 30000),
(82, 40, 39, 'pcs', 1, 15499, 15499),
(83, 40, 40, 'pcs', 1, 12799, 12799);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_list`
--

CREATE TABLE `invoice_list` (
  `id` int(30) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `customer_name` text NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `sub_total` float NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_list`
--

INSERT INTO `invoice_list` (`id`, `invoice_code`, `customer_name`, `type`, `weight`, `shipping_fee`, `sub_total`, `total_amount`, `remarks`, `date_created`, `date_updated`) VALUES
(35, 'KJS5142289', 'Moren', 1, '1kg-3kg', 155.00, 43134, 43289, 'Remarks for Invoice #KJS5142289 transactions.', '2024-01-15 07:41:43', NULL),
(36, 'KJS5064341', 'Shenna', 1, '1kg-3kg', 155.00, 41547, 41702, 'Remarks for Invoice #KJS5064341 transactions.', '2024-01-15 07:43:11', NULL),
(37, 'KJS1681689', 'Lee', 1, '3kg-4kg', 225.00, 31710, 31935, 'Remarks for Invoice #KJS1681689 transactions.', '2024-01-15 07:45:32', NULL),
(38, 'KJS1472760', 'Jake', 1, '4kg-5kg', 305.00, 14584, 14889, 'Remarks for Invoice #KJS1472760 transactions.', '2024-01-15 07:48:36', NULL),
(39, 'KJS6247240', 'Jay Ar', 1, '3kg-4kg', 225.00, 31533, 31758, 'Remarks for Invoice #KJS6247240 transactions.', '2024-01-15 07:50:56', NULL),
(40, 'KJS7723040', 'Renzo', 1, '500g-1kg', 115.00, 28298, 28413, 'Remarks for Invoice #KJS7723040 transactions.', '2024-01-15 07:52:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `product` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = available, 2 = unavailable',
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `product`, `description`, `status`, `price`, `date_created`, `date_updated`) VALUES
(4, 3, 'Plastic Food Storage Containers', '&lt;p&gt;Set of durable containers for storing food.&lt;br&gt;&lt;/p&gt;', 2, 150, '2023-12-12 04:59:03', '2023-12-17 23:34:37'),
(5, 3, 'Plastic Tumblers', '&lt;p&gt;Lightweight and reusable tumblers for beverages.&lt;br&gt;&lt;/p&gt;', 1, 50, '2023-12-12 05:07:06', NULL),
(6, 3, 'Plastic Dinner Plates', '&lt;p&gt;Sturdy plates suitable for everyday use.&lt;br&gt;&lt;/p&gt;', 1, 80, '2023-12-12 05:07:53', NULL),
(7, 3, 'Plastic Cutlery Set', '&lt;p&gt;Disposable yet durable cutlery for convenient use.&lt;br&gt;&lt;/p&gt;', 2, 100, '2023-12-12 05:08:27', '2023-12-17 23:34:16'),
(8, 3, 'Plastic Mixing Bowls', '&lt;p&gt;Nesting bowls for food preparation.&lt;br&gt;&lt;/p&gt;', 1, 120, '2023-12-12 05:09:31', NULL),
(9, 4, 'Ceramic Dinnerware Set', '&lt;p&gt;Elegant set including plates, bowls, and mugs.&lt;br&gt;&lt;/p&gt;', 1, 500, '2023-12-12 05:10:13', NULL),
(10, 4, 'Ceramic Flower Vase', '&lt;p&gt;Stylish vase for displaying flowers or decor.&lt;br&gt;&lt;/p&gt;', 1, 250, '2023-12-12 05:10:42', NULL),
(11, 4, 'Ceramic Baking Dish', '&lt;p&gt;Oven-safe dish for baking and serving.&lt;br&gt;&lt;/p&gt;', 1, 180, '2023-12-12 05:11:13', NULL),
(12, 4, 'Ceramic Coffee Mug', '&lt;p&gt;Classic mugs for hot beverages.&lt;br&gt;&lt;/p&gt;', 1, 80, '2023-12-12 05:11:37', NULL),
(13, 4, 'Ceramic Salad Bowl', '&lt;p&gt;Large bowl suitable for salads or serving dishes.&lt;br&gt;&lt;/p&gt;', 1, 300, '2023-12-12 05:12:53', NULL),
(14, 5, 'Stainless Steel Knife Set', '&lt;p&gt;Set of high-quality knives for various kitchen tasks.&lt;br&gt;&lt;/p&gt;', 1, 300, '2023-12-12 05:53:42', NULL),
(15, 5, 'Silicone Spatula Set', '&lt;p&gt;Heat-resistant spatulas for cooking and baking.&lt;br&gt;&lt;/p&gt;', 1, 150, '2023-12-12 05:54:10', NULL),
(16, 5, 'Wooden Cooking Utensils', '&lt;p&gt;Durable and stylish wooden utensils.&lt;br&gt;&lt;/p&gt;', 1, 120, '2023-12-12 05:55:12', NULL),
(17, 5, 'Stainless Steel Measuring Spoons', '&lt;p&gt;Accurate measuring tools for recipes.&lt;br&gt;&lt;/p&gt;', 1, 80, '2023-12-12 05:55:41', NULL),
(18, 5, 'Nylon Cooking Tongs', '&lt;p&gt;Non-scratch tongs for cooking and serving.&lt;br&gt;&lt;/p&gt;', 1, 100, '2023-12-12 05:56:28', NULL),
(19, 6, 'Glass Dinner Plates', '&lt;p&gt;Elegant and durable glass plates.&lt;br&gt;&lt;/p&gt;', 1, 200, '2023-12-12 05:57:16', NULL),
(20, 6, 'Melamine Kids Plates', '&lt;p&gt;Colorful and shatterproof plates for children.&lt;br&gt;&lt;/p&gt;', 1, 60, '2023-12-12 05:57:50', NULL),
(21, 6, 'Bamboo Fiber Salad Plates', '&lt;p&gt;Eco-friendly and lightweight plates.&lt;br&gt;&lt;/p&gt;', 1, 120, '2023-12-12 05:58:18', NULL),
(22, 6, 'Porcelain Appetizer Plates', '&lt;p&gt;Small plates for appetizers and desserts.&lt;br&gt;&lt;/p&gt;', 1, 180, '2023-12-12 05:58:56', NULL),
(23, 6, 'Stainless Steel Dinner Plates', '&lt;p&gt;Modern and durable dinnerware.&lt;br&gt;&lt;/p&gt;', 1, 250, '2023-12-12 06:00:13', NULL),
(24, 7, 'Wooden Photo Frame', '&lt;p&gt;Classic wooden frames for pictures.&lt;br&gt;&lt;/p&gt;', 1, 100, '2023-12-12 06:00:36', NULL),
(25, 7, 'Metal Collage Frame', '&lt;p&gt;Multi-photo frame for creating a collage.&lt;br&gt;&lt;/p&gt;', 1, 300, '2023-12-12 06:01:03', NULL),
(26, 7, 'Acrylic Floating Frame', '&lt;p&gt;Transparent frames for a modern look.&lt;br&gt;&lt;/p&gt;', 1, 150, '2023-12-12 06:01:28', NULL),
(27, 7, 'Plastic Poster Frame', '&lt;p&gt;Affordable frames for posters or prints.&lt;br&gt;&lt;/p&gt;', 1, 80, '2023-12-12 06:01:56', NULL),
(28, 7, 'Vintage-Style Wall Frame', '&lt;p&gt;Ornate frames for a touch of elegance.&lt;br&gt;&lt;/p&gt;', 1, 250, '2023-12-12 06:02:27', NULL),
(29, 8, 'Non-Stick Baking Sheet', '&lt;p&gt;Essential for baking cookies and pastries.&lt;br&gt;&lt;/p&gt;', 1, 195, '2023-12-12 06:19:49', NULL),
(30, 8, 'Silicone Baking Mat', '&lt;p&gt;Non-stick surface for easy baking and clean-up.&lt;br&gt;&lt;/p&gt;', 1, 25, '2023-12-12 06:20:33', NULL),
(31, 8, 'Rolling Pin with Guides', '&lt;p&gt;Adjustable rolling pin for precise dough thickness.&lt;br&gt;&lt;/p&gt;', 1, 235, '2023-12-12 06:21:40', NULL),
(32, 8, 'Stainless Steel Cookie Cutters Set', '&lt;p&gt;Various shapes for creative baking.&lt;br&gt;&lt;/p&gt;', 1, 175, '2023-12-12 06:22:14', NULL),
(33, 8, '', '&lt;p&gt;Pastry Blender&lt;br&gt;&lt;/p&gt;', 1, 85, '2023-12-12 06:22:43', NULL),
(34, 9, 'Screwdriver Set', '&lt;p&gt;Set of various screwdrivers for household tasks.&lt;br&gt;&lt;/p&gt;', 1, 158, '2023-12-12 06:23:45', NULL),
(35, 9, 'Claw Hammer', '&lt;p&gt;Classic hammer for basic DIY projects.&lt;br&gt;&lt;/p&gt;', 1, 125, '2023-12-12 06:24:16', NULL),
(36, 9, 'Adjustable Wrench', '&lt;p&gt;Versatile wrench for tightening or loosening nuts.&lt;br&gt;&lt;/p&gt;', 1, 95, '2023-12-12 06:24:48', NULL),
(37, 9, 'Pliers Set', '&lt;p&gt;Different types of pliers for various tasks.&lt;br&gt;&lt;/p&gt;', 1, 100, '2023-12-12 06:25:22', NULL),
(38, 9, 'Tape Measure', '&lt;p&gt;Accurate measuring tool for various applications.&lt;br&gt;&lt;/p&gt;', 1, 50, '2023-12-12 06:25:56', NULL),
(39, 10, 'LED Smart TV', '&lt;p&gt;High-definition television with smart features.&lt;br&gt;&lt;/p&gt;', 1, 15499, '2023-12-12 06:28:03', NULL),
(40, 10, 'Smartphone', '&lt;p&gt;Feature-rich mobile phone for communication and apps.&lt;br&gt;&lt;/p&gt;', 1, 12799, '2023-12-12 06:28:49', NULL),
(41, 10, 'Laptop', '&lt;p&gt;Portable computer for work and entertainment.&lt;br&gt;&lt;/p&gt;', 1, 30000, '2023-12-12 06:29:19', NULL),
(42, 10, 'Bluetooth Speaker', '&lt;p&gt;Portable speaker for wireless audio playback.&lt;br&gt;&lt;/p&gt;', 1, 875, '2023-12-12 06:30:05', NULL),
(43, 10, 'Electric Kettle', '&lt;p&gt;Quick-boiling kettle for hot beverages.&lt;br&gt;&lt;/p&gt;', 1, 500, '2023-12-12 06:30:34', NULL),
(44, 11, 'Decorative Throw Pillows', '&lt;p&gt;Stylish cushions for sofas or beds.&lt;br&gt;&lt;/p&gt;', 1, 250, '2023-12-12 06:32:00', NULL),
(45, 11, 'Wall Clock', '&lt;p&gt;Functional and decorative timepiece for walls.&lt;br&gt;&lt;/p&gt;', 1, 335, '2023-12-12 06:32:25', NULL),
(46, 11, 'Drawer Organizers Set', 'Organizers for tidying up drawers.', 1, 150, '2023-12-12 06:32:57', NULL),
(47, 11, 'Artificial Plants', '&lt;p&gt;Low-maintenance greenery for decor.&lt;br&gt;&lt;/p&gt;', 1, 189, '2023-12-12 06:33:31', NULL),
(48, 11, 'Bedside Table Lamp', '&lt;p&gt;Illuminating and stylish lamp for bedside tables.&lt;br&gt;&lt;/p&gt;', 1, 250, '2023-12-12 06:36:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Kawaii Japan Shoppe'),
(6, 'short_name', 'Kawaii Japan Shoppe'),
(11, 'logo', 'uploads/logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg'),
(15, 'tax_rate', '12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1664026500_male1.jfif', NULL, 1, '2021-01-20 14:02:37', '2022-09-24 21:35:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_items`
--
ALTER TABLE `invoices_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_list`
--
ALTER TABLE `invoice_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoices_items`
--
ALTER TABLE `invoices_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `invoice_list`
--
ALTER TABLE `invoice_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
