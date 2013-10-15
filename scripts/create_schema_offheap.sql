create hdfsstore sta_datastore 
namenode 'hdfs://<hostname>:9000' 
homedir 'sta_tables' 
batchsize 100 
batchtimeinterval 1000 
queuepersistent true; 

create table Customer (username varchar(255) not null, name varchar(255), password varchar(255), primary key (username));

create table Hotel (id bigint generated by default as identity (start with 1), address varchar(255), city varchar(255), country varchar(255), name varchar(255), price numeric(6,2), state varchar(255), zip varchar(255), primary key (id));

CREATE TABLE Booking (id bigint not null, beds int not null, checkinDate date not null, checkoutDate date not null, creditCard varchar(255) not null, creditCardExpiryMonth int not null, creditCardExpiryYear int not null, creditCardName varchar(255) not null, smoking smallint, hotel_id bigint, user_username varchar(255), primary key (id))  PARTITION BY PRIMARY KEY PERSISTENT HDFSSTORE (STA_DATASTORE) OFFHEAP;

create table hibernate_sequences (sequence_name varchar(255), sequence_next_hi_value integer);

alter table Booking add constraint FK6713A039BF91BB8D foreign key (hotel_id) references Hotel;

alter table Booking add constraint FK6713A03975CC21E2 foreign key (user_username) references Customer;

