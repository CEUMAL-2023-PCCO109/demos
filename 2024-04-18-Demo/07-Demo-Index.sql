use 2a_admin_sampledb;

-- Create index on fields that is usually used as where filter.
CREATE INDEX `students_birthdate_idx` 
ON  `2a_admin_sampledb`.`students` (birthdate);

SELECT * FROM `2a_admin_sampledb`.`students` WHERE birthdate = '1990-06-01';

-- Create index on fields that is used as foreign keys.
CREATE INDEX `courses_ibfk_id_idx` 
ON  `2a_admin_sampledb`.`students` (course_id);

SELECT *
FROM `2a_admin_sampledb`.`students` 
JOIN `2a_admin_sampledb`.`courses` ON
students.course_id = courses.id ;

-- Dropping an index
DROP INDEX `students_birthdate_idx` 
ON `2a_admin_sampledb`.`students`;