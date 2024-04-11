use demo_dml;

-- DELETE JOIN Demo

DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES (1),(2),(3),(4);

INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

-- DELETE JOIN (Remove records from T1 and T2 that matches the condition)
DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;
 
-- Verify DELETE JOIN (Expected, id 1 is removed from both t1 & t2)
SELECT * FROM t1;
SELECT * FROM t2;

-- DELETE LEFT JOIN (Remove records from T1 that does not have reference in t2)
DELETE t1 FROM t1
        LEFT JOIN
    t2 ON t2.ref = t1.id  
WHERE
    t2.ref IS NULL;

-- Verify DELETE LEFT JOIN (Expected, id 4 will be removed from t1)
SELECT * FROM t1;
SELECT * FROM t2;