-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2020 at 06:40 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swachh-bharat-mission`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `SerialNumber` int(11) NOT NULL,
  `EventName` varchar(50) NOT NULL,
  `EventDate` varchar(25) NOT NULL,
  `Tagline` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `EventNumber` int(11) NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`SerialNumber`, `EventName`, `EventDate`, `Tagline`, `Description`, `EventNumber`, `slug`) VALUES
(1, 'Cleanliness Drive in Raman Hostel', '27 January 2019', 'Clean Hostel, Green Hostel', 'The campaign with participation of hostel boys, hostel warden and co-workers,came with a motive to clean the hostel and surroundings of the hostel.The volunteers spread the message to not only clean themselves but the area where they are living in.The main motive is to aware the girls about how they can maintain a good hygienic level in their hostels,  and how they can keep themselves away from many skin or internal diseases. The students also helped in cleaning the kitchen area and the dining area. This make a huge contribution in cleanliness drive successful. The event was co-ordinated by Dr. Jawahar Bansal (SAL sub-committee member) and Dr. Shetty Sindhu (NSS Coordinator).', 1, 'first-event'),
(2, 'Swachhta Abhiyan', '31 January 2019', 'Jaago Bharat Jaago', 'Prime Minister Narendra Modi on Saturday launched a week-long campaign to free India of garbage. The campaign will continue till August 15. Each day will have a special swachhata initiatives in urban and rural India. He also stressed that Swachh Bharat Abhiyan has been a great support during fight against coronavirus.\r\n\r\nNarendra Modi on Saturday inaugurated Rashtriya Swachhata Kendra, an interactive centre on Swachh Bharat Mission at at Raj Ghat, the samadhi of Mahatma Gandhi. The centre will be open to the public from August 9 following the guidelines for social distancing and hygiene. \"Rashtriya Swachhata Kendra is a tribute to Mahatma Gandhi\'s efforts towards cleanliness,\" he added. Union minister Gajendra Singh Shekhavat and Rattan Lal Kataria, were present on the occasion.\r\n\r\nThe first virtual tour of Rashtriya Swachhata Kendra will be organised on August 13 with Gajendra Singh Shekhawat.', 2, 'second-event'),
(3, 'Cleaning Day at Girls hostel', '3 February 2019', 'Let\'s extend our efforts for cleanliness', 'Aim of the event:\r\n\r\nThe Primary objective of the event was to cognize everyone about cleanliness,hygiene as well as to conduct a cleanliness campaign in and around the college hostel.\r\n\r\nAbout the event:\r\n\r\nThe campaign with participation of hostel girls, hostel warden and co-workers,came with a motive to clean the hostel and surroundings of the hostel.The volunteers spread the message to not only clean themselves but the area where they are living in.The main motive is to aware the girls about how they can maintain a good hygienic level in their hostels, from proper disposal of the sanitary pads, and how they can keep themselves away from many skin or internal diseases. The students also helped in cleaningthe kitchen area and the dining area. This make a huge contribution in cleanliness drive successful. The event was co-ordinated by Dr. Jahanvi Bansal (SAL sub-committee member) and Dr. Shilpa Sindhu (NSS Coordinator).', 3, 'third-event'),
(4, 'Slum Cleaning Help', '15 January 2019', 'Clean every corner', 'sxas', 4, 'fourth-event'),
(5, 'Slum Cleaning Help Season 2', '20 February 2019', 'Clean every corner', 'evces', 5, 'fifth-event');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `SerialNumber` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Feedback` text NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`SerialNumber`, `Name`, `Email`, `Feedback`, `Date`) VALUES
(1, 'Arjun', 'arjun@gmail.com', 'Very Nice Work!! Keep it up!!', '0000-00-00 00:00:00'),
(2, 'Arjun Singh', 'arjun.singh981212@gmail.com', 'acasc', '2020-08-12 20:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `SerialNumber` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Age` int(11) NOT NULL,
  `Event` text NOT NULL,
  `EventNumber` int(11) NOT NULL,
  `Duty` varchar(25) NOT NULL,
  `RegistrationDate` varchar(25) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`SerialNumber`, `Name`, `Age`, `Event`, `EventNumber`, `Duty`, `RegistrationDate`, `PhoneNumber`) VALUES
(1, 'Arjun', 20, 'Cleanliness Drive in Raman Hostel', 1, 'Volunteer', '30 December 2018', '8419081500'),
(2, 'Arpit', 21, 'Swachhta Abhiyan', 2, 'Coordinator', '12 Novemer 2019', '8456971525'),
(3, 'Vanshaj', 25, 'Cleanliness Drive in Raman Hostel', 1, 'Senior manager', '22 November 2018', '8965214587'),
(4, 'Rehkha', 32, 'Cleaning Day at Girls hostel', 3, 'Organiser', '12 October 2019', '8745652123'),
(5, 'Akash', 19, 'Swachhta Abhiyan', 2, 'Volunteer', '21 january 2019', '8974562154'),
(6, 'Sweta', 33, 'Cleaning Day at Girls hostel', 3, 'Manager', '20 December 2019', '8978458456'),
(7, 'Chandrkant', 20, 'Cleanliness Drive in Raman Hostel', 1, 'Volunteer', '20 February 2019', '8456213245'),
(8, 'Chhavi', 18, 'Cleaning Day at Girls hostel', 3, 'Volunteer', '20 January 2019', '8745469548'),
(9, 'Raghav', 25, 'Slum Cleaning Help', 4, 'Student Volunteer', '2020-08-12 21:54:06.14100', '8974584512');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`SerialNumber`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`SerialNumber`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`SerialNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `SerialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `SerialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `SerialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
