# HCES 2023–24: exploratory household consumption analysis

This project contains exploratory Stata work on selected household consumption measures, comparing India, Uttar Pradesh, and Rae Bareli.

## Status and results

The script and saved tables are early working materials. They have **not** been independently validated or reproduced from this public repository. Treatment of missing item records, survey weights, questionnaire-specific universes, item definitions, and survey design needs review. Do not cite the estimates as confirmed findings.

Preliminary aggregate tables are included for review:

- [Fuel, education, and food summary](results/preliminary/hces_fuel_education_food_preliminary.csv)
- [Electronics expenditure by area](results/preliminary/hces_electronics_by_area_preliminary.csv)

The second table compares selected areas and includes Uttar Pradesh; it does not contain a Rae Bareli estimate. These tables contain aggregates, not household-level records.

## Data and privacy

Unit-level HCES files are not included. Obtain data and documentation from the [Ministry of Statistics and Programme Implementation (MoSPI)](https://www.mospi.gov.in/about-us/hsd) and follow applicable access and use terms. Do not add restricted data to this repository.

## Running the available script

1. Install Stata 16 or later.
2. Place the required HCES 2023–24 Level 08, 09, 14 and 15 .dta files in a local data folder.
3. Create a local outputs folder.
4. Run hces_fuel_education_food.do from this project folder.

The data and output folders are intentionally not tracked in Git. This script creates intermediate extracts, a summary table, and charts.

The electronics table has no matching analysis script in the Codex files located so far; its construction needs to be documented and reproduced before relying on it.

## Next steps

- Verify item codes, aggregation, questionnaire universes, weights, and missing-value handling against HCES documentation.
- Account for the survey design and calculate uncertainty where appropriate.
- Reproduce both tables from permitted source data and record software and data versions.
- Replace the preliminary labels only after validation.
