-- Invoke Triggers
use 2a_admin_triggerDB;

select * from users;
select * from users_change;

-- Insert Records
insert into users (last_name, first_name, email, contact_number, gender)
values ('Stark', 'Tony', 'tstark@avenger.com', '09171111111', 'M');

insert into users (last_name, first_name, email, contact_number, gender)
values ('Romanoff', 'Natasha', 'nromanoff@avenger.com', '09172222222', 'F');

insert into users (last_name, first_name, email, contact_number, gender)
values ('Banner', 'Bruce', 'bbanner@avenger.com', '09173333333', 'M');

-- Update Records
update users set first_name = 'Steve', last_name = 'Rogers', email = 'srogers@avenger.com', contact_number = '09174444444'
where id = 1;

update users set email = 'steve.rogers@avenger.com'
where id = 1;

-- Delete Records
delete from users where id = 1;
delete from users;

truncate table users; -- Trigger should not work

-- reset
truncate table users_change;
alter table users auto_increment = 1;
