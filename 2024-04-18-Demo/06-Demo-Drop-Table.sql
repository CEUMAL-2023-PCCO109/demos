use 2a_admin_sampledb;

SELECT * FROM `2a_admin_sampledb`.`students_clone`;

-- Insert sample records to copied table
INSERT INTO `2a_admin_sampledb`.`students_clone` (first_name, last_name, email, year_level, birthdate)
VALUES 
('Tony', 'Stark', 'tony.stark@email.com', 2, '1990-01-01'),
('Steve', 'Rogers', 'steve.rogers@email.com', 2, '1990-02-01'),
('Bruce', 'Banner', 'bruce.banner@email.com', 2, '1990-03-01'),
('Natasha', 'Romanoff', 'natasha.romanoff@email.com', 2, '1990-04-01'),
('Thor', 'Odinson', 'thor.odinson@email.com', 2, '1990-05-01'),
('Clint', 'Barton', 'clint.barton@email.com', 2, '1990-06-01');

SELECT * FROM `2a_admin_sampledb`.`students_clone`;

-- Delete records from `students_clone`
DELETE FROM `2a_admin_sampledb`.`students_clone`;
SELECT * FROM `2a_admin_sampledb`.`students_clone`;

-- Truncate Table
TRUNCATE `2a_admin_sampledb`.`students_clone`;
SELECT * FROM `2a_admin_sampledb`.`students_clone`;

-- Drop Table without IF EXISTS
-- This will prompt an error since `courses_copy` does not exists;
DROP TABLE `2a_admin_sampledb`.`courses_copy`, `2a_admin_sampledb`.`students_copy`, `2a_admin_sampledb`.`students_clone`;

-- Drop Table with IF EXISTS
-- This will prompt a warning since `courses_copy` but will delete `students_copy` and `students_clone` since that table exists;
DROP TABLE IF EXISTS `2a_admin_sampledb`.`courses_copy`, `2a_admin_sampledb`.`students_copy`, `2a_admin_sampledb`.`students_clone`;

-- Drop Table with IF EXISTS
-- Successful delete of the tables.
DROP TABLE IF EXISTS `2a_admin_sampledb`.`courses`, `2a_admin_sampledb`.`students`;