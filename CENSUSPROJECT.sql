USE censusproject;

-- Select all data from Data1
SELECT * FROM Data1;

-- Select all data from Data2
SELECT * FROM Data2;

-- 1. Number of Districts in data1 and data2
SELECT COUNT(d1.District) AS 'Total Districts' FROM data1 d1;
SELECT COUNT(d2.District) AS 'Total Districts' FROM data2 d2;

-- 2. Get data for Andhra Pradesh and Karnataka from data1 and Data2
SELECT * FROM data1 d1 WHERE d1.State IN ('Andhra Pradesh', 'Karnataka');
SELECT * FROM data1 d2 WHERE d2.State IN ('Andhra Pradesh', 'Karnataka');

-- 3. Get the total population of India
SELECT ROUND(SUM(d2.Population), 0) AS 'Total Population of India' FROM data2 d2;

-- 4. Average growth of the country
SELECT ROUND(AVG(d1.Growth) * 100, 2) AS "Avg % Growth of the Country" FROM data1 d1;

-- 5. Average growth of each state
SELECT d1.State, ROUND(AVG(d1.Growth) * 100, 2) AS "Avg % Growth of the State"
FROM data1 d1
GROUP BY d1.State;

-- 6. Average sex ratio per state
SELECT d1.State, ROUND(AVG(d1.Sex_Ratio), 0) AS Avg_Sex_Ratio
FROM data1 d1
GROUP BY d1.State
ORDER BY Avg_Sex_Ratio;

-- 7. States with Average Literacy Rate greater than 90
SELECT d1.State, ROUND(AVG(d1.Literacy), 0) AS Avg_Literacy_Rate
FROM data1 d1
GROUP BY d1.State
HAVING Avg_Literacy_Rate > 90
ORDER BY Avg_Literacy_Rate;

-- 8. Top 3 States that have shown average growth rate
SELECT d1.State, ROUND(AVG(d1.Growth) * 100, 2) AS Avg_Growth_Rate
FROM data1 d1
GROUP BY d1.State
ORDER BY Avg_Growth_Rate DESC
LIMIT 3;

-- 9. Bottom 3 States showing the least sex ratio
SELECT d1.State, ROUND(AVG(d1.Sex_Ratio), 0) AS Avg_Sex_Ratio
FROM data1 d1
GROUP BY d1.State
ORDER BY Avg_Sex_Ratio
LIMIT 3;

-- 10. Get States with Top 3 and Bottom 3 States
(
  SELECT d1.State, ROUND(AVG(d1.Literacy), 2) AS Avg_Literacy_Rate
  FROM data1 AS d1
  GROUP BY d1.State
  ORDER BY Avg_Literacy_Rate DESC
  LIMIT 3
)
UNION
(
  SELECT d1.State, ROUND(AVG(d1.Literacy), 2) AS Avg_Literacy_Rate
  FROM data1 AS d1
  GROUP BY d1.State
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
SELECT d1.State, ROUND(AVG(d1.Literacy), 2) AS Avg_Literacy_Rate
FROM data1 AS d1
GROUP BY d1.State
ORDER BY Avg_Literacy_Rate DESC
LIMIT 3;

DROP TABLE IF EXISTS bottom_literacy_states;
CREATE TEMPORARY TABLE bottom_literacy_states (
  state VARCHAR(255),
  literacy_rate FLOAT
);

INSERT INTO bottom_literacy_states (state, literacy_rate)
SELECT d1.State, ROUND(AVG(d1.Literacy), 2) AS Avg_Literacy_Rate
FROM data1 AS d1
GROUP BY d1.State
ORDER BY Avg_Literacy_Rate ASC
LIMIT 3;

SELECT * FROM bottom_literacy_states;
SELECT * FROM top_literacy_states;

-- 12. State Starting with letter A and ending with H
SELECT DISTINCT(state) FROM data1
WHERE state LIKE "A%" AND state LIKE "%H";

-- 13. Get Number of males and females in each district - (sex_ratio = no of females/1000 males)
SELECT
  d2.District,
  d2.State,
  d2.Population,
  ROUND(d2.Population * (d1.sex_ratio / 1000), 0) AS female_population,
  ROUND(d2.Population * (1 - (d1.sex_ratio / 1000)), 0) AS male_population
FROM data1 d1
JOIN data2 d2
USING (District)
ORDER BY d2.State;

-- 14. Get Number of males and females in each state
SELECT
  district_stats.State "State",
  SUM(d_pop) "State Population",
  SUM(d_female_population) "State Female Population",
  SUM(d_male_population) "State Male Population",
  SUM(d_female_population) / SUM(d_male_population) "Ratio"
FROM (
  SELECT
    d2.District AS dis,
    d2.State AS state,
    d2.Population AS d_pop,
    ROUND(d2.Population * (d1.sex_ratio / 1000), 0) AS d_female_population,
    ROUND(d2.Population * (1 - (d1.sex_ratio / 1000)), 0) AS d_male_population
  FROM data1 d1
  JOIN data2 d2
  USING (District)
  ORDER BY d2.State
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
    D1.State AS State,
    D2.Population AS Population,
    ROUND(((D1.Literacy / 100) * D2.Population), 0) AS Literates
  FROM DATA1 D1
  JOIN DATA2 D2
  USING (DISTRICT)
) AS D
GROUP BY D.STATE
ORDER BY D2.State;

-- 16. Get the population in the previous census State wise
SELECT
  D.State,
  SUM(D.d_pres_pop) "Present State Population",
  SUM(D.d_past_pop) "Past State Population"
FROM (
  SELECT
    D2.State,
    D2.Population AS d_pres_pop,
    ROUND(D2.Population / (D1.Growth + 1), 0) d_past_pop
  FROM DATA1 D1
  JOIN DATA2 D2
  USING (DISTRICT)
) AS D
GROUP BY D2.State
ORDER BY D2.State;

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
      D2.State,
      D2.Population AS d_pres_pop,
      ROUND(D2.Population / (D1.Growth + 1), 0) d_past_pop,
      D2.Area_km2 AS d_area
    FROM DATA1 D1
    JOIN DATA2 D2
    USING (DISTRICT)
  ) AS D
  GROUP BY D2.State
) AS state_stats
ORDER BY state_stats.State;