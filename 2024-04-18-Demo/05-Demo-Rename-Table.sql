use 2a_admin_sampledb;

-- Rename table can be done to muliple tables.
RENAME TABLE `2a_admin_sampledb`.`students` TO `2a_admin_sampledb`.`magaaral`, 
`2a_admin_sampledb`.`courses` TO `2a_admin_sampledb`.`kurso`;

SELECT *
FROM `2a_admin_sampledb`.`magaaral` 
JOIN `2a_admin_sampledb`.`kurso` ON
magaaral.course_id = kurso.id ;

-- Using alter table to rename table one by one.
ALTER TABLE `2a_admin_sampledb`.`magaaral` RENAME TO `2a_admin_sampledb`.`students`;
ALTER TABLE `2a_admin_sampledb`.`kurso` RENAME TO `2a_admin_sampledb`.`courses`;

SELECT *
FROM `2a_admin_sampledb`.`students` 
JOIN `2a_admin_sampledb`.`courses` ON
students.course_id = courses.id ;