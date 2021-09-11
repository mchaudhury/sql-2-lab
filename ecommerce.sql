CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(20),
  user_email VARCHAR(100)
);

CREATE TABLE products(
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(40),
  product_description VARCHAR(560),
  product_image text,
  product_price NUMERIC(6,2),
  product_isDiscount BOOLEAN,
  product_discountedPrice NUMERIC(6,2)
);

CREATE TABLE cart(
  cart_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  product_id INT NOT NULL REFERENCES products(product_id),
  cart_item_quantity INT
);


-- 3 Users
INSERT INTO users(user_name, user_email)
VALUES
('Adam', 'adam@gmail.com'), 
('John', 'john@yahoo.com'),
('Jack', 'jack@gmail.com');

-- 3 Products

INSERT INTO products(product_name, product_description, product_image, product_price, product_isdiscount, product_discountedprice)
VALUES('Apple', 'Buy now phone works good yes yes', 'website.com/src/images/apple.png', 565.14, False, NULL),
('Motorolla', 'Buy now graphics card big wow yes yes', 'website.com/src/images/motorolla.png', 64.55, False, NULL)
('Samsung', 'Buy now music to the ears yes yes', 'website.com/src/images/samsung.png', 345.64, FALSE, NULL),
('Nokia', 'Buy now use once at a party and never again yes yes', 'website.com/src/images/nokia.png', 79.82, FALSE, NULL),
('Dell', 'Buy now become pirate yes yes', 'website.com/src/images/dell.png', 82.99, FALSE, 23.99)


-- USERS 2 Products

INSERT INTO cart(user_id,product_id, cart_item_quantity)
VALUES
(1, 1, 1), (1,5,3), (2,2,1), (2,3,1), (3,4,1), (3,3,1); 

-- QUERY TO GRAB ALL OF THE ITEMS IN THE CART BY USERS ID OF 1 Displaying Product ID 
SELECT c.product_id "Users Cart"
FROM cart c
WHERE product_id IN (
  SELECT product_id FROM products WHERE user_id = 1
);

-- QUERY TO GRAB ALL OF THE ITEMS IN THE CART BY USER ID DISPLAYING AS PRODUCT NAME AND PRODUCT ID 

SELECT product_name, p.product_id "Product ID FOR DEVS", user_name
FROM products p
JOIN cart
ON cart.product_id = p.product_id
JOIN users
ON users.user_id = cart.user_id
WHERE users.user_id = 3;


-- Get products in all carts with all the users’ information
SELECT p.product_name "Product" , c.cart_item_quantity "Cart Quantity", u.user_name "user", u.user_email "users Email" , u.user_id "User ID"
FROM products p
JOIN cart c
ON c.product_id = p.product_id
JOIN users u
ON u.user_id = c.user_id;


-- Get the total cost of an order (sum the price of all products on an cart).
SELECT SUM(p.product_price) "Total cost of your purchase"
FROM products p
JOIN cart c
ON c.product_id = p.product_id
JOIN users u
ON u.user_id = c.user_id
WHERE u.user_id = 1;


-- Update the quantity of a product in a user’s cart where the user’s id is 2
UPDATE cart
SET cart_item_quantity = 2
WHERE user_id = 2 AND product_id = 1;