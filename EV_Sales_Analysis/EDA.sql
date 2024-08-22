SELECT * FROM electric_vehicle_sales_by_state;

SELECT * FROM electric_vehicle_sales_by_makers;

# Question 1: Top 3 and Bottom 3 Makers for 2-Wheelers
SELECT 
	maker, 
    SUM(electric_vehicles_sold) AS total_vehicles_sold
FROM 
	electric_vehicle_sales_by_makers
WHERE
	vehicle_category = '2-Wheelers'
GROUP BY 
	maker
ORDER BY 
	total_vehicles_sold DESC
LIMIT 3;

SELECT 
	maker, 
    SUM(electric_vehicles_sold) AS total_vehicles_sold
FROM 
	electric_vehicle_sales_by_makers
WHERE
	vehicle_category = '2-Wheelers'
GROUP BY 
	maker
ORDER BY 
	total_vehicles_sold
LIMIT 3;

# Question 2: Top 5 States with Highest Penetration Rate in FY 2024
SELECT 
	state,
	ROUND((SUM(electric_vehicles_sold) / SUM(total_vehicles_sold)) * 100, 2) AS penetration_rate
FROM 
	electric_vehicle_sales_by_state
WHERE 
	YEAR(date) = 2024
GROUP BY	
	state
ORDER BY 
	penetration_rate DESC
LIMIT 5;

# Question 3: States with Negative Penetration (Decline) in EV Sales
SELECT 
    state,
    ((SUM(CASE WHEN YEAR(date) = 2024 THEN electric_vehicles_sold END) / NULLIF(SUM(CASE WHEN YEAR(date) = 2024 THEN total_vehicles_sold END), 0)) * 100) - 
    ((SUM(CASE WHEN YEAR(date) = 2022 THEN electric_vehicles_sold END) / NULLIF(SUM(CASE WHEN YEAR(date) = 2022 THEN total_vehicles_sold END), 0)) * 100) 
    AS penetration_rate_diff
FROM
    electric_vehicle_sales_by_state
GROUP BY 
    state
HAVING penetration_rate_diff < 0;

# THERE SEEMS TO BE NO DECLINE IN SALES FOR EVs

# Question 4: Quarterly Trends for Top 5 EV Makers (4-Wheelers)

SELECT 
	maker,
    YEAR(date) AS year,
    QUARTER(date) AS quarter,
    SUM(electric_vehicles_sold) AS total_ev_sales
FROM
	electric_vehicle_sales_by_makers
WHERE 
	vehicle_category = '4-Wheelers'
GROUP BY
	maker, quarter, year
ORDER BY
	total_ev_sales DESC
LIMIT 5;

# Question 5: Compare EV Sales and Penetration Rates in Delhi vs Karnataka (2024)
SELECT
	state,
    (SUM(electric_vehicles_sold) / SUM(total_vehicles_sold)) * 100 AS penetration_rate,
    SUM(electric_vehicles_sold) AS total_ev_sales
FROM
	electric_vehicle_sales_by_state
WHERE
	YEAR(date) = 2024 AND state IN ('Delhi', 'Karnataka')
GROUP BY 
	state;

# Karnataka has a higher penetration rate and number of EVs sold as compared to Delhi

# QUESTION 6: CAGR IN 4 WHEELER UNITS FOR TOP 5 MAKERS (2022 TO 2024)
SELECT 
	maker,
    ROUND(POW((SUM(CASE WHEN YEAR(date) = 2024 THEN electric_vehicles_sold END) / 
    SUM(CASE WHEN YEAR(date) = 2022 THEN electric_vehicles_sold END)), 1/2) - 1, 2) AS CAGR
FROM
	electric_vehicle_sales_by_makers
WHERE 
	vehicle_category = '4-Wheelers'
GROUP BY 
	maker
ORDER BY CAGR DESC
LIMIT 5;

# Question 7: Top 10 States with Highest CAGR in Total Vehicles Sold (2022 to 2024)
SELECT 
    state, 
    ROUND(POW((SUM(CASE WHEN YEAR(date) = 2024 THEN total_vehicles_sold END) /
         SUM(CASE WHEN YEAR(date) = 2022 THEN total_vehicles_sold END)), 1/2) - 1, 2) AS CAGR
FROM 
    electric_vehicle_sales_by_state
GROUP BY 
    state
ORDER BY 
    CAGR DESC
LIMIT 10;

# no state has a positive CAGR 

# Question 8: Peak and Low Season Months for EV Sales (2022 to 2024)
SELECT 
	YEAR(date) AS year,
    MONTHNAME(date) AS month, 
    SUM(electric_vehicles_sold) AS total_ev_sales
FROM 
    electric_vehicle_sales_by_state
WHERE 
    YEAR(date) BETWEEN 2022 AND 2024
GROUP BY 
    year, month
ORDER BY 
    total_ev_sales DESC;



