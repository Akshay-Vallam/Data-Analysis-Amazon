-- Data Analysis Project
-- AMAZON - A multinational technology company engaged in e-commerce, cloud computing, digital streaming etc.

	CREATE DATABASE amazon_db;

-- 	Drop existing tables, if available
	DROP TABLE IF EXISTS category;
	DROP TABLE IF EXISTS customers;
	DROP TABLE IF EXISTS sellers;
	DROP TABLE IF EXISTS products;
	DROP TABLE IF EXISTS orders;
	DROP TABLE IF EXISTS order_items;
	DROP TABLE IF EXISTS payments;
	DROP TABLE IF EXISTS shipping;
	DROP TABLE IF EXISTS inventory;

-- Create category table
	DROP TABLE IF EXISTS category;
	CREATE TABLE category
	(
	category_id	INT PRIMARY KEY,
	category_name VARCHAR(20)
	);

-- Create customers table
	DROP TABLE IF EXISTS customers;
	CREATE TABLE customers
	(
	customer_id INT PRIMARY KEY,	
	first_name	VARCHAR(20),
	last_name	VARCHAR(20),
	state VARCHAR(20)
	);

-- Create sellers table
	DROP TABLE IF EXISTS sellers;
	CREATE TABLE sellers
	(
	seller_id INT PRIMARY KEY,
	seller_name	VARCHAR(25),
	origin VARCHAR(15)
	);

-- Create products table
	DROP TABLE IF EXISTS products;
	CREATE TABLE products
	(
	product_id INT PRIMARY KEY,	
	product_name VARCHAR(50),	
	price	FLOAT,
	cogs	FLOAT,
	category_id INT, -- FK 
	CONSTRAINT product_fk_category FOREIGN KEY(category_id) REFERENCES category(category_id)
	);
	
-- Create orders table
	DROP TABLE IF EXISTS orders;
	CREATE TABLE orders
	(
	order_id INT PRIMARY KEY, 	
	order_date	DATE,
	customer_id	INT, -- FK
	seller_id INT, -- FK 
	order_status VARCHAR(15),
	CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	CONSTRAINT orders_fk_sellers FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
	);

-- Create order_items table
	DROP TABLE IF EXISTS order_items;
	CREATE TABLE order_items
	(
	order_item_id INT PRIMARY KEY,
	order_id INT,	-- FK 
	product_id INT, -- FK
	quantity INT,	
	price_per_unit FLOAT,
	CONSTRAINT order_items_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
	);
	
-- Create payments table
	DROP TABLE IF EXISTS payments;
	CREATE TABLE payments
	(
	payment_id	
	INT PRIMARY KEY,
	order_id INT, -- FK 	
	payment_date DATE,
	payment_status VARCHAR(20),
	CONSTRAINT payments_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
	);

-- Create shipping table
	DROP TABLE IF EXISTS shipping;
	CREATE TABLE shipping
	(
	shipping_id	INT PRIMARY KEY,
	order_id	INT, -- FK
	shipping_date DATE,	
	return_date	 DATE,
	shipping_providers	VARCHAR(15),
	delivery_status VARCHAR(15),
	CONSTRAINT shipping_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
	);

-- Create inventory table
	DROP TABLE IF EXISTS inventory;
	CREATE TABLE inventory
	(
	inventory_id INT PRIMARY KEY,
	product_id INT, -- FK
	stock INT,
	warehouse_id INT,
	last_stock_date DATE,
	CONSTRAINT inventory_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
	);

-- END of Schemas

	SELECT * FROM category;
	SELECT * FROM customers;
	SELECT * FROM sellers;
	SELECT * FROM products;
	SELECT * FROM orders;
	SELECT * FROM order_items;
	SELECT * FROM payments;
	SELECT * FROM shipping;
	SELECT * FROM inventory;

-- Import data into tables in the below order
-- 1. category
-- 2. customers
-- 3. sellers
-- 4. products
-- 5. orders
-- 6. order_items
-- 7. payments
-- 8. shipping
-- 9. inventory