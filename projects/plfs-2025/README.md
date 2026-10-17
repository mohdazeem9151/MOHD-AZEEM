# PLFS 2025: exploratory labour analysis

This project contains an exploratory Stata script for weighted summaries of women aged 15–60 and Muslim youth aged 15–29.

## Status

This is an early working draft. The estimates have **not** been independently validated or run from this public repository. Activity-status codes, enterprise-type classification, religion linkage, survey weights, sample universes, and survey-design variance need review. Do not cite earlier generated tables as confirmed results. Annual PLFS 2025 estimates may require special care because survey methodology changed from January 2025.

## Data and privacy

No PLFS unit-level files or output tables are included. Obtain data and metadata through the [MoSPI microdata portal](https://microdata.gov.in/NADA/index.php/home) and follow its applicable access and use terms. Do not add restricted data to this repository.

## Running

1. Install Stata 16 or later.
2. Place the permitted household and person files, chhv12025.dta and cperv12025.dta, in a local data folder.
3. Run plfs2025_reproduce_in_stata.do from this project folder.

The script displays weighted summary estimates in Stata. It does not calculate standard errors or confidence intervals.

## Next steps

- Validate the file structure, codes, merge keys, multiplier and target populations against released documentation.
- Review classification choices and reconcile unknown enterprise categories.
- Use an appropriate survey-design estimator before making inferential claims.
- Reproduce the results and document data and software versions before publishing validated tables.
