-- Delete triggers
use 2a_admin_triggerDB;

drop trigger if exists users_before_insert;
drop trigger if exists users_after_insert;
drop trigger if exists users_after_update;
drop trigger if exists users_after_delete;