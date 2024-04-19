use 2a_admin_sampledb;

-- Create table with definition
CREATE TABLE IF NOT EXISTS `2a_admin_sampledb`.`courses` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `course` VARCHAR(45) NOT NULL,
    `academic_years` INT NULL,
    PRIMARY KEY (`id`)
);
  
-- Insert sample records to table
INSERT INTO `2a_admin_sampledb`.`courses` (course, academic_years)
VALUES 
('Information Technology', 4),
('Computer Science', 4),
('Computer Engineering', 5); 

-- Add new columns to students table.
ALTER TABLE `2a_admin_sampledb`.`students` 
ADD COLUMN `course_id` INT NULL AFTER `birthdate`;

-- Make the added column 'course_id' as foreign key to courses table.
ALTER TABLE `2a_admin_sampledb`.`students` 
ADD CONSTRAINT `courses_ibfk_id`
  FOREIGN KEY (`course_id`)
  REFERENCES `2a_admin_sampledb`.`courses` (`id`);

-- Update records to students table by referencing their associated course
UPDATE `2a_admin_sampledb`.`students`
SET course_id = 1 WHERE id IN (1, 2);

UPDATE `2a_admin_sampledb`.`students`
SET course_id = 2 WHERE id IN (3, 4);

UPDATE `2a_admin_sampledb`.`students`
SET course_id = 3 WHERE id IN (5, 6);

SELECT *
FROM `2a_admin_sampledb`.`students` 
JOIN `2a_admin_sampledb`.`courses` ON
students.course_id = courses.id ;

-- Rename column in a table and add new column
ALTER TABLE `2a_admin_sampledb`.`courses` 
RENAME COLUMN course TO program;

SELECT *
FROM `2a_admin_sampledb`.`students` 
JOIN `2a_admin_sampledb`.`courses` ON
students.course_id = courses.id ;

-- Dropping a table clumn
ALTER TABLE `2a_admin_sampledb`.`courses`
DROP COLUMN academic_years;

SELECT *
FROM `2a_admin_sampledb`.`students` 
JOIN `2a_admin_sampledb`.`courses` ON
students.course_id = courses.id ;

