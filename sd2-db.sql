-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 11, 2024 at 05:28 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd2-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `ReviewID` int NOT NULL,
  `ServiceProviderID` int DEFAULT NULL,
  `ReviewerName` varchar(100) NOT NULL,
  `Rating` decimal(2,1) NOT NULL,
  `Comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`ReviewID`, `ServiceProviderID`, `ReviewerName`, `Rating`, `Comment`) VALUES
(1, 1, 'GardenLover123', 4.5, 'Green Thumb Gardeners did an amazing job transforming my backyard!'),
(2, 1, 'EcoFriendlyGuy', 3.5, 'Overall good service, but there were some minor issues with communication.'),
(3, 2, 'CleanFreak', 5.0, 'Eco Cleaners exceeded my expectations, and I love that they use eco-friendly products!'),
(4, 2, 'NatureLover', 4.0, 'Great job cleaning, and the house smells wonderful without harsh chemicals.'),
(5, 3, 'GreenGuru', 4.5, 'Fresh Garden Care pays attention to every detail, and my garden looks fantastic.'),
(6, 3, 'SustainableLiving', 3.0, 'Service was good, but there were some delays in scheduling.'),
(7, 4, 'Environmentalist', 4.0, 'Green Sweep Cleaners did a thorough job without harming the environment.'),
(8, 4, 'EcoMama', 3.5, 'Overall satisfied, but there were a few spots missed.'),
(9, 5, 'GardenEnthusiast', 4.5, 'Green Oasis Gardens transformed my yard into a green paradise!'),
(10, 5, 'GreenLivingAdvocate', 4.0, 'Excellent gardening services, very pleased with the results.');

-- --------------------------------------------------------

--
-- Table structure for table `ServiceProviders`
--

CREATE TABLE `ServiceProviders` (
  `ServiceProviderID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Description` text,
  `Location` varchar(100) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ServiceProviders`
--

INSERT INTO `ServiceProviders` (`ServiceProviderID`, `Name`, `Category`, `Description`, `Location`, `Contact`) VALUES
(1, 'aravind', 'Gardening', 'Professional gardening services for homes and businesses.', 'Hayes and Harlington , uk', '044-1234'),
(2, 'william', 'Cleaning', 'Eco-friendly cleaning solutions for a healthier home environment.', 'Hammersmith', '044-5678'),
(3, 'maxweel', 'Gardening', 'Offering personalized garden maintenance and design services.', 'Richmond,uk', '044-9012'),
(4, 'louis', 'Cleaning', 'Thorough cleaning services using environmentally friendly products.', 'Hounslow,UK', '+44-123456789'),
(5, 'Antonio', 'Gardening', 'Creating sustainable and beautiful outdoor spaces with organic practices.', 'Action town,uk', '+44-07890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ServiceProviderID` (`ServiceProviderID`);

--
-- Indexes for table `ServiceProviders`
--
ALTER TABLE `ServiceProviders`
  ADD PRIMARY KEY (`ServiceProviderID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ServiceProviderID`) REFERENCES `ServiceProviders` (`ServiceProviderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
