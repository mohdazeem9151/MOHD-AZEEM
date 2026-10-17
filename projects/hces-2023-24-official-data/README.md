# HCES 2023–24: official consumption tables

This project organises selected tables from MoSPI’s HCES 2023–24 factsheet as downloadable CSVs. It keeps published figures separate from calculations made for comparison. Survey microdata is not included.

## Files and figures

- [State/UT MPCE](data/state_mpce_2023-24.csv) — rural and urban averages, with and without welfare-benefit imputation, plus a clearly labelled derived gap.
- [All-India item spending with imputation](data/all_india_item_mpce_2023-24.csv)
- [All-India item spending without welfare-benefit imputation](data/all_india_item_mpce_2023-24_without_imputation.csv)
- [Item-composition trends with imputation](data/mpce_composition_trend.csv)
- [Item-composition trends without imputation](data/mpce_composition_trend_without_imputation.csv)
- [All-India trends](data/all_india_trends.csv) — MPCE variants, published rural–urban gaps, Gini coefficients, food and cereal shares, and cereal quantities.
- [MPCE fractile classes](data/mpce_fractiles.csv)
- [Sample and estimated household counts](data/sample_households_by_state.csv)
- [Plotting script](analysis/plot_hces.py) · [State MPCE chart](figures/state_mpce.svg) · [Item spending chart](figures/item_composition.svg)

## Selected comparisons

For 2023–24, all-India MPCE was ₹4,122 in rural areas and ₹6,996 in urban areas without welfare-benefit imputation. With imputation, the figures were ₹4,247 and ₹7,078. In Uttar Pradesh, the with-imputation figures were ₹3,578 rural and ₹5,474 urban; in Rajasthan, they were ₹4,626 and ₹6,640.

The derived urban–rural gap is (urban MPCE − rural MPCE) / rural MPCE × 100, rounded to one decimal place. The all-India trend file separately transcribes the gap published by MoSPI.

## Definitions and limits

MPCE is monthly per-capita consumption expenditure; it is not income or total household expenditure. The “with imputation” series includes specified goods received free through welfare programmes. Both series retain standard survey imputations for items such as home-produced consumption, gifts, loans and free collection. The factsheet says free education and health services were not imputed.

Values are nominal, not adjusted for inflation. Gini coefficients are transcribed from the factsheet; they are not recalculated from household records. The published factsheet does not provide a Rae Bareli district estimate. The separate Rae Bareli analysis in this repository is exploratory and preliminary.

These files cover selected factsheet tables. They do not reproduce every table in NSS Report No. 592 or all datasets in the MoSPI catalogue.

## Reproduce the charts

From this folder, run python analysis/plot_hces.py with Python 3 and Matplotlib installed.

## Sources

- MoSPI, *Factsheet of Household Consumption Expenditure Survey 2023–24*, Statements 1–15 and sample-household table: [official PDF](https://mospi.gov.in/sites/default/files/publication_reports/HCES%20FactSheet%202023-24.pdf).
- MoSPI, *NSS Report No. 592: Survey on Household Consumption Expenditure, 2023–24*: [official report](https://mospi.gov.in/sites/default/files/publication_reports/Final_Report_HCES_2023-24L.pdf).
- [MoSPI eSankhyiki HCES catalogue](https://esankhyiki.mospi.gov.in/catalogue-main/catalogue?product=HCES).
