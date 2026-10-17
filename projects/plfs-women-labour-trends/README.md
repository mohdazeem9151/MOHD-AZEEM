# Women’s labour force trends in India

A descriptive analysis of PLFS usual-status rates for women aged 15+, from 2017–18 to 2023–24. The figures compare rural, urban and combined estimates across seven annual rounds.

## What the published rates show

Between 2017–18 and 2023–24, the all-India female LFPR rose from **23.3% to 41.7%**, and the WPR from **22.0% to 40.3%**. The unemployment rate moved from **5.6% to 3.2%**. These are changes in published rates; they do not explain why the rates changed or show whether work was paid, secure or better quality.

## Data and charts

- [Download the dataset](data/female_labour_indicators_2017-18_to_2023-24.csv)
- [Recreate the charts](analysis/plot_indicators.py) with Python 3 and Matplotlib
- [LFPR chart](figures/female_lfpr.svg) · [WPR chart](figures/female_wpr.svg) · [Unemployment chart](figures/female_ur.svg)

![Women’s LFPR by area](figures/female_lfpr.svg)
![Women’s WPR by area](figures/female_wpr.svg)
![Women’s unemployment rate by area](figures/female_ur.svg)

The rates are percentages for women aged 15+. LFPR is the labour force as a share of the population; WPR is employed people as a share of the population; UR is unemployed people as a share of the labour force. All use usual status (principal plus subsidiary status). The combined estimate is published by MoSPI and is not an average of rural and urban rates. Values are rounded to one decimal place.

## Sources and limitations

- MoSPI, *Sarvekshana*, Issue 117 (February 2025), Tables 1–3: [official PDF](https://mospi.gov.in/sites/default/files/publication_reports/Sarvekshna_117th_24022025.pdf).
- MoSPI, *Annual Report, PLFS, July 2023–June 2024*: [official PDF](https://mospi.gov.in/sites/default/files/publication_reports/AnnualReport_PLFS2023-24L2.pdf).
- For definitions, survey design and access terms, see the [MoSPI microdata portal](https://microdata.gov.in/NADA/index.php/home).

Rates do not describe job type, hours, earnings, informality, unpaid family work or employment security. MoSPI introduced a redesigned PLFS series in 2025; this project ends in 2023–24 and does not combine the two series. No microdata or person-level records are included.
