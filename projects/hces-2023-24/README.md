# HCES 2023–24: exploratory consumption analysis

This project contains early Stata summaries of selected household consumption measures for India, Uttar Pradesh and Rae Bareli.

## Status

The script and saved tables have not been independently validated or reproduced from this repository. Survey weights, survey design, item definitions, questionnaire-specific universes and missing values still need review. Treat the estimates as working material, not as confirmed findings.

- [Fuel, education and food summary](results/preliminary/hces_fuel_education_food_preliminary.csv)
- [Selected electronics expenditure by area](results/preliminary/hces_electronics_by_area_preliminary.csv)

The electronics table includes Uttar Pradesh but has no Rae Bareli estimate. Its construction also needs to be documented and reproduced. Both files contain aggregate results, not household-level records.

## Data and privacy

Unit-level HCES files are not included. Obtain the data and documentation from [MoSPI](https://www.mospi.gov.in/about-us/hsd) and follow its access and use terms. Do not add restricted data to this repository.

## Run the available script

1. Install Stata 16 or later.
2. Place the required HCES 2023–24 Level 08, 09, 14 and 15 .dta files in a local data folder.
3. Create a local outputs folder.
4. From this project folder, run hces_fuel_education_food.do.

The script writes intermediate extracts, a summary table and charts to the local outputs folder. Local data and output files are excluded from Git.

## Before using the results

Check item codes, aggregation, questionnaire universes, weights and missing-value handling against the HCES documentation. Account for the survey design and uncertainty, then reproduce the tables and record the data and software versions.

For published State/UT MPCE, national item-group tables, trends, fractiles and sample counts, see the [official-source HCES tables project](../hces-2023-24-official-data/README.md). The district-level Rae Bareli analysis is separate from MoSPI’s published factsheet estimates.
