# PLFS 2025: exploratory labour analysis

This project contains early Stata work on weighted summaries for women aged 15–60 and Muslim youth aged 15–29.

## Status

The script and saved women’s summary have not been independently validated or reproduced from this repository. Activity-status codes, enterprise type, religion linkage, weights, population definitions and survey-design variance still need review. MoSPI introduced a redesigned PLFS series in 2025, so comparisons with earlier rounds require particular care.

- [Preliminary summary for women aged 15–60](results/preliminary/plfs_women_15_60_preliminary.csv)

The Muslim-youth results are not included while their population definition, religion linkage and totals are being reconciled. The published CSV contains aggregate estimates, not person-level records.

## Data and privacy

PLFS unit-level data is not included. Obtain data and documentation through the [MoSPI microdata portal](https://microdata.gov.in/NADA/index.php/home) and follow its access and use terms. Do not add restricted files to this repository.

## Run the Stata script

1. Install Stata 16 or later.
2. Obtain the permitted files chhv12025.dta and cperv12025.dta, and place them in the project’s local data folder.
3. Extract Data_in_STATA.zip first if needed, then run plfs2025_reproduce_in_stata.do from this project folder.

The script displays weighted summaries. It does not calculate standard errors or confidence intervals.

## Before using the results

Check file structure, codes, merge keys, weights, population definitions and classifications against the released documentation. Use a survey-design estimator for inference and record the data and software versions when reproducing the results.
