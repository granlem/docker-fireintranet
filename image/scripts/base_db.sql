-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Nov 04, 2018 at 11:46 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `addressid` int(11) NOT NULL,
  `streetid` int(11) NOT NULL,
  `streetnumber` varchar(10) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `name` varchar(128) COLLATE latin1_german1_ci NOT NULL,
  `zipcode` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `divisionid` int(11) NOT NULL,
  `name` varchar(128) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventRegistration`
--

CREATE TABLE `eventRegistration` (
  `memberid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `registered` tinyint(4) DEFAULT NULL,
  `assigned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventid` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `topic` text COLLATE latin1_german1_ci NOT NULL,
  `place` varchar(160) COLLATE latin1_german1_ci NOT NULL,
  `comments` text COLLATE latin1_german1_ci,
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `firewatches`
--

CREATE TABLE `firewatches` (
  `firewatchid` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `topic` text NOT NULL,
  `place` varchar(160) NOT NULL,
  `comments` text,
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `firewatchRegistration`
--

CREATE TABLE `firewatchRegistration` (
  `memberid` int(11) NOT NULL,
  `firewatchid` int(11) NOT NULL,
  `registered` tinyint(1) DEFAULT NULL,
  `assigned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incidentType`
--

CREATE TABLE `incidentType` (
  `incidenttypeid` int(11) NOT NULL,
  `name` varchar(64) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberid` int(11) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberid`, `firstname`, `lastname`, `username`, `password`, `disabled`) VALUES
(1, 'John', 'Doe', 'john.doe', '$pbkdf2-sha512$25000$xdh7r1UK4dybk1JKyZlTyg$M4H5wIM9OrHkHe/Nu9RVRTYw0njQUQOKtAjIrxW/ja/I0FYkaWeUr3DGF4h3o5wUYV0b.u1/fRvNjx9PL4kY4A', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reportCrew`
--

CREATE TABLE `reportCrew` (
  `reportid` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `scbaused` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `reportid` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `addressid` int(11) NOT NULL,
  `comments` text COLLATE latin1_german1_ci NOT NULL,
  `incidenttypeid` int(11) NOT NULL,
  `fullalarm` tinyint(1) NOT NULL DEFAULT '0',
  `personresponsibleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reportVehicles`
--

CREATE TABLE `reportVehicles` (
  `vehicleid` int(11) NOT NULL,
  `reportid` int(11) NOT NULL,
  `chiefid` int(11) NOT NULL,
  `operatorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roleAssignment`
--

CREATE TABLE `roleAssignment` (
  `roleid` varchar(32) COLLATE latin1_german1_ci NOT NULL,
  `memberid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `roleAssignment`
--

INSERT INTO `roleAssignment` (`roleid`, `memberid`) VALUES
('ADMIN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleid` varchar(32) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleid`) VALUES
('ADMIN'),
('MANAGE_EVENTS'),
('MANAGE_TRAININGS'),
('MANAGE_WATCHES'),
('UPLOAD');

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `streetid` int(11) NOT NULL,
  `zipcode` mediumint(9) NOT NULL,
  `name` varchar(128) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainingRegistration`
--

CREATE TABLE `trainingRegistration` (
  `memberid` int(11) NOT NULL,
  `trainingid` int(11) NOT NULL,
  `registered` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `trainingid` int(11) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `topic` varchar(200) NOT NULL,
  `place` varchar(80) NOT NULL,
  `comments` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicleid` int(11) NOT NULL,
  `divisionid` tinyint(4) NOT NULL,
  `type` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `description` varchar(64) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`addressid`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`zipcode`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`divisionid`);

--
-- Indexes for table `eventRegistration`
--
ALTER TABLE `eventRegistration`
  ADD PRIMARY KEY (`memberid`,`eventid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `firewatches`
--
ALTER TABLE `firewatches`
  ADD PRIMARY KEY (`firewatchid`);

--
-- Indexes for table `firewatchRegistration`
--
ALTER TABLE `firewatchRegistration`
  ADD PRIMARY KEY (`memberid`,`firewatchid`);

--
-- Indexes for table `incidentType`
--
ALTER TABLE `incidentType`
  ADD PRIMARY KEY (`incidenttypeid`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberid`);

--
-- Indexes for table `reportCrew`
--
ALTER TABLE `reportCrew`
  ADD PRIMARY KEY (`reportid`,`memberid`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`reportid`);

--
-- Indexes for table `reportVehicles`
--
ALTER TABLE `reportVehicles`
  ADD PRIMARY KEY (`vehicleid`,`reportid`);

--
-- Indexes for table `roleAssignment`
--
ALTER TABLE `roleAssignment`
  ADD PRIMARY KEY (`roleid`,`memberid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`streetid`);

--
-- Indexes for table `trainingRegistration`
--
ALTER TABLE `trainingRegistration`
  ADD PRIMARY KEY (`memberid`,`trainingid`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`trainingid`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `firewatches`
--
ALTER TABLE `firewatches`
  MODIFY `firewatchid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `incidentType`
--
ALTER TABLE `incidentType`
  MODIFY `incidenttypeid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `memberid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `reportid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `streetid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=858;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `trainingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
