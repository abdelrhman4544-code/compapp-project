-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2025 at 04:45 PM
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
-- Database: `computerapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `message_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`message_id`, `name`, `email`, `subject`) VALUES
(1, 'Mohamed Selim', 'Moselim2002@gmail.com', 'Inquiry about dog food brands'),
(2, 'John Peterson', 'john.p@gmail.com', 'Order delay question'),
(3, 'Sarah Wilson', 'sarah.w@gmail.com', 'Requesting cat grooming appointment'),
(4, 'Ahmed Fathy', 'ahmedf@hotmail.com', 'Problem with payment checkout'),
(5, 'Maria Lopez', 'maria.l@gmail.com', 'Need recommendation for bird cages'),
(6, 'Rami Nassar', 'rami.n@yahoo.com', 'Follow-up about my recent order'),
(7, 'Julia Stone', 'julia.s@gmail.com', 'Question about refund policy'),
(8, 'Hassan Ali', 'hassan.a@outlook.com', 'Dog toy availability inquiry'),
(9, 'Lisa Wong', 'lisa.w@gmail.com', 'Issue with account login'),
(10, 'Adam Novak', 'adam.n@hotmail.com', 'Request for exotic pet supplies'),
(11, 'Noor Farouk', 'noor.f@gmail.com', 'Question about pet vaccinations'),
(12, 'Emily Carter', 'emily.c@outlook.com', 'Cat litter brands recommendation'),
(13, 'Omar Youssef', 'omar.y@gmail.com', 'Need help tracking my order'),
(14, 'Wei Chen', 'wei.c@gmail.com', 'Feedback on website performance'),
(15, 'Isabella Rossi', 'isabella.r@gmail.com', 'Inquiry about discount offers'),
(16, 'Abdul Rahman', 'abdul.r@gmail.com', 'Returning a defective product'),
(17, 'Karen Thomas', 'karen.t@gmail.com', 'Question about pet food sizes'),
(18, 'Jason Miller', 'jason.m@yahoo.com', 'Request for live chat support'),
(19, 'Fatma El Zahraa', 'fatma.z@gmail.com', 'Booking a grooming session'),
(20, 'James Scott', 'james.s@gmail.com', 'Asking about delivery time'),
(21, 'Tariq Mahmoud', 'tariq.m@gmail.com', 'Looking for hamster accessories'),
(22, 'Chloe Brown', 'chloe.b@outlook.com', 'Question regarding loyalty points'),
(23, 'Youssef Saber', 'youssef.s@yahoo.com', 'Problem adding items to cart'),
(24, 'Anna Kim', 'anna.k@gmail.com', 'Suggestions for improving store'),
(25, 'Mina Attia', 'mina.a@hotmail.com', 'Inquiry about new arrivals');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_price`) VALUES
(2, 1, '0000-00-00', 152.00),
(3, 2, '2025-06-25', 60.00),
(4, 3, '2025-06-27', 147.50),
(5, 4, '2025-06-29', 66.00),
(6, 5, '2025-07-01', 22.50),
(7, 6, '2025-07-03', 35.00),
(8, 7, '2025-07-05', 20.00),
(9, 8, '2025-07-07', 80.00),
(10, 9, '2025-07-09', 18.90),
(11, 10, '2025-07-11', 50.00),
(12, 11, '2025-07-13', 25.50),
(13, 12, '2025-07-15', 32.00),
(14, 13, '2025-07-17', 42.00),
(15, 14, '2025-07-19', 75.00),
(16, 15, '2025-07-21', 66.00),
(17, 16, '2025-07-23', 9.00),
(18, 17, '2025-07-25', 174.95),
(19, 18, '2025-07-27', 44.00),
(20, 19, '2025-07-29', 135.00),
(21, 20, '2025-07-31', 28.00),
(22, 21, '2025-08-02', 39.99),
(23, 22, '2025-08-04', 36.00),
(24, 23, '2025-08-06', 26.00),
(25, 24, '2025-08-08', 36.00),
(26, 25, '2025-08-10', 128.70),
(27, 26, '2025-08-12', 25.90),
(28, 27, '2025-08-14', 70.00),
(29, 28, '2025-08-16', 20.00),
(30, 29, '2025-08-18', 30.00),
(31, 30, '2025-08-20', 165.00),
(32, 31, '2025-08-22', 27.50),
(33, 32, '2025-08-24', 136.00),
(34, 33, '2025-08-26', 19.80),
(35, 34, '2025-08-28', 69.96),
(36, 35, '2025-08-30', 45.00),
(37, 36, '2025-09-01', 12.99),
(38, 37, '2025-09-03', 49.90),
(39, 38, '2025-09-05', 126.00),
(40, 39, '2025-09-07', 37.98),
(41, 40, '2025-09-09', 10.50),
(42, 41, '2025-09-11', 84.00),
(43, 42, '2025-09-13', 50.00),
(44, 43, '2025-09-15', 90.00),
(45, 44, '2025-09-17', 9.50),
(46, 45, '2025-09-19', 36.00),
(47, 46, '2025-09-21', 40.00),
(48, 47, '2025-09-23', 60.00),
(49, 48, '2025-09-25', 35.96),
(50, 49, '2025-09-27', 23.97),
(51, 50, '2025-09-29', 11.98),
(52, 51, '2025-10-01', 49.50);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`) VALUES
(1, 2, 1, 1, 80.00, 80.00),
(2, 2, 2, 2, 36.00, 72.00),
(3, 3, 3, 4, 15.00, 60.00),
(4, 4, 6, 5, 22.50, 112.50),
(5, 4, 5, 1, 20.00, 20.00),
(6, 5, 6, 1, 22.50, 22.50),
(7, 6, 7, 1, 35.00, 35.00),
(8, 7, 8, 2, 10.00, 20.00),
(9, 8, 9, 4, 45.00, 180.00),
(10, 9, 10, 1, 18.90, 18.90),
(11, 10, 11, 2, 25.00, 50.00),
(12, 11, 12, 3, 8.50, 25.50),
(13, 12, 13, 1, 32.00, 32.00),
(14, 13, 14, 3, 14.00, 42.00),
(15, 14, 15, 1, 75.00, 75.00),
(16, 15, 16, 4, 16.49, 65.96),
(17, 15, 17, 1, 9.00, 9.00),
(18, 16, 18, 5, 34.99, 174.95),
(19, 17, 19, 2, 22.00, 44.00),
(20, 18, 20, 3, 45.00, 135.00),
(21, 19, 21, 1, 28.00, 28.00),
(22, 20, 22, 1, 39.99, 39.99),
(23, 21, 23, 2, 18.00, 36.00),
(24, 22, 24, 1, 26.00, 26.00),
(25, 23, 25, 3, 12.00, 36.00),
(26, 24, 26, 3, 42.90, 128.70),
(27, 25, 27, 1, 25.90, 25.90),
(28, 26, 28, 2, 35.00, 70.00),
(29, 27, 29, 1, 20.00, 20.00),
(30, 28, 30, 1, 30.00, 30.00),
(31, 29, 31, 3, 55.00, 165.00),
(32, 30, 32, 1, 27.50, 27.50),
(33, 31, 33, 2, 68.00, 136.00),
(34, 32, 34, 1, 19.80, 19.80),
(35, 33, 35, 4, 17.49, 69.96),
(36, 34, 36, 3, 15.00, 45.00),
(37, 35, 37, 1, 12.99, 12.99),
(38, 36, 38, 1, 49.90, 49.90),
(39, 37, 39, 3, 42.00, 126.00),
(40, 38, 40, 2, 18.99, 37.98),
(41, 39, 41, 1, 10.50, 10.50),
(42, 40, 42, 3, 28.00, 84.00),
(43, 41, 43, 1, 50.00, 50.00),
(44, 42, 44, 5, 18.00, 90.00),
(45, 43, 45, 1, 9.50, 9.50),
(46, 44, 46, 3, 12.00, 36.00),
(47, 45, 47, 2, 20.00, 40.00),
(48, 46, 48, 1, 60.00, 60.00),
(49, 47, 49, 4, 8.99, 35.96),
(50, 48, 50, 3, 7.99, 23.97),
(51, 49, 51, 2, 5.99, 11.98),
(52, 50, 52, 3, 16.50, 49.50),
(53, 51, 53, 1, 95.00, 95.00),
(54, 51, 54, 2, 120.00, 240.00),
(55, 52, 55, 1, 350.00, 350.00),
(56, 3, 4, 1, 12.00, 12.00),
(57, 4, 7, 2, 35.00, 70.00),
(58, 5, 8, 3, 10.00, 30.00),
(59, 6, 9, 4, 45.00, 180.00),
(60, 7, 10, 1, 18.90, 18.90),
(61, 8, 11, 2, 25.00, 50.00),
(62, 9, 12, 3, 8.50, 25.50),
(63, 10, 13, 1, 32.00, 32.00),
(64, 11, 14, 2, 14.00, 28.00),
(65, 12, 15, 1, 75.00, 75.00),
(66, 13, 16, 3, 16.49, 49.47),
(67, 14, 17, 1, 9.00, 9.00),
(68, 15, 18, 2, 34.99, 69.98),
(69, 16, 19, 3, 22.00, 66.00),
(70, 17, 20, 1, 45.00, 45.00),
(71, 18, 21, 2, 28.00, 56.00),
(72, 19, 22, 1, 39.99, 39.99),
(73, 20, 23, 3, 18.00, 54.00),
(74, 21, 24, 1, 26.00, 26.00),
(75, 22, 25, 2, 12.00, 24.00),
(76, 23, 26, 1, 42.90, 42.90),
(77, 24, 27, 3, 25.90, 77.70),
(78, 25, 28, 1, 35.00, 35.00),
(79, 26, 29, 2, 20.00, 40.00),
(80, 27, 30, 1, 30.00, 30.00),
(81, 28, 31, 3, 55.00, 165.00),
(82, 29, 32, 1, 27.50, 27.50),
(83, 30, 33, 2, 68.00, 136.00),
(84, 31, 34, 1, 19.80, 19.80),
(85, 32, 35, 3, 17.49, 52.47),
(86, 33, 36, 1, 15.00, 15.00),
(87, 34, 37, 2, 12.99, 25.98),
(88, 35, 38, 1, 49.90, 49.90),
(89, 36, 39, 3, 42.00, 126.00),
(90, 37, 40, 1, 18.99, 18.99),
(91, 38, 41, 2, 10.50, 21.00),
(92, 39, 42, 1, 28.00, 28.00),
(93, 40, 43, 3, 50.00, 150.00),
(94, 41, 44, 1, 18.00, 18.00),
(95, 42, 45, 2, 9.50, 19.00),
(96, 43, 46, 1, 12.00, 12.00),
(97, 44, 47, 4, 20.00, 80.00),
(98, 45, 48, 3, 60.00, 180.00),
(99, 46, 49, 2, 8.99, 17.98),
(100, 47, 50, 1, 7.99, 7.99),
(101, 48, 51, 3, 5.99, 17.97);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `status` enum('stocked','out of stock') NOT NULL DEFAULT 'stocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `stock`, `status`) VALUES
(1, 'dog cage', 80.00, 5, 'stocked'),
(2, 'Pets Rubber Toy', 36.00, 40, 'stocked'),
(3, 'Rubber Blue Dog Toy', 15.00, 50, 'stocked'),
(4, 'Organic Catnip Toy', 12.00, 75, 'stocked'),
(5, 'Pet Grooming Brush', 20.00, 30, 'stocked'),
(6, 'Stainless Steel Bowl', 22.50, 25, 'stocked'),
(7, 'Interactive Laser Toy', 35.00, 40, 'stocked'),
(8, 'Dog Dental Chew', 10.00, 100, 'stocked'),
(9, 'Cat Scratching Post', 45.00, 15, 'stocked'),
(10, 'Pet Water Bottle', 18.90, 60, 'stocked'),
(11, 'Dog Leash Nylon', 25.00, 50, 'stocked'),
(12, 'Cat Collar with Bell', 8.50, 80, 'stocked'),
(13, 'Bird Feeder Cage', 32.00, 20, 'stocked'),
(14, 'Fish Tank Decor', 14.00, 100, 'stocked'),
(15, 'Dog Bed Memory Foam', 75.00, 10, 'stocked'),
(16, 'Pet Hair Remover', 16.49, 60, 'stocked'),
(17, 'Cat Treats Tuna Flavor', 9.00, 90, 'stocked'),
(18, 'Dog Raincoat XL', 34.99, 15, 'stocked'),
(19, 'Hamster Exercise Wheel', 22.00, 35, 'stocked'),
(20, 'Pet Carrier Backpack', 45.00, 25, 'stocked'),
(21, 'Cat Tunnel Toy', 28.00, 50, 'stocked'),
(22, 'Dog Cooling Mat', 39.99, 20, 'stocked'),
(23, 'Bird Bath Stand', 18.00, 30, 'stocked'),
(24, 'Reptile Heat Lamp', 26.00, 40, 'stocked'),
(25, 'Pet Nail Clipper', 12.00, 40, 'stocked'),
(26, 'Large Dog Harness', 42.90, 20, 'stocked'),
(27, 'Small Dog Sweater', 25.90, 30, 'stocked'),
(28, 'Cat Water Fountain', 35.00, 15, 'stocked'),
(29, 'Bird Seed Mix 2kg', 20.00, 50, 'stocked'),
(30, 'Puppy Training Pads', 30.00, 40, 'stocked'),
(31, 'Aquarium Filter', 55.00, 10, 'stocked'),
(32, 'Dog Kong Toy', 27.50, 60, 'stocked'),
(33, 'Ferret Cage Set', 68.00, 5, 'stocked'),
(34, 'Dog Shampoo Organic', 19.80, 25, 'stocked'),
(35, 'Cat Litter 10kg', 17.49, 100, 'stocked'),
(36, 'Hamster Bedding Soft', 15.00, 40, 'stocked'),
(37, 'Dog Frisbee Durable', 12.99, 60, 'stocked'),
(38, 'Pet Travel Bag', 49.90, 30, 'stocked'),
(39, 'Cat Bed Furry', 42.00, 15, 'stocked'),
(40, 'Dog Treat Ball', 18.99, 75, 'stocked'),
(41, 'Cat Ear Cleaner', 10.50, 80, 'stocked'),
(42, 'Bird Nest House', 28.00, 20, 'stocked'),
(43, 'Dog Winter Coat', 50.00, 15, 'stocked'),
(44, 'Pet Odor Spray', 18.00, 45, 'stocked'),
(45, 'Fish Food Pellets', 9.50, 100, 'stocked'),
(46, 'Dog Poop Bags', 12.00, 200, 'stocked'),
(47, 'Cat Harness Leash', 20.00, 30, 'stocked'),
(48, 'Pet First Aid Kit', 60.00, 5, 'stocked'),
(49, 'Dog Training Clicker', 8.99, 100, 'stocked'),
(50, 'Cat Plush Mouse Toy', 7.99, 110, 'stocked'),
(51, 'Pet ID Tag', 5.99, 150, 'stocked'),
(52, 'Rabbit Food Mix', 16.50, 50, 'stocked'),
(53, 'Premium Salmon Cat Treats 80g', 95.00, 0, 'out of stock'),
(54, 'Rabbit Hay Timothy Blend 1kg', 120.00, 0, 'out of stock'),
(55, 'Large Bird Feeding Station', 350.00, 0, 'out of stock'),
(56, 'Puppy Dental Chew Sticks (Pack of 10)', 75.00, 0, 'out of stock'),
(57, 'Reptile UVB Heating Lamp 50W', 260.00, 0, 'out of stock');

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `product_supplier_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_suppliers`
--

