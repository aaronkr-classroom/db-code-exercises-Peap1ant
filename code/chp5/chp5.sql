-- Customer Table

CREATE TABLE Customer (
	customer_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);

-- Restaurant

CREATE TABLE Restaurant (
	restaurant_id INT PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(13),
	address VARCHAR(100)
);

-- Orders Table

CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	restaurant_id INT,
	order_date TIMESTAMP,
	total NUMERIC,
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
	FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Delivery

CREATE TABLE Delivery (
	delivery_id INT PRIMARY KEY,
	order_id INT,
	driver_name VARCHAR(100),
	status INT, -- 0: 수령, 1: 조리, 2: 배달, 3: 완료, 4: 취소
	FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Data insert

INSERT INTO Customer VALUES
(1, 'Alice', '010-1111-1111', 'random_address_1'),
(2, 'Bob', '010-2222-2222', 'random_address_2');

INSERT INTO Restaurant VALUES
(1, 'Restaurant_1', '010-1234-1234', 'random_address_3'),
(2, 'Restaurant_2', '010-5678-5678', 'random_address_4');

INSERT INTO Orders VALUES
(1, 1, 1, '2026-04-13 15:57:00', 10000),
(2, 2, 2, '2026-04-13 16:00:00', 13000);

INSERT INTO Delivery VALUES
(1, 1, 'random_human_1', 2),
(2, 2, 'random_human_2', 1);

-- DB Query

SELECT * FROM Orders;
SELECT * FROM Orders ORDER BY total DESC;
SELECT * FROM Orders WHERE total >= 12000;
SELECT * FROM Delivery WHERE status = 1;