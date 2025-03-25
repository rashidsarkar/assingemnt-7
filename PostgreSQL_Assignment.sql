-- Creating the 'books' table to store book details
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT CHECK (stock >= 0),
    published_year INT NOT NULL
);

-- Inserting book records into the 'books' table
INSERT INTO books (title, author, price, stock, published_year) 
VALUES 
  ('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
  ('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
  ('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
  ('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
  ('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);


-- Creating the 'customers' table to store customer information
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    joined_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Inserting customer records
INSERT INTO customers (name, email, joined_date)
VALUES 
  ('Alice', 'alice@email.com', '2023-01-10'),
  ('Bob', 'bob@email.com', '2022-05-15'),
  ('Charlie', 'charlie@email.com', '2023-06-20');
  INSERT INTO customers (name, email) 
VALUES ('John Doe', 'john.doe@email.com');

-- Creating the 'orders' table to store order records
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    book_id INT,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Inserting order records
INSERT INTO orders (customer_id, book_id, quantity, order_date)
VALUES
    (1, 2, 1, '2024-03-10'),
    (2, 1, 1, '2024-02-20'),
    (1, 3, 2, '2024-03-05');


-- Problem 1: Select books that are out of stock
SELECT title FROM books
WHERE stock = 0;

-- Problem 2: Select the book with the highest price
SELECT * FROM books 
WHERE price = (SELECT MAX(price) FROM books);

-- Problem 3: Retrieve total orders placed by each customer
SELECT customers.name, SUM(orders.quantity) AS total_orders
FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name;

-- Problem 4: Calculate the total revenue generated from all orders
SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;

-- Problem 5: Retrieve customers who ordered more than 1 book
SELECT customers.name, SUM(orders.quantity) AS orders_count
FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name
HAVING SUM(orders.quantity) > 1;

-- Problem 6: Calculate the average book price (rounded to 2 decimal places)
SELECT ROUND(AVG(price), 2) AS avg_book_price FROM books;

-- Problem 7: Increase the price of books published before the year 2000 by 10%
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;

-- Problem 8: Delete customers who have never placed an order
DELETE FROM customers 
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- Selecting data to verify changes
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM books;
