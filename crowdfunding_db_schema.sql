/*

This script creates a database with four tables for use in a fictional Crowdfunding exercise

'not null' constraints are not applied on fields because data elements may not be known
at the time of record creation. By default, PK is nt null.

The 'category_id' is set to 5 variable characters to allow for growth, in the evemt another recrd is added. There are currently 9 values, so adding the additional length of one character allows growth to 99 rows total before an alter table command would be required.

author: Adrian Santos
updated: 2013-12-02

*/

--------------------------------------

/*  Create database  */

--------------------------------------


create database crowdfunding_db
with
owner = postgres
encoding = 'UTF8'
lc_collate = 'C'
lc_ctype = 'C'
tablespace = pg_default
connection limit = -1
is_template = false
;

--------------------------------------

/*  Create tables  */

--------------------------------------


create table contacts (
  contact_id char(4) primary key
, first_name varchar(256)
, last_name varchar(256)
, email varchar(256)
);


create table category (
  category_id varchar(5) primary key
, category varchar(256)
);


create table subcategory (
  subcategory_id varchar(8) primary key
, subcategory varchar(256)
);


create table campaign (
  cf_id varchar(4) primary key
, contact_id char(4)
, company_name varchar(256)
, description varchar(256)
, goal float
, pledged float
, outcome varchar(10)
, backers_count int
, country char(2)
, currency char(3)
, launch_date date
, end_date date
, category_id varchar(5)
, subcategory_id varchar(8)
, foreign key (contact_id) references contacts (contact_id)
, foreign key (category_id) references category (category_id)
, foreign key (subcategory_id) references subcategory (subcategory_id)
);