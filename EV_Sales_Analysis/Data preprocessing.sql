SELECT * FROM electric_vehicle_sales_by_makers;

#changing the datatype of date column

# STEP 1: Add a New DATE Column:
ALTER TABLE electric_vehicle_sales_by_makers ADD COLUMN date_converted DATE;

# STEP 2: Update the New Column with the Converted Dates:
UPDATE electric_vehicle_sales_by_makers 
SET date_converted = STR_TO_DATE(date, '%d-%b-%y');

# STEP 3: Drop the Old date Column:
ALTER TABLE electric_vehicle_sales_by_makers DROP COLUMN date;

# STEP 4: Rename the New Column to date:
ALTER TABLE electric_vehicle_sales_by_makers CHANGE date_converted date DATE;

SELECT month(date), vehicle_category FROM electric_vehicle_sales_by_makers LIMIT 10;

# UPDATING THE state table
SELECT * FROM electric_vehicle_sales_by_state;

ALTER TABLE electric_vehicle_sales_by_state
RENAME COLUMN `ï»¿date` TO date;

# CHANGING THE DATATYPE OF DATE COLUMN TO DATE
ALTER TABLE electric_vehicle_sales_by_state ADD COLUMN date_converted DATE;

UPDATE electric_vehicle_sales_by_state
SET date_converted = STR_TO_DATE(date, '%d-%b-%y');

ALTER TABLE electric_vehicle_sales_by_state DROP COLUMN date;

ALTER TABLE electric_vehicle_sales_by_state CHANGE date_converted date DATE;

SELECT * FROM electric_vehicle_sales_by_state;




