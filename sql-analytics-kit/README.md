# Optimizing Financial and Supply Chain Reporting with SQL Automation

This repository contains a collection of SQL scripts and procedures used for finance and supply chain analytics, focusing on performance tuning and modular query design.

---

## 📌 Highlights

### 1. Finance Analytics
- Created UDFs to compute fiscal year and quarter from calendar dates.
- Built stored procedures for generating customer-wise monthly gross sales and assigning market badges.
- Layered logic into CTEs and stored procs for flexible, maintainable reporting pipelines.

### 2. Query Optimization
- Replaced compute-heavy functions (`get_fiscal_year`) with lookup joins via `dim_date` to reduce execution time from 8s to ~2s.
- Added precomputed fiscal year columns in fact tables to enable direct filtering and reduce joins.
- Used views (`sales_preinv_discount`, `net_sales`) to separate transformation logic for cleaner and faster downstream queries.

### 3. Supply Chain Forecasting
- Built unified tables for sold vs forecasted quantity comparisons.
- Calculated forecast accuracy using temporary tables and error metrics like absolute and net percentage errors.
- Enabled session-specific forecast error reports for rapid business intelligence.

---

## 📁 Structure

- `finance_analytics.sql`: Stored procedures, fiscal logic, customer reports.
- `top_customers_markets_products.sql`: Optimization-focused scripts, market/customer/product rankings.
- `supply_chain_analytics.sql`: Forecast accuracy, actual vs estimated comparisons.

---

## 🧠 Skills Showcased

- Advanced SQL (CTEs, Window Functions, Stored Procedures)
- Query Performance Optimization
- Data Modeling & View Creation
- Business Analytics (Finance + Supply Chain)

---

## 📬 Reach Out
If you want to collaborate or learn more, feel free to connect via [LinkedIn](https://www.linkedin.com/in/dhaval-vipin-shah/) or drop an issue on this repo!

