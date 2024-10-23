USE censusproject;

-- Select all data from DemographicIndicators
SELECT * FROM DemographicIndicators;

-- Select all data from GeographicPopulation
SELECT * FROM GeographicPopulation;

-- 1. Number of Districts in DemographicIndicators and GeographicPopulation
SELECT COUNT(di.District) AS 'Total Districts' FROM DemographicIndicators di;
SELECT COUNT(gp.District) AS 'Total Districts' FROM GeographicPopulation gp;

-- 2. Get data for Andhra Pradesh and Karnataka from DemographicIndicators and GeographicPopulation
SELECT * FROM DemographicIndicators di WHERE di.State IN ('Andhra Pradesh', 'Karnataka');
SELECT * FROM DemographicIndicators gp WHERE gp.State IN ('Andhra Pradesh', 'Karnataka');

-- 3. Get the total population of India
SELECT ROUND(SUM(gp.Population), 0) AS 'Total Population of India' FROM GeographicPopulation gp;

-- 4. Average growth of the country
SELECT ROUND(AVG(di.Growth) * 100, 2) AS "Avg % Growth of the Country" FROM DemographicIndicators di;

-- 5. Average growth of each state
SELECT di.State, ROUND(AVG(di.Growth) * 100, 2) AS "Avg % Growth of the State"
FROM DemographicIndicators di
GROUP BY di.State;

-- 6. Average sex ratio per state
SELECT di.State, ROUND(AVG(di.Sex_Ratio), 0) AS Avg_Sex_Ratio
FROM DemographicIndicators di
GROUP BY di.State
ORDER BY Avg_Sex_Ratio;

-- 7. States with Average Literacy Rate greater than 90
SELECT di.State, ROUND(AVG(di.Literacy), 0) AS Avg_Literacy_Rate
FROM DemographicIndicators di
GROUP BY di.State
HAVING Avg_Literacy_Rate > 90
ORDER BY Avg_Literacy_Rate;

-- 8. Top 3 States that have shown average growth rate
SELECT di.State, ROUND(AVG(di.Growth) * 100, 2) AS Avg_Growth_Rate
FROM DemographicIndicators di
GROUP BY di.State
ORDER BY Avg_Growth_Rate DESC
LIMIT 3;

-- 9. Bottom 3 States showing the least sex ratio
SELECT di.State, ROUND(AVG(di.Sex_Ratio), 0) AS Avg_Sex_Ratio
FROM DemographicIndicators di
GROUP BY di.State
ORDER BY Avg_Sex_Ratio
LIMIT 3;

-- 10. Get States with Top 3 and Bottom 3 States
(
  SELECT di.State, ROUND(AVG(di.Literacy), 2) AS Avg_Literacy_Rate
  FROM DemographicIndicators AS di
  GROUP BY di.State
  ORDER BY Avg_Literacy_Rate DESC
  LIMIT 3
)
UNION
(
  SELECT di.State, ROUND(AVG(di.Literacy), 2) AS Avg_Literacy_Rate
  FROM DemographicIndicators AS di
  GROUP BY di.State
  ORDER BY Avg_Literacy_Rate ASC
  LIMIT 3
)
ORDER BY Avg_Literacy_Rate DESC;

-- 11. Create Table with States with Top 3 and Bottom 3 literacy rate
DROP TABLE IF EXISTS top_literacy_states;
CREATE TEMPORARY TABLE top_literacy_states (
  state VARCHAR(255),
  literacy_rate FLOAT
);

INSERT INTO top_literacy_states (state, literacy_rate)
SELECT di.State, ROUND(AVG(di.Literacy), 2) AS Avg_Literacy_Rate
FROM DemographicIndicators AS di
GROUP BY di.State
ORDER BY Avg_Literacy_Rate DESC
LIMIT 3;

DROP TABLE IF EXISTS bottom_literacy_states;
CREATE TEMPORARY TABLE bottom_literacy_states (
  state VARCHAR(255),
  literacy_rate FLOAT
);

