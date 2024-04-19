-- Display all available character set and default collation.
SHOW CHARACTER SET;

-- Display all available character set and default collation using LIKE filter.
SHOW CHARACTER SET LIKE 'utf%';

-- Display all available collation for character set.
SHOW COLLATION WHERE Charset = 'utf8mb4';

-- Create a database
-- Default characterset = 'utf8mb4' and collation = 'utf8mb4_0900_ai_ci'
CREATE DATABASE IF NOT EXISTS 2a_admin_sampledb_1;

-- Create a database with defined charset and collation
-- If CHARACTER SET is the only defined, it will use the default collation of that character set
-- COLLATE = 'utf16_general_ci' is the default for characterset 'utf16'
CREATE DATABASE IF NOT EXISTS 2a_admin_sampledb_2
CHARACTER SET = 'utf16';

-- If COLLATE is the only defined, it will associated character set
-- CHARACTER SET = 'armscii8' is the character set associated to COLLATE = 'armscii8_general_ci'
CREATE DATABASE IF NOT EXISTS 2a_admin_sampledb_3
COLLATE = 'armscii8_general_ci';

-- Alter a database
-- Will change the charset associated to 2a_admin_sampledb_1 from 'utf8mb4' to 'utf16'
ALTER DATABASE 2a_admin_sampledb_1
CHARACTER SET = 'utf16';

-- Dropping the database
-- With the IF EXISTS keyword, if database does not exists script below continue to execute. 
DROP DATABASE IF EXISTS 2a_admin_sampledb_1;

-- If database does not exists and being dropped again, script below will throw an error. 
DROP DATABASE 2a_admin_sampledb_1;