INSERT INTO `product_suppliers` (`product_supplier_id`, `product_id`, `supplier_id`) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 5, 3),
(4, 6, 4),
(5, 7, 5),
(6, 8, 6),
(7, 9, 7),
(8, 10, 8),
(9, 11, 9),
(10, 12, 10),
(11, 13, 11),
(12, 14, 12),
(13, 15, 13),
(14, 16, 14),
(15, 17, 15),
(16, 18, 16),
(17, 19, 17),
(18, 20, 18),
(19, 21, 19),
(20, 22, 20),
(21, 23, 21),
(22, 24, 22),
(23, 25, 23),
(24, 26, 24),
(25, 27, 25),
(26, 28, 26),
(27, 29, 27),
(28, 30, 28),
(29, 31, 29),
(30, 32, 30),
(31, 33, 31),
(32, 34, 32),
(33, 35, 33),
(34, 36, 34),
(35, 37, 35),
(36, 38, 36),
(37, 39, 37),
(38, 40, 38),
(39, 41, 39),
(40, 42, 40),
(41, 43, 41),
(42, 44, 42),
(43, 45, 43),
(44, 46, 44),
(45, 47, 45),
(46, 48, 46),
(47, 49, 47),
(48, 50, 48),
(49, 51, 49),
(50, 52, 50);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `order_id`, `address`, `city`, `status`) VALUES
(1, 2, '12 Road 9, Maadi', 'Cairo', 'pending'),
(2, 3, '5 Street 105, Maadi', 'Cairo', 'processing'),
(3, 4, '22 Street 7, Zamalek', 'Cairo', 'shipped'),
(4, 5, '41 Makram Ebeid, Nasr City', 'Cairo', 'in_transit'),
(5, 6, '9 Abbas El Akkad, Nasr City', 'Cairo', 'delivered'),
(6, 7, '15 Brazil Street, Zamalek', 'Cairo', 'pending'),
(7, 8, '33 El Hegaz Street, Heliopolis', 'Cairo', 'shipped'),
(8, 9, '72 Merghany Street, Heliopolis', 'Cairo', 'delivered'),
(9, 10, '18 Tahrir Street, Dokki', 'Giza', 'processing'),
(10, 11, '24 Mossadak Street, Dokki', 'Giza', 'in_transit'),
(11, 12, '11 Shehab Street, Mohandessin', 'Giza', 'cancelled'),
(12, 13, '29 Gameat El Dowal, Mohandessin', 'Giza', 'pending'),
(13, 14, '45 Mostafa Kamel Street', 'Alexandria', 'shipped'),
(14, 15, '7 Stanley Bridge Road', 'Alexandria', 'delivered'),
(15, 16, '14 El Gaish Road, San Stefano', 'Alexandria', 'returned'),
(16, 17, '19 Talaat Harb, Downtown', 'Cairo', 'processing'),
(17, 18, '8 Kasr El Nil Street', 'Cairo', 'in_transit'),
(18, 19, '77 Ramses Street', 'Cairo', 'delivered'),
(19, 20, '6 Ahmed Orabi Street', 'Giza', 'pending'),
(20, 21, '27 El Haram Street', 'Giza', 'shipped'),
(21, 22, '13 Faisal Street', 'Giza', 'processing'),
(22, 23, '102 October Street, 6th of October', 'Giza', 'in_transit'),
(23, 24, '55 El Mehwar Road, Sheikh Zayed', 'Giza', 'pending'),
(24, 25, '9 El Bostan Street, Downtown', 'Cairo', 'delivered'),
(25, 26, '3 Port Said Street', 'Cairo', 'shipped'),
(26, 27, '12 Mansheya Street', 'Alexandria', 'processing'),
(27, 28, '44 Sidi Gaber Road', 'Alexandria', 'in_transit'),
(28, 29, '18 Mostafa El Nahas, Nasr City', 'Cairo', 'pending'),
(29, 30, '30 Hassan Maamoun, Nasr City', 'Cairo', 'returned'),
(30, 31, '75 Nozha Street, Heliopolis', 'Cairo', 'delivered'),
(31, 32, '4 Al Ahram Street', 'Giza', 'shipped'),
(32, 33, '29 Sudan Street, Mohandessin', 'Giza', 'processing'),
(33, 34, '88 Ahmed Zewail Street', 'Giza', 'in_transit'),
(34, 35, '50 Saad Zaghloul Street', 'Cairo', 'pending'),
(35, 36, '101 Corniche Maadi', 'Cairo', 'shipped'),
(36, 37, '7 Road 233, Degla Maadi', 'Cairo', 'delivered'),
(37, 38, '29 El Laselki Street', 'Cairo', 'processing'),
(38, 39, '18 El Nasr Road, Maadi', 'Cairo', 'in_transit'),
(39, 40, '5 Al Mesaha Square, Dokki', 'Giza', 'pending'),
(40, 41, '19 Sphinx Square, Mohandessin', 'Giza', 'returned'),
(41, 42, '121 Cleopatra Street, Heliopolis', 'Cairo', 'delivered'),
(42, 43, '40 Baghdad Street, Korba', 'Cairo', 'shipped'),
(43, 44, '3 El Batrawy Street, Nasr City', 'Cairo', 'processing'),
(44, 45, '66 El Serag Mall Area, Nasr City', 'Cairo', 'in_transit'),
(45, 46, '28 Mostafa Kamel Axis, Smouha', 'Alexandria', 'pending'),
(46, 47, '91 Victoria Station Road', 'Alexandria', 'delivered'),
(47, 48, '11 El Mandara Beach Road', 'Alexandria', 'shipped'),
(48, 49, '5 Downtown Corniche', 'Alexandria', 'processing'),
(49, 50, '42 El Gamaa Street, Giza Square', 'Giza', 'in_transit'),
(50, 51, '17 Faisal Station Road', 'Giza', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_email`, `phone`, `address`) VALUES
(1, 'TechGear Distributors', 'contact@techgear.com', '+1-202-555-0123', '123 Tech Park, San Francisco, CA'),
(2, 'Alpha Electronics Ltd.', 'sales@alphaelectronics.com', '+44-20-7946-0958', '45 Park Lane, London, UK'),
(3, 'NextGen Supplies', 'info@nextgen.com', '+1-305-555-0198', '78 Silicon Drive, Miami, FL'),
(4, 'GigaTech Manufacturing', 'support@gigatech.com', '+91-22-6789-0123', '11 IT Park, Mumbai, India'),
(5, 'Digital Depot', 'hello@digitaldepot.net', '+1-617-555-0321', '89 River St, Boston, MA'),
(6, 'Prime Components', 'orders@primecomponents.com', '+49-30-4578-7865', '34 Alexanderplatz, Berlin, Germany'),
(7, 'Sigma Tech Partners', 'partners@sigmatech.co', '+61-2-5550-1234', '77 Tech Way, Sydney, Australia'),
(8, 'Global Electronics Trading', 'global@electronics-trd.com', '+971-4-555-3210', '32 Sheikh Zayed Rd, Dubai, UAE'),
(9, 'Delta Solutions', 'service@deltasolutions.cn', '+86-10-8234-5678', '88 Zhongguancun, Beijing, China'),
(10, 'Express Tech Supplies', 'order@expresstech.com', '+1-832-555-2314', '500 Tech Plaza, Houston, TX'),
(11, 'Sunrise Electronics', 'info@sunrise.com', '+81-3-4567-1234', '56 Shibuya, Tokyo, Japan'),
(12, 'Bright Wave Industries', 'contact@brightwave.com', '+27-11-555-0987', '101 Nelson Mandela Dr, Johannesburg, South Africa'),
(13, 'GreenTech Imports', 'import@greentech.org', '+353-1-555-8899', '23 St Stephen’s Green, Dublin, Ireland'),
(14, 'Aurora Components', 'sales@auroracomp.com', '+45-33-555-1122', '9 Nyhavn, Copenhagen, Denmark'),
(15, 'Master Circuit Co.', 'master@circuitco.com', '+1-415-555-5656', '600 Battery St, San Francisco, CA'),
(16, 'Zenith Hardware Supply', 'zenith@hardware.co', '+65-6221-4321', '15 Raffles Pl, Singapore'),
(17, 'Nova Tech Exchange', 'exchange@novatech.io', '+1-404-555-0001', '77 Peachtree St, Atlanta, GA'),
(18, 'Union Logic Inc.', 'logic@unionlogic.org', '+33-1-555-3355', '2 Rue de Rivoli, Paris, France'),
(19, 'Binary Bazar', 'bazaar@binary.com', '+1-206-555-8745', '55 Denny Way, Seattle, WA'),
(20, 'Everlast Components', 'everlast@parts.com', '+52-55-5554-2187', '120 Reforma Ave, Mexico City, Mexico'),
(21, 'HighPoint Systems', 'connect@highpoint.com', '+34-91-555-7765', '40 Gran Via, Madrid, Spain'),
(22, 'APEX Global Supply', 'apex@supplyglobal.biz', '+1-312-555-9238', '300 Wacker Dr, Chicago, IL'),
(23, 'Infinite Devices', 'orders@infinite.com', '+41-44-555-3321', '12 Bahnhofstrasse, Zurich, Switzerland'),
(24, 'TechSource Africa', 'contact@techsource.af', '+234-1-555-0912', '90 Adeola St, Lagos, Nigeria'),
(25, 'Pulse Systems Co.', 'pulse@sysco.com', '+1-602-555-1200', '400 Camelback Rd, Phoenix, AZ'),
(26, 'Synapse Electronics', 'info@synapseelec.com', '+971-2-555-1101', '15 Al Reem Island, Abu Dhabi, UAE'),
(27, 'Evergreen Components', 'sale@evergreenparts.com', '+82-2-555-9012', '200 Gangnam Ave, Seoul, South Korea'),
(28, 'Binary Box Supplies', 'info@binarybox.sup', '+39-06-555-4440', '14 Via Veneto, Rome, Italy'),
(29, 'Omega Chips', 'inquiries@omegachip.io', '+1-503-555-3098', '70 Tech View, Portland, OR'),
(30, 'Edgeware Solutions', 'hello@edgeware.co', '+1-513-555-6891', '250 Vine St, Cincinnati, OH'),
(31, 'SmartLink Technologies', 'support@smartlink.com', '+886-2-555-6678', '45 Xinyi Rd, Taipei, Taiwan'),
(32, 'Velocity Imports', 'sales@velocityimp.com', '+61-7-5555-1234', '12 Queen St, Brisbane, Australia'),
(33, 'Vertex Systems', 'vertex@sys.com', '+1-214-555-9967', '888 Tech Pkwy, Dallas, TX'),
(34, 'Nexus Component Depot', 'nexus@depot.com', '+48-22-555-6677', '5 Warsaw Center, Warsaw, Poland'),
(35, 'MakerCore Distribution', 'core@makerco.net', '+1-714-555-4412', '99 Innovation Dr, Irvine, CA'),
(36, 'Peak Tech Partners', 'partner@peaktech.com', '+1-718-555-0921', '40 Broadway, New York, NY'),
(37, 'SynTech Suppliers', 'contact@syntech.supply', '+46-8-555-7889', '10 Birger Jarlsgatan, Stockholm, Sweden'),
(38, 'Radial Components', 'radial@comm.co', '+1-305-555-9965', '212 Ocean Dr, Miami, FL'),
(39, 'Trident Electronics', 'sales@trident-el.com', '+20-2-555-8890', '22 Talaat Harb St, Cairo, Egypt'),
(40, 'Direct Hardware Corp.', 'direct@hwcorp.com', '+1-702-555-5841', '330 Sunset Rd, Las Vegas, NV'),
(41, 'Meta Tech Industries', 'meta@techind.org', '+1-646-555-7896', '400 5th Ave, New York, NY'),
(42, 'Skyway IT Components', 'it@skyway.com', '+82-32-555-0912', '88 Incheon Cir, Incheon, South Korea'),
(43, 'Bridgepoint Supply Co.', 'connect@bridgepoint.com', '+1-504-555-8881', '120 Canal St, New Orleans, LA'),
(44, 'Precision Parts Hub', 'parts@precisionhub.com', '+1-215-555-7439', '500 Market St, Philadelphia, PA'),
(45, 'MaxValue Electronics', 'mve@electroval.com', '+31-20-555-3201', '27 Damrak, Amsterdam, Netherlands'),
(46, 'United Hardware Distributors', 'united@hwdis.com', '+1-813-555-2122', '700 Tech Lane, Tampa, FL'),
(47, 'Atlas Tech Supply', 'service@atlassupply.org', '+55-21-555-1234', '85 Copacabana, Rio de Janeiro, Brazil'),
(48, 'Orbit Components', 'contact@orbit.io', '+1-217-555-9712', '10 State St, Springfield, IL'),
(49, 'Vector Electronics', 'vector@electrovec.com', '+64-9-555-5521', '112 Queen St, Auckland, New Zealand'),
(50, 'Pioneer Circuit Supply', 'pioneer@circuit.com', '+1-808-555-1113', '99 Ala Moana, Honolulu, HI');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Mohamed Selim', 'Moselim2002@gmail.com', 'N2gg42b3'),
(2, 'John Peterson', 'john.p@gmail.com', '123pass'),
(3, 'Sarah Wilson', 'sarah.w@gmail.com', 'secure123'),
(4, 'Ahmed Fathy', 'ahmedf@hotmail.com', 'ahmed123'),
(5, 'Maria Lopez', 'maria.l@gmail.com', 'maria456'),
(6, 'Rami Nassar', 'rami.n@yahoo.com', 'rami789'),
(7, 'Julia Stone', 'julia.s@gmail.com', 'julia987'),
(8, 'Hassan Ali', 'hassan.a@outlook.com', 'hassan24'),
(9, 'Lisa Wong', 'lisa.w@gmail.com', 'lisa777'),
(10, 'Adam Novak', 'adam.n@hotmail.com', 'adampass'),
(11, 'Noor Farouk', 'noor.f@gmail.com', 'noor123'),
(12, 'Emily Carter', 'emily.c@outlook.com', 'emilyxyz'),
(13, 'Omar Youssef', 'omar.y@gmail.com', 'omarpass'),
(14, 'Wei Chen', 'wei.c@gmail.com', 'weichen76'),
(15, 'Isabella Rossi', 'isabella.r@gmail.com', 'bella321'),
(16, 'Abdul Rahman', 'abdul.r@gmail.com', 'abdul777'),
(17, 'Karen Thomas', 'karen.t@gmail.com', 'karen123'),
(18, 'Jason Miller', 'jason.m@yahoo.com', 'jason543'),
(19, 'Fatma El Zahraa', 'fatma.z@gmail.com', 'fatma789'),
(20, 'James Scott', 'james.s@gmail.com', 'james111'),
(21, 'Tariq Mahmoud', 'tariq.m@gmail.com', 'tariqpass'),
(22, 'Chloe Brown', 'chloe.b@outlook.com', 'chloe444'),
(23, 'Youssef Saber', 'youssef.s@yahoo.com', 'ys123456'),
(24, 'Anna Kim', 'anna.k@gmail.com', 'anna2023'),
(25, 'Mina Attia', 'mina.a@hotmail.com', 'mina@123'),
(26, 'George Bryan', 'george.b@gmail.com', 'george890'),
(27, 'Layla Ahmed', 'layla.a@gmail.com', 'layla321'),
(28, 'Ethan Clark', 'ethan.c@gmail.com', 'ethan654'),
(29, 'Sara Ibrahim', 'sara.i@hotmail.com', 'sara789'),
(30, 'David Larson', 'david.l@yahoo.com', 'david999'),
(31, 'Mohamed Tarek', 'mohamed.t@gmail.com', 'mohamed159'),
(32, 'Rachel Green', 'rachel.g@gmail.com', 'friends123'),
(33, 'Ali Hassan', 'ali.h@gmail.com', 'ali555'),
(34, 'Jenna Ortega', 'jenna.o@gmail.com', 'jenna666'),
(35, 'Mustafa Kamal', 'mustafa.k@hotmail.com', 'mustafa101'),
(36, 'Sarah Paulson', 'sarah.p@gmail.com', 'sarah200'),
(37, 'Victor Hugo', 'victor.h@outlook.com', 'victor007'),
(38, 'Amani Hussein', 'amani.h@gmail.com', 'amani202'),
(39, 'Tom Hardy', 'tom.h@gmail.com', 'hardy007'),
(40, 'Ahmad Salem', 'ahmad.s@hotmail.com', 'ahmad909'),
(41, 'Karen Walker', 'karen.w@yahoo.com', 'karen007'),
(42, 'Zhang Li', 'zhang.l@gmail.com', 'zhangLi987'),
(43, 'Emily Wong', 'emily.w@hotmail.com', 'emily123'),
(44, 'Hassan Hegazy', 'hegazy.h@gmail.com', 'hegazy999'),
(45, 'Mira Khaled', 'mira.k@gmail.com', 'mira555'),
(46, 'Paul Drake', 'paul.d@gmail.com', 'paulZero'),
(47, 'Elisa Gomez', 'elisa.g@gmail.com', 'elisa432'),
(48, 'Rami Saleh', 'rami.s@hotmail.com', 'ramisaleh'),
(49, 'Yara Fathy', 'yara.f@gmail.com', 'yara75'),
(50, 'Henry Ford', 'henry.f@gmail.com', 'ford123'),
(51, 'Noura Ali', 'noura.a@hotmail.com', 'noura888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`product_supplier_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  MODIFY `product_supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
