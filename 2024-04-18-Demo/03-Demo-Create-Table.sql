-- Create Database
CREATE DATABASE IF NOT EXISTS 2a_admin_sampledb;

-- Create table with table definitions
CREATE TABLE IF NOT EXISTS `2a_admin_sampledb`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `year_level` INT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`id`));
  
-- Insert sample records to table
INSERT INTO `2a_admin_sampledb`.`students` (first_name, last_name, email, year_level, birthdate)
VALUES 
('Tony', 'Stark', 'tony.stark@email.com', 2, '1990-01-01'),
('Steve', 'Rogers', 'steve.rogers@email.com', 2, '1990-02-01'),
('Bruce', 'Banner', 'bruce.banner@email.com', 2, '1990-03-01'),
('Natasha', 'Romanoff', 'natasha.romanoff@email.com', 2, '1990-04-01'),
('Thor', 'Odinson', 'thor.odinson@email.com', 2, '1990-05-01'),
('Clint', 'Barton', 'clint.barton@email.com', 2, '1990-06-01');
  
-- Create table like existing table (Table Clone)
-- Will only clone table stucture of referenced table
CREATE TABLE IF NOT EXISTS `2a_admin_sampledb`.`students_clone`
LIKE `2a_admin_sampledb`.`students`;

SELECT * FROM `2a_admin_sampledb`.`students_clone`;
SELECT * FROM `2a_admin_sampledb`.`students`;

-- Create table (Table Copy)
-- Will copy table structure and data for referenced table
CREATE TABLE IF NOT EXISTS `2a_admin_sampledb`.`students_copy`
SELECT * FROM `2a_admin_sampledb`.`students`;

SELECT * FROM `2a_admin_sampledb`.`students_copy`;
SELECT * FROM `2a_admin_sampledb`.`students`;

-- Temporary table (Table Copy)
-- Will copy table structure and data for referenced table into a TEMPORARY TABLE
CREATE TEMPORARY TABLE IF NOT EXISTS `2a_admin_sampledb`.`students_temp`
SELECT * FROM `2a_admin_sampledb`.`students`;

SELECT * FROM `2a_admin_sampledb`.`students_temp`;
SELECT * FROM `2a_admin_sampledb`.`students`;