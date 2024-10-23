# Census - Demographic Analysis - India

## Overview
This project presents a comprehensive demographic and population analysis using two datasets: **DemographicIndicators** and **GeographicPopulation**. The analysis focuses on both district and state levels, exploring key demographic indicators such as population size, growth rates, sex ratio, literacy rates, and population dynamics over time. The aim is to derive meaningful insights into the demographic structure and trends across various regions.

## Key Objectives:
1. **Demographic Data Selection and Basic Analysis**: 
   - Extract data from the **DemographicIndicators** and **GeographicPopulation** tables.
   - Perform exploratory analysis at the district and state levels.
2. **Complex Demographic and Population Analysis**: 
   - Analyze demographic factors such as sex ratio, literacy rates, and population growth.
3. **Population Dynamics Over Time**: 
   - Assess population changes over different time periods for trend analysis.

## Data Selection and Basic Analysis:
The initial step involved querying the data to set the foundation for deeper analysis:
- Selected all relevant data from the **DemographicIndicators** and **GeographicPopulation** tables.
- Counted the total number of districts listed in both **DemographicIndicators** and **GeographicPopulation**.
- Retrieved demographic and census data for specific states, focusing on **Andhra Pradesh** and **Karnataka**.
- Calculated the total population of India from the **GeographicPopulation** table.
- Computed the average growth rate at both the national level and individual state levels using data from **DemographicIndicators**.

## Complex Demographic and Population Analysis:
This section focuses on more advanced queries to analyze population demographics and trends:
- **Demographic and Literacy Analysis**:
  - Calculated the average sex ratio (females per 1000 males) for each state using **DemographicIndicators**.
  - Identified states with an average literacy rate above 90%.
  - Listed the top 3 states with the highest average growth rates and the bottom 3 states with the lowest average sex ratios.
  - Combined the top 3 states with the highest literacy rates and the bottom 3 states with the lowest literacy rates for comparison.
  
- **Temporary Table Creation and Advanced State Filtering**:
  - Created temporary tables to store and retrieve states based on their literacy rates for further advanced analysis.
  - Filtered and retrieved states whose names start with "A" and end with "H" using the **DemographicIndicators** table.

## Gender and Literacy Analysis:
Further analysis was conducted to provide insights into gender distribution and literacy:
- Calculated the total number of **males** and **females** at the district and state levels, based on sex ratio and population data from **DemographicIndicators** and **GeographicPopulation**.
- Computed the total number of literates in each state by combining population and literacy rate data from both tables.

## Population Dynamics Over Time:
Analyzing population changes over time was a key part of this project:
- Compared the present and past populations of states to analyze growth trends over time using data from **DemographicIndicators** and **GeographicPopulation**.

## Conclusion:
This **Census Project** provides critical insights into the demographic structure and changes across India, leveraging a wide range of SQL queries to extract and analyze data. Through this project, complex queries were implemented to assess population growth, gender distribution, literacy levels, and demographic shifts over time, offering valuable data-driven conclusions for policy-making and future studies.
