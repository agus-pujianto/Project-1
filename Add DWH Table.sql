--menambahkan DDL baru untuk menyesuaikan tabel pada OLTP yang belum terakomodir pada DWH

CREATE TABLE IF NOT EXISTS dim_product_category (
	product_category_id INT NOT NULL PRIMARY KEY,
	product_category_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_product (
	product_id INT NOT NULL PRIMARY KEY,
	product_category_id INT NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	product_created DATE NOT NULL,
	product_price INT NOT NULL,
	product_discount INT,
	FOREIGN KEY (product_category_id) REFERENCES dim_product_category(product_category_id)
);

CREATE TABLE IF NOT EXISTS fact_order_items (
	order_item_id INT NOT NULL PRIMARY KEY,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	order_item_quantity INT,
	product_discount INT,
	product_subdiscount INT,
	product_price INT NOT NULL,
	product_subprice INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES fact_orders(order_id),
	FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);