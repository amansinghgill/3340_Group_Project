create database shop;
use shop;
create table Company(
	Company_ID int not null auto_increment,
	Name_of_Company varchar(255) not null,
    Company_Location varchar(255),
    Company_Manager varchar(255) not null,
    primary key (Company_ID)
);
create table Products(
	Product_ID int not null auto_increment,
	Name_of_Product varchar(255) not null,
    Product_Pricing varchar(255) not null,
    Product_Availability varchar(255),
    Year_Of_Release int,
    Company_ID int not null,
    primary key (Product_ID),
    foreign key (Company_ID) references Company(Company_ID)
);
create table Customers(
	Customer_ID int not null auto_increment,
	Name_of_Customer varchar(255) not null,
    Customer_Address varchar(255) not null,
    Customer_Phone_Number varchar(255) not null,
    Customer_Email varchar(255) not null,
    primary key (Customer_ID)
);
create table Product_Shipping(
	Shipping_ID int not null auto_increment,
	Shipping_Address varchar(255) not null,
    Shipping_Cost varchar(255) not null,
    Customer_ID int not null,
    Product_ID int not null,
    Company_ID int not null,
    Price_ID int not null,
    primary key (Shipping_ID),
    foreign key (Customer_ID) references Customers(Customer_ID),
    foreign key (Product_ID) references Products(Product_ID),
    foreign key (Company_ID) references Company(Company_ID),
    foreign key (Price_ID) references Product_Billing(Price_ID)
);
create table Product_Billing(
	Price_ID int not null auto_increment,
	Cost_of_Product_and_Shipping varchar(255) not null,
    Customer_ID int not null,
    Company_ID int not null,
    primary key (Price_ID),
    foreign key (Customer_ID) references Customers(Customer_ID),
    foreign key (Company_ID) references Company(Company_ID)
);
CREATE TABLE ImageTable
(
    Id int,
    Name varchar(50) ,
    Photo varbinary(1080) 
);
drop table ImageTable;
CREATE TABLE pictures ( 
	image_id int not null auto_increment, 
    image blob, 
    PRIMARY KEY (image_id) 
);
drop table pictures;
CREATE TABLE art ( 
	image_id int not null auto_increment, 
    image blob, 
    PRIMARY KEY (image_id) 
);
INSERT INTO art VALUES(1, LOAD_FILE('C:\Users\andre\img\1.jpg'));
INSERT INTO art VALUES(2, LOAD_FILE('C:\Users\andre\img\2.jpg'));
INSERT INTO art VALUES(3, LOAD_FILE('C:\Users\andre\img\3.jpg'));
INSERT INTO art VALUES(4, LOAD_FILE('C:\Users\andre\img\4.jpg'));
INSERT INTO art VALUES(5, LOAD_FILE('C:\Users\andre\img\5.jpg'));
INSERT INTO art VALUES(6, LOAD_FILE('C:\Users\andre\img\6.jpg'));
INSERT INTO art VALUES(7, LOAD_FILE('C:\Users\andre\img\7.jpg'));
INSERT INTO art VALUES(8, LOAD_FILE('C:\Users\andre\img\8.jpg'));
INSERT INTO art VALUES(9, LOAD_FILE('C:\Users\andre\img\9.jpg'));
INSERT INTO art VALUES(10, LOAD_FILE('C:\Users\andre\img\10.jpg'));
INSERT INTO art VALUES(11, LOAD_FILE('C:\Users\andre\img\11.jpg'));
INSERT INTO art VALUES(12, LOAD_FILE('C:\Users\andre\img\12.jpg'));
INSERT INTO art VALUES(13, LOAD_FILE('C:\Users\andre\img\13.jpg'));
INSERT INTO art VALUES(14, LOAD_FILE('C:\Users\andre\img\14.jpg'));
INSERT INTO art VALUES(15, LOAD_FILE('C:\Users\andre\img\15.jpg'));
INSERT INTO art VALUES(16, LOAD_FILE('C:\Users\andre\img\16.jpg'));
INSERT INTO art VALUES(17, LOAD_FILE('C:\Users\andre\img\17.jpg'));
INSERT INTO art VALUES(18, LOAD_FILE('C:\Users\andre\img\18.jpg'));
INSERT INTO art VALUES(19, LOAD_FILE('C:\Users\andre\img\19.jpg'));
INSERT INTO art VALUES(20, LOAD_FILE('C:\Users\andre\img\20.jpg'));
INSERT INTO art VALUES(21, LOAD_FILE('C:\Users\andre\img\21.jpg'));
INSERT INTO art VALUES(22, LOAD_FILE('C:\Users\andre\img\22.jpg'));
INSERT INTO art VALUES(23, LOAD_FILE('C:\Users\andre\img\23.jpg'));
INSERT INTO art VALUES(24, LOAD_FILE('C:\Users\andre\img\24.jpg'));
INSERT INTO art VALUES(25, LOAD_FILE('C:\Users\andre\img\25.jpg'));
INSERT INTO art VALUES(26, LOAD_FILE('C:\Users\andre\img\26.jpg'));
INSERT INTO art VALUES(27, LOAD_FILE('C:\Users\andre\img\27.jpg'));
INSERT INTO art VALUES(28, LOAD_FILE('C:\Users\andre\img\28.jpg'));
INSERT INTO art VALUES(29, LOAD_FILE('C:\Users\andre\img\29.jpg'));
INSERT INTO art VALUES(30, LOAD_FILE('C:\Users\andre\img\30.jpg'));
INSERT INTO art VALUES(31, LOAD_FILE('C:\Users\andre\img\31.jpg'));
INSERT INTO art VALUES(32, LOAD_FILE('C:\Users\andre\img\32.jpg'));
INSERT INTO art VALUES(33, LOAD_FILE('C:\Users\andre\img\33.jpg'));
INSERT INTO art VALUES(34, LOAD_FILE('C:\Users\andre\img\34.jpg'));
INSERT INTO art VALUES(35, LOAD_FILE('C:\Users\andre\img\35.jpg'));
INSERT INTO art VALUES(36, LOAD_FILE('C:\Users\andre\img\36.jpg'));
INSERT INTO art VALUES(37, LOAD_FILE('C:\Users\andre\img\37.jpg'));
INSERT INTO art VALUES(38, LOAD_FILE('C:\Users\andre\img\38.jpg'));
INSERT INTO art VALUES(39, LOAD_FILE('C:\Users\andre\img\39.jpg'));
INSERT INTO art VALUES(40, LOAD_FILE('C:\Users\andre\img\40.jpg'));
select * from art where image_id =1;
insert into company (Company_ID, Name_of_Company, Company_Location, Company_Manager)
values (1, 'Mike', 'Windsor', 'Mike Wazoski'),
	   (2, 'Artisan Grifting Company', 'Amherstberg', 'Griffin Gones'),
       (3, 'Gerbils Hobby Gallery', 'LaSalle', 'Graet Gerbil'),
       (4, 'Art Preservation Service', 'Windsor', 'John Smith');
