# HCES 2023–24: exploratory household consumption analysis

This project contains an exploratory Stata script for selected household consumption measures, comparing India, Uttar Pradesh, and Rae Bareli.

## Status

The script is an early working draft. Its calculations and outputs have **not** been independently validated or run from this public repository. Treatment of missing item records, survey weights, questionnaire-specific universes, item definitions, and survey design needs review. Do not cite earlier generated tables or charts as confirmed results.

## Data and privacy

The unit-level HCES files are not included. Obtain data and documentation from the [Ministry of Statistics and Programme Implementation (MoSPI)](https://www.mospi.gov.in/about-us/hsd) and follow applicable access and use terms. Do not add restricted data to this repository.

## Running

1. Install Stata 16 or later.
2. Place the required HCES 2023–24 Level 08, 09, 14 and 15 .dta files in a local data folder.
3. Create a local outputs folder.
4. Run hces_fuel_education_food.do from this project folder.

The data and output folders are intentionally not tracked in Git. The code produces intermediate extracts, a summary table, and charts.

## Next steps

- Verify item codes, aggregation, questionnaire universes, weights, and missing-value handling against the HCES documentation.
- Account for the survey design and calculate uncertainty where appropriate.
- Reproduce the results from permitted source data and record software and data versions.
- Only then publish validated aggregate outputs with clear definitions.
