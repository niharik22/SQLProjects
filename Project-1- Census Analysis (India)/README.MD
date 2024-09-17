# Census Project SQL Queries

This project focuses on a comprehensive demographic and population analysis using two datasets, Data1 and Data2. The analysis is conducted at both district and state levels, covering a range of key demographic indicators such as population, growth rates, sex ratio, literacy rates, and population changes over time.

## Data Selection and Basic Analysis

- Selected all data from `Data1` and `Data2` tables.
- Counted the total number of districts in both `Data1` and `Data2`.
- Retrieved data for the states "Andhra Pradesh" and "Karnataka" from `Data1` and `Data2`.
- Calculated the total population of India from `Data2`.
- Calculated the average growth rate for the entire country and for each state in `Data1`.

## Complex Demographic and Population Analysis

### Demographic and Literacy Analysis
- Calculated the average sex ratio (females per 1000 males) for each state in `Data1`.
- Identified states with an average literacy rate greater than 90% from `Data1`.
- Identified the top 3 states with the highest average growth rate and the bottom 3 states with the lowest average sex ratio from `Data1`.
- Combined the top 3 states with the highest literacy rates and the bottom 3 states with the lowest literacy rates from `Data1`.

### Temporary Table Creation and Advanced State Filtering
- Created temporary tables to store and retrieve states with top and bottom literacy rates for further analysis.
- Filtered and retrieved states whose names start with "A" and end with "H" from `Data1`.

### Gender and Literacy Analysis
- Calculated the number of males and females in each district and state, based on the sex ratio and district-level data from `Data1` and `Data2`.
- Calculated the total number of literates in each state using population and literacy rate from `Data1` and `Data2`.

### Population Dynamics Over Time
- Analyzed population changes over time by comparing present and past populations across states from `Data1` and `Data2`.
