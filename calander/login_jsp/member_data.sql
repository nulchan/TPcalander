create table users(
	id varchar(20) not null primary key,
	password varchar(20) not null
);
create table memo(
	id varchar(20) not null primary key,
	memo varchar(255) not null
);