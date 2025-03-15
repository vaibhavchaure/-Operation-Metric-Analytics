create database project;
show databases;
use project;

#TABLE 1 : USERS
# user_id	created_at	company_id	language	activated_at	state

create table users (
user_id  int,
created_at varchar(60),
company_id int,
language varchar(15),
activated_at varchar(60),
state varchar(60)
);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv"
into table users
fields terminated by','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from users;

alter table users add column temp_created_at datetime;
SET SQL_SAFE_UPDATES = 0;
UPDATE users SET temp_created_at = STR_TO_DATE(created_at, '%d-%m-%Y %H:%i');
alter table users Drop column created_at;
alter table users change column temp_created_at created_at DATETIME;

#TABLE 2 : EVENTS
# user_id	occurred_at	event_type	event_name	location	device	user_type

create table events (
user_id int,
occurred_at varchar(50),
event_type varchar(50),
event_name varchar(50),
location varchar(50),
device varchar(50),
user_type int
);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
into table events
fields terminated by','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

desc events;
select * from events;

alter table events add column temp_occurred_at Datetime;

UPDATE events SET temp_occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');

alter table events Drop column occurred_at;
alter table events change column temp_occurred_at occurred_at DATETIME;


# TABLE 3 : EMAIL_EVENTS
# user_id	occurred_at	action	user_type

create table email_events (
user_id int,
occurred_at varchar(100),
action varchar(50),
user_type int
);


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
into table email_events
fields terminated by','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from email_events;

alter table email_events add column temp_occurred_at datetime;
UPDATE email_events SET temp_occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
alter table email_events Drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at DATETIME;

