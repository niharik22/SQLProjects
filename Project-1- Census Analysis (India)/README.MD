# Census Project SQL Queries

Brief description of the SQL queries used in the Census Project.

## Data Selection

### Data1 and Data2 Selection

- Selected all data from the `Data1` table.
- Selected all data from the `Data2` table.

## Districts Information

### Number of Districts

- Counted the total number of districts in `Data1` and `Data2` separately.

## State-wise Data

### Data for Andhra Pradesh and Karnataka

- Retrieved data for the states "Andhra Pradesh" and "Karnataka" from `Data1` and `Data2` tables.

## Population Analysis

### Total Population of India

- Calculated the total population of India from `Data2`.

### Average Growth

- Calculated the average growth rate for the entire country from `Data1`.

### Average Growth by State

- Calculated the average growth rate for each state in `Data1`.

## Demographic Analysis

### Average Sex Ratio by State

- Calculated the average sex ratio (females per 1000 males) for each state in `Data1`.

### States with High Literacy Rates

- Identified states with an average literacy rate greater than 90% in `Data1`.

## Top and Bottom States

### Top 3 States with Average Growth

- Identified the top 3 states with the highest average growth rate in `Data1`.

### Bottom 3 States with Lowest Sex Ratio

- Identified the bottom 3 states with the lowest average sex ratio in `Data1`.

### States with Top 3 and Bottom 3 Literacy Rates

- Combined the top 3 states with the highest average literacy rates and the bottom 3 states with the lowest average literacy rates from `Data1`.

## Temporary Tables

### Creating Temporary Tables

- Created temporary tables to store states with top and bottom literacy rates in `Data1`.

### Retrieving Data from Temporary Tables

- Retrieved data from the temporary tables for further analysis.

## State Filtering

### States Starting with "A" and Ending with "H"

- Filtered and retrieved states whose names start with "A" and end with "H" from `Data1`.

## Gender Analysis

### Male and Female Population by District

- Calculated the number of males and females in each district, considering the sex ratio, in `Data1` and `Data2`.

### Male and Female Population by State

- Calculated the total male and female population in each state, considering the district-level data from `Data1` and `Data2`.

## Literacy Analysis

### Total Literates by State

- Calculated the total number of literates in each state based on the population and literacy rate from `Data1` and `Data2`.

## Population Changes

### Population Changes Over Time

- Calculated the population changes over time by comparing present and past populations in each state from `Data1` and `Data2`.

## Density Analysis

### Change in Population Density

- Calculated the change in the number of persons per unit area (per square kilometer) over time for each state.
