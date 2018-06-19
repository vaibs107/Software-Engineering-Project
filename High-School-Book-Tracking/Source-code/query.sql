create database highSchoolLibrary;

show databases;

use highSchoolLibrary;

create table faculty
(
ffname varchar(25),
flname varchar(25),
femail varchar(30),
fcontact varchar(15),
fuserid varchar(15),
fpwd varchar(15),
fdept varchar(35),
faddress varchar(50),
primary key (fuserid)
);


create table student
(
sfname varchar(25),
slname varchar(25),
semail varchar(30),
suserid varchar(15),
spwd varchar(15),
sdept varchar(35),
primary key (suserid)
);

create table parent
(
pfname varchar(25),
plname varchar(25),
pemail varchar(30),
pcontact varchar(15),
phomeaddress varchar(50),
pstudentuserid varchar(15),
puserid varchar(15),
ppwd varchar(15),
primary key (puserid),
foreign key (pstudentuserid) references student (suserid) on update cascade on delete cascade
);

create table books
(
bookId varchar(20),
bookIsbn varchar(35),
bookTitle varchar(40),
bookAuthor varchar(40),
bookPublisher varchar(35),
bookEdition varchar(5),
bookPrice varchar(5),
bookImage varchar(20),
bookCount int(5)
);

create table checkout
(
checkoutId int(5),
suserid varchar(15),
bookId varchar(20),
primary key (checkoutId)
);



alter table books modify column bookImage varchar(100);
alter table books add column bookCatergory varchar(25);
create table allUsers
(
userid varchar(15),
pwd varchar(15),
role varchar(15)
);

show tables;
desc parent;
desc student;
desc faculty;
desc allUsers;
desc books;
desc checkout;

select * from student;
select * from parent;
select * from faculty;
select * from allUsers;
select * from books;
select * from checkout;

ALTER TABLE allusers
ADD CONSTRAINT PK_userid PRIMARY KEY (userid);

ALTER TABLE checkout
ADD COLUMN userid varchar(15);

ALTER TABLE checkout
ADD CONSTRAINT FK_userid
FOREIGN KEY (userid) REFERENCES allusers(userid);

ALTER TABLE checkout
ADD CONSTRAINT FK_bookId
FOREIGN KEY (bookId) REFERENCES books(bookId);

ALTER TABLE checkout
DROP FOREIGN KEY FK_suserid;