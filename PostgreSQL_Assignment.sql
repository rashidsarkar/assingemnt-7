-- Active: 1742838947367@@127.0.0.1@5432@bookstore_db

-- Creating the 'books' table 
CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    price DECIMAL(10,2) CHECK  (price > 0),
    stock INT  CHECK  (stock >= 0),
    published_year  INT  not NULL
);


INSERT INTO books (title, author, price, stock, published_year) 
VALUES 
  ('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, '1999'),
  ('Clean Code', 'Robert C. Martin', 35.00, 5, '2008'),
  ('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, '2014'),
  ('Refactoring', 'Martin Fowler', 50.00, 3, '1999'),
  ('Database Design Principles', 'Jane Smith', 20.00, 0, '2018');
-- problem 1
SELECT title FROM books
WHERE stock = 0;

-- problem 2
SELECT * FROM books 
WHERE price  = (SELECT max(price) FROM books)














-- Table: customers  
-- This table stores customer information, including their name, email,  
-- and the date they joined. 
CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) ,
    email VARCHAR(50) ,
    joined_date  DATE not NULL DEFAULT CURRENT_DATE 
);
-- Table: orders  
-- This table stores order records, linking customers with books.  
-- It tracks which customer ordered which book, the quantity ordered,  
-- and the date of the order. 
INSERT INTO customers (name, email,joined_date)

VALUES 

 ('Alice', 'alice@email.com', '2023-01-10'),
  ('Bob', 'bob@email.com', '2022-05-15'),
  ('Charlie', 'charlie@email.com', '2023-06-20');
  SELECT * FROM customers;



CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INT,
    book_id INT,
    quantity INT check (quantity > 0),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
     -- Establishing foreign key relationships  
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
SELECT * FROM orders;
INSERT INTO orders (customer_id, book_id, quantity,order_date)
VALUES
(1,2,1,'2024-03-10'),
(2,1,1,'2024-02-20'),
(1,3,2,'2024-03-05');
-- problem 3
SELECT name,  sum(orders.quantity) as total_orders     FROM
 orders JOIN customers ON  orders.customer_id =  customers.id
GROUP BY name;

SELECT sum(books.price * orders.quantity ) as total_revenue
 FROM orders
  JOIN books on orders.book_id=books.id;

SELECT  customers.name,  sum(orders.quantity)  as orders_count  
 FROM orders JOIN customers on orders.customer_id=customers.id
GROUP BY customers.name HAVING sum(orders.quantity  ) > 1

SELECT  ROUND( avg(price),2) as avg_book_price  FROM books 

UPDATE books
SET price =  price *1.10
WHERE published_year <2000;
SELECT * FROM books WHERE published_year < 2000;

SELECT * FROM customers;
DELETE FROM customers 
WHERE id not IN(SELECT )

