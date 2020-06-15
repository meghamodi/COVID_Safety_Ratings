-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 15, 2020 at 01:17 AM
-- Server version: 5.7.30
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `places`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ratings`
--

CREATE TABLE `Ratings` (
  `rating_id` int(255) NOT NULL,
  `store_id` int(255) NOT NULL,
  `rating` float NOT NULL,
  `rating_date` date NOT NULL,
  `rating_comment` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ratings`
--

INSERT INTO `Ratings` (`rating_id`, `store_id`, `rating`, `rating_date`, `rating_comment`, `user_id`) VALUES
(1, 1, 3.9, '2020-06-02', 'Okay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Stores`
--

CREATE TABLE `Stores` (
  `store_id` int(255) NOT NULL,
  `store_name` varchar(22) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `address` varchar(38) DEFAULT NULL,
  `county` varchar(11) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `open_hours` varchar(13) DEFAULT NULL,
  `No_of_reviews` int(3) DEFAULT NULL,
  `star_rating` float(2,1) DEFAULT NULL,
  `latitude` text,
  `longitude` text,
  `image source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stores`
--

INSERT INTO `Stores` (`store_id`, `store_name`, `category`, `address`, `county`, `state`, `open_hours`, `No_of_reviews`, `star_rating`, `latitude`, `longitude`, `image source`) VALUES
(1, 'Pizza California', 'Restaurants', '1095 E Brokaw Rd, Str 70, North Valley', 'Santa Clara', 'California', '11 AM - 7 PM', 541, 4.0, '', '', ''),
(2, 'Habit Burger', 'Restaurants', '2000, El Camino Real, Suite 19', 'Santa Clara', 'California', '10 AM - 8 PM', 204, 3.5, '37.352129', '-121.95977', 'https://i.ibb.co/LJXRgNj/Habit-Burger.jpg'),
(3, 'Olive Garden', 'Restaurants', '1350 Greal Mall Dr, Milpitas', 'Santa Clara', 'California', '10 AM - 8 PM', 808, 3.0, '37.412829', '-121.895848', 'https://i.ibb.co/ZNDN5MQ/Olive-Garden.jpg'),
(4, 'Venus Cafe', 'Restaurants', '1698 Hostetter Ste K, Bldg A', 'Santa Clara', 'California', '7AM - 4 PM', 411, 3.5, '37.387145', '-121.883553', 'https://i.ibb.co/kMWyYvP/Venus-Cafe.jpg'),
(5, 'Panera Bread', 'Restaurants', '503, Coleman Avenue, Downtown', 'Santa Clara', 'California', '11 AM - 7 PM', 297, 3.3, '', '', 'https://i.ibb.co/4pGTFDC/Panera-Bread.jpg'),
(6, 'VN Grill', 'Restaurants', '1085 E BR, Ste 20', 'Santa Clara', 'California', '7AM - 4 PM', 870, 4.7, '', '', 'https://i.ibb.co/fqfq9zB/VN-Grill.jpg'),
(7, 'Psycho Donuts', 'Restaurants', '2000, El Camino Real, Ste 11', 'Santa Clara', 'California', '7AM - 4 PM', 146, 3.0, '', '', 'https://i.ibb.co/7JBNQ9S/Psycho-Donuts.jpg'),
(8, 'Chipotle Mexican Grill', 'Restaurants', '1751 N 1st, Ste 40,', 'Santa Clara', 'California', '11 AM - 7 PM', 193, 2.4, '', '', 'https://i.ibb.co/3vk3Jrn/Chipotle-Mexican-Grill.jpg'),
(9, 'Imagine Beauty Center', 'Hair Salons', '1701 Lundy Avenue, North Valley', 'Santa Clara', 'California', '11 AM - 7 PM', 95, 4.0, '37.387116', '-121.887412', 'https://i.ibb.co/0FGns56/Imagine-Beauty-Center.jpg'),
(10, 'Great Clips', 'Hair Salons', '1085 E Brokaw rd, North Valley', 'Santa Clara', 'California', '10 AM - 8 PM', 149, 3.4, '37.383569', '-121.896846', 'https://i.ibb.co/Lxf8yvb/Great-Clips.jpg'),
(11, 'My Stylist Salon', 'Hair Salons', '840 Willow st, Ste a200, Willow Glen', 'Santa Clara', 'California', '10 AM - 8 PM', 887, 5.0, '37.310167', '-121.895624', 'https://i.ibb.co/bJN2GtF/My-Stylist-Salon.jpg'),
(12, 'Ulta Beauty', 'Hair Salons', '1038 E Brokaw rd, Ste 10, North Valley', 'Santa Clara', 'California', '10 AM - 8 PM', 443, 3.0, '', '', 'https://i.ibb.co/n7PntjD/Ulta-Beauty.jpg'),
(13, 'New Hair City', 'Hair Salons', '2050 Concourse Dr, North Valley', 'Santa Clara', 'California', '11 AM - 6 PM', 28, 4.5, '', '', 'https://i.ibb.co/s2cd9Kn/New-Hair-City.jpg'),
(14, 'Costco Gasoline', 'Gas Stations', '1709 Automation Parkway, NV', 'Santa Clara', 'California', '11 AM - 7 PM', 125, 4.0, '', '', ''),
(15, 'Shell', 'Gas Stations', '1601 N Capitol Avenue', 'Santa Clara', 'California', '11 AM - 7 PM', 71, 3.0, '', '', ''),
(16, 'Chevron Station', 'Gas Stations', '790 Montague Expressway', 'Santa Clara', 'California', '11 AM - 7 PM', 37, 2.0, '', '', ''),
(17, '76', 'Gas Stations', '1705 Berryessa Rd', 'Santa Clara', 'California', '11 AM - 7 PM', 21, 2.0, '', '', ''),
(18, 'Propel Fuels', 'Gas Stations', '1590 McKee Rd27', 'Santa Clara', 'California', '10 AM - 8 PM', 2, 3.0, '', '', ''),
(19, 'Walmart Supercenter', 'Department Stores_Grocery', '301 Ranch drive', 'Santa Clara', 'California', '10 AM - 8 PM', 725, 2.0, '37.431528', '-121.921189', 'https://i.ibb.co/P5pFKZX/Walmart-Supercenter.png'),
(20, 'Target', 'Department Stores_Grocery', '2155 Morrill avenue', 'Santa Clara', 'California', '10 AM - 8 PM', 509, 3.5, '37.41374', '-121.876654', 'https://i.ibb.co/XpWJyNH/Target.jpg'),
(21, 'Sprouts Farmers Market', 'Department Stores_Grocery', '1028 E Brokaw Rd', 'Santa Clara', 'California', '10 AM - 8 PM', 182, 3.8, '37.381291', '-121.898162', 'https://i.ibb.co/6t33xxp/Sprouts-Farmers-Market.jpg'),
(22, 'Safeway', 'Department Stores_Grocery', '555 E Calaveras Blvd', 'Santa Clara', 'California', '11 AM - 7 PM', 298, 2.3, '', '', 'https://i.ibb.co/qmTkQXJ/Safeway.png'),
(23, 'Whole Foods Market', 'Department Stores_Grocery', '777 The Alameda, Downtown', 'Santa Clara', 'California', '11 AM - 7 PM', 444, 4.0, '', '', 'https://i.ibb.co/yqj1vNB/Whole-Foods-Market.jpg'),
(24, 'CVS Pharmacy', 'Pharmacy', '2514 Berryessa Rd, Berryessa', 'Santa Clara', 'California', '9 AM - 9 PM', 3, 2.5, '', '', 'https://i.ibb.co/647mQk4/CVS-Pharmacy.jpg'),
(25, 'Costco Pharmacy', 'Pharmacy', '1709 Automation Parkway', 'Santa Clara', 'California', '9 AM - 9 PM', 5, 3.0, '', '', 'https://i.ibb.co/bvYkRmn/Costco-Pharmacy.jpg'),
(26, 'CVS Pharmacy', 'Pharmacy', '3081 Stevens Creek Boulevard', 'Santa Clara', 'California', '9 AM - 9 PM', 57, 2.8, '', '', ''),
(27, 'McKee Medical Pharmacy', 'Pharmacy', '2350 McKee Rd, Ste  A3, North Valley', 'Santa Clara', 'California', '9 AM - 9 PM', 15, 4.0, '', '', ''),
(28, 'Better Health Pharmacy', 'Pharmacy', '725 E SC street, Ste 202, Downtown', 'Santa Clara', 'California', '9 AM - 9 PM', 11, 5.0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'abc@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `store_id_2` (`store_id`);

--
-- Indexes for table `Stores`
--
ALTER TABLE `Stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ratings`
--
ALTER TABLE `Ratings`
  MODIFY `rating_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `Stores` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
