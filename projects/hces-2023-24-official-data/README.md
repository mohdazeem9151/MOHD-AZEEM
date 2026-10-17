# HCES 2023–24: official consumption tables and derived comparisons

This project organizes selected basic indicators published by India’s Ministry of Statistics and Programme Implementation (MoSPI) in the HCES 2023–24 factsheet. It combines official values with clearly labelled calculations that can be reproduced from the included CSVs.

## Included datasets

- `state_mpce_2023-24.csv`: state/UT rural and urban average monthly per-capita consumption expenditure (MPCE), with and without imputation of free items; includes a derived rural–urban gap percentage.
- `all_india_item_mpce_2023-24.csv`: all-India rural/urban spending and shares by item group.
- `mpce_composition_trend.csv`: rural/urban percentage composition by item group for 2011–12, 2022–23 and 2023–24.
- `all_india_trends.csv`: average MPCE, Gini coefficients, food/cereal shares and monthly cereal quantities.
- `mpce_fractiles.csv`: average MPCE across 12 fractile classes by sector for 2022–23 and 2023–24.
- `sample_households_by_state.csv`: state/UT sample household counts and estimated household counts from the factsheet.
- `analysis/plot_hces.py`: chart-generation code.
- `figures/state_mpce.svg`, `figures/item_composition.svg`: summary graphs.

## Selected findings

With imputed free items, all-India MPCE in 2023–24 was ₹4,247 in rural areas and ₹7,078 in urban areas. Without imputation, the figures were ₹4,122 and ₹6,996. The derived urban–rural gap is approximately 66.7% with imputation and 69.7% without it. In Uttar Pradesh, imputed MPCE was ₹3,578 rural and ₹5,474 urban; Rajasthan was ₹4,626 and ₹6,640.

The official factsheet reports Gini coefficients of 0.237 (rural) and 0.284 (urban) in 2023–24, compared with 0.266 and 0.314 in 2022–23. These are published estimates; this repository does not reproduce the underlying microdata analysis.

## Methods, interpretation and limits

- MPCE is monthly per-capita consumption expenditure, not income or household total expenditure.
- “With imputation” includes assigned values for certain free goods/services and other consumption items; “without imputation” excludes those assigned values. Do not compare the two variants as if they were identical definitions.
- Derived urban–rural gap is calculated as `(urban MPCE - rural MPCE) / rural MPCE × 100`, rounded to one decimal place. Official source tables may round the gap to whole percentages.
- The broad trend figures are nominal rupees. They are not inflation-adjusted and should not be read as real growth.
- HCES factsheet state/UT estimates do not provide a Rae Bareli district estimate. The separate preliminary Rae Bareli table in this portfolio comes from an exploratory analysis and is not an official district-level fact-sheet statistic.
- These CSVs are selected tables from the factsheet, not every detailed table in NSS Report 592. The cited official report and factsheet remain the authoritative sources.

To recreate charts, install Python 3 and Matplotlib, then run `python analysis/plot_hces.py` from this project folder.

## Sources

1. MoSPI, *Factsheet of Household Consumption Expenditure Survey 2023–24*, Statements 7, 8, 9, 10–15 and sample-household table: [official PDF](https://mospi.gov.in/sites/default/files/publication_reports/HCES%20FactSheet%202023-24.pdf).
2. MoSPI, *NSS Report No. 592: Survey on Household Consumption Expenditure, 2023–24*: [official report PDF](https://mospi.gov.in/sites/default/files/publication_reports/Final_Report_HCES_2023-24L.pdf).
3. Official HCES data catalogue: [MoSPI eSankhyiki catalogue](https://esankhyiki.mospi.gov.in/catalogue-main/catalogue?product=HCES).

No household/person-level records or restricted microdata are included.
