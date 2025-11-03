/* HACK 5 */

-- TABLE COUNTRIES
CREATE TABLE countries(
  id_country SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

--TABLE ROLES
CREATE TABLE roles(
  id_role SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

--TABLE TAXES
CREATE TABLE taxes(
  id_tax SERIAL PRIMARY KEY,
  percentage NUMERIC(5,2) NOT NULL
);

--TABLE OFFERS
CREATE TABLE offers(
  id_offer SERIAL PRIMARY KEY,
  status TEXT NOT NULL
);

--TABLE DISCOUNTS
CREATE TABLE discounts(
  id_discount SERIAL PRIMARY KEY,
  status TEXT NOT NULL,
  percentage NUMERIC(5,2) NOT NULL
);

--TABLE PAYMENTS
CREATE TABLE payments(
  id_payment SERIAL PRIMARY KEY,
  type TEXT NOT NULL
);

--TABLE CUSTOMERS
CREATE TABLE customers(
  id_customers SERIAL PRIMARY KEY,
  id_country INTEGER NOT NULL,
  id_role INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  age INTEGER NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  physical_address TEXT NOT NULL,
  FOREIGN KEY (id_country) REFERENCES countries(id_country),
  FOREIGN KEY (id_role) REFERENCES roles(id_role)
);

--TABLE INVOICE_STATUS
CREATE TABLE invoice_status(
  id_invoice_status SERIAL PRIMARY KEY,
  status TEXT NOT NULL
);

--TABLE PRODUCTS
CREATE TABLE products(
  id_product SERIAL PRIMARY KEY,
  id_discount INTEGER NOT NULL,
  id_offer INTEGER NOT NULL,
  id_tax INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  details TEXT NOT NULL,
  minimum_stock INTEGER NOT NULL,
  maximum_stock INTEGER NOT NULL,
  current_stock INTEGER NOT NULL,
  price NUMERIC(5,2) NOT NULL,
  price_with_tax NUMERIC(5,2) NOT NULL,
  FOREIGN KEY (id_discount) REFERENCES discounts(id_discount),
  FOREIGN KEY (id_offer) REFERENCES offers(id_offer),
  FOREIGN KEY (id_tax) REFERENCES taxes(id_tax)
);

--TABLE PRODUCT_CUSTOMERS
CREATE TABLE product_customers(
  id_product INTEGER NOT NULL,
  id_customers INTEGER NOT NULL,
  FOREIGN KEY (id_product) REFERENCES products(id_product),
  FOREIGN KEY (id_customers) REFERENCES customers(id_customers)
);

--TABLE INVOICES
CREATE TABLE invoices(
  id_invoice SERIAL PRIMARY KEY,
  id_customers INTEGER NOT NULL,
  id_payment INTEGER NOT NULL,
  id_invoice_status INTEGER NOT NULL,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total_to_pay NUMERIC(12,2) NOT NULL,
  FOREIGN KEY (id_customers) REFERENCES customers(id_customers),
  FOREIGN KEY (id_payment) REFERENCES payments(id_payment),
  FOREIGN KEY (id_invoice_status) REFERENCES invoice_status(id_invoice_status)
);

--TABLE ORDERS
CREATE TABLE orders(
  id_order SERIAL PRIMARY KEY,
  id_invoice INTEGER NOT NULL,
  id_product INTEGER NOT NULL,
  detail TEXT NOT NULL,
  amount INTEGER NOT NULL,
  price NUMERIC(12,2),
  FOREIGN KEY (id_invoice) REFERENCES invoices(id_invoice),
  FOREIGN KEY (id_product) REFERENCES products(id_product)
);



/* HACK 6 */
-- INSERT

--countries
INSERT INTO countries(name)
VALUES
('Argentina'),
('Venezuela'),
('Colombia');

SELECT * FROM countries;

-- roles
INSERT INTO roles(name)
VALUES
('Ingeniero de Software'),
('Cliente Basico'),
('Cliente Premium');

SELECT * FROM roles;

-- taxes
INSERT INTO taxes (percentage)
VALUES
(10),
(20),
(25);

SELECT * FROM taxes;

-- offers
INSERT INTO offers(status)
VALUES
('active'),
('inactive'),
('active');

SELECT * FROM offers;

-- discounts
INSERT INTO discounts(status, percentage)
VALUES
('active', 10.00),
('active', 15.00),
('inactive', 20.00);

SELECT * FROM discounts;

-- payments
INSERT INTO payments(type)
VALUES
('pago movil'),
('zinli'),
('paypal');

SELECT * FROM payments;

-- customers
INSERT INTO customers(id_country, id_role, name, age, email, password, physical_address)
VALUES
(1, 3, 'Mario Llosa', 26, 'Mario@gmail.com', 'secret*123','Calle Nevermore, Av. 98'),
(2, 1, 'Maryin Suarez', 23, 'suarez45@gmail.com', 'deathwoman*98', 'Elm Street'),
(1, 2, 'Julio Cortazar', 42, 'jul_azar2@gmail.com', 'rayuela326*', 'Calle Nueva Vida');

SELECT * FROM customers;

-- invoice_status
INSERT INTO invoice_status(status)
VALUES
('cancelada'),
('pendiente'),
('anulada');

SELECT * FROM invoice_status;

-- products
INSERT INTO products(id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax)
VALUES
(2, 1, 1, 'laptod dell', 'nueva', 3, 10, 6, 299.99, 309.99),
(3, 2, 2, 'redmi note 14 pro 5g', 'nuevo', 2, 7, 5, 320, 340),
(2, 1, 1, 'microfonos k11', 'nuevo', 3, 10, 5, 29.99, 39.99);

SELECT * FROM products;

-- product_customers
INSERT INTO product_customers(id_product, id_customers)
VALUES
(1, 3),
(2, 2),
(3, 1);

SELECT * FROM product_customers;

-- invoices
-- create 3 invoices
INSERT INTO invoices(id_customers, id_payment, id_invoice_status, total_to_pay)
VALUES
(1,2,1, 299.99);
SELECT * FROM invoices;

INSERT INTO invoices(id_customers, id_payment, id_invoice_status, total_to_pay)
VALUES
(2,3,3, 340.00);
SELECT * FROM invoices;

INSERT INTO invoices(id_customers, id_payment, id_invoice_status, total_to_pay)
VALUES
(3,3,1, 29.99);
SELECT * FROM invoices;

-- orders
INSERT INTO orders(id_invoice, id_product, detail, amount, price)
VALUES
(1, 1, 'Laptod dell nueva', 1, 309);
SELECT * FROM orders;

INSERT INTO orders(id_invoice, id_product, detail, amount, price)
VALUES
(2, 3, 'microfonos k11 ', 1, 39.99);
SELECT * FROM orders;

INSERT INTO orders(id_invoice, id_product, detail, amount, price)
VALUES
(3, 2, 'redmi note 14 pro 5g nuevo', 1, 340.00);
SELECT * FROM orders;

-- Delete first user
DELETE FROM orders where id_invoice = 1;
SELECT * FROM orders;

DELETE FROM invoices where id_customers = 1;
SELECT * FROM invoices;

DELETE FROM product_customers where id_customers = 1;
SELECT * FROM product_customers;

DELETE FROM customers where id_customers = 1;
SELECT * FROM customers;

-- Update last user:
UPDATE customers
SET name = 'Michael Myers',
age = 46,
email = 'm_myers79@gmail.com',
password = 'resurrection*1979',
physical_address = 'halloween street'
WHERE id_customers = 3;
SELECT * FROM customers;

--  Update all taxes:
UPDATE taxes
SET percentage = 5.00 WHERE id_tax = 1;

UPDATE taxes
SET percentage = 15.00 WHERE id_tax = 2;

UPDATE taxes
SET percentage = 25.00 WHERE id_tax = 3;

SELECT * FROM taxes;

-- Update all prices
Update products
SET price = 499.99, 
price_with_tax = 504.99
WHERE id_product = 1;

Update products
SET price = 360, 
price_with_tax = 375
WHERE id_product = 2;

Update products
SET price = 49.99, 
price_with_tax = 54.99
WHERE id_product = 3;

SELECT * FROM products;