# Creating a dimension table for states
CREATE TABLE dim_state AS
SELECT DISTINCT state
FROM electric_vehicle_sales_by_state;

# Creating a dimension table for makers
CREATE TABLE dim_maker AS 
SELECT DISTINCT maker
FROM electric_vehicle_sales_by_makers;

# Creating a vehicle category dimension table
CREATE TABLE dim_vehicle_category AS
SELECT DISTINCT vehicle_category
FROM electric_vehicle_sales_by_makers;

# Creating maker and state fact tables
CREATE TABLE fact_sales_by_maker AS
SELECT 
	date,
    vehicle_category,
    maker,
    SUM(electric_vehicles_sold) AS electric_vehicles_sold,
    NULL AS total_vehicles_sold
FROM 
	electric_vehicle_sales_by_makers
GROUP BY 
	date, vehicle_category, maker;
    
CREATE TABLE fact_sales_by_state AS 
SELECT
	date,
    state,
    vehicle_category,
    SUM(electric_vehicles_sold) AS electric_vehicles_sold,
    SUM(total_vehicles_sold) AS total_vehicles_sold
FROM
	electric_vehicle_sales_by_state	
GROUP BY
	date, state, vehicle_category;