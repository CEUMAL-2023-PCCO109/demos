USE 2a_admin_05022024DB;

-- MySQL NOT NULL constraints
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

DESC tasks;

INSERT INTO tasks(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', '2017-02-01','2017-02-02'),
      ('Check and update NOT NULL constraint to your database', '2017-02-01',NULL);
      
SELECT * FROM tasks 
WHERE end_date IS NULL;

UPDATE tasks 
SET 
    end_date = start_date + 7
WHERE
    end_date IS NULL;
    
SELECT * FROM tasks;

-- Adding a NOT NULL constraint to an existing column
ALTER TABLE tasks 
CHANGE 
    end_date 
    end_date DATE NOT NULL;
    
 DESC tasks;
 
-- Removing a NOT NULL constraint
ALTER TABLE tasks 
MODIFY end_date DATE;

DESC tasks;