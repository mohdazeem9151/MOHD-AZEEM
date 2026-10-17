version 16.0
clear all
set more off

* Exploratory HCES 2023-24 analysis; not yet independently validated.
global hces "data"
global out  "outputs"
local key FSU_Serial_No Sector State NSS_Region District Stratum Sub_stratum Panel Sub_sample FOD_Sub_Region Sample_SU_No Sample_Sub_Division_No Second_Stage_Stratum_No Sample_Household_No

tempfile roster_cs roster_fd fuel education food results

* Questionnaire-specific household rosters from Level 15.
use "$hces\LEVEL - 15 (Section 1_1, A2,B2  C2).dta", clear
keep if inlist(SECTION,"A2","B2")
keep `key' SECTION MULTIPLIER
isid `key' SECTION
preserve
    keep if SECTION=="B2"
    drop SECTION
    isid `key'
    save `roster_cs'
restore
keep if SECTION=="A2"
drop SECTION
isid `key'
save `roster_fd'

* Fuel and light subtotal (code 349; last 30 days).
use "$hces\LEVEL - 08 (Section 8_1).dta", clear
keep if Item_Code_8_1=="349"
keep `key' Total_consumption_value_rs
rename Total_consumption_value_rs fuel_30d
isid `key'
save "$out\fuel_extract.dta", replace
save `fuel'

* Education subtotal (code 409; last 365 days).
use "$hces\LEVEL - 09 (Section 9  10  11).dta", clear
keep if Item_Code_9_1_to_11_4=="409"
keep `key' Value_Rs_9_1_to_11_4
rename Value_Rs_9_1_to_11_4 education_365d
isid `key'
save "$out\education_extract.dta", replace
save `education'

* Food summary rows: Section 5 uses 30 days; Sections 6-7 use 7 days.
use "$hces\LEVEL - 14 (Section  A1,B1  C1).dta", clear
keep if inlist(substr(SECTION,1,1),"5","6","7")
keep `key' SECTION ITEM_CODE VALUE_RS
gen double food_monthly = VALUE_RS
replace food_monthly = VALUE_RS*30/7 if inlist(substr(SECTION,1,1),"6","7")
save "$out\food_extract.dta", replace
collapse (sum) food_monthly, by(`key')
isid `key'
save `food'

* Calculate estimates using each questionnaire's own roster.
tempname ph
postfile `ph' str28 measure str20 area double mean_rs long households using `results', replace

use `roster_cs', clear
merge 1:1 `key' using `fuel', keep(master match) nogen
replace fuel_30d=0 if missing(fuel_30d)
foreach a in India Uttar_Pradesh Rae_Bareli {
    if "`a'"=="India" {
        quietly mean fuel_30d [pweight=MULTIPLIER]
    }
    if "`a'"=="Uttar_Pradesh" {
        quietly mean fuel_30d [pweight=MULTIPLIER] if State=="09"
    }
    if "`a'"=="Rae_Bareli" {
        quietly mean fuel_30d [pweight=MULTIPLIER] if State=="09" & District=="27"
    }
    local n=e(N)
    post `ph' ("Fuel_light_30d") ("`a'") (_b[fuel_30d]) (`n')
    scalar fuel_`a'=_b[fuel_30d]
}

use `roster_cs', clear
merge 1:1 `key' using `education', keep(master match) nogen
replace education_365d=0 if missing(education_365d)
foreach a in India Uttar_Pradesh Rae_Bareli {
    if "`a'"=="India" {
        quietly mean education_365d [pweight=MULTIPLIER]
    }
    if "`a'"=="Uttar_Pradesh" {
        quietly mean education_365d [pweight=MULTIPLIER] if State=="09"
    }
    if "`a'"=="Rae_Bareli" {
        quietly mean education_365d [pweight=MULTIPLIER] if State=="09" & District=="27"
    }
    local n=e(N)
    post `ph' ("Education_365d") ("`a'") (_b[education_365d]) (`n')
    scalar education_`a'=_b[education_365d]
}

use `roster_fd', clear
merge 1:1 `key' using `food', keep(master match) nogen
replace food_monthly=0 if missing(food_monthly)
foreach a in India Uttar_Pradesh Rae_Bareli {
    if "`a'"=="India" {
        quietly mean food_monthly [pweight=MULTIPLIER]
    }
    if "`a'"=="Uttar_Pradesh" {
        quietly mean food_monthly [pweight=MULTIPLIER] if State=="09"
    }
    if "`a'"=="Rae_Bareli" {
        quietly mean food_monthly [pweight=MULTIPLIER] if State=="09" & District=="27"
    }
    local n=e(N)
    post `ph' ("Food_monthly_MMRP") ("`a'") (_b[food_monthly]) (`n')
    scalar food_`a'=_b[food_monthly]
}
postclose `ph'

use `results', clear
label variable mean_rs "Weighted mean Rs per household"
list, noobs separator(3)
export delimited using "$out\HCES_2023_24_fuel_education_food_results.csv", replace

* Fuel and light chart.
preserve
    clear
    input str20 area double spending
    "India" .
    "Uttar Pradesh" .
    "Rae Bareli" .
    end
    replace spending=scalar(fuel_India) in 1
    replace spending=scalar(fuel_Uttar_Pradesh) in 2
    replace spending=scalar(fuel_Rae_Bareli) in 3
    graph bar spending, over(area) blabel(bar,format(%9.0f)) ytitle("Rupees per household") title("Fuel and light: last 30 days")
    graph export "$out\fuel_light_comparison_stata.png", replace
restore

* Education chart.
preserve
    clear
    input str20 area double spending
    "India" .
    "Uttar Pradesh" .
    "Rae Bareli" .
    end
    replace spending=scalar(education_India) in 1
    replace spending=scalar(education_Uttar_Pradesh) in 2
    replace spending=scalar(education_Rae_Bareli) in 3
    graph bar spending, over(area) blabel(bar,format(%9.0f)) ytitle("Rupees per household") title("Education: last 365 days")
    graph export "$out\education_comparison_stata.png", replace
restore

* Food chart.
preserve
    clear
    input str20 area double spending
    "India" .
    "Uttar Pradesh" .
    "Rae Bareli" .
    end
    replace spending=scalar(food_India) in 1
    replace spending=scalar(food_Uttar_Pradesh) in 2
    replace spending=scalar(food_Rae_Bareli) in 3
    graph bar spending, over(area) blabel(bar,format(%9.0f)) ytitle("Rupees per household") title("Food: monthly MMRP equivalent")
    graph export "$out\food_comparison_stata.png", replace
restore
