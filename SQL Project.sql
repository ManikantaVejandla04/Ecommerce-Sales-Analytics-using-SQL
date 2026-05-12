-- ============================================================
-- PROJECT: E-Commerce Sales Analytics

CREATE DATABASE Ecommerce

USE Ecommerce;

CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(100),
    email           VARCHAR(150),
    city            VARCHAR(100),
    state           VARCHAR(100),
    country         VARCHAR(50),
    signup_date     DATE,
    segment         VARCHAR(50)
);
-- Customers
INSERT INTO customers VALUES
(1,  'Ravi Kumar',      'ravi@email.com',    'Hyderabad',  'Telangana',     'India', '2022-01-15', 'VIP'),
(2,  'Priya Sharma',    'priya@email.com',   'Mumbai',     'Maharashtra',   'India', '2022-03-10', 'Regular'),
(3,  'Arjun Nair',      'arjun@email.com',   'Bangalore',  'Karnataka',     'India', '2022-05-22', 'New'),
(4,  'Sneha Patel',     'sneha@email.com',   'Ahmedabad',  'Gujarat',       'India', '2022-07-01', 'Regular'),
(5,  'Ankit Joshi',     'ankit@email.com',   'Delhi',      'Delhi',         'India', '2022-09-14', 'VIP'),
(6,  'Divya Menon',     'divya@email.com',   'Chennai',    'Tamil Nadu',    'India', '2023-01-05', 'New'),
(7,  'Suresh Rao',      'suresh@email.com',  'Pune',       'Maharashtra',   'India', '2023-02-18', 'Regular'),
(8,  'Meera Singh',     'meera@email.com',   'Kolkata',    'West Bengal',   'India', '2023-04-09', 'VIP'),
(9,  'Vikram Reddy',    'vikram@email.com',  'Hyderabad',  'Telangana',     'India', '2023-06-23', 'New'),
(10, 'Kavitha Iyer',    'kavitha@email.com', 'Kochi',      'Kerala',        'India', '2023-08-30', 'Regular');

select * from customers;

CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(150),
    category        VARCHAR(100),
    sub_category    VARCHAR(100),
    unit_price      DECIMAL(10,2),
    unit_cost       DECIMAL(10,2)
);
-- Products
INSERT INTO products VALUES
(1,  'iPhone 14',           'Electronics',  'Smartphones',      79999, 65000),
(2,  'Samsung Galaxy S23',  'Electronics',  'Smartphones',      69999, 55000),
(3,  'Sony Headphones WH',  'Electronics',  'Audio',            14999, 9000),
(4,  'Dell Laptop 15',      'Electronics',  'Laptops',          65000, 50000),
(5,  'Nike Running Shoes',  'Apparel',      'Footwear',          8999,  5000),
(6,  'Levis Jeans 511',   'Apparel',      'Clothing',          3999,  2000),
(7,  'Instant Pot 6Qt',     'Home & Kitchen','Appliances',       8500,  5500),
(8,  'Bosch Mixer Pro',     'Home & Kitchen','Appliances',       6999,  4500),
(9,  'Harry Potter Set',    'Books',        'Fiction',           1999,   800),
(10, 'Python Programming',  'Books',        'Tech Books',        899,    350),
(11, 'Yoga Mat Premium',    'Sports',       'Fitness',           2499,  1200),
(12, 'Cricket Bat SG',      'Sports',       'Cricket',           3500,  2000);

select * from products;


CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    order_date      DATE,
    ship_date       DATE,
    status          VARCHAR(50),   -- 'Delivered', 'Returned', 'Cancelled', 'Pending'
    payment_method  VARCHAR(50),
    discount_pct    DECIMAL(5,2)   -- e.g. 0.10 = 10%
)

INSERT INTO orders VALUES
(101, 1,  '2023-01-10', '2023-01-14', 'Delivered', 'Credit Card', 0.00),
(102, 2,  '2023-02-05', '2023-02-09', 'Delivered', 'UPI',         0.05),
(103, 3,  '2023-02-20', '2023-02-25', 'Returned',  'Debit Card',  0.00),
(104, 4,  '2023-03-15', '2023-03-18', 'Delivered', 'UPI',         0.10),
(105, 5,  '2023-04-01', '2023-04-05', 'Delivered', 'Credit Card', 0.15),
(106, 6,  '2023-05-12', '2023-05-17', 'Cancelled', 'COD',         0.00),
(107, 7,  '2023-06-08', '2023-06-12', 'Delivered', 'UPI',         0.05),
(108, 8,  '2023-07-20', '2023-07-24', 'Delivered', 'Credit Card', 0.10),
(109, 9,  '2023-08-03', '2023-08-07', 'Delivered', 'Debit Card',  0.00),
(110, 10, '2023-09-25', '2023-09-29', 'Delivered', 'UPI',         0.05),
(111, 1,  '2023-10-10', '2023-10-14', 'Delivered', 'Credit Card', 0.10),
(112, 2,  '2023-11-05', '2023-11-08', 'Returned',  'UPI',         0.00),
(113, 5,  '2023-11-20', '2023-11-23', 'Delivered', 'Credit Card', 0.20),
(114, 3,  '2023-12-01', '2023-12-05', 'Delivered', 'COD',         0.00),
(115, 8,  '2023-12-18', '2023-12-22', 'Delivered', 'Credit Card', 0.15);

