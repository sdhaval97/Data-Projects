# Exploratory Data Analysis of World Life Expectancy

# change in the life expectancy
SELECT country, MIN(`Life expectancy`), MAX(`Life expectancy`),
round(MAX(`Life expectancy`) - MIN(`Life expectancy`), 2) AS life_increase
FROM world_life_expectancy
GROUP BY country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY life_increase DESC;

# 
SELECT Year, ROUND(AVG(`Life expectancy`), 2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;

# Effect of GDP on Life Expectancy
SELECT Country, ROUND(AVG(`Life expectancy`), 2) as "Life Expectancy", ROUND(AVG(GDP), 1) AS "GDP"
FROM world_life_expectancy
GROUP BY Country
HAVING AVG(`Life expectancy`) > 0
AND AVG(GDP) > 0
ORDER BY GDP ASC;


SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_expectancy
FROM world_life_expectancy;

# Developing vs Developed Nations
SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
GROUP BY Status;

# Rolling Total of Deaths over the years
SELECT Country, Year, `Life expectancy`, `Adult mortality`,
SUM(`Adult Mortality`) OVER (PARTITION BY Country ORDER BY Year) Rolling_Total
FROM world_life_expectancy;
