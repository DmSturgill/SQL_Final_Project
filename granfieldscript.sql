DROP DATABASE IF EXISTS GranfieldCollege;
#create database and name
CREATE DATABASE GranfieldCollege;
#specify usage of database
USE GranfieldCollege;

#create each table with proper values

CREATE TABLE Software
(
software_id		smallint(8) unsigned	Not null auto_increment primary key,
license_type	varchar(12) not null,
version			varchar(10) not null,
company			char(12) not null

);

CREATE TABLE SoftwareLink
(
CCSnum smallint(6) unsigned not null auto_increment primary key,
software_id smallint(8) unsigned not null 
);

CREATE TABLE Licensing 
(
license_type varchar(20)  primary key,
startDate 	timestamp not null,
endDate     timestamp not null,
price		decimal not null,
priceUnit	varchar(6) not null,
terms		varchar(150)
);

CREATE TABLE Employees 
(
CCSnum smallint(8) unsigned auto_increment  primary key,
location varchar(8) not null,
software_id varchar(8)  not null,
firstname char(15) not null,
lastname char(15) not null,
machine_id varchar(10) not null,
request_id smallint(8) unsigned not null
);

CREATE TABLE RequestLink
(
request_id smallint(8) unsigned auto_increment primary key,
machine_id varchar(10) not null
);

CREATE TABLE Requests
(
request_id smallint(8) unsigned auto_increment primary key,
CCSnum smallint(8) unsigned not null,
requestDate timestamp not null,
responsedate timestamp not null,
software_id varchar(8) not null,
firstName char(150) not null,
lastName char(15) not null,
machine_id varchar(10) 
);

CREATE TABLE MachineLink
(
CCSnum smallint(8) unsigned not null auto_increment primary key,
machine_id varchar(10),
software_id smallint(8) unsigned not null 
);

CREATE TABLE Machines
(
machine_id varchar(10)  primary key,
machine_status char(10) not null,
retireDate timestamp,
software_id varchar(8) not null,
location varchar(8), 
CCSnum smallint(8)
);

#populate the tables with sample data#

INSERT INTO Software VALUES ('1234','lic123','v123','companyX');
INSERT INTO softwarelink VALUES ('5420','1234');
INSERT INTO requests VALUES('1','5420','2021-01-01','2021-01-05','1234','Mike','Sturgill','k555-01');
INSERT INTO requestlink VALUES ('1','k555-01');
INSERT INTO machines VALUES ('k555','Active',null,'1234','N216','5420');
INSERT INTO machinelink VALUES ('5420','k555-01','1234');
INSERT INTO licensing VALUES ('SampleLicense','2021-01-01','2025-01-01','2500.65','$','Use available on one machine at a time.');
INSERT INTO employees VALUES ('5420','N216','1234','Mike','Sturgill','k555-01','1');