select * from orders;

CREATE TABLE order_items (
    item_id         INT PRIMARY KEY,
    order_id        INT,
    product_id      INT,
    quantity        INT,
    unit_price      DECIMAL(10,2),
    discount_pct    DECIMAL(5,2)
)
INSERT INTO order_items VALUES
(1001, 101, 1,  1, 79999, 0.00),
(1002, 101, 3,  2, 14999, 0.00),
(1003, 102, 5,  1,  8999, 0.05),
(1004, 102, 6,  2,  3999, 0.05),
(1005, 103, 4,  1, 65000, 0.00),
(1006, 104, 7,  1,  8500, 0.10),
(1007, 104, 8,  1,  6999, 0.10),
(1008, 105, 2,  1, 69999, 0.15),
(1009, 105, 3,  1, 14999, 0.15),
(1010, 106, 9,  3,  1999, 0.00),
(1011, 107, 10, 2,   899, 0.05),
(1012, 107, 11, 1,  2499, 0.05),
(1013, 108, 1,  1, 79999, 0.10),
(1014, 108, 4,  1, 65000, 0.10),
(1015, 109, 12, 2,  3500, 0.00),
(1016, 110, 5,  1,  8999, 0.05),
(1017, 110, 6,  1,  3999, 0.05),
(1018, 111, 2,  1, 69999, 0.10),
(1019, 111, 3,  1, 14999, 0.10),
(1020, 112, 7,  1,  8500, 0.00),
(1021, 113, 1,  2, 79999, 0.20),
(1022, 113, 4,  1, 65000, 0.20),
(1023, 114, 9,  2,  1999, 0.00),
(1024, 114, 10, 1,   899, 0.00),
(1025, 115, 1,  1, 79999, 0.15),
(1026, 115, 2,  1, 69999, 0.15);

select * from order_items;





-- Q1: Total Revenue (after discounts)
SELECT
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered';


-- Q2: Monthly Revenue Trend
SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

-- Q3: Revenue by Product Category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) /
        SUM(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct))) OVER () * 100 AS revenue_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- Q4: Top 5 Best-Selling Products
SELECT TOP 5
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;

-- Q5: Gross Profit & Profit Margin by Category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue,
    ROUND(SUM(oi.quantity * p.unit_cost), 2) AS total_cost,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct))
          - SUM(oi.quantity * p.unit_cost), 2) AS gross_profit,
    ROUND((SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct))
           - SUM(oi.quantity * p.unit_cost))
          / NULLIF(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 0) * 100, 2) AS profit_margin_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY gross_profit DESC;

-- Q6: Customer Lifetime Value (CLV)
SELECT
    c.customer_id,
    c.customer_name,
    c.segment,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY lifetime_value DESC;

-- Q7: Average Order Value (AOV) by Customer Segment
SELECT
    c.segment,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct))
          / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.segment
ORDER BY avg_order_value DESC;


-- Q8: Top Cities by Revenue
SELECT
    c.city,
    c.state,
    COUNT(DISTINCT c.customer_id) AS customers,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.city, c.state
ORDER BY revenue DESC;

-- Q9: RFM Analysis (Recency, Frequency, Monetary)
WITH rfm_base AS (
    SELECT
        c.customer_id,
        c.customer_name,
        DATEDIFF(DAY, MAX(o.order_date), '2024-01-01') AS recency_days,
        COUNT(DISTINCT o.order_id)                 AS frequency,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
)
SELECT *,
    CASE
        WHEN recency_days <= 90  AND frequency >= 3 AND monetary >= 100000 THEN 'Champions'
        WHEN recency_days <= 180 AND frequency >= 2                        THEN 'Loyal Customers'
        WHEN recency_days <= 90                                            THEN 'Recent Customers'
        WHEN recency_days > 365                                            THEN 'Lost Customers'
        ELSE 'At Risk'
    END AS rfm_segment
FROM rfm_base
ORDER BY monetary DESC;

-- Q10: New vs Returning Customers per Month
    -- Step 1: First order date per customer
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
)
      -- Step 2: Main query
