CREATE TABLE Products 
(
	product_id serial PRIMARY KEY,
	product_name text NOT NULL
);

SELECT * FROM Products;

INSERT INTO Products(product_name)
VALUES
	('Samsung Galaxy A52'),
	('ASUS ROG Zephyrus G14'),
	('Pen');

CREATE TABLE Categories 
(
	category_id serial PRIMARY KEY,
	category_name text NOT NULL
);

INSERT INTO Categories(category_name)
VALUES
	('Gadget'),
	('laptop'),
	('Fruit');
	
SELECT * FROM Categories;

CREATE TABLE ProductsAndCategories 
(
	product_id int,
	category_id int,
	PRIMARY KEY (product_id, category_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id),
	FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO ProductsAndCategories
VALUES
	(1, 1),
	(2, 1),
	(2, 2);

SELECT * FROM ProductsAndCategories;

SELECT P.product_name, C.category_name
FROM Products P
LEFT JOIN ProductsAndCategories PC
	ON P.product_id = PC.product_id
LEFT JOIN Categories C
	ON PC.category_id = C.category_id;
