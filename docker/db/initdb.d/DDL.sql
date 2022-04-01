create database if not exists our_meeting;

use our_meeting;

create table if not exists test_table (
    id int primary key auto_increment,
    name VARCHAR(100) not null,
    reg_dt date
);