SELECT
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    COUNT(DISTINCT CASE 
        WHEN o.order_date = f.first_order_date 
        THEN o.customer_id 
    END) AS new_customers,
    COUNT(DISTINCT CASE 
        WHEN o.order_date > f.first_order_date 
        THEN o.customer_id 
    END) AS returning_customers
FROM orders o
JOIN first_orders f 
    ON o.customer_id = f.customer_id
WHERE o.status = 'Delivered'
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

-- Q11: Order Status Distribution
SELECT
    status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- Q12: Average Delivery Time (Days) by Month
SELECT
    FORMAT(order_date, 'yyyy-MM') AS month,
    ROUND(AVG(DATEDIFF(DAY, order_date, ship_date)), 1) AS avg_delivery_days
FROM orders
WHERE status = 'Delivered'
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;

-- Q13: Return Rate by Category
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE WHEN o.status = 'Returned' THEN o.order_id END) AS returned_orders,
    ROUND(COUNT(DISTINCT CASE WHEN o.status = 'Returned' THEN o.order_id END) * 100.0
          /COUNT(DISTINCT o.order_id), 2) AS return_rate_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY return_rate_pct DESC;

-- Q14: Payment Method Distribution
SELECT
    payment_method,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS share_pct
FROM orders
GROUP BY payment_method
ORDER BY order_count DESC;

-- Q15: Month-over-Month Revenue Growth (Window Function)
WITH monthly AS (
    SELECT
        FORMAT(o.order_date, 'yyyy-MM') AS month,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY FORMAT(o.order_date, 'yyyy-MM')
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month))
          / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100, 2) AS mom_growth_pct
FROM monthly
ORDER BY month;

-- Q16: Running Total Revenue (Cumulative)
WITH daily_rev AS (
    SELECT
        o.order_date,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.order_date
)
SELECT
    order_date,
    daily_revenue,
    ROUND(SUM(daily_revenue) OVER (ORDER BY order_date ROWS UNBOUNDED PRECEDING), 2) AS cumulative_revenue
FROM daily_rev
ORDER BY order_date;

-- Q17: Product Ranking by Revenue within Category (RANK)
SELECT
    p.category,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS revenue,
    RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)) DESC) AS rank_in_category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category, p.product_id, p.product_name;

-- Q18: Discount Impact on Revenue
SELECT
    CASE
        WHEN oi.discount_pct = 0 THEN 'No Discount'
        WHEN oi.discount_pct <= 0.10 THEN '1-10%'
        WHEN oi.discount_pct <= 0.20 THEN '11-20%'
        ELSE 'Above 20%'
    END AS discount_bucket,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct)), 2) AS net_revenue,
    ROUND(SUM(oi.quantity * oi.unit_price * oi.discount_pct), 2) AS discount_given
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY CASE
        WHEN oi.discount_pct = 0 THEN 'No Discount'
        WHEN oi.discount_pct <= 0.10 THEN '1-10%'
        WHEN oi.discount_pct <= 0.20 THEN '11-20%'
        ELSE 'Above 20%'
END
ORDER BY net_revenue DESC;

-- Q19: Customer Cohort Retention (Signup Year-Month)
SELECT
    FORMAT(c.signup_date, 'yyyy-MM') AS cohort_month,
    COUNT(DISTINCT c.customer_id) AS cohort_size,
    COUNT(DISTINCT CASE WHEN o.order_date IS NOT NULL THEN c.customer_id END) AS purchased,
    ROUND(COUNT(DISTINCT CASE WHEN o.order_date IS NOT NULL THEN c.customer_id END)
          * 100.0 / COUNT(DISTINCT c.customer_id), 2) AS conversion_rate_pct
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'Delivered'
GROUP BY FORMAT(c.signup_date, 'yyyy-MM')
ORDER BY cohort_month;

-- Q20: Complete Executive Dashboard View (for Power BI Direct Query)
SELECT
    o.order_id,
    o.order_date,
    o.ship_date,
    o.status,
    o.payment_method,
    DATEDIFF(day, o.order_date,o.ship_date) AS delivery_days,
    c.customer_id,
    c.customer_name,
    c.segment AS customer_segment,
    c.city,
    c.state,
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct,
    ROUND(oi.quantity * oi.unit_price, 2) AS gross_amount,
    ROUND(oi.quantity * oi.unit_price * oi.discount_pct, 2) AS discount_amount,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct), 2) AS net_revenue,
    ROUND(oi.quantity * p.unit_cost, 2) AS total_cost,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct)
          - oi.quantity * p.unit_cost, 2) AS gross_profit
FROM orders o
JOIN customers c    ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id;

