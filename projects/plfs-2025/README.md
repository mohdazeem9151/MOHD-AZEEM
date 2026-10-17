# PLFS 2025: exploratory labour analysis

This project contains exploratory Stata work on weighted summaries of women aged 15–60 and Muslim youth aged 15–29.

## Status and results

The script and saved tables are early working materials. They have **not** been independently validated or reproduced from this public repository. Activity-status codes, enterprise-type classification, religion linkage, survey weights, sample universes, and survey-design variance need review. Annual PLFS 2025 estimates may require special care because survey methodology changed from January 2025.

One preliminary aggregate table is included for review:

- [Women aged 15–60 summary](results/preliminary/plfs_women_15_60_preliminary.csv)

The table contains population-level aggregates, not person-level records. The Muslim-youth table is withheld pending reconciliation of its population definition, religion linkage, and totals.

## Data and privacy

No PLFS unit-level files are included. Obtain data and metadata through the [MoSPI microdata portal](https://microdata.gov.in/NADA/index.php/home) and follow applicable access and use terms. Do not add restricted data to this repository.

## Running

1. Install Stata 16 or later.
2. Place the permitted household and person files, chhv12025.dta and cperv12025.dta, in a local data folder.
3. Run plfs2025_reproduce_in_stata.do from this project folder.

The script displays weighted summary estimates in Stata. It does not calculate standard errors or confidence intervals.

## Next steps

- Validate the file structure, codes, merge keys, multiplier, and target populations against released documentation.
- Review classification choices and reconcile unknown enterprise categories.
- Use an appropriate survey-design estimator before making inferential claims.
- Reproduce the results and document data and software versions before relying on or expanding the preliminary table.
