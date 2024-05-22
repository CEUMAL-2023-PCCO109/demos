-- Show Triggers
use 2a_admin_triggerDB;

-- get all the triggers.
show triggers;

-- get all triggers in the database.
show triggers from 2a_admin_triggerdb;

-- get all triggers associated with a table.
show triggers where event = 'UPDATE';