-- Create Triggers
create database if not exists 2a_admin_triggerDB;

use 2a_admin_triggerDB;

-- Create database tables
drop table if exists users;
create table if not exists users (
	id int primary key auto_increment,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(50),
    contact_number varchar(12),
    salutation varchar(5),
    gender varchar(2)
);

drop table if exists users_change;
create table if not exists users_change (
	id int primary key auto_increment,
    user_id int,
    change_type varchar(50) not null,
    message varchar(150) not null,
    change_timestamp timestamp default current_timestamp
);

-- Create BEFORE INSERT trigger
delimiter $$
create trigger users_before_insert
before insert 
on users
for each row
begin
	if new.gender = 'M' then
		SET new.salutation = "Mr.";
    else 
		SET new.salutation = "Ms.";
	END if;
end;
$$
delimiter ;

-- Create AFTER INSERT trigger
delimiter $$
create trigger users_after_insert
after insert 
on users
for each row
begin
	insert into users_change (user_id, change_type, message)
    values (new.id, 'INSERT', concat('id: ' , new.id , ' first_name: ' , new.first_name
    , ' last_name: ' , new.last_name
    , ' email: ' , new.email
    , ' contact_number: ' , new.contact_number
    , ' salutation: ' , new.salutation
    , ' gender: ' , new.gender));
end;
$$
delimiter ;

-- Create AFTER UPDATE trigger
delimiter $$
create trigger users_after_update
after update 
on users
for each row
begin
	if old.first_name != new.first_name then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed first_name from: ' , old.first_name , ' to: ' , new.first_name));
    end if;
    
    if old.last_name != new.last_name then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed last_name from: ' , old.last_name , ' to: ' , new.last_name));
    end if;
    
    if old.email != new.email then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed email from: ' , old.email , ' to: ' , new.email));
    end if;
    
    if old.contact_number != new.contact_number then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed contact_number from: ' , old.contact_number , ' to: ' , new.contact_number));
    end if;
    
    if old.salutation != new.salutation then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed salutation from: ' , old.salutation , ' to: ' , new.salutation));
    end if;
    
     if old.gender != new.gender then
		insert into users_change (user_id, change_type, message)
		values (new.id, 'UPDATE', concat('Changed gender from: ' , old.salutation , ' to: ' , new.salutation));
    end if;
end;
$$
delimiter ;

-- Create AFTER DELETE trigger
delimiter $$
create trigger users_after_delete
after delete 
on users
for each row
begin
	insert into users_change (user_id, change_type, message)
    values (old.id, 'DELETE', concat('user.id: ' , old.id , ' has been deleted'));
end;
$$
delimiter ;
