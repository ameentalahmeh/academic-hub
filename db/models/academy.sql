-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 02:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

-- --------------------------------------------------------
--
-- Table structure for table `course`
--
DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
    `id` int(11) NOT NULL,
    `name` text NOT NULL,
    `summary` text NOT NULL,
    `description` text NOT NULL,
    `image` text NOT NULL,
    `price` int(11) DEFAULT NULL,
    `type` varchar(40) NOT NULL,
    `level` varchar(40) NOT NULL,
    `category` text NOT NULL,
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `teacher_id` int(11) NOT NULL,
    `learn_items` JSON DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `learning_status`
--
DROP TABLE IF EXISTS `learning_status`;

CREATE TABLE `learning_status` (
    `student_username` varchar(20) NOT NULL,
    `course_id` int(11) NOT NULL,
    `lesson_id` int(11) NOT NULL,
    `status` tinyint(1) DEFAULT NULL,
    `id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `lesson`
--
DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
    `id` int(11) NOT NULL,
    `title` text NOT NULL,
    `description` text NOT NULL,
    `video` text NOT NULL,
    `course_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `student`
--
DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
    `id` int(11) NOT NULL,
    `name` varchar(40) NOT NULL,
    `username` varchar(20) NOT NULL,
    `password` text NOT NULL,
    `recommended` TEXT DEFAULT 'Programming'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Table structure for table `teacher`
--
DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
    `id` int(11) NOT NULL,
    `name` text NOT NULL,
    `title` text NOT NULL,
    `image` text NOT NULL,
    `bio` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `course`
--
ALTER TABLE
    `course`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `course_teacher_id_fkey` (`teacher_id`);

--
-- Indexes for table `learning_status`
--
ALTER TABLE
    `learning_status`
ADD
    PRIMARY KEY (`id`),
ADD
    UNIQUE KEY `student_username` (`student_username`, `course_id`, `lesson_id`),
ADD
    KEY `learning_status_student_username_fkey` (`student_username`),
ADD
    KEY `learning_status_course_id_fkey` (`course_id`),
ADD
    KEY `learning_status_lesson_id_fkey` (`lesson_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE
    `lesson`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `lesson_course_id_fkey` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE
    `student`
ADD
    PRIMARY KEY (`id`),
ADD
    UNIQUE KEY `username` (`username`);

--
-- Indexes for table `teacher`
--
ALTER TABLE
    `teacher`
ADD
    PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE
    `course`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learning_status`
--
ALTER TABLE
    `learning_status`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE
    `lesson`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE
    `student`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE
    `teacher`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `course`
--
ALTER TABLE
    `course`
ADD
    CONSTRAINT `course_teacher_id_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `learning_status`
--
ALTER TABLE
    `learning_status`
ADD
    CONSTRAINT `learning_status_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
ADD
    CONSTRAINT `learning_status_lesson_id_fkey` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
ADD
    CONSTRAINT `learning_status_student_username_fkey` FOREIGN KEY (`student_username`) REFERENCES `student` (`username`);

--
-- Constraints for table `lesson`
--
ALTER TABLE
    `lesson`
ADD
    CONSTRAINT `lesson_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