INSERT INTO bottom_literacy_states (state, literacy_rate)
SELECT di.State, ROUND(AVG(di.Literacy), 2) AS Avg_Literacy_Rate
FROM DemographicIndicators AS di
GROUP BY di.State
ORDER BY Avg_Literacy_Rate ASC
LIMIT 3;

SELECT * FROM bottom_literacy_states;
SELECT * FROM top_literacy_states;

-- 12. State Starting with letter A and ending with H
SELECT DISTINCT(state) FROM DemographicIndicators
WHERE state LIKE "A%" AND state LIKE "%H";

-- 13. Get Number of males and females in each district - (sex_ratio = no of females/1000 males)
SELECT
  gp.District,
  gp.State,
  gp.Population,
  ROUND(gp.Population * (di.sex_ratio / 1000), 0) AS female_population,
  ROUND(gp.Population * (1 - (di.sex_ratio / 1000)), 0) AS male_population
FROM DemographicIndicators di
JOIN GeographicPopulation gp
USING (District)
ORDER BY gp.State;

-- 14. Get Number of males and females in each state
SELECT
  district_stats.State "State",
  SUM(d_pop) "State Population",
  SUM(d_female_population) "State Female Population",
  SUM(d_male_population) "State Male Population",
  SUM(d_female_population) / SUM(d_male_population) "Ratio"
FROM (
  SELECT
    gp.District AS dis,
    gp.State AS state,
    gp.Population AS d_pop,
    ROUND(gp.Population * (di.sex_ratio / 1000), 0) AS d_female_population,
    ROUND(gp.Population * (1 - (di.sex_ratio / 1000)), 0) AS d_male_population
  FROM DemographicIndicators di
  JOIN GeographicPopulation gp
  USING (District)
  ORDER BY gp.State
) AS district_stats
GROUP BY district_stats.State
ORDER BY district_stats.State;

-- 15. Total Literates in each state
SELECT
  D.STATE "State",
  SUM(D.POPULATION) "Total Population",
  SUM(D.Literates) "Literates",
  ROUND(SUM(D.Literates) / SUM(D.Population), 2) "State Literacy Rate"
FROM (
  SELECT
    di.State AS State,
    gp.Population AS Population,
    ROUND(((di.Literacy / 100) * gp.Population), 0) AS Literates
  FROM DemographicIndicators di
  JOIN GeographicPopulation gp
  USING (DISTRICT)
) AS D
GROUP BY D.STATE
ORDER BY gp.State;

-- 16. Get the population in the previous census State wise
SELECT
  D.State,
  SUM(D.d_pres_pop) "Present State Population",
  SUM(D.d_past_pop) "Past State Population"
FROM (
  SELECT
    gp.State,
    gp.Population AS d_pres_pop,
    ROUND(gp.Population / (di.Growth + 1), 0) d_past_pop
  FROM DemographicIndicators di
  JOIN GeographicPopulation gp
  USING (DISTRICT)
) AS D
GROUP BY gp.State
ORDER BY gp.State;

-- 17. Change in number of persons per unit Area (per square kilometer)
SELECT
  state_stats.State,
  ROUND(state_stats.past_state_population / state_stats.state_area, 0) "Persons per unit Area - Earlier",
  ROUND(state_stats.present_state_population / state_stats.state_area, 0) "Persons per unit Area - Present",
  ROUND((state_stats.present_state_population / state_stats.state_area) - (state_stats.past_state_population / state_stats.state_area), 0) "Increase in Number of persons per unit Area"
FROM (
  SELECT
    D.State,
    SUM(D.d_pres_pop) present_state_population,
    SUM(D.d_past_pop) past_state_population,
    SUM(d_area) state_area
  FROM (
    SELECT
      gp.State,
      gp.Population AS d_pres_pop,
      ROUND(gp.Population / (di.Growth + 1), 0) d_past_pop,
      gp.Area_km2 AS d_area
    FROM DemographicIndicators di
    JOIN GeographicPopulation gp
    USING (DISTRICT)
  ) AS D
  GROUP BY gp.State
) AS state_stats
ORDER BY state_stats.State;