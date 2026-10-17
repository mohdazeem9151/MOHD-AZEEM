# HCES 2023–24: official consumption tables and derived comparisons

This project organizes the core tables in MoSPI’s HCES 2023–24 factsheet. Official values are separate from calculations made here. No microdata is redistributed.

## Data files

- [State/UT MPCE](data/state_mpce_2023-24.csv): rural/urban means, with and without welfare-benefit imputation, and derived urban–rural gaps.
- [All-India item spending, without welfare-benefit imputation](data/all_india_item_mpce_2023-24_without_imputation.csv).
- [All-India item spending, with welfare-benefit imputation](data/all_india_item_mpce_2023-24.csv).
- [Item composition trends, without welfare-benefit imputation](data/mpce_composition_trend_without_imputation.csv).
- [Item composition trends, with welfare-benefit imputation](data/mpce_composition_trend.csv).
- [All-India trends](data/all_india_trends.csv): both MPCE variants, official rural–urban gaps, Gini coefficients, food/cereal shares and cereal quantities.
- [MPCE fractile classes](data/mpce_fractiles.csv): 12 population groups by sector and year.
- [Sample and estimated household counts](data/sample_households_by_state.csv).
- [Plotting code](analysis/plot_hces.py), [state MPCE chart](figures/state_mpce.svg), and [item spending chart](figures/item_composition.svg).

## Selected comparisons

In 2023–24, all-India MPCE without welfare-benefit imputation was ₹4,122 rural and ₹6,996 urban; with imputation it was ₹4,247 and ₹7,078. In Uttar Pradesh, the corresponding with-imputation means were ₹3,578 rural and ₹5,474 urban; Rajasthan was ₹4,626 and ₹6,640.

The derived urban–rural gap formula is `(urban MPCE − rural MPCE) / rural MPCE × 100`. It is labelled as derived in the state table and rounded to one decimal place. The all-India trend file also transcribes MoSPI’s separately published gap, rounded as in its source table.

## Definitions and cautions

- MPCE is monthly per-capita consumption expenditure, not income or total household expenditure.
- “Without imputation” here means without the extra imputed values for specified goods received free through welfare programmes. Both variants retain the survey’s standard field imputation for home-produced consumption, gifts, loans, free collection and similar items. “With imputation” adds the specified welfare-programme goods. The factsheet says free education and health services were not imputed.
- The historical rupee series is nominal, not inflation-adjusted.
- Gini coefficients are transcribed as published from the factsheet’s first section; they are not recalculated from household records.
- State/UT factsheet tables do not provide a Rae Bareli district estimate. The separate Rae Bareli table in this portfolio is an exploratory district-level reanalysis and remains preliminary.
- The CSVs cover the core factsheet tables and figures, not every detailed table in NSS Report No. 592 or all 79+ HCES catalogue datasets.

Run `python analysis/plot_hces.py` from this folder (requires Python 3 and Matplotlib) to recreate the two SVG charts.

## Sources

- MoSPI, *Factsheet of Household Consumption Expenditure Survey 2023–24*, Statements 1–15 and sample-household table: [official PDF](https://mospi.gov.in/sites/default/files/publication_reports/HCES%20FactSheet%202023-24.pdf).
- MoSPI, *NSS Report No. 592: Survey on Household Consumption Expenditure, 2023–24*: [official report PDF](https://mospi.gov.in/sites/default/files/publication_reports/Final_Report_HCES_2023-24L.pdf).
- [MoSPI eSankhyiki HCES catalogue](https://esankhyiki.mospi.gov.in/catalogue-main/catalogue?product=HCES).

All source values are nominal, rounded as published and linked to the official reports for definitions, sampling design and full context.
