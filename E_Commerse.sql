create database E_Commerse;
use E_Commerse;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(15),
city VARCHAR(50),
state VARCHAR(50),
join_date DATE
);

INSERT INTO customers VALUES
(101,'Aarav Sharma','aarav@gmail.com','9876543210','Chennai','Tamil Nadu','2023-01-15'),
(102,'Priya Singh','priya@gmail.com','9876543211','Bangalore','Karnataka','2023-03-10'),
(103,'Rahul Kumar','rahul@gmail.com','9876543212','Mumbai','Maharashtra','2023-05-20'),
(104,'Sneha Patel','sneha@gmail.com','9876543213','Hyderabad','Telangana','2023-06-12'),
(105,'Vikram Rao','vikram@gmail.com','9876543214','Delhi','Delhi','2023-08-01'),
(106,'Meera Nair','meera@gmail.com','9876543215','Kochi','Kerala','2023-09-18'),
(107,'Karan Das','karan@gmail.com','9876543216','Pune','Maharashtra','2024-01-05'),
(108,'Ananya Roy','ananya@gmail.com','9876543217','Kolkata','West Bengal','2024-02-14');

CREATE TABLE categories(
category_id INT PRIMARY KEY,
category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Fashion'),
(3,'Home Appliances'),
(4,'Books'),
(5,'Sports');

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category_id INT,
price DECIMAL(10,2),
stock INT,
FOREIGN KEY(category_id)
REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(201,'Laptop',1,65000,20),
(202,'Smartphone',1,25000,35),
(203,'Headphones',1,3000,60),
(204,'T-Shirt',2,800,100),
(205,'Jeans',2,1800,80),
(206,'Mixer Grinder',3,4500,30),
(207,'Microwave Oven',3,12000,15),
(208,'SQL Book',4,650,50),
(209,'Football',5,1200,40),
(210,'Cricket Bat',5,2500,25);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(20),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(301,101,'2024-01-10','Delivered'),
(302,102,'2024-01-15','Delivered'),
(303,103,'2024-02-05','Cancelled'),
(304,104,'2024-02-20','Delivered'),
(305,105,'2024-03-01','Pending'),
(306,101,'2024-03-15','Delivered'),
(307,106,'2024-04-10','Delivered'),
(308,107,'2024-04-22','Delivered'),
(309,108,'2024-05-03','Pending'),
(310,103,'2024-05-15','Delivered');

CREATE TABLE order_items(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY(order_id)
REFERENCES orders(order_id),
FOREIGN KEY(product_id)
REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1,301,201,1),
(2,301,203,2),
(3,302,204,3),
(4,303,202,1),
(5,304,207,1),
(6,305,208,2),
(7,306,205,2),
(8,307,206,1),
(9,308,210,1),
(10,309,209,2),
(11,310,202,1),
(12,310,203,1);

CREATE TABLE payments(
payment_id INT PRIMARY KEY,
order_id INT,
payment_method VARCHAR(30),
payment_status VARCHAR(20),
payment_date DATE,
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
);

INSERT INTO payments VALUES
(401,301,'UPI','Paid','2024-01-10'),
(402,302,'Credit Card','Paid','2024-01-15'),
(403,303,'UPI','Refunded','2024-02-05'),
(404,304,'Debit Card','Paid','2024-02-20'),
(405,305,'Cash on Delivery','Pending','2024-03-01'),
(406,306,'UPI','Paid','2024-03-15'),
(407,307,'Net Banking','Paid','2024-04-10'),
(408,308,'Credit Card','Paid','2024-04-22'),
(409,309,'Cash on Delivery','Pending','2024-05-03'),
(410,310,'UPI','Paid','2024-05-15');

-- > DISPLAY ALL CUSTOMER DETAILS.
select * from customers;

-- > DISPLAY ALL PRODUCT DETAILS.
select * from products;

-- > DISPLAY ALL CATEGORY DETAILS.
select * from categories;

-- > DISPLAY ALL ORDER DETAILS.
select * from order_items;

-- > DISPLAY ALL PAYMENT DETAILS.
select * from payments;

-- > DISPLAY THE NAMES AND EMAIL ADDRESSES OF ALL CUSTOMERS.
select customer_name,email from customers;

-- > DISPLAY THE NAMES AND PRICES OF ALL PRODUCTS.
select product_name,price from products;

-- > DISPLAY THE UNIQUE CITIES WHERE CUSTOMERS LIVE.
select distinct city from customers;

-- > DISPLAY THE PRODUCTS WHOSE PRICE IS GREATER THAN ₹10,000.
select * from products where price>10000;

-- > DISPLAY THE PRODUCTS WHOSE PRICE IS BETWEEN ₹2,000 AND ₹15,000.
select * from products where price between 2000 and 15000;

-- > DISPLAY THE CUSTOMERS WHO BELONG TO TAMIL NADU.
select * from customers where state='tamil nadu';

-- > DISPLAY THE PRODUCTS WHOSE NAMES START WITH THE LETTER 'S'.
select * from products where product_name like'S%';

-- > DISPLAY THE PRODUCTS WHOSE NAMES END WITH THE LETTER 'E'.
select * from products where product_name like'%E';

-- > DISPLAY ALL DELIVERED ORDERS.
select * from orders where order_status='delivered';

-- > DISPLAY ALL PRODUCTS SORTED BY PRICE IN DESCENDING ORDER.
select * from products order by price desc;

-- > DISPLAY THE TOP 5 MOST EXPENSIVE PRODUCTS.
select * from products order by price desc limit 5;

-- > DISPLAY THE TOP 5 CHEAPEST PRODUCTS.
select * from products order by price asc limit 5;

-- > DISPLAY THE PRODUCTS WHOSE STOCK IS LESS THAN 20.
select * from products where stock<20;

-- > DISPLAY THE PRODUCTS WHOSE STOCK IS GREATER THAN 50.
select * from products where stock>50;

-- > DISPLAY THE CUSTOMERS WHO JOINED AFTER '2023-06-01'.
select * from customers where join_date>2023-06-01;

-- > DISPLAY ALL ORDERS PLACED IN MARCH 2024.
select * from orders where order_date between '2024-03-01' and '2024-04-01';

-- > DISPLAY THE CUSTOMERS WHO BELONG TO EITHER CHENNAI OR BANGALORE.
select * from customers where city='chennai' or 'bangalore';

-- > DISPLAY ALL PAYMENTS MADE USING UPI.
select * from payments where payment_method='upi';

-- > DISPLAY ALL ORDERS WHOSE STATUS IS EITHER 'PENDING' OR 'CANCELLED'.
select * from orders where order_status='pending';

-- > DISPLAY THE PRODUCTS WHOSE PRICES ARE NOT BETWEEN ₹5,000 AND ₹20,000.
select * from products where price not between 5000 and 20000;

-- > DISPLAY THE TOTAL NUMBER OF CUSTOMERS.
select count(customer_id) as total_customers from customers;

-- > DISPLAY THE TOTAL NUMBER OF PRODUCTS.
select count(product_name) as total_products from products;

-- > DISPLAY THE TOTAL NUMBER OF ORDERS.
select count(order_id) as total_orders from orders;

-- > DISPLAY THE TOTAL AVAILABLE STOCK OF ALL PRODUCTS.
select sum(stock) as total_stock from products;

-- > DISPLAY THE AVERAGE PRODUCT PRICE.
select avg(price) as average_price from products;

-- > DISPLAY THE HIGHEST-PRICED PRODUCT.
select max(price) as highest_product from products ;

-- > DISPLAY THE LOWEST-PRICED PRODUCT.
select min(price) as highest_product from products ;

-- > DISPLAY THE TOTAL QUANTITY OF PRODUCTS SOLD.
select sum(quantity) as total_products_sold from order_items;

-- > DISPLAY THE TOTAL NUMBER OF DELIVERED ORDERS.
select count(order_id) from orders where order_status='delivered';

-- > DISPLAY THE TOTAL NUMBER OF PENDING PAYMENTS.
select count(order_id) from orders where order_status='pending';

-- > DISPLAY THE TOTAL NUMBER OF PRODUCTS AVAILABLE IN EACH CATEGORY.
select category_id,count(stock) from products group by category_id;
 
-- > DISPLAY THE AVERAGE PRICE OF PRODUCTS IN EACH CATEGORY.
select category_id,avg(price) as average_price from products group by category_id;

-- > DISPLAY THE TOTAL QUANTITY SOLD FOR EACH PRODUCT.
select product_id,sum(quantity) as total_product from order_items group by product_id;

-- > DISPLAY THE TOTAL NUMBER OF ORDERS PLACED BY EACH CUSTOMER.
select customer_id,count(order_id)  from orders group by customer_id;

-- > DISPLAY THE TOTAL INVENTORY VALUE OF EACH PRODUCT.
select product_name,sum(price*stock) as total_revenue from products group by product_name;

-- > DISPLAY THE PAYMENT METHODS THAT HAVE BEEN USED MORE THAN ONCE.
select payment_method,count(*) from payments group by payment_method having count(*)>1;

-- > DISPLAY THE CUSTOMERS WHO HAVE PLACED MORE THAN ONE ORDER.
select customer_id,count(order_id) from orders group by customer_id having count(order_id)>1;

-- > DISPLAY THE CATEGORIES THAT CONTAIN MORE THAN TWO PRODUCTS.
select category_id,count(product_name) from products group by category_id having count(product_name)>2 ;

-- > DISPLAY THE PRODUCTS WHOSE TOTAL SOLD QUANTITY IS GREATER THAN TWO.
select product_id,sum(quantity) from order_items group by product_id having sum(quantity)>2 ;

-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THEIR ORDER ID.
select customers.customer_name,orders.order_id
from customers
join orders
on customers.customer_id=orders.customer_id;

-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THEIR ORDER DATE.
select customers.customer_name,orders.order_date
from customers
join orders
on customers.customer_id=orders.customer_id;

-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THE STATUS OF THEIR ORDERS.
select customers.customer_name,orders.order_status
from customers
join orders
on customers.customer_id=orders.customer_id;

-- > DISPLAY EACH PRODUCT ALONG WITH ITS CATEGORY NAME.
select products.product_name,categories.category_name
from products
join categories
on products.category_id=categories.category_id;

-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THE PRODUCTS THEY PURCHASED.
select c.customer_name,p.product_name
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
join products p
on oi.product_id=p.product_id;

-- > DISPLAY EACH CUSTOMER'S NAME, PRODUCT NAME, AND QUANTITY PURCHASED.
select c.customer_name,p.product_name,oi.quantity
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
join products p
on oi.product_id=p.product_id;


-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THEIR PAYMENT METHOD.
select c.customer_name,pa.payment_method
from customers c
join orders o
on c.customer_id=o.customer_id
join payments pa
on o.order_id=pa.order_id;

-- > DISPLAY EACH CUSTOMER'S NAME ALONG WITH THEIR PAYMENT STATUS.
select c.customer_name,pa.payment_status
from customers c
join orders o
on c.customer_id=o.customer_id
join payments pa
on o.order_id=pa.order_id;

-- > DISPLAY ALL PRODUCTS THAT HAVE NEVER BEEN ORDERED.
select p.product_name
from products p
left join order_items oi
on p.product_id=oi.product_id
where oi.product_id is null;

-- > DISPLAY ALL CUSTOMERS WHO HAVE NEVER PLACED AN ORDER.
select c.customer_name
from customers c
left join orders o
on c.customer_id=o.customer_id
where o.order_id is null;


-- > DISPLAY ALL ORDERS THAT DO NOT HAVE A SUCCESSFUL PAYMENT.
select o.order_id
from orders o
 join payments p
on o.order_id=p.order_id
where payment_status <> 'successful';
select * from payments;

-- > DISPLAY THE TOTAL NUMBER OF ORDERS PLACED BY EACH CUSTOMER.
select c.customer_name,count(o.order_id)
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_name;

-- > DISPLAY THE CATEGORY NAME AND THE TOTAL NUMBER OF PRODUCTS AVAILABLE IN EACH CATEGORY.
select c.category_name,count(p.product_id)
from categories c
join products p
on c.category_id=p.category_id
group by c.category_name;

-- > DISPLAY EVERY PRODUCT WITH EVERY CATEGORY USING CROSS JOIN.
select p.product_name,c.category_name
from products p
cross join categories c;

-- > DISPLAY THE MOST EXPENSIVE PRODUCT.
select product_name from products where price =(select max(price) from products);

-- > DISPLAY THE SECOND MOST EXPENSIVE PRODUCT.
select product_name from products where price = (select max(price) from products where price < (select max(price) from products));

-- > DISPLAY THE PRODUCTS WHOSE PRICES ARE GREATER THAN THE AVERAGE PRODUCT PRICE.
select * from products where price > (select avg(price) as average_price from products);

-- > DISPLAY THE CUSTOMER WHO HAS PLACED THE HIGHEST NUMBER OF ORDERS.
select customer_id
from orders
group by customer_id
having count(order_id) = (
    select max(total_orders)
    from (
        select count(order_id) as total_orders
        from orders
        group by customer_id
    ) as t
);

-- > DISPLAY THE PRODUCTS THAT HAVE NEVER BEEN ORDERED USING A SUBQUERY.
select product_name from products where product_id not in(select product_id from order_items);

-- > DISPLAY THE PRODUCTS WHOSE PRICES ARE GREATER THAN ALL PRODUCTS IN THE BOOKS CATEGORY.
select product_name from products where price >(select max(p.price)
from products p
join categories c
on p.category_id=c.category_id
where c.category_name='Books');

-- > DISPLAY THE PRODUCTS WHOSE PRICES ARE GREATER THAN ANY PRODUCT IN THE FASHION CATEGORY.
select product_name from products where price >(select min(p.price)
from products p
join categories c
on p.category_id=c.category_id
where c.category_name='Fashion');

-- > CREATE A VIEW TO DISPLAY CUSTOMER ORDER DETAILS.
create view vworder_details as 
select c.customer_name,o.order_date,o.order_status
from customers c
join orders o
on c.customer_id=o.customer_id;
select * from vworder_details;

-- > CREATE A STORED PROCEDURE TO DISPLAY ALL ORDERS PLACED BY A GIVEN CUSTOMER.
delimiter $$
create procedure order_details (in p_customer_id int)
begin 
select * from orders
where customer_id = p_customer_id;
end $$
delimiter ;
call order_details(102);

-- > CREATE A FUNCTION TO CALCULATE THE GST (18%) FOR A GIVEN PRODUCT PRICE.
delimiter %%
create function gst (amount decimal(10,2))
returns decimal(10,2)
deterministic
begin
return amount * 0.18;
end %%
delimiter ;
select gst(30);


-- > CREATE A TEMPORARY TABLE TO STORE MONTHLY SALES DETAILS.
create temporary table temp_monthly_sales as
select month(o.order_date) as month,
       sum(oi.quantity * p.price) as total_sales
from orders o
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id
group by month(o.order_date);

