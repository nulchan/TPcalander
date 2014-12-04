create table users(
	id varchar(20) not null primary key,
	password varchar(20) not null
);

create table memo(
	id varchar(20) not null,
	memo varchar(255) not null
);

create table schedule(
 id varchar(20) not null,
 submit varchar(255) not null,
 start varchar(50) not null,
 end varchar(50) not null,
 start_time varchar(50) not null,
 end_time varchar(50) not null,
 color varchar(50) not null,
 content text not null
 );