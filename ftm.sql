create database ftm;
use ftm;
create table passenger(
id int primary key auto_increment,
uname varchar(50) not null unique,
name varchar(50) not null,
password varchar(50) not null,
email varchar(50) not null unique,
address varchar(200) not null,
gender int not null check(gender = 0 or gender = 1),
Pno char(10) not null unique,
dob date not null);

create table flight(
flno int primary key,
flname varchar(50) not null,
fldesc varchar(200),
flcap int not null
);

create table flight_schedule(
id int primary key auto_increment,
flfrom varchar(30) not null,
flto varchar(50) not null,
fldate date not null,
fltime time not null,
cost int not null default 0,
flno int,
constraint FK_flight_flightSchedule foreign key
(flno) references flight(flno) on delete cascade
);

create table booked_ticket(
tno int primary key,
tdate date not null,
fldate date not null,
flfrom varchar(50) not null,
flto varchar(50) not null,
fltime time not null,
btime time not null,
flseat int not null,
flno int,
pid int,
constraint FK_flight_bookedTicket foreign key
(flno) references flight(flno),
constraint FK_passenger_bookedTicket foreign key
(pid) references passenger(id)
);