select * from company;
alter table products

Add image_ID int not null,
Add foreign key (image_ID) references art(image_ID);
insert into products (Product_ID, Name_of_Product, Product_Pricing, Product_Availability, Year_Of_Release, Company_ID, image_ID)
values (1, 'Hair Clips', '$800', 'Available', "1989", "1", "1"),
	   (2, 'Chemical Falls', '$950', 'Available', "1972", "1", "2"),
       (3, 'Universal Record Scratch', '$20,000', 'Not Available', "1932", "1", "3"),
       (4, 'The Future is Now.', '$150', 'Available', "2008", "1", "4");
select * from products;
insert into products (Product_ID, Name_of_Product, Product_Pricing, Product_Availability, Year_Of_Release, Company_ID, image_ID)
values (5, 'The Eldest of the Rigns', '$70' , 'Availibile', '2003', '1', '5'),
	   (6, 'Frozen Pond', '$4092', 'Available', '2008', '1', '6'),
	   (7, 'Galaxies Edge', '$280', 'Available', '2007', '1', '7'),
	   (8, 'Void Bereft', '$746', 'Available', '2009', '1', '8'),
       (9, 'Landing', '$1408', 'Available', '2002', '1', '9'),
       (10, 'Wolf Moon', '$2755', 'Not Available','2002', '1', '10'),
       (11, 'Deconstructed Creeper', '$4933', 'Available','2004', '2', '11'),
       (12, 'Crystal Falls', '$750', 'Available','2012', '2', '12'),
       (13, 'Strands of Arrows', '$114', 'Available','2013', '2', '13'),
       (14, 'Life in Green', '$4196', 'Available', '2007','2', '14'),
       (15, 'Memberberries', '$4096', 'Available', '2019', '2', '15'),
       (16, 'Golden Grate Bridge', '$2939', 'Available', '2020', '2', '16'),
       (17, 'Conspiracy in Space', '$2775', 'Available', '2003', '2', '17'),
       (18, 'Purple Flower in Bloom', '$3891', 'Available', '2002', '2', '18'),
       (19, 'Trees in the Star Night Sky', '$2376', 'Not Available', '1902', '2', '19'),
       (20, 'Desert', '$1836', 'Available', '2005', '2', '20'),
       (21, 'Dysons Dream', '$1083', 'Available', '2007', '3', '21'),
       (22, 'Chemtrack Fall', '$4118', 'Available', '2008', '3', '22'),
       (23, 'Record of the Gods', '$3500', 'Available', '2009', '3', '23'),
       (24, 'Water in the Purple Light', '$3526', 'Available', '2012', '3', '24'),
       (25, 'Star Wars Pog Planet', '$605', 'Available', '2008', '3', '25'),
       (26, 'Spiderz in Space', '$2092', 'Available', '2009', '3', '26'),
       (27, 'Battle of the Space Lords', '$4222', 'Available', '2005','3', '27'),
       (28, 'Oozee', '$1696', 'Available', '2006','3', '28'),
	   (29, 'WaterJet', '$52', 'Available', '2001','3', '29'),
	   (30, 'Smiling Turtle', '$4821', 'Available', '1999', '3', '30'),
       (31, 'Dover Hills', '$2704', 'Not Available', '1981', '4', '31'),
       (32, 'Snover Hills', '$4924', 'Available', '2002', '4', '32'),
       (33, 'Conspiracy of the Mind', '$804', 'Available', '2009', '4', '33'),
       (34, 'Quarry', '$1649', 'Not Available', '2004', '4', '34'),
       (35, 'Alien Fruit', '$387', 'Available', '2020', '4', '35'),
       (36, 'Valley of Mountains', '$1854', 'Available', '2022', '4', '36'),
       (37, 'Rock Face', '$1950', 'Not Available', '2012', '4', '37'),
       (38, 'Futures City', '$4529', 'Available', '2002', '4', '38'),
       (39, 'living Space Ship', '$4679', 'Available', '2014', '4', '39'),
       (40, 'Train', '$1977', 'Not Available', '2023', '4', '40');
select * from products;
select * from company;
alter table art
Add primary key (image_ID);
use mysql;
update user
set authentication_string = password('password123')
where user = 'root' and
	  host = 'localhost';
flush privileges;
set password for 'root'@'localhost' ='password123';