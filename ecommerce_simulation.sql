CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50)
)

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price FLOAT
)

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_id FLOAT,
    product_id INT REFERENCES products(product_id)
)

INSERT INTO users
(username, email)
VALUES
('peterquill', 'pquill@email'),
('spiderman', 'spidey@email'),
('ironman', 'stark@email');

INSERT INTO products
(product_name, price)
VALUES
('sunglasses', 12.99),
('waterbottle', 15.99),
('skateboard', 32.99);

INSERT INTO orders
(order_id, product_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 3);

SELECT products.product_name, products.price FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 1;

SELECT * FROM orders;

SELECT SUM(products.price) FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 1;

-- Add a foreign key reference from orders to users
ALTER TABLE users
ADD COLUMN order_id INT references orders(id);

UPDATE users
SET order_id = 1
WHERE user_id = 1;

UPDATE users
SET order_id = 2
WHERE user_id = 2;

UPDATE users
SET order_id = 3
WHERE user_id = 3;

-- Update the orders table to link a user to each order
ALTER TABLE orders
ADD COLUMN user_id INT references users(user_id);

UPDATE orders
SET user_id = 1
WHERE order_id = 1;

UPDATE orders
SET user_id = 2
WHERE order_id = 2;

UPDATE orders
SET user_id = 3
WHERE order_id = 3;


-- Get all orders for a user
SELECT products.product_name FROM products
JOIN orders ON orders.product_id = products.product_id
JOIN users ON users.user_id = orders.user_id
WHERE users.user_id = 1;

-- Get how many orders each user has
SELECT orders.user_id, COUNT(*) FROM orders
GROUP BY user_id;
