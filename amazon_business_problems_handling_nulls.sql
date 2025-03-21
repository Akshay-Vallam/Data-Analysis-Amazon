-- Amazon Data Analysis Project - 20 Advaned Business Problems

	SELECT * FROM category;
	SELECT * FROM customers;
	SELECT * FROM sellers;
	SELECT * FROM products;
	SELECT * FROM orders;
	SELECT * FROM order_items;
	SELECT * FROM payments;
	SELECT * FROM shipping;
	SELECT * FROM inventory;

-- Handling Null Values

	SELECT COUNT(*) FROM category
		WHERE
		category_name IS NULL;
	
	SELECT COUNT(*) FROM customers
		WHERE
		first_name IS NULL
		OR
		last_name IS NULL
		OR
		state IS NULL;
	
	SELECT COUNT(*) FROM sellers
		WHERE
		seller_name IS NULL
		OR
		origin IS NULL;
	
	SELECT COUNT(*) FROM products
		WHERE
		product_name IS NULL
		OR
		price IS NULL
		OR
		cogs IS NULL
		OR
		category_id IS NULL;
	
	SELECT COUNT(*) FROM orders
		WHERE
		order_date IS NULL
		OR
		customer_id IS NULL
		OR
		seller_id IS NULL
		OR
		order_status IS NULL;
	
	SELECT COUNT(*) FROM order_items
		WHERE
		order_id IS NULL
		OR
		product_id IS NULL
		OR
		quantity IS NULL
		OR
		price_per_unit IS NULL;
	
	SELECT COUNT(*) FROM payments
		WHERE
		order_id IS NULL
		OR
		payment_date IS NULL
		OR
		payment_status IS NULL;

--return_date null values in shipping table are left as is, as not all shipments are returned

	SELECT COUNT(*) FROM shipping
		WHERE
		order_id IS NULL
		OR
		shipping_date IS NULL
		OR
		return_date IS NULL
		OR
		shipping_providers IS NULL
		OR
		delivery_status IS NULL;

	SELECT COUNT(*) FROM inventory
		WHERE
		product_id IS NULL
		OR
		stock IS NULL
		OR
		warehouse_id IS NULL
		OR
		last_stock_date IS NULL;
