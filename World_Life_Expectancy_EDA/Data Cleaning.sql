SELECT Country, Year, concat(country, year), count(concat(country, year))
FROM world_life_expectancy
GROUP BY Country, Year, Concat(country, year)
HAVING count(concat(country, year)) > 1;

# Understanding the row Ids of the duplicates
SELECT * 
FROM (
	SELECT Row_ID, 
	Concat(country, year), 
	ROW_NUMBER() OVER (PARTITION BY Concat(country, year) order by Concat(country, year)) AS Row_Num
	FROM world_life_expectancy)
    AS Row_Table
WHERE Row_Num > 1;

# deleting the duplicates
DELETE FROM world_life_expectancy
WHERE 
	Row_ID IN (SELECT Row_ID 
FROM (
	SELECT Row_ID, 
	Concat(country, year), 
	ROW_NUMBER() OVER (PARTITION BY Concat(country, year) order by Concat(country, year)) AS Row_Num
	FROM world_life_expectancy)
    AS Row_Table
WHERE Row_Num > 1)
;

# looking at blank status
SELECT * 
FROM world_life_expectancy
WHERE status = '';

SELECT DISTINCT(status)
from world_life_expectancy
WHERE status <> '';

SELECT DISTINCT(country)
FROM world_life_expectancy
WHERE status = 'Developing';

#UPDATING THE BLANK STATUS
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
SET t1.status = 'Developed'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed';


# having a look at nulls
SELECT *
FROM world_life_expectancy
WHERE `Life expectancy` = '';

# Populating null life expectancies with average
SELECT t1.country, t1.Year, t1.`Life expectancy`,
t2.country, t2.Year, t2.`Life expectancy`,
t3.country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1

WHERE t1.`Life expectancy` = '';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
WHERE t1.`Life expectancy` = '';



