***************************************************************
* Exploratory PLFS 2025 analysis; estimates are not independently validated.
* First extract Data_in_STATA.zip. Then change the cd path below
* if your extracted Data_in_STATA folder is somewhere else.
***************************************************************

clear all
set more off
cd "data"

* 1. Prepare the household file. Its month field is numeric;
*    make it a two-character string to match the person file.
tempfile hhfile
use "chhv12025.dta", clear
gen str2 month_merge = string(month, "%02.0f")
drop file_id month
save `hhfile'

* 2. Load person records and merge household-level religion onto each person.
use "cperv12025.dta", clear
gen str2 month_merge = month
drop file_id month

local hhkeys sch qtr month_merge visit sec st dc nss_reg bstrm strm grp sstrm sro mfsu sss ssu
merge m:1 `hhkeys' using `hhfile'
tabulate _merge
assert _merge == 3
drop _merge

* 3. Define usual status (principal + subsidiary), and sector by the
*    enterprise type of principal work, or subsidiary work if no principal work.
gen byte worked_ps = inlist(pas, "11", "12", "21", "31", "41", "51")
gen byte worked_ss = inlist(sas, "11", "12", "21", "31", "41", "51")
gen byte employed = worked_ps | worked_ss
gen byte unemployed = (pas == "81" & !employed)

gen str2 work_etyp = ""
replace work_etyp = etyp_pas if worked_ps
replace work_etyp = etyp_sas if !worked_ps & worked_ss

* Codes 05-08 and 10-11: formal-sector enterprise.
* Codes 01-04 and 12: informal-sector enterprise.
* Code 19 or blank: employed, but enterprise sector not classifiable.
gen byte formal = employed & inlist(work_etyp, "05", "06", "07", "08", "10", "11")
gen byte informal = employed & inlist(work_etyp, "01", "02", "03", "04", "12")
gen byte sector_unknown = employed & (work_etyp == "19" | work_etyp == "")

* PLFS multiplier is stored in units of 1/100 of a person weight.
gen double wt = mult / 100

* 4. Weighted counts for all women aged 15-60.
gen double f_total_w = wt * (sex == "2" & inrange(age, 15, 60))
gen double f_emp_w = wt * (sex == "2" & inrange(age, 15, 60) & employed)
gen double f_unemp_w = wt * (sex == "2" & inrange(age, 15, 60) & unemployed)
gen double f_formal_w = wt * (sex == "2" & inrange(age, 15, 60) & formal)
gen double f_informal_w = wt * (sex == "2" & inrange(age, 15, 60) & informal)
gen double f_unknown_w = wt * (sex == "2" & inrange(age, 15, 60) & sector_unknown)

* 5. Weighted counts for Muslim youth aged 15-29 (religion belongs to household).
gen byte muslim_youth = (relg == "2" & inrange(age, 15, 29))
gen double my_unemp_w = wt * (muslim_youth & unemployed)
gen double my_formal_w = wt * (muslim_youth & formal)
gen double my_informal_w = wt * (muslim_youth & informal)
gen double my_unknown_w = wt * (muslim_youth & sector_unknown)

* 6. Collapse weighted contributions to one summary row and display results.
preserve
collapse (sum) total_women=f_total_w women_employed=f_emp_w women_unemployed=f_unemp_w ///
    women_formal=f_formal_w women_informal=f_informal_w women_sector_unknown=f_unknown_w ///
    muslim_youth_unemployed=my_unemp_w muslim_youth_formal=my_formal_w ///
    muslim_youth_informal=my_informal_w muslim_youth_sector_unknown=my_unknown_w

gen total_women_crore = total_women / 10000000
gen women_employed_crore = women_employed / 10000000
gen women_unemployed_crore = women_unemployed / 10000000
gen women_formal_crore = women_formal / 10000000
gen women_informal_crore = women_informal / 10000000
gen women_sector_unknown_crore = women_sector_unknown / 10000000
gen women_employed_pct = 100 * women_employed / total_women
gen women_unemployed_pct = 100 * women_unemployed / total_women
gen women_formal_pct = 100 * women_formal / total_women
gen women_informal_pct = 100 * women_informal / total_women
gen women_sector_unknown_pct = 100 * women_sector_unknown / total_women

display ""
display "WOMEN AGED 15-60: weighted population and status estimates"
format total_women_crore women_employed_crore women_unemployed_crore ///
    women_formal_crore women_informal_crore women_sector_unknown_crore %9.4f
format women_employed_pct women_unemployed_pct women_formal_pct ///
    women_informal_pct women_sector_unknown_pct %6.2f
list total_women_crore women_employed_crore women_unemployed_crore ///
    women_formal_crore women_informal_crore women_sector_unknown_crore, noobs abbreviate(24)
list women_employed_pct women_unemployed_pct women_formal_pct ///
    women_informal_pct women_sector_unknown_pct, noobs abbreviate(24)

display ""
display "MUSLIM YOUTH AGED 15-29: weighted estimates in people"
format muslim_youth_unemployed muslim_youth_formal muslim_youth_informal ///
    muslim_youth_sector_unknown %15.0fc
list muslim_youth_unemployed muslim_youth_formal muslim_youth_informal ///
    muslim_youth_sector_unknown, noobs abbreviate(24)
restore

***************************************************************
* Interpretation notes:
* - Female = sex code 2; Muslim = household religion code 2.
* - Employed = usual principal or subsidiary activity status 11-51.
* - Unemployed = principal status 81 and no subsidiary employment.
* - Informal enterprise codes are 01-04 and 12; formal are 05-08, 10-11.
* - Enterprise type 19/blank is reported separately as unclassified.
* - Formal/informal rows are parts of employed; do not add them to employment.
***************************************************************
