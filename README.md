# 🛒 E-Commerce Sales Analytics — SQL Project

> A comprehensive **SQL-based analytics project** built on a simulated Indian e-commerce database. Covers the full pipeline — database design, data population, and **20 business-driven analytical queries** spanning revenue analysis, customer behaviour, product performance, and operational metrics.

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Dataset Summary](#dataset-summary)
- [Analytical Queries](#analytical-queries)
- [SQL Concepts & Techniques Used](#sql-concepts--techniques-used)
- [How to Run](#how-to-run)
- [Project Structure](#project-structure)
- [License](#license)

---

## Project Overview

This project simulates a real-world e-commerce business operating in India and answers critical business questions using structured SQL queries. It is designed to demonstrate proficiency in relational database design, data modelling, and advanced SQL analytics.

**Business Domain:** Indian E-Commerce (Electronics, Apparel, Home & Kitchen, Books, Sports)

**Core Analytical Areas:**
- Revenue & Profitability Analysis
- Customer Lifetime Value & Segmentation
- Product & Category Performance
- Operational Metrics (Delivery, Returns, Payments)
- Advanced Window Functions & Cohort Analysis

---

## Database Schema

The project uses a single database (`Ecommerce`) with **4 relational tables**:

### `customers`
Stores customer profile and segmentation data.

| Column | Type | Description |
|---|---|---|
| `customer_id` | INT (PK) | Unique customer identifier |
| `customer_name` | VARCHAR(100) | Full name |
| `email` | VARCHAR(150) | Email address |
| `city` | VARCHAR(100) | City of residence |
| `state` | VARCHAR(100) | State |
| `country` | VARCHAR(50) | Country |
| `signup_date` | DATE | Account registration date |
| `segment` | VARCHAR(50) | Customer segment: VIP / Regular / New |

---

### `products`
Stores product catalogue with pricing and cost data.

| Column | Type | Description |
|---|---|---|
| `product_id` | INT (PK) | Unique product identifier |
| `product_name` | VARCHAR(150) | Product title |
| `category` | VARCHAR(100) | Top-level category (Electronics, Apparel, etc.) |
| `sub_category` | VARCHAR(100) | Sub-category (Smartphones, Footwear, etc.) |
| `unit_price` | DECIMAL(10,2) | Selling price in ₹ |
| `unit_cost` | DECIMAL(10,2) | Cost price in ₹ (used for profit calculations) |

---

### `orders`
Stores order-level transaction records.

| Column | Type | Description |
|---|---|---|
| `order_id` | INT (PK) | Unique order identifier |
| `customer_id` | INT (FK) | References `customers.customer_id` |
| `order_date` | DATE | Date order was placed |
| `ship_date` | DATE | Date order was shipped |
| `status` | VARCHAR(50) | Delivered / Returned / Cancelled / Pending |
| `payment_method` | VARCHAR(50) | Credit Card / UPI / Debit Card / COD |
| `discount_pct` | DECIMAL(5,2) | Order-level discount (e.g., 0.10 = 10%) |

---

### `order_items`
Stores line-item detail for each order, supporting multiple products per order.

| Column | Type | Description |
|---|---|---|
| `item_id` | INT (PK) | Unique line item identifier |
| `order_id` | INT (FK) | References `orders.order_id` |
| `product_id` | INT (FK) | References `products.product_id` |
| `quantity` | INT | Number of units ordered |
| `unit_price` | DECIMAL(10,2) | Price captured at time of order |
| `discount_pct` | DECIMAL(5,2) | Item-level discount percentage |

---

## Entity Relationship Diagram

```
customers
│
│  customer_id (PK)
│
└──< orders
       │
       │  order_id (PK)
       │  customer_id (FK) ──────────────── customers
       │
       └──< order_items >────────────────── products
              │
              │  item_id (PK)
              │  order_id  (FK)
              │  product_id (FK)
```

**Relationships:**
- One `customer` → Many `orders` (1:N)
- One `order` → Many `order_items` (1:N)
- One `product` → Many `order_items` (1:N)

---

## Dataset Summary

| Table | Records |
|---|---|
| `customers` | 10 |
| `products` | 12 |
| `orders` | 15 |
| `order_items` | 26 |

**Customer Segments:** VIP · Regular · New

**Product Categories:** Electronics · Apparel · Home & Kitchen · Books · Sports

**Order Statuses:** Delivered · Returned · Cancelled · Pending

**Payment Methods:** Credit Card · UPI · Debit Card · COD

**Date Range:** January 2023 – December 2023

---

## Analytical Queries

All 20 queries are written for **MS SQL Server** syntax. They are organized into four business categories:

### 💰 Revenue & Profitability

| # | Query | Business Question |
|---|---|---|
| Q1 | Total Revenue (after discounts) | What is the overall net revenue from all delivered orders? |
| Q2 | Monthly Revenue Trend | How does revenue and order volume change month-over-month? |
| Q3 | Revenue by Product Category | Which categories drive the most revenue and units sold? |
| Q4 | Top 5 Best-Selling Products | Which products generate the highest revenue? |
| Q5 | Gross Profit & Profit Margin by Category | Which categories are the most profitable after deducting cost? |

---

### 👤 Customer Analytics

| # | Query | Business Question |
|---|---|---|
| Q6 | Customer Lifetime Value (CLV) | Which customers contribute the most revenue over time? |
| Q7 | Average Order Value (AOV) by Segment | Do VIP customers spend more per order than Regular or New customers? |
| Q8 | Top Cities by Revenue | Which cities generate the highest revenue? |
| Q9 | RFM Analysis | How can customers be segmented by Recency, Frequency, and Monetary value? |
| Q10 | New vs Returning Customers per Month | Is the business growing through new acquisition or repeat purchases? |

---

### ⚙️ Operational Metrics

| # | Query | Business Question |
|---|---|---|
| Q11 | Order Status Distribution | What share of orders are Delivered vs Returned vs Cancelled? |
| Q12 | Average Delivery Time by Month | How many days does delivery take on average per month? |
| Q13 | Return Rate by Category | Which product categories have the highest return rates? |
| Q14 | Payment Method Distribution | Which payment methods are customers using most? |

---

### 📈 Advanced Analytics — Window Functions & CTEs

| # | Query | SQL Technique | Business Question |
|---|---|---|---|
| Q15 | Month-over-Month Revenue Growth | `LAG()`, CTE | Is revenue growing compared to the previous month? |
| Q16 | Running Total (Cumulative Revenue) | `SUM() OVER()`, CTE | What does the cumulative revenue trajectory look like across the year? |
| Q17 | Product Ranking within Category | `RANK() OVER(PARTITION BY)` | Which product ranks #1 in revenue within each category? |
| Q18 | Discount Impact on Revenue | `CASE` bucketing | Do higher discounts translate to higher net revenue? |
| Q19 | Customer Cohort Retention | `LEFT JOIN`, `FORMAT()` | What percentage of each signup cohort made a purchase? |
| Q20 | Executive Dashboard View | Multi-table `JOIN`, derived columns | A single flat denormalized view ready for Power BI / Tableau |

---

## SQL Concepts & Techniques Used

| Concept | Applied In |
|---|---|
| DDL — `CREATE DATABASE`, `CREATE TABLE` | Schema setup |
| DML — `INSERT INTO`, `SELECT` | Data population and retrieval |
| `INNER JOIN`, `LEFT JOIN` | All analytical queries |
| Aggregate Functions — `SUM`, `COUNT`, `AVG`, `ROUND` | Q1–Q14 |
| `GROUP BY`, `ORDER BY` | Q2–Q14 |
| `WHERE` clause filtering | Q1–Q14 |
| `CASE WHEN` expressions | Q9, Q10, Q18 |
| Common Table Expressions — `WITH ... AS` | Q9, Q10, Q15, Q16 |
| Window Function — `LAG()` | Q15 |
| Window Function — `SUM() OVER(ROWS UNBOUNDED PRECEDING)` | Q16 |
| Window Function — `RANK() OVER(PARTITION BY)` | Q17 |
| `NULLIF()` for safe division | Q5, Q15 |
| `DATEDIFF()` for date arithmetic | Q9, Q12, Q20 |
| `FORMAT()` for date-based grouping | Q2, Q10, Q12, Q19 |
| `TOP N` for result limiting | Q4 |
| Subqueries in `SELECT` | Q11, Q14 |
| Computed / derived columns | Q20 |

---

## How to Run

### Prerequisites

- **Microsoft SQL Server** (2016 or later) or **Azure SQL Database**
- **SQL Server Management Studio (SSMS)** or **Azure Data Studio**

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/your-username/ecommerce-sql-analytics.git
cd ecommerce-sql-analytics
```

**2. Open SSMS and connect to your SQL Server instance**

**3. Execute the SQL file in order**

Open `SQL_Project.sql` and run it in the following sequence:

```
1. CREATE DATABASE Ecommerce
2. USE Ecommerce
3. CREATE TABLE — customers, products, orders, order_items
4. INSERT INTO  — seed data for all four tables
5. Analytical queries Q1–Q20 (run individually or all at once)
```

> ⚠️ **Note:** The schema creation and `INSERT` statements must be executed **before** the analytical queries. Once the data is loaded, each query (Q1–Q20) can be run independently in any order.

**4. Optional — Connect to Power BI**

Query **Q20** produces a fully flat, denormalized view with pre-computed fields (`gross_amount`, `discount_amount`, `net_revenue`, `gross_profit`, `delivery_days`). This view can be imported directly into **Power BI** or **Tableau** for dashboard creation without any additional transformation.

---

## Project Structure

```
ecommerce-sql-analytics/
│
├── SQL_Project.sql    # Complete project: DDL + seed data + 20 analytical queries
└── README.md          # Project documentation
```

---

## License

This project is built for **educational and portfolio purposes only**. All customer names, email addresses, and business data are fully synthetic and fictional. Not intended for commercial use.

---

> Built with MS SQL Server · Window Functions · CTEs · RFM Segmentation · Cohort Analysis | E-Commerce Analytics · 2025
