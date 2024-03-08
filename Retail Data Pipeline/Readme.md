# Walmart E-commerce Sales Analysis

![Walmart E-commerce](walmartecomm.jpg)

## Introduction

Walmart, as the largest retail store in the United States, has been expanding its e-commerce segment. By the end of 2022, e-commerce sales amounted to $80 billion, representing 13% of total sales. Public holidays such as the Super Bowl, Labour Day, Thanksgiving, and Christmas significantly influence Walmart's sales.

## Objective

This project aims to create a data pipeline for analyzing supply and demand around holidays, along with conducting a preliminary analysis of the data. Two main data sources are utilized: grocery sales data from a PostgreSQL database and complementary data stored in a Parquet file.

## Data Sources

### grocery_sales (PostgreSQL table):
- "index": unique ID of the row
- "Store_ID": the store number
- "Date": the week of sales
- "Weekly_Sales": sales for the given store
- "Dept": Department Number in each store

### extra_data.parquet (Complementary data):
- "index": unique ID of the row
- "IsHoliday": Whether the week contains a public holiday (1 if yes, 0 if no)
- "Temperature": Temperature on the day of sale
- "Fuel_Price": Cost of fuel in the region
- "CPI": Prevailing consumer price index
- "Unemployment": Prevailing unemployment rate
- "MarkDown1", "MarkDown2", "MarkDown3", "MarkDown4": Number of promotional markdowns
- "Size": Size of the store
- "Type": Type of the store (depends on Size column)

## Approach

1. **Extracting Data:** Retrieving data from the PostgreSQL database for grocery sales and loading complementary data from the provided Parquet file.
2. **Transforming Data:** Merging grocery sales and complementary data, filling missing values, adding a "Month" column, filtering rows with weekly sales over $10,000, and dropping unnecessary columns.
3. **Analyzing Monthly Sales:** Aggregating weekly sales to monthly sales and calculating average monthly sales.
4. **Loading Data:** Saving cleaned data and aggregated monthly sales as CSV files.

## Conclusion

This project provides insights into Walmart's e-commerce sales around holidays through data analysis. Leveraging data from grocery sales and complementary sources helps understand trends and factors influencing Walmart's sales performance.

## Recommendations

- Utilize insights gained to optimize sales strategies around holidays.
- Explore further analysis to uncover additional patterns and correlations in the data.


