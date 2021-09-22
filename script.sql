--Que 1:
SELECT * 
FROM customers
LIMIT 10;

SELECT * 
FROM orders
LIMIT 10;


SELECT * 
FROM books
LIMIT 10;

--Que 2:

SELECT *
FROM pg_indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_indexes
WHERE tablename = 'orders';

SELECT *
FROM pg_indexes
WHERE tablename = 'books';

--Que 3:
EXPLAIN ANALYZE SELECT customer_id, quantity 
FROM orders
WHERE quantity > 18;

--Que 4:
 

CREATE INDEX orders_customer_id_quantity_idx ON orders(customer_id, quantity)
WHERE quantity > 18;

--Que 5:
EXPLAIN ANALYZE SELECT customer_id, quantity 
FROM orders
WHERE quantity > 18;


--Que 6:
ALTER TABLE customers
ADD CONSTRAINT customers_pkey
PRIMARY KEY (customer_id);


SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';


EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

--Que 7:

CLUSTER customers USING customers_pkey;


--Que 8:

CREATE INDEX orders_customer_id_book_id_idx ON orders(customer_id, book_id);



--Que 9:
DROP INDEX IF EXISTS orders_customer_id_book_id_idx;


CREATE INDEX orders_customer_id_book_id_idx ON orders(customer_id, book_id);

--Que 10:

CREATE INDEX books_author_title_idx ON books(author, title);

--Que 11:

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE (quantity * price_base) > 100;

--Que 12:

CREATE INDEX orders_total_Price_idx ON orders ((quantity * price_base));

--Que 13:

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE (quantity * price_base) > 100;


--Que 14:

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;


DROP INDEX IF EXISTS books_author_idx;

DROP INDEX IF EXISTS orders_customer_id_quantity;




CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);



SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;
