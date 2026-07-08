-- 02-insert-data.sql
-- Run after 01-create-schema.sql

BEGIN;

INSERT INTO departments(department_name,location)
SELECT d,l FROM (VALUES
('Engineering','Bangalore'),
('HR','Delhi'),
('Finance','Mumbai'),
('Sales','Pune'),
('Marketing','Hyderabad'),
('Support','Noida'),
('QA','Chennai'),
('DevOps','Gurugram'),
('Admin','Kolkata'),
('Research','Ahmedabad')) t(d,l);

INSERT INTO categories(category_name)
VALUES ('Electronics'),('Books'),('Clothing'),('Sports'),
('Furniture'),('Beauty'),('Groceries'),('Toys');

INSERT INTO projects(project_name,start_date,end_date,budget)
SELECT 'Project-'||g,
CURRENT_DATE-(g*20),
CURRENT_DATE+(g*40),
500000+g*25000
FROM generate_series(1,20) g;

INSERT INTO employees(first_name,last_name,email,phone,gender,salary,hire_date,department_id)
SELECT
'Emp'||g,
'Last'||g,
'emp'||g||'@company.com',
'98'||LPAD(g::text,8,'0'),
CASE WHEN g%2=0 THEN 'Male' ELSE 'Female' END,
35000+(random()*90000)::int,
CURRENT_DATE-((random()*2000)::int),
((g-1)%10)+1
FROM generate_series(1,100) g;

UPDATE employees
SET manager_id=((employee_id-1)/10)*10+1
WHERE employee_id%10<>1;

INSERT INTO employee_projects(employee_id,project_id,assigned_date)
SELECT DISTINCT
(random()*99+1)::int,
(random()*19+1)::int,
CURRENT_DATE-((random()*500)::int)
FROM generate_series(1,400)
ON CONFLICT DO NOTHING;

INSERT INTO products(product_name,category_id,price,stock)
SELECT
'Product-'||g,
((g-1)%8)+1,
round((100+random()*4900)::numeric,2),
(random()*500)::int
FROM generate_series(1,100) g;

INSERT INTO customers(first_name,last_name,email,city,state,signup_date)
SELECT
'Customer'||g,
'Last'||g,
'customer'||g||'@mail.com',
(ARRAY['Delhi','Mumbai','Pune','Bangalore','Hyderabad','Noida','Chennai','Kolkata'])[(random()*7+1)::int],
(ARRAY['Delhi','Maharashtra','Maharashtra','Karnataka','Telangana','UP','Tamil Nadu','West Bengal'])[(random()*7+1)::int],
CURRENT_DATE-((random()*1200)::int)
FROM generate_series(1,200) g;

INSERT INTO orders(customer_id,order_date,status)
SELECT
(random()*199+1)::int,
CURRENT_DATE-((random()*365)::int),
(ARRAY['Pending','Completed','Cancelled','Shipped'])[(random()*3+1)::int]
FROM generate_series(1,500);

INSERT INTO order_items(order_id,product_id,quantity,price)
SELECT
(random()*499+1)::int,
(random()*99+1)::int,
(random()*4+1)::int,
round((100+random()*4900)::numeric,2)
FROM generate_series(1,1500);

INSERT INTO payments(order_id,payment_date,payment_method,amount,payment_status)
SELECT
o.order_id,
o.order_date+((random()*5)::int),
(ARRAY['UPI','Card','NetBanking','Cash'])[(random()*3+1)::int],
COALESCE((SELECT round(SUM(quantity*price)::numeric,2) FROM order_items oi WHERE oi.order_id=o.order_id),0),
(ARRAY['SUCCESS','FAILED','PENDING'])[(random()*2+1)::int]
FROM orders o;

COMMIT;
