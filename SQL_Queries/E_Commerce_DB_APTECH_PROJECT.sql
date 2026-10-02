CREATE DATABASE E_Commerce_DB;
USE E_Commerce_DB;

-- 1.Categories
CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY AUTO_INCREMENT , -- primary key
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);

-- 2.Customers      
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL 
);

-- 3.Product
CREATE TABLE Product(
		ProductID INT PRIMARY KEY AUTO_INCREMENT, -- primary key	
        Name VARCHAR(100) NOT NULL,
        Price DECIMAL(10,2) NOT NULL,
        StockQuantity INT NOT NULL DEFAULT 0,
        CategoryID INT NOT NULL, -- foreign key
        FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

-- 4.Orders      
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    CustomerID INT NOT NULL , -- foreign key
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- default current date
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

-- 5.Reviews
CREATE TABLE Reviews(
	ReviewID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    ProductID INT NOT NULL , -- foreign key
    CustomerID INT NOT NULL , -- foreign key
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0.0 AND 5.0), -- -- rating from 0.0 to 5.0
    Comment VARCHAR(100), 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

-- 6.Discounts
CREATE TABLE Discounts(
	DiscountID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    ProductID INT NOT NULL , -- foreign key
    DiscountAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

-- 7.OrderDetails    
CREATE TABLE OrderDetails(
	DetailID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    OrderID INT NOT NULL , -- foreign key
    ProductID INT NOT NULL , -- foreign key
    Quantity INT NOT NULL CHECK (Quantity > 0) , 
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

-- 8.Shipping
CREATE TABLE Shipping(
	ShippingID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    OrderID INT NOT NULL , -- foreign key
    ShipDate DATE NOT NULL ,
    DeliveryDate DATE  , -- CHECK ShipDate is less than DeliveryDate ) 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CHECK (ShipDate <= DeliveryDate )
);

/*
-- 1.Categories
CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);
*/

INSERT INTO Categories(CategoryID,CategoryName) VALUES
	(1,'Electronics'),
	(2,'Books'),
	(3,'Clothing'),
	(4,'Home Appliances'),
	(5,'Sports Equipment'),
	(6,'Beauty & Personal Care'),
	(7,'Toys & Games'),
	(8,'Furniture'),
	(9,'Automotive'),
	(10,'Jewelry'),
	(11,'Health & Wellness'),
	(12,'Pet Supplies'),
	(13,'Groceries'),
	(14,'Office Supplies'),
	(15,'Musical Instruments')
;

/*  
	-- 2.Customers      
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL 
);

*/
INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.com'),
(2, 'Diya Patel', 'diya.patel@example.com'),
(3, 'Vivaan Singh', 'vivaan.singh@example.com'),
(4, 'Anaya Reddy', 'anaya.reddy@example.com'),
(5, 'Krishna Iyer', 'krishna.iyer@example.com'),
(6, 'Meera Joshi', 'meera.joshi@example.com'),
(7, 'Rohan Verma', 'rohan.verma@example.com'),
(8, 'Ishita Kapoor', 'ishita.kapoor@example.com'),
(9, 'Aryan Das', 'aryan.das@example.com'),
(10, 'Sanya Nair', 'sanya.nair@example.com'),
(11, 'Manav Pillai', 'manav.pillai@example.com'),
(12, 'Kavya Mehta', 'kavya.mehta@example.com'),
(13, 'Nikhil Chauhan', 'nikhil.chauhan@example.com'),
(14, 'Tanya Sinha', 'tanya.sinha@example.com'),
(15, 'Devansh Rao', 'devansh.rao@example.com'),
(16, 'Sneha Roy', 'sneha.roy@example.com'),
(17, 'Ayaan Shetty', 'ayaan.shetty@example.com'),
(18, 'Ritika Kulkarni', 'ritika.kulkarni@example.com'),
(19, 'Aditya Malhotra', 'aditya.malhotra@example.com'),
(20, 'Priya Bhat', 'priya.bhat@example.com'),
(21, 'Karan Agarwal', 'karan.agarwal@example.com'),
(22, 'Neha Mishra', 'neha.mishra@example.com'),
(23, 'Yash Tiwari', 'yash.tiwari@example.com'),
(24, 'Shruti Menon', 'shruti.menon@example.com'),
(25, 'Siddharth Saxena', 'siddharth.saxena@example.com'),
(26, 'Isha Bhattacharya', 'isha.bhattacharya@example.com'),
(27, 'Laksh Khanna', 'laksh.khanna@example.com'),
(28, 'Naina Dey', 'naina.dey@example.com'),
(29, 'Parth Ghosh', 'parth.ghosh@example.com'),
(30, 'Reena Mukherjee', 'reena.mukherjee@example.com'),
(31, 'Harsh Venkatesh', 'harsh.venkatesh@example.com'),
(32, 'Pooja Krishnan', 'pooja.krishnan@example.com'),
(33, 'Rajeev Narayan', 'rajeev.narayan@example.com'),
(34, 'Divya Chatterjee', 'divya.chatterjee@example.com'),
(35, 'Tanmay Shah', 'tanmay.shah@example.com'),
(36, 'Radhika Gopal', 'radhika.gopal@example.com'),
(37, 'Sahil Jain', 'sahil.jain@example.com'),
(38, 'Anjali Naidu', 'anjali.naidu@example.com'),
(39, 'Mohit Bansal', 'mohit.bansal@example.com'),
(40, 'Simran Kaul', 'simran.kaul@example.com'),
(41, 'Arjun Rathi', 'arjun.rathi@example.com'),
(42, 'Pallavi Sehgal', 'pallavi.sehgal@example.com'),
(43, 'Aman Kapoor', 'aman.kapoor@example.com'),
(44, 'Bhavna Tripathi', 'bhavna.tripathi@example.com'),
(45, 'Raj Mehra', 'raj.mehra@example.com'),
(46, 'Kritika Lal', 'kritika.lal@example.com'),
(47, 'Vikram Solanki', 'vikram.solanki@example.com'),
(48, 'Madhavi Jha', 'madhavi.jha@example.com'),
(49, 'Tarun Ranganathan', 'tarun.ranganathan@example.com'),
(50, 'Preeti Desai', 'preeti.desai@example.com'),
(51, 'Rajat Srivastava', 'rajat.srivastava@example.com'),
(52, 'Snehal Jain', 'snehal.jain@example.com'),
(53, 'Naveen Anand', 'naveen.anand@example.com'),
(54, 'Aishwarya Sen', 'aishwarya.sen@example.com'),
(55, 'Kunal Tyagi', 'kunal.tyagi@example.com'),
(56, 'Lavanya Bhatt', 'lavanya.bhatt@example.com'),
(57, 'Prateek Chandra', 'prateek.chandra@example.com'),
(58, 'Namrata Gaur', 'namrata.gaur@example.com'),
(59, 'Ashwin Kohli', 'ashwin.kohli@example.com'),
(60, 'Riya Mahajan', 'riya.mahajan@example.com'),
(61, 'Gaurav Jindal', 'gaurav.jindal@example.com'),
(62, 'Ishani Sood', 'ishani.sood@example.com'),
(63, 'Dhruv Bhansali', 'dhruv.bhansali@example.com'),
(64, 'Ankita Vyas', 'ankita.vyas@example.com'),
(65, 'Suraj Joshi', 'suraj.joshi@example.com'),
(66, 'Chhavi Kaur', 'chhavi.kaur@example.com'),
(67, 'Ajay Rawat', 'ajay.rawat@example.com'),
(68, 'Deepika Arora', 'deepika.arora@example.com'),
(69, 'Nitesh Behl', 'nitesh.behl@example.com'),
(70, 'Karishma Dev', 'karishma.dev@example.com'),
(71, 'Rahul Dube', 'rahul.dube@example.com'),
(72, 'Shreya Lamba', 'shreya.lamba@example.com'),
(73, 'Manish Godbole', 'manish.godbole@example.com'),
(74, 'Aditi Sinha', 'aditi.sinha@example.com'),
(75, 'Vikas Phadke', 'vikas.phadke@example.com'),
(76, 'Tanvi Shah', 'tanvi.shah@example.com'),
(77, 'Harshit Talwar', 'harshit.talwar@example.com'),
(78, 'Meghna Vora', 'meghna.vora@example.com'),
(79, 'Abhinav Bhatt', 'abhinav.bhatt@example.com'),
(80, 'Pallavi Seth', 'pallavi.seth@example.com');

/*
-- 3.Product
CREATE TABLE Product(
		ProductID INT PRIMARY KEY AUTO_INCREMENT, -- primary key	
        Name VARCHAR(100) NOT NULL,
        Price DECIMAL(10,2) NOT NULL,
        StockQuantity INT NOT NULL DEFAULT 0,
        CategoryID INT NOT NULL, -- foreign key
        FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);
*/

INSERT INTO Product (ProductID, Name, Price, StockQuantity, CategoryID) VALUES
(1, 'Samsung Galaxy S22', 59999.00, 50, 1),
(2, 'iPhone 14', 79999.00, 35, 1),
(3, 'OnePlus Nord CE', 24999.00, 70, 1),
(4, 'Sony Headphones', 3999.00, 90, 1),
(5, 'HP Pavilion Laptop', 68999.00, 25, 1),
(6, 'Dell Inspiron 15', 72999.00, 15, 1),
(7, 'Apple MacBook Air', 99990.00, 10, 1),
(8, 'Realme Smart Watch', 4999.00, 60, 1),
(9, 'The Alchemist', 299.00, 200, 2),
(10, 'Wings of Fire', 250.00, 180, 2),
(11, 'Think and Grow Rich', 350.00, 150, 2),
(12, 'Rich Dad Poor Dad', 299.00, 160, 2),
(13, 'Java Programming', 899.00, 100, 2),
(14, 'Data Structures Book', 749.00, 80, 2),
(15, 'Men\'s Cotton Shirt', 1199.00, 80, 3),
(16, 'Men\'s Casual Jeans', 1499.00, 70, 3),
(17, 'Women\'s Kurti', 999.00, 60, 3),
(18, 'Saree - Silk', 1999.00, 45, 3),
(19, 'T-shirt (Unisex)', 499.00, 100, 3),
(20, 'Hoodie (Winter)', 899.00, 55, 3),
(21, 'LG Washing Machine', 23990.00, 25, 4),
(22, 'Samsung Refrigerator', 32990.00, 20, 4),
(23, 'Philips Mixer Grinder', 4990.00, 40, 4),
(24, 'Usha Ceiling Fan', 2699.00, 70, 4),
(25, 'Electric Kettle', 1899.00, 65, 4),
(26, 'Microwave Oven', 8499.00, 30, 4),
(27, 'Cosco Cricket Bat', 2499.00, 100, 5),
(28, 'Nivia Football', 999.00, 120, 5),
(29, 'Yonex Badminton Racket', 1399.00, 80, 5),
(30, 'Yoga Mat', 799.00, 150, 5),
(31, 'Skating Shoes', 2199.00, 50, 5),
(32, 'Cricket Kit Bag', 1799.00, 40, 5),
(33, 'Lakme Face Cream', 299.00, 180, 6),
(34, 'Dove Shampoo', 399.00, 200, 6),
(35, 'Nivea Body Lotion', 249.00, 220, 6),
(36, 'Himalaya Face Wash', 179.00, 250, 6),
(37, 'L’Oreal Hair Serum', 349.00, 150, 6),
(38, 'Beardo Beard Oil', 399.00, 130, 6),
(39, 'Remote Control Car', 1499.00, 90, 7),
(40, 'UNO Card Game', 199.00, 300, 7),
(41, 'Building Blocks Set', 1299.00, 120, 7),
(42, 'Doll House', 799.00, 80, 7),
(43, 'Soft Toy (Teddy)', 599.00, 140, 7),
(44, 'Board Game - Ludo', 299.00, 160, 7),
(45, 'Wooden Dining Table', 24999.00, 15, 8),
(46, 'Plastic Chair Set', 4999.00, 60, 8),
(47, 'Office Desk', 9999.00, 20, 8),
(48, 'Queen Bed (Wood)', 28990.00, 10, 8),
(49, 'Bookshelf (5 Tier)', 5999.00, 25, 8),
(50, 'TV Stand Cabinet', 4499.00, 18, 8),
(51, 'Car Mobile Holder', 299.00, 110, 9),
(52, 'Car Vacuum Cleaner', 1599.00, 80, 9),
(53, 'Motor Oil (5L)', 1299.00, 70, 9),
(54, 'Wiper Blades', 499.00, 90, 9),
(55, 'Car Cover', 1099.00, 75, 9),
(56, 'GPS Navigation Device', 3999.00, 20, 9),
(57, 'Gold Plated Earrings', 799.00, 40, 10),
(58, 'Silver Anklets', 699.00, 50, 10),
(59, 'Necklace Set', 1499.00, 35, 10),
(60, 'Finger Rings (Set of 3)', 499.00, 65, 10),
(61, 'Bracelet (Metal)', 399.00, 45, 10),
(62, 'Toe Rings', 299.00, 55, 10),
(63, 'Herbal Multivitamins', 499.00, 100, 11),
(64, 'Ayurvedic Hair Oil', 250.00, 120, 11),
(65, 'Diabetic Control Pack', 999.00, 60, 11),
(66, 'Omega 3 Capsules', 699.00, 85, 11),
(67, 'Ashwagandha Tablets', 599.00, 90, 11),
(68, 'Protein Powder (500g)', 1299.00, 75, 11),
(69, 'Dog Food (5kg)', 1250.00, 45, 12),
(70, 'Cat Toy Pack', 299.00, 80, 12),
(71, 'Bird Feeder', 399.00, 30, 12),
(72, 'Fish Tank Cleaner', 199.00, 55, 12),
(73, 'Pet Shampoo', 349.00, 70, 12),
(74, 'Dog Collar', 249.00, 60, 12),
(75, 'Organic Rice (1kg)', 120.00, 300, 13),
(76, 'Sunflower Oil (1L)', 180.00, 250, 13),
(77, 'Toor Dal (1kg)', 150.00, 280, 13),
(78, 'Sugar (1kg)', 55.00, 350, 13),
(79, 'Salt (1kg)', 25.00, 400, 13),
(80, 'Wheat Flour (5kg)', 230.00, 200, 13);

/* 
-- 4.Orders      
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    CustomerID INT NOT NULL , -- foreign key
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- default current date
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);
*/

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 42, '2012-04-18'),
(2, 7, '2011-12-23'),
(3, 65, '2014-07-09'),
(4, 3, '2024-06-10'),
(5, 18, '2015-09-21'),
(6, 37, '2017-02-15'),
(7, 29, '2016-11-30'),
(8, 50, '2018-08-05'),
(9, 24, '2013-03-14'),
(10, 56, '2019-12-01'),
(11, 12, '2020-07-16'),
(12, 33, '2011-01-11'),
(13, 47, '2015-04-25'),
(14, 5, '2024-10-19'),
(15, 21, '2017-06-29'),
(16, 8, '2014-02-22'),
(17, 60, '2018-12-13'),
(18, 15, '2012-09-08'),
(19, 39, '2013-11-03'),
(20, 2, '2016-04-07'),
(21, 70, '2019-03-23'),
(22, 25, '2015-08-15'),
(23, 53, '2021-01-20'),
(24, 1, '2017-07-11'),
(25, 34, '2024-05-02'),
(26, 11, '2014-03-30'),
(27, 49, '2016-10-25'),
(28, 19, '2012-06-17'),
(29, 8, '2018-01-09'),
(30, 64, '2013-12-22'),
(31, 22, '2017-11-14'),
(32, 27, '2015-02-28'),
(33, 6, '2011-08-04'),
(34, 44, '2019-09-19'),
(35, 38, '2020-04-26'),
(36, 3, '2012-05-13'),
(37, 16, '2024-07-30'),
(38, 57, '2018-10-01'),
(39, 23, '2014-11-12'),
(40, 66, '2016-03-06'),
(41, 13, '2013-07-25'),
(42, 48, '2015-12-17'),
(43, 9, '2011-04-29'),
(44, 30, '2017-09-21'),
(45, 59, '2024-08-15'),
(46, 26, '2019-06-10'),
(47, 4, '2014-01-18'),
(48, 62, '2018-05-03'),
(49, 20, '2013-02-08'),
(50, 35, '2015-10-27'),
(51, 7, '2016-07-14'),
(52, 43, '2024-03-12'),
(53, 55, '2017-01-23'),
(54, 17, '2011-05-07'),
(55, 31, '2019-08-09'),
(56, 41, '2014-06-30'),
(57, 14, '2012-11-05'),
(58, 54, '2018-09-15'),
(59, 28, '2013-10-20'),
(60, 61, '2017-04-02'),
(61, 10, '2015-03-19'),
(62, 45, '2011-09-28'),
(63, 69, '2024-12-11'),
(64, 36, '2019-07-07'),
(65, 2, '2013-05-22'),
(66, 51, '2016-08-18'),
(67, 12, '2014-09-14'),
(68, 68, '2017-12-26'),
(69, 39, '2012-02-13'),
(70, 25, '2018-03-29'),
(71, 5, '2011-06-04'),
(72, 58, '2015-11-11'),
(73, 33, '2024-04-20'),
(74, 46, '2017-10-06'),
(75, 21, '2013-08-31'),
(76, 37, '2016-01-15'),
(77, 60, '2014-12-03'),
(78, 13, '2019-02-27'),
(79, 49, '2012-07-07'),
(80, 22, '2018-06-22');

/*
-- 5.Reviews
CREATE TABLE Reviews(
	ReviewID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    ProductID INT NOT NULL , -- foreign key
    CustomerID INT NOT NULL , -- foreign key
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0.0 AND 5.0), -- -- rating from 0.0 to 5.0
    Comment VARCHAR(100), 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);
*/
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
(1, 5, 12, 4.5, 'Great product, works as expected.'),
(2, 10, 23, 3.0, 'Average quality, could be better.'),
(3, 3, 5, 5.0, 'Excellent! Highly recommend.'),
(4, 20, 45, 2.5, 'Not satisfied with the durability.'),
(5, 7, 33, 4.0, 'Good value for money.'),
(6, 15, 18, 1.0, 'Poor packaging, item was damaged.'),
(7, 30, 50, 4.8, 'Works perfectly, very happy!'),
(8, 8, 27, 3.5, 'Decent but shipping was slow.'),
(9, 25, 41, 2.0, 'Product not as described.'),
(10, 12, 22, 5.0, 'Exceeded my expectations.'),
(11, 18, 36, 4.2, 'Quality is good for the price.'),
(12, 22, 10, 3.8, 'Satisfactory overall.'),
(13, 40, 55, 4.9, 'Highly recommend to others.'),
(14, 6, 6, 2.2, 'Could be improved, okay for now.'),
(15, 11, 30, 5.0, 'Fantastic product!'),
(16, 17, 9, 3.3, 'Works, but some minor flaws.'),
(17, 35, 61, 4.7, 'Good quality and fast delivery.'),
(18, 9, 14, 1.5, 'Not worth the price.'),
(19, 28, 38, 4.3, 'Good, but packaging can improve.'),
(20, 13, 48, 5.0, 'Loved it, will buy again.'),
(21, 21, 13, 3.7, 'Average, nothing special.'),
(22, 14, 31, 4.1, 'Works fine for my needs.'),
(23, 19, 7, 2.0, 'Disappointed, expected better.'),
(24, 27, 44, 5.0, 'Perfect product, excellent!'),
(25, 33, 54, 3.4, 'Okay product, decent value.'),
(26, 4, 8, 4.6, 'Very happy with this purchase.'),
(27, 16, 35, 1.8, 'Not recommended.'),
(28, 23, 29, 4.0, 'Good enough for the price.'),
(29, 38, 51, 3.9, 'Works well, minor issues.'),
(30, 1, 43, 5.0, 'Highly satisfied!'),
(31, 2, 16, 3.2, 'Average product.'),
(32, 24, 58, 4.4, 'Good quality and service.'),
(33, 34, 4, 2.5, 'Below expectations.'),
(34, 26, 20, 5.0, 'Excellent, no complaints.'),
(35, 39, 56, 3.6, 'Satisfactory for now.'),
(36, 31, 21, 4.9, 'Really good quality.'),
(37, 37, 39, 1.0, 'Very poor experience.'),
(38, 29, 49, 4.7, 'Highly recommend.'),
(39, 32, 3, 3.3, 'Not bad, but could improve.'),
(40, 36, 17, 4.5, 'Good value and timely delivery.'),
(41, 20, 47, 2.1, 'Disappointed with product quality.'),
(42, 13, 53, 5.0, 'Perfect, no issues.'),
(43, 15, 28, 4.2, 'Works well.'),
(44, 18, 11, 3.0, 'Okay product.'),
(45, 7, 37, 4.8, 'Really pleased with it.'),
(46, 5, 25, 2.7, 'Not as expected.'),
(47, 10, 32, 5.0, 'Excellent quality!'),
(48, 3, 34, 4.1, 'Good product overall.'),
(49, 30, 15, 3.5, 'Satisfactory.'),
(50, 8, 26, 4.4, 'Worth the price.'),
(51, 12, 52, 2.9, 'Could be better.'),
(52, 22, 24, 5.0, 'Absolutely love it!'),
(53, 25, 19, 3.3, 'It is okay.'),
(54, 40, 40, 4.6, 'Very good product.'),
(55, 6, 46, 1.7, 'Not recommended.'),
(56, 11, 59, 5.0, 'Fantastic!'),
(57, 16, 1, 3.8, 'Average product.'),
(58, 23, 60, 4.3, 'Good value.'),
(59, 38, 42, 2.0, 'Poor quality.'),
(60, 1, 62, 5.0, 'Love it!'),
(61, 2, 57, 3.4, 'Decent product.'),
(62, 24, 63, 4.9, 'Highly satisfied.'),
(63, 34, 64, 3.1, 'Could improve.'),
(64, 26, 65, 4.7, 'Great product.'),
(65, 39, 66, 2.6, 'Not great.'),
(66, 31, 67, 5.0, 'Awesome!'),
(67, 37, 68, 3.7, 'Okay product.'),
(68, 29, 69, 4.8, 'Highly recommend!'),
(69, 32, 70, 1.2, 'Very bad.'),
(70, 36, 71, 4.4, 'Good quality.'),
(71, 20, 72, 2.3, 'Not satisfied.'),
(72, 13, 73, 5.0, 'Excellent!'),
(73, 15, 74, 3.6, 'Works well.'),
(74, 18, 75, 4.1, 'Happy with purchase.'),
(75, 7, 76, 1.9, 'Poor experience.'),
(76, 5, 77, 4.5, 'Very good product.'),
(77, 10, 78, 3.0, 'Average.'),
(78, 3, 79, 5.0, 'Fantastic!'),
(79, 30, 80, 4.3, 'Good product.'),
(80, 8, 2, 3.7, 'Satisfactory.');

/*
-- 6.Discounts
CREATE TABLE Discounts(
	DiscountID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    ProductID INT NOT NULL , -- foreign key
    DiscountAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
*/
INSERT INTO Discounts (DiscountID, ProductID, DiscountAmount) VALUES
(1, 1, 499.50),
(2, 2, 150.00),
(3, 4, 350.25),
(4, 5, 1000.00),
(5, 7, 750.00),
(6, 8, 450.75),
(7, 9, 300.00),
(8, 11, 1200.00),
(9, 12, 900.00),
(10, 14, 200.00),
(11, 16, 850.00),
(12, 18, 600.00),
(13, 20, 1300.00),
(14, 22, 400.00),
(15, 24, 499.99),
(16, 26, 350.00),
(17, 28, 1100.00),
(18, 30, 550.50),
(19, 32, 100.00),
(20, 34, 600.75),
(21, 36, 800.00),
(22, 38, 1050.00),
(23, 40, 499.50),
(24, 42, 650.00),
(25, 44, 750.25),
(26, 46, 1200.00),
(27, 48, 350.00),
(28, 50, 999.99),
(29, 52, 450.00),
(30, 54, 550.00),
(31, 56, 700.00),
(32, 58, 400.00),
(33, 60, 850.00),
(34, 62, 300.00),
(35, 64, 1000.00),
(36, 66, 1200.00),
(37, 68, 600.00),
(38, 70, 450.00),
(39, 72, 1100.00),
(40, 74, 550.50),
(41, 76, 300.00),
(42, 78, 650.00),
(43, 80, 1200.00),
(44, 79, 700.00),
(45, 77, 500.00),
(46, 75, 350.00);

/*
-- 7.OrderDetails    
CREATE TABLE OrderDetails(
	DetailID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    OrderID INT NOT NULL , -- foreign key
    ProductID INT NOT NULL , -- foreign key
    Quantity INT NOT NULL CHECK (Quantity > 0) , 
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
*/
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
-- OrderID 1
(1, 3, 2), (1, 7, 1),
-- OrderID 2
(2, 2, 4),
-- OrderID 3
(3, 5, 3), (3, 1, 2), (3, 8, 1),
-- OrderID 4
(4, 4, 5),
-- OrderID 5
(5, 6, 2), (5, 9, 3),
-- OrderID 6
(6, 1, 1), (6, 10, 4),
-- OrderID 7
(7, 7, 5),
-- OrderID 8
(8, 2, 3), (8, 3, 2),
-- OrderID 9
(9, 9, 1),
-- OrderID 10
(10, 5, 4), (10, 6, 3),
-- OrderID 11
(11, 4, 2),
-- OrderID 12
(12, 1, 5), (12, 8, 2),
-- OrderID 13
(13, 7, 3),
-- OrderID 14
(14, 10, 1), (14, 2, 4),
-- OrderID 15
(15, 3, 2),
-- OrderID 16
(16, 6, 3), (16, 5, 2),
-- OrderID 17
(17, 8, 4),
-- OrderID 18
(18, 9, 1), (18, 1, 3),
-- OrderID 19
(19, 4, 5),
-- OrderID 20
(20, 7, 2), (20, 10, 3),
-- OrderID 21
(21, 2, 1),
-- OrderID 22
(22, 5, 4), (22, 6, 1),
-- OrderID 23
(23, 1, 2),
-- OrderID 24
(24, 3, 3), (24, 8, 2),
-- OrderID 25
(25, 9, 4),
-- OrderID 26
(26, 4, 1), (26, 7, 3),
-- OrderID 27
(27, 10, 5),
-- OrderID 28
(28, 2, 2), (28, 5, 4),
-- OrderID 29
(29, 1, 3),
-- OrderID 30
(30, 6, 1), (30, 9, 5),
-- OrderID 31
(31, 3, 2),
-- OrderID 32
(32, 7, 4), (32, 8, 3),
-- OrderID 33
(33, 10, 2),
-- OrderID 34
(34, 2, 1), (34, 4, 5),
-- OrderID 35
(35, 1, 3),
-- OrderID 36
(36, 5, 2), (36, 6, 4),
-- OrderID 37
(37, 9, 1),
-- OrderID 38
(38, 3, 5), (38, 7, 2),
-- OrderID 39
(39, 10, 3),
-- OrderID 40
(40, 2, 4), (40, 1, 1),
-- OrderID 41
(41, 6, 3),
-- OrderID 42
(42, 8, 5), (42, 9, 2),
-- OrderID 43
(43, 4, 1),
-- OrderID 44
(44, 7, 3), (44, 10, 4),
-- OrderID 45
(45, 5, 2),
-- OrderID 46
(46, 1, 5), (46, 3, 3),
-- OrderID 47
(47, 6, 1),
-- OrderID 48
(48, 9, 4), (48, 2, 2),
-- OrderID 49
(49, 7, 3),
-- OrderID 50
(50, 10, 5), (50, 4, 1),
-- OrderID 51
(51, 5, 2),
-- OrderID 52
(52, 3, 4), (52, 1, 2),
-- OrderID 53
(53, 6, 1),
-- OrderID 54
(54, 8, 3), (54, 9, 5),
-- OrderID 55
(55, 2, 4),
-- OrderID 56
(56, 7, 2), (56, 10, 1),
-- OrderID 57
(57, 5, 3),
-- OrderID 58
(58, 1, 2), (58, 4, 5),
-- OrderID 59
(59, 6, 1),
-- OrderID 60
(60, 9, 3), (60, 3, 4),
-- OrderID 61
(61, 7, 2),
-- OrderID 62
(62, 10, 5), (62, 2, 1),
-- OrderID 63
(63, 5, 3),
-- OrderID 64
(64, 1, 4), (64, 6, 2),
-- OrderID 65
(65, 8, 1),
-- OrderID 66
(66, 9, 5), (66, 3, 2),
-- OrderID 67
(67, 7, 3),
-- OrderID 68
(68, 10, 4), (68, 2, 2),
-- OrderID 69
(69, 5, 1),
-- OrderID 70
(70, 1, 3), (70, 4, 5),
-- OrderID 71
(71, 6, 2),
-- OrderID 72
(72, 9, 4), (72, 3, 1),
-- OrderID 73
(73, 7, 5),
-- OrderID 74
(74, 10, 2), (74, 2, 3),
-- OrderID 75
(75, 5, 1),
-- OrderID 76
(76, 1, 4), (76, 6, 2),
-- OrderID 77
(77, 8, 3),
-- OrderID 78
(78, 9, 5), (78, 3, 1),
-- OrderID 79
(79, 7, 2),
-- OrderID 80
(80, 10, 3);

/*
-- 8.Shipping
CREATE TABLE Shipping(
	ShippingID INT PRIMARY KEY AUTO_INCREMENT, -- primary key
    OrderID INT NOT NULL , -- foreign key
    ShipDate DATE NOT NULL ,
    DeliveryDate DATE  , -- CHECK ShipDate is less than DeliveryDate ) 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CHECK (ShipDate <= DeliveryDate )
);*/
INSERT INTO Shipping (ShippingID, OrderID, ShipDate, DeliveryDate) VALUES
(1, 1, '2024-01-10', '2024-01-15'),
(2, 2, '2024-02-20', '2024-02-25'),
(3, 3, '2011-03-05', '2011-03-10'),
(4, 4, '2011-04-10', '2011-04-15'),
(5, 5, '2012-05-01', '2012-05-05'),
(6, 6, '2012-06-15', '2012-06-20'),
(7, 7, '2013-07-10', '2013-07-15'),
(8, 8, '2013-08-05', '2013-08-10'),
(9, 9, '2014-09-01', '2014-09-06'),
(10, 10, '2014-10-12', '2014-10-17'),
(11, 11, '2015-11-03', '2015-11-08'),
(12, 12, '2015-12-14', '2015-12-19'),
(13, 13, '2016-01-07', '2016-01-12'),
(14, 14, '2016-02-18', '2016-02-23'),
(15, 15, '2017-03-11', '2017-03-16'),
(16, 16, '2017-04-22', '2017-04-27'),
(17, 17, '2018-05-13', '2018-05-18'),
(18, 18, '2018-06-24', '2018-06-29'),
(19, 19, '2019-07-15', '2019-07-20'),
(20, 20, '2019-08-26', '2019-08-31'),
(21, 21, '2020-01-05', '2020-01-10'),
(22, 22, '2020-02-16', '2020-02-21'),
(23, 23, '2020-03-27', '2020-04-01'),
(24, 24, '2020-04-08', '2020-04-13'),
(25, 25, '2020-05-19', '2020-05-24'),
(26, 26, '2020-06-30', '2020-07-05'),
(27, 27, '2020-08-10', '2020-08-15'),
(28, 28, '2020-09-20', '2020-09-25'),
(29, 29, '2020-11-01', '2020-11-06'),
(30, 30, '2020-12-12', '2020-12-17'),
(31, 31, '2021-01-23', '2021-01-28'),
(32, 32, '2021-03-06', '2021-03-11'),
(33, 33, '2021-04-17', '2021-04-22'),
(34, 34, '2021-05-28', '2021-06-02'),
(35, 35, '2021-07-09', '2021-07-14'),
(36, 36, '2021-08-20', '2021-08-25'),
(37, 37, '2021-10-01', '2021-10-06'),
(38, 38, '2021-11-12', '2021-11-17'),
(39, 39, '2021-12-23', '2021-12-28'),
(40, 40, '2022-01-15', '2022-01-20'),
(41, 41, '2022-02-26', '2022-03-03'),
(42, 42, '2022-04-08', '2022-04-13'),
(43, 43, '2022-05-19', '2022-05-24'),
(44, 44, '2022-06-30', '2022-07-05'),
(45, 45, '2022-08-11', '2022-08-16'),
(46, 46, '2022-09-22', '2022-09-27'),
(47, 47, '2022-11-03', '2022-11-08'),
(48, 48, '2022-12-14', '2022-12-19'),
(49, 49, '2023-01-25', '2023-01-30'),
(50, 50, '2023-03-08', '2023-03-13'),
(51, 51, '2023-04-19', '2023-04-24'),
(52, 52, '2023-05-30', '2023-06-04'),
(53, 53, '2023-07-11', '2023-07-16'),
(54, 54, '2023-08-22', '2023-08-27'),
(55, 55, '2023-10-03', '2023-10-08'),
(56, 56, '2023-11-14', '2023-11-19'),
(57, 57, '2023-12-25', '2023-12-30'),
(58, 58, '2024-02-05', '2024-02-10'),
(59, 59, '2024-03-17', '2024-03-22'),
(60, 60, '2024-04-28', '2024-05-03'),
(61, 61, '2024-06-08', '2024-06-13'),
(62, 62, '2024-07-19', '2024-07-24'),
(63, 63, '2024-08-01', '2024-08-06'),
(64, 64, '2024-08-10', '2024-08-15'),
(65, 65, '2024-08-17', '2024-08-22'),
(66, 66, '2024-08-20', '2024-08-25'),
(67, 67, '2024-08-25', '2024-08-30'),
(68, 68, '2024-08-30', '2024-09-04'),
(69, 69, '2024-09-05', '2024-09-10'),
(70, 70, '2024-09-10', '2024-09-15'),
(71, 71, '2024-09-15', '2024-09-20'),
(72, 72, '2024-09-20', '2024-09-25'),
(73, 73, '2024-09-25', '2024-09-30'),
(74, 74, '2024-10-01', '2024-10-06'),
(75, 75, '2024-10-06', '2024-10-11'),
(76, 76, '2024-10-11', '2024-10-16'),
(77, 77, '2024-10-16', '2024-10-21'),
(78, 78, '2024-10-21', '2024-10-26'),
(79, 79, '2024-10-26', '2024-10-31'),
(80, 80, '2024-10-31', '2024-11-05');

SELECT * FROM categories ORDER BY CategoryID;
SELECT * FROM customers ORDER BY CustomerID;
SELECT * FROM discounts ORDER BY DiscountID;
SELECT * FROM orderdetails ORDER BY DetailID;
SELECT * FROM orders ORDER BY OrderID;
SELECT * FROM product ORDER BY ProductID;
SELECT * FROM reviews ORDER BY ReviewID; 
SELECT * FROM shipping ORDER BY ShippingID; 

-- QUERIES
-- 1. Show total quantity sold per product
SELECT 
	od.ProductID,
    p.name AS Product_Name, 
    SUM(od.Quantity) AS Total_Quantity
FROM product p
INNER JOIN orderdetails od
	ON p.ProductID = od.ProductID
GROUP BY 
	p.ProductID,p.name
ORDER BY od.ProductID;

-- 2. Show Top_5 quantity sold per product 
SELECT 
    p.name AS Product_Name, 
    SUM(od.Quantity) AS Total_Quantity
FROM product p
INNER JOIN orderdetails od
	ON p.ProductID = od.ProductID
GROUP BY 
	p.ProductID,p.name 
ORDER BY 
	Total_Quantity DESC 
	LIMIT 5;

-- 3. show total revenue (quantity * price) generated per product
SELECT 
	p.productID,
	p.name AS Product_Name,
    SUM(od.quantity * p.price)AS Revenue
FROM product p
INNER JOIN orderdetails od 
	ON p.ProductID=od.ProductID
GROUP BY
	p.productID,
    p.name
ORDER BY
	ProductID;


-- 3. show total revenue (quantity * (price-discount)) generated per product
SELECT 
	p.productID,
	p.name AS Product_Name,
    SUM(od.quantity * (p.price - 
		CASE 
			WHEN d.DiscountAmount IS NULL THEN 0
            ELSE d.DiscountAmount
		END))AS Revenue
FROM product p
INNER JOIN orderdetails od 
	ON p.ProductID=od.ProductID
LEFT JOIN discounts d
	ON p.ProductID=d.ProductID
GROUP BY
	p.productID,
    p.name
ORDER BY
	ProductID;


-- 4.display average price for each category
SELECT 
	c.CategoryID,
    c.CategoryName,
	ROUND(AVG(p.Price),2)AS AVERAGE_PRICE
FROM categories c
LEFT JOIN product p
	ON c.CategoryID=p.CategoryID
GROUP BY
	c.CategoryID,c.CategoryName
ORDER BY CategoryID ;

-- 5.show total quantity sold per category per product
SELECT 
	c.CategoryID,
    c.CategoryName,
    p.name AS Product_Name,
	SUM(od.Quantity)AS TOTAL_QUANTITY
FROM categories c
INNER JOIN product p
	ON c.CategoryID = p.CategoryID
LEFT JOIN orderdetails od
	ON od.ProductID=p.ProductID
GROUP BY 
	c.CategoryID,
    c.CategoryName,
	p.name
ORDER BY 
	c.CategoryID;
    
-- 6.find witch product generated the highest total revenue overall
SELECT
	p.name AS Product_Name,
	SUM(od.quantity * p.price)AS revenue
FROM product p
INNER JOIN orderdetails od
	ON p.ProductID =od.ProductID
GROUP BY
	p.name
ORDER BY
	revenue DESC 
    LIMIT 1;
    
-- 7. display each category's total revenue and only include categories where average price >10,000
SELECT 
	c.CategoryID,
    c.CategoryName,
    SUM(od.quantity * p.price)AS revenue
FROM product p 
INNER JOIN orderdetails od
	ON p.ProductID =od.ProductID
LEFT JOIN categories c 
	ON c.categoryID=p.CategoryID
GROUP BY 
	c.CategoryID,c.CategoryName
HAVING 
	AVG(price)>10000;
    
-- 8.display all orders with customername and orderdate (inner join)
SELECT 
	c.name AS Customer_Name ,
    o.orderdate
FROM customers c
INNER JOIN orders o
	ON c.customerID=o.customerID;

-- 9.(Multi-join) show each customer's orderid,productname,quantity and price
SELECT
	c.customerid,
    c.name AS Customer_Name,
	o.orderID,
    p.name AS Product_Name,
    p.price,
    od.quantity
FROM customers c
INNER JOIN orders o 
	ON c.customerid=o.customerid
INNER JOIN orderdetails od 
	ON od.orderid=o.orderid
INNER JOIN product p
	ON od.productid=p.productid;

-- 10.(left join ) Display all customers and their orders .if a customer has not placed an order , still show their name(with null for orderid)
SELECT 
	c.CustomerID,
    c.Name AS Customer_name,
    o.orderid
FROM customers c 
LEFT JOIN orders o 
	ON c.CustomerID=o.CustomerID;
    
-- 11.display all products and the orders they appear in. if a product has never been ordered,show null for orderid(Right join)
SELECT 
	o.OrderID,
    p.Name AS Product_Name
FROM orders o
JOIN orderdetails od
	ON o.orderid=od.orderid
RIGHT JOIN product p
	ON p.productid=od.productid;

-- 12.List all customers and all orders. show matching records where possible ,otherwise null.(full outer join)
SELECT 
	c.CustomerID,
    c.Name AS Customer_Name,
    o.OrderID,
	o.OrderDate
FROM customers c
LEFT JOIN orders o 
	ON c.customerid=o.customerid
UNION 
SELECT 
	c.CustomerID,
    c.Name AS Customer_Name,
    o.OrderID,
	o.OrderDate
FROM customers c
RIGHT JOIN orders o 
	ON c.customerid=o.customerid;

-- 13. (aggregation with join) find the total amount spent by each customer(quantity*price)
SELECT 
	c.CustomerID,
    c.Name AS Customer_Name,
    SUM(od.quantity * p.price) AS Total_Price
FROM customers c 
LEFT JOIN orders o 
	ON c.CustomerID=o.CustomerID
JOIN orderdetails od
	ON o.orderid=od.orderid
JOIN product p
	ON p.productid=od.productid
GROUP BY 
	c.CustomerID,
    c.Name;

-- 14. (Top products) find the most purchased product (product with the highest total quantity sold)
SELECT 
	p.productid,
    p.name AS Product_Name,
    SUM(od.quantity)AS Total_quantity_sold
FROM product p 
INNER JOIN orderdetails od 
	ON p.productid=od.productid
GROUP BY 
	p.productid,
    p.name
ORDER BY 
	Total_quantity_sold DESC
    LIMIT 1;

-- 15. (Customer who did not buy) List all customers who have never placed an order
SELECT 
	c.CustomerID,
    c.Name
FROM customers c 
LEFT JOIN orders o 
	ON c.CustomerID=o.CustomerID
WHERE 
	o.orderid IS NULL;

-- 16.cross join - show all possible customer-product combinations (who could buy what)
SELECT DISTINCT
	c.CustomerID,
    c.Name AS Customer_name,
    p.Name AS Product_name
FROM customers c 
CROSS JOIN product p
ORDER BY 
	c.CustomerID;

-- 17. Get MAX and MIN Order Dates
SELECT
	MAX(orderdate) AS MAX_Order_Date,
    Min(orderdate) AS MIN_Order_Date
FROM orders;

-- 18.customers who placed an order this year, but had not ordered at all in the previous year
SELECT 
	c.CustomerID,
    c.Name
FROM customers c
JOIN orders o
    ON c.CustomerID = o.CustomerID
WHERE
	YEAR(o.OrderDate) = 2024
	AND 
    c.CustomerID NOT IN (
		SELECT
			o.CustomerID
		FROM orders o
		WHERE 
			YEAR(o.OrderDate) < 2024
	)
;

-- 19.Customers who placed only one order
SELECT 
	c.customerid,
	c.name AS Customer_Name,
    COUNT(o.orderid)AS CountOfOrder
FROM customers c
INNER JOIN orders o
	ON c.Customerid=o.Customerid
GROUP BY 
	c.customerid,
	c.name
HAVING 
	CountOfOrder=1;

-- 20.Products never purchased
SELECT
	p.productid,
    p.name AS Product_Name
FROM product p
LEFT JOIN orderdetails od
	ON p.productid=od.productid
WHERE
	od.productID IS NULL;

--  21. Number of orders per product.
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    COUNT(DISTINCT od.OrderID) AS Number_Of_Orders
FROM product p
INNER JOIN orderdetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.Name
ORDER BY
    p.ProductID;

-- 22.get the customer with their latest order date
SELECT 
	c.CustomerID,
    c.Name AS Customer_Name,
    MAX(o.OrderDate) AS Latest_Order_Date
FROM customers c
INNER JOIN orders o
	ON c.CustomerID=o.CustomerID
GROUP BY 
	c.CustomerID,
    c.Name
ORDER BY
	c.CustomerID;

-- 23. get product details with rating is greater than the avg rating 
SELECT DISTINCT
	p.productid,
    p.name AS Product_Name,
	r.rating
FROM reviews r
JOIN product p
	ON p.ProductID=r.ProductID
WHERE
	r.rating>(SELECT AVG(Rating) FROM reviews)
ORDER BY 
	p.productid;
    
-- 24. MAX rating per product
SELECT DISTINCT
	p.productid,
    p.name AS Product_Name,
	r.rating
FROM reviews r
JOIN product p
	ON p.ProductID=r.ProductID
WHERE
	r.rating=(SELECT MAX(Rating) FROM reviews)
ORDER BY 
	p.productid;

-- 25. MIN rating per product
SELECT DISTINCT
	p.productid,
    p.name AS Product_Name,
	r.rating
FROM reviews r
JOIN product p
	ON p.ProductID=r.ProductID
WHERE
	r.rating=(SELECT MIN(Rating) FROM reviews)
ORDER BY 
	p.productid;

-- 26.return a list of products that were ordered in the month of July, before the year 2024
SELECT 
    p.Name AS Product_Name,
    o.OrderDate 
FROM categories c
JOIN product p 
	ON c.CategoryID=p.CategoryID
JOIN orderdetails od
	ON od.ProductID=p.ProductID
JOIN orders o
	ON o.OrderID=od.OrderID
WHERE
	YEAR(o.OrderDate) < 2024 AND MONTH(o.OrderDate) = 7
GROUP BY 
	p.Name ,
    o.OrderDate
ORDER BY
	o.OrderDate ;
    
-- 27. Most active customers by number of orders
SELECT 
	c.name AS Customer_Name,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o 
	ON c.CustomerID = o.CustomerID
GROUP BY 
	c.CustomerID
HAVING
	TotalOrders>1
ORDER BY 
	TotalOrders DESC;

-- 28.List products that have reviews from more than 2 customers
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    COUNT(r.ReviewID) AS ReviewCount
FROM Product p
JOIN Reviews r 
	ON p.ProductID = r.ProductID
GROUP BY 
	p.ProductID,
    p.Name
HAVING 
	COUNT(r.ReviewID) > 2;

-- 29.Find customers who have placed orders containing more than 2 different products
SELECT 
    c.CustomerID,
    c.Name AS Customer_Name,
    COUNT(DISTINCT od.ProductID) AS UniqueProducts
FROM Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
	ON o.OrderID = od.OrderID
GROUP BY 
	c.CustomerID,
    c.Name
HAVING
	COUNT(DISTINCT od.ProductID) > 2;

-- 30.Display orders with more than two product
SELECT 
    o.OrderID,
    COUNT(od.ProductID) AS ProductCount
FROM Orders o
JOIN OrderDetails od 
	ON o.OrderID = od.OrderID
GROUP BY 
	o.OrderID
HAVING
	COUNT(od.ProductID) > 2;

-- 31.List products that have never been reviewed
SELECT 
    p.ProductID,
    p.Name AS Product_Name
FROM Product p
LEFT JOIN Reviews r 
	ON p.ProductID = r.ProductID
WHERE 
	r.ReviewID IS NULL;

-- 32.Find customers who reviewed a product but never bought anything
SELECT DISTINCT 
    c.CustomerID,
    c.Name AS Customer_Name
FROM Customers c
JOIN Reviews r 
	ON c.CustomerID = r.CustomerID
WHERE
	c.CustomerID NOT IN (
		SELECT
			CustomerID 
		FROM Orders
	)
;

-- 33.Find the average rating per category
SELECT 
    c.CategoryID,
    c.CategoryName,
    ROUND(AVG(r.Rating), 2) AS AvgRating
FROM Categories c
JOIN Product p 
	ON c.CategoryID = p.CategoryID
JOIN Reviews r
	ON p.ProductID = r.ProductID
GROUP BY
	c.CategoryID,
    c.CategoryName
;

-- 34. List all customers who have both placed orders and written reviews
SELECT 
    c.CustomerID,
    c.Name AS Customer_Name
FROM Customers c
WHERE 
	c.CustomerID IN (
		SELECT
			CustomerID 
		FROM Orders
	)
  AND 
	c.CustomerID IN (
		SELECT 
			CustomerID
		FROM Reviews
	)
;

-- 35.List product-category pairs where stock quantity is less than 20
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    c.CategoryName,
    p.StockQuantity
FROM Product p
JOIN Categories c
	ON p.CategoryID = c.CategoryID
WHERE
	p.StockQuantity < 20;

select 
	StockQuantity 
from product;

-- 36.Get count of customers with example accounts
SELECT  
	Count(Email ) 
FROM Customers
WHERE
	Email LIKE '%example%';

-- 37.Show orders placed after January 1, 2024
SELECT
	*
FROM Orders
WHERE
	OrderDate > '2024-01-01';

-- 38.List product names sorted by price (low to high)
SELECT
	Name AS Product_Name,
    Price
FROM Product
ORDER BY
	Price ASC;

-- 39.Get the most expensive product
SELECT
	Name AS Product_Name,
    Price 
FROM Product
ORDER BY 
	Price DESC
	LIMIT 1
;

-- 40.Get the least expensive product
SELECT 
	Name AS Product_Name,
    Price 
FROM Product
ORDER BY 
	Price ASC
	LIMIT 1;

-- 41.Show all reviews with rating greater than 4
SELECT 
	*
FROM Reviews
WHERE 
	Rating > 4;

-- 42.List all products along with their category name
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    c.CategoryName
FROM Product p
JOIN Categories c 
	ON p.CategoryID = c.CategoryID;

-- 43.List all products that were reviewed with a rating less than 3
SELECT DISTINCT 
    p.Name AS Product_Name,
    r.Rating
FROM Product p
JOIN Reviews r 
	ON p.ProductID = r.ProductID
WHERE
	r.Rating < 3;

-- 44.Show total number of products in each category
SELECT 
    c.CategoryID,
    c.CategoryName,
    COUNT(p.ProductID) AS Product_Count
FROM Categories c
LEFT JOIN Product p 
	ON c.CategoryID = p.CategoryID
GROUP BY
	c.CategoryID,
    c.CategoryName;

-- 45. Show product names and number of reviews for each
SELECT 
    p.Name AS Product_Name,
    COUNT(r.ReviewID) AS Review_Count
FROM Product p
LEFT JOIN Reviews r 
	ON p.ProductID = r.ProductID
GROUP BY 
	p.Name;

-- 46.List categories that have never had any product ordered
SELECT 
    c.CategoryID,
    c.CategoryName
FROM Categories c
LEFT JOIN Product p 
	ON c.CategoryID = p.CategoryID
LEFT JOIN OrderDetails od 
	ON p.ProductID = od.ProductID
WHERE
	od.ProductID IS NULL;

-- 47.List all orders along with customer name and number of products in that order
SELECT 
    o.OrderID,
    c.Name AS Customer_Name,
    COUNT(od.ProductID) AS Product_Count
FROM Orders o
JOIN Customers c 
	ON o.CustomerID = c.CustomerID
JOIN OrderDetails od 
	ON o.OrderID = od.OrderID
GROUP BY 
	o.OrderID,
    c.Name
order by
	o.OrderID;

-- 48.List all reviews along with the customer name and product name
SELECT 
    r.ReviewID,
    c.Name AS Customer_Name,
    p.Name AS Product_Name,
    r.Rating,
    r.Comment
FROM Reviews r
JOIN Customers c 
	ON r.CustomerID = c.CustomerID
JOIN Product p 
	ON r.ProductID = p.ProductID;

-- 49.Show all products with their latest order date
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    MAX(o.OrderDate) AS Latest_Order_Date
FROM Product p
JOIN OrderDetails od 
	ON p.ProductID = od.ProductID
JOIN Orders o 
	ON od.OrderID = o.OrderID
GROUP BY
	p.ProductID,
    p.Name;

-- 50.Show each customer’s highest rated review
SELECT 
    c.CustomerID,
    c.Name AS Customer_Name,
    MAX(r.Rating) AS Highest_Rating
FROM Customers c
JOIN Reviews r 
	ON c.CustomerID = r.CustomerID
GROUP BY 
	c.CustomerID,
    c.Name;

-- 51.Display all discounts greater than ₹100
SELECT 
    d.DiscountID,
    p.Name AS Product_Name,
    d.DiscountAmount
FROM Discounts d
JOIN Product p 
	ON d.ProductID = p.ProductID
WHERE
	d.DiscountAmount > 100;

-- 52.List products that belong to a category starting with 'E'
SELECT 
    p.ProductID,
    p.Name AS Product_Name,
    c.CategoryName
FROM Product p
JOIN Categories c 
	ON p.CategoryID = c.CategoryID
WHERE
	c.CategoryName LIKE 'E%';

-- 53.Count how many customers have placed at least one order
SELECT
	COUNT(DISTINCT CustomerID) AS Active_Customers
FROM Orders;


/*
SELECT * from shipping
WHERE YEAR(ShipDate )=2010 ;

UPDATE shipping
SET 
    ShipDate = DATE_FORMAT(ShipDate, '2024-%m-%d'),
    DeliveryDate = DATE_FORMAT(DeliveryDate, '2024-%m-%d')
WHERE YEAR(ShipDate) = 2010;
*/
