# COVID-19 Exploratory Data Analysis SQL Scripts

This repository contains SQL scripts for analyzing COVID-19 data. The scripts are designed to extract and analyze various aspects of COVID-19 data including cases, deaths, vaccinations, and population statistics.

## Dataset

The complete dataset downloaded from OWID COVID-19 Data has been split into two separate datasets:

- **CovidDeaths:** Contains data related to COVID-19 cases and deaths.
- **CovidVaccinations:** Contains data related to COVID-19 vaccinations.

## Scripts Overview

1. **Data Selection:**
   - SQL script to select relevant data from the CovidDeaths table.

2. **Total Cases vs Total Deaths:**
   - Analyzes the likelihood of dying if contracting COVID-19 in Canada.

3. **Total Cases vs Population:**
   - Calculates the percentage of the population infected with COVID-19 in Canada.

4. **Countries with Highest Infection Rate:**
   - Identifies countries with the highest infection rate compared to their population.

5. **Countries with Highest Death Count:**
   - Lists countries with the highest death count per population.

6. **Breakdown by Continent:**
   - Provides a breakdown of total death count by continent.

7. **Global Numbers:**
   - Presents global COVID-19 statistics including total cases, total deaths, and death percentage.

8. **Total New Cases Worldwide:**
   - Calculates the total number of new cases and deaths worldwide, along with the percentage of new deaths.

9. **Population vs Vaccination:**
   - Compares population data with vaccination statistics, particularly focusing on Canada.

10. **Common Table Expression (CTE):**
    - Uses a CTE to calculate the percentage of population vaccinated over time.

11. **Temporary Table:**
    - Utilizes a temporary table to store and analyze vaccination data.

12. **View Creation:**
    - Creates a view to store COVID-19 vaccination data for later visualization.

Feel free to reach out for any questions or suggestions!

