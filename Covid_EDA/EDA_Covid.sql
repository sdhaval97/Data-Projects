-- Selecting the data we want to check
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1, 2;

-- Looking at total cases vs total deaths
-- Shows the likelihood of dying if you contract Covid in Canada

SELECT location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases) * 100), 2) AS DeathPercentage
FROM CovidDeaths
WHERE location = 'Canada'
ORDER BY 1, 2;

-- Looking at total cases vs Population
-- Percentage of population who got covid
SELECT location, date, total_cases, population, ROUND(((total_cases/population) * 100), 2) AS DeathPercentage
FROM CovidDeaths
WHERE location = 'Canada'
ORDER BY 1, 2;

-- Countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, ROUND((MAX(total_cases/population) * 100), 2) AS PercentPopulationInfected
FROM CovidDeaths
-- WHERE location = 'Canada'
GROUP BY population, location
ORDER BY 4 DESC;

-- Showing countries with the highest death count per population
SELECT location, MAX(total_deaths) AS TotalDeaths
FROM CovidDeaths
-- WHERE location = 'Canada'
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 2 desc;

-- BREAKING THINGS DOWN BY CONTINENT
SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-- GLOBAL NUMBERS

SELECT location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases) * 100), 2) AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2;

-- total number of new cases all over the world

SELECT SUM(new_cases) AS TotalNewCases, SUM(new_deaths) AS TotalNewDeaths, ROUND((SUM(new_deaths)/SUM(new_cases) * 100), 2) 
	AS NewDeathPercentage
FROM CovidDeaths
WHERE continent is not null
ORDER BY 1, 2;

-- Total population vs vaccination
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
	SUM(CONVERT(bigint, cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
	as RollingPeopleVaccinated
FROM CovidDeaths cd
	JOIN CovidVaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
AND cd.location = 'Canada'
ORDER BY 2, 3;


-- Creating a CTE

WITH populationvsvac(continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)

AS
(
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
	SUM(CONVERT(bigint, cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
	as RollingPeopleVaccinated
FROM CovidDeaths cd
	JOIN CovidVaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
)

SELECT *, ROUND(RollingPeopleVaccinated/population*100, 2)
FROM populationvsvac;

-- TEMP TABLE

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
continent nvarchar(255), 
location nvarchar(255), 
date datetime, 
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
	SUM(CONVERT(bigint, cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date)
	as RollingPeopleVaccinated
FROM CovidDeaths cd
	JOIN CovidVaccinations cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL

SELECT *, ROUND(RollingPeopleVaccinated/population*100, 2) 
FROM #PercentPopulationVaccinated;
