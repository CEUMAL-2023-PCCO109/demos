use demo_dml;

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT
);

INSERT INTO tasks(title, priority) 
VALUES('Learn MySQL INSERT Statement', 1);

SELECT * FROM tasks;

-- using DEFAULT
INSERT INTO tasks(title, priority) 
VALUES('Understanding DEFAULT keyword', DEFAULT);

SELECT * FROM tasks;

-- Inserting Dates
INSERT INTO tasks(title, start_date, due_date) 
VALUES ('Insert date into table', '2024-04-01', '2024-04-01');

SELECT * FROM tasks;

INSERT INTO tasks(title, start_date, due_date) 
VALUES 
  (
    'Use current date for the task', 
    CURRENT_DATE(), 
    CURRENT_DATE()
  );
  
-- Inserting Multiple Rows
INSERT INTO tasks(title, priority)
VALUES
	('My first task', 1),
	('It is the second task',2),
	('This is the third task of the week',3);
  
SELECT * FROM tasks;
